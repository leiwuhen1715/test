<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
namespace api\goods\service;

use think\Db;

class SkuServer
{

    public function checkCount($goods_id,$sku_id,$start_time,$end_time,$goods_num){
        $result = ['code'=>1];
        $data_list = $this->dateCount($goods_id,$sku_id,$start_time,$end_time);

        foreach ($data_list as $vo){
            if($vo['store_count'] < $goods_num){
                $result['code'] = 0;
                $sku_name = $this->getSkuName($sku_id,$goods_id);
                $result['msg']  = $sku_name.'-'.$vo['time_date'].'日：库存不足';
                break;
            }
        }
        return $result;
    }
    //日期内库存
    public function dateCount($goods_id,$sku_id,$start_time,$end_time){

        if($sku_id){
            $store_count = Db::name('goods_sku')->where(['goods_id'=>$goods_id,'sku_id'=>$sku_id])->value('store_count');
        }else{
            $store_count = Db::name('goods')->where('goods_id',$goods_id)->value('store_count');
        }

        $date_list  = $this->storeCount($goods_id,$sku_id,$start_time,$end_time);

        $result = $this->printDates($start_time,$end_time);
        foreach ($result as $key=>$vo){
            $str_time = $vo['time'];
            if(in_array($str_time,$date_list['date_keys'])){
                $result[$key]['store_count'] = $store_count-$date_list['count_list'][$str_time];
            }else{
                $result[$key]['store_count'] = $store_count;
            }
        }

        return $result;
    }

    public function storeCount($goods_id,$sku_id,$start_time,$end_time){
        $result = [];
        $result['count_list'] = Db::name('goods_count')->where(['goods_id'=>$goods_id,'sku_id'=>$sku_id])->where('date_time','between',[$start_time,$end_time])->column('sell_count','date_time');
        $result['date_keys'] = array_keys($result['count_list']);
        return $result;
    }

    public function getSkuName($sku_id,$goods_id){
        $name_str = '';
        $sku_one = Db::name('goods_sku')->field('goods_id,item_path')->where('sku_id',$sku_id)->find();

        if($sku_one){
            $path_arr = explode('-',$sku_one['item_path']);

            foreach ($path_arr as $vo) {
                $name_str .= $this->getSpecName($vo);
            }
        }else{
            $name_str = Db::name('goods')->where('goods_id',$goods_id)->value('goods_name');
            $name_str = mb_scrub($name_str,0,4);
        }


        return $name_str;

    }

    public function getSpecName($id){
        $str = '';
        $spec_item = Db::name('spec_item')->field('spec_id,item')->where('id',$id)->find();
        if($spec_item){

            $spec_name = Db::name('spec')->where('id',$spec_item['spec_id'])->value('spec_name');
            $str = $spec_name.':'.$spec_name.';';
        }


        return $str;
    }
	
	//时间转换日期
	public function printDates($start,$end){

        $result = [];
        $a = 0;
        while ($start <= $end){
            $result[$a]['time'] = $start;
            $result[$a]['time_date'] = date('m-d',$start);
            $start = strtotime('+1 day',$start);
            $a++;
        }
        return $result;
    }

}
