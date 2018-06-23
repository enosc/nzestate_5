-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 01:36 PM
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
-- Table structure for table `nze_cart`
--

CREATE TABLE IF NOT EXISTS `nze_cart` (
`cart_id` int(8) unsigned NOT NULL COMMENT '购物车表',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `user_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint(5) unsigned DEFAULT '0' COMMENT '购买数量',
  `spec_key` varchar(64) DEFAULT '' COMMENT '商品规格key 对应nze_spec_goods_price 表',
  `spec_key_name` varchar(64) DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `promotion_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `promotion_id` int(11) DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_cart`
--

INSERT INTO `nze_cart` (`cart_id`, `user_id`, `session_id`, `goods_id`, `goods_sn`, `goods_name`, `market_price`, `goods_price`, `user_goods_price`, `goods_num`, `spec_key`, `spec_key_name`, `bar_code`, `selected`, `add_time`, `promotion_type`, `promotion_id`, `sku`) VALUES
(8, 2867, '4n3clot1coop954o5945pmtv57', 140, 'TP0000140', 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', '4958.00', '6000.00', '6000.00', 1, '11_13_100', '网络:4G 内存:16G 颜色:玫瑰金', '', 1, 1528905693, 0, 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_cart`
--
ALTER TABLE `nze_cart`
 ADD PRIMARY KEY (`cart_id`), ADD KEY `session_id` (`session_id`), ADD KEY `user_id` (`user_id`), ADD KEY `goods_id` (`goods_id`), ADD KEY `spec_key` (`spec_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_cart`
--
ALTER TABLE `nze_cart`
MODIFY `cart_id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
