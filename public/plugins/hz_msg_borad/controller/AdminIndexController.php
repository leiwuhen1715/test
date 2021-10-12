<?php
// +----------------------------------------------------------------------
// | Author: heizai <876555425@qq.com>
// +----------------------------------------------------------------------
namespace plugins\hz_msg_borad\controller;

use cmf\controller\PluginAdminBaseController;
use plugins\hz_msg_borad\model\PluginMessageModel;
use think\Db;

class AdminIndexController extends PluginAdminBaseController
{

    protected function _initialize()
    {
        parent::_initialize();
        $adminId = cmf_get_current_admin_id();//获取后台管理员id，可判断是否登录
        if (!empty($adminId)) {
            $this->assign("admin_id", $adminId);
        }
    }

    /**
     * 留言列表
     * @adminMenu(
     *     'name'   => '留言列表',
     *     'parent' => 'admin/Plugin/index',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '演示插件',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $model = new PluginMessageModel();
        $join=[
            ['user u','p.user_id=u.id','left']
        ];
        $datas = $model->alias('p')->field('p.*,u.user_nickname,u.mobile')->join($join)->order('p.id desc')->paginate(10);
        
        $this->assign('posti',0);
        $this->assign("datas", $datas);
        $this->assign('page', $datas->render());
        return $this->fetch('/admin_index');
    }
    /**
     * 站长邮箱
     */
    public function director()
    {
        $model = new PluginMessageModel();
        $join=[
            ['user u','p.user_id=u.id','left']
        ];
        $datas = $model->alias('p')->field('*')->where('type',1)->order('p.id desc')->paginate();
        
        $this->assign('posti',1);
        $this->assign("datas", $datas);
        $this->assign('page', $datas->render());
        return $this->fetch('/admin_index');
    }
    public function edit(){
        $id=$this->request->param('id',0,'intval');
        $model = new PluginMessageModel();
        if($this->request->isPost()){
            $huifu = $this->request->param('huifu');
            $data=[
                'huifu'=>$huifu,
              	'is_hui'=>1
            ];
            $model->where('id',$id)->update($data);
            $this->success('编辑成功！');
        }
        $data=$model->where('id',$id)->find();
        $this->assign('data',$data);
        return $this->fetch('/edit');
    }

    public function delete(){
        $id=$this->request->param('id',0,'intval');
        $model = new PluginMessageModel();
        $model->where('id',$id)->delete();
        $this->success('删除成功！');
    }
}
