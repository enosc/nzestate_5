<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 23:17
 */

namespace app\common\model;


use think\Model;

class GoodsSpecPrice extends Model
{

    public function promGoods()
    {
        return $this->hasOne('PromotionGoods', 'promotion_id', 'promotion_id')
            ->cache(true,NZESTATE_CACHE_TIME);
    }

    public function goods()
    {
        return $this->hasOne('Goods', 'goods_id', 'goods_id')
            ->cache(true,NZESTATE_CACHE_TIME);
    }
}