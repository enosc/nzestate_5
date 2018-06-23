<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/18
 * Time: 20:48
 */

namespace app\admin\controller;


use app\admin\logic\AdminLogic;

class Admin extends BaseAdmin
{


    /**
     * 管理员登陆
     */
    public function login()
    {
        if (request()->isPost()) {
            $code = input('post.vertify_code');
            $username = input('post.user_name','');
            $password = input('post.user_password','');

            if (check_verify_code($code)) {
                $this->ajaxReturn(['status' => 0, 'msg' => '验证码错误']);
            }

            $adminLogic = new AdminLogic();
            $return = $adminLogic->login($username, $password);
            $this->ajaxReturn($return);
        }

        if (session('?ADMIN') && session('ADMIN.admin_id') > 0) {
            //$this->error("您已登录", U('admin/index/index'));
            $this->redirect(url('admin/index/index'));
        }

        $this->assign('login_banner', get_ad(999));
        return $this->fetch();
    }

    /**
     * 退出登陆
     */
    public function logout()
    {
        $adminLogic = new AdminLogic;
        $adminLogic->logout();

        $this->success("退出成功",url('admin/admin/login'));
    }
}