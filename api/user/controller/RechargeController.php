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
use think\Db;


class RechargeController extends RestUserBaseController
{

    public function index(){

		$list  = Db::name('recharge')->where('status',1)->order(['list_order'=>'asc','id'=>'desc'])->select()->toarray();
		foreach($list as $key=>$vo){
			$list[$key]['price']  = del0($vo['price']);
			$list[$key]['amount'] = $vo['price']+$vo['amount'];
		}
        $this->success('ok', $list);
    }

    /**
     * 充值
     */
    public function recharge(){
        $user_id = $this->getUserId();
        $id = request()->param('id',0,'intval');
   
        $one = Db::name('recharge')->where('id',$id)->where('status',1)->find();
        if($one){
			
			$order_amount = $one['price'];
			$get_amount   = $one['amount']+$one['price'];
			
			$order_sn = Db::name('recharge_order')->where(['user_id'=>$user_id,'goods_id'=>$id,'pay_status'=>0,'order_amount'=>$order_amount,'get_amount'=>$get_amount])->value('order_sn');
			if(!$order_sn){
				$order_sn = get_order_sn();
				$pay_data = [
				    'amount'     => $order_amount,
				    'type'       => 5,
				    'order_sn'   => $order_sn,
					'goods_name' => '充值'.$one['name'],
					'pay_code'	 => 'wxpay',
					'add_time'   => time(),
					'user_id'    => $user_id
				];
				Db::name('pay_log')->insert($pay_data);
				
				$data = [
				    'user_id'       => $user_id,
				    'add_time'      => time(),
				    'goods_id'      => $id,
				    'order_sn'      => $order_sn,
				    'order_amount'  => $order_amount,
				    'get_amount'    => $get_amount,
				    'goods_name'    => $one['name'],
					'pay_name' 		=> '微信支付'
				];
				$order_id = Db::name('recharge_order')->insertGetId($data);
				
			}
            
            $this->success('ok',$order_sn);
        }else{
            $this->error('您充值的类型不存在！');
        }

    }
    
    
   
}
