<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace app\device\controller;

use api\user\service\DoorService;
use think\facade\Log;
use think\Db;
use cmf\controller\RestBaseController;

class HeartController extends RestBaseController
{
    // api 首页
    public function index()
    {
		$param = request()->param();
		
		$cmd  		  = request()->post('cmd',0,'intval');
		$device_sn    = request()->post('device_sn');
		$cmd_reply_id = request()->post('cmd_reply_id');
		$status 	  = request()->post('status',0,'intval');
  
		if(!empty($cmd)){
		    Log::write($param);
		}
		
		
		// Log::write($device_sn);
		
		switch ($cmd) {
		    case 1:
					//开门回应
					$this->no_operation();
					
					$one = $one = Db::name('place_open')->where(['id'=>$cmd_reply_id,'device_sn'=>$device_sn])->order('id','asc')->find();
					if($one){
						if($status == 1){
							Db::name('place_open')->where('id',$cmd_reply_id)->update(['open_time'=>time(),'open_status'=>1]);
							//无操作
							$this->no_operation();
						}else{
							//开门失败，继续开门
							$this->open_door($one['id']);
						}
					}else{
						//无操作
						$this->no_operation();
						
					}
		        break;
		    case 81:
					//开门回应
					
					$cmd_reply_id = request()->param('cmd_reply_id');
	                if($cmd_reply_id){
	                    
	                    $visit_time = request()->param('visit_time');   //验证时间
	                    $type       = request()->param('type');         //ID 类型（1：IC 卡；2：APP ID; 3: 二维码）
	                    $mobile     = request()->param('value');        //ID 号码，十进制字符串
	                    $property   = request()->param('property');     //脱机校验结果 0: 正常通过；1: 不存在白名单 2：超出截止时间， 3：未到有效时间 4. 超过访问次数
	                    if($property == 0){
	                        if($type == 3){
	                            $visit_time = strtotime($visit_time);
	                            $where = [
	                                ['status','=',0],
	                                ['number','=',0],
	                                ['device_sn','=',$device_sn],
	                                ['mobile','=',$mobile],
	                                ['start_time' ,'<',$visit_time],
	                                ['end_time','>',$visit_time],
	                            ];
	                            $row = Db::name('place_code')->where($where)->order('id','desc')->find();
	                            
	                            if($row){
	                                
	                                Db::name('place_code')->where('id',$row['id'])->update(['status'=>1,'visit_time'=>$visit_time]);
	                                Db::name('league_order')->where(['id'=>$row['order_id'],'order_status'=>2])->update(['order_status'=>3,'visit_time'=>$visit_time]);
	                               
	                                
	                            }
	                        }
	                    }
	                    
	                    $result = [
                			'cmd'          => 81,
                			'cmd_reply'    => 1,
                			'cmd_reply_id' => $cmd_reply_id,
                			'status'       => 0
                		];
                		die(json_encode($result,JSON_UNESCAPED_UNICODE));
	                }
            	    
		        break;
		    default:
		        
		        //检测是否有需要开门的
		        /*$one = Db::name('place_open')->where(['open_status'=>0,'device_sn'=>$device_sn])->order('id','asc')->find();
		        if($one){
		        	//开门
		        	$this->open_door($one['id']);
		        }else{
		        	//无操作
		        	Db::name('goods')->where('device_sn',$device_sn)->update(['on_time'=>time()]);
		        	$this->no_operation();
		        }*/
		        $one = Db::name('device')->where('device_sn',$device_sn)->order('id','desc')->find();
		        if($one){
		            Db::name('device')->where('id',$one['id'])->update(['update_time'=>time()]);
		        }else{
		            Db::name('device')->insert([
		                'add_time'      => time(),
		                'update_time'   => time(),
		                'device_sn'     => $device_sn
		            ]);
		        }
		        $this->no_operation();
		}
		
		// die(json_encode($result,JSON_UNESCAPED_UNICODE));
	
    }
	//开门
	public function open_door($id){
		
		$result = [
			'cmd'          => 1,
			'cmd_reply'    => 1,
			'cmd_reply_id' => $id,
			'status'	   => 0,
			'display_msg'  => ' 请 进 '
		];
		die(json_encode($result,JSON_UNESCAPED_UNICODE));
		
	}
	
	//无操作
	public function no_operation(){
		
	    
		$result = [
			'cmd'          => 0,
			'cmd_reply'    => 0,
			'cmd_reply_id' => time(),
			'status'       => 0
		];
		$device_sn    = request()->post('device_sn');
		if($device_sn == '23'){
		    $result = [
    			'cmd'          => 81,
    			'cmd_reply'    => 1,
    			'cmd_reply_id' => time(),
    			'status'       => 0
    		];
		}
	    //批量添加白名单
		//添加白名单
    	
    		/*$result = [
    			'cmd'          => 7,
    			'cmd_reply'    => 1,
    			'cmd_reply_id' => time(),
                "list"  => [
        			[
        				"value"		=>	"2311867414", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2311971768", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2312030582", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2311974264", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2312025321", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2312005266", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2312030447", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2312049426", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2311824391", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			],
        			[
        				"value"		=>	"2311824279", 
        				"type"		=>	1,
        				"start"     => "2020-09-22 17:00:09",
                        "end"       => "2030-09-22 17:10:09",
        				"flag"		=>	0
        			]
        		]
    		];
		    //添加白名单
    		$result = [
    			'cmd'          => 6,
    			'cmd_reply'    => 1,
    			'cmd_reply_id' => time(),
    			'value'        => '2232776368',
    			'type'         => 1,
    			"start"        => "2020-09-22 17:00:09",
                "end"          => "2025-09-22 17:10:09",
                'flag'         => 0
    		];
    		//设置秘钥
    		$result = [
    			'cmd'          => 8,
    			'cmd_reply'    => 1,
    			'cmd_reply_id' => time(),
    			"heart_timer"  => 10000,
    			'qr_key'       => 'F1281B8D1DA865A7D3B5BF28D87F97FE',
    		];
    	*/
    	
    	die(json_encode($result,JSON_UNESCAPED_UNICODE));
		
	}
	
	public function confrim_operation(){
	    $cmd_reply_id = request()->param('cmd_reply_id');
	    
	    $result = [
			'cmd'          => 81,
			'cmd_reply'    => 0,
			'cmd_reply_id' => $cmd_reply_id,
			'status'       => 0
		];
		die(json_encode($result,JSON_UNESCAPED_UNICODE));
	}

}
