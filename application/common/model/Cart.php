<?php
namespace app\common\model;

use think\Db;
use think\Model;

/**
 * Class 购物车模型器
 * @package app\common\model
 */

class Cart extends Model
{

    /**
     * 删除购物车
     *
     * @param  array    $condition 检索条件
     */
    public function deleteCartGoods($condition)
    {
        Db::name('cart')
            ->where($condition)
            ->delete();
    }

    public function promotionGoods()
    {
        return $this->hasOne('PromotionGoods', 'promotion_id', 'promotion_id')->cache(true,NZESTATE_CACHE_TIME);
    }

    public function goods()
    {
        return $this->hasOne('Goods', 'goods_id', 'goods_id')->cache(true,NZESTATE_CACHE_TIME);
    }
}