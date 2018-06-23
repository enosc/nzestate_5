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
-- Table structure for table `nze_team_found`
--

CREATE TABLE IF NOT EXISTS `nze_team_found` (
`found_id` int(10) unsigned NOT NULL,
  `found_time` int(11) DEFAULT '0' COMMENT '开团时间',
  `end_time` int(11) DEFAULT '0' COMMENT '成团截止时间',
  `user_id` int(11) DEFAULT '0' COMMENT '团长id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团活动id',
  `user_nickname` varchar(100) DEFAULT NULL COMMENT '团长用户名昵称',
  `user_avatar` varchar(100) DEFAULT '' COMMENT '团长头像',
  `order_id` int(11) DEFAULT '0' COMMENT '团长订单id',
  `join_num` int(8) DEFAULT '1' COMMENT '已参团人数',
  `need_num` int(8) DEFAULT '1' COMMENT '需多少人成团',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '拼团价格',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品原价',
  `status` tinyint(1) DEFAULT '0' COMMENT '拼团状态0:待开团(表示已下单但是未支付)1:已经开团(团长已支付)2:拼团成功,3拼团失败',
  `bonus_status` tinyint(1) DEFAULT '0' COMMENT '团长佣金领取状态：0无1领取'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开团表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_team_found`
--
ALTER TABLE `nze_team_found`
 ADD PRIMARY KEY (`found_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_team_found`
--
ALTER TABLE `nze_team_found`
MODIFY `found_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
