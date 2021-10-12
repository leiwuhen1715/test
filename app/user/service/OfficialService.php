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
namespace app\user\service;

use think\Db;
use think\facade\Log;
use EasyWeChat\Factory;
use api\user\service\BraceletService;
use api\user\model\UserNoticeModel;

/**
 * Util for AEAD_AES_256_GCM.
 *
 * @package  WechatPay
 * @author   WeChatPay Team
 */
class OfficialService
{
    private $app;
    private $wx_app_id;
    private $config;
    
    public function __construct()
    {
        $this->config = [
        	'app_id' => 'wxad94c26f24a4db75',
        	'secret' => '982c0b0a292dce50aa05bdbd1a6b834d',
        	'oauth'  => [
    	        'scopes'   => ['snsapi_userinfo'],
    	        'callback' => cmf_get_domain().cmf_url('portal/index/index'),
    	    ]
	    ];
	    $this->wx_app_id = 'wx684818f3e08c08da';
	    //'callback' => cmf_get_domain().cmf_url('portal/index/index'),
        $this->app = Factory::officialAccount($this->config);
    }
    
    public function wx_userinfo(){
        
		$oauth = $this->app->oauth;
		// 获取 OAuth 授权结果用户信息
        $code             = request()->param('code');
        if(empty($code)){
            
            $oauth->redirect()->send();
            exit;
        }else{
        	$user = $oauth->user();
            
        	$wxUserData = $user->getOriginal();
        	$openid = $wxUserData['openid'];
        	$app_id = $this->config['app_id'];
			
        	$findThirdPartyUser = Db::name("third_party_user")->where('openid', $openid)->where('app_id', $app_id)->find();
			
			$ip          = get_client_ip(0, true);
			$currentTime = time();
			
			if ($findThirdPartyUser) {
				
			    $userId = $findThirdPartyUser['user_id'];
			    $userData = [
			        'last_login_ip'   => $ip,
			        'last_login_time' => $currentTime,
			        'login_times'     => Db::raw('login_times+1'),
			        'more'            => json_encode($wxUserData)
			    ];
			    if (isset($wxUserData['unionid'])) {
			        $userData['union_id'] = $wxUserData['unionid'];
			    }
			    Db::name("third_party_user")
			        ->where('openid', $openid)
			        ->where('app_id', $app_id)
			        ->update($userData);
			
			} else {
				
				$is_register = 1;
				
				if(!empty($wxUserData['unionid'])){
					$userId = Db::name("third_party_user")->where('union_id', $wxUserData['unionid'])->value('user_id');
					if($userId) 	$is_register = 0;
				}
				
							
			    //TODO 使用事务做用户注册
				if($is_register == 1){
					/*$f_id = 0;
					$intval = session('intval');
					if(!empty($intval)){
						$f_id = Db::name('user')->where('promo_code',$intval)->value('id');
					}
					$userId = Db::name("user")->insertGetId([
					    'create_time'     => $currentTime,
					    'user_status'     => 1,
					    'user_type'       => 2,
					    'sex'             => $wxUserData['sex'],
					    'user_nickname'   => $wxUserData['nickname'],
					    'avatar'          => $wxUserData['headimgurl'],
					    'last_login_ip'   => $ip,
					    'last_login_time' => $currentTime,
					]);*/
				}
			    Db::name("third_party_user")->insert([
			        'openid'          => $openid,
			        'user_id'         => $userId,
			        'third_party'     => 'ofapp',
			        'app_id'          => $app_id,
			        'last_login_ip'   => $ip,
			        'union_id'        => isset($wxUserData['unionid']) ? $wxUserData['unionid'] : '',
			        'last_login_time' => $currentTime,
			        'create_time'     => $currentTime,
			        'login_times'     => 1,
			        'status'          => 1,
			        'more'            => json_encode($wxUserData)
			    ]);
			    
			}
			//userId
			$user = Db::name("user")->where('id',$userId)->find();
			session('user', $user);
			$data = [
			    'last_login_time' => $currentTime,
			    'last_login_ip'   => $ip,
			];
			Db::name("user")->where('id', $userId)->update($data);
        	$token = cmf_generate_user_token($userId, 'web');
        	if (!empty($token)) {
        	    session('token', $token);
        	}
        }
        

    }
    
    //预约通知
    public function template_send($order_id){
        
		$order = DB::name('league_order')->field('store_id,people_num,coach_new,user_id,goods_id,coach_user_id,start_time,end_time,goods_name')->where("id",$order_id)->find();
		$store = Db::name('supplier')->field('contact_address,contact_phone')->where('id',$order['store_id'])->find();
        $openid = $this->getOpenid($order['user_id']);


        $user_nickname = Db::name('user')->where('id',$order['user_id'])->value('user_nickname');
		$jian_nickname = Db::name('user')->where('id',$order['coach_user_id'])->value('user_nickname');
		$first = "您已经成功预约《".$jian_nickname."》教练课程，人数".$order['people_num']."人。";
		$pagepath = 'pages/my/order/orderDetail?id='.$order_id;
		if($openid){
			$send_data = [
			    'touser' => $openid,
			    'template_id' => 'U30smrtSo7t9uyVP1rqu6WSEjvkZCixVoADcInVoWSQ',
			    'scene' => 1000,
			    "miniprogram" => [
			    	'appid' 	=> $this->wx_app_id,
			    	'pagepath'	=> $pagepath
			    ],
			    'data' => [
			        'first'    => $first,
			        'keyword1' => $user_nickname,       	  //预约人
			        'keyword2' => $order['goods_name'],       //课程内容
			        'keyword3' => date('Y-m-d H:i',$order['start_time']).' ~ '.date('H:i',$order['end_time']),   //上课时间
			        'keyword4' => $store['contact_address'],  //上课地点
			        'keyword5' => $store['contact_phone'],    //联系电话
			        'remark'   => ''               			  //
			    ]
			];
			$res = $this->app->template_message->send($send_data);
			if($res['errcode'] != 0){
				Log::write($res,'official');
			}
			
		
		}
		
		$insert_data = [
			'user_id' => $order['user_id'],
			'add_time'=> time(),
			'title'	  => '课程预约提醒',
			'type'	  => 1,
			'order_id'=> $order_id,
			'ranks'   => $first,
			'wx_url'  => '/'.$pagepath,
			'content' => [
				'预约人' 	=> $user_nickname,
				'课程内容' 	=> $order['goods_name'],
				'上课时间'	=> date('Y-m-d H:i',$order['start_time']).' ~ '.date('H:i',$order['end_time']),
				'上课地点'	=> $store['contact_address'],
				'联系电话'	=> $store['contact_phone']
			]
		];
		$model = new UserNoticeModel;
		$model->save($insert_data);
			
        
        
    }
    
    //上课通知
    public function native_send($order_id){
        
		$order = DB::name('league_order')->field('store_id,people_num,coach_new,user_id,goods_id,coach_user_id,start_time,end_time,goods_name,is_send')->where("id",$order_id)->find();
		if($order['is_send'] == 0){
			$store = Db::name('supplier')->field('supplier_name,contact_address,contact_phone')->where('id',$order['store_id'])->find();
	        $openid = $this->getOpenid($order['user_id']);
	
			$first = "您预约的《".$order['goods_name']."》即将开课，请及时入场";
			$pagepath = 'pages/eg1/eg1?id='.$order_id;
			if($openid){
				$send_data = [
				    'touser' => $openid,
				    'template_id' => 'rFbqP1pWkOwU5pER4PLIfwTVwStug5WAo1BS5kQSyA0',
				    'scene' => 1000,
				    "miniprogram" => [
				    	'appid' 	=> $this->wx_app_id,
				    	'pagepath'	=> $pagepath
				    ],
				    'data' => [
				        'first'    => $first,
				        'keyword1' => date('Y-m-d H:i',$order['start_time']).' ~ '.date('H:i',$order['end_time']),   //上课时间
				        'keyword2' => $store['supplier_name'],  //上课地点
				        'remark'   => '查看入场二维码'            //
				    ]
				];
				$res = $this->app->template_message->send($send_data);
				if($res['errcode'] != 0){
					Log::write($res,'official');
				}
				
			
			}
			
			$insert_data = [
				'user_id' => $order['user_id'],
				'add_time'=> time(),
				'title'	  => '上课提醒',
				'type'	  => 2,
				'order_id'=> $order_id,
				'ranks'   => $first,
				'wx_url'  => '/'.$pagepath,
				'content' => [
					'上课时间'	=> date('Y-m-d H:i',$order['start_time']).' ~ '.date('H:i',$order['end_time']),
					'预约门店'	=> $store['supplier_name']
				]
			];
			$model = new UserNoticeModel;
			$model->save($insert_data);
			Db::name('league_order')->where('id',$order_id)->update(['is_send'=>1]);	
		}
		
    }
    
    //签到通知
    public function sign_send($order_id){
        
		$order = DB::name('league_order')->field('user_id,goods_name')->where("id",$order_id)->find();
		if($order){
			
			$mobile  = Db::name('user')->where('id',$order['user_id'])->value('mobile');
			$first = "签到成功";
			if($mobile){
				$service    = new BraceletService;
				$bra_result = $service->getLast($mobile,$order['user_id']);
				if($bra_result['status'] == 1){
					$first     .= ',共消耗'.$bra_result['calorie'].'卡路里';
				}
				
			}
			
	        $openid = $this->getOpenid($order['user_id']);
			
			$pagepath = 'pages/my/order/order';
			if($openid){
				$send_data = [
				    'touser' => $openid,
				    'template_id' => 'x035MmhJZLzVrjn9STBteB2tKK7MuROxXNoqrsfSFbA',
				    'scene' => 1000,
				    "miniprogram" => [
				    	'appid' 	=> $this->wx_app_id,
				    	'pagepath'	=> $pagepath
				    ],
				    'data' => [
				        'first'    => $first,
				        'keyword1' => $order['goods_name'],   //上课时间
				        'keyword2' => date('Y-m-d H:i:s',time()),  //上课地点
				        'remark'   => ''            //
				    ]
				];
				$res = $this->app->template_message->send($send_data);
				if($res['errcode'] != 0){
					Log::write($res,'official');
				}
				
			}
			
			$insert_data = [
				'user_id' => $order['user_id'],
				'add_time'=> time(),
				'title'	  => '签到成功通知',
				'type'	  => 3,
				'order_id'=> $order_id,
				'ranks'   => $first,
				'wx_url'  => '/'.$pagepath,
				'content' => [
					'课程名称'	=> $order['goods_name'],
					'签到时间'	=> date('Y-m-d H:i:s',time())
				]
			];
			$model = new UserNoticeModel;
			$model->save($insert_data);
			
		}
		
    }
    
    public function getOpenid($user_id){

        $openid = Db::name('third_party_user')->where(['user_id'=>$user_id,'third_party'=>'ofapp'])->value('openid');
        return $openid;
    }
}
