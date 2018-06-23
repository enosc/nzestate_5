-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 01:29 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nzestate_tp_5_020`
--

-- --------------------------------------------------------

--
-- Table structure for table `nze_user_level`
--

CREATE TABLE IF NOT EXISTS `nze_user_level` (
`level_id` smallint(4) unsigned NOT NULL COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `user_discount` smallint(4) DEFAULT '0' COMMENT '折扣',
  `describe` varchar(200) DEFAULT NULL COMMENT '头街 描述'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_user_level`
--

INSERT INTO `nze_user_level` (`level_id`, `level_name`, `amount`, `user_discount`, `describe`) VALUES
(1, '注册会员', '0.00', 100, '注册会员'),
(2, '铜牌会员', '10000.00', 98, '铜牌会员'),
(3, '白银会员', '30000.00', 95, '白银会员'),
(4, '黄金会员', '50000.00', 92, '黄金会员'),
(5, '钻石会员', '100000.00', 90, '钻石会员'),
(6, '超级VIP', '200000.00', 88, '超级VIP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_user_level`
--
ALTER TABLE `nze_user_level`
 ADD PRIMARY KEY (`level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_user_level`
--
ALTER TABLE `nze_user_level`
MODIFY `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
