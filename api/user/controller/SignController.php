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
use api\user\model\UserModel;
use api\user\service\SignService;
use think\Db;


class SignController extends RestUserBaseController
{

    public function sign(){

        $user_id = $this->getUserId();
        $service = new SignService;
		$result  = $service->sign($user_id);
        if($result['status'] == 1){
			$this->success('签到成功');
		}else{
			$this->error($result['msg']);
		}
    }
	
	public function isSign(){
		$result = [];
		
		$user_id  = $this->getUserId();
		$service  = new SignService;
		$res 	  = $service->isSign($user_id);
		
		$result['is_sign']  = $res['status'];
		$result['sign_day'] = Db::name('user_other')->where('user_id',$user_id)->value('sign_day');
		$result['coin']     = Db::name('user')->where('id',$user_id)->value('coin');
		
		$this->success('ok',$result);
	}
	
	public function getData(){
		$user_id  = $this->getUserId();
		check_reveiw($user_id);
		
		$result   =  Db::name('user_other')->where('user_id',$user_id)->find();
		$user     = Db::name('user')->field('coin,is_vip')->where('id',$user_id)->find();
		$result['coin'] = $user['coin'];
		$result['is_vip'] = $user['is_vip'];
		$start_time = strtotime(date('Y-m-d'));
		$result['today_coin'] = Db::name('user_coin_log')->where(['user_id'=>$user_id,'type'=>2])->where('create_time','between',[$start_time,time()])->sum('coin');
		$result['ti_amount'] = Db::name('recharge_order')->where(['user_id'=>$user_id,'order_type'=>1,'pay_status'=>1])->sum('order_amount');
		
		$this->success('ok',$result);
	}
	public function record(){
		
		
	}
}
