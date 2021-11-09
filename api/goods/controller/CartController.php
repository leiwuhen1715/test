<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\goods\controller;

use api\goods\service\SkuServer;
use think\Db;
use cmf\controller\RestBaseController;
use api\goods\model\GoodsModel as Goods;
use api\goods\logic\CartLogic;


class CartController extends RestBaseController
{

    /**
     * type:0   获取购物车产品 1：获取立即购买的产品，
     * car_type 0 购物车 1：结算列表
     */
    public function cartList(){

        $userId       = $this->getUserId();
        $cartLogic = new CartLogic();
        $type = request()->param('type',0,'intval');


        $cartLogic = new CartLogic();
        if($type == 1){
            $res = $cartLogic->getBuyGoods($userId);
        }else{
            $car_type = request()->param('car_type',0,'intval');
            $res = $cartLogic->cartList($userId,$car_type);
        }

        if($res['status']==1){
            $result=[
                'cartList'      =>$res['result']['cartList']
            ];
            $this->success('ok',$result);
        }else{
            $this->error($res['msg']);
        }

    }

    /*获取结算金额*/
    public function getTotalPrice(){

        $type     = request()->param('type',0,'intval');
        $pay_code = request()->param('pay_code');
      
        $userId  = $this->getUserId();

        $cartLogic   = new CartLogic;
        $total_price = $cartLogic->getTotalPrice($userId,$type,$pay_code);
        $this->success('ok',$total_price);
    }
    /** 加入购物车
     * type:0   加入购物车 1：立即购买
     * buy_type rent：租赁 1：购买
     */
    public function addCart(){

        $user_id   = $this->getUserId();
        $param     = request()->param();
        $goods_id  = request()->param('goods_id', 0, 'intval');
        $type      = request()->post('type', 0, 'intval');   //加入购物车、立即购买
        $goods_num = request()->param('goods_num', 0, 'intval');
        $buy_type  = request()->param('buy_type');

        $sku_id = request()->post('sku_id');
        
        $cartLogic = new CartLogic();
        if($type == 0){

            $result = $cartLogic->addCart($goods_id,$goods_num,$user_id,$sku_id);
        }else{
            $buy_type = $buy_type=='rent'?0:1;
            if($buy_type == 0){
                if(empty($param['start_time']))  $this->error('请选择开始时间');
                if(empty($param['end_time']))    $this->error('请选择结束时间');
            }
            $result = $cartLogic->addBuy($goods_id, $goods_num, $sku_id,$user_id,$buy_type,$param);
        }


        if($result['status']==1){
            $this->success('加入成功!');
        }else{
            $this->error($result['msg']);

        }
    }
    //购物车删除
    public function deleteCart(){
        $id = $this->request->param('id',0,'intval');
        $userId       = $this->getUserId();

        $ids = request()->param('ids');
        /*if(!empty($ids)){
          	$id_arr  = explode(',',$ids);
          	$where['id'] = ['in',$id_arr];
        }else{
        	$where['selected'] = 1;
        }*/
        $count = Db::name('cart')->where(['user_id'=>$userId,'type'=>0,'selected'=>1])->count();
        if($count < 1)  $this->error('请选择要删除的产品');
        Db::name('cart')->where(['user_id'=>$userId,'type'=>0,'selected'=>1])->delete();
        $this->success('ok');
    }

    //购物车选中
    public function select(){
        $userId   = $this->getUserId();
        $id       = $this->request->param('id',0,'intval');
        $type     = $this->request->param('type',0,'intval');

        if($type == 1){
            $select     = $this->request->param('select');
            $selected   = $select=='true'?1:0;
            Db::name('cart')->where(['user_id'=>$userId,'type'=>0])->update(['selected'=>$selected]);
            $this->success('ok');
        }else{
            $cart     = Db::name('cart')->field('selected')->where(['user_id'=>$userId,'id'=>$id])->find();
            if($cart){
                $selected = $cart['selected']==1?0:1;
                Db::name('cart')->where('id',$id)->update(['selected'=>$selected]);
                $this->success('ok');
            }
        }
    }

    //提交订单

    public function addOrder(){

        $param = request()->param();
        $address_id = request()->post('address_id', 0, 'intval');
        $coupon_id  = request()->post('coupon_id', 0, 'intval');
        $type       = request()->post('type', 0, 'intval');
        $send_type  = request()->post('send_type', 0, 'intval');

        $userId    = $this->getUserId();
        $cartLogic = new CartLogic();
        $count=$cartLogic->buy_count($userId,1,$type);
        if($count<1)$this->error('没有购买的产品！'); // 返回结果状态
        if(empty($param['pay_code']))$this->error('请选择支付方式');

        $result = $cartLogic->addOrder($userId,$address_id,$type,$coupon_id,$param,$send_type);
        
        if($result['status']=='1'){
            $this->success('ok',$result['result']);
        }else{
            $this->error($result['msg']);
        }
    }
	
	public function updateCart(){
	    
        $param    = request()->param();
        $buy_type = request()->param('buy_type');
        $user_id  = $this->getUserId();
        $buy_type = $buy_type=='rent'?0:1;
        
        $is_buy = Db::name('cart')->where(['type' => 0,'user_id' => $user_id,'is_buy'=>0,'selected'=>1])->value('id');
        
        $update = [
            'buy_type' => $buy_type
        ];
        if($buy_type == 0){
            if(empty($param['start_time']))  $this->error('请选择开始时间');
            if(empty($param['end_time']))    $this->error('请选择结束时间');
            $update['start_time'] = strtotime($param['start_time']);
            $update['end_time']   = strtotime($param['end_time'].' 23:59:59');
            $list = Db::name('cart')->field('goods_id,sku_id,start_time,end_time,goods_num')->where(['type' => 0,'user_id' => $user_id,'selected'=>1])->select();
            $service = new SkuServer();
            foreach ($list as $v){
                $res_sku = $service->checkCount($v['goods_id'],$v['sku_id'],$update['start_time'],$update['end_time'],$v['goods_num']);
                if($res_sku['code'] == 0){
                    $this->error($res_sku['msg']);
                    return;
                }
            }

        }else if(!empty($is_buy)){
            $this->error('存在不可购买产品');
        }
        Db::name('cart')->where(['type' => 0,'user_id' => $user_id,'selected'=>1])->update($update);
        $this->success('ok');
	}



}
