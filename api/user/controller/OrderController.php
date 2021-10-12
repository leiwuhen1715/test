<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\user\controller;

use cmf\controller\RestUserBaseController;
use api\user\service\OrderService;
use api\goods\model\GoodsModel as Goods;
use cmf\controller\RestBaseController;
use EasyWeChat\Factory;
use think\Db;
use think\Validate;

class OrderController extends RestUserBaseController
{

    //订单列表
    public function order(){

        $param = $this->request->param();
        $userId   = $this->getUserId();
        $OrderService = new OrderService;
        $data = $OrderService->getList($param,$userId);

        $data_list=$OrderService->Handle($data->items());

        $this->success('获取成功!', $data_list);

    }

    //订单详情
    public function orderDetail(){

        $id = $this->request->get('id', 0, 'intval');

        $userId   = $this->getUserId();
        $OrderService = new OrderService;
        $data = $OrderService->orderInfo($id,$userId);

        if($data){

            $result=[
                'order_info'=> $data
            ];
            $this->success('ok', $result);
        }else{
            $this->error('非法操作！');
        }

    }
    
    /**
     * 删除订单
     */
    public function delete(){

        $id = $this->request->param('id',0,'intval');

        $userId   = $this->getUserId();
        $OrderService = new OrderService;
        $data = $OrderService->orderInfo($id,$userId);
   
        if($data['order_status'] == 4){
            Db::name('order_sub')->where('order_id',$id)->delete();
            Db::name('order_log')->where('order_id',$id)->delete();
            Db::name('order')->where('order_id',$id)->delete();

            $this->success('删除成功！');
        }else{
            $this->error('订单不能删除');
        }

    }
    public function getOpen(){
        $userId    = $this->getUserId();
        $data = Db::name('third_party_user')->field('openid')->where('user_id',$userId)->find();
        $this->success("ok",$data);
    }
    


    public function getCoupon(){
        $order_id = $this->request->param('id',0,'intval');
        $userId   = $this->getUserId();
        $where = ['order_id'=>$order_id,'user_id'=>$userId];
        $order = Db::name('order')->field('is_coupon,pay_status')->where($where)->find();
        $amount = rand(1,20);
        if($order['pay_status'] == 1 && $order['is_coupon'] == 0 ){
            $start_time = time();
            $end_time   = $start_time + 24*3600*3;
            $data = [
                'add_time'   => time(),
                'user_id'    => $userId,
                'start_time' => $start_time,
                'end_time'   => $end_time,
                'amount'     => $amount/10
            ];
            Db::name('coupon')->insert($data);
            Db::name('order')->where($where)->update(['is_coupon'=>1]);
            $this->success('ok',$data);
        }else{
            $this->error('不存在');
        }
    }


    //确认收货
    public function invalid(){
        $id = $this->request->post('id', 0, 'intval');
        $order = DB::name('order');
        $userId   = $this->getUserId();
        $where = [
            'user_id' =>  $userId,
            'order_id'=>$id
        ];
        $order_info=$order->where($where)->find();
        if($order_info){
            if($order_info['shipping_status']==1){

                if($order_info['shipping_status']==1){
                    $data=['shipping_status'=>2];
                    $order->where($where)->update($data);
                    logOrder($id,'确认收货','receive',$userId);
                    $this->success('收货成功');
                }elseif($order_info['shipping_status']==0){
                    $this->error('订单未配送！');
                }


            }elseif($order_info['shipping_status']==2){
                $this->error('订单已收货！');
            }else{
                $this->error('订单未配送！');
            }
        }else{
            $this->error('非法操作！');
        }

    }
    /**
     * 取消订单
     */
    public function cancel(){

        $id = $this->request->param('id',0,'intval');

        $userId   = $this->getUserId();
        $OrderService = new OrderService;
        $data = $OrderService->orderInfo($id,$userId);
        if($data['status_id'] == 1){
            Db::name('order')->where('order_id',$id)->update(['order_status'=>4]);

            $this->success('取消成功！');
        }else{
            $this->error('订单不能取消');
        }

    }

    /**
     * 申请退款
     */
    public function refund(){
        $action_note = $this->request->param('action_note');
        $id = $this->request->param('id',0,'intval');
        $photo = $this->request->param('photo');
        // if(empty($photo)){
        //     $this->error('请上传退款凭证！');
        // }
        if(empty($action_note)){
            $this->error('请填写退款说明！');
        }
        $userId   = $this->getUserId();
        $OrderService = new OrderService;
        $data = $OrderService->orderInfo($id,$userId);

        if($data['is_tui'] == 1){
            
            if($data['shipping_status'] == 1){
                if(empty($photo))$this->error('请上传退款凭证！');
            }
            $refund_fee = $data['order_amount'] - $data['shipping_price'];
            $data = [
                'order_sn'  => $data['order_sn'],
                'parent_sn' => $data['parent_sn'],
                'order_id'  => $id,
                'user_id'   => $userId,
                'order_amount' => $data['order_amount'],
                'shipping_fee' => $data['shipping_price'],
                'refund_fee' => $refund_fee,
                'add_time'  => time(),
                'photo'     => $photo,
                'mobile'    => $data['mobile'],
                'consignee' => $data['consignee'],
                'supplier_id' => $data['supplier_id'],
                'status'    => 0,
                'user_note' => $action_note
            ];
            Db::name('delivery_order')->insert($data);
            Db::name('order')->where('order_id',$id)->update(['order_status'=>3]);
            logOrder($id,'申请退款','refund',$userId);
            
            
            $this->success('提交成功！');
        }else{
            $this->error('订单不能退款');
        }
    }
    /**
     * 退款详情
     */
    public function refundOrder(){
        $id = $this->request->param('id',0,'intval');
        $userId   = $this->getUserId();
        $delivery_order =Db::name('delivery_order')->where('user_id',$userId)->where('order_id',$id)->find();

        if($delivery_order){
            $delivery_order['photo'] = $delivery_order['photo1'] = explode(',', $delivery_order['photo']);
            foreach ($delivery_order['photo1'] as $key => $value) {
                $delivery_order['photo1'][$key] = cmf_get_image_url($value);
            }
            if($delivery_order['status'] == 1){
                $delivery_order['refun_status'] = '退款成功！';
            }elseif($delivery_order['status'] == 2){
                $delivery_order['refun_status'] = '已驳回！';
            }else{
                $delivery_order['refun_status'] = '待处理';
            }
            $this->success('ok',$delivery_order);
        }
    }

}
