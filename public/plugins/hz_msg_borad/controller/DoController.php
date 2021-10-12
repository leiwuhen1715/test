<?php
// +----------------------------------------------------------------------
// | Author: heizai <876555425@qq.com>
// +----------------------------------------------------------------------
namespace plugins\hz_msg_borad\controller;
use cmf\controller\PluginBaseController;
use plugins\hz_msg_borad\model\PluginMessageModel;
use think\Db;

class DoController extends PluginBaseController
{

    // 留言提交
    public function addmsg(){
        $model = new PluginMessageModel();
        $data = $this->request->post();
        $type = $this->request->param('type',0,'intval');
        $result = $this->validate($data, "Post");

        if ($result !== true) {
            $this->error($result);
        }
        
        $getip = get_client_ip();
        if(cookie('msg_'.$type.'_ip') == $getip){
            $this->error('1分钟内只能提交一次');die;
        }else{
            cookie('msg_'.$type.'_ip',$getip,60);
        }
        // if(!cmf_captcha_check($data['verify'])){
        //     $this->error("验证码错误！");
        // }
        $data['ip'] = $getip;
        if ($this->request->isPost()) {
            $data['createtime'] = date('Y-m-d H:i:s');
            $result=$model->allowField(true)->save($data);
            if ($result!==false) {
                $this->success("提交成功！");
            } else {
                $this->error("提交失败！");
            }
        }

    }

}
