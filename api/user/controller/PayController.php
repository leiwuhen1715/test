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
use api\user\service\PayService;
use think\Db;
use think\Validate;

class PayController extends RestUserBaseController
{

    /**
     * 支付
     */
    public function fiedorder(){

        $order_sn = $this->request->param('order_sn');
        $pay_code = $this->request->param('pay_code');
        $openid   = request()->param('openid');
        $userId   = $this->getUserId();
        $one      = Db::name('pay_log')->where('order_sn',$order_sn)->order('id','desc')->find();
        if(empty($openid)){
            $openid   = Db::name('third_party_user')->where(['third_party'=>'wxapp','user_id'=>$userId])->order('id','desc')->value('openid');
        }

        $pay_name = ['wxpay'=>'微信支付','balance'=>'余额支付','alipay'=>'支付宝支付'];
        if($one){
            if($one['is_paid'] == 1){
                $this->error('订单已付款！');
            }else{

                $data = [
                    'openid'       => $openid,
                    'user_id'      => $userId,
                    'goods_name'   => $one['goods_name'],
                    'total_fee'    => $one['amount'],
                    'out_trade_no' => $one['order_sn'],
                ];

                $res_status = 0;
                Db::startTrans(); //开启事务
                try {

                    $server   = new PayService;
                    if($one['amount'] > 0){
                        $pay_code = $one['pay_code'];
                        $result   = $server->{$pay_code}($data);
                    }else{
                        $result = $server->pay($one['order_sn']);
                    }

                    Db::commit();
                } catch (\Exception $e) {
                    $Message= $e->getMessage();
                    // 回滚事务
                    Db::rollback();
                    $this->error($Message);
                }
                $this->success('ok', $result);

            }
        }else{
            $this->error('订单不存在！');
        }

    }


}
