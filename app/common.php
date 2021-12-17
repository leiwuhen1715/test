<?php
use think\Db;

//获取当月时间
function get_month_day(){
	
	
	$start_time = strtotime("-0 year -0 month -10 day");
    $xdata = [];
    for($i=0;$i<10;$i++)
    {
        $xdata[] = date('Y-m-d',$start_time+$i*86400); //每隔一天赋值给数组
    }
	
	
	return $xdata;
}

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

function log_balance_change($user_id=0, $description,$change = 0 ,$type = 0,$is_total=0)
{
    /* 插入帐户变动记录 */

    $time=time();
    $ip = get_client_ip(0, true);
    $user=DB::name('user')->field('balance')->where("id",$user_id)->find();
  
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
        if($is_total == 1){
            DB::name('user')->where("id",$user_id)->setInc('total_balance',$change);
        }
    }else{
        $change=-1*$change;
        DB::name('user')->where("id",$user_id)->setDec('balance',$change);

    }
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
        DB::name('user')->where("id",$user_id)->setInc('coin',$change);
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

function get_user_nickname($id){
    return  Db::name('user')->where('id',$id)->value('user_nickname');
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
