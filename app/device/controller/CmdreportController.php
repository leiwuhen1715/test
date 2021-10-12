<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\device\controller;

use api\user\service\DoorService;
use think\facade\Log;
use cmf\controller\RestBaseController;

class CmdreportController extends RestBaseController
{
    // api 首页
    public function index()
    {
		$param = request()->param();
		
		$cmd  		  = request()->param('cmd',0,'intval');
		$device_sn    = request()->param('device_sn');
		$cmd_reply_id = request()->param('cmd_reply_id');
		$status 	  = request()->param('status',0,'intval');
	
    }

}
