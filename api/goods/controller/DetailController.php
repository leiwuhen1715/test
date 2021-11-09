<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\goods\controller;


use api\goods\service\SkuServer;
use think\Db;
use cmf\controller\RestBaseController;
use api\goods\model\GoodsModel as Goods;
use api\goods\model\GoodsSkuModel;
use api\goods\logic\GoodsLogic;
use api\goods\model\GoodsCommentModel;

class DetailController extends RestBaseController
{

    /**
     * 获取指定的文章
     * @param int $id
     */
    public function index()
    {
        $id = request()->get('id', 0, 'intval');

        $goods   = new Goods();
        $data    = $goods->where('goods_id',$id)->find();


        if (empty($data)) {

            $this->error('产品不存在！');
        } else {
            $goods->where('goods_id', $id)->setInc('click_count');
            $user_id = $this->userId;
            $data['is_collect'] = Db::name('user_favorite')->where(['user_id'=> $user_id,'object_id' => $id])->where('table_name','goods')->value('id');

            $result = [
                'goods'     => $data
            ];
            $this->success('请求成功!', $result);
        }


    }
	/**
     * 获取指定的文章
     * @param int $id
     */
    public function getSku()
    {
        $id = request()->get('id', 0, 'intval');

        $logic      = new GoodsLogic;
        $skuModel   = new GoodsSkuModel;
        $specList   = $logic->getSpecList($id);
        $goodssku   = $skuModel->field('item_path,sku_id,price,store_count,hire_price,sku_img')->where('goods_id',$id)->select();

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

    /**
     * 获取每日库存
     */
    public function getCount(){

        $goods_id = request()->param('id',0,'intval');
        $sku_id   = request()->param('sku_id',0,'intval');
        $service = new SkuServer();
        $start_time = strtotime(date("Y-m-d",time()));
        $end_time   = strtotime(date("Y-m-1 00:00:00", strtotime("+2 month")))-1;
        $result  = $service->dateCount($goods_id,$sku_id,$start_time,$end_time);

        $this->success('ok',$result);
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

    public function doFavorite()
    {
        $userId = $this->getUserId();
        $id     = request()->param('id', 0, 'intval');


        $findFavoriteCount = Db::name('user_favorite')->where(['user_id'   => $userId,'object_id' => $id])->where('table_name','goods')->find();

        if (empty($findFavoriteCount)) {


            $data   = Db::name('goods')->where('goods_id',$id)->field('goods_id,goods_name,goods_img,goods_remark')->find();
            if (empty($data)) 	$this->error('产品不存在！');

            Db::startTrans();
            try {
                Db::name('user_favorite')->insert([
                    'user_id'     => $userId,
                    'object_id'   => $id,
                    'table_name'  => 'goods',
                    'thumbnail'   => $data['goods_img'],
                    'title'       => $data['goods_name'],
                    'description' => $data['goods_remark'],
                    'url'         => '',
                    'create_time' => time()
                ]);
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();
                $this->error('收藏失败！');
            }

            $this->success("收藏好啦！");
        } else {
            $this->error("您已收藏过啦！");
        }
    }

    /**
     * 取消文章收藏
     */
    public function cancelFavorite()
    {
        $userId = $this->getUserId();

        $id     = $this->request->param('id', 0, 'intval');

        $findFavoriteCount = Db::name('user_favorite')->where(['user_id'   => $userId,'object_id' => $id])->where('table_name','goods')->find();

        if (!empty($findFavoriteCount)) {

            Db::startTrans();
            try {

                Db::name('user_favorite')->where(['user_id' => $userId,'object_id' => $id])->where('table_name', 'goods')->delete();
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();
                $this->error('取消失败！');
            }

            $this->success("取消成功！");
        } else {
            $this->error("您还没收藏过！");
        }
    }
    public function cancelAll()
    {
        $userId = $this->getUserId();

        $ids     = $this->request->param('ids');
        $id_arr  = explode(',',$ids);
        $result = Db::name('user_favorite')->where('user_id' , $userId)->where('id','in',$id_arr)->delete();

        if ($result) {

            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }
}
