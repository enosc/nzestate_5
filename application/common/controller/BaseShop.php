<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/16
 * Time: 22:09
 */

namespace app\common\controller;


class BaseShop extends Base
{

    public function _initialize() {

        parent::_initialize();
        $this->template_dir = 'shop/'.  strtolower(request()->controller()).'/';
    }
}