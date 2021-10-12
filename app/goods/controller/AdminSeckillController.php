<?php

namespace app\goods\controller;

use cmf\controller\AdminBaseController;
use app\goods\model\GoodsModel;
use app\goods\model\StoreSeckillModel;
use think\db;
use tree;

class AdminSeckillController extends AdminbaseController {

	protected $goods_model;


	// 后台产品分类列表
    public function index(){

		$where   = [];
		$param  = $this->request->param();
		if(!empty($param['keyword']))$where['title'] = ['like','%'.$param['keyword'].'%'];
		$order=[
			'list_order'=>'asc',
			'id'=>'desc',
		];


        $list=Db::name('StoreSeckill')->where($where)->order($order)->paginate(10);
        // 获取分页显示
        $list->appends($param);
        $page = $list->render();

        $this->assign('list', $list);
        $this->assign('page', $page);

		return $this->fetch();
	}
	/**
	 * ajax 列表
	 */
	public function ajax(){
		$param = request()->param();
		$limit = request()->param('limit',10,'intval');
		$title = request()->param('title');
		$status = request()->param('status');

		$order = 'id';
		$src   = "desc";
		$where = [];
		if($status != '')$where['status'] = $status;
		if(!empty($title))$where[] = ['title','like','%'.$title.'%'];

		$startTime = empty($param['start_time']) ? 0 : strtotime($param['start_time']);
		$endTime   = empty($param['end_time']) ? 0 : strtotime($param['end_time'].' 23:59');


		if(!empty($startTime))$where['start_time'] = ['>',$startTime];
		if(!empty($endTime))$where['end_time'] = ['<',$endTime];

		$count = Db::name('StoreSeckill')->where($where)->count();

		$model  = new StoreSeckillModel;
		$data = $model->where($where)->order($order,$src)->paginate($limit)->toarray();
		$list = $data['data'];

		foreach ($list as $key => $value) {
			$list[$key]['end_time'] = date('Y-m-d H:i',$value['end_time']);
		}

		$result = ['code'=>0,'count'=>$count,'data'=>$list];
		die(json_encode($result));
	}

	public function add(){

		$id = request()->param('id',0,'intval');
		$model = new GoodsModel;
		$data  = $model->where("goods_id",$id)->find();
		$this->assign("data",$data);

		return $this->fetch();

	}


	public function add_post(){


		if ($this->request->isPost()) {

				$request = $this->request->param();
				$data=$request['post'];
				if($data['title'] == ''){
					$this->error("请填写活动标题");
				}
				$model  = new StoreSeckillModel;
				$result = $model->add($data);

				if ($result) {
					$this->success("添加成功！",url('AdminSeckill/index'));
				} else {
					$this->error("添加失败！");
				}
		}
	}

	public function edit(){

		$id = request()->param('id',0,'intval');

		$model  = new StoreSeckillModel;
		$data   = $model->where('id' ,$id)->find();

		$this->assign("data",$data);
		return $this->fetch();
	}

	public function edit_post(){
		if ($this->request->isPost()) {
			$request = $this->request->param();
				$data = $request['post'];
				if($data['title'] == ''){
					$this->error("活动名称不能为空！");
				}

				$model  = new StoreSeckillModel;
				$result = $model->edit($data);


				if ($result) {
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
		}
	}

	//放入回收站
	public function delete(){
		$request = $this->request->param();
		$id = $request['id'];
		$model  = new StoreSeckillModel;
		$result = $model->where("id",$id)->delete();

		if($result){
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
	}

	public function status(){
		$status = request()->param('status',0,'intval');
		$id 	= request()->param('id',0,'intval');
		Db::name('StoreSeckill')->where('id',$id)->update(['status'=>$status]);
		$this->success('ok');
	}

    public function listOrder()
    {
        parent::listOrders(Db::name('goods'));
        $this->success("排序更新成功！", '');
    }

}
