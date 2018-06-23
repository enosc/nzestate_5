<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use think\Db;

require_once __DIR__ . '/common_global.php';
require_once __DIR__ . '/function.php';
require_once __DIR__ . '/function_goods.php';

/**
 * 获取商品一二三级分类
 * @return array
 */
function get_goods_category_tree(){
    $tree = $arr = $result = array();

    $category_model = new \app\common\model\GoodsCategory();
    $cat_list = $category_model->getGoodsCatList(['is_show' => 1]);

    if($cat_list){
        foreach ($cat_list as $val){
            if($val['cat_level'] == 2){
                $arr[$val['parent_id']][] = $val;
            }
            if($val['cat_level'] == 3){
                $crr[$val['parent_id']][] = $val;
            }
            if($val['cat_level'] == 1){
                $tree[] = $val;
            }
        }

        foreach ($arr as $k=>$v){
            foreach ($v as $kk=>$vv){
                $arr[$k][$kk]['sub_menu'] = empty($crr[$vv['cat_id']]) ? array() : $crr[$vv['cat_id']];
            }
        }

        foreach ($tree as $val){
            $val['tmenu'] = empty($arr[$val['cat_id']]) ? array() : $arr[$val['cat_id']];
            $result[$val['cat_id']] = $val;
        }
    }
    return $result;
}

/**
 * 获取缓存或者更新缓存
 * @param string $config_key 缓存文件名称
 * @param array $data 缓存数据  array('k1'=>'v1','k2'=>'v3')
 * @return array or string or bool
 */
function nzcache($config_key,$data = array()){
    $param = explode('.', $config_key);
    if(empty($data)){
        //如$config_key=shop_info则获取网站信息数组
        //如$config_key=shop_info.logo则获取网站logo字符串
        //$config = F($param[0],'', Env::get('runtime_path'). 'temp/');//直接获取缓存文件
        $config = cache($param[0]);//直接获取缓存文件
        if(empty($config)){
            //缓存文件不存在就读取数据库
            $res = Db::name('config')->where("inc_type", $param[0])->select();
            if($res){
                foreach($res as $k=>$val){
                    $config[$val['config_key']] = $val['config_value'];
                }
                cache($param[0],$config,NZESTATE_CACHE_TIME);
                //F($param[0],$config,Env::get('runtime_path'). 'temp/');
            }
        }
        if(count($param) > 1){
            return $config[$param[1]];
        }else{
            return $config;
        }
    }else{
        //更新缓存
        $result =  Db::name('config')->where("inc_type", $param[0])->select();
        if($result){
            foreach($result as $val){
                $temp[$val['config_key']] = $val['config_value'];
            }
            foreach ($data as $k=>$v){
                $newArr = [ 'config_key'=>$k,'config_value'=>trim($v),'inc_type'=>$param[0] ];
                if(!isset($temp[$k])){
                    Db::name('config')->insert($newArr);//新key数据插入数据库
                }else{
                    //缓存key存在且值有变更新此项
                    if($v != $temp[$k])
                        Db::name('config')->where("config_key", $k)->update($newArr);
                }
            }
            //更新后的数据库记录
            $newRes = Db::name('config')->where("inc_type", $param[0])->select();
            foreach ($newRes as $rs){
                $newData[$rs['config_key']] = $rs['config_value'];
            }
        }else{
            foreach($data as $k=>$v){
                $newArr[] = array('config_key'=>$k,'config_value'=>trim($v),'inc_type'=>$param[0]);
            }
            Db::name('config')->insertAll($newArr);
            $newData = $data;
        }
        return cache($param[0],$newData,NZESTATE_CACHE_TIME);
    }
}

/**
 * 生成验证码
 */
function get_verify_code(){
    ob_clean();
    $Verify = new \verify\Verify();
    $Verify->length = 4;
    $Verify->entry();
}
/**
 * 核对验证码
 */
function check_verify_code($code){
    $verify = new \verify\Verify();
    return $verify->check($code);
}

/**
 * 检测是否能够发送短信
 * @param int $scene
 * @return array number string
 */
function checkEnableSendSms($scene)
{

    $scenes = config('SEND_SCENE');
    $sceneItem = $scenes[$scene];
    if (!$sceneItem) {
        return ["status" => -1, "msg" => "场景参数'send_scene'错误!"];
    }
    $key = $sceneItem[2];
    $sceneName = $sceneItem[0];
    $config = nzcache('sms');
    $smsEnable = $config[$key];

    if (!$smsEnable) {
        return ["status" => -1, "msg" => "['$sceneName']发送短信被关闭'"];
    }
    //判断是否添加"注册模板"
    $size = Db::name('sms_template')
        ->where("send_scene", $scene)
        ->count('template_id');
    if (!$size) {
        return ["status" => -1, "msg" => "请先添加['$sceneName']短信模板"];
    }

    return ["status"=>1,"msg"=>"可以发送短信"];
}

/**
 * 邮件发送
 * @param $to    接收人
 * @param string $subject   邮件标题
 * @param string $content   邮件内容(html模板渲染后的内容)
 * @throws Exception
 * @throws phpmailerException
 */
function send_email($to,$subject='',$content=''){
    vendor('phpmailer.PHPMailerAutoload'); ////require_once vendor/phpmailer/PHPMailerAutoload.php';
    //判断openssl是否开启
    $openssl_funcs = get_extension_funcs('openssl');
    if(!$openssl_funcs){
        return array('status'=>-1 , 'msg'=>'请先开启openssl扩展');
    }
    $mail = new PHPMailer();
    $config = nzcache('smtp');
    $mail->CharSet  = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
    $mail->isSMTP();
    //Enable SMTP debugging
    // 0 = off (for production use)
    // 1 = client messages
    // 2 = client and server messages
    $mail->SMTPDebug = 0;
    //调试输出格式
    //$mail->Debugoutput = 'html';
    //smtp服务器
    $mail->Host = $config['smtp_server'];
    //端口 - likely to be 25, 465 or 587
    $mail->Port = $config['smtp_port'];

    if($mail->Port == 465) $mail->SMTPSecure = 'ssl';// 使用安全协议
    //Whether to use SMTP authentication
    $mail->SMTPAuth = true;
    //用户名
    $mail->Username = $config['smtp_user'];
    //密码
    $mail->Password = $config['smtp_pwd'];

    //Set who the message is to be sent from
    $mail->setFrom($config['smtp_user']);

    //回复地址
    //$mail->addReplyTo('replyto@example.com', 'First Last');
    //接收邮件方
    if(is_array($to)){
        foreach ($to as $v){
            $mail->addAddress($v);
        }
    }else{
        $mail->addAddress($to);
    }

    $mail->isHTML(true);// send as HTML
    //标题
    $mail->Subject = $subject;
    //HTML内容转换
    $mail->msgHTML($content);
    //Replace the plain text body with one created manually
    //$mail->AltBody = 'This is a plain-text message body';
    //添加附件
    //$mail->addAttachment('images/phpmailer_mini.png');
    //send the message, check for errors
    error_log(print_r($mail,true));
    if (!$mail->send()) {
        return array('status'=>-1 , 'msg'=>'发送失败: '.$mail->ErrorInfo);
    } else {
        return array('status'=>1 , 'msg'=>'发送成功');
    }
}

/**
 * 获取用户信息
 * @param $user_value  用户id 邮箱 手机 第三方id
 * @param int $type  类型 0 user_id查找 1 邮箱查找 2 手机查找 3 第三方唯一标识查找
 * @param string $oauth  第三方来源
 * @return mixed
 */
function get_user_info($user_value, $type = 0, $oauth = '')
{
    $map = [];
    if ($type == 0) {
        $map['user_id'] = $user_value;
    } elseif ($type == 1) {
        $map['user_email'] = $user_value;
    } elseif ($type == 2) {
        $map['user_mobile'] = $user_value;
    } elseif ($type == 3) {
        $thirdUser = Db::name('oauth_user')
            ->where(['openid' => $user_value, 'oauth' => $oauth])
            ->find();
        $map['user_id'] = $thirdUser['user_id'];
    } elseif ($type == 4) {
        $thirdUser = Db::name('oauth_user')
            ->where(['unionid' => $user_value])
            ->find();
        $map['user_id'] = $thirdUser['user_id'];
    }

    return Db::name('user')->where($map)->find();
}

/**
 * 获取用户信息
 * @param int $position_id  广告位置
 * @return array
 */
function get_ad($position_id, $limit = 5, $enabled = 1)
{
    $map['ap.position_id']   = $position_id;
    $map['a.is_enabled']     = $enabled;
    $map['a.start_time']     = ['<',strtotime(date('Y-m-d H:00:00'))];
    $map['a.end_time']       = ['>',strtotime(date('Y-m-d H:00:00'))];
    $result = Db::name('ad_position')
        ->alias('ap')
        ->join('ad a','a.position_id = ap.position_id')
        ->where($map)
        ->cache(true,NZESTATE_CACHE_TIME)
        ->order('sort_order DESC')
        ->limit($limit)
        ->select();

    return $result;
}

/**
 * 记录帐户变动
 * @param   int     $user_id        用户id
 * @param   float   $user_money     可用余额变动
 * @param   int     $pay_points     消费积分变动
 * @param   string  $desc    变动说明
 * @param   float   distribut_money 分佣金额
 * @param int $order_id 订单id
 * @param string $order_sn 订单sn
 * @return  bool
 */
function saveUserLog($user_id, $user_money = 0,$pay_points = 0, $desc = '',$commission_money = 0,$order_id = 0 ,$order_sn = ''){
    /* 插入帐户变动记录 */
    $log_arr = array(
        'user_id'       => $user_id,
        'user_money'    => $user_money,
        'pay_points'    => $pay_points,
        'update_time'   => time(),
        'log_desc'      => $desc,
        'order_id'      => $order_id,
        'order_sn'      => $order_sn
    );
    /* 更新用户信息 */
    $update_data = [
        'user_money'        => Db::raw('user_money+'.$user_money),
        'pay_points'        => Db::raw('pay_points+'.$pay_points),
        'commission_money'  => Db::raw('commission_money+'.$commission_money),
        /*'pay_points'        => ['exp','pay_points+'.$pay_points],
        'distribut_money'   => ['exp','distribut_money+'.$distribut_money],*/
    ];
    if(($user_money+$pay_points+$commission_money) == 0)
        return false;

    $update = Db::name('user')
        ->where('user_id',$user_id)
        ->update($update_data);
    if($update){
        db('user_log')->insert($log_arr);
        return true;
    }else{
        return false;
    }
}

/**
 * 商品库存操作日志
 * @param int $user_id 操作 用户ID
 * @param int $stock 更改库存数
 * @param array $goods 库存商品
 * @param string $order_sn 订单编号
 */
function saveStockLog($user_id, $stock = 1, $goods, $order_sn = '')
{
    $data['add_time']   = time();
    $data['stock']      = $stock;
    $data['user_id']    = $user_id;
    $data['goods_id']   = $goods['goods_id'];
    $data['goods_name'] = $goods['goods_name'];
    $data['goods_spec'] = empty($goods['spec_key_name']) ? $goods['key_name'] : $goods['spec_key_name'];
    $data['order_sn'] = $order_sn;
    db('stock_log')->insert($data);
}

/**
 * 读取缓存信息
 *
 * @param string $key 要取得缓存键
 * @param string $prefix 键值前缀
 * @return array/bool
 */
function read_cache($key = null, $prefix = '')
{
    if ($key === null || !config('cache_open'))
        return array();
    if (!empty($prefix)) {
        $name = $prefix . $key;
    }
    else {
        $name = $key;
    }
    $cache_info = cache($name);
    //如果name值不存在，则默认返回 false。
    return $cache_info;
}

/**
 * 写入缓存
 *
 * @param string $key 缓存键值
 * @param array $data 缓存数据
 * @param string $prefix 键值前缀
 * @param int $expire 缓存周期  单位分，0为永久缓存
 * @return bool 返回值
 */
function write_cache($key = null, $data = array(), $prefix='', $expire = 3600)
{
    if ($key === null || !config('cache_open') || !is_array($data))
        return false;

    if (!empty($prefix)) {
        $name = $prefix . $key;
    }
    else {
        $name = $key;
    }
    $cache_info = cache($name, $data, $expire);
    //如果设置成功返回true，否则返回false。
    return $cache_info;
}

/**
 * 删除缓存
 * @param string $key 缓存键值
 * @param string $prefix 键值前缀
 * @return boolean
 */
function delete_cache($key = null, $prefix = '')
{
    if ($key === null || !config('cache_open'))
        return true;
    if (!empty($prefix)) {
        $name = $prefix . $key;
    }
    else {
        $name = $key;
    }
    return cache($name, NULL);
}