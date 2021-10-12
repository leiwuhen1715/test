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
use api\user\model\LeagueOrderModel;
use api\user\service\CourseService;
use api\user\service\WxPayService;
use api\user\service\CreatImgService;
use EasyWeChat\Factory;
use think\Validate;
use think\Db;

class CourseController extends RestUserBaseController
{

    //订单列表
    public function order(){

        $param = $this->request->param();
        $userId    = $this->getUserId();
        $sercice   = new CourseService;
        $data 	   = $sercice->getList($param,$userId);
        $data_list = $sercice->Handle($data->items());

        $this->success('获取成功!', $data_list);

    }
	//训练记录
	public function trainRecord(){
		$param = $this->request->param();
		$userId    = $this->getUserId();
		$sercice   = new CourseService;
		$data 	   = $sercice->recordList($param,$userId);
		$data_list = $sercice->recordHandle($data->items());
		
		$this->success('获取成功!', $data_list);
	}

    //订单详情
    public function orderDetail(){

        $id = $this->request->get('id', 0, 'intval');
        $userId   = $this->getUserId();
        
        $sercice  = new CourseService;
        $data     = $sercice->orderInfo($id,$userId);

        if($data){

            $this->success('ok', $data);
        }else{
            $this->error('非法操作！');
        }

    }
    
    //赠送课程
    public function orderSend(){
    	$id 	  = request()->get('id', 0, 'intval');
    	$userId   = $this->getUserId();
    	$sercice  = new CourseService;
        $data     = $sercice->orderInfo($id,$userId);
		$wxappSettings = cmf_get_option('wxapp_settings');
		if (empty($wxappSettings['default'])) {
            $this->error('没有设置默认小程序！');
        } else {
            $defaultWxapp = $wxappSettings['default'];
            $appId        = $defaultWxapp['app_id'];
            $appSecret    = $defaultWxapp['app_secret'];
            $config = [
                'app_id'        => $appId,
                'secret'        => $appSecret,
                'response_type' => 'array'
            ];
        }
        
        if($data['allow_send'] == 1){
        	
			if(empty($data['gift_code'])){
				$data['gift_code'] = make_coupon_card();
				Db::name('league_order')->where('id',$id)->update(['gift_code'=>$data['gift_code']]);
			}
			
			$path = "pages/my/order/order_send";
			$path = "pages/eg2/eg2";
			$scene = 'gift_code='.$data['gift_code'];
			
			$file_path = "qrcode/send/";
			$filename = md5($path.$scene.$appId).".png";
		
			if(!file_exists(WEB_ROOT.'upload/'.$file_path.$filename)){
	
				$app = Factory::miniProgram($config);
				$response = $app->app_code->getUnlimit($scene, [
					'page'  => $path,
					'width' => 300,
				]);
				if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
					$res = $response->saveAs(WEB_ROOT.'upload/'.$file_path, $filename);
				}else{
					$this->error($response['errmsg']);
				}
				
			}
			$data['a_user'] = Db::name('user')->field('avatar,user_nickname')->where('id',$data['user_id'])->find();
			$server = new CreatImgService;
			$res = $server->mergeImage($data,WEB_ROOT.'upload/guess-share.jpg',WEB_ROOT.'upload/'.$file_path.$filename);
			
			
			$this->success('ok',cmf_get_image_url($res));
		
        }else{
        	$this->error('不可以赠送');
        }
    }
    
    public function get_gift(){
    	$gift_code = request()->param('gift_code');
    	if(empty($gift_code))	$this->error('非法操作');
    	
    	$user_id    = $this->getUserId();
    	
    	$sercice  = new CourseService;
        $data     = $sercice->giftInfo($gift_code);
        if($data){
        	
        	if(request()->isPost()){
        		if($data['allow_send'] == 1){
        			if($user_id == $data['user_id'])	$this->error('自己不可以领取！');
	        		$insert_data = [
	        			'send_id'	=> $data['id'],
	        			'user_id'	=> $user_id,
	        			'store_id'	=> $data['store_id'],
	        			'time_id'	=> $data['time_id'],
	        			'goods_id'	=> $data['goods_id'],
	        			'coach_id'	=> $data['coach_id'],
	        			'coach_user_id' => $data['coach_user_id'],
	        			'order_status'	=> 2,
	        			'pay_status'	=> 1,
	        			'add_time'		=> time(),
	        			'start_time'	=> $data['start_time'],
	        			'end_time'		=> $data['end_time'],
	        			'goods_name'	=> $data['goods_name'],
	        			'tags'			=> $data['tags'],
	        			'total_amount'	=> $data['total_amount'],
	        			'order_amount'	=> 0,
	        			'people_num'	=> $data['people_num'],
	        			'send_code'		=> 2
	        		];
	        		Db::name('league_order')->insert($insert_data);
	        		Db::name('league_order')->where('id',$data['id'])->update(['send_code'=>1,'order_status'=>4]);
	        		
	        		$this->success('领取成功');
        		}elseif($data['send_code'] == 1){
        			$this->error('课程已被领取');
        		}else{
        			$this->error('课程不能领取');
        		}
        		
        	}
        	
        	$this->success('ok',$data);
        }else{
        	$this->error('课程不存在！');
        }
    	
    	
    }
    //退款订单
    public function refund(){
    	$id = request()->param('id',0,'intval');
    	$userId   = $this->getUserId();
        
        $sercice  = new CourseService;
        $data     = $sercice->orderInfo($id,$userId);
        if($data){
			
        	$data['is_refund'] = 1;
        	if($data['order_status'] == 5){
        		$this->error('预约已退款');
        	}elseif($data['is_refund'] == 1){
        		$result = refund_order($id);
        		if($result['status'] == 1){
        			$this->success('取消成功');
        		}else{
        			$this->error($result['msg']);
        		}
        	}else{
        		$this->error('预约不可以退款');
        	}
        }else{
        	$this->error('预约不存在');
        }
    }
	
	public function sign(){
		
		$userId   = $this->getUserId();
		$id       = request()->param('id',0,'intval');
		
		$model = new LeagueOrderModel();
		$data  = $model->alias('o')->relation(['user','goods'])->where(['pay_status'=>1,'user_id'=>$userId,'time_id'=>$id])->where('order_status','in',[1,2,3])->order('o.id', 'DESC')->find();
		if($data){
			if(request()->isPost()){
				$sercice = new CourseService;
				$res     = $sercice->sign($id,$userId);
				if($res['code'] == 1){
					$res_msg = '签到成功';
					$couponType = Db::name('couponType')->where(['id'=>1,'states'=>1])->find();
					if($couponType){
						$start_time = time();
				        $end_time   = $start_time + 24*3600*$couponType['days'];
						$insert_data = [
			                'add_time'  	=> time(),
			                'user_id'   	=> $userId,
			                'start_time'	=> $start_time,
			                'end_time'  	=> $end_time,
			                'type'      	=> $couponType['type'],
			                'amount'    	=> $couponType['amount'],
			                'total_amount'  => $couponType['total_amount'],
			                'name'      	=> $couponType['name'],
			                'remark'    	=> $couponType['remark']
			            ];
			            Db::name('coupon')->insert($insert_data);
			            $res_msg .= '，获得'.$couponType['amount'].'元优惠券';

					}
					$this->success($res_msg);
				}else{
					$this->error($res['msg']);
				}
			}
			$data['time_str'] = date('m-d',$data['start_time']).' '.date('H:i',$data['start_time']).' ~ '.date('H:i',$data['end_time']);
			$this->success('ok',$data);
		}else{
			$this->error('课程不存在');
		}
	}
	
	/**
     * 删除订单
     */
    public function delete(){

        $id = $this->request->param('id',0,'intval');

        $userId   = $this->getUserId();
        $OrderService = new OrderService;
        $data = $OrderService->orderInfo($id,$userId);
   
        if($data['order_status'] == 4){
			
            $this->success('删除成功！');
        }else{
            $this->error('订单不能删除');
        }

    }

}
