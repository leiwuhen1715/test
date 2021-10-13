<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\home\controller;

use think\Db;
use think\facade\Log;
use api\user\service\WxPayService;
use api\user\service\DoorService;
use api\user\model\SupplierModel;
use app\user\service\OfficialService;
use cmf\controller\RestBaseController;

class IndexController extends RestBaseController
{
    // api 首页
    public function index()
    {
    	
    	
    	/*$list = Db::name('user_card')->where('goods_id',4)->select();
    	foreach ($list as $vo){
    		$end_time = $vo['start_time'] + 31*24*3600;
    		Db::name('user_card')->where('id',$vo['id'])->update(['end_time'=>$end_time]);
    	}*/
    	//log_score_change(4, '添加',300000);
    	/*$service = new OfficialService;
    	$service->template_send(1);*/
		//开门
		$sta_time  = strtotime('2021-08-10 18:00:00');
		$end_time  = strtotime('2021-09-10 23:00:00');
		$door = new DoorService();
		$in_data   = [
			'device_sn' => 2358992010,
			'start'     => $sta_time,
			'end'       => $end_time,
		];
		
		$res = $door->text_rule_b($in_data,0);
		
		echo "<img src='".cmf_get_image_url($res)."'>";
		
        
    }
    //未使用优惠券的数量
    public function couponCount(){
    	
    	$user_id  = $this->userId;
    	$end_time = time()+5*24*3600;
    	$count = Db::name('coupon')->where(['user_id'=>$user_id,'is_use'=>0])->where('end_time','>',time())->count();

    	$this->success('ok',$count);
    }

    /**
     * 获取站点信息
     */
    public function site(){

        $siteInfo = cmf_get_site_info();
        $this->success('ok',$siteInfo);

    }

    //判断是否可以使用优惠券
    public function use(){
    	$user_id = $this->userId;
    	$code = 1;
    	$user = Db::name('user')->field('is_vip,is_member')->where('id',$user_id)->find();
    	if(!empty($user)){
    		$code = $user['is_vip']==1?0:($user['is_member']==1?0:1);
    	}
    	$this->success('ok',$code);
    }
    
    //获取门店
    
    public function store(){
    	$model = new SupplierModel;
    	$data  = $model->field('id,supplier_name,contact_address,thumbnail,latitude,longitude')->where('status',1)->select();
    	$this->success('ok',$data);
    }
    
    
    //获取推荐门店
    
    public function restore(){
    	$model   = new SupplierModel;
    	$data    = $model->field('id,supplier_name,contact_address,thumbnail,latitude,longitude')->where(['status'=>1,'recommend'=>1])->find();
    	
    	$user_id = $this->userId;
    	$data['is_collect'] = Db::name('user_favorite')->where(['user_id'=>$user_id,'table_name'=>'supplier','object_id'=>$data['id']])->value('id');
    	
    	
    	$this->success('ok',$data);
    }
    
    //门店详情
    public function storeDetail(){
    	
    	$id = request()->param('id',0,'intval');
    	$model = new SupplierModel;
    	$data  = $model->where(['status'=>1,'id'=>$id])->find();
    	$this->success('ok',$data);
    }
    
    public function refund(){
    	
        $order_id = 338;
        $order = Db::name('place_order')->where('order_id',$order_id)->find();
       
        $server = new WxPayService;
        $refund_sn = get_order_sn();
        Log::write($refund_sn.'--'.$order_id,'退款单号');
        $data = [
            'order_sn'      => $order['order_sn'],
            'refund_sn'     => $refund_sn,
            'order_amount'  => $order['order_amount'],
            'refund_amount' => $order['order_amount'],
            'refund_desc'   => $order['goods_name'].'退款'
        ];
        $result = $server->refund($data);

        if($result['code'] == 1){
            Db::name('place_order')->where('order_id',$order_id)->update(['pay_status'=>3]);
            echo '退款成功';
        }
    }
    
    //公众号发送上课通知
    public function check_order(){
    	
    	set_time_limit(0);
    	$service = new OfficialService;
    	$time = time() + 1800;
    	$list = Db::name('league_order')->where(['pay_status'=>1,'order_status'=>2,'is_send'=>0])->where('start_time','between',[time(),$time])->limit(50)->column('id');
    	foreach($list as $vo){
    		$service->native_send($vo);
    	}
    	
    }
	//等候中订单状态
	public function wait_order(){
		
		set_time_limit(0);
		$time = time() + 7200;
		$list = Db::name('league_order')->where(['pay_status'=>1,'order_status'=>6])->where('start_time','between',[time(),$time])->limit(50)->column('id');
		foreach($list as $vo){
			refund_wait_order($vo);
		}
	}

}
