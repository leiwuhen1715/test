<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// +----------------------------------------------------------------------
namespace api\supplier\service;

use api\supplier\model\MealOrderModel;
use think\Db;

class OrderService
{

    //提交加盟
    public function addOrder($user_id,$id){
		
    	$result = ['code'=>0,'msg'=>'','status'=>0];
		$res = $this->checkOrder($user_id,$id);
		if($res['code'] == 0){
			$supplier = Db::name('supplier')->where(['id'=>$id,'status'=>1])->find();
			if($supplier){
				if($supplier['store_count'] >0){
					Db::startTrans(); //开启事务
					try {
						$time = time();
						$insert_data = [
							'user_id'  			=> $user_id,
							'plat_type'			=> $supplier['plat_type'],
							'prome_type'		=> $supplier['prome_type'],
							'max_price'			=> $supplier['max_price'],
							'ret_price'			=> $supplier['ret_price'],
							'ret_vip_price'		=> $supplier['ret_vip_price'],
							'description'		=> $supplier['description'],
							'add_time'			=> $time,
							'order_sn' 			=> get_order_sn(),
							'order_status'		=> 0,
							'supplier_id'		=> $id,
							'supplier_name'		=> $supplier['supplier_name'],
							'thumbnail'			=> $supplier['thumbnail'],
							'year'              => date('Y',$time),
							'month'             => date('m',$time),
							'day'               => date('d',$time)
						];

						$order_id = Db::name('meal_order')->insertGetId($insert_data);
						Db::name('supplier')->where('id',$id)->setDec('store_count');
						$result['order_id'] = $order_id;
						$result['code'] = 1;
						$result['msg']  = '提交成功';
						Db::commit();
					} catch (\Exception $e) {
						$result['msg'] = $e->getMessage();
						// 回滚事务
						Db::rollback();
					}
				}else{
					$result['msg'] = '没有名额了';
				}
				
			}else{
				$result['msg'] = '商家不存在';
			}	
		}else{
			$result['status'] = $res['code'];
			$result['msg']    = $res['msg'];
		}
    	return $result;
    	
    }
	
	/**
	 * 订单查询
	 * @param      $filter
	 * @param bool $isPage
	 * @return \think\Paginator
	 * @throws \think\exception\DbException
	 */
	public function getList($filter, $userId = false)
	{
	
	    $model = new MealOrderModel();
	
	    $field = 'o.*';
	    $where=[
			'o.user_id'		=> $userId
	    ];
		if(!empty($filter['type'])){
		    $type = ($filter['type'] == 5)?4:($filter['type'] == 4?5:$filter['type']);
			$where['o.order_status'] = $type-1;
		}
		//->relation(['user','goods'])
	    $data  = $model->alias('o')->field($field)->where($where)->order('o.order_id', 'DESC')->paginate(10);
	    return $data;
	}
	
	//订单详情
	public function orderInfo($id,$userId){
		$model = new MealOrderModel();
		
		$data  = $model->relation(['supplier'])->where(['order_id'=>$id,'user_id'=>$userId])->find();
	
		return $data;
	}
	
	/**
	 * 用户订单状态
	 */
	public function Handle($data){
	    $new_list = [];
	    foreach ($data as $key => $vo) {
	
	        /*if(!empty($vo['goods']['tags'])){
	        	$tag_arr = Db::name('goods_tag')->where('id','in',$vo['goods']['tags'])->order('list_order','asc')->column('name');
	        	$vo['goods']['tag_str'] = implode(' · ',$tag_arr);
	        }
	        $vo['time_str']    = date('Y-m-d',$vo['start_time']).'  '.date('H:i',$vo['start_time']).'-'.date('H:i',$vo['end_time']);
			$vo['status_name'] = get_status_name($vo['order_status']);
			$vo['allow_send']  = 0;
			if($vo['order_status'] == 2){
				
				if($vo['send_code']==0){
					$send_time = $vo['start_time']-3600*6;
					if($send_time > time()){
						$vo['allow_send'] = 1;
					}
				}
			}*/
	    	
	        $new_list[] = $vo;
	    }
	    return $new_list;
	}
	
	
	//验证订单
	public function checkOrder($user_id,$id){
		$result = [
			'code' => 0,
			'msg'  => ''
		];
		$plat_type = Db::name('supplier')->where(['id'=>$id,'status'=>1])->value('plat_type');
		$count     = Db::name('meal_order')->where(['user_id'=>$user_id,'plat_type'=>$plat_type])->where('order_status','in',[0,1])->count();
		if($count > 0){
			$result['code'] = 1;
			$result['msg']  = '存在未完成的订单';
		}else{
			$start_time = strtotime(date('Y-m-d'));
            $count = Db::name('meal_order')->where(['user_id'=>$user_id,'order_status'=>2,'plat_type'=>$plat_type])->where('add_time','between',[$start_time,time()])->count();
            $is_vip = Db::name('user')->where('id',$user_id)->value('is_vip');
            $num = $is_vip==1?2:1;
            if($count > $num){
                $result['code'] = 2;
                $result['msg']  = '每天可以下'.$num.'单';
            }
		}
		return $result;
	}
	
}
