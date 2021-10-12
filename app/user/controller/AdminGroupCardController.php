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
class AdminGroupCardController extends AdminBaseController
{


    public function index(){
        $group_list = Db::name("user_group_card")->order('id','desc')->paginate(10);
        $page = $group_list->render();
        $this->assign("list",$group_list);
        $this->assign('page', $page);
        return $this->fetch();
    }

    public function groupedit(){
        $id= $this->request->param('id',0,'intval');
        
        if (request()->ispost()) {
            $param 			 = request()->param();
			$param['status'] = request()->param('status',0,'intval');
			
            Db::name('user_group_card')->where('id',$id)->update($param);
            $this->success('修改成功',url('user/AdminGroupCard/index'));
        }
        $group = Db::name("user_group_card")->where("id",$id)->find();
        $this->assign('data',$group);
        return $this->fetch();
    }

    public function groupadd(){
        $request=request();
        if ($request->ispost()) {
            $title = $request->param('title');
            Db::name('user_group_card')->insert(['title'=>$title]);
            $this->success('添加成功',url('user/AdminGroupCard/index'));
        }
        return $this->fetch();
    }

    public function groupdelt(){
        $id= $this->request->param('id',0,'intval');
        Db::name('user_group_card')->where('id',$id)->delete();
        $this->success('删除成功');
    }
	
	public function delete_all(){
		
		$ids = request()->param('ids/a');
		if(!empty($ids)){
		
			if (Db::name('user_group_card')->where('id','in',$ids)->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	
	//排序
	public function listOrder()
	{
	    parent::listOrders('user_group_card');
	    $this->success("排序更新成功！", '');
	}

}
