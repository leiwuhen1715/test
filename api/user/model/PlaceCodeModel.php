<?php
namespace api\user\model;

use think\Model;

class PlaceCodeModel extends Model {

    public function getImgAttr($value)
    {
        return cmf_get_image_url($value);
    }

}
