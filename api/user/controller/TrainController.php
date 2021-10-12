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
use think\Db;


class TrainController extends RestUserBaseController
{

    public function ranking(){

        $user_id = $this->getUserId();
        $type   = $this->request->param('type',0,'intval');
		$result = [];
		$year  = date('Y');
		$month = date('m');
		
		$model 	  = new UserModel;
		if($type == 0){
			//月榜
			$where = [
				['year','=',$year],
				['month','=',$month],
			];
			$total_time = Db::name('user_train_mouth')->where($where)->where('user_id',$user_id)->value('train_time'); //总分数
			$rank       = Db::name('user_train_mouth')->where($where)->where('train_time','>',$total_time)->count();
			$hot_list = Db::name('user_train_mouth')->field('user_id,train_time,class_hour')->where($where)->order('train_time','desc')->limit(3)->select()->toarray();
			
			//上一名
			$pre_user  = Db::name('user_train_mouth')->where('train_time','>',$total_time)->order('train_time','asc')->find();
			//下一名
			$next_user = Db::name('user_train_mouth')->where('train_time','<',$total_time)->order('train_time','desc')->find();
			
		}elseif($type == 1){
			//年榜
			
			$total_time = Db::name('user_train_year')->where([['year','=',$year],['user_id','=',$user_id]])->value('train_time'); //总分数
			$rank       = Db::name('user_train_year')->where('year',$year)->where('train_time','>',$total_time)->count();
			$hot_list   = Db::name('user_train_year')->field('user_id,train_time,class_hour')->where('year',$year)->order('train_time','desc')->limit(3)->select()->toarray();
			
			//上一名
			$pre_user  = Db::name('user_train_year')->where('train_time','>',$total_time)->order('train_time','asc')->find();
			//下一名
			$next_user = Db::name('user_train_year')->where('train_time','<',$total_time)->order('train_time','desc')->find();
			
		}elseif($type == 2){
			//总榜
			$hot_list = $model->field('avatar,user_nickname,train_time,id as user_id')->order('train_time','desc')->limit(3)->select()->toarray();
			$total_time = Db::name('user')->where('id',$user_id)->value('train_time'); //总分数
			$rank       = Db::name('user')->where('train_time','>',$total_time)->count();
			//上一名
			$pre_user  = $model->field('avatar,user_nickname,train_time,id as user_id')->where('train_time','>',$total_time)->order('train_time','asc')->find();
			//下一名
			$next_user  = $model->field('avatar,user_nickname,train_time,id as user_id')->where('train_time','<',$total_time)->order('train_time','desc')->find();
		}
		
		foreach($hot_list as $key=>$vo){
			$hot_list[$key]['user']  = $model->field('avatar,user_nickname,train_time')->where('id',$vo['user_id'])->find();
			$hot_list[$key]['train_time'] = (int)($vo['train_time']/60);
		}
		
		if($pre_user){
			$pre_user['train_time'] = (int)($pre_user['train_time']/60);
			$pre_user['user'] = $model->field('avatar,user_nickname')->where('id',$pre_user['user_id'])->find();
		}
		if($next_user){
			$next_user['train_time'] = (int)($next_user['train_time']/60);
			$next_user['user'] = $model->field('avatar,user_nickname')->where('id',$next_user['user_id'])->find();
		}
		$total_time = (int)($total_time/60);
		
		$result = [
			'hot_list'  => $hot_list,
			'total_time'=> $total_time,
			'rank'		=> $rank+1,
			'next_user' => $next_user,
			'pre_user'	=> $pre_user
		];
        $this->success('ok',$result);
        
    }
	
	
	public function record(){
		
		$pre_month_time = strtotime('last month');
		$user_id = $this->getUserId();

		$current_year  = date('Y',time());
		$current_month = date('m',time());
		$pre_year      = date('Y',$pre_month_time);
		$pre_month     = date('m',$pre_month_time);
		
		$current_data = Db::name('user_train_mouth')->where([['user_id','=',$user_id],['year','=',$current_year],['month','=',$current_month]])->find(); //当月
		$pre_data = Db::name('user_train_mouth')->where([['user_id','=',$user_id],['year','=',$pre_year],['month','=',$pre_month]])->find(); //上月
		
		if($current_data) 	{
			$current_data['train_count'] = (int)($current_data['train_time']/60);
			$current_data['day_count']  = Db::name('user_train_day')->where('user_id',$user_id)->where(['year'=>$current_year,'month'=>$current_month])->count();
		}
		if($pre_data){
			$pre_data['train_count'] = (int)($pre_data['train_time']/60);
			$pre_data['day_count']  = Db::name('user_train_day')->where('user_id',$user_id)->where(['year'=>$pre_year,'month'=>$pre_month])->count();
		} 		
		$day_count  = Db::name('user_train_day')->where('user_id',$user_id)->count();
		$user       = Db::name('user')->field('class_hour,calorie')->where('id',$user_id)->find();
		
		$this->success('ok',['current_data'=>$current_data,'pre_data'=>$pre_data,'day_count'=>$day_count,'train_count'=>$user['class_hour'],'calorie'=>$user['calorie']]);
	}
}
