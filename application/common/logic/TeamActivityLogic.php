<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/16
 * Time: 0:20
 */

namespace app\common\logic;


use app\common\model\Goods;
use app\common\model\GoodsSpecPrice;
use app\common\model\TeamActivity;
use think\Db;

class TeamActivityLogic extends Promotion
{

    protected $team;//拼团模型
    protected $goods;//商品模型
    protected $goodsSpecPrice;//商品规格模型
    public function __construct($goods,$goodsSpecPrice)
    {
        parent::__construct();
        $this->goods = $goods;
        $this->goodsSpecPrice = $goodsSpecPrice;
        if($this->goodsSpecPrice){
            //活动商品有规格，规格和活动是一对一
            $this->team = TeamActivity::get($goodsSpecPrice['promotion_id'],'',true);
        }else{
            //活动商品没有规格，活动和商品是一对一
            $this->team = TeamActivity::get($this->goods['promotion_id'],'',true);
        }
        if ($this->team) {
            //每次初始化都检测活动是否失效，如果失效就恢复商品成普通商品
            if ($this->checkActivityIsEnd()) {
                if($this->goodsSpecPrice){
                    Db::name('goods_spec_price')
                        ->where('item_id', $this->goodsSpecPrice['item_id'])
                        ->update(['promotion_type' => 0, 'promotion_id' => 0]);
                    $goodsPromCount = Db::name('goods_spec_price')
                        ->where('goods_id', $this->goodsSpecPrice['goods_id'])
                        ->where('promotion_type','>',0)
                        ->count('item_id');
                    if($goodsPromCount == 0){
                        Db::name('goods')
                            ->where("goods_id", $this->goodsSpecPrice['goods_id'])
                            ->update(['promotion_type' => 0, 'promotion_id' => 0]);
                    }
                    unset($this->goodsSpecPrice);
                    $this->goodsSpecPrice = GoodsSpecPrice::get($goodsSpecPrice['item_id'],'',true);
                }else{
                    Db::name('goods')
                        ->where("goods_id", $this->team['goods_id'])
                        ->update(['promotion_type' => 0, 'promotion_id' => 0]);
                }
                unset($this->goods);
                $this->goods = Goods::get($goods['goods_id']);
            }
        }
    }
    public function getPromModel(){
        return $this->team;
    }

    public function getGoodsInfo(){
        return $this->goods;
    }

    public function getActivityGoodsInfo(){
        if($this->goodsSpecPrice){
            //活动商品有规格，规格和活动是一对一
            $activityGoods = $this->goodsSpecPrice;
            $activityGoods['shop_price']=$activityGoods['price'];
        }else{
            //活动商品没有规格，活动和商品是一对一
            $activityGoods = $this->goods;
        }
        return $activityGoods;
    }

    public function checkActivityIsAble(){
        return $this->IsAble();
    }
    /**
     * 活动是否结束
     * @return bool
     */
    public function checkActivityIsEnd(){
        if(empty($this->team)){
            return true;
        }
        if($this->team['team_type'] == 2 && $this->team['is_lottery'] == 1){
            return true;
        }
        return false;
    }
    public function IsAble(){
        if(empty($this->team)){
            return false;
        }
        if($this->team['status'] != 1){
            return false;
        }
        if($this->team['team_type'] == 2 && $this->team['is_lottery'] == 1){
            return false;
        }
        return true;
    }
    /**
     * @param $buyGoods
     * @return array
     */
    public function buyNow($buyGoods){
        $buyGoods['promotion_type'] =0;
        $buyGoods['promotion_id'] = 0;
        return $buyGoods;
    }
}