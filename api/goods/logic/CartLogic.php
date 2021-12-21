<?php

namespace api\goods\logic;

use api\goods\service\SkuServer;
use think\Db;
use think\Log;
use think\Model;
use api\goods\model\CartModel;
use think\model\Relation;
/**
 * 购物车 逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class CartLogic extends Relation
{
    /**
     * 加入购物车方法
     * @param type $goods_id  产品id
     * @param type $goods_num   产品数量
     * @param type $goods_spec  选择规格
     * @param type $user_id 用户id
     */

    function addCart($goods_id,$goods_num,$user_id = 0,$sku_id="")
    {

        $goods = Db::name('Goods')->where(['goods_id'=>$goods_id,'is_on_sale'=>1])->find();
        if(empty($goods))   return array('status'=>-2,'msg'=>'产品不存在！','result'=>'');

        // 找出这个
        $where = ["type"=>0,'user_id'=>$user_id];
        $catr_count = Db::name('Cart')->where($where)->count(); // 查找购物车产品总数量
        if($catr_count >= 20){
            return array('status'=>-9,'msg'=>'购物车最多只能放20种产品','result'=>'');
        }



        $data = [
            'user_id'         => $user_id,   // 用户id
            'goods_id'        => $goods_id,   // 产品id
            'goods_cat_id'    => $goods['cat_id'],   // 产品分类id
            'supplier_id'     => $goods['supplier_id'],
            'goods_sn'        => $goods['goods_sn'],   // 产品货号
            'goods_name'      => $goods['goods_name'],   // 产品名称
            'goods_img'      =>  $goods['goods_img'],   // 产品名称
            'goods_price'     => $goods['shop_price'],  // 购买价
            'hire_price'      => $goods['hire_price'],  // 购买价
            'is_buy'           => $goods['is_buy'],  // 购买价
            'goods_num'        => $goods_num, // 购买数量
            'type'             => 0,
            'add_time'        => time()
        ];

        //获取规格
        $result_sku          = $this->getSkuArr($sku_id,$goods_id);
        if($result_sku['status'] == 0) return array('status'=>-9,'msg'=>$result_sku['msg'],'result'=>'');
        if($result_sku['status'] == 1){
            $goods_sku = $result_sku['goods_sku'];
            $goods['store_count']   = $goods_sku['store_count'];
            $data['goods_price']     = $goods_sku['price'];
            $data['hire_price']     = $goods_sku['hire_price'];
            $data['sku_id']         = $goods_sku['sku_id'];
            $data['spec_path']      = $goods_sku['item_path'];
            $data['spec_item_name'] = $goods_sku['spec_item_name'];
            $data['goods_img']      = empty($goods_sku['sku_img'])?$data['goods_img']:$goods_sku['sku_img'];;
        }

        $where['goods_id'] = $goods_id;
        $where['sku_id']   = $sku_id;
        $catr_goods = Db::name('Cart')->where($where)->find(); // 查找购物车是否已经存在该产品
       // 如果产品购物车已经存在
       if($catr_goods)
       {
            //是否存在规格
            
            // 如果购物车的已有数量加上 这次要购买的数量  大于  库存输  则不再增加数量
            if($goods_num == 0){
                $res_num = $catr_goods['goods_num'] + 1;
            }elseif($goods_num > 0){
                $res_num = $goods_num;
            }else{
                $res_num = $catr_goods['goods_num'] + $goods_num;
            }
            
            if($res_num < 1){
                return ['status'=>-2,'msg'=>'加入购物车失败','result'=>''];
            }else{
                if($res_num > $goods['store_count']){

                    $cha_num = $goods['store_count'] - $res_num;
                    return ['status'=>-102,'msg'=>'数量不足,请与客服联系','result'=>''];

                }else{
                    
                    $data['goods_num'] = $res_num;
                    $result = Db::name('Cart')->where("id",$catr_goods['id'])->update($data); // 数量相加
                    return ['status'=>1,'msg'=>'成功加入购物车'];
                    
                }
            }

        }
        else
        {
            if($goods_num <= 0){
                
                return ['status'=>-2,'msg'=>'加入购物车失败','result'=>''];
                
            }else{
                
                if($goods_num >$goods['store_count'])
                    return ['status'=>-102,'msg'=>'数量不足,请与客服联系','result'=>''];

                $insert_id = DB::name('Cart')->insert($data);
                return ['status'=>1,'msg'=>'成功加入购物车'];
            }

        }
        return ['status'=>-5,'msg'=>'加入购物车失败'];
    }

    /**
     * 购物车列表
     * @param type $user   用户
     * @param type $session_id  session_id
     * @param type $selected  是否被用户勾选中的 0 为全部 1为选中  一般没有查询不选中的产品情况
     * $mode 0  返回数组形式  1 直接返回result
     */
    function cartList($user_id,$type=0)
    {


        $where = [
            'type'        => 0,
            'user_id'     => $user_id
        ];
        if($type == 1){
            $where['selected'] = 1;
        }
        $cartModel = new CartModel;
        
        $result = [];
        $anum = $total_price =  $cut_fee = 0;
        
        $cartList = $cartModel->where($where)->select()->toArray();  // 获取购物车产品
        foreach ($cartList as $k=>$val){
            $cartList[$k]['checked']   = $val['selected'] == 1?true:false;
            $cartList[$k]['goods_fee'] = sprintf('%.2f',$val['goods_num'] * $val['goods_price']);
        }

        return ['status'=>1,'msg'=>'','result'=>['cartList' =>$cartList]];
    }
    public function getTotalPrice($user_id,$type=0,$pay_code = 'wxpay'){
        
        $siteInfo = cmf_get_site_info();
        $discount = $siteInfo['site_discount'];
        $start_time = $coupon_price = $end_time = $use_day = $buy_type = 0;
        if($type == 0){
            
            $where = [
                'type'        => 0,
                'user_id'     => $user_id,
                'selected'    => 1
            ];

            $cartModel = new CartModel;
            $cartList = $cartModel->where($where)->select();  // 获取购物车产品
            $anum = $total_price =  $cut_fee = 0;

            foreach ($cartList as $k=>$val){

                if($val['buy_type']==0){
                    //租赁价格
                    $use_day    = ceil(($val['end_time']-$val['start_time'])/(24*3600));
                    $start_time = date('Y-m-d',$val['start_time']);
                    $end_time   = date('Y-m-d',$val['end_time']);

                    $cut_fee     += $val['goods_num'] * $val['hire_price']*$use_day; //应付价格
                    $total_price += $val['goods_num'] * $val['hire_price']*$use_day; //产品总价
                }else{
                    $buy_type = 1;
                    //购买价格
                    $cut_fee += $val['goods_num'] * $val['goods_price']; //应付价格
                    $total_price += $val['goods_num'] * $val['goods_price']; //产品总价
                }

                $anum    += $val['goods_num'];

            }

        }else{
            $where = [
                'type'        => 1,
                'user_id'     => $user_id
            ];
            $cartModel = new CartModel;
            $cart = $cartModel->where($where)->find();  // 获取购物车产品

            $anum = $cart['goods_num'];

            if($cart['buy_type']==0){
                $use_day    = ceil(($cart['end_time']-$cart['start_time'])/(24*3600));
                $start_time = date('Y-m-d',$cart['start_time']);
                $end_time   = date('Y-m-d',$cart['end_time']);

                $total_price =  $cart['goods_num']*$cart['hire_price']*$use_day;
                $cut_fee     =  $cart['goods_num']*$cart['hire_price']*$use_day;
            }else{
                $total_price =  $cart['goods_num']*$cart['goods_price'];
                $cut_fee     =  $cart['goods_num']*$cart['goods_price'];
                $buy_type    =  1;
            }

        }
        if($pay_code == 'balance'){
            
            if($discount > 0 && $buy_type == 0){
                $cut_fee = $cut_fee*$discount/10;
                $coupon_price = $total_price-$cut_fee;
                
            }
        }
        $result = ['total_fee' => sprintf('%.2f', $total_price),'coupon_price' => $coupon_price, 'cut_fee' => sprintf('%.2f', $cut_fee),'num'=> $anum,'use_day'=>$use_day,'buy_type'=>$buy_type,'start_time'=>$start_time,'end_time'=>$end_time];

        return $result;
    }
    /**
     * 直接购买
     * @param type $goods_id  产品id
     * @param type $goods_num   产品数量
     * @param type $goods_spec  选择规格
     * @param type $buy_type  类型 0 ：租赁，1：购买
     */
    public function addBuy($goods_id,$goods_num,$sku_id,$user_id,$buy_type = 0,$param=[]){
        $where=[
            'goods_id'=>$goods_id
        ];
        $goods = Db::name('Goods')->where($where)->find(); // 找出这个产品
        if(!$goods){
            return array('status'=>-1,'msg'=>'产品不存在','result'=>'');
        }
        if($goods_num <= 0){
            return array('status'=>-2,'msg'=>'购买产品数量不能为0','result'=>'');
        }
        if($buy_type == 0){
            if($goods['is_lease'] == 0) return ['status'=>-2,'msg'=>'不可以租赁','result'=>''];
        }
        if($buy_type == 1){
            if($goods['is_buy'] == 0)  return ['status'=>-2,'msg'=>'不可以购买','result'=>''];
        }

        //获取规格
        $result_sku          = $this->getSkuArr($sku_id,$goods_id);
        if($result_sku['status'] == 0) return array('status'=>-9,'msg'=>$result_sku['msg'],'result'=>'');
        if($result_sku['status'] == 1){
            $goods_sku = $result_sku['goods_sku'];
            $goods['store_count']     = $goods_sku['store_count'];
            $goods['lease_num']       = $goods_sku['lease_num'];
            $goods['goods_price']     = $goods_sku['price'];
            $goods['hire_price']      = $goods_sku['hire_price'];
        }
        $time = time();
        if($goods['lease_num'] > 0){
            $goods['store_count'] = $goods['store_count']-$goods['lease_num'];
        }
        if($goods_num > $goods['store_count']){
            return ['status'=>-102,'msg'=>'数量不足,请与客服联系！','result'=>''];
        }
        $goods['buy_num'] = $goods_num;
        $data = [
            'user_id'          => $user_id,   // 用户id
            'goods_id'         => $goods_id,   // 产品id
            'goods_sn'         => $goods['goods_sn'],   // 产品货号
            'goods_name'       => $goods['goods_name'],   // 产品名称
            'goods_price'      => $goods['shop_price'],  // 购买价
            'hire_price'       => $goods['hire_price'],
            'goods_img'        => $goods['goods_img'],
            'supplier_id'      => $goods['supplier_id'],
            'goods_num'        => $goods_num, // 购买数量
            'add_time'         => time(), // 加入购物车时间
            'type'             => 1,
            'buy_type'         => $buy_type
        ];

        if($buy_type == 0){
            $data['start_time'] = strtotime($param['start_time']);
            $data['end_time']   = strtotime($param['end_time'].' 23:59:59');
            $service = new SkuServer();
            $res_sku = $service->checkCount($goods_id,$sku_id,$data['start_time'],$data['end_time'],$goods_num);
            if($res_sku['code'] == 0)  return ['status'=>-2,'msg'=>$res_sku['msg']];
        }
        if(!empty($goods_sku)){
            $data['sku_id']         = $goods_sku['sku_id'];
            $data['spec_path']      = $goods_sku['item_path'];
            $data['spec_item_name'] = $goods_sku['spec_item_name'];
        }



        Db::name('cart')->where(['user_id'=>$user_id,'type'=>1])->delete();
        DB::name('Cart')->insert($data);

        return array('status'=>1);
    }


    public function getBuyGoods($user_id){
        $cartModel = new CartModel;
        $goods = $cartModel->where(['user_id'=>$user_id,'type'=>1])->find();
        if(!$goods){
            return array('status'=>0,'msg'=>'无订单提交！');
        }
        $supplier = Db::name('supplier')->where('id',$goods['supplier_id'])->find();
        $cut_fee = $goods['goods_num'] * $goods['goods_price']; //应付价格
        $total_price = $goods['goods_num'] * $goods['goods_price']; //产品总价
        $coupon_fee = 0;

        $anum=$goods['goods_num'];
        $time = time();

        return array('status'=>1,'msg'=>'','result'=>['cartList' =>[$goods]]);
    }
    /**
     * 添加订单
     * @param type $user_id  用户id
     * @param type $address_id 地址id
     * @param type $cart_price 应付金额
     * @param type $pay_status 支付方式
     */
    public function addOrder($user_id,$address_id,$type,$coupon_id,$param=[],$send_type = 1){



        // 仿制灌水 1天只能下 50 单
        /*
        $order_count = Db::name('Order')->where("user_id= $user_id and order_sn like '".date('Ymd')."%'")->count(); // 查找购物车产品总数量
        if($order_count >= 50)return array('status'=>-9,'msg'=>'一天只能下50个订单','result'=>'');*/


        if($send_type == 1){
            $address = Db::name('UserAddress')->where(["address_id"=>$address_id,'user_id'=>$user_id])->find();
            if(!$address)return array('status'=>-9,'msg'=>'请填写收货地址！','result'=>NULL);
        }else{

            if(empty($param['consignee']))  return ['status'=>-9,'msg'=>'请填写联系人！','result'=>NULL];
            if(empty($param['mobile']))     return ['status'=>-9,'msg'=>'请填写手机号！','result'=>NULL];
            $address = [
                'consignee' => $param['consignee'],
                'mobile'    => $param['mobile'],
                'country'   => 0,
                'province'  => 0,
                'city'      => 0,
                'district'  => 0,
                'address'   => '',
            ];
        }

        
        $pay_code = $param['pay_code'];
        $pay_name = $pay_code=='wxpay'?'微信支付':($pay_code=='balance'?'余额支付':($pay_code=='cash'?'现金支付':'支付宝支付'));
        
        $cart_price = $this->getTotalPrice($user_id,$type,$pay_code);

        if($pay_code == 'balance'){
            $balance = Db::name('user')->where('id',$user_id)->value('balance');
            if($balance < $cart_price['cut_fee']){
                return array('status'=>-9,'msg'=>'余额不足','result'=>'');
            }
        }
        $result = [];
        $time = time();
        $transStatu=0;
        Db::startTrans(); //开启事务
        try {


            $result_sn = $order_sn = get_order_sn();
            $pay_data = [
                'amount'   => $cart_price['cut_fee'],
                'is_paid'  => 0,
                'type'     => 2,
                'order_sn' => $order_sn,
                'pay_code' => $pay_code,
                'add_time' => $time,
                'user_id'  => $user_id
            ];
            $pay_id = Db::name('pay_log')->insertGetId($pay_data);
            
            $order_status = $pay_code == 'cash'?0:1;
            $data = [
                'order_sn'      => $order_sn, // 订单编号
                'user_id'       => $user_id, //用户id
                'consignee'     => $address['consignee'], // 收货人
                'country'       => $address['country'],//'省份id',
                'province'      => $address['province'],//'详细地址',
                'city'          => $address['city'],//'详细地址',
                'district'      => $address['district'],//'详细地址',
                'address'       => $address['address'],//'详细地址',
                'mobile'        => $address['mobile'],//'手机',
                'goods_price'   => $cart_price['total_fee'],//'产品总价'
                'order_amount'  => $cart_price['cut_fee'],//'应付款金额',暂无优惠券运费等金额
                'total_amount'  => $cart_price['total_fee'],
                'coupon_price'  => $cart_price['coupon_price'],
                'shipping_price'=> '',
                'send_type'     => $send_type,
                'add_time'      => $time, //下单时间
                'coupon_id'     => $coupon_id,
                'order_status'  => $order_status,
                'user_note'     => $param['note'],
                'pay_status'    => 0,
                'pay_code'      => $pay_code,
                'pay_name'      => $pay_name,
                'buy_type'      => $cart_price['buy_type'],
                'use_day'       => $cart_price['use_day'],
                'start_time'    => strtotime($cart_price['start_time']),
                'end_time'      => strtotime($cart_price['end_time'].' 23:59:59'),
            ];

            $order_id = Db::name("Order")->insertGetId($data);

            // 记录订单操作日志
            $service = new SkuServer();
            //立即下单
            if($type == 1){

                $s_goods = Db::name('Cart')->field('goods_id,hire_price,goods_name,goods_sn,goods_num,goods_img,spec_item_name,spec_path,goods_price,member_goods_price,supplier_id,start_time,end_time,buy_type,sku_id')->where(['user_id'=>$user_id,'type'=>1])->find();
                //直接购买加入订单
                if($s_goods['buy_type']==0){
                    $res_sku = $service->checkCount($s_goods['goods_id'],$s_goods['sku_id'],$s_goods['start_time'],$s_goods['end_time'],$s_goods['goods_num']);
                    if($res_sku['code'] == 0){
                        throw new \Exception($res_sku['msg']);
                    }
                    $s_goods['goods_price'] = $s_goods['hire_price'];
                }else{
                    if($s_goods['sku_id'] > 0){
                        $store_count = Db::name('goods_sku')->where(['goods_id'=>$s_goods['goods_id'],'sku_id'=>$s_goods['sku_id']])->value('store_count');
                    }else{
                        $store_count = Db::name('goods')->where('goods_id',$s_goods['goods_id'])->value('store_count');
                    }
                    
                    $count = Db::name('goods_count')->where(['goods_id'=>$s_goods['goods_id'],'sku_id'=>$s_goods['sku_id']])->where('date_time','>',$time)->sum('sell_count');
                    if($count > 0){
                        $store_count = $store_count-$count;
                    }
                    if($store_count < $s_goods['goods_num']){
                        throw new \Exception($s_goods['goods_name'].'库存不足，请与客服联系');
                    }
                }

                $s_goods['order_id']    = $order_id; // 订单id
                $s_goods['use_day']     = $cart_price['use_day'];
                $s_goods['goods_total'] = $s_goods['goods_price']*$s_goods['goods_num'];
                Db::name("OrderSub")->strict(false)->insert($s_goods);
                Db::name('Cart')->where(['user_id'=>$user_id,'type'=>1])->delete();
                Db::name('pay_log')->where('id',$pay_id)->update(['goods_name'=>$s_goods['goods_name']]);
                logOrder($order_id,'下单成功','add',$user_id);


            }else{

                //购物车加入订单
                $where = ['user_id'=>$user_id,'selected'=>1,'type'=>0];
                $goods_name = [];
                $cartList = Db::name('Cart')->field('goods_id,hire_price,goods_name,goods_sn,goods_num,goods_img,spec_item_name,spec_path,goods_price,member_goods_price,supplier_id,start_time,end_time,buy_type,sku_id')->where($where)->select();
                foreach($cartList as $k=>$v)
                {
                    if($v['buy_type']==0){
                        $res_sku = $service->checkCount($v['goods_id'],$v['sku_id'],$v['start_time'],$v['end_time'],$v['goods_num']);
                        if($res_sku['code'] == 0){
                            throw new \Exception($res_sku['msg']);
                        }
                        $v['goods_price'] = $v['hire_price'];
                    }else{
                    
                        if($v['sku_id'] > 0){
                            $store_count = Db::name('goods_sku')->where(['goods_id'=>$v['goods_id'],'sku_id'=>$v['sku_id']])->value('store_count');
                        }else{
                            $store_count = Db::name('goods')->where('goods_id',$v['goods_id'])->value('store_count');
                        }
                        
                        $count = Db::name('goods_count')->where(['goods_id'=>$v['goods_id'],'sku_id'=>$v['sku_id']])->where('date_time','>',$time)->sum('sell_count');
                        if($count > 0){
                            $store_count = $store_count-$count;
                        }
                        if($store_count < $v['goods_num']){
                            throw new \Exception($v['goods_name'].'库存不足，请与客服联系');
                        }
                    }
                    $v['order_id']    = $order_id; // 订单id
                    $v['use_day']     = $cart_price['use_day']; // 订单id
                    $v['goods_total'] = $v['goods_price']*$v['goods_num'];
                    Db::name("OrderSub")->strict(false)->insert($v);

                    $goods_name[] = $v['goods_name'];
                }

                logOrder($order_id,'下单成功','add',$user_id);
                Db::name('pay_log')->where('id',$pay_id)->update(['goods_name'=>implode(',',$goods_name)]);
                //删除购物车已提交订单产品
                Db::name('Cart')->where($where)->delete();
            }

            $transStatu=1;
            $msg='提交订单成功';

            $result = [
                'order_sn' => $result_sn,
                'order_id' => $order_id
            ];

            Db::commit();
        } catch (\Exception $e) {
            $msg= $e->getMessage();
            $order_id=0;
            // 回滚事务
            Db::rollback();
        }



        return ['status'=>$transStatu,'msg'=>$msg,'result'=>$result]; // 返回新增的订单id
    }


    /**
     * 查看购物车的产品数量
     * @param type $user_id
     * $mode 0  返回数组形式  1 直接返回result
     */
    public function cart_count($user_id,$mode = 0){
        $count = Db::name('Cart')->where("user_id = $user_id and selected = 1")->count();
        if($mode == 1) return  $count;

        return ['status'=>1,'msg'=>'','result'=>$count];
    }
    public function buy_count($user_id,$mode = 0,$type = 0){
        $where=[
            'user_id'=>$user_id
        ];
        $where['type'] = $type == 0?0:1;

        $count = Db::name('Cart')->where($where)->count();
        if($mode == 1) return  $count;

        return ['status'=>1,'msg'=>'','result'=>$count];
    }
    public function getSkuArr($sku_id,$goods_id){

        $result = ['status'=>0,'msg'=>''];
        $goods_sku = Db::name('goods_sku')->where(["goods_id"=>$goods_id,"sku_id"=>$sku_id])->find();

        if($goods_sku){
            $goods_spec = explode('-', $goods_sku['item_path']);
            $spec_item_name = [];
            //处理产品规格
            foreach($goods_spec as $vo){
                $spec_path = Db::name('spec_item')->field('spec_id,item')->where("id",$vo)->find();
                $spec_name = Db::name('spec')->where('id',$spec_path['spec_id'])->value('spec_name');
                $spec_item_name[] = $spec_name.'：'.$spec_path['item'];
            }
            $goods_sku['spec_item_name'] = implode(';',$spec_item_name);
            $result['goods_sku'] = $goods_sku;
            $result['status']    = 1;
        }else{
            $one = Db::name('goods_sku')->where("goods_id" ,$goods_id)->find();
            if($one){
                $result['msg'] = '请选择规格';
            }else{
                $result['status'] = 2;
            }
        }

        return $result;
    }

}
