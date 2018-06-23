<?php
namespace app\admin\controller;

class Index extends BaseAdmin
{
    public function index()
    {

        return $this->fetch();
    }

    public function welcome(){
        $this->assign('sys_info',$this->get_sys_info());
//    	$today = strtotime("-1 day");
        $today = strtotime(date("Y-m-d"));
        $count['handle_order'] = db('order')
            ->where("order_status=0 and (pay_status=1 or pay_code='cod')")
            ->count();
        $count['new_order'] = db('order')
            ->where("add_time",">=",$today)
            ->count();//今天新增订单
        $count['goods'] =  db('goods')
            ->where("1=1")
            ->count();//商品总数
        $count['article'] =  db('article')
            ->where("1=1")
            ->count();//文章总数
        $count['users'] = db('user')
            ->where("1=1")
            ->count();//会员总数
        $count['today_login'] = db('user')
            ->where("last_login",">=",$today)
            ->count();//今日访问
        $count['new_users'] = db('user')
            ->where("reg_time",">=",$today)
            ->count();//新增会员
        $count['comment'] = db('comment')
            ->where("is_show",0)
            ->count();//最新评论
        $this->assign('count',$count);
        return $this->fetch();
    }

    public function get_sys_info(){
        $sys_info['os']             = PHP_OS;
        $sys_info['zlib']           = function_exists('gzclose') ? 'YES' : 'NO';//zlib
        $sys_info['safe_mode']      = (boolean) ini_get('safe_mode') ? 'YES' : 'NO';//safe_mode = Off
        $sys_info['timezone']       = function_exists("date_default_timezone_get") ? date_default_timezone_get() : "no_timezone";
        $sys_info['curl']			= function_exists('curl_init') ? 'YES' : 'NO';
        $sys_info['web_server']     = $_SERVER['SERVER_SOFTWARE'];
        $sys_info['phpv']           = phpversion();
        $sys_info['ip'] 			= GetHostByName($_SERVER['SERVER_NAME']);
        $sys_info['fileupload']     = @ini_get('file_uploads') ? ini_get('upload_max_filesize') :'unknown';
        $sys_info['max_ex_time'] 	= @ini_get("max_execution_time").'s'; //脚本最大执行时间
        $sys_info['set_time_limit'] = function_exists("set_time_limit") ? true : false;
        $sys_info['domain'] 		= $_SERVER['HTTP_HOST'];
        $sys_info['memory_limit']   = ini_get('memory_limit');
        $sys_info['version']   	    = file_get_contents(APP_PATH.'version.php');
        $mysqlinfo = db()->query("SELECT VERSION() as version");
        $sys_info['mysql_version']  = $mysqlinfo[0]['version'];
        if(function_exists("gd_info")){
            $gd = gd_info();
            $sys_info['gdinfo'] 	= $gd['GD Version'];
        }else {
            $sys_info['gdinfo'] 	= "未知";
        }
        return $sys_info;
    }
}
