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
use api\user\service\PlaceOrderService;
use cmf\controller\RestBaseController;
use EasyWeChat\Factory;
use think\Db;
use think\Validate;

class PlaceOrderController extends RestUserBaseController
{

    //订单列表
    public function order(){
		$param     = request()->param();
        $userId    = $this->getUserId();
        $service   = new PlaceOrderService;
        $data      = $service->getList($param,$userId);
        $data_list = $service->Handle($data->items());

        $this->success('获取成功!', $data_list);

    }

    //订单详情
    public function orderDetail(){

        $id = $this->request->get('id', 0, 'intval');

        $userId   = $this->getUserId();
        $service  = new PlaceOrderService;
        $data     = $service->orderInfo($id,$userId);

        if($data){

            $result=[
                'order_info'=> $data
            ];
            $this->success('ok', $result);
        }else{
            $this->error('非法操作！');
        }

    }
	//支付详情
	public function orderPayDetail(){
		$order_sn = $this->request->get('order_sn');
		$userId   = $this->getUserId();
		$order_id = Db::name('place_order')->where(['order_sn'=>$order_sn,'user_id'=>$userId])->order('order_id','desc')->value('order_id');
		if(!$order_id)$order_id = Db::name('place_order_sub')->where(['order_sn'=>$order_sn])->order('order_id','desc')->value('order_id');
		
		$service  = new PlaceOrderService;
		$data     = $service->orderInfo($order_id,$userId);
		if($data){
			if($data['status_id'] == 2){
				
				if($data['prom_type'] == 0){
					//游客
					$res = $service->againTouristPrice($order_id);
				}else{
					//预约
					$res = $service->againKeepPrice($order_id);
				}
				if($res['status'] == 2){
					$data['over_time']    = $res['over_time'];
					$data['total_amount'] = $res['total_amount'];
				}
				
			}
			
		    $result=[
		        'order_info'=> $data
		    ];
		    $this->success('ok', $result);
		}else{
		    $this->error('非法操作！');
		}
		
	}
    //进场
	public function comeOn(){
		$id       = request()->param('id',0,'intval');
		$userId   = $this->getUserId();
		$service  = new PlaceOrderService;
		$data     = $service->orderInfo($id,$userId);
		if($data['status_id'] == 1 || $data['status_id'] == 2){
		    
		    $is_on = $service->checkDevice($data['device_sn']);
		    if($is_on == 0)  $this->error('设备不在线');
		    
		    if($data['prom_type'] == 0){
		        
		        $img = Db::name('place_code')->where(['order_id'=>$id,'open_type'=>0])->order('id','desc')->value('img');
		        $res = ['img'=>cmf_get_image_url($img)];
   
		    }else{
		        
		        $number = request()->param('number',0,'intval');
		        
		        $start_time = strtotime($data['keep_start_time']);
     			//if($start_time > time()){
    				// $this->error('预约时间未到');
    				// 
       			//}else{
    			    
    				/*$end_time = Db::name('place_order')->where('order_id',$id)->value('keep_end_time');
    				
    				if($end_time < time()){
    					Db::name('place_order')->where('order_id',$id)->update(['order_status'=>1]);
    					$this->error('预约时间已结束');
    				}
    				$service->doorOpen($userId,$id,$data['device_sn']);
    				if($data['join_num'] == 0)Db::name('place_order')->where('order_id',$id)->update(['start_time'=>time()]);
    				if(($data['join_num']+1) >= $data['people_num'])Db::name('place_order')->where('order_id',$id)->update(['order_status'=>1]);
    				
    				place_log_order($id,'预约入场',1,$userId);*/
    				//Db::name('place_order')->where('order_id',$id)->update(['order_status'=>1]);
    				$img = Db::name('place_code')->where(['order_id'=>$id,'open_type'=>0,'number'=>$number])->order('id','desc')->value('img');
    				$res = ['img'=>cmf_get_image_url($img)];
    				
                //}
		    }
		    $this->success('ok',$res);
			
			
		}else{
			$this->error('不能操作！');
		}
	}
	//离场
	public function comeOut(){
		
		$id       = request()->param('id',0,'intval');
		
		$userId   = $this->getUserId();
		$service  = new PlaceOrderService;
		$data     = $service->orderInfo($id,$userId);
		if($data['status_id'] == 2 || $data['order_status'] == 2){
		    $is_on = $service->checkDevice($data['device_sn']);
		    if($is_on == 0)  $this->error('设备不在线');
			if($data['prom_type'] == 0){
				//游客
				if($data['order_status'] == 2){
				    $img = Db::name('place_code')->where(['order_id'=>$id,'open_type'=>1])->order('id','desc')->value('img');
		            $res = ['status'=>1,'img'=>cmf_get_image_url($img)];
		            
					$this->success('ok',$res);
				}else{
				    $res = $service->againTouristPrice($id);
    				if($res['status'] == 1 || $data['pay_status'] == 1){
    					$res['status'] = 1;
    					$img = Db::name('place_code')->where(['order_id'=>$id,'open_type'=>1])->order('id','desc')->value('img');
    		            $res['img'] = cmf_get_image_url($img);
    		            
    					$this->success('ok',$res);
    				}else{
    					$this->success('ok',$res);
    				}
				}
				
			}else{
			    
			    $number = request()->param('number',0,'intval');
    			$img = Db::name('place_code')->where(['order_id'=>$id,'open_type'=>1,'number'=>$number])->order('id','desc')->value('img');
    			$res = ['status'=>1,'img' => cmf_get_image_url($img)];
				$this->success('ok',$res);
				//预约
				$res = $service->againKeepPrice($id);
				if($res['status'] == 1){
				    
					$people_num = $data['people_num'];
				    
					/*$service->doorOpen($userId,$id,$data['device_sn'],1);
					Db::name('place_order')->where('order_id',$id)->update(['end_time'=>time()]);
					if(($data['out_num']+1) >= $people_num){
						Db::name('place_order')->where('order_id',$id)->update(['order_status'=>2]);
					}*/
					place_log_order($id,'预约离场',2,$userId);
					$res['img'] = cmf_get_image_url('1.png');
					$this->success('ok',$res);
				}else{
					$this->success('ok',$res);
				}
			}
			
			
		}else{
			$this->error('不能操作');
		}
	}
	public function comeQr(){
	    $id = request()->param('id',0,'intval');
	    
	    $img = Db::name('place_code')->where(['order_id'=>$id,'open_type'=>1])->where('end_time','>',time())->order('id','desc')->value('img');
	    if($img){
	        $res = cmf_get_image_url($img);
		    $this->success('ok',$res);
	    }else{
	        $this->error('no');
	    }
	}
	/*
	*检测订单
	*/
	public function checkOrder(){
	    $id   = request()->param('id',0,'intval');
	    $type = request()->param('type',0,'intval');
	    
	    $one = Db::name('place_order')->where(['order_id'=>$id])->find();
	    if($one){
	        if($type == 0){
	            if($one['order_status'] == 1){
	                $this->success('ok');
	            }else{
	                $this->error('no');
	            }
	        }else{
	            if($one['order_status'] == 2){
	                $this->success('ok');
	            }else{
	                $this->error('no');
	            }
	        }
		    
	    }else{
	        $this->error('no');
	    }
	}
    /**
     * 删除订单
     */
    public function delete(){

        $id = $this->request->param('id',0,'intval');

        $userId   = $this->getUserId();
        $service  = new PlaceOrderService;
        $data     = $service->orderInfo($id,$userId);
   
        if($data['status_id'] == 4){
			
            Db::name('place_order')->where('order_id',$id)->update(['delete_time'=>time(),'order_status'=>4]);
			place_log_order($id,'删除订单',5,$userId);
			
            $this->success('删除成功！');
        }else{
            $this->error('订单不能删除');
        }
    }
    /**
     * 取消订单
     */
    public function cancel(){

        $id = $this->request->param('id',0,'intval');

        $userId   = $this->getUserId();
        $service  = new PlaceOrderService;
        $data     = $service->orderInfo($id,$userId);
   
        if($data['status_id'] == 1 && $data['prom_type'] == 0){
			
            Db::name('place_order')->where('order_id',$id)->update(['delete_time'=>time(),'order_status'=>4]);
			place_log_order($id,'取消订单',5,$userId);
			
            $this->success('取消成功！');
        }else{
            $this->error('订单不能取消');
        }
    }
	/*检测开么是否成功*/
	public function checkOpen(){
		$id  = request()->param('id',0,'intval');
		$open_status = Db::name('place_open')->where('order_id',$id)->order('id','desc')->value('open_status');
		if($open_status == 1){
			$this->success('ok');
		}else{
			$this->error('未开门');
		}
	}
	
    public function getOpen(){
        $userId    = $this->getUserId();
        $data = Db::name('third_party_user')->field('openid')->where('user_id',$userId)->find();
        $this->success("ok",$data);
    }



}
