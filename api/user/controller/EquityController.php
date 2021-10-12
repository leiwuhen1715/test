<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\user\controller;

use cmf\controller\RestBaseController;
use api\user\model\UserGroupCardModel;
use api\user\model\UserRankModel;
use api\user\model\UserModel;

use EasyWeChat\Factory;
use think\Db;


class EquityController extends RestBaseController
{

    public function index(){

        $input = $this->request->param();
        $type  = request()->param('type',0,'intval');
        $model = new UserGroupCardModel();
		$list  = $model->order(['list_order'=>'asc','id'=>'desc'])->select();
      
        $this->success('ok', $list);
    }
    

    /**
     * 开通会员
     */
    public function card_open(){
        $user_id = $this->getUserId();
        $id = request()->param('id',0,'intval');
        
        
        $one = Db::name('user_group_card')->where('id',$id)->where('status',1)->find();
        if($one){
        	
			$order_amount = $one['price'];
			$order_sn = Db::name('user_card_order')->where(['user_id'=>$user_id,'goods_id'=>$id,'pay_status'=>0,'order_amount'=>$order_amount])->value('order_sn');
			if(!$order_sn){
				$order_sn = get_order_sn();
				
				$pay_data = [
				    'amount'     => $order_amount,
				    'type'       => 1,
				    'order_sn'   => $order_sn,
					'goods_name' => '开通'.$one['title'],
					'pay_code'	 => 'wxpay',
					'add_time'   => time(),
					'user_id'    => $user_id
				];
				$pay_id = Db::name('pay_log')->insertGetId($pay_data);
				
				$data = [
				    'user_id'       => $user_id,
				    'add_time'      => time(),
				    'goods_id'      => $id,
				    'order_sn'      => $order_sn,
				    'order_amount'  => $order_amount,
				    'goods_price'   => $one['price'],
				    'type'          => $one['type'],
				    'cycle'         => $one['days'],
				    'goods_name'    => $one['title'],
					'pay_name' 		=> '微信支付'
				];
				$order_id = Db::name('user_card_order')->insertGetId($data);
				
			}
            
            $this->success('ok',$order_sn);
        }else{
            $this->error('您开通的会员不存在！');
        }

    }
    /**
     * 获取会员卡
     */
    public function getCard(){
        $user_id = $this->getUserId();
        $one = Db::name('user_card')->where('user_id',$user_id)->find();
        if($one){
            check_reveiw($user_id);
            $one['start_time'] = date('Y-m-d',$one['start_time']);
            $one['end_time']   = date('Y-m-d',$one['end_time']);
        }
        $this->success('ok',$one);
    }
    /**
     * 获取核销二维码
     */
    public function getCardCode(){
        $user_id = $this->getUserId();
        $type = request()->param('type',0,'intval');
        $id = request()->param('id',0,'intval');
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
        $id = empty($id)?$user_id:$id;
        $path = "pages/user/mine-card/hexiao";

        $scene = 'type='.$type.'&id='.$id;
        $filename = "qrcode/".md5($path.$scene.$id.$appId).".png";

        if(file_exists('../upload/'.$filename)){



        }else{
            $app = Factory::miniProgram($config);

            $response = $app->app_code->getUnlimit($scene, [
                'page'  => $path,
                'width' => 600,
            ]);
            if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
                $name = md5($path.$scene.$id.$appId).'.png';
                $response->saveAs('../upload/qrcode', $name);
            }else{
                $this->error($response['errmsg']);
            }

        }
        $images = cmf_get_image_url($filename);
        $this->success('ok',$images);


    }
    
    public function levelist(){
    	
    	$model  = new UserRankModel;
    	$list   = $model->order('user_level','asc')->select()->toarray();
    	
    	$this->success('ok',$list);
    }
    
    public function userlevel(){
    	
    	$user_id = $this->getUserId();
    	$user = Db::name('user')->field('total_score,user_level')->where('id',$user_id)->find();
    	
    	$level_list = Db::name('user_rank')->where('status',1)->order('user_level','asc')->select()->toarray();
    
    	if(isset($level_list[$user['user_level']])){
    		$user['cha']		= $level_list[$user['user_level']]['level_integral']-$user['total_score'];
    		$user['cha_name']	= $level_list[$user['user_level']]['rank_name'];
    		$user['end_total']	= $level_list[$user['user_level']]['level_integral'];
    	}else{
    		$user['end_total']	= $user['total_score'];
    		$user['cha'] = 0;
    	}
    	if($user['user_level'] > 0){
    		$user['rank_data']	= $level_list[$user['user_level']-1];
    		$user['rank_name']	= $level_list[$user['user_level']-1]['rank_name'];
    	}else{
    		$user['rank_name'] = '无等级';
    		
    	}
    	$user['percent'] = intval(($user['total_score']/$user['end_total'])*100);
    	
    	$this->success('ok',$user);
    	
    }
    
   
}
