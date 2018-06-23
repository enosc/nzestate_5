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
-- Table structure for table `nze_admin_role`
--

CREATE TABLE IF NOT EXISTS `nze_admin_role` (
`role_id` smallint(6) unsigned NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `act_list` text COMMENT '权限列表',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_admin_role`
--

INSERT INTO `nze_admin_role` (`role_id`, `role_name`, `act_list`, `role_desc`) VALUES
(1, '超级管理员', 'all', '管理全站'),
(2, '编辑', '3,4,22,23,48,52,31,45,49,61,14,18,19,20,21,50,24,25,26,41,53,27,28,29,30,32,33,34,35,46,47', '违法接口'),
(4, '客服', '', '客服处理订单发货'),
(5, '仓管员', '', '仓管员'),
(6, '仓管员', '11,12,13,14', '仓管员');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_admin_role`
--
ALTER TABLE `nze_admin_role`
 ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_admin_role`
--
ALTER TABLE `nze_admin_role`
MODIFY `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
