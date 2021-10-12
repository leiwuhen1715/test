<?php
namespace api\user\model;

use think\Db;
use think\Model;

class UserNoticeModel extends Model {

	protected $type = [
	    'content' => 'array',
	];
	
	public function getAddTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }

}
