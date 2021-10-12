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


use api\user\model\PlaceOrderModel;
use api\user\model\PlaceCodeModel;
use api\goods\service\PlaceServer;
use api\user\service\DoorService;
use think\db\Query;
use think\Db;

class PlaceOrderService
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

        $OrderModel = new PlaceOrderModel();

        $field = 'o.*';
        $where=[
            ['o.user_id'     , '=' , $userId],
			['o.delete_time' , '=' , 0]
        ];
		
        $whereor = '';
        $filter['type']= empty($filter['type'])?0:$filter['type'];
        if($filter['type'] == 1){
			//待付款
            $where[] = ['o.order_status','=',3];
        }elseif($filter['type'] == 2){
			//待使用
            $where[] = ['prom_type','=',1];
            $where[] = ['o.pay_status','=',1];
			
        }elseif($filter['type'] == 3){
			//使用中
			$whereor = "(o.prom_type = 0 and o.order_status in (0,1)) or (o.prom_type = 1 and o.pay_status = 1 and o.order_status in (0,1))";

        }elseif($filter['type'] == 4){
			//已完成
            $where[] = ['o.order_status','=',2];

        }
        $list = $OrderModel->alias('o')->field($field)->where($where)->where($whereor)->order('o.order_id','DESC')->paginate(10);
			
        return $list;

    }

    /**
     * 用户订单状态
     */
    public function Handle($data){
		
        foreach ($data as $key => $value) {
			$data[$key] = $this->Hand($value);
        }
        return $data;
    }


    public function Hand($data){

		//status_id 1：进场，2：出场，3：支付，4：删除
        $data['status_id'] = 0;
        $data['is_tui']    = 0;
        $data['caozuo']    = '';
      
		switch($data['prom_type']){
			//游客
			case 0:
			    if($data['order_status'] == 4){
					
					$data['status']    = '已取消';
				}elseif($data['order_status'] == 3){
					
					$data['status']    = '待付款';
					$data['caozuo']    = '立即付款';
					$data['status_id'] = 3;
				}elseif($data['order_status'] == 2){
					
					$data['status'] = '已完成';
					
				}elseif($data['order_status'] == 1){
					
					$data['status'] = '待出场';
					if($data['pay_status'] == 1){
					    
						$data['caozuo']    = '出场码';
						$data['status_id'] = 2;
						
					}else{
					    
					    $data['caozuo']    = '立即出场';
						$data['status_id'] = 2;
					}
					
				}elseif($data['order_status'] == 0){
					
					$data['status'] = '待入场';
					if($data['pay_status'] == 0){
						
						$data['caozuo']    = '立即入场';
						$data['status_id'] = 1;
						
					}
				}
				break;
			//预约
			case 1:
				if($data['order_status'] == 4){
					
					$data['status']    = '已取消';
				}elseif($data['order_status'] == 2){
					
					$data['status'] = '已完成';
					
				}elseif($data['order_status'] == 1){
					
					$data['status']    = '待出场';
					$data['caozuo']    = '出场码';
					$data['status_id'] = 2;
						
					
				}elseif($data['order_status'] == 0){
					
					
					if($data['pay_status'] == 1){
						$data['status'] = '待入场';
						$data['caozuo']    = '立即进场';
						$data['status_id'] = 1;
					}else{
						$data['status']    = '未支付';
						$data['caozuo']    = '删除预约';
						$data['status_id'] = 4;
					}
				}
				break;
		}
		
        return $data;
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
    public function orderInfo($id, $userId = 0)
    {
        $OrderModel =   new PlaceOrderModel();
        $placeCode   =   new PlaceCodeModel();

        $where=[
            'order_id'  =>  $id,
			'user_id'   =>  $userId
        ];
		
        $order_info =   $OrderModel->where($where)->find();
        if($order_info){
            $order_info =   $this->Hand($order_info);
            if($order_info['prom_type'] == 1){
                $order_info->place_in_code  = $placeCode->field('img')->where(['order_id'=>$id,'open_type'=>0])->select();
                $order_info->place_out_code = $placeCode->field('img')->where(['order_id'=>$id,'open_type'=>1])->select();
            }
        }


        return $order_info;
    }
	
	//订单入场人数
	public function orderJoiNum($order_id){
		
		$count = Db::name('place_open')->where('order_id',$order_id)->count();
		
	}
	
	
	/**
	 * 游客离场验证
	 * @param {Object} $order_id  订单id
	 */
	public function againTouristPrice($order_id){
		$result = [
			'status' => 0,
			'msg'    => ''
		];
		$order = Db::name('place_order')->where('order_id',$order_id)->find();
		if($order['order_status'] == 2){
			$result['msg'] = '订单已完成';
		}else{
			$end_time = $order['start_time'] + 15*60;
			
			
			$is_vip = Db::name('user')->where('id',$order['user_id'])->value('is_vip');
			if($is_vip == 1){
				
				$result['status'] = 1; //未超过15分钟开门
				
			}elseif($end_time > time()){
				
				$result['status'] = 1; //未超过15分钟开门
				
			}else{
				$result_amount = $this->getTotalAmount($order_id);
				
				$order_amount  = $result_amount['total_amount'];
				$result['over_time']     = $result_amount['over_time'];
				$result['total_amount']  = $result_amount['total_amount'];
				//超过15分钟付款或者价格未变
				if($order_amount == 0){
				    $result['status'] = 1; //价格为0
				}elseif($order_amount == $order['order_amount']){
					//检测当天是否结束
					$last_end_time = strtotime(date('Y-m-d',$order['start_time']).' 23:00:00');
					//echo $last_end_time.'--'.time();
					if(time() > $last_end_time){
						Db::name('place_order')->where('order_id',$order_id)->update(['end_time'=>$last_end_time,'order_status'=>3]);
						place_log_order($order_id,'超时自动结算',2,$order['user_id']);
					}
					
					$result['status']   = 2;
					$result['order_sn'] = $order['order_sn'];
					
				}else{
					
					//支付记录
					$insert_pay   = [
						'user_id'    => $order['user_id'],
						'amount'     => $order_amount,
						'type'       => 3,
						'order_sn'   => $order['order_sn'],
						'goods_name' => $order['goods_name'],
						'pay_code'	 => 'wxpay',
						'add_time'   => time(),
						'order_id'	 => $order_id
					];
					$pay_log_id = Db::name('pay_log')->insertGetId($insert_pay);
					
					$update = [
						'end_time' 		=> time(),
						'order_amount'	=> $order_amount,
						'pay_log_id'	=> $pay_log_id,
						'order_status'	=> 1
					];
					//检测当天是否结束
					$last_end_time = strtotime(date('Y-m-d',$order['start_time']).' 23:59:59');
					if(time() > $last_end_time){
						$update['end_time']     = $last_end_time;
						$update['order_status'] = 3;
						place_log_order($order_id,'超时自动结算',2,$order['user_id']);
					}
					Db::name('place_order')->where('order_id',$order_id)->update($update);
					
					$result['status']   = 2;
					$result['order_sn'] = $order['order_sn'];
					
				}
			}
		}
		if($result['status'] == 1){
		    $one = Db::name('place_code')->where(['order_id'=>$order_id,'open_type'=>1])->where('end_time','>',time())->count();
		    if($one <= 0){
		        $in_data   = [
    				'order_id'  => $order_id,
    				'device_sn' => $order['device_sn_out'],
    				'user_id'   => $order['user_id'],
    				'start'     => time(),
    				'end'       => time()+5*60,
    			];
    			$door = new DoorService();
    			$door->rule_b($in_data,1);
		    }
			
// 			Db::name('place_order')->where('order_id',$order_id)->update(['order_status'=>2,'end_time'=>time()]);
// 			place_log_order($order_id,'游客离场',2,$order['user_id']);
		}
		return $result;
		
	}
	
	/**
	 * 预约离场验证
	 * @param {Object} $order_id  订单id
	 */
	public function againKeepPrice($order_id){
		
		$result = [
			'status' => 0,
			'msg'    => ''
		];
		$order = Db::name('place_order')->where('order_id',$order_id)->find();
		if($order['order_status'] == 2){
			$result['msg'] = '订单已完成';
		}else{
			
			if($order['keep_end_time'] > time()){
				$result['status'] = 1; //预约时间未到
			}else{
				$keep_end_hour = date('H',$order['keep_end_time']);
				$end_hour   = date('H');
				if($keep_end_hour == $end_hour){
					$result['status'] = 1; //预约时间未到
				}else{
					$last_end_time = strtotime(date('Y-m-d',$order['start_time']).' 23:59:59');
					
					//检测当天是否结束
					if(time() > $last_end_time){
						
						Db::name('place_order')->where('order_id',$order_id)->update(['order_status'=>2,'end_time'=>$last_end_time]);
						place_log_order($order_id,'超时自动结算',2,$order['user_id']);
						$result['msg'] = '当天结束，订单已完成';
					}else{
						$result_amount = $this->getTotalAmount($order_id);
						$order_amount  = $result_amount['total_amount'];
						$result['over_time']     = $result_amount['over_time'];
						$result['total_amount']  = $result_amount['total_amount'];
						
						$end_time     = strtotime(date('Y-m-d H').':59:59');
						$order_sn = Db::name('place_order_sub')->where(['order_id'=>$order_id,'end_time'=>$end_time,'pay_status'=>0])->value('order_sn');
						if(!$order_sn){
							
							$order_sn     = get_order_sn();
							
							$insert_order = [
								'order_id'   => $order_id,
								'start_time' => $order['keep_end_time'],
								'end_time'   => $end_time,
								'add_time'   => time(),
								'order_sn'   => $order_sn,
								'amount'     => $order_amount,
								'pay_status' => 0,
								'pay_time'   => 0
							];
							Db::name('place_order_sub')->insert($insert_order);
							//第一次付款 - 支付记录
							$insert_pay   = [
								'user_id'    => $order['user_id'],
								'amount'     => $order_amount,
								'type'       => 4,
								'order_sn'   => $order_sn,
								'goods_name' => $order['goods_name'].'超时补价',
								'pay_code'	 => 'wxpay',
								'add_time'   => time(),
								'order_id'	 => $order_id
							];
							$pay_log_id = Db::name('pay_log')->insertGetId($insert_pay);
						}
						
						$result['status']   = 2;
						$result['order_sn'] = $order_sn;
					}
					
				}
					
				
			}
		}
		
		return $result;
		
	}
	
	//开门
	public function doorOpen($userId,$order_id,$device_sn,$open_type=0){
		$insert_open_data = [
			'user_id'   => $userId,
			'order_id'  => $order_id,
			'add_time'  => time(),
			'device_sn' => $device_sn,
			'open_type' => $open_type
		];
		Db::name('place_open')->insert($insert_open_data);
		$field = $open_type==0?'join_num':'out_num';
		Db::name('place_order')->where('order_id',$order_id)->setInc($field);
		
	}
	//计算价格
	public function getTotalAmount($order_id){
		$result = ['total_amount'=>0,'over_time'=>0];
		$total_amount = 0;
		$order = Db::name('place_order')->where('order_id',$order_id)->find();
		//检测当天是否结束
		$last_end_time = strtotime(date('Y-m-d',$order['start_time']).' 23:00:00');
		$last_end_time = (time() > $last_end_time)?$last_end_time:time();
		$end_hour      = intval(date('H',$last_end_time))+1;
		
	    
	    
		if($order['prom_type'] == 0){
			
			$start_time = $order['start_time']+15*60;
			$hour = $this->get_hours($start_time,$last_end_time);
			$start_hour = date('H',$start_time);
			/*if($hour > 1){
			    if(($start_time%3600) != 0){
			        $start_hour = $start_hour+1;
			        $hour       = $hour+1;
			    }
			    
			}*/
			
			//$start_hour = date('H',$start_time);
			$end_hour   = $start_hour+$hour;
            
			$server    = new PlaceServer;
			$sku_list  = $server->getOneTime(time(),$order['goods_id']);
			rsort($sku_list);
	
			foreach($sku_list as $key=>$vo){
				
				if($end_hour > $vo['time']){
					
					$time       =  $start_hour>$vo['time']?$start_hour:$vo['time'];
					$cha_hours  =  $end_hour - $time;
					$end_hour   -= $cha_hours;
					$result['total_amount'] += $cha_hours*$vo['price'];
					
				}
				
			}
			
		}else{
			$start_time    = $order['keep_end_time'];
			$keep_end_hour =  date('H',$order['keep_end_time']);
			$cha_hours     =  $end_hour - $keep_end_hour;
			$result['total_amount']  = $cha_hours*$order['price'];
			
		}
		$date_m = date('m',time());
		$date_d = date('d',time());
		if($date_m == 8 && $date_d == 8){
		    $result['total_amount'] = 0;
		}
		$result['over_time']  = $this->s_to_hs($last_end_time-$start_time);
		return $result;
	}
	public function get_hours($start_time,$end_time){
	    
	    $miao = $end_time-$start_time;
	    $h    = ceil($miao/3600);
	    return $h;
	}
	function s_to_hs($v=0){
	    $h=floor($v/3600);
		if($h<10){$h='0'.$h;}
		$t=$v%3600;
		$m=ceil($t/60);
		if($m<10){$m='0'.$m;}
		return $h.'时'.$m.'分';
	}
	/**
	 * @param {Object} 场地 id
	 */
	public function checkDevice($device_sn){
		return 1;
		$on_time  = Db::name('goods')->where(['device_sn'=>$device_sn])->value('on_time');
		if($on_time){
		    $time = time()-60;
		    if($on_time < $time){
		        return 0;
		    }else{
		        return 1;
		    }
			
		}else{
			return 0;
		}
	}
    public function orderNum($userId = 0){
        $data=[];
        $OrderModel =   new OrderModel();
        $where=[
            'user_id'   => $userId,
            'pay_status'=> 0,
            'order_status'=>['<>',4]
        ];
        $data['nopay']  = $OrderModel->where($where)->count();
        $where['order_status']=1;
        $where['pay_status']=1;
        $where['shipping_status']=0;
        $data['waitShip']   = $OrderModel->where($where)->count();
        $where['order_status']=1;
        $where['pay_status']=1;
        $where['shipping_status']=1;
        $data['waitInvalid']   = $OrderModel->where($where)->count();
        return $data;
    }


}
