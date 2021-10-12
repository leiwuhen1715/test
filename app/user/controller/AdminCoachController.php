<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------

namespace app\user\controller;

use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;

/**
 * Class AdminIndexController
 * @package app\user\controller
 *
 */
class AdminCoachController extends AdminBaseController
{

    /**
     * 后台本站用户列表
     */
    public function index()
    {
        $content = hook_one('user_admin_index_view');

        if (!empty($content)) {
            return $content;
        }
		$join = [
			['user u','c.user_id = u.id','left'],
			['supplier s','c.store_id = s.id','left']
		];
        $list = Db::name('user_coach')->alias('c')->field('c.*,u.user_login,u.user_nickname,u.mobile,s.supplier_name')->join($join)
            ->where(function (Query $query) {
                $data = $this->request->param();
                if (!empty($data['keyword'])) {
                    $keyword = $data['keyword'];
                    $query->where('u.user_login|u.user_nickname|u.user_email|u.mobile', 'like', "%$keyword%");
                }
            })->order("c.id DESC")->paginate(10);
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }
	
	//
	public function add(){
	    if(request()->ispost()){
			
			$param			= request()->param();
			$user_id		= request()->param('user_id',0,'intval');
			$store_id 		= request()->param('store_id',0,'intval');
			$post_excerpt 	= request()->param('post_excerpt');
			if(empty($user_id))    		$this->error('请选择用户');
			if(empty($store_id))    $this->error('请选择门店');
			
			$insert_data = [
				'user_id'	 => $user_id,
				'store_id'   => $store_id
			];
			$one = Db::name('user_coach')->where($insert_data)->find();
			if($one){
				
				$this->error('该教练已添加');
				
			}else{
				$param['add_time'] 	 = time();
				Db::name('user_coach')->insert($param);
				Db::name('user')->where('id',$user_id)->update(['is_coach'=>1]);
			}
			$this->success('添加成功',url('adminCoach/index'));
		}
		$store_list = Db::name('supplier')->select();
		$this->assign('store_list',$store_list);
	    // 渲染模板输出
	    return $this->fetch();
	}
	public function edit(){
	
	    $id       = input('param.id', 0, 'intval');
	    $join = [
			['user u','c.user_id = u.id','left']
		];
	    $data = Db::name("user_coach")->alias('c')->field('c.*,u.user_nickname,u.mobile')->join($join)->where(["c.id"=>$id])->find();
	    
	    if (request()->ispost()) {
	    	$param = request()->param();
	    	
	        Db::name('user_coach')->where('id',$id)->update($param);
	        Db::name('user')->where('id',$data['user_id'])->update(['is_coach'=>1]);
	        $this->success("设置成功！");
	    }
		
		
		$store_list = Db::name('supplier')->select();
		$this->assign('store_list',$store_list);
	    $this->assign("data",$data);
	
	    return $this->fetch();
	}
	
    public function cancel()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
			
			$one    = Db::name('user_coach')->where('id',$id)->find();
			if(!$one)  $this->error('教练不存在');
			
            $result = Db::name('user_coach')->where('id',$id)->delete();
            if($result){
				$count = Db::name('user_coach')->where('user_id',$one['user_id'])->count();
				if($count < 1){
					Db::name('user')->where('id',$one['user_id'])->update(['is_coach'=>0]);
				}
				
				$this->success("删除成功！");
			}else{
				$this->error('删除失败');
			}
            
        } else {
            $this->error('数据传入失败！');
        }
    }
    
    public function listOrder()
    {
        parent::listOrders('user_coach');
        $this->success("排序更新成功！", '');
    }
}
