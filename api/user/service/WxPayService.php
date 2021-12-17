<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace api\user\service;

use EasyWeChat\Factory;
use think\facade\Log;
use think\Db;
use think\db\Query;

class WxPayService
{
    protected $app;
    
    function __construct() {

        $config = [
            'app_id'             => 'wxa2218649def4a7c4',
            'secret'			 => '',
    	    'mch_id'             => '1615463112',
    	    'key'                => 'ize0VrXBGySH7q1GA7nmTeQhy6WrQh0o',
    	    'cert_path'          => CMF_DATA.'cert/wechat/apiclient_cert.pem', // XXX: 绝对路径！！！！
    	    'key_path'           => CMF_DATA.'cert/wechat/apiclient_key.pem',      // XXX: 绝对路径！！！！
    	    'notify_url'         => '',     // 你也可以在下单时单独设置来想覆盖它
            'response_type' => 'array',
            'log' => [
                'level' => 'debug',
                'file' => __DIR__.'/wechat.log',
            ],
        ];
        
        $this->app = Factory::payment($config);

    }
    public function app_pay($data) {
        //统一下单接口
        $notify_url = cmf_get_domain().'/api/home/notify/wxpay';
        
        $result = $this->app->order->unify([
		    'body' 				=> $data['goods_name'],
		    'out_trade_no'  	=> $data['out_trade_no'],
		    'total_fee' 		=> $data['total_fee']*100,
		    'spbill_create_ip' 	=> '', // 可选，如不传该参数，SDK 将会自动获取相应 IP 地址
		    'notify_url' 		=> $notify_url, // 支付结果通知网址，如果不设置则会使用配置里的默认地址
		    'trade_type' 		=> 'APP', // 请对应换成你的支付方式对应的值类型
		]);
		
		if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
			$jssdk  = $this->app->jssdk;
			$config = $jssdk->appConfig($result['prepay_id']);
			// $config = $this->app->configForAppPayment($result['prepay_id']);
			
		}
		
        return $config;
    }
	//小程序支付
	public function wxapp_pay($data) {
		//统一下单接口
		$notify_url = cmf_get_domain().'/api/home/notify/wxpay';
	
		$result = $this->app->order->unify([
			'body' 				=> $data['goods_name'],
			'out_trade_no'  	=> $data['out_trade_no'],
			'total_fee' 		=> $data['total_fee']*100,
			'spbill_create_ip' 	=> '', // 可选，如不传该参数，SDK 将会自动获取相应 IP 地址
			'notify_url' 		=> $notify_url, // 支付结果通知网址，如果不设置则会使用配置里的默认地址
			'trade_type' 		=> 'JSAPI', // 请对应换成你的支付方式对应的值类型
			'openid'			=> $data['openid']
		]);
		
		if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
			$jssdk  = $this->app->jssdk;
			$config = $jssdk->bridgeConfig($result['prepay_id'],false);
			// $config = $this->app->configForAppPayment($result['prepay_id']);
			
		}else{

            throw new \Exception($result['return_msg']);

		}
		
		return $config;
		
	}
	
	public function refund($data){
	    // 参数分别为：商户订单号、商户退款单号、订单金额、退款金额、其他参数
        
        $result = $this->app->refund->byOutTradeNumber($data['order_sn'], $data['refund_sn'], $data['order_amount']*100, $data['refund_amount']*100, [
            // 可在此处传入其他参数，详细参数见微信支付文档
            'refund_desc' => $data['refund_desc'],
        ]);
        $res = [
            'code' => 0,
            'msg'  => ''
        ];
        
        if($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $res['code'] = 1;
        }elseif($result['return_code'] == 'FAIL'){
            $res['msg'] = $result['return_msg'];
        }else{
            $res['msg'] = $result['err_code_des'];
        }
        
        return $res;
        
	}
	
	public function notify(){
		$response = $this->app->handleNotify(function($notify, $successful){
			Log::write($notify,'wxapy');
		    // 使用通知里的 "微信支付订单号" 或者 "商户订单号" 去自己的数据库找到订单
		    $order = $notify->out_trade_no;
		    return true; // 返回处理完成
		});
		Log::write($response,'wxapy');
		return $response;
	}
	
	public function getApp(){
		return $this->app;
	}
	
	public function toBalance($order_id){
	    
	    $result = ['status'=>0,'msg'=>''];
        $one = Db::name('recharge_order')->where(['id'=>$order_id,'order_type'=>1])->find();
        if($one['pay_status'] == 1){
            
            $result['msg'] = '该订单已处理';
            
        }else{
            
            
            $openid = Db::name('third_party_user')->where('user_id',$one['user_id'])->order('create_time','desc')->value('openid');
            
            $money  = $one['order_amount']*100;
            $res = $this->app->transfer->toBalance([
                'partner_trade_no'  => $one['order_sn'], // 商户订单号，需保持唯一性(只能是字母或者数字，不能包含有符号)
                'openid'            => $openid,
                'check_name'        => 'NO_CHECK', // NO_CHECK：不校验真实姓名, FORCE_CHECK：强校验真实姓名
                // 're_user_name'      => '', // 如果 check_name 设置为FORCE_CHECK，则必填用户真实姓名
                'amount'            => $money, // 企业付款金额，单位为分
                'desc'              => '提现', // 企业付款操作说明信息。必填
            ]);
            if($res['return_code'] == 'SUCCESS' && $res['result_code'] == 'SUCCESS'){
                $update = [
                    'pay_time'   => time(),
                    'pay_status' => 1
                ];
                Db::name('recharge_order')->where('id',$order_id)->update($update);
                $result['status'] = 1;
            }else{
                $result['msg'] = $res['return_msg'];
            }
        }
        return $result;
	}
    

}
