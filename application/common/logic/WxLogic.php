<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/22
 * Time: 1:15
 */

namespace app\common\logic;
use app\common\logic\wechat\WxUtil;
use app\common\model\WxMaterial;
use think\Db;

/**
 * Class 微信公众号业务逻辑
 * @package app\common\logic
 */

class WxLogic
{

    static private $wx_user = null;
    static private $wechat_obj;

    public function __construct($config = null)
    {
        if (!self::$wx_user) {
            if ($config === null) {
                $config = Db::name('wx_user')->find();
            }
            self::$wx_user = $config;
            self::$wechat_obj = new WxUtil(self::$wx_user);
        }
    }

    /**
     * 删除图片
     * @param $url string 存储在本地的url
     */
    public function deleteImage($url)
    {
        if (strpos($url, 'weixin_mp_image/') === false) {
            return;
        }
        if (!$image = WxMaterial::get(['type' => WxMaterial::TYPE_IMAGE, 'key' => md5($url)])) {
            return;
        }
        if ($image->media_id) {
            self::$wechat_obj->delMaterial($image->media_id);
        }
    }
}