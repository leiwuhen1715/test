<?php
// +----------------------------------------------------------------------
// | Author: heizai <876555425@qq.com>
// +----------------------------------------------------------------------
namespace plugins\hz_msg_borad\controller;
use cmf\controller\RestUserBaseController;
use plugins\hz_msg_borad\model\PluginMessageModel;
use think\validate;
use think\Db;

class ApiDoController extends RestUserBaseController
{

    // 留言提交
    public function addmsg(){
        $model = new PluginMessageModel();
        $data = $this->request->post();
        
        if(empty($data['msg'])) $this->error('请填写留言内容');
        
        $getip = get_client_ip();
     
        // if(!cmf_captcha_check($data['verify'])){
        //     $this->error("验证码错误！");
        // }
        $data['ip'] = $getip;
        if ($this->request->isPost()) {
            $data['createtime'] = time();
            $data['user_id']    = $this->getUserId();
            $result=$model->allowField(true)->save($data);
            if ($result!==false) {
                $this->success("提交成功！");
            } else {
                $this->error("提交失败！");
            }
        }

    }

}
