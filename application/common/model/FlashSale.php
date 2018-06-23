<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 22:40
 */

namespace app\common\model;

use think\Model;

/**
 * Class 描述活动
 * @package app\common\model
 */
class FlashSale extends Model
{

    public function specGoodsPrice()
    {
        return $this->hasOne('GoodsSpecPrice','item_id','item_id');
    }

    public function goods()
    {
        return $this->hasOne('goods','promotion_id','sale_id');
    }
    //剩余抢购库存
    public function getStoreCountAttr($value, $data)
    {
        return $data['goods_num'] - $data['buy_num'];
    }
}