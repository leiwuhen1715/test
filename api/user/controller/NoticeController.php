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

use think\Db;
use api\user\model\UserNoticeModel;
use api\user\model\UserModel;
use cmf\controller\RestUserBaseController;


class NoticeController extends RestUserBaseController
{
    /**
     * 余额变更
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function logs()
    {
        $userId = $this->getUserId();

        $model	= new UserNoticeModel();
        $result = $model->where(['user_id' => $userId])->order('add_time desc')->paginate(10);
		$list   = $result->items();
		foreach ($list as $vo){
			if($vo['is_read'] == 0){
				Db::name('user_notice')->where('id',$vo['id'])->update(['is_read'=>1]);	
			}
		}
        $this->success('请求成功', ['list' => $list]);
    }

    

}