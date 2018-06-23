<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/14
 * Time: 17:29
 */

namespace app\common\model;
use think\Db;
use think\Model;

/**
 * Class 商品分类
 * @package app\common\model
 */

class GoodsCategory extends Model
{

    /**
     * 类别列表
     *
     * @param  array    $condition 检索条件
     * @return array   $field 返回二位数组
     */
    public function getGoodsCatList($condition, $field = '*')
    {
        $result = Db::name('goods_category')
            ->field($field)
            ->where($condition)
            //->cache(true, NZESTATE_CACHE_TIME)
            ->order('parent_id asc,sort_order asc,cat_id asc')
            ->select();
        return $result;
    }


}