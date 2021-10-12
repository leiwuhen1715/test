<?php
namespace api\user\model;

use think\Model;

class CouponModel extends Model {

    public function getEndTimeAttr($value)
    {
        return date('Y-m-d', $value);
    }
    public function getStartTimeAttr($value)
    {
        return date('Y-m-d', $value);
    }
    public function getUseTimeAttr($value)
    {
        return date('Y-m-d', $value);
    }
    public function getDiscountAttr($value){
        return del0($value);
    }
	public function getAmountAttr($value){
	    return del0($value);
	}
	public function getTotalAmountAttr($value){
	    return del0($value);
	}

}