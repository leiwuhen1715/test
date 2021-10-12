<?php
/**
 * DoctorOrder.php
 * 文件描述:
 * Created on 2021/5/15 18:19
 * Create  by peipei.song
 */
namespace api\home\model;

use think\Model;

class CircleModel extends Model{

    protected $name = 'item_circle';
    
    public function getPictureAttr($value)
    {
        return cmf_get_image_url($value);
    }
    
    /**
     * 关联 user表
     * @return $this
     */
    public function detail()
    {
        return $this->belongsTo('CircleTextsModel', 'id','itemid')->field('itemid,text');
    }
}