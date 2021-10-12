<?php
namespace api\user\service;
use think\Db;


/**
 * 用户积分记录表
 * Class UserPointLog
 * @package app\common\model
 */
class SignService
{
	


    /**
     * 签到
     * @param $user_id
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\BindParamException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function sign($user_id)
    {
        $return = [
            'status' => 1,
            'msg'    => '',
            'data'   => 0
        ];

        //判断是否已经签到
        $res = $this->isSign($user_id);
        if($res['status'] == 1)
        {
			$return['status'] = 0;
            $return['msg'] 	  = '今天已经签到，无需重复签到';
            return $return;
        }

        //获取店铺签到积分设置
        $point = $this->getSignData($user_id);
        $return['data'] = $point;
        //插入数据库
		
		log_coin_change($user_id,'签到，获得'.$point.'个金币',$point,1);
        Db::name('user_other')->where('user_id',$user_id)->setInc('sign_day');
     

        return $return;
    }


    /**
     * 判断今天是否签到
     * @param $user_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function isSign($user_id)
    {
        $return = [
            'status' => 0,
            'msg' => '今天还没有签到'
        ];

        $beginToday = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $where=[
            ['user_id','=',$user_id],
            ['type','=',1],
            ['create_time','BETWEEN',[$beginToday,$endToday]],
        ];

        //兼容问题
        $day = Db::name('user_coin_log')->where($where)
            ->find();

        if($day)
        {
            $return['status'] = 1;
            $return['msg'] = '今天已经签到了';
        }

        $this->checkDay($user_id);

        return $return;
    }
    protected function checkDay($user_id){
		
        $old = Db::name('user_coin_log')->where(['user_id'=>$user_id,'type'=>1])->order('id','desc')->find();
        $beginYesterday = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $endYesterday   = mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $time=time();
        if($old){
			
            if($old['create_time'] >= $beginYesterday){
                $a=1;
            }else{
                Db::name('user_other')->where('user_id',$user_id)->update(['sign_day'=>0]);
            }
        }
    }

    /**
     * 签到指定积分计算
     * @param $user_id
     * @return array|float|int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function getSignData($user_id)
    {
		$core_data = [
			10,15,20,25,30,40,50
		];
        $sign_day=Db::name('user_other')->where('user_id',$user_id)->value('sign_day');
		$point = ($sign_day > 7)?50:$core_data[$sign_day];
        return $point;
    }


    /**
     * 获取签到信息
     * @param $user_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getSignInfo($user_id)
    {
      
    }


    /**
     * 连续签到计算
     * @param $fasi
     * @return int
     */
    public function continuousSignCalculation($fasi)
    {
        //todo::连续签到时长计算
        return 0;
    }

    /**
     * 下一次签到积分计算
     * @return int
     */
    public function nextSignCalculation($fasi)
    {
        //下一次签到奖励积分计算（包括今天没签到或今天已签到）
        return 0;
    }

}
