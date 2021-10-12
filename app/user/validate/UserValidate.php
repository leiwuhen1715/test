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
namespace app\user\validate;

use think\Validate;

class UserValidate extends Validate
{
    protected $rule = [
        'user_login'   	=> 'require',
        'realname'    	=> 'require',
		'mobile' 		=> 'require|checkMobile',
		'user_email'   	=> 'require|email',
		'password'   	=> 'require|confirm',
    ];
	
    protected $message = [
        'realname.require'      => '请填写真是姓名!',
        'user_login.require'    => '请填写用户名!',
		'mobile.require' 		=> '请填写手机号!',
		'mobile.checkMobile' 	=> '手机格式不正确!',
		'user_email.require'    => '请填写电子邮箱!',
		'user_email.email'      => '邮箱格式不正确!',
        'password.require'  	=> '请填写密码',
		'password.confirm'      => '两次密码不一致',
    ];

    protected $scene = [
    ];

    // 验证url 格式
    protected function checkMobile($value, $rule, $data)
    {
		
        if (cmf_check_mobile($value)) {
            return true;
        }
        return '手机格式不正确!';
    }

    // 验证url 格式
    protected function checkTitle($value, $rule, $data)
    {
        if (base64_decode($value)!==false) {
            return true;
        }
        return '收藏内容标题格式不正确!';
    }
}