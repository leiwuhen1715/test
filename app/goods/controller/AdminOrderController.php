<?php

namespace app\goods\controller;

use app\goods\model\OrderModel;
use cmf\controller\AdminBaseController;
use app\goods\logic\OrderLogic;
use think\db;


class AdminOrderController extends AdminBaseController {

	protected function initialize()
    {

        parent::initialize();
        

		$this->order_model = new OrderModel;
		$this->OrderLogic = new OrderLogic;
		$order_status=config('goods.ORDER_STATUS');
		$pay_status=config('goods.PAY_STATUS');
		$shipping_status=config('goods.SHIPPING_STATUS');

        // 订单 支付 发货状态*/
        $this->assign('order_status'   ,$order_status);
        $this->assign('pay_status'     ,$pay_status);
        $this->assign('shipping_status',$shipping_status);
    }
    
	
	// 订单列表
    public function index(){

		return $this->fetch();
	}
	//ajax获取订单列表
	public function ajaxorderlist(){
		$where = [
			['is_del','=',0]
		];

        $page          = request()->param('page',1,'intval');
		$limit          = request()->param('limit',10,'intval');
        $keyword_sn	  	 =	request()->param('keyword_sn');
		$keyword_name 	 =	request()->param('keyword_name');
		$supplier_id  	 =  request()->param('supplier_id',0,'intval');
		$order_status 	 =	request()->param('order_status');
		$pay_status 	 =  request()->param('pay_status');
		$shipping_status =  request()->param('shipping_status');
        $send_type 	     =  request()->param('send_type');
        $buy_type 	     =  request()->param('buy_type');



        if($supplier_id)         $where[] = ['supplier_id','=',$supplier_id];
		if($order_status != '')  $where[] = ['order_status','=',$order_status];
		if($pay_status != '')    $where[] = ['pay_status','=',$pay_status];
		if($shipping_status!='') $where[] = ['shipping_status','=',$shipping_status];
        if($send_type != '')     $where[] = ['send_type','=',$send_type];
        if($buy_type != '')      $where[] = ['buy_type','=',$buy_type];
        if($keyword_sn)          $where[] = ['order_sn','like',"%$keyword_sn%"];
        if($keyword_name)        $where[] = ['consignee','like',"%$keyword_name%"];

		$order_str  = ['order_id'=>'desc'];
		$count      = Db::name('order')->where($where)->count();
		$order_list = $this->order_model->where($where)->order($order_str)->page($page,$limit)->select()->each(function($item){
            $item['add_time']   = date('Y-m-d H:i:s',$item['add_time']);
            $item['start_time'] = date('Y-m-d',$item['start_time']);
            $item['end_time']   = date('Y-m-d',$item['end_time']);
		    return $item;
        });
		
		$result = ['code'=>0,'count'=>$count,'data'=>$order_list];
		die(json_encode($result));
	}
	
	//订单详细
	public function detail($order_id){
		$order = $this->OrderLogic->orderInfo($order_id); //获取订单详细 goods_order
		$goods_order = $this->OrderLogic->getGoodsOrder($order_id); //获取订单产品信息 order_sub
		$order_btn = $this->OrderLogic->getOrderBtn($order); //获取按钮
		$action_log = DB::name('OrderLog')->where(['order_id'=>$order_id])->order('log_time desc')->select();
		
		//暂无运费
		
		$this->assign('order',$order);
		$this->assign('goods_order',$goods_order);
		$this->assign('order_btn',$order_btn);
		$this->assign('action_log',$action_log);
		return $this->fetch();
	}
	
	//修改发货地址
	public function editaddress($order_id){
		$address_mobel = M('address');
		$order = $this->OrderLogic->orderInfo($order_id);
		$this->editable($order);
		
		//编辑收货人信息
		if(request()->isPost()){
			$model = Db::name('Order');
			if($model->create() !== false){
				$result = $model->save();
				if($result !== false){
					$this->success('保存成功',url('AdminOrder/detail',array("order_id"=>$order_id)));
				}else{
					$this->error('保存失败');
				}
			}else{
				$this->error($model->getError());
			}			
		}		
		
		//获取地址
		$province = $address_mobel->where(array('level'=> 1))->select();
		$city = $address_mobel->where(array('parent_id'=>$order['province'],'level'=> 2))->select();
		$district = $address_mobel->where(array('parent_id'=>$order['city']))->select();
		$twon=[];
		if($order['twon']){
        	$twon = Db::name('address')->where(array('parent_id'=>$order['district'],'level'=>4))->select();
        	
        }
		//print_r($province);die;
		$this->assign('twon',$twon);
		$this->assign('order',$order);
		$this->assign('province',$province);
		$this->assign('city',$city);
		$this->assign('district',$district);
		return $this->fetch();
	}
	
	//修改价格信息
	public function editprice($order_id){
		$order = $this->OrderLogic->orderInfo($order_id);
		$this->editable($order);
		
		if(request()->isPost('post')){
			$data = request()->param('post');			
			$result = Db::name('GoodsOrder')->save($data);
			if($result !== false){
				$this->success('保存成功',url('AdminOrder/detail',array("order_id"=>$order_id)));
			}else{
				$this->error('保存失败');
			}
		}
		
		$this->assign('order',$order);
		return $this->fetch();
	}
	
	//已发货不能编辑
	private function editable($order){
        if($order['shipping_status'] != 0){
            $this->error('已发货订单不允许编辑');
            exit;
        }
        return;
    }
	
	//执行操作按钮
	public function orderOperate($order_id){
		$request=request();
		$type=$request->param('type');
		if(!empty($type)){
			$updata=[];
			$order=DB::name('Order')->where("order_id",$order_id)->find();
			if($order['order_status']=='4'){
				$this->error('订单不能操作！');
			}
			if($order['order_status']=='2'){
				$this->error('订单已完成不能操作！');
			}
			$note=trim($request->param('note'));
			switch($type){
				case 'confirm':
					$updata['order_status'] = 1;
					$note = empty($note) ? '订单确认' : $note;
					$goods_arr= Db::name('order_sub')->field('goods_id')->where('order_id',$order_id)->select();
					foreach ($goods_arr as $key => $value) {
						Db::name('goods')->where('goods_id',$value['goods_id'])->setInc('sales_sum');
						$store_count = Db::name('goods')->where('goods_id',$value['goods_id'])->value('store_count');
						if($store_count > 0){
							$res = Db::name('goods')->where('goods_id',$value['goods_id'])->setDec('store_count');
						}
						
					}
					break;
				case 'cancel':
					$updata['order_status'] = 0;
					$note = empty($note) ? '取消确认' : $note;
					break;
				case 'pay':
					$updata['pay_status'] = 1;
					$updata['pay_time'] = time();
					$note = empty($note) ? '付款' : $note;
					
					break;
				case 'nopay':
					if(empty($note)){
						$this->error('请填写操作备注');
					}
					$updata['pay_time'] = null;
					$updata['pay_status'] = 0;
					$note = empty($note) ? '取消付款' : $note;
					break;
				case 'invalid':
					if(empty($note)){
						$this->error('请填写操作备注');
					}
					$updata['order_status'] = 4;
					break;
                case 'take':
                    //提货
                    $note = empty($note) ? '提货' : '提货：'.$note;
                    $updata['shipping_status'] = 1;
                    $updata['shipping_time']   = time();
                    break;
                case 'revert':
                    //归还
                    $note = empty($note) ? '归还' : '归还：'.$note;
                    $updata['shipping_status'] = 2;
                    break;
				case 'receive':
					$updata['shipping_status'] = 2;
					$note = empty($note) ? '确认收货' : $note;
					break;
				case 'complete':
					$updata['order_status'] = 2;
					$note = empty($note) ? '订单完成' : $note;
					break;
				case 'return':
					$updata['order_status'] = 3;
					$note = empty($note) ? '退款' : $note;
					break;
                case 'refund':
					$updata['order_status'] = 3;
                	$updata['refun_status'] = 1;
					$note = empty($note) ? '操作退款' : $note;
					Db::name('delivery_order')->where('order_id',$order_id)->update(['status'=>1]);
					break;
				default:
					return true;
			}			
			$result = DB::name('Order')->where("order_id",$order_id)->update($updata);
			$admin_id = cmf_get_current_admin_id();
			logOrder($order_id,$note,$type,$admin_id);
			
			if($result){
				$this->success('操作成功',url('AdminOrder/detail',["order_id"=>$order_id]));
			}else{
				$this->error('操作失败');
			}
		}
	}
	
	//发货
	public function ship_info($order_id){
		$order = $this->OrderLogic->orderInfo($order_id); //获取订单详细 goods_order
		$goods_order = $this->OrderLogic->getGoodsOrder($order_id); //获取订单产品信息 order_sub

		$type = request()->param('type');
		if(isset($type) && $type == 'confirm_ship'){
			$note            = request()->param('note');
			$shipping_id     = request()->param('shipping_id',0,'intval');
			$delivery_no     = request()->param('delivery_no');
			$ship_info = Db::name('shipping_express')->where('id',$shipping_id)->find();
			if(empty($ship_info))$this->error('请选择配送物流');
			if(empty($delivery_no))$this->error('请填写快递单号');
			
			$note = empty($note) ? '发货' : $note;
			$data = [
				'shipping_status' => 1,
				'shipping_name'	  => $ship_info['name'],
				'delivery_no'	  => $delivery_no,
				'shipping_time'   => time(),
				'shipping_code'	  => $ship_info['code']
			];
			//确定发货			
			$result = Db::name('Order')->where("order_id", "$order_id")->update($data);
			$result2 = Db::name('OrderSub')->where("order_id","$order_id")->update(["is_send"=>1]);
			$admin_id = cmf_get_current_admin_id();
			logOrder($order_id,$note,$type,$admin_id);
			if($result && $result2){
				$this->success('操作成功',url('AdminOrder/detail',["order_id"=>$order_id]));
			}else{
				$this->error('操作失败');
			}
		}
		$ship_list = Db::name('shipping_express')->order('list_order','asc')->select();

		$this->assign('ship_list',$ship_list);
		$this->assign('order',$order);
		$this->assign('goods_order',$goods_order);
		return $this->fetch();
	}
	
	//发货单列表
	public function ship_list(){

		return $this->fetch();
	}
	
	//ajax获取发货单列表
	public function ajax_ship_list(){
		$where = [
			['is_del','=',0],
			['shipping_status','neq',0]
		];
		$limit 			 = request()->param('limit',10,'intval');
        $keyword_sn	  	 =	request()->param('keyword_sn');
		$keyword_name 	 =	request()->param('keyword_name');
		$order_status 	 =	request()->param('order_status');
		$pay_status 	 =  request()->param('pay_status');
		$shipping_status =  request()->param('shipping_status');

        if($keyword_sn)          $where[] = ['order_sn','like',"%$keyword_sn%"];
		if($keyword_name)        $where[] = ['consignee','like',"%$keyword_name%"];
		if($order_status != '')  $where[] = ['order_status','=',$order_status];
		if($pay_status != '')    $where[] = ['pay_status','=',$pay_status];
		if($shipping_status!='') $where[] = ['shipping_status','=',$shipping_status];

		$order_str = ['order_id'=>'desc'];
		$count     = Db::name('order')->where($where)->count();	
		$order_list= $this->order_model->where($where)->order($order_str)->paginate($limit);
		
		$result = ['code'=>0,'count'=>$count,'data'=>$order_list->items()];
		die(json_encode($result));

	}
	
	//查看发货单
	public function ship_detail($order_id){
		$order_id 	 = request()->param('order_id');
		$order    	 = $this->OrderLogic->orderInfo($order_id);
		$goods_order = $this->OrderLogic->getGoodsOrder($order_id);
		$action_log  = Db::name('OrderLog')->where('order_id',$order_id)->order('log_time','desc')->select();
		$order_btn   = $this->OrderLogic->getOrderBtn($order); //获取按钮
		
		$this->assign('order',$order);
		$this->assign('goods_order',$goods_order);
		$this->assign('action_log',$action_log);
		$this->assign('order_btn',$order_btn);
		return $this->fetch();
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