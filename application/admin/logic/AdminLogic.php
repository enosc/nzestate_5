<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/18
 * Time: 20:54
 */

namespace app\admin\logic;


use think\Db;

class AdminLogic
{

    public function login($username, $password){
        if (empty($username) || empty($password)) {
            return ['status' => 0, 'msg' => '请填写账号密码'];
        }

        //Saas::instance()->ssoAdmin($username, $password);

        $condition['a.admin_name'] = $username;
        //$condition['a.password'] = encrypt($password);
        $condition['a.password'] = md5('TPSHOP'.$password);
        $admin = Db::name('admin')
            ->alias('a')
            ->join('__ADMIN_ROLE__ ar', 'a.role_id=ar.role_id')
            ->where($condition)->find();

        if (!$admin) {
            return ['status' => 0, 'msg' => '账号密码不正确'];
        }

        $this->handleLogin($admin, $admin['act_list']);

        $url = session('from_url') ? session('from_url') : url('admin/index/index');
        return ['status' => 1, 'url' => $url];
    }

    public function handleLogin($admin, $actList)
    {
        Db::name('admin')
            ->where('admin_id', $admin['admin_id'])
            ->update([
            'last_login' => time(),
            'last_ip' => request()->ip()
        ]);

        //$this->sessionRolePrivilege($admin, $actList);

        $admin['act_list'] = $actList;
        session('ADMIN', $admin);

        /*session('act_list', $actList);
        session('admin_id', $admin['admin_id']);
        session('last_login_time', $admin['last_login']);
        session('last_login_ip', $admin['last_ip']);*/

        saveAdminLog('后台登录');
    }

    /*public function sessionRolePrivilege($admin, $actList)
    {
        if (Saas::instance()->isNormalUser()) {
            $roleRights = Saas::instance()->getRoleRights($actList);
        } else {
            $roleRights = $actList;
        }

        session('act_list', $roleRights);
    }*/

    public function logout()
    {
        /*session_unset();
        session_destroy();
        Session::clear();*/

        session('ADMIN', null);

        //Saas::instance()->handleLogout($adminId);
    }

}