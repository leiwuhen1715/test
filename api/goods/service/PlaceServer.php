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
namespace api\goods\service;

use api\user\service\PlaceOrderService;
use api\user\service\DoorService;
use think\Db;

class PlaceServer
{

    //立即预约
    
    public function getOneTime($time,$goods_id,$type_id=0){
    	
    	$week = date("w",$time);
    	$week = $week == 0?7:$week;
    	$new_sku = [];
    	$goodssku = Db::name('GoodsSku')->field('sku_id,item_path,price')->where('goods_id',$goods_id)->where('item_path','like',"{$week}%")->select();
    	foreach($goodssku as $key=>$vo){
    	   
    		$spec = explode('-',$vo['item_path']);
    		if(count($spec) > 1){
				
    		    $vo['spec_time'] = Db::name('spec_item')->where('id',$spec['1'])->value('item');
				$vo['time'] = intval($vo['spec_time']);
				
    		    $new_sku[intval($vo['spec_time'])] = $vo;
    		}else{
    			$vo['spec_time'] = '';
    			$new_sku[$key]   = $vo;
    		}
    		
    	}
    	return $new_sku;
    	
    }
	
	//获取厂区时间
	public function getSkuTime($item_path,$date=''){
		
		$res_data = [];
		$spec = explode('-',$item_path);
		if(count($spec) > 1){
			
			$spec_time = Db::name('spec_item')->where('id',$spec['1'])->value('item');
			$spec_arr  = explode('-',$spec_time);
			$res_data['start_time']  = $date.' '.$spec_arr[0].':00';
			$res_data['end_time']    = $date.' '.$spec_arr[1].':59';
			$res_data['hours']       = intval($spec_arr[1])-intval($spec_arr[0])-1;
		}else{
			$res_data['hours']      = 12;
			$res_data['start_time'] = $date;
			$res_data['end_time']   = $date.' 23:59';
		}
		
		return $res_data;
		
	}
	
	/**
	 * @param {Object} $user_id
	 * @param {Object} 产品id
	 */
	public function addOrder($user_id,$id){
		$result = [
			'status' => 0,
			'msg'    => ''
		];
		$h = date('H',time());
		$res_goods = $this->checkGoods($id);
		if($h < 6){
		    $result['msg'] = '未到开发时间';
		}elseif($res_goods['status'] == 0){
			$result['msg'] = $res_goods['msg'];
		}else{
			$goods = $res_goods['goods'];
			
			$order_sn    = get_order_sn();
			$insert_data = [
				'user_id'   	=>  $user_id,
				'order_sn'   	=>  $order_sn,
				'order_status'  =>  0,
				'pay_status'   	=>  0,
				'add_time'   	=>  time(),
				'prom_type'   	=>  0,
				'goods_id'   	=>  $id,
				'goods_name'    =>  $goods['goods_name'],
				'goods_img'     =>  $goods['goods_img'],
				'cat_id'		=>  $goods['cat_id'],
				'device_sn'		=>  $goods['device_sn'],
				'device_sn_out' =>  $goods['device_sn_out'],
				'people_num'	=>  1,
				// 'pay_log_id'	=> $pay_log_id
			];
			$order_id = Db::name('place_order')->insertGetId($insert_data);
			
			//开门
// 			$server = new PlaceOrderService;
// 			$server->doorOpen($user_id,$order_id,$goods['device_sn']);
			
			
			$result['status']   = 1;
			$result['order_id'] = $order_id;
			
			$in_data   = [
			    'order_id'  => $order_id,
			    'device_sn' => $goods['device_sn'],
			    'user_id'    => $user_id,
			    'start'     => time(),
			    'end'       => time()+300,
			];
			$door = new DoorService();
		    $img  = $door->rule_b($in_data);
			$result['img']      = cmf_get_image_url($img);
			
		}
		return $result;
	}
	/**
	 * 预约下单
	 * @param {Object} $date 
	 * @param {Object} $goods_id    场地id
	 * @param {Object} $sku_id      具体时间 sku_id
	 * @param {Object} $factory_id  场地区域id
	 * @param {Object} $type_id     预约类型
	 * @param {Object} $user_id*    用户id
	 */
    public function checkKeep($date,$goods_id,$keep_time,$factory_id,$type_id,$user_id){
    	$result = ['code' => 0,'msg'=>''];
    	$goods = Db::name('goods')->field('goods_id,goods_name,goods_img,cat_id,device_sn,device_sn_out')->where(['goods_id'=>$goods_id,'is_on_sale'=>1])->find();
    	$date_time = strtotime($date);
    	$people_num = $type_id == 1?1:request()->param('people_num');
    	/*if($people_num <1 ){
    		$result['msg'] = '请填写人数';
    	}else*/if(empty($goods)){
    		$result['msg'] = '请选择预约场地';
    	}else{
			
			$keep_str = explode('-',$keep_time);
			$keep_start_time = strtotime($date.' '.$keep_str[0]);
			$keep_end_time   = strtotime($date.' '.$keep_str[1]);
			
    		if($keep_start_time > $keep_end_time){
    			$result['msg'] = '开始时间不能大于结束时间';
    		}else{
    			
    			$factory = Db::name('goods_factory')->where(['goods_id'=>$goods_id,'id'=>$factory_id])->find();
    			if(empty($factory)){
    				$result['msg'] = '请选择厂区';
    			}else{
					//验证厂区是否可以预约
					$check_res = $this->check_factory($goods_id,$factory_id,$keep_start_time,$keep_end_time,$type_id);
					
					if($check_res != 1){
						$result['msg'] = $check_res;
					}else{
						
						$price = $type_id == 1?$factory['one_price']:($type_id == 2?$factory['half_price']:$factory['all_price']);
						
						$people_num = $type_id == 1?1:($type_id == 2?intval($factory['people_num']/2):$factory['people_num']);
						$hours        = date('H',$keep_end_time)-date('H',$keep_start_time);
						
						if($type_id == 1){
							$order_amount = $this->getTotalAmount($keep_start_time,$keep_end_time,$goods_id);
						}else{
							$order_amount = $price*$hours;
						}
						
						
						$order_sn     = get_order_sn();
						$insert_pay   = [
							'user_id'    => $user_id,
							'amount'     => $order_amount,
							'type'       => 3,
							'order_sn'   => $order_sn,
							'goods_name' => $goods['goods_name'].'-'.$factory['factory_name'].'厂区预约',
							'pay_code'	 => 'wxpay',
							'add_time'   => time()
						];
						$pay_log_id = Db::name('pay_log')->insertGetId($insert_pay);
						$insert_data = [
							'order_sn'       	=> $order_sn,
							'user_id'			=> $user_id,
							'order_status'		=> 0,	
							'prom_type'			=> 1,
							'pay_status'		=> 0,
							'people_num'		=> $people_num,
							'pay_code'		    => 'wxpay',
							'pay_name'			=> '微信支付',
							'price'				=> $price,
							'order_amount'      => $order_amount,
							'total_amount'      => $order_amount,
							'add_time'			=> time(),
							'keep_start_time'	=> $keep_start_time,
							'keep_end_time'		=> $keep_end_time,
							'date_time'			=> $date_time,
							'factory_name'		=> $factory['factory_name'],
							'factory_id'		=> $factory_id,
							'type_id'			=> $type_id,
							'goods_id'			=> $goods['goods_id'],
							'goods_name'		=> $goods['goods_name'],
							'goods_img'			=> $goods['goods_img'],
							'cat_id'			=> $goods['cat_id'],
							'device_sn'         => $goods['device_sn'],
				            'device_sn_out'     => $goods['device_sn_out'],
							'pay_log_id'        => $pay_log_id
						];
						$order_id = Db::name('place_order')->insertGetId($insert_data);
						place_log_order($order_id,'预约',0,$user_id);
						$result['code'] = 1;
						$result['data'] = $order_sn;
					}
					
    			}
    		}
    	}
    	
    	return $result;
    	
    	
    }
	
	/**
	 * 验证场地
	 * @param {Object} $date 
	 * @param {Object} $goods_id    场地id
	 * @param {Object} $sku_id      具体时间 sku_id
	 * @param {Object} $factory_id  场地区域id
	 * @param {Object} $type_id     预约类型
	 * @param {Object} $user_id*    用户id
	 */
	
	public function check_factory($goods_id,$factory_id,$start_time,$end_time,$type_id){
		
		$res = 1;
		$date_time = strtotime(date('Y-m-d',$start_time));
		
		$where = [
			['goods_id'   ,'=' ,$goods_id],
			['pay_status' ,'=' ,1],
			['factory_id' ,'=' ,$factory_id],
			['date_time'  ,'=' ,$date_time],
			['keep_start_time','between',[$start_time,$end_time]],
			['keep_end_time','between',[$start_time,$end_time]],
		];
		$count = Db::name('place_order')->where($where)->where('type_id',3)->count();
		if($count > 0){
			$res = '该场地已被预约';
		}else{
			$count = Db::name('place_order')->where($where)->where('type_id',2)->count();
			if($count > 1){
				$res = '该场地已被预约';
			}else{
				if($type_id == 2){
					
					$dan_count = Db::name('place_order')->where($where)->where('type_id',1)->count();
					if($count == 1 && $dan_count > 0){
						$res = '该场地已被预约';
					}
					
				}
			}
		}
		return $res;
	}
	
	/**
	 * @param {Object} 场地 id
	 */
	public function checkGoods($goods_id){
		
		$goods  = Db::name('goods')->where(['goods_id'=>$goods_id,'is_on_sale'=>1])->find();
		if($goods){
		    return ['status'=>1,'goods'=>$goods];
		    /*$time = time()-60;
		    if($goods['on_time'] < $time){
		        return ['status' => 0,'msg'=>'设备不在线'];
		    }else{
		        return ['status'=>1,'goods'=>$goods];
		    }*/
			
		}else{
			return ['status' => 0,'msg'=>'场地不存在'];
		}
	}
	
	//计算价格
	public function getTotalAmount($start_time,$end_time,$goods_id){

		$total_amount = 0;
		
		$start_hour = date('H',$start_time);
		$end_hour   = date('H',$end_time);
		
		$sku_list  = $this->getOneTime($start_time,$goods_id);
		rsort($sku_list);
		foreach($sku_list as $key=>$vo){
			
			if($end_hour > $vo['time']){
				
				$time = $start_hour>$vo['time']?$start_hour:$vo['time'];
				$cha_hours    =  $end_hour - $time;
				$end_hour -= $cha_hours;
				$total_amount += $cha_hours*$vo['price'];
				
			}
			
		}
		
		return $total_amount;
	}

}
