<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace api\goods\controller;

use cmf\controller\RestUserBaseController;
use api\goods\model\GoodsModel as Goods;
use api\goods\service\PlaceServer;
use think\Validate;
use think\Db;

class PlaceController extends RestUserBaseController
{
	//入场
    public function admis(){
		$id = request()->param('id',0,'intval');
		$user_id       = $this->getUserId();
		
		$order_id = Db::name('place_order')->where(['user_id'=>$user_id,'prom_type'=>0])->where('order_status','in',[1,0,3])->value('order_id');
		if($order_id){
			$data = [
			    'code' => 2,'msg'=>'存在入场记录，无法进场'
			];
// 			$this->error('存在入场记录，无法进场');
			die(json_encode($data));
			
		}else{
			
			$server = new PlaceServer;
			$res    = $server->addOrder($user_id,$id);
			if($res['status'] == 1){
				$this->success('入场成功',$res);
			}else{
				$this->error($res['msg']);
			}
			
		}
		
		
	}
	
	//预约
	public function keep(){
		
		$user_id    = $this->getUserId();
		$id         = request()->param('id',0,'intval');
		$type_id    = request()->param('type_id',0,'intval');
		$keep_time  = request()->param('keep_time');
		$factory_id = request()->param('factory_id',0,'intval');
		
		$validate = new Validate([
		    'date'     		=> 'require',
		    'keep_time'     => 'require',
		    'factory_id' 	=> 'require'
		]);
		
		$validate->message([
		    'date.require'     		=> '请选择预约日期',
		    'keep_time'             => '请选择预约时间',
		    'factory_id.require' 	=> '请选择厂区!'
		]);
		
		$param = $this->request->param();
		if (!$validate->check($param)) {
		    $this->error($validate->getError());
		}
		if(empty($keep_time))  $this->error('请选择预约时间');
		$show_start_time = strtotime(date("Y-m-d",strtotime("+1 day")));
		$show_end_time   = strtotime(date("Y-m-d",strtotime("+8 day")));
		//$keep_time       = strtotime($param['date']);
		$server = new PlaceServer;
		$res  = $server->checkKeep($param['date'],$id,$keep_time,$factory_id,$type_id,$user_id);
		if($res['code'] == 0){
			$this->error($res['msg']);
		}else{
			
			$this->success('ok',$res['data']);
		}
	}
	
	//获取时间
	public function getTime(){
		$id       = request()->param('id',0,'intval');
		$date     = request()->param('date');
		$type_id  = request()->param('id',0,'intval');
		
		if(empty($date))$this->error('请选择时间');
		$server = new PlaceServer;
		$time = strtotime($date);
		$time_list = $server->getOneTime(time(),$id,$type_id);
		$this->success('ok',$time_list);
	}
	
	//获取厂区
	public function getFactory(){
		$id = request()->param('id',0,'intval');
		$factory_list = Db::name('goods_factory')->where('goods_id',$id)->select();
		
		$this->success('ok',$factory_list);
	}
	
	
	/*获取规格详情*/
	public function skuDetail(){
		
		$id          = request()->param('id',0,'intval');
		$sku_id      = request()->param('sku_id',0,'intval');
		$type_id     = request()->param('type_id',0,'intval');
		$factory_id  = request()->param('factory_id',0,'intval');
		
		$sku    = Db::name('goods_sku')->where(['sku_id'=>$sku_id,'goods_id'=>$id])->find();
		$factory = Db::name('goods_factory')->where(['goods_id'=>$id,'id'=>$factory_id])->find();
		if($sku){
			$spec = explode('-',$sku['item_path']);
			$server = new PlaceServer;
			$res_time = $server->getSkuTime($sku['item_path']);
			
			$price = $type_id == 1?$factory['one_price']:($type_id == 2?$factory['half_price']:$factory['all_price']);
			
			$sku['sku_price']    = $res_time['hours']*$price;
			$sku['spec_time']    = Db::name('spec_item')->where('id',$spec['1'])->value('item');
			$sku['factory_name'] = Db::name('goods_factory')->where('id',$factory_id)->value('factory_name');
			$this->success('ok',$sku);
			
		}else{
			
			$this->error('规格不存在');
			
		}
		
	}
	
	public function keepPrice(){
		
		$id          = request()->param('id',0,'intval');
		$date        = request()->param('date');
		$keep_time   = request()->param('keep_time');
		$type_id     = request()->param('type_id',0,'intval');
		$factory_id  = request()->param('factory_id',0,'intval');
		$result      = [
			'people_num'   => 1,
			'total_amount' => 0
		];
		if(!empty($keep_time)){
			$keep_str = explode('-',$keep_time);
			$keep_start_time = strtotime($date.' '.$keep_str[0]);
			$keep_end_time   = strtotime($date.' '.$keep_str[1]);
			
			$factory = Db::name('goods_factory')->where(['goods_id'=>$id,'id'=>$factory_id])->find();
			if($factory){
				if($type_id == 1){
					$server = new PlaceServer;
					$result['people_num']   = 1;
					$result['total_amount'] = $server->getTotalAmount($keep_start_time,$keep_end_time,$id);
					
				}else{
					$price = $type_id == 1?$factory['one_price']:($type_id == 2?$factory['half_price']:$factory['all_price']);
					$people_num = $type_id == 1?1:($type_id == 2?intval($factory['people_num']/2):$factory['people_num']);
					$hours        = date('H',$keep_end_time)-date('H',$keep_start_time);
					
					$result['people_num']   = $people_num;
					$result['total_amount'] = $price*$hours*$people_num;
				}
				
				
			}
			
		}
		
		$this->success('ok',$result);
		
	}
	
	//出场
	
	public function comeOut(){
		
		$order_id = request()->param('id',0,'intval');
	
	}
}
