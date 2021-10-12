<?php
namespace app\goods\model;

use app\admin\model\RouteModel;
use think\Db;
use think\Model;

class StoreSeckillModel extends Model {

    protected $autoWriteTimestamp = true;
    //类型转换
    protected $type = [
        'photo' => 'array',
    ];

	public function getGoodDescAttr($value)
    {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }

    /**
     * post_content 自动转化
     * @param $value
     * @return string
     */
    public function setGoodDescAttr($value)
    {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }


	public function setStartTimeAttr($value)
    {
        return strtotime($value);
    }

    public function setEndTimeAttr($value)
    {
        return strtotime($value);
    }


	public function add($data)
    {
        //$data['user_id'] = cmf_get_current_admin_id();

        $data['add_time']=time();

        $this->allowField(true)->data($data, true)->isUpdate(false)->save();

        return $this;
    }

    public function edit($data)
    {

        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        return $this;

    }

}
