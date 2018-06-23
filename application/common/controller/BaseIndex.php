<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/14
 * Time: 23:46
 */

namespace app\common\controller;


use app\common\model\Goods;
use think\Config;

class BaseIndex extends Base
{

    public function _initialize() {

        parent::_initialize();
        $this->template_dir = 'index/'.  strtolower(request()->controller()).'/';

    }

    public function getIndexData()
    {
        $index_data = read_cache("index_data");
        if (empty($index_data)) {

            $index_data['ad_index_top']       = get_ad(1, 1);
            $index_data['ad_index_banner']    = get_ad(2, 5);
            $index_data['ad_index_recommend_brand']    = get_ad(50, 10);
            $index_data['ad_index_banner1']    = get_ad(49, 1);

            $goods_model = new Goods();

            //首页热卖商品
            $index_data['index_hot_goods'] = $goods_model->getGoodsByFeature('is_hot','a.goods_name,a.goods_id,a.shop_price,a.market_price,a.cat_id,b.parent_id_path,b.cat_name');
            //首页推荐商品
            $index_data['index_recommend_goods'] = $goods_model->getGoodsByFeature('is_recommend','a.goods_name,a.goods_id,a.shop_price,a.market_price,a.cat_id,b.parent_id_path,b.cat_name');
            //首页新品展示
            $index_data['index_new_goods'] = $goods_model->getGoodsByFeature('is_new','a.goods_name,a.goods_id,a.shop_price,a.market_price,a.cat_id,b.parent_id_path,b.cat_name');

            write_cache('index_data',$index_data);
        }

        $this->assign('ad_top',             $index_data['ad_index_top']);
        $this->assign('ad_banner',          $index_data['ad_index_banner']);
        $this->assign('ad_recommend_brand', $index_data['ad_index_recommend_brand']);
        $this->assign('ad_banner1',         $index_data['ad_index_banner1']);
        $this->assign('hot_goods',          $index_data['index_hot_goods']);
        $this->assign('recommend_goods',    $index_data['index_recommend_goods']);
        $this->assign('new_goods',          $index_data['index_new_goods']);
    }
}