<?php
namespace api\user\model;

use think\Db;
use think\Model;

class CoachStudentModel extends Model {

	public function getAddTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function getTrainTimeAttr($value){
        return (int)($value/60);
    }
	
	public function getShippingTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	/**
	 * 关联 user教练表
	 * @return $this
	 */
	public function user()
	{
	    return $this->belongsTo('UserModel', 'user_id')->field('id,user_nickname,avatar');
	}

}
