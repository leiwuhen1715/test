<?php
namespace api\user\model;

use think\Db;
use think\Model;

class UserTrainModel extends Model {

	public function getAddTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function getPayTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function getShippingTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function goods()
	{
	    return $this->belongsTo('api\goods\model\GoodsModel', 'goods_id','goods_id')->field('goods_id,goods_img,goods_name,tags,photo');
	}
	
	public function user()
	{
	    return $this->belongsTo('UserModel', 'user_id')->field('id,user_nickname,avatar');
	}
	/**
	 * 关联 user教练表
	 * @return $this
	 */
	public function coauser()
	{
	    return $this->belongsTo('UserModel', 'coach_user_id')->field('id,user_nickname,avatar');
	}

}
