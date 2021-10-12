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
use api\user\service\CreatImgService;
use api\user\model\UserModel;
use EasyWeChat\Factory;
use think\Validate;
use think\Db;

class ExtendController extends RestUserBaseController
{

    public function getCode(){
        $user_id = $this->getUserId();
        $code = Db::name('user')->field('promo_code')->where('id',$user_id)->find();
        if(empty($code['promo_code'])){
            $new_code = make_coupon_card();
            Db::name('user')->where('id',$user_id)->update(['promo_code'=>$new_code]);
            $this->success('ok',$new_code);
        }else{
            $this->success('ok',$code['promo_code']);
        }
    }
    
    /**
     * 获取邀请小程序码
     */
    public function getInviteQRCode()
    {

        $type = $this->request->param('type');
        $id   = $this->request->param('id',0,'intval');
        $user_id  = $this->getUserId();
		
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
		
		
		
		$invite = Db::name('user')->where('id',$user_id)->value('promo_code');
		if(empty($invite)){
		    $invite = make_coupon_card();
		    Db::name('user')->where('id',$user_id)->update(['promo_code'=>$invite]);
		}
		$path = "pages/bw/index";
		$scene = 'invite='.$invite;
		$file_path = "qrcode/user/";
		$filename = md5($path.$scene.$appId).".png";
		
		if(!file_exists(WEB_ROOT.'upload/'.$file_path.$filename)){

			$app = Factory::miniProgram($config);
			$response = $app->app_code->getUnlimit($scene, [
				'page'  => $path,
				'width' => 600,
			]);
			if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
				$res = $response->saveAs(WEB_ROOT.'upload/'.$file_path, $filename);
			}else{
				$this->error($response['errmsg']);
			}
		}
		$data = [];
		$data['a_user'] = Db::name('user')->field('avatar,user_nickname')->where('id',$user_id)->find();
		$server = new CreatImgService;
		$res = $server->mergeImage($data,WEB_ROOT.'upload/code_bg.png',WEB_ROOT.'upload/'.$file_path.$filename);
		//$res = $server->mergeImage($data,WEB_ROOT.'upload/code_bg.png',WEB_ROOT.'upload/code_img2.png');
		
		$this->success('ok',cmf_get_image_url($res));
		
    }
    /**
     * 下线
     */
    public function tui()
    {
        $user_id = $this->getUserId();


        $type = $this->request->get('type', 0, 'intval');
        $page = $this->request->get('page', 1, 'intval');
        $limit = $this->request->get('limit', 10, 'intval');
      
		$model = new UserModel();
		$where = [
			'f_id'=>$user_id
		];
		$order = ['id'=>'desc'];
		if($type == 2){
		    $order = ['total_coin'=>'desc','id'=>'desc'];
		}
		$res = $model->field('id,user_nickname,mobile,create_time,avatar')->where($where)->order($order)->paginate($limit);

        

        $this->success('ok!', $res->items());

    }
    /**
     * 下线
     */
    public function lists()
    {
        $user_id = $this->getUserId();


        $type = $this->request->get('type', 0, 'intval');


        $where = [
            'user_id' => $user_id
        ];
        if($type == 0){
            $where['change'] = ['>',0];
        }else{
            $where['change'] = ['<',0];
        }

        $data=Db::name('user_balance_log')->where($where)->order('id','desc')->paginate(10);
        $lists =$data->items();
       
        $this->success('ok!', $lists);

    }

}
