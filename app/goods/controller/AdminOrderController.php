<?php

namespace app\goods\controller;

use api\goods\service\SkuServer;
use api\user\service\PayService;
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
        $mobile 	     =	request()->param('mobile');
		$order_status 	 =	request()->param('order_status');
		$pay_status 	 =  request()->param('pay_status');
		$shipping_status =  request()->param('shipping_status');
        $send_type 	     =  request()->param('send_type');
        $buy_type 	     =  request()->param('buy_type');



		if($order_status != '')  $where[] = ['order_status','=',$order_status];
		if($pay_status != '')    $where[] = ['pay_status','=',$pay_status];
		if($shipping_status!='') $where[] = ['shipping_status','=',$shipping_status];
        if($send_type != '')     $where[] = ['send_type','=',$send_type];
        if($buy_type != '')      $where[] = ['buy_type','=',$buy_type];
        if($mobile)              $where[] = ['mobile','like',"%$mobile%"];
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

	public function time(){

	    $id = request()->param('id',0,'intval');
	    $order = Db::name('order')->where('order_id',$id)->find();
        $order_sub = Db::name('order_sub')->where('order_id',$id)->select()->toarray();
        if(request()->isPost()){
            $param = request()->param();
            if(empty($param['start_time']))     $this->error('请选择开始时间');
            if(empty($param['end_time']))       $this->error('请选择结束时间');
            if($order['buy_type'] != 0)         $this->error('不是租赁订单');
            if($order['order_status'] != 1)     $this->error('订单未确认');
            if($order['shipping_status'] == 2)  $this->error('订单已归还');

            $start_time = strtotime($param['start_time']);
            $end_time   = strtotime($param['end_time'].' 23:59:59');

            $sku_service = new SkuServer();
            $new_data = $sku_service->printDates($start_time,$end_time);
            foreach ($order_sub as $value) {
                $res_sku = $sku_service->checkCount($value['goods_id'], $value['sku_id'], $start_time, $end_time, $value['goods_num']);
                if ($res_sku['code'] == 0) {
                    $this->error($res_sku['msg']);
                }
            }
            Db::startTrans(); //开启事务
            try {
                $zu_data = $sku_service->printDates($order['start_time'],$order['end_time']);
                foreach ($order_sub as $value){
                    foreach ($zu_data as $vo){
                        $where = ['goods_id'=>$value['goods_id'],'sku_id'=>$value['sku_id'],'date_time'=>$vo['time']];
                        Db::name('goods_count')->where($where)->setDec('sell_count',$value['goods_num']);
                    }
                }
                foreach ($order_sub as $value){
                    $res_sku = $sku_service->checkCount($value['goods_id'],$value['sku_id'],$start_time,$end_time,$value['goods_num']);
                    if($res_sku['code'] == 0){
                        throw new \Exception($res_sku['msg']);
                    }
                    foreach ($new_data as $vo){
                        $where = ['goods_id'=>$value['goods_id'],'sku_id'=>$value['sku_id'],'date_time'=>$vo['time']];
                        $count_id = Db::name('goods_count')->where($where)->value('id');
                        if($count_id){
                            Db::name('goods_count')->where('id',$count_id)->setInc('sell_count',$value['goods_num']);
                        }else{
                            $where['sell_count'] = $value['goods_num'];
                            $where['year']       = date("Y",$vo['time']);
                            $where['month']      = date("m",$vo['time']);
                            $where['day']        = date("d",$vo['time']);
                            Db::name('goods_count')->insert($where);
                        }
                    }
                    Db::name('order_sub')->where('rec_id',$value['rec_id'])->update(['start_time'=>$start_time,'end_time'=>$end_time]);
                }
                Db::name('order')->where('order_id',$id)->update(['start_time'=>$start_time,'end_time'=>$end_time]);
                $admin_id = cmf_get_current_admin_id();
                $msg = '改期：【'.date('Y-m-d',$order['start_time']).'~'.date('Y-m-d',$order['end_time']).'】'.'【'.$param['start_time'].'~'.$param['end_time'].'】';

                logOrder($id,$msg,'update_time',$admin_id);
                Db::commit();
            } catch (\Exception $e) {
                $msg= $e->getMessage();
                // 回滚事务
                Db::rollback();

                $this->error($msg);
            }
            $this->success('修改成功');
        }

        $service = new SkuServer();
        $start_time = strtotime(date("Y-m-d",time()));
        $end_time   = $start_time+23*24*3600;

        foreach($order_sub as $key=>$vo){
            $order_sub[$key]['date_time'] = $service->dateCount($vo['goods_id'],$vo['sku_id'],$start_time,$end_time);
        }
	    $this->assign('order',$order);
        $this->assign('order_sub',$order_sub);
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
					$note = empty($note) ? '订单确认支付' : $note;

					$service = new PayService();
                    $service->shopPay($order['order_sn']);
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
                    $updata['confirm_time'] = time();

                    $goods = Db::name('order_sub')->field('goods_id,goods_num,sku_id')->where('order_id',$order['order_id'])->select();
                    foreach ($goods as $vo){
                        Db::name('goods')->where('goods_id',$vo['goods_id'])->setDec('lease_num',$vo['goods_num']);
                        if($vo['sku_id']){
                            Db::name('goods_sku')->where('sku_id',$vo['sku_id'])->setDec('lease_num',$vo['goods_num']);
                        }
                    }
                    break;
				case 'receive':
					$updata['shipping_status'] = 2;
                    $updata['confirm_time'] = time();
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
			if($type != 'confirm'){
                $admin_id = cmf_get_current_admin_id();
                logOrder($order_id,$note,$type,$admin_id);
            }

			
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