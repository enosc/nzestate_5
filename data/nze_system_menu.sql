-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2018 at 02:37 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tpshop2_5`
--

-- --------------------------------------------------------

--
-- Table structure for table `nze_system_menu`
--

CREATE TABLE IF NOT EXISTS `nze_system_menu` (
`menu_id` smallint(6) unsigned NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `privilege` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `type` tinyint(2) DEFAULT '0' COMMENT '所属模块类型 0admin 1home 2mobile 3api'
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_system_menu`
--

INSERT INTO `nze_system_menu` (`menu_id`, `menu_name`, `group`, `privilege`, `is_del`, `type`) VALUES
(4, '广告管理', 'content', 'Article@notice_list', 0, 0),
(5, '网站设置', 'system', 'System@index,System@handle', 0, 0),
(6, '权限资源', 'system', 'System@privilege_list,System@edit_privilege', 0, 0),
(7, '前台导航设置', 'system', 'System@navigationList,System@addEditNav,System@delNav', 0, 0),
(8, '管理员管理', 'system', 'Admin@index,Admin@admin_info,Admin@adminHandle', 0, 0),
(9, '角色管理', 'system', 'Admin@role,Admin@role_info,Admin@roleSave,Admin@roleDel', 0, 0),
(10, '供应商管理', 'system', 'Admin@supplier,Admin@supplier_info,Admin@supplierHandle', 0, 0),
(11, '会员管理', 'member', 'User@index,User@ajaxindex,User@detail,User@address,User@delete', 0, 0),
(12, '会员资金', 'member', 'User@account_log,User@account_edit', 0, 0),
(13, '会员管理', 'member', 'User@index,User@ajaxindex,User@detail,User@address,User@delete,User@search_user', 0, 0),
(14, '会员等级', 'member', 'User@level,User@levelList,User@levelHandle', 0, 0),
(15, '商品类型', 'goods', 'Goods@goodsTypeList,Goods@addEditGoodsType,Goods@delGoodsType', 0, 0),
(16, '商品编辑', 'goods', 'Goods@addEditGoods,Goods@delGoods,Goods@del_goods_images', 0, 0),
(17, '商品列表', 'goods', 'Goods@goodsList,Goods@ajaxGoodsList,Goods@updateField', 0, 0),
(18, '商品规格', 'goods', 'Goods@ajaxGetSpecList,Goods@delGoodsSpec,Goods@addEditSpec,Goods@ajaxSpecList,Goods@specList,Goods@ajaxGetSpecSelect', 0, 0),
(19, '商品分类', 'goods', 'Goods@categoryList,Goods@addEditCategory,Goods@delGoodsCategory', 0, 0),
(20, '商品属性', 'goods', 'Goods@ajaxGetAttrList,Goods@goodsAttributeList,Goods@ajaxGoodsAttributeList,Goods@addEditGoodsAttribute,Goods@ajaxGetAttrInput', 0, 0),
(21, '商品品牌', 'goods', 'Goods@brandList,Goods@delBrand,Goods@addEditBrand', 0, 0),
(22, '广告列表', 'content', 'Ad@adList,Ad@adHandle,Ad@ad,Ad@changeAdField', 0, 0),
(23, '广告位', 'content', 'Ad@position,Ad@positionList,Ad@positionHandle', 0, 0),
(24, '团购管理', 'marketing', 'Promotion@group_buy,Promotion@group_buy_list,Promotion@groupbuyHandle', 0, 0),
(25, '限时抢购', 'marketing', 'Promotion@flash_sale,Promotion@flash_sale_info,Promotion@flash_sale_del', 0, 0),
(26, '促销管理', 'marketing', 'Promotion@prom_goods_list,Promotion@prom_goods_info,Promotion@prom_goods_save,Promotion@prom_goods_del,Promotion@get_goods,Promotion@search_goods', 0, 0),
(27, '订单列表', 'order', 'Order@index,Order@ajaxindex,Order@detail', 0, 0),
(28, '订单发货', 'order', 'Order@deliveryHandle,Order@delivery_info,Order@delivery_list', 0, 0),
(29, '退换货处理', 'order', 'Order@return_del,Order@return_info,Order@add_return_goods,Order@ajax_return_list,Order@return_list', 0, 0),
(30, '拆分订单', 'order', 'Order@split_order,Order@search_goods', 0, 0),
(31, '修改订单', 'system', 'Order@edit_order,Order@search_goods', 0, 0),
(32, '添加订单', 'order', 'Order@add_order,Order@search_goods', 0, 0),
(33, '处理订单', 'order', 'Order@pay_cancel,Order@delete_order,Order@order_action,Order@editprice,Order@order_log', 0, 0),
(34, '导出订单', 'order', 'Order@export_order', 0, 0),
(35, '打印订单', 'order', 'Order@order_print,Order@shipping_print', 0, 0),
(36, '插件列表', 'tools', 'Plugin@index,Plugin@install,Plugin@setting', 0, 0),
(37, '打印设置', 'tools', 'Plugin@shipping_list,Plugin@shipping_desc,Plugin@shipping_print,Plugin@edit_shipping_print,Plugin@shipping_list_edit,Plugin@del_area', 0, 0),
(38, '数据备份', 'tools', 'Tools@index,Tools@backup,Tools@optimize,Tools@repair', 0, 0),
(39, '数据还原', 'tools', 'Tools@restore,Tools@restoreData,Tools@restoreUpload,Tools@downFile,Tools@delSqlFiles', 0, 0),
(40, '地区管理', 'tools', 'Tools@region,Tools@regionHandle', 0, 0),
(41, '公众号设置', 'marketing', 'Wechat@index,Wechat@setting,Wechat@get_access_token,Wechat@select_goods', 0, 0),
(42, '文本回复', 'tools', 'Wechat@text,Wechat@add_text,Wechat@del_text', 0, 0),
(43, '微信菜单', 'tools', 'Wechat@menu,Wechat@del_menu,Wechat@pub_menu', 0, 0),
(44, '图文回复', 'tools', 'Wechat@img,Wechat@add_img,Wechat@del_img,Wechat@preview', 0, 0),
(45, '模板管理', 'system', 'Template@templateList,Template@changeTemplate', 0, 0),
(46, '销售概况', 'count', 'Report@index,Report@finance,Report@user', 0, 0),
(47, '销售排行', 'count', 'Report@saleTop,Report@userTop,Report@saleList', 0, 0),
(48, '专题管理', 'content', 'Topic@topic,Topic@topicList,Topic@topicHandle', 0, 0),
(49, '操作日志', 'system', 'Admin@log,Order@order_log', 0, 0),
(50, '评论咨询', 'goods', 'Comment@index,Comment@detail,Comment@ask_list,Comment@ajax_ask_list,Comment@del,Comment@op,Comment@consult_info,Comment@ask_handle', 0, 0),
(51, '优惠券', 'marketing', 'Coupon@coupon_info,Coupon@index,Coupon@make_coupon,Coupon@ajax_get_user,Coupon@send_coupon,Coupon@send_cancel,Coupon@del_coupon,Coupon@coupon_list,Coupon@coupon_list_del', 0, 0),
(52, '友情链接', 'content', 'Article@link,Article@linkList,Article@linkHandle', 0, 0),
(53, '分销管理', 'marketing', 'Distribut@set,Distribut@remittance,Distribut@tree,Distribut@rebate_log,Distribut@ajax_lower,Distribut@withdrawals,Distribut@editRebate,Distribut@delWithdrawals,Distribut@editWithdrawals', 0, 0),
(60, '自提点管理', 'system', 'Pickup@index,Pickup@ajaxPickupList,Pickup@add,Pickup@edit_address', 0, 0),
(61, '刷新缓存', 'system', 'System@cleanCache,System@ClearGoodsHtml,System@ClearGoodsThumb,System@ClearAritcleHtml', 0, 0),
(62, '修改管理员密码', 'system', 'Admin@modify_pwd', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_system_menu`
--
ALTER TABLE `nze_system_menu`
 ADD PRIMARY KEY (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_system_menu`
--
ALTER TABLE `nze_system_menu`
MODIFY `menu_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
