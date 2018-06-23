<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/16
 * Time: 0:21
 */

namespace app\common\model;
use think\Model;

/**
 * Class 拼团活动
 * @package app\common\model
 */

class TeamActivity extends Model
{

    public function goodsSpecPrice(){
//        return $this->hasOne('goodsSpecPrice','item_id','item_id')->bind(['price']);
        return $this->hasOne('GoodsSpecPrice','item_id','item_id');
    }
    public function goods(){
        return $this->hasOne('Goods','goods_id','goods_id')->bind(['shop_price']);
    }
    public function teamFound(){
        return $this->hasMany('TeamFound','team_id','team_id');
    }

    public function getTeamTypeDescAttr($value, $data){
        $status = config('TEAM_TYPE');
        return $status[$data['team_type']];
    }
    public function getTimeLimitHoursAttr($value, $data){
        return $data['time_limit'] / 3600;
    }
    //分享链接
    public function getBdUrlAttr($value, $data){
        return url('Mobile/Team/info',['goods_id'=>$data['goods_id'],'team_id'=>$data['team_id']],'',true);
    }
    public function getBdPicAttr($value, $data){

        return request()->domain().$data['share_img'];
    }
    public function getLotteryUrlAttr($value, $data){
        return url('mobile/team/lottery',['team_id'=>$data['team_id']],'',true);
    }
    public function getStatusDescAttr($value, $data){
        $status = array('关闭', '启用');
        return $status[$data['status']];
    }
    public function getVirtualSaleNumAttr($value, $data){
        return $data['virtual_num'] + $data['sales_sum'];
    }

    /**
     * 前台显示拼团详情
     */
    public function getFrontStatusDescAttr($value, $data){
        if($data['status'] != 1){
            return '活动未上架';
        }
        if($data['team_type'] == 2){
            if($data['is_lottery'] == 1){
                return '已开奖';
            }else{
                return '拼团中';
            }
        }else{
            return '拼团中';
        }
    }


    public function setTimeLimitAttr($value, $data){
        return $value * 3600;
    }
    public function setBonusAttr($value,$data)
    {
        return ($data['team_type'] != 1) ? 0 : $value;
    }
    public function setBuyLimitAttr($value,$data){
        return ($data['team_type'] == 2) ? 1 : $value;
    }
}