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
namespace api\user\service;


use api\user\service\AliPayService;
use api\user\service\WxPayService;
use think\facade\Log;
use think\Db;

class PayService
{

    /**
     * 微信支付
     */
    public function wxpay($data)
    {

        $server = new WxPayService();
        $result = $server->wxapp_pay($data);

        return $result;
    }

    /**
     * 支付宝支付
     */
    public function alipay($data){

        $server = new AliPayService();
        $res    = $server->pay($data);

        return $res->body;
    }

    /**
     * 余额支付
     */
    public function balance($data){
        $result = '';
        $balance = Db::name('user')->where('id',$data['user_id'])->value('balance');
        if($balance > $one['amount']){
            log_balance_change($userId,'支付-'.$data['goods_name'],-$data['total_fee']);
            $res_status = $this->pay($data['out_trade_no']);
            $result = 1;
        }else{
            throw new \Exception('余额不足！');
        }
        return $result;
    }
    /**
     * 支付回调
     */
    public function pay($order_sn){

        $data = DB::name('pay_log')->where('order_sn',$order_sn)->order('id','desc')->find();
        //判断订单金额
        $res_status = 0;
        if($data['is_paid']==0){

            switch ($data['type']) {
                //1：会员开通，2：商城支付，3:场地支付 place_order,4:预约超时补价-,5:充值
                case 1:
                    //会员开通
                    $this->vipOpen($order_sn);
                    $res_status = 1;
                    break;
                case 2:
                    //商城付款信息
                    $this->shopPay($order_sn);
                    $res_status = 1;
                    break;
                case 3:
                    //经销商支付
                    $this->supplierPay($order_sn);
                    $res_status = 1;
                    break;
                case 4:
                    //告警器设备使用支付
                    $this->devicePay($order_sn);
                    $res_status = 1;
                    break;
                case 5:
                    //充值 recharge_order
                    $this->rechargePay($order_sn);
                    $res_status = 1;
                    break;
            }
            if($res_status == 1){
                Db::name('pay_log')->where('id',$data['id'])->update(['is_paid'=>1,'pay_time'=>time()]);
            }

        }else{
            Log::write('已经支付过了--'.$order_sn,'on_pay');
        }

        return $res_status;

    }

    /**
     * 支付开通会员
     */
    public function vipOpen($order_sn){
        $time = time();
        $result = Db::name('user_card_order')->where('order_sn',$order_sn)->order('id','desc')->find();
        $updata=['pay_status'=>1,'pay_name'	=> '微信','pay_time'  => time()];
        DB::name('user_card_order')->where("id",$result['id'])->update($updata);
        $end_days = "+1month";
        switch ($result['cycle']) {
            case 1:
                $end_days = "+3month";
                break;
            case 2:
                $end_days = "+6month";
                break;
            case 3:
                $end_days = "+1year";
                break;
        }
        $card_one = Db::name('user_card')->where('user_id',$result['user_id'])->order('id','desc')->find();
        if($card_one){

            $start_time = $card_one['end_time']>$time?$card_one['end_time']:$time;
            $end_time = strtotime($end_days,$start_time);
            Db::name('user_card')->where('id',$card_one['id'])->update(['end_time' => $end_time,'status' => 1]);

        }else{

            $end_time = strtotime($end_days,$time);
            $insert_data = [
                'start_time' => $time,
                'end_time'   => $end_time,
                'add_time'   => $time,
                'status'     => 1,
                'user_id'    => $result['user_id'],
                'type_id' 	 => $result['cycle']
                // 'card_on'    => $card_on
            ];
            Db::name('user_card')->insert($insert_data);
        }
        Db::name('user')->where('id',$result['user_id'])->update(['is_vip'=>1]);
    }

    /**
     * 商城支付
     */
    public function shopPay($order_sn){
        $order_id = Db::name('order')->where('order_sn',$order_sn)->value('order_id');
        $updata=[
            'pay_status'=>1,
            'pay_time'  => time()
        ];
        $result = DB::name('order')->where("order_id",$order_id)->update($updata);
        logOrder($order_id,'付款','pay','');
        $goods = Db::name('order_sub')->field('goods_id,goods_num,sku_id')->where('order_id',$order_id)->select();
        foreach ($goods as $value){
            Db::name('goods')->where('goods_id',$value['goods_id'])->inc('sales_sum',$value['goods_num'])->dec('store_count',$value['goods_num'])->update();
            Db::name('goods_sku')->where('sku_id',$value['sku_id'])->inc('sales_sum',$value['goods_num'])->dec('store_count',$value['goods_num'])->update();

        }
    }

    /**
     * 经销商支付
     */
    public function supplierPay($order_sn){

        $result = Db::name('hospital_supplier_order')->where('order_sn',$order_sn)->order('id','desc')->find();
        $updata=['pay_status'=>1,'pay_time'  => time()];
        DB::name('hospital_supplier_order')->where("id",$result['id'])->update($updata);
        log_supplier_order($result['id'],'支付',0,0);
        if(!empty($result['hospital_ids'])){
            update_supplier_hospital($result['hospital_ids'],$result['supplier_id']);
        }

    }

    /**
     * 告警器支付
     */
    public function devicePay($order_sn){

        $time   = time();
        $result = Db::name('device_order')->field('id,supplier_id,supplier_user_id,hospital_id,depart_id,room_id,device_id,money,order_amount,use_time,goods_name')->where('order_sn',$order_sn)->order('id','desc')->find();
        Db::name('device_order')->where('id',$result['id'])->update(['pay_status'=>1,'order_status'=>1,'pay_time'=>$time,'invoice_status'=>1]);

        if($result['money']>0){
            $hospital_name = Db::name('hospital')->where('id',$result['hospital_id'])->value('hospital_name');
            log_balance_change($result['supplier_user_id'], '【'.$hospital_name.'】收益',$result['money']);
        }
        log_device_order($result['id'],'付款',0);
        $this->setSupplierMonth($result,$time);
        $this->setSupplierDay($result,$time);
    }

    /**
     * 充值
     */
    public function rechargePay($order_sn){

        $updata=['pay_status'=>1,'pay_time' => time()];
        $result = Db::name('recharge_order')->where('order_sn',$order_sn)->order('id','desc')->find();
        DB::name('recharge_order')->where("id",$result['id'])->update($updata);
        log_balance_change($result['user_id'],'充值',$result['get_amount']);
    }

    /**
     * 更新月信息
     * @param $param    更新数据
     * @param $date     时间
     */
    public function setSupplierMonth($param,$date){

        $date  =  strtotime(date("Y-m",$date).'-01');
        list($year, $month) = [date('Y',$date),date('m',$date)];

        $where = [
            ['supplier_id' => $param['supplier_id'],'year' => $year,'month' => $month],
            ['supplier_id' => $param['supplier_id'],'year' => $year,'month' => $month,'hospital_id' => $param['hospital_id']],
            ['supplier_id' => $param['supplier_id'],'year' => $year,'month' => $month,'device_id'   => $param['device_id']]
        ];
        $insert_data = [
            'supplier_user_id'  => $param['supplier_user_id'],
            'supplier_id'       => $param['supplier_id'],
            'year'              => $year,
            'month'             => $month,
            'use_time'          => $param['use_time'],
            'date_time'         => $date,
            'use_num'           => 1,
            'total_money'       => $param['order_amount'],
            'money'             => $param['money']
        ];

        /**
         * 【money_month_supplier】  更新经销商数据 start
         * 【money_month_hospital】  更新医院数据 start
         * 【money_month_device】    更新设备数据 start
         */
        $day_arr = ['money_month_supplier','money_month_hospital','money_month_device'];
        foreach($day_arr as $key=>$vo){
            $id = Db::name($vo)->where($where[$key])->value('id');
            if($id){
                Db::name($vo)->where('id',$id)->inc('use_time',$param['use_time'])->inc('money',$param['money'])->inc('total_money',$param['order_amount'])->inc('use_num',1)->update();
            }else{
                if($key == 1){
                    $insert_data['hospital_id'] = $param['hospital_id'];
                }elseif($key == 2){
                    $insert_data['hospital_id'] = $param['hospital_id'];
                    $insert_data['room_id']     = $param['room_id'];
                    $insert_data['device_id']   = $param['device_id'];
                }
                Db::name($vo)->insert($insert_data);
            }
        }

    }
    /**
     * 更新天信息
     * @param $param
     * @param $date
     */
    //更新月训练
    public function setSupplierDay($param,$date){

        $date  =  strtotime(date("Y-m",$date));
        list($year,$month,$day) = [date('Y',$date),date('m',$date),date('d',$date)];
        $where = [
            ['supplier_id' => $param['supplier_id'],'year' => $year,'month' => $month,'day'=>$day],
            ['supplier_id' => $param['supplier_id'],'year' => $year,'month' => $month,'day'=>$day,'hospital_id' => $param['hospital_id']],
            ['supplier_id' => $param['supplier_id'],'year' => $year,'month' => $month,'day'=>$day,'device_id'   => $param['device_id']]
        ];
        $insert_data = [
            'supplier_user_id'  => $param['supplier_user_id'],
            'supplier_id'       => $param['supplier_id'],
            'year'              => $year,
            'month'             => $month,
            'day'               => $day,
            'use_time'          => $param['use_time'],
            'date_time'         => $date,
            'use_num'           => 1,
            'total_money'       => $param['order_amount'],
            'money'             => $param['money']
        ];
        /**
         * 【money_day_supplier】  更新经销商数据 start
         * 【money_day_hospital】  更新医院数据 start
         * 【money_day_device】    更新设备数据 start
         */
        $day_arr = ['money_day_supplier','money_day_hospital','money_day_device'];
        foreach($day_arr as $key=>$vo){
            $id = Db::name($vo)->where($where[$key])->value('id');
            if($id){
                Db::name($vo)->where('id',$id)->inc('use_time',$param['use_time'])->inc('money',$param['money'])->inc('total_money',$param['order_amount'])->inc('use_num',1)->update();
            }else{
                if($key == 1){
                    $insert_data['hospital_id'] = $param['hospital_id'];
                }elseif($key == 2){
                    $insert_data['hospital_id'] = $param['hospital_id'];
                    $insert_data['room_id']     = $param['room_id'];
                    $insert_data['device_id']   = $param['device_id'];
                }
                Db::name($vo)->insert($insert_data);
            }
        }

    }

}