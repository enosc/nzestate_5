<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 23:28
 */

namespace app\common\model;
use think\Model;

/**
 * Class 团购
 * @package app\common\model
 */

class GroupBuy extends Model
{

    public function goods(){
        return $this->hasOne('goods','goods_id','goods_id');
    }
    public function goodsSpecPrice(){
        return $this->hasOne('GoodsSpecPrice','item_id','item_id');
    }
    //剩余团购库存
    public function getStoreCountAttr($value, $data)
    {
        return $data['goods_num'] - $data['buy_num'];
    }
}