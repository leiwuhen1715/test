<?php
namespace api\supplier\model;

use think\Db;
use think\Model;

class MealOrderModel extends Model {

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
	
	public function getThumbnailAttr($value)
	{
	    return cmf_get_image_url($value);
	}
	
	public function getRetPriceAttr($value)
	{
	    return del0($value);
	}
	
	public function getRetVipPriceAttr($value)
	{
	    return del0($value);
	}
	
	public function getMaxPriceAttr($value)
	{
	    return del0($value);
	}
	
	public function goods()
	{
	    return $this->belongsTo('api\goods\model\GoodsModel', 'goods_id','goods_id')->field('goods_id,goods_img,goods_name,tags,photo');
	}
	
	/**
	 * 关联 user教练表
	 * @return $this
	 */
	public function user()
	{
	    return $this->belongsTo('UserModel', 'coach_user_id')->field('id,user_nickname,avatar');
	}
	
	/**
	 * 关联 supplier门店表
	 * @return $this
	 */
	public function supplier()
	{
	    return $this->belongsTo('api\supplier\model\SupplierModel', 'supplier_id');
	}

}
