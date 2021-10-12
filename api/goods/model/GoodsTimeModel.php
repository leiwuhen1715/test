<?php
namespace api\goods\model;

use think\Model;

class GoodsTimeModel extends Model {

	protected function base($query)
    {
        $query->where('is_on_sale', 1);
    }

    public function getGoodsImgAttr($value)
    {
        return cmf_get_image_url($value);
    }
	
	public function simplegoods()
	{
	    return $this->belongsTo('GoodsModel', 'goods_id','goods_id')->field('goods_id,goods_name,tags');
	}
	
	/**
	 * 关联 goods 产品表
	 * @return $this
	 */
	public function goods()
	{
	    return $this->belongsTo('GoodsModel', 'goods_id','goods_id')->field('*');
	}
	/**
	 * 关联 user表
	 * @return $this
	 */
	public function user()
	{
	    return $this->belongsTo('api\user\model\UserModel', 'user_id')->field('id,user_nickname,avatar');
	}
	
	/**
	 * 关联 user教练表
	 * @return $this
	 */
	public function userCoach()
	{
	    return $this->belongsTo('api\user\model\UserCoachModel', 'coach_id')->field('id,post_excerpt');
	}
	
	/**
	 * 关联 supplier门店表
	 * @return $this
	 */
	public function store()
	{
	    return $this->belongsTo('api\user\model\SupplierModel', 'store_id')->field('id,supplier_name,contact_address,longitude,latitude');
	}
	
	public function getShopPriceAttr($value)
    {
        return del0($value);
    }
    
    public function getMemberPriceAttr($value)
    {
        return del0($value);
    }


}
