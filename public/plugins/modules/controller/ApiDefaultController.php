<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace api\home\controller;

use api\home\model\ApiDefaultModel;
use cmf\controller\RestBaseController;
use think\Db;

class ApiDefaultController extends RestBaseController
{


    // api 首页
    public function index()
    {
        $limit = request()->param('limit',10,'intval');
        $model = new ApiDefaultModel;

        $data  = $model->field('id,title,keywords,picture,digest')->where('state',1)->order(['list_order'=>'asc','id'=>'desc'])->paginate($limit);
        $list = $data->items();
        $this->success('ok', $list);
    }

    //详情
    public function detail(){

        $id = request()->param('id',0,'intval');
        $model = new ApiDefaultModel;
        $data = $model->relation('detail')->where(['id'=>$id,'state'=>1])->find();
        Db::name('item_default')->where('id',$id)->setInc('pv');
        $this->success('ok',$data);
    }



}
