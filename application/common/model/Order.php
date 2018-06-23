<?php
namespace app\common\model;

use think\Model;

/**
 * Class 订单
 * @package app\common\model
 */
class Order extends Model
{

    //获取所有订单商品
    public function OrderGoods()
    {
        return $this->hasMany('OrderGoods','order_id','order_id')->field('*,(goods_num * user_goods_price) AS goods_total');
    }
}