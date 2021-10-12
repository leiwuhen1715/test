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
use cmf\controller\RestBaseController;
use api\goods\model\GoodsCategoryModel;
use api\goods\model\GoodsModel as Goods;

class ListController extends RestBaseController
{
    

    public function index(){

        $id 			=  request()->param('category_id', 0, 'intval');
        $child_id 		=  request()->param('child_id', 0, 'intval');
        $prom_type 		=  request()->param('prom_type', 0, 'intval');
        $is_recommend 	=  request()->param('is_recommend', 0, 'intval');
        $is_special 	=  request()->param('is_special',0,'intval');
        $keyword    	=  request()->param('keyword');

        $goods                 = new Goods();
        $where = [];

        if($prom_type) 		$where[] = ['prom_type','=',1];
        if($is_recommend)	$where[] = ['is_recommend','=',1];
        if($is_special)		$where[] = ['is_special','=',1];
        if($id)             $where[] = $this->getChild($id);
        if($keyword)		$where[] = ['goods_name','like',"%".$keyword."%"];

        $order = ['list_order' => 'asc','goods_id'   => 'desc'];
        $data = $goods->field('goods_id,goods_img,goods_name,shop_price,market_price,goods_sn,keywords,is_buy,hire_price,store_count')->where($where)->order($order)->paginate(10);

        $this->success('ok!', $data->items());

    }

    public function getChild($id){

        $cat_list = Db::name('goods_category')->where(['parent_id'=>$id,'is_show'=>1])->column('id');
        if(empty($cat_list)){
            $result    = ['cat_id','=',$id];
        }else{
            $cat_list[] = $id;
            $result    = ['cat_id','in',$cat_list];
        }
        return $result;
    }



}
