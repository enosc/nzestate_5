<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/16
 * Time: 22:10
 */

namespace app\shop\controller;

use app\common\controller\BaseShop;
use app\common\logic\CartLogic;
use app\common\model\User;
use think\Db;

/**
 * Class 购物车控制器
 * @package app\shop\controller
 */
class Cart extends BaseShop
{

    public $cartLogic; // 购物车逻辑操作类
    public $user_id = 0;
    public $user = array();

    public function _initialize()
    {
        parent::_initialize();
        $this->cartLogic = new CartLogic();
        $user = session('USER');
        if (!empty($user) && $user['user_id']!='') {
            $user_model = new User();
            $user =  $user_model->getUserById($user['user_id']);
            session('USER', $user);  //覆盖session 中的 user
            $this->user = $user;
            $this->user_id = $user['user_id'];
            $this->assign('user', $user); //存储用户信息
            // 给用户计算会员价 登录前后不一样
            if ($user) {
                $user['user_discount'] = (empty($user['user_discount'])) ? 1 : $user['user_discount'];
                if($user['user_discount'] != 1)
                {
                    $c = Db::name('cart')
                        ->where(['user_id' => $user['user_id'], 'promotion_type' => 0])
                        ->where('user_goods_price = goods_price')
                        ->count();
                    $c && Db::name('cart')
                        ->where(['user_id' => $user['user_id'], 'promotion_type' => 0])
                        ->update(['user_goods_price' =>  Db::raw('goods_price*' . $user['user_discount'])]);
                }
            }
        }
    }

    //ajax 请求购物车列表
    public function mini_cart_list()
    {
        $cartLogic = new CartLogic();
        $cartLogic->setUserId($this->user_id);
        $cartList = $cartLogic->getCartList();
        $cartPriceInfo = $cartLogic->getCartPriceInfo($cartList);
        $this->assign('cartList', $cartList); // 购物车的商品
        $this->assign('cartPriceInfo', $cartPriceInfo); // 总计
        $template = input('template','mini_cart_list');
        //error_log(print_r($cartList,true));
        exit ($this->fetch($this->template_dir . $template));
    }

}