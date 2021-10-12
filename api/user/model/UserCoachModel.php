<?php
namespace api\user\model;

use think\Model;

class UserCoachModel extends Model {


    public function getPhotoAttr($value)
    {
        return cmf_get_image_url($value);
    }
	/**
	 * 关联 user表
	 * @return $this
	 */
	public function user()
	{
	    return $this->belongsTo('api\user\model\UserModel', 'user_id')->field('id,user_nickname,avatar,sex,user_height,user_weight,birthday');
	}
	
	/**
	 * 关联 supplier门店表
	 * @return $this
	 */
	public function store()
	{
	    return $this->belongsTo('api\user\model\SupplierModel', 'store_id')->field('id,supplier_name,contact_address');
	}

}
