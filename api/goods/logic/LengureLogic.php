<?php

namespace api\goods\logic;

use think\Db;
use think\Log;
use api\goods\model\CartModel;
use think\model\Relation;
/**
 * 购物车 逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class LengureLogic extends Relation
{
	
    public function getTotalPrice($user_id,$id,$num,$coupon_id=0){
		
		check_reveiw($user_id);
		$goods_time  = Db::name('goods_time')->where(['id'=>$id,'is_on_sale'=>1])->find();
		$course_type = $goods_time['course_type'];
		$coupon_price = 0;
		$total_amount = $goods_time['shop_price']*$num;
		
		//优惠券
		$coupon = Db::name('coupon')->where(['user_id'=>$user_id,'id'=>$coupon_id,'is_use'=>0])->where('end_time','>',time())->find();
		if($coupon){
			if($coupon['type'] == 0){
				if($total_amount >= $coupon['total_amount']){
					$coupon_price = $coupon['amount'];
				}
			}else{
				$coupon_price = $coupon['amount'];
			}
		}
		$coupon_id    = $coupon_price>0?$coupon_id:0;
		$order_amount = $total_amount-$coupon_price;
		
		$user = Db::name('user')->field('is_vip,is_member')->where('id',$user_id)->find();
		$is_member = $user['is_member'];
		if($is_member == 1){
			$c_amount = $goods_time['member_price']*$num;
			if($c_amount < $order_amount){
				$order_amount = $c_amount;
				$coupon_id  = $coupon_price  = 0;
			}
		}
		$is_vip = $user['is_vip'];
		if($is_vip == 1){
			
			$vip_id = Db::name('user_card')->where(['user_id'=>$user_id,'status'=>1])->value('goods_id');
			
			if($course_type == 1){
				if(in_array($vip_id,[1,3])){
					$order_amount = $coupon_price = $coupon_id = 0;
				}
				
			}else if($course_type == 2){
				$c_amount = in_array($vip_id,[2,3])?($total_amount*0.5):$order_amount;
				if($c_amount < $order_amount){
					$order_amount = $c_amount;
					$coupon_id    = $coupon_price = 0;
				}
			}
			if($vip_id == 4){
				$c_amount = 9.9*$num;
				if($c_amount < $order_amount){
					$order_amount = $c_amount;
					$coupon_id    = $coupon_price = 0;
				}
			}
			
		}
		
		$coupon_count = Db::name('coupon')->where(['user_id'=>$user_id,'is_use'=>0])->where('total_amount','<',$order_amount)->where('end_time','>',time())->count();
		
		$order_amount = $order_amount<0?0:$order_amount;
        $result = ['total_amount' => sprintf('%.2f', $total_amount), 'order_amount' => sprintf('%.2f', $order_amount),'coupon_price'=>$coupon_price,'coupon_id'=>$coupon_id,'coupon_count'=>$coupon_count];

        return $result;
    }
    /**
     * 添加订单
     * @param type $user_id  用户id
     * @param type $address_id 地址id
     * @param type $cart_price 应付金额
     * @param type $pay_status 支付方式
     */
    public function addOrder($user_id,$id,$num,$coupon_id=0){
		
        // 仿制灌水 1天只能下 50 单
		$result = ['status' => 0,'msg' 	 => ''];
        // $order_count = Db::name('league_order')->where("user_id= $user_id and order_sn like '".date('Ymd')."%'")->count(); // 查找购物车产品总数量
        // if($order_count >= 50)return array('status'=>-9,'msg'=>'一天只能下50个订单','result'=>'');

		$goods_time = Db::name('goods_time')->where(['id'=>$id,'is_on_sale'=>1])->find();
		if(empty($goods_time)){
			$result['msg'] = '教练不存在';
			return $result;
		}
		if($goods_time['start_time'] < time()){
			$result['msg'] = '课程已开始';
			return $result;
		}
		

		if($goods_time['enroll_num'] >= $goods_time['people_num']){
			if($num > 1){
				$result['msg'] = '等候中，只能预约1人';
				return $result;
			}
		}
		
        $param = request()->param();
        $pay_code = $param['pay_code'];
        $pay_name = $pay_code=='wxpay'?'微信支付':'余额支付';
		$result_amout = $this->getTotalPrice($user_id,$id,$num,$coupon_id);
		
		$total_amount = $result_amout['total_amount'];
		$order_amount = $result_amout['order_amount'];
		$coupon_id    = $result_amout['coupon_id'];
		$coupon_price = $result_amout['coupon_price'];
		
		if($pay_code == 'balance'){
			$balance = Db::name('user')->where('id',$user_id)->value('balance');
			if($balance < $order_amount){
				$result['msg'] = '余额不足';
				return $result;
			}
		}
		
        $transStatu=0;
        Db::startTrans(); //开启事务
        try {

			$order_sn = Db::name('league_order')->where(['user_id'=>$user_id,'time_id'=>$goods_time['id'],'pay_code' => $pay_code,'order_amount'=>$order_amount,'pay_status'=>0])->value('order_sn');
			if($order_sn){
				$result_sn = $order_sn;
			}else{
				$result_sn = $order_sn = get_order_sn();
	            $pay_data = [
	                'amount'   	 => $order_amount,
	                'is_paid'  	 => 0,
	                'type'     	 => 6,
	                'order_sn' 	 => $order_sn,
	                'pay_code' 	 => $pay_code,
	                'add_time' 	 => time(),
	                'user_id'  	 => $user_id,
					'goods_name' => $goods_time['goods_name'],
	            ];
	            $pay_id = Db::name('pay_log')->insertGetId($pay_data);
				$new_user = Db::name('league_order')->where(['user_id'=>$user_id,'pay_status'=>1])->value('id');
				$applet_new   = empty($new_user)?1:0;  //小程序新学员
				$new_student  = Db::name('coach_student')->where(['user_id'=>$user_id,'coach_user_id'=>$goods_time['user_id']])->value('id');
				$coach_new   = empty($new_student)?1:0;  //教练新学员
				$new_course  = Db::name('league_order')->where(['user_id'=>$user_id,'pay_status'=>1,'goods_id'=>$goods_time['goods_id']])->value('id');
				$course_new   = empty($new_course)?1:0;  //课程新学员
				
	            $data = [
	                'order_sn'      => $order_sn, // 订单编号
	                'user_id'       => $user_id, //用户id
	                'time_id'       => $goods_time['id'],//'省份id',
					'store_id'		=> $goods_time['store_id'],
	                'goods_id'      => $goods_time['goods_id'],//'详细地址',
	                'coach_id'      => $goods_time['coach_id'],//'详细地址',
	                'coach_user_id' => $goods_time['user_id'],//'详细地址',
	                'add_time'      => time(),//'详细地址',
	                'start_time'    => $goods_time['start_time'],//'手机',
	                'end_time'   	=> $goods_time['end_time'],//'产品总价'
	                'order_amount'  => $order_amount,//'应付款金额',暂无优惠券运费等金额
	                'total_amount'  => $total_amount,
	                'coupon_price'  => $coupon_price,
					'coupon_id'		=> $coupon_id,
	                'goods_name'	=> $goods_time['goods_name'],
	                'tags'      	=> $goods_time['tags'], //下单时间
	                'pay_id'     	=> $pay_id,
	                'pay_code'      => $pay_code,
					'people_num'	=> $num,
	                'pay_name'      => $pay_name,
					'applet_new'    => $applet_new,
					'coach_new'		=> $coach_new,
					'course_new'    => $course_new
	            ];
	            $order_id = Db::name("league_order")->insertGetId($data);
				if($coupon_id > 0){
					Db::name('coupon')->where('id',$coupon_id)->update(['is_use'=>1,'use_time'=>time()]);
				}
			}
            

            $transStatu=1;
            $msg='提交订单成功';
            Db::commit();
        } catch (\Exception $e) {
            $msg= $e->getMessage();
            $order_id=0;
            // 回滚事务
            Db::rollback();
        }

        return ['status'=>$transStatu,'msg'=>$msg,'result'=>$result_sn]; // 返回新增的订单id
    }


}
