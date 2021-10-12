<?php
namespace app\goods\model;

use think\Db;
use think\Model;

class MealOrderModel extends Model {
	
	public function getAddTimeAttr($value)
    {
        return date('Y-m-d H:i',$value);
    }
	
	public function getStartTimeAttr($value)
	{
		if(!empty($value))
	    return date('Y-m-d H:i',$value);
	}
	
	public function getEndTimeAttr($value)
	{
	    if(!empty($value))
		return date('Y-m-d H:i',$value);
	}
	
	public function getKeepStartTimeAttr($value)
	{
	    return date('Y-m-d H:i',$value);
	}
	
	public function getKeepEndTimeAttr($value)
	{
	    return date('H:i',$value);
	}
	
}
