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
    public function index(){
        $catrgory=new GoodsCategoryModel;
        $id = $this->request->param('id',0,'intval');
        $data=$catrgory->where('id',$id)->where('is_show','1')->find();
        if($data){
            $this->success('ok!', $data);
        }else{
            $this->error('分类不存在!');
        }
    }
    public function getCate(){
        $catrgory=new GoodsCategoryModel;
        $order=[
            'list_order' => 'asc',
            'id'         => 'asc'
        ];
        $cat_list = $catrgory->where('parent_id',0)->where('is_show','1')->order($order)->select();
		foreach($cat_list as $key=>$vo){
			$cat_list[$key]['checked'] = false;
		}

        $this->success('产品获取成功!', $cat_list);
    }
	public function getInterval(){
		$tag_list = Db::name('goods_tag')->where('status',1)->order('list_order','asc')->select();
		$list = [
			['name'=>'全部时段','checked'=>true],
			['name'=>'06:00-09:00','checked'=>false],
			['name'=>'09:00-12:00','checked'=>false],
			['name'=>'12:00-14:00','checked'=>false],
			['name'=>'14:00-18:00','checked'=>false],
			['name'=>'18:00-22:00','checked'=>false],
		];
		$this->success('ok',['tag_list'=>$tag_list,'list'=>$list]);
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
