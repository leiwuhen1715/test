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
use api\user\model\CoachStudentModel;
use api\goods\model\GoodsTimeModel;
use api\user\model\LeagueOrderModel;
use api\user\service\DoorService;
use think\Validate;
use think\Db;

class CoachController extends RestUserBaseController
{
	public function userInfo($field = '')
    {
        //判断请求为POST,修改信息
        if (request()->isPost()) {
            $userId   = $this->getUserId();
            $fieldStr = 'post_excerpt,vocation,experie,photo,specialty';
            $data     = $this->request->post();
            if (empty($data)) {
                $this->error('修改失败，提交表单为空！');
            }
            
			$userfieldStr = 'user_nickname,signature,sex,birthday,user_height,user_weight';
            if (!empty($data['birthday'])) {
                $data['birthday'] = strtotime($data['birthday']);
            }
            $upData = Db::name("user")->where('id', $userId)->field($userfieldStr)->update($data);
            $upData = Db::name("user_coach")->where('id', $userId)->field($fieldStr)->update($data);
            if ($upData !== false) {
                $this->success('修改成功！');
            } else {
                $this->error('修改失败！');
            }
        }
        $userId   = $this->getUserId();
        $join = [
        	['user u','c.user_id = u.id','left']
        ];
        $userData = Db::name('user_coach')->alias('c')->field('c.*,u.user_nickname,u.sex,u.birthday,u.user_height,u.user_weight')->join($join)->where('c.user_id',$userId)->find();
        
        $userData['birthday']    = empty($userData['birthday'])?'':date('Y-m-d',$userData['birthday']);
        $userData['photo_thumb'] = cmf_get_image_url($userData['photo']);
        $userData['specialty']   = empty($userData['specialty'])?[]:explode(',',$userData['specialty']);
        
        $this->success('获取成功！', $userData);
    }
    //课程列表
    public function course(){

		$day   = request()->param('day');
		$date  = request()->param('date');
		$date_arr = explode('-',$date);
		$day = $day=='-1'?0:($day+1);
		
        $userId   = $this->getUserId();
		$where  = [
			['user_id','=',$userId],
			['year','=',$date_arr[0]],
			['month','=',$date_arr[1]],
		];
		if(!empty($day))	$where[] = ['day','=',$day];
		
        $model  = new GoodsTimeModel();
		$order  = ['start_time'=>'asc','id' => 'desc'];
        $data   = $model->field('id,goods_id,user_id,coach_id,cat_id,shop_price,member_price,start_time,end_time,enroll_num,people_num')->relation(['simplegoods','user'])->where($where)->order($order)->paginate(10);
        
        $list = $data->items();
        $new_list = [];
        foreach($list as $key=>$vo){
        	
        	if(!empty($vo['simplegoods']['tags'])){
        		$tag_arr = Db::name('goods_tag')->where('id','in',$vo['simplegoods']['tags'])->order('list_order','asc')->column('name');
        		$vo['simplegoods']['tag_str'] = implode(' · ',$tag_arr);
        	}
        	$vo['time_str'] = date('m-d',$vo['start_time']).' '.date('H:i',$vo['start_time']).'-'.date('H:i',$vo['end_time']);
        	$new_list[] = $vo;
        }
        
        $this->success('ok!', $new_list);


    }

    //订单详情
    
    public function courseDetail(){

        $id = $this->request->get('id', 0, 'intval');
        $userId   = $this->getUserId();
		
        $model  = new GoodsTimeModel();
        $data   = $model->relation(['simplegoods','user','store'])->where(['id'=>$id,'user_id'=>$userId])->find();

        if($data){
        	
			if(!empty($data['simplegoods']['tags'])){
				$tag_arr = Db::name('goods_tag')->where('id','in',$data['simplegoods']['tags'])->order('list_order','asc')->column('name');
				$data['simplegoods']['tag_str'] = implode(' · ',$tag_arr);
			}
			$data['photo_thumb'] = cmf_get_image_url($data['photo']);
			$data['time_str'] = date('m月d日',$data['start_time']).'  '. date('H:i',$data['start_time']).'-'.date('H:i',$data['end_time']);
			$lea_model  	  = new LeagueOrderModel;
			$data['student']  = $lea_model->field('id,user_id')->relation('auser')->where(['time_id'=>$id,'pay_status'=>1])->where('order_status','in',[1,2,3])->select();
			
			$data['applet_count']  = $lea_model->where(['time_id'=>$id,'pay_status'=>1,'applet_new'=>1])->count();
			$data['coach_count']   = $lea_model->where(['time_id'=>$id,'pay_status'=>1,'coach_new'=>1])->count();
			$data['course_count']  = $lea_model->where(['time_id'=>$id,'pay_status'=>1,'course_new'=>1])->count();
			
			$start_time  = $data['start_time']-900;
			$end_time    = $data['end_time']+900;
				
			$in_data     = [
				'time_id'  => $id,
				'device_sn' => '2358992010',
				'user_id'   => $data['user_id'],
				'start'     => $start_time,
				'end'       => $end_time,
			];
			$door = new DoorService();
			$data['file_name']    = cmf_get_image_url($door->rule_coach_b($in_data,0));
			$data['d_start_time'] = date('Y-m-d',$start_time);
			$data['d_end_time']   = date('H:i',$start_time).' - '.date('H:i',$end_time);
            $this->success('ok', $data);
        }else{
            $this->error('非法操作！');
        }

    }
    
    //更新照片
    public function coachphoto(){
    	$id 	= request()->post('id', 0, 'intval');
    	$photo = request()->post('photo');
        $userId   = $this->getUserId();
        if(empty($photo))  $this->error('请上传照片');
        $model  = new GoodsTimeModel();
        $data   = $model->where(['id'=>$id,'user_id'=>$userId])->find();
        if($data){
        	
        	Db::name('goods_time')->where('id',$id)->update(['photo'=>$photo]);
        	$this->success('更新成功');
        	
        }else{
        	$this->error('课程不存在');
        }
    }
	
	//新学员列表
	public function newStudent(){
		$type = request()->param('type',0,'intval');
		$id   = request()->param('id',0,'intval');
		$userId   = $this->getUserId();
		
		$model  = new GoodsTimeModel();
		$data   = $model->relation(['simplegoods','user','store'])->where(['id'=>$id,'user_id'=>$userId])->find();
		if($data){
			$where = [['time_id','=',$id],['pay_status','=',1]];
			switch ($type) {
				case '1':
					$where[] = ['applet_new','=',1];
					break;
				case '2':
					$where[] = ['coach_new','=',1];
					break;
				default:
					$where[] = ['course_new','=',1];
					break;
			}
			
			$lea_model     = new LeagueOrderModel;
			$student_list  = $lea_model->field('id,user_id')->relation('auser')->where($where)->select();
			$count 		   = $lea_model->where($where)->count();
			$this->success('ok',['student_list'=>$student_list,'count'=>$count]);
		}else{
			$this->error('非法操作！');
		}
	}
	//学员列表
	public function student(){
		
		$userId   = $this->getUserId();
		$model    = new CoachStudentModel;
		$student_list  = $model->field('id,user_id,train_time,class_hour')->relation('user')->where('coach_user_id',$userId)->order(['train_time'=>'desc','id'=>'asc'])->paginate(10);
		
		$this->success('ok',$student_list->items());
	}
	
	//统计
	public function statis(){
		$userId = $this->getUserId();
		$time   = time();
		$result = [];
		$result['course_count'] = Db::name('goods_time')->where([['user_id','=',$userId],['start_time','<',$time]])->count(); //课程数量
		$srart_time   = Db::name('goods_time')->where([['user_id','=',$userId],['start_time','<',$time]])->sum('start_time'); //总计开始时间
		$end_time     = Db::name('goods_time')->where([['user_id','=',$userId],['start_time','<',$time]])->sum('end_time'); //总计开始时间
		$result['minute']       = (int)(($end_time-$srart_time)/60);
		$result['student_num']  = Db::name('coach_student')->where('coach_user_id',$userId)->count();
		
		$this->success('ok',$result);
	}
	

}
