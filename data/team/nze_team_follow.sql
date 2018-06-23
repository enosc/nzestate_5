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
-- Table structure for table `nze_team_follow`
--

CREATE TABLE IF NOT EXISTS `nze_team_follow` (
`follow_id` int(11) unsigned NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '参团会员id',
  `user_nickname` varchar(100) DEFAULT NULL COMMENT '参团会员昵称',
  `user_avatar` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `follow_time` int(11) DEFAULT '0' COMMENT '参团时间',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `found_id` int(10) DEFAULT '0' COMMENT '开团ID',
  `found_user_id` int(11) DEFAULT '0' COMMENT '开团人user_id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团活动id',
  `status` tinyint(1) DEFAULT '0' COMMENT '参团状态0:待拼单(表示已下单但是未支付)1拼单成功(已支付)2成团成功3成团失败',
  `is_win` tinyint(1) DEFAULT '0' COMMENT '抽奖团是否中奖'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参团表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_team_follow`
--
ALTER TABLE `nze_team_follow`
 ADD PRIMARY KEY (`follow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_team_follow`
--
ALTER TABLE `nze_team_follow`
MODIFY `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
