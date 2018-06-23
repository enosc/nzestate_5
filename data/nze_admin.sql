-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2018 at 02:55 PM
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
-- Table structure for table `nze_admin`
--

CREATE TABLE IF NOT EXISTS `nze_admin` (
`admin_id` smallint(5) unsigned NOT NULL COMMENT '用户id',
  `admin_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `admin_email` varchar(60) NOT NULL DEFAULT '' COMMENT 'admin_email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `lang_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'lang_type',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'agency_id',
  `supplier_id` smallint(5) unsigned DEFAULT '0' COMMENT 'supplier_id',
  `to_do_list` longtext COMMENT 'to_do_list',
  `role_id` smallint(5) DEFAULT '0' COMMENT '角色id',
  `province_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商省级id',
  `city_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商市级id',
  `district_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商区级id'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_admin`
--

INSERT INTO `nze_admin` (`admin_id`, `admin_name`, `admin_email`, `password`, `ec_salt`, `add_time`, `last_login`, `last_ip`, `nav_list`, `lang_type`, `agency_id`, `supplier_id`, `to_do_list`, `role_id`, `province_id`, `city_id`, `district_id`) VALUES
(1, 'admin', 'enoschan357@gmail.com', 'e15c691fcf5332704050a4458dfc1c30', NULL, 1528899063, 1529316500, '127.0.0.1', '', '', 0, 0, NULL, 1, 0, 0, 0),
(2, 'bjgonghuo1', 'bj@163.com', '519475228fe35ad067744465c42a19b2', NULL, 1245044099, 0, '', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit', '', 0, 0, '', 2, 0, 0, 0),
(3, 'shhaigonghuo1', 'shanghai@163.com', '4146fecce77907d264f6bd873f4ea27b', NULL, 1245044202, 0, '', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit', '', 0, 2, '', 2, 0, 0, 0),
(4, 'wyp001', 'wyp001@126.com', '519475228fe35ad067744465c42a19b2', NULL, 1456542538, 1486203678, '127.0.0.1', '', '', 0, 0, NULL, 2, 0, 0, 0),
(5, 'dengyunrui', 'dengyunrui@qq.com', '667ae4b6e626a668fd5e083cead7ef66', NULL, 1472610878, 1473055070, '183.14.137.252', '', '', 0, 0, NULL, 2, 0, 0, 0),
(6, 'tpshop', 'administrator@websiteaccounts.com', '2464e868553d5401bce3b481a9f9c1f9', NULL, 1472610878, 1486619732, '127.0.0.1', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit', '', 0, 2, NULL, 1, 0, 0, 0),
(7, '234567', '234567', '6536f192ad8c471edd14ba68d7c33f3a', NULL, 1486606034, 0, '', '', '', 0, 0, NULL, 2, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_admin`
--
ALTER TABLE `nze_admin`
 ADD PRIMARY KEY (`admin_id`), ADD KEY `admin_name` (`admin_name`) USING BTREE, ADD KEY `agency_id` (`agency_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_admin`
--
ALTER TABLE `nze_admin`
MODIFY `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
