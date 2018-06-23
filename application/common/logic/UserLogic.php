<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 17:08
 */

namespace app\common\logic;

use think\Db;
use think\Model;

/**
 * Class 用户业务逻辑处理
 * @package app\common\logic
 */
class UserLogic extends Model
{
    protected $user_id=0;

    /**
     * 设置用户ID
     * @param $user_id
     */
    public function setUserId($user_id)
    {
        $this->user_id = $user_id;
    }

    /*
     * 登陆
     */
    public function login($username,$password)
    {
        if (!$username || !$password) {
            return array('status' => 0, 'msg' => '请填写账号或密码');
        }

        $user_model = new \app\common\model\User();
        $user = $user_model->getUser('user_email = "' . $username . '" or user_mobile = "' . $username . '"');
        //$user = Db::name('user')->where("user_mobile", $username)->whereOr('user_email', $username)->find();

        if (!($user['user_id'] > 0)) {
            $result = array('status' => -1, 'msg' => '账号不存在!');
        } elseif (encrypt($password) != $user['user_password']) {
            $result = array('status' => -2, 'msg' => '密码错误!');
        } elseif ($user['is_lock'] == 1) {
            $result = array('status' => -3, 'msg' => '账号异常已被锁定！！！');
        } else {
            //查询用户信息之后, 查询用户的等级
            $level = $user_model->getUserLevel($user['user_level']);
            $user['level_name'] = $level['level_name'];
            $result = ['status' => 1, 'msg' => '登陆成功', 'result' => $user];
        }

        return $result;
    }

    /**
     * 注册
     * @param string number $username  邮箱或手机
     * @param $password  密码
     * @param $confirm_password 确认密码
     * @return array
     */
    public function regist($username,$password,$confirm_password,$push_id = 0,$invite=[],$nickname="",$uesr_avatar=""){
        $is_validated = 0 ;
        if(check_email($username)){
            $is_validated = 1;
            $map['email_validated'] = 1;
            $map['user_nickname'] = $map['user_email'] = $username; //邮箱注册
        }

        if(check_mobile($username)){
            $is_validated = 1;
            $map['mobile_validated'] = 1;
            $map['user_nickname'] = $map['user_mobile'] = $username; //手机注册
        }

        if(!empty($nickname)){
            $map['user_nickname'] = $nickname;
        }

        if(!empty($uesr_avatar)){
            $map['user_avatar'] = $uesr_avatar;
        }else{
            $map['user_avatar']='/static/images/user/default_user_avatar.gif';
        }

        if($is_validated != 1)
            return array('status'=>-1,'msg'=>'请用手机号或邮箱注册','result'=>'');

        if(!$username || !$password)
            return array('status'=>-1,'msg'=>'请输入用户名或密码','result'=>'');

        //验证两次密码是否匹配
        if($confirm_password != $password)
            return array('status'=>-1,'msg'=>'两次输入密码不一致','result'=>'');
        //验证是否存在用户名
        if(get_user_info($username,1) || get_user_info($username,2))
            return array('status'=>-1,'msg'=>'账号已存在','result'=>'');

        $map['user_password'] = encrypt($password);
        $map['reg_time'] = time();

        if(is_array($invite) && !empty($invite)){
            $map['first_leader'] = $invite['user_id'];
            $map['second_leader'] = $invite['first_leader'];
            $map['third_leader'] = $invite['second_leader'];
        }

        //$map['first_leader'] = cookie('first_leader');  //推荐人id
        // 如果找到他老爸还要找他爷爷他祖父等
        if($map['first_leader']) {
            $first_leader = Db::name('user')
                ->where("user_id", $map['first_leader'])
                ->find();
            $map['second_leader'] = $first_leader['first_leader'];
            $map['third_leader'] = $first_leader['second_leader'];
            //他上线分销的下线人数要加1
            Db::name('user')->where('user_id', $map['first_leader'])->setInc('affiliate_num');
            Db::name('user')->where('user_id', $map['second_leader'])->setInc('affiliate_num');
            Db::name('user')->where('user_id', $map['third_leader'])->setInc('affiliate_num');
        }else{
            $map['first_leader'] = 0;
        }

        /*  else if(tpCache('basic.invite') ==1 && empty($invite)){
		    return array('status'=>-1,'msg'=>'请填写正确的推荐人手机号');
		} */

        // 成为分销商条件
        $affiliate_condition = nzcache('affiliate.condition');
        if($affiliate_condition == 0)  // 直接成为分销商, 每个人都可以做分销
            $map['is_affiliate']  = 1;

        $map['push_id'] = $push_id; //推送id
        $map['token'] = md5(time().mt_rand(1,999999999));
        $map['last_login'] = time();
        $user_level =Db::name('user_level')->where('amount = 0')->find(); //折扣
        $map['user_discount'] = !empty($user_level) ? $user_level['user_discount']/100 : 1;  //新注册的会员都不打折
        $user_id = Model('User')->insertGetId($map);
        if($user_id === false)
            return ['status'=>-1,'msg'=>'注册失败'];

        $pay_points = nzcache('basic.reg_integral'); // 会员注册赠送积分
        if($pay_points > 0){
            saveUserLog($user_id, 0, $pay_points, '会员注册赠送积分'); // 记录日志流水
        }
        $user = Db::name('user')
            ->where("user_id", $user_id)
            ->find();
        return array('status'=>1,'msg'=>'注册成功','result'=>$user);
    }

    /**
     * 发送验证码: 该方法只用来发送邮件验证码, 短信验证码不再走该方法
     * @param unknow $sender 接收人
     * @param string $type 发送类型
     * @return array
     */
    public function send_email_code($sender){
        $sms_time_out = nzcache('sms.sms_time_out');
        $sms_time_out = $sms_time_out ? $sms_time_out : 180;
        //获取上一次的发送时间
        $send = session('validate_code');
        if(!empty($send) && $send['time'] > time() && $send['sender'] == $sender){
            //在有效期范围内 相同号码不再发送
            $res = array('status'=>-1,'msg'=>'规定时间内,不要重复发送验证码');
            return $res;
        }
        $code =  mt_rand(1000,9999);
        //检查是否邮箱格式
        if(!check_email($sender)){
            $res = array('status'=>-1,'msg'=>'邮箱码格式有误');
            return $res;
        }
        $send = send_email($sender,'验证码','您好，你的验证码是：'.$code);
        if($send['status'] == 1){
            $info['code'] = $code;
            $info['sender'] = $sender;
            $info['is_check'] = 0;
            $info['time'] = time() + $sms_time_out; //有效验证时间
            session('validate_code',$info);
            $res = array('status'=>1,'msg'=>'验证码已发送，请注意查收');
        }else{
            $res = $send;
        }
        return $res;
    }
    /**
     * 检查短信/邮件验证码验证码
     * @param int $code
     * @param unknown $sender
     * @param int $session_id
     * @return array number string
     */
    public function check_validate_code($code, $sender, $type ='email', $session_id=0 ,$scene = -1){

        $timeOut = time();
        $inValid = true;  //验证码失效

        //短信发送否开启
        //-1:用户没有发送短信
        //空:发送验证码关闭
        $sms_status = checkEnableSendSms($scene);

        //邮件证码是否开启
        $reg_smtp_enable = nzcache('smtp.regist_smtp_enable');

        if($type == 'email'){
            if(!$reg_smtp_enable){//发生邮件功能关闭
                $validate_code = session('validate_code');
                $validate_code['sender'] = $sender;
                $validate_code['is_check'] = 1;//标示验证通过
                session('validate_code',$validate_code);
                return ['status'=>1,'msg'=>'邮件验证码功能关闭, 无需校验验证码'];
            }
            if(!$code)return array('status'=>-1,'msg'=>'请输入邮件验证码');
            //邮件
            $data = session('validate_code');
            $timeOut = $data['time'];
            if($data['code'] != $code || $data['sender']!=$sender){
                $inValid = false;
            }
        }else{
            if($scene == -1){
                return array('status'=>-1,'msg'=>'参数错误, 请传递合理的scene参数');
            }elseif($sms_status['status'] == 0){
                $data['sender'] = $sender;
                $data['is_check'] = 1; //标示验证通过
                session('validate_code',$data);
                return array('status'=>1,'msg'=>'短信验证码功能关闭, 无需校验验证码');
            }

            if(!$code)return array('status'=>-1,'msg'=>'请输入短信验证码');
            //短信
            $sms_time_out = nzcache('sms.sms_time_out');
            $sms_time_out = $sms_time_out ? $sms_time_out : 180;
            $data = Db::name('sms_log')
                ->where(array('mobile'=>$sender,'session_id'=>$session_id , 'status'=>1))
                ->order('log_id DESC')->find();
            //file_put_contents('./test.log', json_encode(['mobile'=>$sender,'session_id'=>$session_id, 'data' => $data]));
            if(is_array($data) && $data['code'] == $code){
                $data['sender'] = $sender;
                $timeOut = $data['add_time']+ $sms_time_out;
            }else{
                $inValid = false;
            }
        }

        if(empty($data)){
            $res = array('status'=>-1,'msg'=>'请先获取验证码');
        }elseif($timeOut < time()){
            $res = array('status'=>-1,'msg'=>'验证码已超时失效');
        }elseif(!$inValid)
        {
            $res = array('status'=>-1,'msg'=>'验证失败,验证码有误');
        }else{
            $data['is_check'] = 1; //标示验证通过
            session('validate_code',$data);
            $res = array('status'=>1,'msg'=>'验证成功');
        }
        return $res;
    }


}