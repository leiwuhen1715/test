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
use api\goods\model\SeckillModel;
use api\goods\logic\GoodsLogic;
use api\goods\model\GoodsCommentModel;

class SeckillController extends RestBaseController
{
    // api 首页
    public function index()
    {
    	$model = new SeckillModel;
        $limit = request()->param('limit',10,'intval');
        $where = [];
    	$order=[
    		'list_order'=>'asc',
    		'id'	   =>'desc'
    	];
        $field = 'id,goods_id,goods_name,id,photo,goods_img,shop_price,ot_price,start_time,end_time';

    	$data  = $model->field($field)->where($where)->order($order)->paginate($limit);
        $list = $data->items();
        $this->success('ok!', $list);

    }

    /**
     * 获取指定的文章
     * @param int $id
     */
    public function detail()
    {
        $id = $this->request->get('id', 0, 'intval');

        if (intval($id) === 0) {
            $this->error('无效的产品id！');
        } else {
            $params                       = $this->request->get();

            $model = new SeckillModel;
            $data  = $model->where('id',$id)->find();
            $model->where('id', $id)->setInc('click_count');

            if (empty($data)) {
                $this->error('产品不存在！');
            } else {
                $data        = $data->toArray();
                if(empty($data['photo'])){
                    $data['photo']=[$data['goods_img']];
                }else{
                     $data['photo'][]=$data['goods_img'];
                }
                $result = [
                    'goods'     => $data
                ];
                $this->success('请求成功!', $result);
            }

        }
    }
	/**
     * 获取指定的文章
     * @param int $id
     */
    public function getSku()
    {
        $goods_id = $this->request->param('goods_id', 0, 'intval');

        if (intval($goods_id) === 0) {
            $this->error('无效的产品id！');
        } else {


           $goods_logic = new GoodsLogic;
           $specList    = $goods_logic->getSpecList($goods_id);
           $goodssku = Db::name('GoodsSku')->field('item_path,sku_id,price,store_count')->where('goods_id',$goods_id)->select();

           if($goodssku){

              $specList = [
                'spec_list' => $specList,
                'sku_list'  => $goodssku
              ];
           		$this->success('ok',$specList);
           }else{
           		$this->error('无规格');
           }
        }
    }
}
