<?php
// +----------------------------------------------------------------------
// | 文件说明：用户表关联model 
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: wuwu <15093565100@163.com>
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Date: 2017-7-26
// +----------------------------------------------------------------------
namespace api\supplier\model;

use think\Model;

class SupplierModel extends Model
{
	protected $type = [
        'photo' => 'array',
    ];
    protected function base($query)
    {
        $query->where('status', 1);
    }
	public function getThumbnailAttr($value)
    {
        return cmf_get_image_url($value);
    }
    public function getRecThumbnailAttr($value)
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
	
	
    
    public function getPhotoAttr($value)
    {
        $more = json_decode($value, true);

        if (!empty($more)) {
            foreach ($more as $key => $value) {
                $more[$key] = cmf_get_image_url($value);
            }
        }

        return $more;
    }
	
	/**
	 * @param $lat1
	 * @param $lng1
	 * @param $lat2
	 * @param $lng2
	 * @return int
	 */
	function getDistance($lat1, $lng1, $lat2, $lng2){
	 
	    // 将角度转为狐度 
	    $radLat1 = deg2rad($lat1);// deg2rad()函数将角度转换为弧度
	    $radLat2 = deg2rad($lat2);
	    $radLng1 = deg2rad($lng1);
	    $radLng2 = deg2rad($lng2);
	 
	    $a = $radLat1 - $radLat2;
	    $b = $radLng1 - $radLng2;
	 
	    $s = 2 * asin(sqrt(pow(sin($a / 2), 2)+cos($radLat1) * cos($radLat2) * pow(sin($b / 2), 2))) * 6378.137;
	 
	    return $s;
	 
	}
	/**
	 * @param $lat1
	 * @param $lon1
	 * @param $lat2
	 * @param $lon2
	 * @param float $radius  星球半径 KM
	 * @return float
	 */
	function distance($lat1, $lon1, $lat2,$lon2,$radius = 6378.137)
	{
	    $rad = floatval(M_PI / 180.0);
	 
	    $lat1 = floatval($lat1) * $rad;
	    $lon1 = floatval($lon1) * $rad;
	    $lat2 = floatval($lat2) * $rad;
	    $lon2 = floatval($lon2) * $rad;
	 
	    $theta = $lon2 - $lon1;
	 
	    $dist = acos(sin($lat1) * sin($lat2) + cos($lat1) * cos($lat2) * cos($theta));
	 
	    if ($dist < 0 ) {
	        $dist += M_PI;
	    }
	    return $dist = $dist * $radius;
	}
}
