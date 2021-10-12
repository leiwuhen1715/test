<?php

namespace app\goods\controller;

use app\goods\model\SupplierModel;
use cmf\controller\AdminBaseController;
use think\db;

class AdminSupplierController extends AdminbaseController {


	// 后台产品分类列表
    public function index(){

		return $this->fetch();
	}

	public function ajax(){
		$param = request()->param();
		$page  = request()->param('page',1,'intval');
		$limit = request()->param('limit',10,'intval');
		$plat_type  = request()->param('plat_type',0,'intval');
		$prome_type = request()->param('prome_type',0,'intval');
		
		
		$title = request()->param('title');
		$status = request()->param('status');
		$cat_id = request()->param('cate_id');

		$order = 'id';
		$src   = "desc";
		$where = [];
		if($status != '')		$where[]   = ['status','=',$status];
		if(!empty($plat_type))	$where[]   = ['plat_type','=',$plat_type];
		if(!empty($prome_type))	$where[]   = ['prome_type','=',$prome_type];
		if(!empty($title))		$where[]   = ['supplier_name','like','%'.$title.'%'];

		$join=[
        	['goods_category c','g.cat_id = c.id','left']
        ];
		$count = DB::name('supplier')->where($where)->count();
		$start = ($page-1)*$limit;
		$model = new SupplierModel;
		$data  = $model->field('g.*')->alias('g')->where($where)->order($order,$src)->limit($start,$limit)->select()->each(function ($item){
			
			$item['prome_name'] = '已完成';
			$item['plat_name']  = $item['plat_type']=='1'?'饿了么':($item['plat_type']=='2'?'美团':'');
			$item['prom_name']  = $item['prome_type']=='1'?'霸王餐':($item['prome_type']=='2'?'返利餐':'');
			return $item;
		});

		$result = ['code'=>0,'count'=>$count,'data'=>$data];
		die(json_encode($result));
	}

	public function add(){
		
		$province_list   = Db::name('plugin_modules_citys')->field('id,name,areaname')->where(['pid'=>0])->select();
		$this->assign('pro_list',$province_list);
		$this->_getTree();
		return $this->fetch();
	}

	public function add_post(){
		if ($this->request->isPost()) {

			$request = $this->request->param();

			$data = $request['post'];
			if($data['supplier_name'] == ''){
				$this->error("名称不能为空！");
			}
			$model  = new SupplierModel;
			$result = $model->add($data);
			if ($result) {

				$this->success("添加成功！",url('goods/admin_supplier/index'));
			} else {
				$this->error("添加失败！");
			}
		}
	}

	public function edit(){
		$id = request()->param('id',0,'intval');
		$model  = new SupplierModel;
		$data   = $model->where("id",$id)->find();
		
		$cit_list = $are_list = [];
		$pro_list   = Db::name('plugin_modules_citys')->field('id,name,areaname')->where('pid',0)->select();
		if($data['province_id']){
			$cit_list   = Db::name('plugin_modules_citys')->field('id,name,areaname')->where('pid',$data['province_id'])->select();
		}
		if($data['city_id']){
			$are_list   = Db::name('plugin_modules_citys')->field('id,name,areaname')->where('pid',$data['city_id'])->where('level3','in',[4,5])->select();
		}
		$this->_getTree($data['cat_id']);
		$this->assign([
			"data" 		=> $data,
			'pro_list' 	=> $pro_list,
			'cit_list' 	=> $cit_list,
			'are_list' 	=> $are_list,
		]);
		return $this->fetch();
	}

	public function edit_post(){
		$request = request()->param();

		$data = $request['post'];
		$data['status'] = request()->param('post.status',0,'intval');

		if(empty($data['supplier_name'])){
			$this->error("商家不能为空！");
		}
      	$id = $data['id'];
		$model  = new SupplierModel;
		$result = $model->edit($data);

		if ($result) {

			// $user_id = Db::name('supplier')->where('id',$id)->value('user_id');
			// Db::name('user')->where('id',$user_id)->update(['is_supplier'=>$data['status']]);

			$this->success("保存成功！",url('goods/admin_supplier/index'));
		} else {
			$this->error("信息未改变！");
		}
	}
	
	public function _getTree($cat_id =0){
	
		$tree = new \tree\Tree();
	 	$tree->icon = array('│ ', '├─ ', '└─ ');
	 	$tree->nbsp = ' ';
	 	$category = Db::name('goodsCategory')->order("parent_id_path","asc")->select()->toarray();
	 	$new_category=array();
	 	foreach ($category as $r) {
	 		$r['id']=$r['id'];
	 		$r['parentid']=$r['parent_id'];
	 		$r['selected']= (!empty($cat_id) && $r['id']==$cat_id)? "selected":"";
	 		$new_category[] = $r;
	 	}
	 	$tree->init($new_category);
	 	$tree_tpl = "<option value='\$id' \$selected>\$spacer\$name</option>";
	 	$tree	  = $tree->getTree(0,$tree_tpl);
		
	 	$this->assign("category_tree",$tree);
	}
	
	public function delete_all(){
		$ids = request()->param('ids/a');
        $user_list = Db::name('supplier')->where("id",'in',$ids)->column('user_id');
		$result=Db::name('supplier')->where("id",'in',$ids)->delete();
		if($result !== false){
		    Db::name('user')->where('id','in',$user_list)->update(['is_supplier'=>0]);
			$this->success("删除成功！");
		}else{
			$this->error("删除失败！");
		}
	}

	/**/
	public function changeVal(){
		$request = $this->request;
        $id = $request->param('id'); // 表主键id值
        $field  = $request->param('field'); // 修改哪个字段
        $value  = $request->param('value'); // 修改字段值
		DB::name('supplier')->where("id",$id)->update([$field=>$value]); // 根据条件保存修改的数据
		
		if($field == 'status'){
			$user_id = Db::name('supplier')->where('id',$id)->value('user_id');
			Db::name('user')->where('id',$user_id)->update(['is_supplier'=>$value]);
		}
    }
	
	//位置选择
	public function position(){
	   
	    $ip = get_client_ip(0, true);//get_client_ip(0, true);
	    $ip = '117.35.133.119';
		$latitude       = request()->param('latitude');
		$longitude      = request()->param('longitude');
		
	    $location = session('location');
	    $ad_info  = session('ad_info');
	
	    if(empty($location)){
	        $url = "https://apis.map.qq.com/ws/location/v1/ip?ip=".$ip."&key=TD2BZ-SRZ6F-GXTJH-NGYPK-FYC6T-A4BFC&output=json";
	        $res = json_decode(cmf_curl_get($url),true);
	
	        if($res['status']==0){
	            $location = $res['result']['location'];
	            $ad_info  = $res['result']['ad_info'];
	
	            session('location',$res['result']['location']);
	            session('ad_info',$res['result']['ad_info']);
	        }
	    }
		if(!empty($latitude)){
			$location['lat'] = $latitude;
			$location['lng'] = $longitude;
		}
		
	    $this->assign('location',$location);
	    $this->assign('ad_info',$ad_info);
	    return $this->fetch();
	}
	/**
	 * Notes: 获取市区
	 * Datetime: 2021/5/28 15:40
	 */
	public function getCity(){
		$id     = input('id',0,'intval');
		$data   = Db::name('plugin_modules_citys')->field('*,concat(name,areaname) as name')->where(['pid'=>$id])->select();
		
		$this->success('ok','',$data);
	}
	
	public function getArea(){
		
		$id             = input('id',0,'intval');
	
		$data   = Db::name('plugin_modules_citys')->field('*,concat(name,areaname) as name')->where([
		                    ['pid','=',$id],
		                    ['level3','in',[4,5]]
		                ])->select();
	
		$this->success('ok','',$data);
	}
	
	public function bill(){
	    
	    $supplier_list = Db::name('supplier')->field('id,supplier_name')->order(['list_order'=>'asc','id'=>'desc'])->select();
	    $this->assign('supplier_list',$supplier_list);
	    
	    return $this->fetch();
	}

}
