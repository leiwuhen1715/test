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
use api\user\service\PayService;
use api\user\service\WxPayService;
use api\user\service\AliPayService;
use cmf\controller\RestBaseController;

class NotifyController extends RestBaseController
{

    public function alipay(){

        $data = request()->post();
        $data['fund_bill_list'] = htmlspecialchars_decode($data['fund_bill_list']);
        $server = new AliPayService;
        $result = $server->notify($data);
        if($result === true){

            $pay_service = new PayService;
            $res = $pay_service->pay($data['out_trade_no']);
            if($res == 1){
                echo "success";
            }

        }else{
            Log::write($data['out_trade_no'].'签名失败','alipay');
        }

    }

    public function wxpay(){

        $server = new WxPayService;
        $app    = $server->getApp();
        $param = request()->param();

        $response = $app->handlePaidNotify(function ($message, $fail) {
            // 你的逻辑
            if($message['result_code'] == 'SUCCESS' && $message['return_code'] == 'SUCCESS'){
                $res_status = 0;
                Db::startTrans(); //开启事务
                try {
                    $pay_service = new PayService;
                    $res_status  = $pay_service->pay($message['out_trade_no']);
                    Db::commit();
                } catch (\Exception $e) {
                    $Message= $e->getMessage();
                    // 回滚事务
                    Db::rollback();
                }

                if($res_status == 1){
                    log::write('支付成功-'.$message['out_trade_no'],'pay');
                    echo '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                }else{
                    log::write('支付失败-'.$message['out_trade_no'],'pay');
                }

            }else{
                Log::write('错误','wxpay');
                $fail('错误');
            }
            // 或者错误消息

        });


    }



}
