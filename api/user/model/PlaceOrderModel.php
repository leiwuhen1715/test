<?php
namespace api\user\model;

use think\Db;
use think\Model;

class PlaceOrderModel extends Model {

	public function getAddTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function getPayTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function getKeepStartTimeAttr($value){
		if(!empty($value))
        return date('Y-m-d H:i',$value);
    }
	
	public function getKeepEndTimeAttr($value){
		if(!empty($value))
	    return date('H:i',$value);
	}
	
	public function getStartTimeAttr($value){
		if(!empty($value))
	    return date('Y-m-d H:i',$value);
	}
	
	public function getEndTimeAttr($value){
		if(!empty($value))
	    return date('Y-m-d H:i',$value);
	}
	
	public function getGoodsImgAttr($value){

	    return cmf_get_image_url($value);
		
	}

}
