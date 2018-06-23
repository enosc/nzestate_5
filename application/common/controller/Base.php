<?php
namespace app\common\controller;
use app\common\model\Brand;
use app\common\model\GoodsCategory;
use think\Controller;
use think\Db;
use think\Session;

/**
 * Class 公共基础
 * @package app\common\controller
 */
class Base extends Controller
{
    public $session_id;
    public $cateTrre = array();
    public $template_dir = '';


    public function _initialize() {

        parent::_initialize();
        if (input("unique_id")) {           // 兼容手机app
            session_id(input("unique_id"));
            Session::start();
        }
        // history.back返回后输入框值丢失问题 参考文章  http://blog.csdn.net/qinchaoguang123456/article/details/29852881
        header("Cache-control: private");
        $this->session_id = session_id(); // 当前的 session_id
        define('SESSION_ID',$this->session_id); //将当前的session_id保存为常量，供其它方法调用

        // 判断当前用户是否手机
        if(isMobile())
            cookie('is_mobile','1',3600);
        else
            cookie('is_mobile','0',3600);

        $this->public_assign();
    }

    /**
     * 保存公告变量到 smarty中 比如 导航
     */
    public function public_assign()
    {

        $public_data = read_cache("public_data");

        if (empty($public_data)) {
            $public_data = [];
            $shop_config = [];

            $nz_config = Db::name('config')->cache(true,NZESTATE_CACHE_TIME)->select();
            foreach($nz_config as $k => $v) {
                if($v['config_key'] == 'hot_keywords'){
                    $shop_config['hot_keywords'] = explode('|', $v['config_value']);
                }
                $shop_config[$v['inc_type'].'_'.$v['config_key']] = $v['config_value'];
            }
            $public_data['shop_config'] = $shop_config;

            //全部分类
            $category_tree = get_goods_category_tree();

            $goods_cat_model = new GoodsCategory();
            $hot_category = $goods_cat_model->getGoodsCatList(['is_hot' => 1, 'cat_level' => 1, 'is_show' => 1]);
            foreach ($hot_category as $v){
                $cat_path = explode('_', $v['parent_id_path']);
                $hot_cate[$cat_path[1]][] = $v;
            }

            $goods_category_tree = [];
            foreach ($category_tree as $k=>$v){
                if($v['is_hot']==1){
                    $v['hot_cate'] = empty($hot_cate[$k]) ? array() : $hot_cate[$k];
                    $goods_category_tree[] = $v;
                }else{
                    $goods_category_tree[] = $v;
                }
            }
            $public_data['goods_category_tree'] = $goods_category_tree;

            //Navigation
            $nav_list = Db::name('navigation')
                ->where('is_show', 1)
                ->cache(true, NZESTATE_CACHE_TIME)
                ->order('sort_order asc')
                ->select();

            $nav_menu = [];
            foreach ($nav_list as $key => $value){
                if($value['nav_position'] == 'top'){
                    $nav_menu ['nav_top'][] = $value;
                }
                if($value['nav_position'] == 'bottom'){
                    $nav_menu ['nav_bottom'][] = $value;
                }
            }

            $public_data['nav_menu'] = $nav_menu;

            //品牌列表
            $brand_model = new Brand();
            $brand_list = $brand_model->getBrandList(['parent_id' => ['>', '0']], 'brand_id,brand_name,parent_id,brand_logo,is_hot');

            $public_data['brand_list'] = $brand_list;

            write_cache('public_data',$public_data);
        }

        $this->cateTrre = $public_data['goods_category_tree'];
        $this->assign('goods_category_tree', $public_data['goods_category_tree']);

        $this->assign('nav_menu', $public_data['nav_menu']);


        $this->assign('brand_list', $public_data['brand_list']);
        $this->assign('shop_config', $public_data['shop_config']);
        $user = session('user');
        $this->assign('username',$user['user_nickname']);
        //PC端首页"手机端、APP二维码"
        $store_logo = nzcache('shop_info.store_logo');
        $head_pic = $store_logo ?  $store_logo: '/static/images/logo/pc_home_logo_default.png';
        $mobile_url = SITE_URL . url('mobile/index/app_down');
        $this->assign('head_pic', SITE_URL . "/".$head_pic);
        $this->assign('mobile_url', $mobile_url);
    }

    /**
     * 获取验证码
     */
    public function getVerify(){
        get_verify_code();
    }

    public function ajaxReturn($data)
    {
        exit(json_encode($data));
    }

}