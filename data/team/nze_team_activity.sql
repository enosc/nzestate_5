-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 06:23 PM
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
-- Table structure for table `nze_team_activity`
--

CREATE TABLE IF NOT EXISTS `nze_team_activity` (
`team_id` int(10) NOT NULL,
  `term_name` varchar(255) DEFAULT '' COMMENT '拼团活动标题',
  `team_type` tinyint(1) DEFAULT '0' COMMENT '拼团活动类型,0分享团1佣金团2抽奖团',
  `time_limit` int(11) DEFAULT '0' COMMENT '成团有效期。单位（秒)',
  `team_price` decimal(10,2) DEFAULT '0.00' COMMENT '拼团价',
  `need_num` int(10) DEFAULT '2' COMMENT '需要成团人数',
  `goods_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `item_id` int(10) DEFAULT '0' COMMENT '商品规格id',
  `bonus` decimal(10,2) DEFAULT '0.00' COMMENT '团长佣金',
  `stock_limit` int(11) DEFAULT '0' COMMENT '抽奖限量',
  `buy_limit` smallint(4) DEFAULT '0' COMMENT '单次团购买限制数0为不限制',
  `sales_sum` int(10) unsigned DEFAULT '0' COMMENT '已拼多少件',
  `virtual_num` int(10) DEFAULT '0' COMMENT '虚拟销售基数',
  `share_title` varchar(100) DEFAULT NULL COMMENT '分享标题',
  `share_desc` varchar(255) DEFAULT NULL COMMENT '分享描述',
  `share_img` varchar(150) DEFAULT NULL COMMENT '分享图片',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(1) DEFAULT '0' COMMENT '0关闭1正常',
  `is_lottery` tinyint(1) DEFAULT '0' COMMENT '是否已经抽奖.1是，0否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团活动表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_team_activity`
--
ALTER TABLE `nze_team_activity`
 ADD PRIMARY KEY (`team_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_team_activity`
--
ALTER TABLE `nze_team_activity`
MODIFY `team_id` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
