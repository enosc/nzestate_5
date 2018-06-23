<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/18
 * Time: 20:13
 */
return [

    'view_replace_str'  =>  [
        '__STATIC__'    =>  str_replace('/index.php','',\think\Request::instance()->root()) . '/static',
        '__ROOT__'    =>  str_replace('/index.php','',\think\Request::instance()->root()),
    ]
];