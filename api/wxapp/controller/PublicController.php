<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\wxapp\controller;

use think\Db;
use cmf\controller\RestBaseController;
use wxapp\aes\WXBizDataCrypt;
use api\user\model\UserModel;
use think\Validate;

class PublicController extends RestBaseController
{
    // 微信小程序用户登录 TODO 增加最后登录信息记录,如 ip
    public function login()
    {
        $validate = new Validate([
            'code'           => 'require',
            'encrypted_data' => 'require',
            'iv'             => 'require',
            'raw_data'       => 'require',
            'signature'      => 'require',
        ]);

        $validate->message([
            'code.require'           => '缺少参数code!',
            'encrypted_data.require' => '缺少参数encrypted_data!',
            'iv.require'             => '缺少参数iv!',
            'raw_data.require'       => '缺少参数raw_data!',
            'signature.require'      => '缺少参数signature!',
        ]);

        $data   = request()->param();
        $invite = request()->param('invite');
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        $code          = $data['code'];
        $wxappSettings = cmf_get_option('wxapp_settings');

        $appId = $this->request->header('XX-Wxapp-AppId');
        if (empty($appId)) {
            if (empty($wxappSettings['default'])) {
                $this->error('没有设置默认小程序！');
            } else {
                $defaultWxapp = $wxappSettings['default'];
                $appId        = $defaultWxapp['app_id'];
                $appSecret    = $defaultWxapp['app_secret'];
            }
        } else {
            if (empty($wxappSettings['wxapps'][$appId])) {
                $this->error('小程序设置不存在！');
            } else {
                $appId     = $wxappSettings['wxapps'][$appId]['app_id'];
                $appSecret = $wxappSettings['wxapps'][$appId]['app_secret'];
            }
        }


        $response = cmf_curl_get("https://api.weixin.qq.com/sns/jscode2session?appid=$appId&secret=$appSecret&js_code=$code&grant_type=authorization_code");

        $response = json_decode($response, true);
        if (!empty($response['errcode'])) {
            $this->error('操作失败!');
        }

        $openid     = $response['openid'];
        $sessionKey = $response['session_key'];
        


        $pc      = new WXBizDataCrypt($appId, $sessionKey);
        $errCode = $pc->decryptData($data['encrypted_data'], $data['iv'], $wxUserData);

        if ($errCode != 0) {
            $this->error('操作失败!');
        }

        $findThirdPartyUser = Db::name("third_party_user")
            ->where('openid', $openid)
            ->where('app_id', $appId)
            ->find();

        $currentTime = time();
        $ip          = $this->request->ip(0, true);
		$status = 0;
        $wxUserData['sessionKey'] = $sessionKey;
        unset($wxUserData['watermark']);
		$res_msg = '登录成功';
        if ($findThirdPartyUser) {
            $userId = $findThirdPartyUser['user_id'];
            $token  = cmf_generate_user_token($findThirdPartyUser['user_id'], 'wxapp');

            $userData = [
                'last_login_ip'   => $ip,
                'last_login_time' => $currentTime,
                'login_times'     => Db::raw('login_times+1'),
                'more'            => json_encode($wxUserData)
            ];

            if (isset($response['unionid'])) {
                $userData['union_id'] = $response['unionid'];
            }

            Db::name("third_party_user")
                ->where('openid', $openid)
                ->where('app_id', $appId)
                ->update($userData);

        } else {
        	$f_id = 0;
			if(!empty($invite)){
                $f_id = Db::name('user')->field('id')->where(['promo_code'=>$invite])->value('id');
            }
            //TODO 使用事务做用户注册
            $userId = Db::name("user")->insertGetId([
                'create_time'     => $currentTime,
                'user_status'     => 1,
                'user_type'       => 2,
                'f_id'			  => $f_id,
                'sex'             => $wxUserData['gender'],
                'user_nickname'   => $wxUserData['nickName'],
                'avatar'          => $wxUserData['avatarUrl'],
                'last_login_ip'   => $ip,
                'last_login_time' => $currentTime,
            ]);

            Db::name("third_party_user")->insert([
                'openid'          => $openid,
                'user_id'         => $userId,
                'third_party'     => 'wxapp',
                'app_id'          => $appId,
                'last_login_ip'   => $ip,
                'union_id'        => isset($response['unionid']) ? $response['unionid'] : '',
                'last_login_time' => $currentTime,
                'create_time'     => $currentTime,
                'login_times'     => 1,
                'status'          => 1,
                'more'            => json_encode($wxUserData)
            ]);
            $token = cmf_generate_user_token($userId, 'wxapp');
            Db::name('user_other')->insert(['user_id'=>$userId]);
			$status   = 1;
        }
        
        /*$type_id = Db::name('coupon')->where(['user_id'=>$userId,'type_id'=>2])->value('id');
        if(empty($type_id)){
        	$couponType = Db::name('couponType')->where(['id'=>2,'states'=>1])->find();
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
	                'remark'    	=> $couponType['remark'],
	                'type_id'		=> 2
	            ];
	            Db::name('coupon')->insert($insert_data);
	            $res_msg .= '，获得'.$couponType['amount'].'元优惠券';
	            $status = 1;
			}
        }*/
        
		$model = new UserModel;
        $user  = $model->where('id', $userId)->find();
        $this->success($res_msg, ['token' => $token, 'user' => $user,'status'=>$status]);


    }
	
	
	/**
	 * 获取微信openid
	 */
	public function getOpenid(){
	    $validate = new Validate([
	        'code'           => 'require'
	    ]);
	    $validate->message([
	        'code.require'           => '缺少参数code!'
	    ]);
	    $data = $this->request->param();
	
	    if (!$validate->check($data)) {
	        $this->error($validate->getError());
	    }
	
	    $code          = $data['code'];
	    $wxappSettings = cmf_get_option('wxapp_settings');
	
	    $appId = $this->request->header('XX-Wxapp-AppId');
	    if (empty($appId)) {
	        if (empty($wxappSettings['default'])) {
	            $this->error('没有设置默认小程序！');
	        } else {
	            $defaultWxapp = $wxappSettings['default'];
	            $appId        = $defaultWxapp['app_id'];
	            $appSecret    = $defaultWxapp['app_secret'];
	        }
	    } else {
	        if (empty($wxappSettings['wxapps'][$appId])) {
	            $this->error('小程序设置不存在！');
	        } else {
	            $appId     = $wxappSettings['wxapps'][$appId]['app_id'];
	            $appSecret = $wxappSettings['wxapps'][$appId]['app_secret'];
	        }
	    }
	    $response = cmf_curl_get("https://api.weixin.qq.com/sns/jscode2session?appid=$appId&secret=$appSecret&js_code=$code&grant_type=authorization_code");
	
	    $response = json_decode($response, true);
	    if (!empty($response['errcode'])) {
	        $this->error('操作失败!');
	    }
	
	    $openid     = $response['openid'];
	    $this->success('ok',$openid);
	}
	
	/**
     * 获取用户手机号码
     *
     * @return response
     */
    public function getWechatUserPhone()
    {
        $user_id = $this->getUserId();
        $data    = $this->request->param();
		
		$mobile  = Db::name('user')->where('id',$user_id)->value('mobile');
		if(!empty($mobile)) $this->error('已绑定手机号');
		
        $code          = $data['code'];
        $wxappSettings = cmf_get_option('wxapp_settings');
        $appId = $this->request->header('XX-Wxapp-AppId');
        if (empty($appId)) {
            if (empty($wxappSettings['default'])) {
                $this->error('没有设置默认小程序！');
            } else {
                $defaultWxapp = $wxappSettings['default'];
                $appId        = $defaultWxapp['app_id'];
                $appSecret    = $defaultWxapp['app_secret'];
            }
        } else {
            if (empty($wxappSettings['wxapps'][$appId])) {
                $this->error('小程序设置不存在！');
            } else {
                $appId     = $wxappSettings['wxapps'][$appId]['app_id'];
                $appSecret = $wxappSettings['wxapps'][$appId]['app_secret'];
            }
        }
        $code   =   $data['code'];
        $encryptedData   =   $data['encryptedData'];
        $iv   =  $data['iv'];
        //小程序开发账户
        $res = $this->decryptData($encryptedData,$iv,$code,$appId,$appSecret);
        $res = json_decode($res,true);
        if($res['phoneNumber']){
            Db::name('user')->where('id',$user_id)->update(['mobile'=>$res['phoneNumber']]);
            $model = new UserModel;
			$user  = $model->where('id', $user_id)->find();
			
            $this->success('ok',$user);
        }else{
           $this->error($res);
        }

    }

     /**
     * 检验数据的真实性，并且获取解密后的明文.
     * @param $encryptedData string 加密的用户数据
     * @param $iv string 与用户数据一同返回的初始向量
     * @param $data string 解密后的原文
     *
     * @return int 成功0，失败返回对应的错误码
     */
    public function decryptData($encryptedData, $iv,$code,$appId,$appSecret)
    {
        $getSessionKey = $this->getSessionKey($code,$appId,$appSecret);
        $aesKey     = base64_decode($getSessionKey);
        $aesIV      = base64_decode($iv);
        $aesCipher  = base64_decode($encryptedData);
        $result     = openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);
        $dataObj    = json_decode($result);
        $data = $result;
        return $data;
    }

     /**
     * @param $code
     * @return mixed
     * 获取用户的key
     */
    public function getSessionKey($code,$appId,$appSecret) {
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid=".$appId."&secret=".$appSecret."&js_code=".$code."&grant_type=authorization_code";
        $res = $this->httpRequest($url,'');
        $result = json_decode($res, true);
        return $result['session_key'];
    }

     /**
     *CRUL 网络请求
     */
    public static function httpRequest($url,$data){ // 模拟提交数据函数
        $curl = curl_init(); // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url);                         // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);          // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);          // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);          // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1);             // 自动设置Referer
        curl_setopt($curl, CURLOPT_POST, 1);                    // 发送一个常规的Post请求
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);                 // Post提交的数据包
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);                // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0);                  // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);          // 获取的信息以文件流的形式返回
        $tmpInfo = curl_exec($curl); // 执行操作
        if (curl_errno($curl)) {
            echo 'Errno'.curl_error($curl);//捕抓异常
        }
        curl_close($curl); // 关闭CURL会话
        return $tmpInfo; // 返回数据
    }

}
