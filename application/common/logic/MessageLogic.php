<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 12:25
 */
namespace app\common\logic;
use think\Model;
use think\Db;
/**
 * Class 用户信息业务逻辑
 * @package app\common\logic
 */
class MessageLogic extends Model
{

    protected $tableName = 'message';
    protected $_validate = array();
    protected $message_category_num = 6;

    /**
     * 获取用户的消息个数
     * @return int
     */
    public function getUserMessageCount(){
        $user_info = session('USER');
        $user_system_message_no_read_where = array(
            'um.user_id' => $user_info['user_id'],
            'um.status' => 0,
        );
        $user_system_message_no_read = DB::name('user_message')
            ->alias('um')
            ->join('__MESSAGE__ m','um.message_id = m.message_id','LEFT')
            ->where($user_system_message_no_read_where)
            ->count();
        return $user_system_message_no_read;
    }

}