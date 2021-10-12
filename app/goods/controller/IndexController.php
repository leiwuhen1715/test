<?php

namespace app\goods\controller;
use cmf\controller\HomeBaseController;
use app\goods\service\ApiService;
use think\Db;
/**
 * 首页
 */
class IndexController extends HomebaseController {
	
    //首页 
	public function index() {
	  
	    /*$list = Db::name('meal_order')->select();
	    foreach($list as $vo){
	        list($year, $month, $day) = [date('Y',$vo['add_time']),date('m',$vo['add_time']),date('d',$vo['add_time'])];
	        Db::name('meal_order')->where('order_id',$vo['order_id'])->update([
	            'hire_money'  => $vo['ret_price']
	        ]);
	    }*/
	    
		$name = request()->param('supplier_name');
		$id   = request()->param('id',0,'intval');
		$date = request()->param('date');
        //$time = strtotime($date);
		list($year, $month, $day) = explode('-',$date);

		$supplier = Db::name('supplier')->field('thumbnail')->where(['id'=>$id,'supplier_name'=>$name])->find();
		if(empty($supplier))    $this->error('商家不存在');
		$where = [
		    'order_status' => 2,
		    'supplier_id'  => $id,
		    'year'         => $year,
		    'month'        => intval($month),
		    'day'          => intval($day),
		];
		$order_list   = Db::name('meal_order')->where($where)->order('order_id','asc')->select();   
		$hire_money   = Db::name('meal_order')->where($where)->sum('hire_money');                   //付款金额
		$order_amount = Db::name('meal_order')->where($where)->sum('other_order_amount');           //返现金额
		$this->assign([
		    'supplier'      => $supplier,
		    'date'          => $date,
		    'supplier_name' => $name,
		    'order_list'    => $order_list,
		    'hire_money'    => $hire_money,
		    'order_amount'  => $order_amount,
		]);
    	return $this->fetch(':index');
	}
	public function ajax() {
	    $allcategory=ApiService::terms();
		$sort = $_GET['order'] == 'desc' ? 'asc' : 'desc';
		
		if($sort == 'desc' && isset($_GET['order'])){
			$sort_icon = '<i class="fa fa-long-arrow-up"></i>';
		}else if($sort == 'asc' && isset($_GET['order'])){
			$sort_icon = '<i class="fa fa-long-arrow-down"></i>';
		}
		
		if(isset($_GET['sort']) && isset($_GET['order'])){			
			$order = "{$_GET['sort']} {$_GET['order']},on_time DESC";
		}
		$tid=I('get.tagid',0,'intval');
		
		$where=array("is_on_sale"=>1,"type"=>0,"is_delete"=>"neq 3");
		if($tid){
			$tag           = Db::name('PortalTag')->where(['status'=>1,'id'=>$tid])->find();
			if($tag){
				$where['tag']=['like','%'.$tid.'%'];
			}
		}
		$count=M('Goods')->where($where)->count();
		$list = M('Goods')
		->where($where)
		->order($order)
		->paginate(15);
		$str='';
		foreach ($list as $key => $vo) {
			$str.='<li class="item01">
                        <a href="'.U('goods/article/index',array('g_id'=>$vo['goods_id'])).'" class="pic"><img src="'.cmf_get_image_url($vo[goods_img]).'" alt="'.$vo[goods_name].'"></a>
                        <div class="txt">
                            <p>'.$vo[goods_name].'</p>
                            <div class="icon">
                                <p>
                                    <i class="iconfont">&#xe66b;</i>
                                    <span>'.$vo[click_count].'</span>
                                </p>
                                <p class="message">
                                    <i class="iconfont">&#xe6c9;</i>
                                    <span>'.$vo[comment_count].'</span>
                                </p>
                                <p class="praise">
                                    <i class="iconfont">&#xe70b;</i>
                                    <span>'.$vo[praise_count].'</span>
                                </p>
                            </div>
                        </div>
                    </li>';
		}
		$data=[
			'count'	=>$count,
			'str'	=>$str
		];
		die(json_encode($data));
		
	}

	

}


