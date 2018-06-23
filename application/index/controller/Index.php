<?php
namespace app\index\controller;

use app\common\controller\BaseIndex;
use app\common\model\Goods;
use app\common\model\GoodsCategory;

/**
 * Class 主页控制器
 * @package app\index\controller
 */

class Index extends BaseIndex
{

    public function index()
    {
        if(isMobile()){
            redirect(url('mobile/index/index'));
        }

        $this->getIndexData();
        //$this->assign('cateList',$cateList);
        //$this->assign('goods_category_tree',$goods_category_tree);
        $this->assign('current','Index');
        return $this->fetch();

    }
}
