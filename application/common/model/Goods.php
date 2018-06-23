<?php
namespace app\common\model;

use think\Db;
use think\Model;

class Goods extends Model
{

    /**
     * 获取商品（推荐，新品，热销）
     * @param string $feature
     * @param int $limit
     * @param string $order
     * @return array
     */
    public function getGoodsByFeature($feature = 'is_recommend', $field = "*", $limit = 10, $order = 'a.sort_order desc'){
        if($feature == 'is_recommend'){
            $condition['a.is_recommend'] = 1;
        }
        if($feature == 'is_new'){
            $condition['a.is_new'] = 1;
        }
        if($feature == 'is_hot'){
            $condition['a.is_hot'] = 1;
        }

        $condition['a.is_on_sale'] = 1;

        $result = Db::name('goods')
            ->field($field)
            ->alias('a')
            ->join('goods_category b','a.cat_id=b.cat_id')
            ->where($condition)
            ->limit($limit)
            ->order($order)
            ->select();
        return $result;
    }

    public function PromotionGoods()
    {
        return $this->hasOne('PromotionGoods','promotion_id','promotion_id')->cache(true,10);
    }
}