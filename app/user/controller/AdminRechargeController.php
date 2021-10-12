<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------

namespace app\user\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
 * Class AdminIndexController
 * @package app\user\controller
 */
class AdminRechargeController extends AdminBaseController
{


    public function index(){
        $group_list = Db::name("recharge")->order('id','desc')->paginate(10);
        $page = $group_list->render();
        $this->assign("list",$group_list);
        $this->assign('page', $page);
        return $this->fetch();
    }

    public function edit(){
        $id= $this->request->param('id',0,'intval');
        
        if (request()->ispost()) {
            $param 			 = request()->param();
			$param['status'] = request()->param('status',0,'intval');
			
            Db::name('recharge')->where('id',$id)->update($param);
            $this->success('修改成功',url('user/AdminRecharge/index'));
        }
        $group = Db::name("recharge")->where("id",$id)->find();
        $this->assign('data',$group);
        return $this->fetch();
    }

    public function add(){
        
        if (request()->ispost()) {
			
            $param = request()->param();
            Db::name('recharge')->insert($param);
			
            $this->success('添加成功',url('user/AdminRecharge/index'));
        }
        return $this->fetch();
    }

    public function groupdelt(){
        $id= $this->request->param('id',0,'intval');
        Db::name('recharge')->where('id',$id)->delete();
        $this->success('删除成功');
    }
	
	public function delete_all(){
		
		$ids = request()->param('ids/a');
		if(!empty($ids)){
		
			if (Db::name('recharge')->where('id','in',$ids)->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	
	//排序
	public function listOrder()
	{
	    parent::listOrders('recharge');
	    $this->success("排序更新成功！", '');
	}

}
