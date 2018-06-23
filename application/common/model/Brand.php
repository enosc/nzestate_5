<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/14
 * Time: 17:38
 */

namespace app\common\model;
use think\Db;
use think\Model;

/**
 * Class 品牌
 * @package app\common\model
 */

class Brand extends Model
{

    public function getBrandList($condition, $field = '*') {
        $result = Db::name('brand')
            ->field($field)
            ->where($condition)
            ->cache(true, NZESTATE_CACHE_TIME)
            ->order('sort_order asc')
            ->select();
        return $result;
    }
}