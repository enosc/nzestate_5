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
-- Table structure for table `nze_team_lottery`
--

CREATE TABLE IF NOT EXISTS `nze_team_lottery` (
`lottery_id` int(11) unsigned NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '幸运儿手机',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT '' COMMENT '幸运儿手机',
  `team_id` int(11) DEFAULT '0' COMMENT '拼团活动ID',
  `user_nickname` varchar(100) DEFAULT '' COMMENT '会员昵称',
  `user_avatar` varchar(150) DEFAULT '' COMMENT '幸运儿头像'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_team_lottery`
--
ALTER TABLE `nze_team_lottery`
 ADD PRIMARY KEY (`lottery_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_team_lottery`
--
ALTER TABLE `nze_team_lottery`
MODIFY `lottery_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
