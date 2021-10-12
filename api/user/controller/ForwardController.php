<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\user\controller;

use think\Db;
use think\Validate;
use api\user\service\WxPayService;
use cmf\controller\RestUserBaseController;

class ForwardController extends RestUserBaseController
{
    //提现
    public function forward(){
    	
		
        $userId   = $this->getUserId();
        $user=DB::name('user')->field(['balance,can_balance,user_pass,mobile'])->where("id",$userId)->find();

            
        $validate = new Validate([
            'money'    => 'require'
        ]);
        $validate->message([
            'money.require'   => '请输入提现金额'
        ]);

        $post = $this->request->post();
        
        if (!$validate->check($post)) {
            $this->error($validate->getError());
        }
        if($post['money']<=0){
            $this->error('提现金额必须大于0！');
        }
       
		/*
        if(!cmf_compare_password($post['pass'],$user['user_pass'])){
            $this->error('密码错误！');
        }*/
        if($user['can_balance']<$post['money']){
            $this->error('您的余额不足！');
        }
        
        $post['add_time']  = time();
        $post['user_id']  = $userId;
        $post['order_sn'] = get_order_sn();
        $transStatu=0;
        Db::startTrans(); //开启事务
        try {
           
                
            $res = log_balance_change($userId, '提现申请',-$post['money']);
            $post['order_type']   = 1;
            $post['order_amount'] = $post['money'];
            $id = DB::name('recharge_order')->strict(false)->insertGetId($post);
            
            $transStatu = 1;
            Db::commit();
                
        } catch (\Exception $e) {
            $Message= $e->getMessage();
            // 回滚事务
            Db::rollback();
        }
        if($transStatu==1){
            $this->success('提现成功！');
        }else{
            $this->error($Message);
        }
         
    }
	//提现
	public function coinForward(){
		
		$id = request()->param('id',0,'intval');
		
		
		$coin_arr  = [1,10,30,50,100,200];
	    $user_id   = $this->getUserId();
	    $user_coin =  DB::name('user')->where("id",$user_id)->value('coin');
	    $money = $coin_arr[$id];
		
	    if(($money*100) > $user_coin){
	        $this->error('金币不足！');
	    }
	    if($id == 0){
	        $one =Db::name('recharge_order')->where(['user_id'=>$user_id,'order_type'=>1,'pay_status'=>1])->find();
	        if(!empty($one))    $this->error('只有新用户可用！');
	    }
	    
	    $post['add_time']  = time();
	    $post['user_id']  = $user_id;
	    $post['order_sn'] = get_order_sn();
	    $transStatu=0;
	    Db::startTrans(); //开启事务
	    try {
			$change_money = -$money*100;
			log_coin_change($user_id, '提现申请',$change_money);
	        $post['order_type']   = 1;
	        $post['order_amount'] = $money;
	        $id = DB::name('recharge_order')->strict(false)->insertGetId($post);
	        
	        $service = new WxPayService;
            $res = $service->toBalance($id);
            if($res['status'] != 1){
                throw new \Exception($res['msg']);
            }
            
	        $transStatu = 1;
	        Db::commit();
	            
	    } catch (\Exception $e) {
	        $Message= $e->getMessage();
	        // 回滚事务
	        Db::rollback();
	    }
	    if($transStatu==1){
	        $this->success('提现成功！');
	    }else{
	        $this->error($Message);
	    }
	        
	    
	}
    //提现
    public function forward_list(){
        
        $userId   = $this->getUserId();
        $limit   = request()->get('limit',0,'intval');
       
        $where = [
            'user_id'    => $userId,
            'order_type' => 1
        ];
        
        $lists  = Db::name('recharge_order')->where($where)->order('id', 'DESC')->paginate($limit);
        $lists  = $lists->toArray(); 
        
        $total=$lists['total'];
        $data=$lists['data'];
        
        $status=['审核中','提现成功','已驳回'];
        foreach ($data as $key => $value) {
            $data[$key]['addtime'] = date('Y-m-d H:i:s',$value['addtime']);
            $data[$key]['status']  = $status[$value['pay_status']];
        }
        $this->success('ok', $data);
        
    }

}
