<?php
namespace api\goods\model;

use think\Model;

class GoodsSkuModel extends Model {


    public function getSkuImgAttr($value)
    {
        return cmf_get_image_url($value);
    }


}
