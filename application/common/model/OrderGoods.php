<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 22:16
 */

namespace app\common\model;


use think\Model;

/**
 * Class 订单商品
 * @package app\common\model
 */
class OrderGoods extends Model
{

    public function goods()
    {
        return $this->hasOne('goods','goods_id','goods_id');
    }
}