<?php

namespace app\goods\controller;

use cmf\controller\AdminBaseController;
use app\goods\model\GoodsTimeModel;
use think\db;
use think\Validate;
use tree;

class AdminTimeController extends AdminbaseController {

	// 后台产品分类列表
    public function index(){

		
		$this->_getTree();
		return $this->fetch();
	}

	public function ajax(){
		$param = request()->param();
		$limit = request()->param('limit',10,'intval');
		$title = request()->param('title');
		$status = request()->param('status');
		$cat_id = request()->param('cate_id');

		$order = 'goods_id';
		$src   = "desc";
		$order = [
			'year'		  => 'desc',
			'month'		  => 'desc',
			'day'		  => 'desc',
			'start_time'  => 'desc',
			'id'          => 'desc'
		];
		$where = [];
		
		if($status != '')   $where[]  = ['t.is_on_sale','=',$status];
		if(!empty($cat_id)) $where[]  = ['t.cat_id','=',$cat_id];
		if(!empty($title))  $where[]  = ['g.goods_name','like','%'.$title.'%'];

		$join=[
			['goods g','g.goods_id = t.goods_id','left'],
        	['goods_category c','g.cat_id = c.id','left'],
			['user u','t.user_id = u.id','left'],
        ];
		$count = Db::name('goods_time')->alias('t')->join($join)->where($where)->count();
		$model = new GoodsTimeModel;
		$data  = $model->field('t.*,c.name as cate_name,g.goods_name,u.user_nickname')->alias('t')->join($join)->where($where)->order($order)->paginate($limit);
		$list = $data->items();
		foreach($list as $key=>$vo){
			$list[$key]['lesson_time'] = date('Y-m-d H:i',$vo['start_time']).'~'.date('H:i',$vo['end_time']);
		}
		$result = ['code'=>0,'count'=>$count,'data'=>$list];
		die(json_encode($result));
	}


	public function _getTree(){

		$join = [
			['user u','c.user_id = u.id','left']
		];
		$user_coach = Db::name("user_coach")->alias('c')->field('c.*,u.user_nickname,u.mobile')->join($join)->select();
		$goods_list = Db::name('goods')->field('goods_id,goods_name')->where('is_on_sale',1)->select();
		
		$tree = new \tree\Tree();
		$tree->icon = array('│ ', '├─ ', '└─ ');
		$tree->nbsp = ' ';
		$category = Db::name('goodsCategory')->order("parent_id_path","asc")->select()->toarray();
		$new_category=array();
		foreach ($category as $r) {
			$r['id']        = $r['id'];
			$r['parentid']  = $r['parent_id'];
			$r['selected']  = "";
			$new_category[] = $r;
		}
		$tree->init($new_category);
		$tree_tpl="<option value='\$id' \$selected>\$spacer\$name</option>";
		$tree=$tree->getTree(0,$tree_tpl);
		
		$this->assign("category_tree",$tree);
		$this->assign('goods_list',$goods_list);
		$this->assign('user_coach',$user_coach);
		
	}



	public function add(){
		
		//产品教练 课程
		if ($this->request->isPost()) {
			$request = $this->request->param();
			$data=$request['post'];
			
			$validate = new Validate([
			    'goods_id' 		=> 'require',
			    'coach_id' 		=> 'require',
			    'start_time' 	=> 'require',
			    'end_time'      => 'require',
			    'shop_price'    => 'require|float',
				'member_price'  => 'require|float'
			]);
			$validate->message([
			    'goods_id.require' 		=> '请选择课程',
			    'coach_id.require' 		=> '请选择教练',
			    'start_time.require' 	=> '请选择上课时间',
			    'end_time.require' 		=> '请选择上课时间',
			    'shop_price.require' 	=> '请填写课程价格',
			    'member_price.require' 	=> '请填写会员价格',
				'shop_price.float' 	=> '课程价格格式不对',
				'member_price.float' 	=> '会员价格格式不对'
			]);
			
			if (!$validate->check($data)) {
			    $this->error($validate->getError());
			}
			
			
			$model  = new GoodsTimeModel;
			$result = $model->add($data);
			
			if ($result) {
				$this->success("添加成功！",url('goods/adminTime/index'));
			} else {
				$this->error("添加失败！");
			}
		}
		$this->_getTree();

		return $this->fetch();
	}

	public function edit(){

		$id = request()->param('id',0,'intval');
		$model     = new GoodsTimeModel;
		$data_info = $model->where("id",$id)->find();

		if ($this->request->isPost()) {
			$request = $this->request->param();
				$data = $request['post'];
				
				$validate = new Validate([
				    'goods_id' 		=> 'require',
				    'coach_id' 		=> 'require',
				    'start_time' 	=> 'require',
				    'end_time'      => 'require',
				    'shop_price'    => 'require|float',
					'member_price'  => 'require|float'
				]);
				$validate->message([
				    'goods_id.require' 		=> '请选择课程',
				    'coach_id.require' 		=> '请选择教练',
				    'start_time.require' 	=> '请选择上课时间',
				    'end_time.require' 		=> '请选择上课时间',
				    'shop_price.require' 	=> '请填写课程价格',
				    'member_price.require' 	=> '请填写会员价格',
					'shop_price.float' 	    => '课程价格格式不对',
					'member_price.float' 	=> '会员价格格式不对'
				]);
				
				if (!$validate->check($data))		$this->error($validate->getError());
				if($data_info['enroll_num'] > 0)	$this->error('已有人报名，不可以修改！');
				
				$data['is_on_sale']  = request()->param('post.is_on_sale',0,'intval');
				
				$result = $model->edit($data);
				
				if ($result) {
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
		}
		
		
		$this->_getTree();
		$this->assign("data",$data_info);
		return $this->fetch();
	}


	//放入回收站
	/*public function delete(){
		$request = $this->request->param();
		$id = $request['id'];
		
		$result = $this->goods_model->where("goods_id",$id)->delete();

		if($result){
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
	}*/

	public function delete_all(){
		
		$request = $this->request->param();
		if(isset($request['ids'])){
		
			$ids = request()->param('ids/a');
			//$count = Db::name('goods_time')->where('id','in',$ids)->where('enroll_num','>',0)->count();
			//if($count > 0)	$this->error("已有人报名！");
			
			if (Db::name('goods_time')->where('id','in',$ids)->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}

	
	/**
     * ajax 修改指定表数据字段  一般修改状态 比如 是否推荐 是否开启 等 图标切换的
     * table,id_name,id_value,field,value
     */
    public function changeVal(){
    		$request = $this->request;

            $id = $request->param('id'); // 表主键id值
            $field  = $request->param('field'); // 修改哪个字段
            $value  = $request->param('value'); // 修改字段值
            DB::name('goods_time')->where("id",$id)->update([$field=>$value]); // 根据条件保存修改的数据
    }
	
	//排序
    public function listOrder()
    {
        parent::listOrders(Db::name('goods_time'));
        $this->success("排序更新成功！", '');
    }

}
