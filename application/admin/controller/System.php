<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/21
 * Time: 23:12
 */

namespace app\admin\controller;


class System extends BaseAdmin
{

    public function index(){
        /*配置列表*/
        $group_list = [
            'shop_info' => '网站信息',
            'basic'     => '基本设置',
            'sms'       => '短信设置',
            'shopping'  => '购物流程设置',
            'smtp'      => '邮件设置',
            'watermark' => '水印设置',
            'affiliate' => '分销设置',
            'push'      => '推送设置',
            'oss'       => '对象存储',
            'express'	=> '物流设置'
        ];
        $this->assign('group_list',$group_list);
        $inc_type =  input('param.inc_type','shop_info');
        $this->assign('inc_type',$inc_type);
        $config = nzcache($inc_type);
        if($inc_type == 'shop_info'){
            $province = db('region')
                ->where('parent_id',0)
                ->select();
            $city =  db('region')
                ->where('parent_id',$config['province'])
                ->select();
            $area =  db('region')
                ->where('parent_id',$config['city'])
                ->select();
            $this->assign('province',$province);
            $this->assign('city',$city);
            $this->assign('area',$area);
        }
        $this->assign('config',$config);//当前配置项
        //C('TOKEN_ON',false);

        return $this->fetch($inc_type);
    }

    /*
	 * 新增修改配置
	 */
    public function save()
    {
        $param = input('post.');
        $inc_type = $param['inc_type'];
        //unset($param['__hash__']);
        unset($param['inc_type']);
        nzcache($inc_type,$param);

        // 设置短信商接口
        if(isset($param['sms_platform']) && $param['sms_platform'] == 2 &&  !empty($param['sms_appkey'])  && !empty($param['sms_secretKey']))
        {
            $sms_appkey = trim($param['sms_appkey']);
            $sms_secretKey = trim($param['sms_secretKey']);
            $url = 'http://open.1cloudsp.com:8090/api/admin/setParentId?parentId=14257&accesskey='.urlencode($sms_appkey).'&secret='.urlencode($sms_secretKey);
            httpRequest($url);
        }
        $this->success("操作成功",url('System/index',array('inc_type'=>$inc_type)));
    }

    //发送测试邮件
    public function send_email(){
        $param = input('post.');
//		tpCache($param['inc_type'],$param); //注释掉，不注释会出现重复写入数据库
        $res = send_email($param['test_eamil'],'后台测试','测试发送验证码:'.mt_rand(1000,9999));
        exit(json_encode($res));
    }
}