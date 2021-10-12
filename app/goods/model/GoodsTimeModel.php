<?php
namespace app\goods\model;

use app\admin\model\RouteModel;
use think\Db;
use think\Model;

class GoodsTimeModel extends Model {

    protected $autoWriteTimestamp = true;
    //类型转换
    protected $type = [
        'photo' => 'array',
    ];

	/*public function setStartTimeAttr($value)
    {
        return strtotime($value);
    }

    public function setEndTimeAttr($value)
    {
        return strtotime($value);
    }*/

    public function getLastUpdateAttr($value)
    {
        return date('Y-m-d H:i',$value);
    }

	public function add($data)
    {
		$insert_data = $this->_setData($data);
        $insert_data['add_time'] = time();
        $this->allowField(true)->save($insert_data);
        return $this;
    }

    public function edit($data)
    {
    	$insert_data = $this->_setData($data);
        $this->allowField(true)->save($insert_data,['id'=>$data['id']]);

        return $this;

    }
	
	public function _setData($data){
		
		$end_arr    = explode(' - ',$data['end_time']);
		
		$data['date_time'] 	= strtotime($data['start_time']);
		$start_time 		= $data['start_time'].' '.$end_arr[0];
		$end_time   		= $data['start_time'].' '.$end_arr[1];
		$data['start_time'] = strtotime($start_time);
		$data['end_time']   = strtotime($end_time);
		$data['year'] 		= date('Y',$data['start_time']);
		$data['month'] 		= date('m',$data['start_time']);
		$data['day'] 		= date('d',$data['start_time']);
		$coach = Db::name('user_coach')->field('store_id,user_id')->where('id',$data['coach_id'])->find();
		$goods = Db::name('goods')->field('cat_id,tags,goods_name,course_type')->where('goods_id',$data['goods_id'])->find();
		$data['cat_id'] 	= $goods['cat_id'];
		$data['course_type']= $goods['course_type'];
		$data['goods_name'] = $goods['goods_name'];
		$data['tags'] 		= $goods['tags'];
		$data['store_id']   = $coach['store_id'];
		$data['user_id']    = $coach['user_id'];
	
		return $data;
	}

}
