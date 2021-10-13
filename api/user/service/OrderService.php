<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace api\user\service;

use api\goods\model\GoodsModel as Goods;
use api\user\model\OrderSubModel;
use api\user\model\OrderModel;
use api\goods\logic\OrderLogic;
use think\db\Query;
use think\Db;

class OrderService
{

    /**
     * 订单查询
     * @param      $filter
     * @param bool $isPage
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getList($filter, $userId = false)
    {



        $field = 'o.*';
        $where=[
            // 'o.order_status' => 1
        ];
        if($userId){
            $where[] = ['o.user_id','=',$userId];
        }
        $whereor = '';
        $filter['type']= empty($filter['type'])?0:$filter['type'];
        if($filter['type'] == 1){
            $where[] = ['o.pay_status','=',0];
            $where[] = ['o.order_status','in',[0,1]];
        }elseif($filter['type'] == 2){

            $where[] = ['o.order_status','=',1];
            $where[] = ['o.pay_status','=',1];
            $where[] = ['o.shipping_status','=',0];
        }elseif($filter['type'] == 3){

            $where[] = ['o.order_status','=',1];
            $where[] = ['o.pay_status','=',1];
            $where[] = ['o.shipping_status','=',1];

        }elseif($filter['type'] == 4){

            $where[] = ['o.order_status','=',1];
            $where[] = ['o.pay_status','=',1];
            $where[] = ['o.shipping_status','=',2];
            $where[] = ['o.is_comment','=',0];

        }elseif($filter['type'] == 5){
            $where[] = ['o.pay_status','=',1];
            $whereor = "o.order_status = 3 or o.refun_status in (1,2)";

        }else{
            // $where['o.order_status'] = ['<>',4];
        }

        $model = new OrderModel();
        $data  = $model->alias('o')->field($field)->where($where)->where($whereor)->order('o.order_id', 'DESC')->paginate(10);

        return $data;

    }

    /**
     * 用户订单状态
     */
    public function Handle($data){

        $ordersub   =   new OrderSubModel();
        $result = [];
        foreach ($data as $key => $value) {
            $value = $this->Hand($value);
            $value['sub']        =   $ordersub->where('order_id',$value['order_id'])->select();


        }
        return $data;
    }


    public function Hand($data){


        $data['status_id'] = 0;
        $data['is_tui']    = 0;
        $data['status_id']='';
        $data['caozuo'] ='';
        if($data['order_status']==3){

            if($data['refun_status'] == 0){
                $data['status']='退款中';
            }elseif($data['refun_status'] == 1){
                $data['status']='已退款';
            }elseif($data['refun_status'] == 2){
                $data['status']='退款已处理';
            }
        }elseif($data['order_status']==0){
            $data['status']='待确定';
        }elseif($data['order_status']==4){
            $data['status']='已取消';
        }elseif($data['pay_status']==0){
            $data['status']     = '待付款';
            $data['caozuo']     = '去付款';
            $data['status_id']  = 1;
        }elseif($data['shipping_status']==2){
            $data['status']='已完成';
            /*if($data['is_comment'] == 0){
                $data['status_id']=3;
                $data['caozuo']='去评价';
            }*/
        }else {
            if($data['send_type'] == 1){
                if ($data['shipping_status'] == 1) {
                    $data['status'] = '待收货';
                    $data['caozuo'] = '确认收货';
                    $data['status_id'] = 2;
                    $data['is_tui'] = 1;
                } elseif ($data['pay_status'] == 1) {
                    $data['status'] = '待发货';
                    $data['is_tui'] = 1;
                }

            }else{
                if ($data['shipping_status'] == 1) {
                    $data['status'] = '待归还';
                    /*$data['caozuo'] = '确认收货';
                    $data['status_id'] = 2;
                    $data['is_tui'] = 1;*/
                } elseif ($data['pay_status'] == 1) {
                    $data['status'] = '待取货';
                    //$data['is_tui'] = 1;
                }
            }

        }

        return $data;
    }
    /**
     * 已发布文章查询
     * @param  int $postId     文章id
     * @param int  $categoryId 分类id
     * @return array|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function orderInfo($id, $userId = 0)
    {
        $OrderModel =   new OrderModel();
        $ordersub   =   new OrderSubModel();
        
        $where=[
            'order_id'  =>  $id
        ];
        if($userId){
            $where['user_id']=$userId;
        }
        $order_info =   $OrderModel->where($where)->find();
        if($order_info){
            $order_info =   $this->Hand($order_info);

            $sub  =   $ordersub->where('order_id',$id)->select();
            
            $order_info->sub = $sub;
        }


        return $order_info;
    }

    public function orderNum($userId = 0){
        $data=[];
        $OrderModel =   new OrderModel();
        $where=[
            'user_id'   => $userId,
            'pay_status'=> 0,
            'order_status'=>['<>',4]
        ];
        $data['nopay']  = $OrderModel->where($where)->count();
        $where['order_status']=1;
        $where['pay_status']=1;
        $where['shipping_status']=0;
        $data['waitShip']   = $OrderModel->where($where)->count();
        $where['order_status']=1;
        $where['pay_status']=1;
        $where['shipping_status']=1;
        $data['waitInvalid']   = $OrderModel->where($where)->count();
        return $data;
    }


}
