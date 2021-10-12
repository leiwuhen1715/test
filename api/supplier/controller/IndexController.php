<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\supplier\controller;

use think\Db;
use api\user\model\UserFavoriteModel;
use cmf\controller\RestBaseController;
use api\supplier\model\SupplierModel;

class IndexController extends RestBaseController
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
	/*首页产品*/
	public function list(){
	
	    $input 		=  request()->param();
	    $id 		=  request()->param('category_id', 0, 'intval');
	    $prome_type =  request()->param('prome_type', 0, 'intval');
		$plat_type  =  request()->param('plat_type', 0, 'intval');
		$order      =  request()->param('order', 0, 'intval');
		$keyword    =  request()->param('keyword');
		$lat 		=  request()->param('lat');
		$lng 		=  request()->param('lng');
	
	    $where = [];
	
	    
		
		
	    if($prome_type) 	$where[] = ['prome_type','=',$prome_type];
		if($plat_type) 	    $where[] = ['plat_type','=',$plat_type];
	    if($keyword)		$where[] = ['supplier_name','like',"%".$keyword."%"];
		
		if($id){
			$c_where = ['parent_id'=>$id,'is_show'=>1];
			$cat_list = Db::name('goods_category')->where($c_where)->column('id');
			if(empty($cat_list)){
				$where[]    = ['cat_id','=',$id];
			}else{
				$cat_list[] = $id;
				$where[]    = ['cat_id','in',$cat_list];
			}
		}
		$order_arr = [
			['list_order'	=> 'asc','distance'	=> 'asc','store_count'	=> 'asc','id' => 'desc'],
			['distance'		=> 'asc','id' => 'desc'],
			['store_count'	=> 'desc','id' => 'desc'],
			['ret_price'		=> 'desc','id' => 'desc']
		];
		
		
		$model = new SupplierModel;
	    $data  = $model->field("*,sqrt( ( ((".$lng."-longitude)*PI()*12656*cos(((".$lat."+latitude)/2)*PI()/180)/180) * ((".$lng."-longitude)*PI()*12656*cos (((".$lat."+latitude)/2)*PI()/180)/180) ) + ( ((".$lat."-latitude)*PI()*12656/180) * ((".$lat."-latitude)*PI()*12656/180) ) )/2 as distance")->where($where)->order($order_arr[$order])->paginate(10);
	    $list  = $data->items();
		foreach($list as $key=>$vo){
		    //  $distance = $model->getDistance($lat,$lng,$vo['latitude'],$vo['longitude']);
			$list[$key]['distance'] = sprintf("%.2f",$vo['distance']);
		}
	    $this->success('ok!', $list);
	
	}
    /*推荐商家*/
    public function recommend(){

        $input 			=  request()->param();
        $id 			=  request()->param('category_id', 0, 'intval');
        $prome_type 	=  request()->param('prome_type', 0, 'intval');
        $keyword    	=  request()->param('keyword');

        $where = [
			['recommend','=',1]
		];

        if($id){
           
			$c_where = ['parent_id'=>$id,'is_show'=>1];
			$cat_list = Db::name('goods_category')->where($c_where)->column('id');
			if(empty($cat_list)){
				$where[]    = ['cat_id','=',$id];
			}else{
				$cat_list[] = $id;
				$where[]    = ['cat_id','in',$cat_list];
			}
        }
        if($prome_type) 		$where[] = ['prome_type','=',$prome_type];
        if($keyword)		$where[] = ['supplier_name','like',"%".$keyword."%"];

        $order = [
            'list_order' => 'asc',
            'id'   		 => 'desc'
        ];
		$model = new SupplierModel;
        $data  = $model->field('*')->where($where)->order($order)->paginate(4);
        $list  = $data->items();
        $this->success('ok!', $list);

    }
    
    /**
     * 获取指定的文章
     * @param int $id
     */
    public function detail()
    {
        $id = $this->request->get('id', 0, 'intval');
		if(empty($id))  $this->error('无效的请求！');
			
		$model   = new SupplierModel();
		$data    = $model->where('id',$id)->find();
		Db::name('supplier')->where('id', $id)->setInc('click_count');

		if (empty($data)) {
			
			$this->error('产品不存在！');
		} else {
			$user_id = $this->userId;
			$data['is_collect'] = Db::name('user_favorite')->where(['user_id'=> $user_id,'object_id' => $id])->where('table_name','supplier')->value('id');
			$this->success('请求成功!', $data);
		}

    }
	
	public function doFavorite()
	{
	    $userId = $this->getUserId();
	    $id     = request()->param('id', 0, 'intval');
	
	    $model = new UserFavoriteModel();
	
	    $findFavoriteCount = Db::name('user_favorite')->where(['user_id'   => $userId,'object_id' => $id])->where('table_name','supplier')->find();
	
	    if (empty($findFavoriteCount)) {
			
			
	        $data   = Db::name('supplier')->where('id',$id)->field('id,supplier_name,thumbnail,description')->find();
	        if (empty($data)) 	$this->error('商家不存在！');
	        
	        Db::startTrans();
	        try {
	            Db::name('user_favorite')->insert([
	                'user_id'     => $userId,
	                'object_id'   => $id,
	                'table_name'  => 'supplier',
	                'thumbnail'   => $data['thumbnail'],
	                'title'       => $data['supplier_name'],
	                'description' => $data['description'],
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
	
	    $findFavoriteCount = Db::name('user_favorite')->where(['user_id'   => $userId,'object_id' => $id])->where('table_name','supplier')->find();
	
	    if (!empty($findFavoriteCount)) {
			
	        Db::startTrans();
	        try {
				
	            Db::name('user_favorite')->where(['user_id' => $userId,'object_id' => $id])->where('table_name', 'supplier')->delete();
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
