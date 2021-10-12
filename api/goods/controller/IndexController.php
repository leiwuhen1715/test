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
use api\goods\logic\GoodsLogic;
use api\goods\model\GoodsCommentModel;
use api\goods\service\PlaceServer;

class IndexController extends RestBaseController
{
    // api 首页
    public function index()
    {

    }
    /*秒杀产品*/
    public function getSeckill(){

        $input = $this->request->param();
        $id = $this->request->get('category_id', 0, 'intval');
        $is_recommend =  $this->request->get('is_recommend', 0, 'intval');

        $goods = new Goods();
        $where = [];
        if($id){
            $where=['cat_id'=>$id];
        }

        $where['prom_type']=1;

        if($is_recommend)$where['is_recommend'] = 1;

        $order = [
            'list_order' => 'asc',
            'goods_id'   => 'desc'
        ];
        $data = $goods->field('goods_id,goods_img,goods_name,shop_price,market_price')->where($where)->order($order)->paginate(10);
        $list = $data->items();
        $this->success('ok!', $list);

    }
    /**
     * 获取指定的文章
     * @param int $id
     */
    public function read()
    {
        $id = $this->request->get('id', 0, 'intval');

        if (intval($id) === 0) {
            $this->error('无效的产品id！');
        } else {
            $params  = $this->request->get();

            $goods   = new Goods();
            $data    = $goods->where('goods_id',$id)->find();
            $goods->where('goods_id', $id)->setInc('click_count');

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
	
	/**
	 * 获取指定的文章
	 * @param int $id
	 */
	public function getOneSku()
	{
	    $goods_id = $this->request->param('id', 0, 'intval');
	
	    if (intval($goods_id) === 0) {
	        $this->error('无效的产品id！');
	    } else {
	
		   $week = date("w");
		   $week = $week == 0?7:$week;
		   $new_sku = [];
	       $goodssku = Db::name('GoodsSku')->field('sku_id,item_path,price')->where('goods_id',$goods_id)->where('item_path','like',"{$week}%")->select();
		   foreach($goodssku as $key=>$vo){
			   if($vo['item_path'] != $week){
				   $spec = explode('-',$vo['item_path']);
				   $vo['spec_time'] = $item = Db::name('spec_item')->where('id',$spec['1'])->value('item');
				   $new_sku[intval($vo['spec_time'])] = $vo;
			   }else{
				   $vo['spec_time'] = '';
				   $new_sku[$key]   = $vo;
			   }
		   }
		   $server = new PlaceServer;
		   $new_sku = $server->getOneTime(time(),$goods_id);
		   
	       if($goodssku){
			   
	            $specList = [
	                'sku_list'  => $new_sku
	            ];
	       		$this->success('ok',$specList);
	       }else{
	       		$this->error('无规格');
	       }
	    }
	}

    public function order(){
        $id = $this->request->get('id', 0, 'intval');

        if (intval($id) === 0) {
            $this->error('无效的产品id！');
        } else {
            $where = [
                's.goods_id'        => $id,
                'o.order_status'    => 1
            ];
            $join = [
                ['__ORDER__ o','s.order_id = o.order_id'],
                ['__USER__ u','u.id = o.user_id']
            ];
            $list = DB::name('order_sub')->alias('s')->field('s.order_id,o.add_time,u.user_nickname,u.avatar')->join($join)->where($where)->limit(10)->select()->toArray();
            foreach ($list as $key => $value) {
                $list[$key]['add_time'] = date('Y-m-d H:i',$value['add_time']);
                $list[$key]['avatar'] = cmf_get_image_url($value['avatar']);
            }
           $this->success('请求成功!', $list);


        }
    }

    public function addComment(){
        $params   = $this->request->param();
        $order_id = $this->request->param('order_id',0,'intval');
        $user_id  = $this->getUserId();

        $order = Db::name('order')->field('order_id,supplier_id,is_comment')->where(['order_id'=>$order_id,'user_id'=>$user_id])->find();
        if($order){
            if($order['is_comment'] == 1){
                $this->error('订单已评论，不能重复评论！');
            }
            if(empty($params['content'])){
                $this->error('请填写评论内容！');
            }
            $goods_id = Db::name('order_sub')->where('order_id',$order_id)->value('goods_id');
            $data = [
                'img'         => $params['photo'],
                'goods_rank'  => $params['goods_rank'],
                'supplier_id' => $order['supplier_id'],
                'add_time'    => time(),
                'order_id'    => $order_id,
                'content'     => $params['content'],
                'user_id'     => $user_id,
                'goods_id'    => $goods_id
            ];

            $res = Db::name('goods_comment')->insert($data);
            if($res){
                
                Db::name('order')->where(['order_id'=>$order_id,'user_id'=>$user_id])->update(['is_comment'=>1]);

                $this->success('评论成功');

            }else{

                $this->success('评论失败，请稍后再试');
            }
        }else{
            $this->error('订单不存在！');
        }

    }

    public function getComment(){

        $id = $this->request->param('id',0,'intval');
        $GoodsCommentModel = new GoodsCommentModel;
        $where = ['goods_id'=>$id];
        $articles        = $GoodsCommentModel->relation('user')->where($where)->order('id', 'DESC')->paginate(10);

        if ($articles->isEmpty()) {
            $this->error('数据为空');
        } else {
            $this->success('获取成功!', $articles);
        }
    }
    /**
     * 获取分类列表
     */
    public function getCategory(){
        $catrgory=new GoodsCategoryModel;
        $order=[
            'listorder'=>'asc',
            'id'       =>'asc'
        ];
        $cat_list=$catrgory->where(['parent_id'=>0,'is_show'=>1])->order($order)->select();
        $response['cat_list'] = $cat_list;
    }
	

}
