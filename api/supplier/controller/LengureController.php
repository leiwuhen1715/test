<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\goods\controller;

use think\Db;
use cmf\controller\RestBaseController;
use api\goods\logic\LengureLogic;


class LengureController extends RestBaseController
{
	
    //提交预约
	public function addOrder(){
		
		$user_id = $this->getUserId();
		
		$id  		= request()->param('id',0,'intval');
		$num 		= request()->param('num',0,'intval');
		$coupon_id 	= request()->param('coupon_id',0,'intval');
		
		$count = Db::name('league_order')->where(['user_id'=>$user_id,'time_id'=>$id,'pay_status'=>1])->count();
		if($count > 0){
			$this->error('已经预约本课程');
		}
		$logic  = new LengureLogic();
		$result = $logic->addOrder($user_id,$id,$num,$coupon_id);
		
		if($result['status']==1){
		    $this->success('加入成功!',$result['result']);
		}else{
		    $this->error($result['msg']);
		}
		
	}
	
	//获取价格
	public function getTotalPrice(){
		
		$id  		= request()->param('id',0,'intval');
		$num 		= request()->param('num',0,'intval');
		$coupon_id 	= request()->param('coupon_id',0,'intval');
		
		$user_id = $this->getUserId();
		$logic  = new LengureLogic();
		$result = $logic->getTotalPrice($user_id,$id,$num,$coupon_id);
		$result['balance'] = Db::name('user')->where('id',$user_id)->value('balance');
		$this->success('ok',$result);
	}

}
