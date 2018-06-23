<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 23:32
 */

namespace app\common\logic;


use app\common\model\Goods;
use app\common\model\GoodsSpecPrice;
use app\common\model\PromotionGoods;
use app\common\util\NzestateException;
use think\Db;

class PromotionGoodsLogic extends Promotion
{

    protected $promGoods;//促销活动模型
    protected $goods;//商品模型
    protected $goodsSpecPrice;//商品规格模型

    public function __construct($goods, $goodsSpecPrice)
    {
        parent::__construct();
        $this->goods = $goods;
        $this->goodsSpecPrice = $goodsSpecPrice;
        //活动和规格是一对多的关系
        if($this->goodsSpecPrice){
            //活动商品有规格，活动和规格是一对多
            $this->promGoods = PromotionGoods::get($goodsSpecPrice['promotion_id']);
        }else{
            //活动商品没有规格，活动和规格是一对多
            $this->promGoods = PromotionGoods::get($goods['promotion_id']);
        }
        if ($this->promGoods) {
            //每次初始化都检测活动是否失效，如果失效就更新活动和商品恢复成普通商品
            if ($this->checkActivityIsEnd() && $this->promGoods['is_end'] == 0) {
                Db::name('goods')->where(['promotion_type'=>3,'promotion_id' =>$this->goods['promotion_id']])->save(['promotion_type' => 0, 'promotion_id' => 0]);
                if($this->goodsSpecPrice){
                    Db::name('spec_goods_price')->where(['promotion_type'=>3,'promotion_id' =>$this->goodsSpecPrice['promotion_id']])->save(['promotion_type' => 0, 'promotion_id' => 0]);
                    unset($this->goodsSpecPrice);
                    $this->goodsSpecPrice = GoodsSpecPrice::get($goodsSpecPrice['item_id'],'',true);
                }
                $this->promGoods->is_end = 1;
                $this->promGoods->save();
                unset($this->goods);
                $this->goods = Goods::get($goods['goods_id']);
            }
        }
    }

    public function getPromModel(){
        return $this->promGoods;
    }

    /**
     * 计算促销价格。
     * @param $Price|原价或者规格价格
     * @return float
     */
    public function getPromotionPrice($Price){
        switch ($this->promGoods['type']) {
            case 0:
                $promotionPrice = $Price * $this->promGoods['expression'] / 100;//打折优惠
                break;
            case 1:
                $promotionPrice = $Price - $this->promGoods['expression'];//减价优惠
                break;
            case 2:
                $promotionPrice = $this->promGoods['expression'];//固定金额优惠
                break;
            default:
                $promotionPrice = $Price;//原价
                break;
        }
        $promotionPrice = ($promotionPrice >0 ? $promotionPrice : 0); //防止出现负数
        return $promotionPrice;
    }

    /**
     * 活动是否正在进行
     * @return bool
     */
    public function checkActivityIsAble(){
        if(empty($this->promGoods)){
            return false;
        }
        if(time() > $this->promGoods['start_time'] && time() < $this->promGoods['end_time'] && $this->promGoods['is_end'] == 0){
            return true;
        }
        return false;
    }
    /**
     * 活动是否结束
     * @return bool
     */
    public function checkActivityIsEnd(){
        if(empty($this->promGoods)){
            return true;
        }
        if(time() > $this->promGoods['end_time']){
            return true;
        }
        return false;
    }
    /**
     * 获取商品原始数据
     * @return Goods
     */
    public function getGoodsInfo()
    {
        return $this->goods;
    }
    /**
     * 获取商品转换活动商品的数据
     * @return $activityGoods;

     */
    public function getActivityGoodsInfo(){
        $activityGoods = $this->goods;
        $activityGoods['activity_title'] = $this->promGoods['title'];
        $activityGoods['market_price'] = $this->goods['market_price'];
        $activityGoods['start_time'] = $this->promGoods['start_time'];
        $activityGoods['end_time'] =  $this->promGoods['end_time'];
        //有规格
        if($this->goodsSpecPrice){
            $activityGoods['shop_price'] = $this->getPromotionPrice($this->goodsSpecPrice['price']);
            $activityGoods['store_count'] = $this->goodsSpecPrice['store_count'];
            //如果价格有变化就将市场价等于商品规格价。
            if($activityGoods['shop_price'] != $this->goodsSpecPrice['price']){
                $activityGoods['market_price'] = $this->goodsSpecPrice['price'];
            }
            $activityGoods['store_count'] = $this->goodsSpecPrice['store_count'];
        }else{
            $activityGoods['shop_price'] = $this->getPromotionPrice($this->goods['shop_price']);
            //如果价格有变化就将市场价等于商品规格价。
            if($activityGoods['shop_price'] != $this->goods['shop_price']){
                $activityGoods['market_price'] = $this->goodsSpecPrice['price'];
            }
        }
        $activityGoods['promotion_detail'] =  $this->promGoods['promotion_detail'];
        return $activityGoods;
    }

    /**
     * 该活动是否已经失效
     */
    public function IsAble(){
        if(empty($this->promGoods)){
            return false;
        }
        if(time() > $this->promGoods['end_time']){
            return false;
        }
        if($this->promGoods['is_end'] == 1){
            return false;
        }
        return true;
    }

    /**
     * 促销商品立即购买
     * @param $buyGoods
     * @return mixed
     * @throws NzestateException
     */
    public function buyNow($buyGoods){
        if(!$this->checkActivityIsEnd() && $this->checkActivityIsAble()){
            if($buyGoods['goods_num'] > $this->promGoods['buy_limit']){
                throw new NzestateException('促销商品立即购买', 0, ['status' => 0, 'msg' => '每人限购' . $this->promGoods['buy_limit'] . '件', 'result' => '']);
            }
            $buyGoods['user_goods_price'] = $this->getPromotionPrice($buyGoods['user_goods_price']);
        }
        $residue_buy_limit = $this->getPromoGoodsResidueGoodsNum($buyGoods['user_id']); //获取用户还能购买商品数量
        $userPromOrderGoodsNum = $this->getUserPromOrderGoodsNum($buyGoods['user_id']); //获取用户已购商品数量
        $userBuyGoodsNum = $buyGoods['goods_num'] + $userPromOrderGoodsNum;  //已经下单+要买
        if($userBuyGoodsNum > $this->promGoods['buy_limit']){
            throw new NzestateException('促销商品立即购买', 0, ['status' => 0, 'msg' => '每人限购'.$this->promGoods['buy_limit'].'件，您已下单'.$userPromOrderGoodsNum.'件', 'result' => '']);
        }
        if($buyGoods['goods_num'] > $residue_buy_limit){  //不算购物车的
            throw new NzestateException('促销商品立即购买', 0, ['status' => 0, 'msg' => '商品库存不足，你只能购买'.$residue_buy_limit, 'result' => '']);
        }
        $buyGoods['promotion_type'] = 3;
        $buyGoods['promotion_id'] = $this->promGoods['id'];
        return $buyGoods;
    }

    /**
     * 获取用户抢购已购商品数量
     * @param $user_id
     * @return float|int
     */
    public function getUserPromOrderGoodsNum($user_id){
        $orderWhere = [
            'user_id'=>$user_id,
            'order_status' => ['<>', 3],
            'add_time' => ['between', [$this->promGoods['start_time'], $this->promGoods['end_time']]]
        ];
        $order_id_arr = Db::name('order')
            ->field('order_id')
            ->where($orderWhere);
        if ($order_id_arr) {
            $orderGoodsWhere = [
                'promotion_id' => $this->promGoods['id'],
                'promotion_type' => 3,
                'order_id' => ['in', implode(',', $order_id_arr)],
                'goods_id' => $this->goods['goods_id'],
            ];
            if($this->goodsSpecPrice){
                $orderGoodsWhere[ 'spec_key'] = $this->goodsSpecPrice['key'];
            }
            $goods_num = DB::name('order_goods')
                ->where($orderGoodsWhere)
                ->sum('goods_num');
            if($goods_num){
                return $goods_num;
            }else{
                return 0;
            }
        } else {
            return 0;
        }
    }
    /**
     * 获取用户剩余购买促销商品数量
     * @param $user_id
     * @return mixed
     */
    public function getPromoGoodsResidueGoodsNum($user_id){
        $user_purchase_num = $this->getUserPromOrderGoodsNum($user_id); //用户已购商品数量
        //限购》已购
        $residue_buy_limit = $this->promGoods['buy_limit'] - $user_purchase_num;  //用户还能买的数量
        $store_count = $this->goods['store_count'];  //剩余库存
        if($this->goodsSpecPrice){
            $store_count = $this->goodsSpecPrice['store_count'];
        }
        if($residue_buy_limit > $store_count){
            return $store_count;
        }else{
            return $residue_buy_limit;
        }
    }
}