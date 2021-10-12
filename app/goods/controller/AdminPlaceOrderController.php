<?php

namespace app\goods\controller;

use app\goods\model\MealOrderModel;
use cmf\controller\AdminBaseController;
use api\user\service\PlaceOrderService;
use app\goods\logic\OrderLogic;
use think\db;


class AdminPlaceOrderController extends AdminBaseController {

	protected function initialize()
    {

        parent::initialize();
        

		$this->order_model = new MealOrderModel;
		$this->OrderLogic  = new OrderLogic;
		$order_status 	   = config('goods.ORDER_STATUS');
		$pay_status 	   = config('goods.PAY_STATUS');
		$shipping_status   = config('goods.SHIPPING_STATUS');

        // 订单 支付 发货状态*/
		
        $this->assign('order_status'   ,['待提交','待审核','已完成','已取消','审核失败']);
        $this->assign('pay_status'     ,$pay_status);
        $this->assign('shipping_status',$shipping_status);
    }
    
	
	// 订单列表
    public function index(){
        
		return $this->fetch();
	}
	//ajax获取订单列表
	public function ajaxorderlist(){
		$where   		 =  [];
		$whereor 		 =  '';
		$limit     		 =  request()->param('limit',10,'intval');
        $keyword_sn	  	 =	request()->param('keyword_sn');
        $supplier_name   =  request()->param('supplier_name');
		$order_status 	 =	request()->param('order_status');
		$goods_id 	     =	request()->param('goods_id',0,'intval');
		$pay_status 	 =  request()->param('pay_status');
		$prom_type 	     =  request()->param('prom_type');
		
		if($order_status != '')    $where[] = ['o.order_status','=',$order_status];
		
		if($goods_id)            $where[] = ['o.goods_id','=',$goods_id];
        if($keyword_sn)          $where[] = ['o.order_sn','like',"%$keyword_sn%"];
        if($supplier_name)       $where[] = ['o.supplier_name','like',"%$supplier_name%"];
		
		$order_str  = ['o.order_id'=>'desc'];
		$count      = Db::name('meal_order')->alias('o')->where($where)->count();	
		$join  = [
			['user u','o.user_id = u.id','left']
		];
		$order_list = $this->order_model->alias('o')->field('o.*,u.user_nickname,u.mobile')->join($join)->where($where)->where($whereor)->order($order_str)->paginate($limit);
		
		$list   = [];
		foreach ($order_list->items() as $key=>$vo){
			$vo['pay_img'] = empty($vo['pay_img'])?[]:explode(',',$vo['pay_img']);
			$vo['com_img'] = empty($vo['com_img'])?[]:explode(',',$vo['com_img']);
			$pay_img = $com_img = '';
			
			foreach ($vo['pay_img'] as $v){
			    $javasc = "javascript:imagePreviewDialog('".cmf_get_image_url($v)."');";
			    $pay_img .= '<a href="'.$javasc.'"><img src="'.cmf_get_image_url($v).'" style="width:100px"></a>';
			}
			foreach ($vo['com_img'] as $v){
			    $javasc = "javascript:imagePreviewDialog('".cmf_get_image_url($v)."');";
			    $com_img .= '<a href="'.$javasc.'"><img src="'.cmf_get_image_url($v).'" style="width:100px"></a>';
			}
			$vo['pay_img_str'] = $pay_img;
			$vo['com_img_str'] = $com_img;
			$list[] = $vo;
		}
		$result = ['code'=>0,'count'=>$count,'data'=>$list];
		die(json_encode($result));
	}
	//完成订单
	public function successs(){
	    $id = request()->param('id',0,'intval');
	    $order = Db::name('place_order')->where('order_id',$id)->find();
	    if($order['order_status'] == 3){
	        Db::name('place_order')->where('order_id',$id)->update(['order_status'=>2]);
	        $this->success('操作成功');
	    }else{
	        $this->error('只有超时订单可以操作');
	    }
	}
	//订单详细
	public function detail(){
		
		$id    = request()->param('id',0,'intval');
		$join  = [
			['user u','o.user_id = u.id','left']
		];
		$order = Db::name('meal_order')->alias('o')->field('o.*,u.user_nickname,u.mobile')->join($join)->where('o.order_id',$id)->find(); //获取订单详细 goods_order
		
		//暂无运费
		
		$this->assign('order',$order);
		
		return $this->fetch();
	}
	
	
	
	//执行操作按钮
	public function orderOperate(){
		
		$order_id = request()->param('id',0,'intval');
		
		$order = DB::name('meal_order')->where("order_id",$order_id)->find();
		if($order['order_status'] != 1) 	$this->error('订单不能操作！');
		
		$is_vip = Db::name('user')->where('id',$order['user_id'])->value('is_vip');
		$amount = ($is_vip==1)?$order['ret_vip_price']:$order['ret_price'];
		
		DB::name('meal_order')->where("order_id",$order_id)->update(['con_time'=>time(),'order_status'=>2,'hire_money'=>$amount]);
		$coin = $amount*100;
		if($coin > 0){
			$can = $order['prome_type'] == 1?'霸王餐':($order['prome_type'] == 2?'返利餐':'');
			log_coin_change($order['user_id'],'商家'.$order['supplier_name'].'-'.$can,$coin,2);
		}
		$this->success('确认成功');
		
	}
	
	//执行操作按钮
	public function noOperate(){
		
		$order_id = request()->param('id',0,'intval');
		$note = request()->param('note');
		
		$order = DB::name('meal_order')->where("order_id",$order_id)->find();
		if($order['order_status'] != 1) 	$this->error('订单不能操作！');
		if(empty($note))    $this->error('请填写备注信息');
		
		
		
		DB::name('meal_order')->where("order_id",$order_id)->update(['con_time'=>time(),'order_status'=>4,'admin_note'=>$note]);
		
		$this->success('操作成功');
		
	}
	
	
	
	//删除订单 is_del=3
	public function delete(){
		$id=request()->param('id',0,'intval');
		$order = $this->order_model->where(array("order_id" => $id))->find();
		if($order['pay_status'] == 1 || $order['pay_status'] == 2){
			$this->error('该订单已付款，不能删除');
		}elseif($order['shipping_status'] == 1 || $order['shipping_status'] == 2){
			$this->error('该订单已发货，不能删除');
		}
		$result = $this->order_model->where("order_id",$id)->delete();
		Db::name('OrderSub')->where("order_id",$id)->delete();
		Db::name('OrderLog')->where("order_id",$id)->delete();
		if($result){
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
	}
	
	//批量删除选中订单 is_del=3
	public function delete_all(){
		if(isset($_POST['ids'])){
			/*$ids = I('post.ids/a');
			
			if ($this->order_model->where(array('order_id'=>array('in',$ids),'order_status'=>4))->save(array('is_del'=>3))) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}*/
			$this->error("删除失败！");
		}
	}
	
}