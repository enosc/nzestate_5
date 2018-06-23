<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 12:08
 */

namespace app\common\model;

use think\Db;
use think\Model;

/**
 * Class 用户公共模型
 * @package app\common\model
 */
class User extends Model
{

    /**
     *  获取用户信息
     */
    public function getUserById($id){

        $normal_user = Db::name('user')->where("user_id", $id)->find();
        $oauth_users = Db::name('user_oauth')->where('user_id', $id)->find();
        empty($oauth_users) && $oauth_users = [];
        $user =  array_merge($normal_user,$oauth_users);
        return $user;
    }

    /**
     *  获取用户
     */
    public function getUser($condition, $field = '*'){

        $result = Db::name('user')
            ->field($field)
            ->where($condition)
            ->cache(true, NZESTATE_CACHE_TIME)
            ->order('user_id asc')
            ->find();
        return $result;
    }

    /**
     *  获取用户等级
     */
    /**
     *  获取用户
     */
    public function getUserLevel($id, $field = '*'){

        $result = Db::name('user_level')
            ->field($field)
            ->where('level_id', $id)
            ->cache(true, NZESTATE_CACHE_TIME)
            ->find();
        return $result;
    }

}