<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 11:56
 */

namespace app\user\controller;
use app\common\controller\BaseUser;
use app\common\logic\CartLogic;
use app\common\logic\MessageLogic;
use app\common\logic\UserLogic;
use app\common\model\Plugin;
use app\common\model\User;
use think\Request;
use think\Session;

/**
 * Class 用户登录控制器
 * @package app\user\controller
 */
class Login extends BaseUser
{
    public $user_id = 0;
    public $user = [];

    public function _initialize() {
        parent::_initialize();

        $user = session("USER");
        if(!empty($user) && $user['user_id']!=''){

            $user_model = new User();
            $user =  $user_model->getUserById($user['user_id']);
            session('USER',$user);  //覆盖session 中的 user
            $this->user = $user;
            $this->user_id = $user['user_id'];
            $this->assign('user',$user); //存储用户信息
            $this->assign('user_id',$this->user_id);
            //获取用户信息的数量
            $messageLogic = new MessageLogic();
            $user_message_count = $messageLogic->getUserMessageCount();
            $this->assign('user_message_count', $user_message_count);

        }else{
            $nologin = array(
                'login','pop_login','do_login','logout','verify','set_pwd','finished',
                'verifyHandle','register','send_sms_reg_code','identity','check_validate_code',
                'forget_pwd', 'check_captcha', 'check_username', 'send_validate_code','bind_account','bind_guide','bind_reg',
            );
            $action = request()->action();
            if(!in_array($action,$nologin)){
                $this->redirect('user/login/login');
                exit;
            }
        }
    }

    /**
     *  登录
     */
    public function login(){
        if($this->user_id > 0){
            $this->redirect('user/dashboard/index');
        }
        $plugin_model = new Plugin();
        $partner_login = $plugin_model->getPluginByType('login');
        $redirect_url = Session::get('redirect_url');
        $referurl = $redirect_url ? $redirect_url : url("user/dashboard/index");
        $this->assign('referurl',$referurl);
        $this->assign('partner_login',$partner_login);
        return $this->fetch($this->template_dir . 'login');
    }

    public function do_login(){
        $username = trim(input('post.user_name'));
        $password = trim(input('post.user_password'));
        $verify_code = input('post.verify_code');

        //if (!$verify->check($verify_code,'user_login'))
        if(!check_verify_code($verify_code))
        {
            $res = array('status'=>0,'msg'=>'验证码错误');
            exit(json_encode($res));
        }

        $logic = new \app\common\logic\UserLogic();
        $res = $logic->login($username,$password);

        
        if($res['status'] == 1){
            $res['url'] =  htmlspecialchars_decode(input('post.referurl'));
            session('USER',$res['result']);
            setcookie('user_id',$res['result']['user_id'],null,'/');
            setcookie('is_affiliate',$res['result']['is_affiliate'],null,'/');
            $user_nickname = empty($res['result']['user_nickname']) ? $username : $res['result']['user_nickname'];
            setcookie('user_name',urlencode($user_nickname),null,'/');
            setcookie('cn',0,time()-3600,'/');
            $cartLogic = new CartLogic();
            $cartLogic->setUserId($res['result']['user_id']);
            $cartLogic->doUserLoginHandle();// 用户登录后 需要对购物车 一些操作
            $orderLogic = new \app\common\logic\OrderLogic();
            $orderLogic->setUserId($res['result']['user_id']); //登录后将超时未支付订单给取消掉
            $orderLogic->autoCancelOrder(); //autoCancelOrder()

        }

        exit(json_encode($res));
    }

    public function logout(){
        setcookie('user_name','',time()-3600,'/');
        setcookie('zh-cn','',time()-3600,'/');
        setcookie('user_id','',time()-3600,'/');
        setcookie('PHPSESSID','',time()-3600,'/');
        session_unset();
        session_destroy();
        //$this->success("退出成功",U('Home/Index/index'));
        $this->redirect('index/Index/index');
        exit;
    }

    /**
     *  注册
     */
    public function register(){
        if($this->user_id > 0){
            $this->redirect('user/dashboard/index');
        }
        $reg_sms_enable = nzcache('sms.regist_sms_enable');
        $reg_smtp_enable = nzcache('smtp.regist_smtp_enable');
        if(request()->isPost()){
            $logic = new UserLogic();
            //验证码检验
//            $this->verifyHandle('user_reg');
            $username       = input('post.user_name','');
            $password       = input('post.user_password','');
            $confirm_password      = input('post.confirm_password','');
            $verify_code    = input('post.verify_code','');
            $email_code     = input('post.email_code','');
            $mobile_code    = input('post.mobile_code','');
            $scene          = input('post.send_scene', 1);
            $session_id     = session_id();
            if(check_mobile($username)){
                if($reg_sms_enable){   //是否开启注册验证码机制
                    //手机功能没关闭
                    $check_code = $logic->check_validate_code($mobile_code, $username, 'phone', $session_id, $scene);
                    if($check_code['status'] != 1){
                        $this->ajaxReturn($check_code);
                    }
                }
            }
            if(check_email($username)){
                if($reg_smtp_enable){        //是否开启注册邮箱验证码机制
                    //邮件功能未关闭
                    $check_code = $logic->check_validate_code($email_code, $username);
                    if($check_code['status'] != 1){
                        $this->ajaxReturn($check_code);
                    }
                }
            }

            if(!check_verify_code($verify_code)){
                $this->ajaxReturn(['status'=>-1,'msg'=>'图像验证码错误']);
            };


            $invite_name = input('invite','');

            if(!empty($invite_name)){
                if(check_email($invite_name)){
                    $invite = get_user_info($invite_name,1);//根据邮箱查找邀请人
                }elseif(check_mobile($invite_name)){
                    $invite = get_user_info($invite_name,2);//根据手机号查找邀请人
                }
                if(empty($invite)){
                    return array('status'=>-1,'msg'=>'推荐人不存在');
                }
            }

            $data = $logic->regist($username,$password,$confirm_password,0,$invite);
            if($data['status'] != 1){
                $this->ajaxReturn($data);
            }
            session('USER',$data['result']);
            setcookie('user_id',$data['result']['user_id'],null,'/');
            setcookie('is_affiliate',$data['result']['is_affiliate'],null,'/');
            $user_nickname = empty($data['result']['user_user_nickname']) ? $username : $data['result']['user_user_nickname'];
            setcookie('user_name',$user_nickname,null,'/');
            $cartLogic = new CartLogic();
            $cartLogic->setUserId($data['result']['user_id']);
            $cartLogic->doUserLoginHandle();// 用户登录后 需要对购物车 一些操作
            $this->ajaxReturn($data);
            exit;
        }

        $this->assign('regist_sms_enable',$reg_sms_enable); // 注册启用短信：
        $this->assign('regist_smtp_enable',$reg_smtp_enable); // 注册启用邮箱：
        $sms_time_out = nzcache('sms.sms_time_out') > 0 ? nzcache('sms.sms_time_out') : 120;
        $this->assign('sms_time_out', $sms_time_out); // 手机短信超时时间
        return $this->fetch($this->template_dir . 'register');
    }

}