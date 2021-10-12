<?php
namespace app\goods\model;

use app\admin\model\RouteModel;
use think\Db;
use think\Model;

class SupplierModel extends Model {

    protected $autoWriteTimestamp = true;
    //类型转换
    protected $type = [
        'photo' => 'array',
    ];

	

    public function getUpdateTimeAttr($value)
    {
        return date('Y-m-d H:i',$value);
    }

    public function getAddTimeAttr($value)
    {
        return date('Y-m-d H:i',$value);
    }



	public function add($data)
    {
        $data['add_time']=time();
        $this->save($data);
        return $this;
    }

    public function edit($data)
    {
    	
        $this->allowField(true)->save($data,['id'=>$data['id']]);

        return $this;

    }

}
