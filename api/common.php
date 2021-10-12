<?php

use think\Db;
use think\facade\Log;
use api\user\service\WxPayService;

function check_reveiw($user_id){
	
    $card = Db::name('user_card')->where('user_id',$user_id)->find();
    $time = time();
    if($card['status'] == 1){
        if($card['end_time'] < $time){
            Db::name('user_card')->where('id',$card['id'])->update(['status'=>0]);
            Db::name('user')->where('id',$card['user_id'])->update(['is_vip'=>0]);
        }
    }
    
}

function checkdeng($userid){
	
	
    $user = Db::name('user')->field('total_score,user_level')->where('id',$userid)->find();
    $level_list = Db::name('user_rank')->where('status',1)->order('user_level','asc')->select()->toarray();

	foreach ($level_list as $key=>$vo){
		
		if($user['user_level'] < $vo['user_level']){
		
			if($user['total_score']>$vo['level_integral']){
				Db::name('user')->where('id',$userid)->update(['user_level'=>$vo['user_level']]);
			}
		}
		
	}
}


function refund_order($id){
	
	$result = [
		'status' => 0,
		'msg'	 => '取消失败'
	];
	$data = Db::name('league_order')->field('id,order_status,order_sn,order_amount,user_id,pay_code,people_num,time_id,goods_name')->where('id',$id)->find();
	$res_status = 0;
	if(($data['order_amount']*100) == 0){
		$res_status = 1;
	}elseif($data['pay_code'] == 'wxpay'){
		$data = [
			'order_sn'		=> $data['order_sn'],
			'refund_sn'		=> get_order_sn(),
			'order_amount'	=> $data['order_amount'],
			'refund_amount'	=> $data['order_amount'],
			'refund_desc'	=> '取消等候-'.$data['goods_name'],
		];
		$server = new WxPayService();
		$res = $server->refund($data);
		if($res['code'] == 1){
			$res_status = 1;
		}else{
			$result['msg'] = $res['msg'];
		}
	}elseif($data['pay_code'] == 'balance'){
		
		log_balance_change($data['user_id'],'取消等候-'.$data['goods_name'],$data['order_amount']);
		$res_status = 1;
	}
	if($res_status == 1){
		if($data['order_status'] == 6){
			Db::name('goods_time')->where('id',$data['time_id'])->setDec('wait_num',$data['people_num']);
		}else{
			Db::name('goods_time')->where('id',$data['time_id'])->setDec('enroll_num',$data['people_num']);
		}
		Db::name('league_order')->where('id',$data['id'])->update(['order_status'=>5]);
		
	}
	$result['status'] = $res_status;
	return $result;
	
}

function del0($s)   
{   
    $s = trim(strval($s));   
    if (preg_match('#^-?\d+?\.0+$#', $s)) {   
        return preg_replace('#^(-?\d+?)\.0+$#','$1',$s);   
    }    
    if (preg_match('#^-?\d+?\.[0-9]+?0+$#', $s)) {   
        return preg_replace('#^(-?\d+\.[0-9]+?)0+$#','$1',$s);   
    }   
    return $s;   
}

function get_child_arr($id){
	
	$c_where = ['parent_id'=>$id,'is_show'=>1];
	$cat_list = Db::name('goods_category')->where($c_where)->column('id');
	if(empty($cat_list)){
		$cat_list = [$id];
	}else{
		$cat_list[] = $id;
	}
	return $cat_list;
}

//支付的订单号
function get_order_sn()
{
    /* 选择一个随机的方案 */
    $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
    return $orderSn = $yCode[intval(date('Y')) - 2021] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
}
//余额变化
function log_balance_change($user_id=0, $description,$change = 0 ,$can_balance = 0)
{
    /* 插入帐户变动记录 */

    $time=time();
    $ip = get_client_ip(0, true);
    $user=DB::name('user')->field('balance,can_balance')->where("id",$user_id)->find();
  
    $balance=$user['balance']+$change;
    $old_change = $change;
    $integral_info=[
        'user_id'        => $user_id,
        'description'    => $description,
        'change'         => $change,
        'balance'        => $balance,
        'create_time'    => time()
    ];
    $id =DB::name('user_balance_log')->insertGetId($integral_info);

    /* 更新用户余额 */
    if($change>0){
    	
        DB::name('user')->where("id",$user_id)->setInc('balance',$change);
        DB::name('user')->where("id",$user_id)->update(['is_member'=>1]);
        if($can_balance > 0){
        	DB::name('user')->where("id",$user_id)->setInc('can_balance',$can_balance);
        }
        
    }else{
    	
        $change=-1*$change;
        DB::name('user')->where("id",$user_id)->setDec('balance',$change);
        
        //检测可提现金额
        $can_balance = ($user['can_balance'] >= $change)?$change:$user['can_balance'];
        if($can_balance > 0){
    		DB::name('user')->where("id",$user_id)->setDec('can_balance',$can_balance);
    	}
    	
        $sy_balance = DB::name('user')->where("id",$user_id)->value('balance');
		if($sy_balance < 0){
			DB::name('user')->where("id",$user_id)->update(['is_member'=>0]);
		}
    }
    return 1;

}
//积分变化
function log_score_change($user_id=0, $description,$change = 0)
{
    /* 插入帐户变动记录 */

    $time  = time();
    $ip    = get_client_ip(0, true);
    $score = DB::name('user')->where("id",$user_id)->value('score');
  
    $balance = $score+$change;
    $integral_info=[
        'user_id'        => $user_id,
        'description'    => $description,
        'change'         => $change,
        'score'          => $balance,
        'create_time'    => time()
    ];
    
    $id =DB::name('user_score_log')->insertGetId($integral_info);
    /* 更新用户余额 */
    if($change>0){
        DB::name('user')->where("id",$user_id)->setInc('score',$change);
        DB::name('user')->where("id",$user_id)->setInc('total_score',$change);
        
    }else{
        $change=-1*$change;
        DB::name('user')->where("id",$user_id)->setDec('score',$change);
    }
    checkdeng($user_id);
    return 1;
}

//金币变化
function log_coin_change($user_id=0, $description,$change = 0,$type=0)
{
    /* 插入帐户变动记录 */

    $time  = time();
    $ip    = get_client_ip(0, true);
    $score = DB::name('user')->where("id",$user_id)->value('coin');
  
    $balance = $score+$change;
    $integral_info=[
        'user_id'        => $user_id,
        'description'    => $description,
        'change'         => $change,
		'type'			 => $type,
        'coin'           => $balance,
        'create_time'    => time()
    ];
    
    $id =DB::name('user_coin_log')->insertGetId($integral_info);
    /* 更新用户余额 */
    if($change>0){
        DB::name('user')->where("id",$user_id)->inc('coin',$change)->inc('total_coin',$change)->update();
        
		if($type == 1){ //签到金币
			DB::name('user_other')->where("user_id",$user_id)->setInc('sign_coin',$change);
		}elseif($type == 2){ //订单金币
			DB::name('user_other')->where("user_id",$user_id)->setInc('order_coin',$change);
		}
    }else{
        $change=-1*$change;
        DB::name('user')->where("id",$user_id)->setDec('coin',$change);
    }
    return 1;
}

function make_coupon_card() {
    $code = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $rand = $code[rand(0,25)].strtoupper(dechex(date('m'))).date('d').substr(time(),-5).substr(microtime(),2,5).sprintf('%02d',rand(0,99));
    for(
        $a = md5( $rand, true ),
        $s = '0123456789ABCDEFGHIJKLMNOPQRSTUV',
        $d = '',
        $f = 0;
        $f < 8;
        $g = ord( $a[ $f ] ),
        $d .= $s[ ( $g ^ ord( $a[ $f + 8 ] ) ) - $g & 0x1F ],
        $f++
    );
    return $d;
}
function get_status_name($order_status){
	 $status_arr = ['待付款','已完成','待上课','已入场','已赠送','已取消','等候中'];
	 return $status_arr[$order_status];
}

function cmf_curl_post($url, $params = [],$headers=[])
{
	
    //初始化
    $curl = curl_init();
    //设置抓取的url
    curl_setopt($curl, CURLOPT_URL, $url);
    //设置头文件的信息作为数据流输出
    curl_setopt($curl, CURLOPT_HEADER, 0);
    //设置获取的信息以文件流的形式返回，而不是直接输出。
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    //设置post方式提交
    curl_setopt($curl, CURLOPT_POST, 1);

    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
    //设置post数据
    curl_setopt($curl, CURLOPT_POSTFIELDS, $params);

    //执行命令
    $data = curl_exec($curl);

    //关闭URL请求
    curl_close($curl);
    //显示获得的数据

    return json_decode($data, true);
}


function cmf_api_get($url, $params = [])
{
    //初始化
    $curl = curl_init();
    //设置抓取的url
    curl_setopt($curl, CURLOPT_URL, $url);
    //设置头文件的信息作为数据流输出
    curl_setopt($curl, CURLOPT_HEADER, 0);
    //设置获取的信息以文件流的形式返回，而不是直接输出。
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    //设置post方式提交
    //curl_setopt($curl, CURLOPT_POST, 1);

    // $token = session('token');

    curl_setopt($curl, CURLOPT_HTTPHEADER, $params);
    //设置post数据
    // curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
    //执行命令
    $data = curl_exec($curl);
    
    //关闭URL请求
    curl_close($curl);
    //显示获得的数据
    return json_decode($data, true);
}

/**
 *图片裁剪
 */
function get_small_images($img,$width,$height){

    if (empty($img))    $img = 'default.png';
    if (strpos($img, "http") === 0)  return $img;
    if (strpos($img, "https") === 0) return $img;

    if(substr($img,0,1) === '/'){
        $path = WEB_ROOT;
        $thumb_path = 'upload/small';
    }else{
        $path = WEB_ROOT."upload/";
        $thumb_path = 'small';
    }

    if(!file_exists($path.$img))    return cmf_get_image_url($img);

    $img_arr    = explode('/',$img);
    $path_count = count($img_arr)-1;
    foreach ($img_arr as $key => $value) {
        if($key < $path_count){
            $thumb_path .= '/'.$value;
        }else{
            $img_name = $value;
        }
    }

    $thumb_name = $thumb_path."/small_{$width}_{$height}_".$img_name;

    if(file_exists($path.$thumb_name))      return cmf_get_image_url($thumb_name);
    if(!is_dir($path.$thumb_path))          mkdir($path.$thumb_path,0777,true);

    $image = \think\Image::open($path.$img);
    $image->thumb($width, $height,\think\Image::THUMB_CENTER)->save($path.$thumb_name);

    return cmf_get_image_url($thumb_name);
}

function logOrder($order_id,$action_note,$status_desc,$user_id = 0)
{
    $action_user = Db::name('user')->where('id',$user_id)->value('user_nickname');
    $status_desc_arr = array('提交订单', '付款成功', '取消', '等待收货', '完成','退货');

    $order = DB::name('Order')->where("order_id",$order_id)->find();
    $action_info = array(
        'order_id'        => $order_id,
        'user_id'     	  => $user_id,
        'action_user'     => $action_user,
        'order_status'    => $order['order_status'],
        'shipping_status' => $order['shipping_status'],
        'pay_status'      => $order['pay_status'],
        'action_note'     => $action_note,
        'status_desc'     => $status_desc, //''
        'log_time'        => time(),
    );
    return DB::name('order_log')->insert($action_info);
}