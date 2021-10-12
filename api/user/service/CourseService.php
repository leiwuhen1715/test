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

use api\user\service\DoorService;
use app\user\service\OfficialService;
use api\user\model\UserTrainModel;
use api\user\model\LeagueOrderModel;
use think\db\Query;
use think\Db;

class CourseService
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

        $model = new LeagueOrderModel();

        $field = 'o.*';
        $where=[
            'o.pay_status' 	=> 1,
			'o.user_id'		=> $userId
        ];
        if(isset($filter['is_zeng'])){
        	$where['o.send_code'] = 1;
        }
        $data  = $model->alias('o')->relation(['user','goods'])->field($field)->where($where)->order('o.id', 'DESC')->paginate(10);
        return $data;
    }
	
	
	public function recordList($filter, $userId = false)
	{
	
	    $model = new UserTrainModel();
	    $where = [];
		if(!empty($filter['year'])){
			$where['year'] = $filter['year'];
		}
		if(!empty($filter['month'])){
			$where['month'] = $filter['month'];
		}
	    $data  = $model->alias('o')->relation(['coauser','goods'])->where(['o.user_id'	=> $userId])->where($where)->order('id', 'DESC')->paginate(10);
	    return $data;
	}
	
	public function recordHandle($data){
	    $new_list = [];
	    foreach ($data as $key => $vo) {
	
	        if(!empty($vo['goods']['tags'])){
	        	$tag_arr = Db::name('goods_tag')->where('id','in',$vo['goods']['tags'])->order('list_order','asc')->column('name');
	        	$vo['goods']['tag_str'] = implode(' · ',$tag_arr);
	        }
	        $vo['time_str']    = date('m-d',$vo['start_time']).'  '.date('H:i',$vo['start_time']).'-'.date('H:i',$vo['end_time']);

	        $new_list[] = $vo;
	    }
	    return $new_list;
	}
	
	public function signInfo($id,$userId){
		
		$model = new LeagueOrderModel();
		$data  = $model->alias('o')->relation(['user','goods'])->where(['pay_status'=>1,'user_id'=>$userId,'goods_id'=>$id])->order('o.id', 'DESC')->find();
		return $data;
	}

    /**
     * 用户订单状态
     */
    public function Handle($data){
        $new_list = [];
        foreach ($data as $key => $vo) {

            if(!empty($vo['goods']['tags'])){
            	$tag_arr = Db::name('goods_tag')->where('id','in',$vo['goods']['tags'])->order('list_order','asc')->column('name');
            	$vo['goods']['tag_str'] = implode(' · ',$tag_arr);
            }
            $vo['time_str']    = date('Y-m-d',$vo['start_time']).'  '.date('H:i',$vo['start_time']).'-'.date('H:i',$vo['end_time']);
			$vo['status_name'] = get_status_name($vo['order_status']);
			$vo['allow_send']  = 0;
			if($vo['order_status'] == 2){
				
				if($vo['send_code']==0){
					$send_time = $vo['start_time']-3600*6;
					if($send_time > time()){
						$vo['allow_send'] = 1;
					}
				}
			}
        	
            $new_list[] = $vo;
        }
        return $new_list;
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
    public function orderInfo($id, $user_id = 0,$id_door=0)
    {
        $model = new LeagueOrderModel();
        $where=[
            'id'   =>  $id,
			'user_id'	 =>  $user_id,
			'pay_status' =>  1
        ];
		
        $order_info =   $model->relation(['user','goodsinfo','store'])->where($where)->find();
        if($order_info){
        	$order_info['allow_send'] = $order_info['is_show'] = $order_info['is_refund'] = 0;
        	
        	//判断是否可以赠送/退款
        	if($order_info['order_status'] == 2){
        		
        		if($order_info['send_code']==0){
        			$send_time = $order_info['start_time']-3600*6;
        			if($send_time > time()){
        				$order_info['is_refund'] = $order_info['allow_send'] = 1;
        			}
        		}
        	}
			if($order_info['order_status'] == 6){
				$order_info['is_refund'] = 1;
			}
        	//判断是否显示二维码
        	if(in_array($order_info['order_status'],[1,2,3])){
        		$start_time  = $order_info['start_time']-1800;
        		$order_info['is_show'] = ($start_time<time())?($order_info['send_code']!=1?1:0):0;
        	}
        	
        	if($order_info['is_show'] == 1){
        		
				$end_time    = $order_info['start_time']+900;
				$in_data     = [
					'order_id'  => $order_info['id'],
					'device_sn' => '2358992010',
					'user_id'   => $order_info['user_id'],
					'start'     => $start_time,
					'end'       => $end_time,
				];
				$door = new DoorService();
				$order_info['file_name'] = cmf_get_image_url($door->rule_b($in_data,0));
				
				$order_info['d_start_time'] = date('Y-m-d',$start_time);
				$order_info['d_end_time']   = date('H:i',$start_time).' - '.date('H:i',$end_time);
			
        	}
			
			
			$weekarray = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
			
			$order_info['n_start_time'] = date('Y-m-d',$order_info['start_time']);
			$order_info['n_end_time'] = date('H:i',$order_info['start_time']).' - '.date('H:i',$order_info['end_time']);
			
			$order_info['photo'] = cmf_get_image_url(Db::name('goods_time')->where('id',$order_info['time_id'])->value('photo'));
			$order_info['week'] = $weekarray[date('w',$order_info['start_time'])];
        }

        return $order_info;
    }
    public function giftInfo($gift_code){
    	$model = new LeagueOrderModel();
        $where=[
			'gift_code'	 =>  $gift_code,
			'pay_status' =>  1
        ];
		
        $order_info =   $model->relation(['user','goodsinfo','store'])->where($where)->find();
        if($order_info){
        	
        	$order_info['allow_send'] = 0;
        	if($order_info['order_status'] == 2){
	        	$send_time  = $order_info['start_time']-3600*6;
	        	$order_info['allow_send'] = ($send_time > time())?($order_info['send_code']==0?1:0):0;
        	}
			$weekarray = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
			$order_info['n_start_time'] = date('Y-m-d',$order_info['start_time']);
			$order_info['n_end_time'] = date('H:i',$order_info['start_time']).' - '.date('H:i',$order_info['end_time']);
			
			$order_info['week'] = $weekarray[date('w',$order_info['start_time'])];
        }

        return $order_info;
    }
	
	/**
	 * 签到
	 */
	public function sign($id,$user_id){
		$result = ['code'=>0,'msg'=>''];
		$data = Db::name('league_order')->where(['user_id'=>$user_id,'time_id'=>$id,'pay_status'=>1])->order('id','desc')->find();
		if($data){
			if($data['is_sign'] == 1){
				$result['msg'] = '已经签到过了';
			}else{
				
				$tarin_time = $data['end_time']-$data['start_time'];
				$student_id = Db::name('coach_student')->where(['user_id'=>$user_id,'coach_user_id'=>$data['coach_user_id']])->value('id');
				$tarin_time = $tarin_time<0?1:$tarin_time;
				
				Db::startTrans(); //开启事务
				try {
					
					$this->getTrainYear($data['start_time'],$user_id,$tarin_time);   //更新年
					$this->getTrainMonth($data['start_time'],$user_id,$tarin_time);	 //更新月
					$this->getTrainDay($data['start_time'],$user_id,$tarin_time);	 //更新天
			
					//添加训练记录
					$insert_data = [
						'user_id' 		=> $user_id,
						'coach_user_id'	=> $data['coach_user_id'],
						'start_time'	=> $data['start_time'],
						'end_time'		=> $data['end_time'],
						'train_time'	=> $tarin_time,
						'add_time'		=> time(),
						'student_id'	=> $student_id,
						'year'			=> date('Y',$data['start_time']),
						'month'			=> date('m',$data['start_time']),
						'day'			=> date('d',$data['start_time']),
						'goods_id'		=> $data['goods_id']
					];
					Db::name('user_train')->insert($insert_data);
					
					
					Db::name('coach_student')->where('id',$student_id)->inc('train_time',$tarin_time)->inc('class_hour',1)->update(); //更新学员
					Db::name('user')->where('id',$user_id)->inc('train_time',$tarin_time)->inc('class_hour',1)->update();	//更新用户
					Db::name('league_order')->where('id',$data['id'])->update(['is_sign'=>1,'order_status'=>1]);
					
					$server = new OfficialService;
					$server->sign_send($data['id']);
					
					$result['code'] = 1;
					
				    Db::commit();
				} catch (\Exception $e) {
				    $result['msg'] = $e->getMessage();
				    // 回滚事务
				    Db::rollback();
				}
				
			}
		}else{
			$result['msg'] = '课程不存在';
		}
		
		return $result;
	}
	//更新年训练
	public function getTrainYear($start_time,$user_id,$tarin_time){
		//user_train_year
		$year = date('Y',$start_time);
		$id = Db::name('user_train_year')->where(['year'=>$year,'user_id'=>$user_id])->value('id');
		if($id){
			Db::name('user_train_year')->where('id',$id)->inc('train_time',$tarin_time)->inc('class_hour',1)->update();
		}else{
			Db::name('user_train_year')->insert([
				'user_id' 	 => $user_id,
				'year'		 => $year,
				'train_time' => $tarin_time,
				'class_hour' => 1
			]);
		}
	}
	//更新月训练
	public function getTrainMonth($start_time,$user_id,$tarin_time){
		//user_train_mouth
		$year = date('Y',$start_time);
		$month = date('m',$start_time);
		
		$id = Db::name('user_train_mouth')->where(['year'=>$year,'month'=>$month,'user_id'=>$user_id])->value('id');
		if($id){
			Db::name('user_train_mouth')->where('id',$id)->inc('train_time',$tarin_time)->inc('class_hour',1)->update();
		}else{
			Db::name('user_train_mouth')->insert([
				'user_id' 	 => $user_id,
				'year'		 => $year,
				'month'		 => $month,
				'train_time' => $tarin_time,
				'class_hour' => 1
			]);
		}
	}
	
	//更新月训练
	public function getTrainDay($start_time,$user_id,$tarin_time){
		//user_train_mouth
		$year  = date('Y',$start_time);
		$month = date('m',$start_time);
		$day   = date('d',$start_time);
		
		$id = Db::name('user_train_day')->where(['year'=>$year,'month'=>$month,'day'=>$day,'user_id'=>$user_id])->value('id');
		if($id){
			Db::name('user_train_day')->where('id',$id)->inc('train_time',$tarin_time)->inc('class_hour',1)->update();
		}else{
			$date_time = strtotime(date('Y-m-d',$start_time));
			Db::name('user_train_day')->insert([
				'user_id' 	 => $user_id,
				'year'		 => $year,
				'month'		 => $month,
				'day'		 => $day,
				'date_time'  => $date_time,
				'train_time' => $tarin_time,
				'class_hour' => 1
			]);
		}
	}
	
	

}
