<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 13:27
 */

namespace app\common\model;

use think\Db;
use think\Model;

/**
 * Class 获取插件
 * @package app\common\model
 */
class Plugin extends Model
{

    public function getPluginByType($type = 'login'){

        $plugin = Db::name('plugin')
            ->where(['status' => 1, 'type' => $type])
            ->cache(true,NZESTATE_CACHE_TIME)
            ->select();
        $rs = [];
        foreach( $plugin as $key => $value ){
            $rs[$value['code']] = $value;
        }
        return $rs;
    }
}