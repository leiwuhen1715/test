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
 * @adminMenuRoot(
 *     'name'   =>'用户管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 10,
 *     'icon'   =>'group',
 *     'remark' =>'用户管理'
 * )
 *
 * @adminMenuRoot(
 *     'name'   =>'用户组',
 *     'action' =>'default1',
 *     'parent' =>'user/AdminIndex/default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   =>'',
 *     'remark' =>'用户组'
 * )
 */
class AdminIndexController extends AdminBaseController
{

    /**
     * 后台本站用户列表
     * @adminMenu(
     *     'name'   => '本站用户',
     *     'parent' => 'default1',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $content = hook_one('user_admin_index_view');

        if (!empty($content)) {
            return $content;
        }
		$param = request()->param();
        $user_type = request()->param('user_type',0,'intval');
		$join = [
			['user f','u.f_id = f.id','left']
		];
        $list = Db::name('user')->alias('u')->field('u.*,f.user_nickname as f_nickname')->join($join)
            ->where(function (Query $query) {
                $data = $this->request->param();
                $query->where('u.user_type', 2);


                if (!empty($data['user_type'])) {
                    if($data['user_type'] == 1){
                        $query->where('u.balance','>',0);
                    }elseif($data['user_type'] == 2){
                        $query->where('u.balance', 0);
                    }
                }
                if (!empty($data['keyword'])) {
                    $keyword = $data['keyword'];
                    $query->where('u.user_login|u.user_nickname|u.user_email|u.mobile', 'like', "%$keyword%");
                }

            })
            ->order("u.create_time DESC")
            ->paginate(10);

        $list->appends($param);
        // 获取分页显示
        $page = $list->render();
        foreach($list as $vo){
            $total_balance = Db::name('user_balance_log')->where('user_id',$vo['id'])->where('change','>',0)->sum('change');
            Db::name('user')->where('id',$vo['id'])->update(['total_balance'=>$total_balance]);
        }
        $this->assign('user_type', $user_type);
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }
	
	//
	public function add(){
	    if(request()->ispost()){
			
			$param = request()->param();
			$post  = $param['post'];
			
			$result = $this->validate($post,'user');
			
			if ($result !== true){
				$this->error($result);
			}
			
			$result = Db::name("user")->where('user_login', $post['user_login'])->find();
			if($result)    $this->error('用户名已存在');
			$result = Db::name("user")->where('mobile', $post['mobile'])->find();
			if($result)    $this->error('手机号已存在');
			$result = Db::name("user")->where('user_email', $post['user_email'])->find();
			if($result)    $this->error('电子邮箱已存在');
			
			$insert_data = [
				'realname'	 => $post['realname'],
				'user_login' => $post['user_login'],
				'mobile'	 => $post['mobile'],
				'user_email' => $post['user_email'],
				'user_pass'	 => cmf_password($post['password']),
				'create_time'     => time(),
				'last_login_time' => time(),
				'user_status'     => 1,
				"user_type"       => 2,//会员
			];
			Db::name('user')->insert($insert_data);
			
			$this->success('添加成功',url('adminIndex/index'));
		}
		
	    // 渲染模板输出
	    return $this->fetch();
	}
	
	public function edit(){
	
	    $id       = input('param.id', 0, 'intval');
	    if (request()->ispost()) {
	    	$param = request()->param();
	        $post = $param['post'];
	    	
	        $update=[
	            'realname'    =>  $post['realname'],
	        ];
	        if(!empty($post['password'])){
	            if($post['conpassword'] != $post['password'])  $this->error('两次输入密码不一致');
	            $update['user_pass'] = cmf_password($post['password']);
	        }
	        
	    	
	        Db::name('user')->where('id',$id)->update($update);
	        $this->success("设置成功！");
	      
	    }
	    $data = Db::name("User")->alias('u')->field('u.*')->where(["u.id"=>$id])->find();
	  
	    $this->assign("data",$data);
	
	    return $this->fetch();
	}

    public function info(){

        $id   = input('param.id', 0, 'intval');

        $data = Db::name("User")->alias('u')->field('u.*')->where(["u.id"=>$id])->find();

        $this->assign("data",$data);

        return $this->fetch();
    }
	
    /**
     * 本站用户拉黑
     * @adminMenu(
     *     'name'   => '本站用户拉黑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户拉黑',
     *     'param'  => ''
     * )
     */
    public function ban()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("user")->where(["id" => $id, "user_type" => 2])->setField('user_status', 0);
            if ($result) {
                $this->success("会员拉黑成功！", "adminIndex/index");
            } else {
                $this->error('会员拉黑失败,会员不存在,或者是管理员！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }

    /**
     * 本站用户启用
     * @adminMenu(
     *     'name'   => '本站用户启用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户启用',
     *     'param'  => ''
     * )
     */
    public function cancelBan()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id, "user_type" => 2])->setField('user_status', 1);
            $this->success("会员启用成功！", '');
        } else {
            $this->error('数据传入失败！');
        }
    }
    
    public function spread_user(){
    
        $param = $this->request->param();
    	$id = request()->param('id',0,'intval');
    	$list = Db::name('user')->where('f_id',$id)
            ->where(function (Query $query) {
                if (!empty($data['uid'])) {
                    $query->where('id', intval($param['uid']));
                }
                if (!empty($param['keyword'])) {
                    $keyword = $param['keyword'];
                    $query->where('user_login|user_nickname|user_email|mobile', 'like', "%$keyword%");
                }

            })
            ->order("create_time DESC")->paginate(10);
        $list->appends($param);
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        
        
        return $this->fetch();
    }

    public function balance(){

        $user_id = request()->param('user_id',0,'intval');
        $limit = request()->param('limit',10,'intval');
        $page = request()->param('page',1,'intval');

        $where = [];
        if($user_id) $where[] = ['c.user_id','=',$user_id];

        $count = Db::name('user_balance')->alias('c')->where($where)->count();
        $list  = Db::name('user_balance')->alias('c')->where($where)->order(['id'=>'desc'])->page($page,$limit)->select()->each(function($item){
            $item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);

            return $item;
        });

        $result = ['code'=>0,'count'=>$count,'data'=>$list];
        die(json_encode($result));
    }
}
