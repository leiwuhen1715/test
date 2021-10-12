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
use api\home\model\VideoModel;
use cmf\controller\RestBaseController;

class VideoController extends RestBaseController
{
    // api 首页
    public function index()
    {
		$limit = request()->param('limit',10,'intval');
		$model = new VideoModel;
		
		$data  = $model->field('id,title,keywords,picture,digest')->where('state',1)->order(['list_order'=>'asc','id'=>'desc'])->paginate($limit);
		$list = $data->items();
		$this->success('ok', $list);
    }
    
    //详情
	public function detail(){
		
	   $id = request()->param('id',0,'intval');
	   $model = new VideoModel;
	   $data = $model->relation('detail')->where(['id'=>$id,'state'=>1])->find();
	   Db::name('item_activity')->where('id',$id)->setInc('pv');
	   $this->success('ok',$data);
	}

}
