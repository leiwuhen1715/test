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
class AdminRankController extends AdminBaseController
{


    public function index(){
    	
        $list = Db::name("user_rank")->order('id','desc')->paginate(10);
        $page = $list->render();
        $this->assign("list",$list);
        $this->assign('page', $page);
        
        return $this->fetch();
    }


    public function add(){
        $request=request();
        if ($request->ispost()) {
        	$param 			 = request()->param();
            $rank_name  = $request->param('rank_name');
            if(empty($rank_name))  $this->error('请填写会员等级');
            
            Db::name('user_rank')->insert($param);
            $this->success('添加成功',url('user/AdminRank/index'));
            
        }
        return $this->fetch();
    }
	
	
    public function edit(){
        $id= $this->request->param('id',0,'intval');
        
        if (request()->ispost()) {
            $param 			 = request()->param();
			$param['status'] = request()->param('status',0,'intval');
			
            Db::name('user_rank')->where('id',$id)->update($param);
            $this->success('修改成功',url('user/AdminRank/index'));
        }
        $group = Db::name("user_rank")->where("id",$id)->find();
        $this->assign('data',$group);
        return $this->fetch();
    }
    
    public function delt(){
        $id= $this->request->param('id',0,'intval');
        Db::name('user_rank')->where('id',$id)->delete();
        $this->success('删除成功');
    }
	
	public function delete_all(){
		
		$ids = request()->param('ids/a');
		if(!empty($ids)){
		
			if (Db::name('user_rank')->where('id','in',$ids)->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	
	//排序
	public function listOrder()
	{
	    parent::listOrders('user_rank');
	    $this->success("排序更新成功！", '');
	}

}
