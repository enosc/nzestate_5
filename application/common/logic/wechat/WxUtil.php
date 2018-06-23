<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/22
 * Time: 0:40
 */

namespace app\common\logic\wechat;


use think\Db;

class WxUtil extends WxCommon
{

    private $config = [];    //微信公众号配置
    private $tagsMap = null; //粉丝标签映射
    private $events = [];

    //事件类型
    const EVENT_ALL = 0; //有事件就处理
    const EVENT_TEXT = 1; //文本输入事件
    const EVENT_SUBSCRIBE = 2; //关注事件
    const EVENT_UNSUBSCRIBE = 3; //取消关注事件
    const EVENT_SCAN = 4; //已关注的扫描二维码事件
    const EVENT_LOCATION = 5; //上报二维码时间
    const EVENT_CLICK = 6; //点击菜单事件
    const EVENT_VIEW = 7; //点击菜单跳转链接事件

    public function __construct($config = null)
    {
        if ($config === null) {
            $config = Db::name('wx_user')->find();
        }
        $this->config = $config;
    }

    /**
     * 新增媒质永久素材
     * 文档：https://mp.weixin.qq.com/wiki?action=doc&id=mp1444738729
     * @parem type $path 素材地址
     * @param string $type 类型有image,voice,video,thumb
     * @param array $param 目前是video类型需要
     * @return {"media_id":MEDIA_ID,"url":URL}
     */
    public function uploadMaterial($path, $type, $param=[])
    {
        if (!$access_token = $this->getAccessToken()) {
            return false;
        }

        $post_arr = ['media' => '@'.$path];
        if ($type == 'video') {
            $post_arr['description'] = $this->toJson([
                'title' => $param['title'],
                'introduction' => $param['introduction'],
            ]);
        }

        $url ="https://api.weixin.qq.com/cgi-bin/material/add_material?access_token={$access_token}&type={$type}";
        $return = $this->requestAndCheck($url, 'POST', $post_arr);
        if ($return === false) {
            return false;
        }

        return $return;
    }

    /**
     * 上传图文消息中的图片
     * 文档：https://mp.weixin.qq.com/wiki?action=doc&id=mp1444738729
     * @param string $path 图片地址
     * @return string|bool 图片的url
     */
    public function uploadNewsImage($path)
    {
        if (!$access_token = $this->getAccessToken()) {
            return false;
        }

        $post_arr = ["media"=>'@'.$path];
        $url ="https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token={$access_token}";
        $return = $this->requestAndCheck($url, 'POST', $post_arr);
        if ($return === false) {
            return false;
        }

        return $return['url'];
    }


    /**
     * 删除素材，包括图文
     * @param string $mediaId
     * @return boolean
     */
    public function delMaterial($mediaId)
    {
        if (!$access_token = $this->getAccessToken()) {
            return false;
        }

        $post = $this->toJson(['media_id' => $mediaId]);
        $url ="https://api.weixin.qq.com/cgi-bin/material/del_material?access_token={$access_token}";
        $return = $this->requestAndCheck($url, 'POST', $post);
        if ($return === false) {
            return false;
        }

        return true;
    }

    /**
     * 获取access_token
     * @return string
     */
    public function getAccessToken()
    {
        $wechat = $this->config;
        if (empty($wechat)) {
            $this->setError("公众号不存在！");
            return false;
        }

        //判断是否过了缓存期
        $expire_time = $wechat['web_expires'];
        if ($expire_time > time()) {
            return $wechat['web_access_token'];
        }

        $appid = $wechat['appid'];
        $appsecret = $wechat['appsecret'];
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$appid}&secret={$appsecret}";
        $return = $this->requestAndCheck($url, 'GET');
        if (!isset($return['access_token'])) {
            $this->config['web_expires'] = 0;
            Db::name('wx_user')->where('id', $wechat['id'])
                ->update(['web_expires' => 0]);
            return false;
        }

        $web_expires = time() + 7000; // 提前200秒过期
        Db::name('wx_user')->where('id', $wechat['id'])
            ->update(['web_access_token'=>$return['access_token'], 'web_expires'=>$web_expires]);
        $this->config['web_access_token'] = $return['access_token'];
        $this->config['web_expires'] = $web_expires;

        return $return['access_token'];
    }
}