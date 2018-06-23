<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/14
 * Time: 23:36
 */

$http = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] && $_SERVER['HTTPS'] != 'off') ? 'https' : 'http';
define('SITE_URL',$http.'://'.$_SERVER['HTTP_HOST']);

define('NZESTATE_CACHE_TIME',1);

define('AUTH_CODE','NZESTATE'); //用于加密解密密码

if(!defined('UPLOAD_PATH')){
    define('UPLOAD_PATH','upload/');
}

