<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace api\user\model;

use think\Model;

class UserCoinLogModel extends Model
{
	public function getCreateTimeAttr($value){
		if(!empty($value))
	    return date('m月d日',$value);
	}
	
	public function getTypeAttr($value){
		
		$type_arr = ['','签到金币','订餐金币','邀请金币','邀请金币'];
	    return $type_arr[$value];
	}
}