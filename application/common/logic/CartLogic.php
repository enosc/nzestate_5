<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 19:28
 */

namespace app\common\logic;
use app\common\model\Cart;
use app\common\model\GoodsSpecPrice;
use think\Db;
use think\Model;

/**
 * Class 购物车业务逻辑
 * @package app\common\logic
 */

class CartLogic extends Model
{

    protected $goods;//商品模型
    protected $specGoodsPrice;//商品规格模型
    protected $goodsBuyNum;//购买的商品数量
    protected $session_id;//session_id
    protected $user_id = 0;//user_id
    protected $userGoodsTypeCount = 0;//用户购物车的全部商品种类
    protected $userCouponNumArr; //用户符合购物车店铺可用优惠券数量

    public function __construct(){
        parent::__construct();
        $this->session_id = session_id();
    }

    /**
     * 将session_id改成unique_id
     * @param $uniqueId|api唯一id 类似于 pc端的session id
     */
    public function setUniqueId($uniqueId){
        $this->session_id = $uniqueId;
    }

    /**
     * 设置用户ID
     * @param $user_id
     */
    public function setUserId($user_id)
    {
        $this->user_id = $user_id;
    }

    /**
     * 用户登录后 对购物车操作
     * modify：login_cart_handle
     */
    public function doUserLoginHandle()
    {
        if (empty($this->session_id) || empty($this->user_id)) {
            return;
        }
        //登录后将购物车的商品的 user_id 改为当前登录的id
        $cart_model = new \app\common\model\Cart();
        $cart_model->save(['user_id' => $this->user_id], ['session_id' => $this->session_id, 'user_id' => 0]);
        // 查找购物车两件完全相同的商品
        $cart_id_arr = Db::name('cart')
            ->field('cart_id')
            ->where(['user_id' => $this->user_id])
            ->group('goods_id,spec_key')
            ->having('count(goods_id) > 1')
            ->select();
        if (!empty($cart_id_arr)) {
            $cart_id_arr = get_arr_column($cart_id_arr, 'cart_id');
            Db::name('cart')->delete($cart_id_arr); // 删除购物车完全相同的商品
        }
    }

    /**
     * 获取用户的购物车列表
     * @param int $selected|是否被用户勾选中的 0 为全部 1为选中  一般没有查询不选中的商品情况
     * @return false|\PDOStatement|string|\think\Collection
     */
    public function getCartList($selected = 0){
        $cart = new Cart();
        // 如果用户已经登录则按照用户id查询
        if ($this->user_id) {
            $cartWhere['user_id'] = $this->user_id;
        } else {
            $cartWhere['session_id'] = $this->session_id;
        }
        if($selected != 0){
            $cartWhere['selected'] = 1;
        }
        $cartList = $cart->with('promotionGoods,goods')->where($cartWhere)->select();  // 获取购物车商品

        $cartCheckAfterList = $this->checkCartList($cartList);
        $cartGoodsTotalNum = array_sum(array_map(function($val){return $val['goods_num'];}, $cartCheckAfterList));//购物车购买的商品总数

        cookie('cart_num',$cartGoodsTotalNum, 360000);
        //setcookie('cart_num', $cartGoodsTotalNum, null, '/');
        return $cartCheckAfterList;
    }

    /**
     * 过滤掉无效的购物车商品
     * @param $cartList
     */
    public function checkCartList($cartList){
        $goodsPromFactory = new GoodsPromFactory();
        foreach($cartList as $cartKey => $cart){
            //商品不存在或者已经下架
            if(empty($cart['goods']) || $cart['goods']['is_on_sale'] != 1 || $cart['goods_num'] == 0){
                Db::name('cart')
                    ->where('goods_id', $cart['goods_id'])
                    ->delete();
                unset($cartList[$cartKey]);
                continue;
            }
            //活动商品的活动是否失效
            if ($goodsPromFactory->checkPromType($cart['prom_type'])) {
                if (!empty($cart['spec_key'])) {
                    $specGoodsPrice = GoodsSpecPrice::get(['goods_id' => $cart['goods_id'], 'key' => $cart['spec_key']], '', true);
                    if($specGoodsPrice['promotion_id'] != $cart['promotion_id']){
                        Db::name('cart')
                            ->where('promotion_id', $cart['promotion_id'])
                            ->delete();
                        unset($cartList[$cartKey]);
                        continue;
                    }
                } else {
                    if($cart['goods']['prom_id'] != $cart['prom_id']){
                        Db::name('cart')
                            ->where('promotion_id', $cart['promotion_id'])
                            ->delete();
                        unset($cartList[$cartKey]);
                        continue;
                    }
                    $specGoodsPrice = null;
                }
                $goodsPromLogic = $goodsPromFactory->makeModule($cart['goods'], $specGoodsPrice);
                if ($goodsPromLogic && !$goodsPromLogic->isAble()) {
                    Db::name('cart')
                        ->where('goods_id', $cart['goods_id'])
                        ->delete();
                    unset($cartList[$cartKey]);
                    continue;
                }
            }
        }
        return $cartList;
    }

    /**
     * 获取购物车的价格详情
     * @param $cartList|购物车列表
     * @return array
     */
    public function getCartPriceInfo($cartList = null){
        $total_fee = $goods_fee = $goods_num = 0;//初始化数据。商品总额/节约金额/商品总共数量
        if($cartList){
            foreach ($cartList as $cartKey => $cartItem) {
                $total_fee += $cartItem['goods_fee'];
                $goods_fee += $cartItem['cut_fee'];
                $goods_num += $cartItem['goods_num'];
            }
        }
        return compact('total_fee', 'goods_fee', 'goods_num');
    }

}