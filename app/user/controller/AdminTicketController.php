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
class AdminTicketController extends AdminBaseController
{

    /**
     * 后台本站用户列表
     */
    public function index()
    {
		$params  = request()->param();
        $type_id = request()->param('type_id',0,'intval');
		$keyword = request()->param('keyword',0,'intval');
		
		$type_list = Db::name('user_group_card')->order(['list_order'=>'asc','id'=>'desc'])->select();
		
        $where = [];
		if($type_id)  $where[] = ['c.type_id','=',$type_id];
		if($keyword)  $where[] = ['u.user_nickname,u.mobile','like','%'.$keyword.'%'];
		
        $join = [
            ['user u','c.user_id = u.id','left']
        ];
        $list = Db::name('user_card')->alias('c')->field('c.*,u.user_nickname,u.mobile')->join($join)->where($where)->order("c.id DESC")->paginate(10);
		
        foreach ($list as $key => $value) {
            check_reveiw($value['user_id']);
        }
        // 获取分页显示
		$list->appends($params);
        $page = $list->render();
		
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->assign('type_id',$type_id);
		$this->assign('type_list',$type_list);
        // 渲染模板输出
        return $this->fetch();
    }
    /**
     * 开通记录
     */
    public function card_open(){
        $id = $this->request->param('id',0,'intval');
        $where = ['c.pay_status'=>1];
        if($id)$where['user_id'] = $id;
        $join = [
            ['user u','c.user_id = u.id','left']
        ];
        $list = Db::name('user_card_order')->alias('c')->field('c.*,u.user_nickname,u.realname,u.mobile')->join($join)->where($where)->order("c.id DESC")
        ->paginate(10);
        // 获取分页显示
        $page = $list->render();

        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('user_id',$id);
         // 渲染模板输出
        return $this->fetch();
    }

    public function edit(){
        $id = request()->param('id',0,'intval');
        $join = [
            ['user u','c.user_id = u.id','left']
        ];
        $card = Db::name('user_card')->alias('c')->field('c.*,u.user_nickname,u.realname,u.mobile')->join($join)->where('c.id',$id)->find();
        if(request()->isPost()){
            $end_time = request()->param('end_time');

            $end_time = strtotime($end_time);
            Db::name('user_card')->where('id',$id)->update(['end_time'=>$end_time]);
            
            $this->success('修改成功！');
        }
        
        
        $this->assign('user_id',$card['user_id']);
        $this->assign('card',$card);
        return $this->fetch();
    }
	
	
}
