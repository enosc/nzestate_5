<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 22:14
 */

namespace app\common\model;
use think\Model;

/**
 * Class 优惠券
 * @package app\common\model
 */
class CouponList extends Model
{

    public function coupon()
    {
        return $this->hasOne('coupon','list_id','coupon_id');
    }

}