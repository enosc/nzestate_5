<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 19:47
 */

namespace app\common\logic;
use think\Db;
use think\Model;

/**
 * Class 订单业务逻辑处理
 * @package app\common\logic
 */
class OrderLogic extends Model
{

    protected $user_id = 0;

    public function setUserId($user_id){
        $this->user_id=$user_id;
    }

    /**
     * 自动取消订单
     */
    public function autoCancelOrder(){
        $set_time = 1; //自动取消时间/天 默认1天
        $cancel_time = strtotime("-$set_time day");
        $order_where = [
            'user_id'      =>$this->user_id,
            'add_time'     =>['lt',$cancel_time],
            'pay_status'   =>0,
            'order_status' => 0
        ];
        $order = Db::name('order')
            ->field('order_id')
            ->where($order_where);
        $result = [];
        foreach($order as $key =>$value){
            $result = $this->cancel_order($this->user_id,$value);
        }
        return $result;
    }

    /**
     * 取消订单
     * @param $user_id|用户ID
     * @param $order_id|订单ID
     * @param string $action_note 操作备注
     * @return array
     */
    public function cancel_order($user_id,$order_id,$action_note='您取消了订单'){
        $order = Db::name('order')
            ->where(['order_id'=>$order_id,'user_id'=>$user_id])
            ->find();
        //检查是否未支付订单 已支付联系客服处理退款
        if(empty($order))
            return ['status'=>-1,'msg'=>'订单不存在','result'=>''];
        if($order['order_status'] == 3){
            return ['status'=>-1,'msg'=>'该订单已取消','result'=>''];
        }
        //检查是否未支付的订单
        if($order['pay_status'] > 0 || $order['order_status'] > 0)
            return ['status'=>-1,'msg'=>'支付状态或订单状态不允许','result'=>''];
        //获取记录表信息
        //$log = M('account_log')->where(array('order_id'=>$order_id))->find();
        //有余额支付的情况
        if($order['user_money'] > 0 || $order['integral'] > 0){
            saveUserLog($user_id,$order['user_money'],$order['integral'],"订单取消，退回{$order['user_money']}元,{$order['integral']}积分",0,$order['order_id'],$order['order_sn']);
        }

        if($order['coupon_price'] >0){
            $res = array('use_time'=>0,'status'=>0,'order_id'=>0);
            Model('CouponList')->where(array('order_id'=>$order_id,'uid'=>$user_id))->save($res);
        }

        $row = Model('order')->where(array('order_id'=>$order_id,'user_id'=>$user_id))->save(array('order_status'=>3));
        $reduce = nzcache('shopping.reduce');
        if($reduce == 1 || empty($reduce)){
            $this->alterReturnGoodsInventory($order);
        }
        $data['order_id'] = $order_id;
        $data['action_user'] = 0;
        $data['action_note'] = $action_note;
        $data['order_status'] = 3;
        $data['pay_status'] = $order['pay_status'];
        $data['shipping_status'] = $order['shipping_status'];
        $data['log_time'] = time();
        $data['status_desc'] = '用户取消订单';
        Model('OrderAction')->insert($data);//订单操作记录
        if(!$row)
            return array('status'=>-1,'msg'=>'操作失败','result'=>'');
        return array('status'=>1,'msg'=>'操作成功','result'=>'');

    }

    /**
     * 取消订单后改变库存，根据不同的规格，商品活动修改对应的库存
     * @param $order
     * @param $rec_id|订单商品表id 如果有只返还订单某个商品的库存,没有返还整个订单
     */
    public function alterReturnGoodsInventory($order, $rec_id='')
    {
        if($rec_id){
            $orderGoodsWhere['rec_id'] = $rec_id;
            $return_info = Db::name('goods_return')->where($orderGoodsWhere)->select(); //查找购买数量和购买规格
            $order_goods_prom = Db::name('order_goods')->where($orderGoodsWhere)->find(); //购买时参加的活动
            $order_goods = $return_info;
            $order_goods[0]['promotion_type'] = $order_goods_prom['promotion_type'];
            $order_goods[0]['promotion_id'] = $order_goods_prom['promotion_id'];
        }else{
            $orderGoodsWhere = ['order_id'=>$order['order_id']];
            $order_goods = Db::name('order_goods')->where($orderGoodsWhere)->select(); //查找购买数量和购买规格
        }
        foreach($order_goods as $key=>$val){
            if(!empty($val['spec_key'])){ // 先到规格表里面扣除数量
                $SpecGoodsPrice = new SpecGoodsPrice();
                $specGoodsPrice = $SpecGoodsPrice::get(['goods_id' => $val['goods_id'], 'key' => $val['spec_key']]);
                if($specGoodsPrice){
                    $specGoodsPrice->store_count = $specGoodsPrice->store_count + $val['goods_num'];
                    $specGoodsPrice->save();//有规格则增加商品对应规格的库存
                }
            }else{
                Model('goods')->where(['goods_id' => $val['goods_id']])->setInc('store_count', $val['goods_num']);//没有规格则增加商品库存
            }
            //库存日志
            saveStockLog($order['user_id'], $val['goods_num'], $val, $order['order_sn']);

            Db::name('Goods')->where("goods_id", $val['goods_id'])->setDec('sales_sum', $val['goods_num']); // 减少商品销售量
            //更新活动商品购买量
            if ($val['promotion_type'] == 1 || $val['promotion_type'] == 2) {
                $GoodsPromFactory = new GoodsPromFactory();
                $goodsPromLogic = $GoodsPromFactory->makeModule($val, $specGoodsPrice);
                $prom = $goodsPromLogic->getPromModel();
                if ($prom['is_end'] == 0) {
                    $tb = $val['promotion_type'] == 1 ? 'flash_sale' : 'group_buy';
                    M($tb)->where("id", $val['promotion_id'])->setDec('buy_num', $val['goods_num']);
                    M($tb)->where("id", $val['promotion_id'])->setDec('order_num',1);
                }
            }
        }
    }

}