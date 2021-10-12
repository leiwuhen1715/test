<?php
/**
 * DoctorOrder.php
 * 文件描述:
 * Created on 2021/5/15 18:19
 * Create  by peipei.song
 */
namespace api\home\model;

use think\Model;

class ApiDefaultTextsModel extends Model{

    protected $name = 'item_default_texts';

    public function getTextAttr($value)
    {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }
}