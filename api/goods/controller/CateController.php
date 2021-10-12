<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\goods\controller;

use think\Db;
use api\home\model\SlideModel;
use cmf\controller\RestBaseController;
use api\goods\model\GoodsCategoryModel;
use api\goods\model\GoodsModel as Goods;

class CateController extends RestBaseController
{

    public function detail(){
        $model  = new GoodsCategoryModel;
        $id     = request()->param('id',0,'intval');
        $data   = $model->where('id',$id)->where('is_show','1')->find();
        if($data){
            $this->success('ok!', $data);
        }else{
            $this->error('分类不存在!');
        }
    }
    public function index(){

        $catrgory=new GoodsCategoryModel;
        $order=['list_order' => 'asc','id'=> 'asc'];
        $cat_list = $catrgory->field('id,name')->where('parent_id',0)->where('is_show','1')->order($order)->select();
		foreach($cat_list as $key=>$vo){
			$cat_list[$key]['checked'] = false;
		}
        $this->success('产品获取成功!', $cat_list);
    }
	
    public function getChildCate(){
        $id        =  $this->request->get('id', 0, 'intval');

        $catrgory=new GoodsCategoryModel;
        $order=[
            'list_order' => 'asc',
            'id'         => 'asc'
        ];
        $cat_list=$catrgory->where('parent_id',$id)->where('is_show','1')->order($order)->select();

        $this->success('产品获取成功!', $cat_list);
    }

}
