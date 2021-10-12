<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace api\user\controller;

use api\user\model\UserCoinLogModel;
use cmf\controller\RestUserBaseController;

class CoinController extends RestUserBaseController
{
    /**
     * 查询金币日志
     * @throws \think\exception\DbException
     */
    public function logs()
    {
        $userId  = $this->getUserId();
        $model   = new UserCoinLogModel();

        $logs = $model->where('user_id',$userId)->order('create_time DESC')->paginate(20);

        $this->success('请求成功', $logs->items());
    }
    
    //优惠券列表
    public function coupon(){
    	
    }
    
    //鹿角兑换优惠券
    public function exchange(){
    	
    }

}