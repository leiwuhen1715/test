<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------

namespace app\user\controller;

use cmf\controller\AdminBaseController;
use EasyWeChat\Factory;
use think\Db;


class AdminForwardController extends AdminBaseController
{


    public function index()
    {

        $where   = [
        	'r.order_type' => 1
        ];
        $request = input('request.');

        if (!empty($request['uid'])) {
            $where['u.id'] = intval($request['uid']);
        }
       if (isset($request['status']) && $request['status'] != '-1') {
            $where['r.pay_status'] = intval($request['status']);
        }
        $join = [
            ['__USER__ u', 'r.user_id = u.id','left']
        ];
        $field = 'r.*,u.user_login,u.mobile,u.user_nickname,u.user_email';
        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['u.user_login|u.user_nickname|u.user_email|u.mobile']    = ['like', "%$keyword%"];
        }
        

        $list = Db::name('recharge_order')->alias('r')->field($field)->join($join)->whereOr($keywordComplex)->where($where)->order("r.id DESC")->paginate(10);
        // 获取分页显示
        $list->appends($request);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }

    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');
        $join = [
            ['__USER__ u', 'r.user_id = u.id','left']
        ];
        
        $post     = Db::name('recharge_order')->alias('r')->field('r.*,u.user_login,u.mobile,u.user_nickname,u.user_email')->join($join)->where('r.id', $id)->find();

        $this->assign('post', $post);

        return $this->fetch();
    }

    /**
     * 编辑文章提交
     * @adminMenu(
     *     'name'   => '编辑文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {

        if ($this->request->isPost()) {
            $id = $this->request->param('id', 0, 'intval');
            $status = $this->request->param('pay_status', 0, 'intval');

            $transStatu=0;
            Db::startTrans(); //开启事务
            try {
                $recharge=DB::name('recharge_order')->field('pay_status,user_id,order_amount')->where(['id'=>$id,'order_type'=>1])->find();
                if($recharge){
                    if($recharge['pay_status']==0){
                        if($status==1){

                            DB::name('recharge_order')->where("id",$id)->update(['pay_status'=>1,'pay_time'=>time()]);
                            $transStatu=1;
                            
                            Db::commit();
                            
                            $transStatu=1;
                        }elseif($status==2){

                            log_coin_change($recharge['user_id'], '提现驳回',$recharge['order_amount']*100);
                            DB::name('recharge_order')->where("id",$id)->update(['pay_status'=>2]);
                            $transStatu=1;
                            Db::commit();
                        }else{
                            $transStatu=2;
                        }

                    }else{

                        throw new \Exception('提现已处理！');
                    }

                }else{
                    throw new \Exception('提现不存在！');
                }


            } catch (\Exception $e) {
                $Message= $e->getMessage();
                // 回滚事务
                Db::rollback();
            }
            if($transStatu==1){
                $this->success('处理成功！');
            }elseif($transStatu==2){
                $this->error('未处理！');
            }else{
                $this->error($Message);
            }

        }
    }

}
