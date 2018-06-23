<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 11:56
 */

namespace app\common\controller;

/**
 * Class 用户基础控制器
 * @package app\common\controller
 */
class BaseUser extends Base
{

    public function _initialize() {
        parent::_initialize();
        $this->template_dir = 'user/'.  strtolower(request()->controller()).'/';
    }
}