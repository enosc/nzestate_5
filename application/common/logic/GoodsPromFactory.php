<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 22:35
 */

namespace app\common\logic;

/**
 * Class 商品活动工厂类
 * @package app\common\logic
 */

class GoodsPromFactory
{

    /**
     * @param $goods|商品活动实例
     * @param $spec_goods_price|规格实例
     * @return FlashSale|GroupBuyLogic|PromotionGoodsLogic|TeamActivityLogic
     */
    public function makeModule($goods, $spec_goods_price)
    {
        switch ($goods['promotion_type']) {
            case 1:
                return new FlashSale($goods, $spec_goods_price);
            case 2:
                return new GroupBuyLogic($goods, $spec_goods_price);
            case 3:
                return new PromotionGoodsLogic($goods, $spec_goods_price);
            case 6:
                return new TeamActivityLogic($goods, $spec_goods_price);
        }
    }

    /**
     * 检测是否符合商品活动工厂类的使用
     * @param $promType |活动类型
     * @return bool
     */
    public function checkPromType($promType)
    {
        if (in_array($promType, array_values([1, 2, 3, 6]))) {
            return true;
        } else {
            return false;
        }
    }
}