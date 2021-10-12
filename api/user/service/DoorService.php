<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace api\user\service;

use think\Log;
use think\Db;
use Endroid\QrCode\QrCode;
use api\user\service\CryptRc4Service;

class DoorService
{
    protected $key = 'F1281B8D1DA865A7D3B5BF28D87F97FE';
	
	public function rule_a($data=[])//$pwd密钥　$data需加密字符串
	{
		
		//第一种规则
		$str = '{"t":3,"i":"'.$data['mobile'].'","s":"'.$data['start'].'","e":"'.$data['end'].'"}';

		$rc4 = new CryptRc4Service();
		$rc4 -> setKey($this->key);
		$end_str = 'MW01'.strtoupper($rc4->encrypt($str));
	
		$qrCode = new QrCode($end_str);
		$qrCode->setSize(300);
		$file_name = 'user/door/'.md5($end_str);
		$qrCode->writeFile(WEB_ROOT.'upload/'.$file_name.'.png');
		
		return $file_name.'.png';
	}
	/**
	 * open_type  0:入场  1：出场
	 * number     多人预约编号
	 * nums       次数
	 */
	public function rule_b($data=[],$open_type=0,$number=0,$nums=0)//$pwd密钥　$data需加密字符串
	{
		$file_name = Db::name('place_code')->where('order_id',$data['order_id'])->value('img');
		
		if(empty($file_name)){
			
			$mobile = Db::name('user')->where('id',$data['user_id'])->value('mobile');
			$mobile = empty($mobile)?'18392863616':$mobile;
			//第一种规则
			$arr = [38,7,$nums,$mobile,$data['start'],$data['end'],$data['device_sn']];
			
			$data_arr = [];
			foreach($arr as $vo){
				$res = $this->num_dechex($vo);
				$data_arr = array_merge($data_arr,$res);
			}
			
			$data_str  = implode('',$data_arr);
			$rc4 = new CryptRc4Service();
			$rc4->setKey($this->key);
			$end_str = strtoupper($rc4->encrypt(hex2bin($data_str)));
				
			$qrCode = new QrCode($end_str);
			$qrCode->setSize(300);
			$file_name = 'user/door/'.md5($end_str).'.png';
			$qrCode->writeFile(WEB_ROOT.'upload/'.$file_name);
			
			$insert_data = [
			    'order_id'  => $data['order_id'],
				'user_id'   => $data['user_id'],
			    'open_type' => $open_type,
			    'start_time'=> $data['start'],
			    'end_time'  => $data['end'],
			    'device_sn' => $data['device_sn'],
			    'img'       => $file_name,
			    'code'      => $end_str,
			    'number'    => $number,
			    'nums'      => $nums,
			    'add_time'  => time(),
			    'mobile'    => $mobile,
			    'status'    => 0
			];
			Db::name('place_code')->insert($insert_data);
		}
		
		return $file_name;
	}
	
	public function rule_coach_b($data=[],$open_type=0,$number=0,$nums=0)//$pwd密钥　$data需加密字符串
	{
		$file_name = Db::name('place_code')->where('time_id',$data['time_id'])->where(['start_time'=>$data['start'],'end_time'=>$data['end']])->value('img');


		if(empty($file_name)){
			
			$mobile = Db::name('user')->where('id',$data['user_id'])->value('mobile');
			$mobile = empty($mobile)?'18392863616':$mobile;
			//第一种规则
			$arr = [38,7,$nums,$mobile,$data['start'],$data['end'],$data['device_sn']];
			
			$data_arr = [];
			foreach($arr as $vo){
				$res = $this->num_dechex($vo);
				$data_arr = array_merge($data_arr,$res);
			}
			
			$data_str  = implode('',$data_arr);
			$rc4 = new CryptRc4Service();
			$rc4->setKey($this->key);
			$end_str = strtoupper($rc4->encrypt(hex2bin($data_str)));
				
			$qrCode = new QrCode($end_str);
			$qrCode->setSize(300);
			$file_name = 'user/door/'.md5($end_str).'.png';
			$qrCode->writeFile(WEB_ROOT.'upload/'.$file_name);
			
			$insert_data = [
			    'time_id'   => $data['time_id'],
				'user_id'   => $data['user_id'],
			    'open_type' => $open_type,
			    'start_time'=> $data['start'],
			    'end_time'  => $data['end'],
			    'device_sn' => $data['device_sn'],
			    'img'       => $file_name,
			    'code'      => $end_str,
			    'number'    => $number,
			    'nums'      => $nums,
			    'add_time'  => time(),
			    'mobile'    => $mobile,
			    'status'    => 0
			];
			Db::name('place_code')->insert($insert_data);
		}
		
		return $file_name;
	}
	public function text_rule_b($data=[],$nums=1)//$pwd密钥　$data需加密字符串
	{
	    
		//第一种规则
		$arr = [38,7,$nums,15295513108,$data['start'],$data['end'],$data['device_sn']];
		
		$data_arr = [];
		foreach($arr as $vo){
			$res = $this->num_dechex($vo);
			$data_arr = array_merge($data_arr,$res);
		}
		$data_str  = implode('',$data_arr);
		$rc4 = new CryptRc4Service();
		$rc4->setKey($this->key);
		$end_str = strtoupper($rc4->encrypt(hex2bin($data_str)));
	
		$qrCode = new QrCode($end_str);
		$qrCode->setSize(300);
		$file_name = 'user/door/'.md5($end_str);
		$qrCode->writeFile(WEB_ROOT.'upload/'.$file_name.'.png');
		
		
		return $file_name.'.png';
	}
	
	
	//10转16进制
	public function num_dechex($num)
	{
	    $str = dechex($num);
		$length = strlen($str);
		if($length%2 == 1){
			$str = '0'.$str;
		}
		$result = [];
		$a = 0;
		for($a=0;$a<strlen($str);$a++){
			$result[] = substr($str,$a,2);
			$a++;
		}
	    return $result;
	}
	
	public function test()//$pwd密钥　$data需加密字符串
	{
		
		//第一种规则
		$arr = [38,7,1,15295513108,1614067233,1614153633,2358936242];
		
		$data_arr = [];
		foreach($arr as $vo){
			$res = $this->num_dechex($vo);
			$data_arr = array_merge($data_arr,$res);
		}
		
		$data_str  = implode('',$data_arr);
		$rc4 = new CryptRc4Service();
		$rc4->setKey($this->key);
		$end_str = strtoupper($rc4->encrypt(hex2bin($data_str)));
	
		$qrCode = new QrCode($end_str);
		$qrCode->setSize(300);
		$file_name = 'user/door/'.date('H-i-s',time());
		$qrCode->writeFile(WEB_ROOT.'upload/'.$file_name.'.png');
		
		return $file_name.'.png';
	}
	
}
