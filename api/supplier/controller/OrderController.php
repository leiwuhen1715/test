<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\supplier\controller;

use cmf\controller\RestUserBaseController;
use api\supplier\service\OrderService;
use think\Validate;
use think\Db;

class OrderController extends RestUserBaseController
{
	
	public function addOrder(){
		$id      = request()->param('id',0,'intval'); 
		$user_id = $this->getUserId();
		check_reveiw($user_id);
		$service = new OrderService;
		$result  = $service->addOrder($user_id,$id);
		
		if($result['code'] == 1){
			$this->success('下单成功',$result['order_id']);
		}else{
			$this->error($result['msg'],$result['status']);
		}
		
	}
	
    //订单列表
    public function list(){

        $param = $this->request->param();
        $userId    = $this->getUserId();
        $sercice   = new OrderService;
        $data 	   = $sercice->getList($param,$userId);
        $data_list = $sercice->Handle($data->items());

        $this->success('获取成功!', $data_list);

    }
	

    //订单详情
    public function detail(){

        $id = $this->request->get('id', 0, 'intval');
        $userId   = $this->getUserId();
        
        $sercice  = new OrderService;
        $data     = $sercice->orderInfo($id,$userId);

        if($data){

            $this->success('ok', $data);
        }else{
            $this->error('非法操作！');
        }

    }
    
	/**
	 * 取消订单
	 */
    public function cancel(){
		$id 	= request()->post('id', 0, 'intval');
		
        $userId = $this->getUserId();
		$order = Db::name('meal_order')->field('order_status,supplier_id')->where(['user_id'=>$userId,'order_id'=>$id])->find();
		
		if($order['order_status'] == 0 || $order['order_status'] == 4){
			Db::name('meal_order')->where('order_id',$id)->update(['order_status'=>3]);
			Db::name('supplier')->where('id',$order['supplier_id'])->setInc('store_count');
			$this->success('取消成功');
		}else{
			$this->error('非法操作');
		}
	}
	/**
	 * 提交审核信息
	 */
	public function submitOrder(){
		
		$id 	  	= request()->param('id', 0, 'intval');
		$order_sn 	= request()->param('other_order_sn');
		$amount 	= request()->param('other_order_amount');
		$pay_img 	= request()->param('pay_img');
		$com_img 	= request()->param('com_img');
		
		$userId   = $this->getUserId();
		$sercice  = new OrderService;
		$data     = $sercice->orderInfo($id,$userId);
		if(empty($data)) 		  $this->error('订单不存在！');
		if(empty($order_sn))  	  $this->error('请填写订单编号');
		if(empty($amount))  	  $this->error('请填写支付金额');
		if(empty($pay_img))  	  $this->error('请上传订单金额');
		if($data['prome_type'] == 1 && empty($com_img)) 	$this->error('请上传评论截图');
		
		if(($data['order_status'] == 0 || $data['order_status'] == 4) && $data['is_first'] == 0){
		    
		    $is_first = $data['order_status']==0?0:1;
			$update = [
				'sub_time'			=> time(),
				'other_order_sn'	=> $order_sn,
				'other_order_amount'=> $amount,
				'pay_img'			=> $pay_img,
				'com_img'			=> $com_img,
				'order_status'		=> 1,
				'is_first'          => $is_first
			];
			Db::name('meal_order')->where('order_id',$id)->update($update);
			
			$this->success('提交成功！');
		}else{
			if($data['order_status'] == 1){
				$this->error('已经提交过了！');
			}else{
				$this->error('订单已处理！');
			}
			
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
			
            $this->success('删除成功！');
        }else{
            $this->error('订单不能删除');
        }

    }

}
