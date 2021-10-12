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
use api\user\model\UserCoachModel;
use api\goods\model\GoodsTimeModel;

class CourseController extends RestBaseController
{
    // api 首页
    public function index()
    {
    	$catrgory = new GoodsCategoryModel;
        $goods    = new Goods();
    	$order=[
    		'list_order'=>'asc',
    		'id'	   =>'asc'
    	];
        $field = 'goods_id,goods_name,goods_img,shop_price,goods_address,latitude,longitude,keywords';
        $where = ['is_show'=>1,'parent_id'=>0];
    	$cat_list=$catrgory->field('id,name,cat_img')->where($where)->order($order)->limit(6)->select();
        foreach ($cat_list as $key => $value) {
            $cat_list[$key]['goods_list'] = $goods->field($field)->where('cat_id',$value['id'])->limit(10)->select();
        }
        $this->success("获取分类成功!", $cat_list);
    }
    /**/
    public function coach(){
    	
    	$model	= new UserCoachModel;
    	$result = $model->relation('user')->where('is_pt',1)->order(['list_order'=>'asc','id'=>'desc'])->paginate();
    	$list   = $result->items();
    	$new_list = [];
		foreach($list as $key=>$vo){
			
			if(!empty($vo['specialty'])){
				$tag_arr = Db::name('goods_tag')->where('id','in',$vo['specialty'])->order('list_order','asc')->column('name');
				$vo['tag_str'] = implode(' · ',$tag_arr);
			}
			
			$new_list[] = $vo;
		}
        $this->success('请求成功',$new_list);
    }
    
    public function coachDetail(){
    	
    	$id = request()->param('id',0,'intval');
    	$model	= new UserCoachModel;
    	$result = $model->relation('user,store')->where('id',$id)->find();
    	if($result){
    		$tag_arr = Db::name('goods_tag')->where('id','in',$result['specialty'])->order('list_order','asc')->column('name');
			$result['tag_str'] = implode(' · ',$tag_arr);
    	}
    	
    	$this->success('ok',$result);
    }
    /*首页产品*/
    public function getList(){

        $input 			=  request()->param();
        $cat_id 		=  request()->param('cat_id');
		$tag_id 		=  request()->param('tag_id',0,'intval');
		$coach_id       =  request()->param('coach_id',0,'intval');
		$interval 		=  request()->param('interval',0,'intval');
		$day_id 		=  request()->param('day_id', 0, 'intval');
        $is_recommend 	=  request()->param('is_recommend', 0, 'intval');
        $keyword    	=  request()->param('keyword');
		//date_time
        $date_time 		=  get_date_time($day_id);
		$set_time 		=  get_set_time($date_time);
		
        $where = [];
		$where[]    = ['date_time','=',$date_time];
		if($coach_id) $where[]    = ['coach_id','=',$coach_id];
		$whereor = "";
        // if($is_recommend)	$where[] = ['is_recommend','=',1];
		$order  = ['start_time'=>'asc','id' => 'desc'];
		if(!empty($cat_id)){
			
			$cat_id     = substr($cat_id,0,-1);
			$child_arr  = explode(',',$cat_id);
			$where[]    = ['cat_id','in',$child_arr];
			
		}
		if($tag_id)	$where[] = ['tag_id','like','%'.$tag_id.'%'];
		if(!empty($interval)){
			
			$list = [
				['name'=>'全部时段','checked'=>true],
				['name'=>'06:00-09:00','checked'=>false],
				['name'=>'09:00-12:00','checked'=>false],
				['name'=>'12:00-14:00','checked'=>false],
				['name'=>'14:00-18:00','checked'=>false],
				['name'=>'18:00-22:00','checked'=>false],
			];
			$star = date('Y-m-d',$date_time);
			$str_time   = explode('-',$list[$interval]['name']);
			$start_time = strtotime($star.' '.$str_time[0]);
			$end_time   = strtotime($star.' '.$str_time[1]);
			$whereor  = "start_time < $start_time or end_time < $end_time";
			// $where[]    = ['start_time','>',$start_time];
			// $where[]    = ['end_time','<',$end_time];
		}
		
        $limit = $is_recommend == 1?30:10;
		$model  = new GoodsTimeModel();
        $data   = $model->field('id,goods_id,user_id,coach_id,cat_id,shop_price,member_price,start_time,end_time,people_num,enroll_num')->relation('simplegoods,user')->where($where)->where($whereor)->order($order)->paginate($limit);
        
        $list = $data->items();
		$new_list = [];
		$now_time = time();
		foreach($list as $key=>$vo){
			
			if(!empty($vo['simplegoods']['tags'])){
				$tag_arr = Db::name('goods_tag')->where('id','in',$vo['simplegoods']['tags'])->order('list_order','asc')->column('name');
				$vo['simplegoods']['tag_str'] = implode(' · ',$tag_arr);
			}
			$vo['time_str']    = date('H:i',$vo['start_time']).'-'.date('H:i',$vo['end_time']);
			
			//课程状态 1：一开始；2：等候中
			$time_status	   = ($vo['enroll_num'] >= $vo['people_num'])?2:0;
	
			if($vo['start_time'] < $now_time){
				$vo['time_status'] = 1;
				$vo['status_name'] = ($vo['end_time'] > $now_time)?'已开始':"已结束";
			}else{
				$vo['time_status']  = $time_status;
			}
			
			$new_list[] = $vo;
		}
		
		$set_time = empty($new_list)?$set_time:0;
		
        $this->success('ok!', ['set_time'=>$set_time,'list'=>$new_list]);

    }
    /**
     * 获取指定的文章
     * @param int $id
     */
    public function detail()
    {
        $id = $this->request->get('id', 0, 'intval');

        if (intval($id) === 0) {
            $this->error('无效的！');
        } else {
			
            $model    = new GoodsTimeModel();
            $data     = $model->relation('user,goods,userCoach,store')->where('id',$id)->find();
            if (empty($data)) {
                $this->error('课程不存在！');
            } else {
                if(!empty($data['goods']['tags'])){
                	$data['goods']['tag_arr'] = Db::name('goods_tag')->field('id,name')->where('id','in',$data['goods']['tags'])->order('list_order','asc')->select();
                }
				$data['time_str'] = get_class_day($data['start_time'],$data['end_time']);
                Db::name('goods')->where('goods_id', $data['goods_id'])->setInc('click_count');
                
                //课程状态 1：一开始；2：等候中
                $time_status	      = ($data['enroll_num'] >= $data['people_num'])?2:0;
				$data['time_status']  = ($data['start_time'] < time())?1:$time_status;
				
                $this->success('请求成功!', $data);
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
