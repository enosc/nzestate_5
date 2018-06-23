<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/14
 * Time: 23:51
 */
return [

    'template'               => [
        // 模板引擎类型 支持 php think 支持扩展
        'type'         => 'Think',
        // 模板路径
        'view_path'    => ROOT_PATH . '/theme/nzestate/pc/',
        // 模板后缀
        'view_suffix'  => 'html',
        // 模板文件名分隔符
        'view_depr'    => DS,
        // 模板引擎普通标签开始标记
        'tpl_begin'    => '{',
        // 模板引擎普通标签结束标记
        'tpl_end'      => '}',
        // 标签库标签开始标记
        'taglib_begin' => '{',
        // 标签库标签结束标记
        'taglib_end'   => '}',
        'taglib_pre_load'  =>  'app\common\taglib\Nze',
    ],
    'view_replace_str'  =>  [
        '__THEME__'    =>  str_replace('/index.php','',\think\Request::instance()->root()) . '/static/theme/nzestate/pc',
        '__STATIC__'    =>  str_replace('/index.php','',\think\Request::instance()->root()) . '/static',
        '__PUBLIC__'    =>  str_replace('/index.php','',\think\Request::instance()->root()),
    ]
];