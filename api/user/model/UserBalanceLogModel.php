<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// | Time: 2018/8/10 12:25
// +----------------------------------------------------------------------

namespace api\user\model;


use think\Model;

class UserBalanceLogModel extends Model
{
	public function getCreateTimeAttr($value){
		if(!empty($value))
	    return date('Y-m-d H:i',$value);
	}
}