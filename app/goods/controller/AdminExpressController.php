<?php

namespace app\goods\controller;

use cmf\controller\AdminBaseController;
use think\db;

class AdminExpressController extends AdminbaseController {


	// 后台产品分类列表
    public function index(){

		$request = $this->request->param();
		$keyword = $this->request->param('keyword');
		$where   = [];
        if($keyword)$where[] = ['name','like',"%$keyword%"];
		

		$data = Db::name('shipping_express')->where($where)->order("list_order asc")->paginate(10);

		$data->appends($request);
        // 获取分页显示
        $page = $data->render();


		$this->assign('page', $page);
		$this->assign('list',$data);
		return $this->fetch();
	}

	//添加
	public function add(){

		return $this->fetch();
	}

	public function add_post(){
		if ($this->request->isPost()) {
			$request = $this->request->param();
			$data = $request['post'];
			if(empty($data['name']))$this->error("快递名称不能为空！");
			$res = Db::name('shipping_express')->insert($data);

			if ($res) {
				$this->success("添加成功！");
			} else {
				$this->error('添加失败');
			}

		}
	}

	//编辑
	public function edit(){

		$id = input('param.id', 0, 'intval');

		$data = DB::name('shipping_express')->where("id",$id)->find();
		
		$this->assign('data',$data);

		return $this->fetch();
	}

	public function edit_post(){
		$id = request()->param('id',0,'intval');
		if ($this->request->isPost()) {
			$request = $this->request->param();
			$data = $request['post'];
			if(empty($data['name']))$this->error("快递名称不能为空！");
			
			$res = Db::name('shipping_express')->where('id',$id)->update($data);

			if ($res) {
				$this->success("修改成功！");
			} else {
				$this->error('信息未改变');
			}

				

		}
	}


	public function listOrder()
    {
        parent::listOrders('shipping_express');
        $this->success("排序更新成功！", '');
    }

}
