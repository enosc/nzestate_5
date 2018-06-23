-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 01:21 PM
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
-- Table structure for table `nze_ad_position`
--

CREATE TABLE IF NOT EXISTS `nze_ad_position` (
`position_id` int(3) unsigned NOT NULL COMMENT '表id',
  `position_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `position_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '广告描述',
  `position_style` text COMMENT '模板',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '0关闭1开启'
) ENGINE=InnoDB AUTO_INCREMENT=5137 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_ad_position`
--

INSERT INTO `nze_ad_position` (`position_id`, `position_name`, `ad_width`, `ad_height`, `position_desc`, `position_style`, `is_open`) VALUES
(1, '首页最顶部大块广告', 1200, 400, '首页顶部的广告位刚打开时弹出来过一会自动缩回去.', '', 0),
(2, '首页banner广告轮播980*400', 980, 400, '首页banner广告轮播980*400', '', 0),
(3, '首页中间1200*160广告条', 1200, 160, '', '', 0),
(4, '首页底部1200*160广告条', 1200, 160, '首页底部的广告位', '', 0),
(5, '团购页面底部广告1200*160', 1200, 160, '团购页面底部广告1200*160', '', 0),
(6, '促销商品底部广告1200*160', 1200, 160, '团购页面底部广告1200*160', '', 0),
(7, '首页公告上方广告位', 270, 310, '首页公告上方的广告位位置', '', 0),
(8, '首页公告下方广告位', 278, 312, '首页公告下方广告位', '', 0),
(9, 'User页面自动增加广告位 9 ', 0, 0, 'User页面', '', 1),
(10, 'Index页面自动增加广告位 10 ', 0, 0, 'Index页面', '', 1),
(11, 'Channel页面自动增加广告位 11 ', 0, 0, 'Channel页面', '', 1),
(12, 'Index页面自动增加广告位 12 ', 0, 0, 'Index页面', NULL, 1),
(13, 'Index页面自动增加广告位 13 ', 0, 0, 'Index页面', NULL, 1),
(14, 'Index页面自动增加广告位 14 ', 0, 0, 'Index页面', NULL, 1),
(15, 'Index页面自动增加广告位 15 ', 0, 0, 'Index页面', '', 1),
(16, 'Index页面自动增加广告位 16 ', 0, 0, 'Index页面', NULL, 1),
(17, 'Index页面自动增加广告位 17 ', 0, 0, 'Index页面', NULL, 1),
(18, 'Index页面自动增加广告位 18 ', 0, 0, 'Index页面', NULL, 1),
(19, 'Index页面自动增加广告位 19 ', 0, 0, 'Index页面', NULL, 1),
(20, 'Index页面自动增加广告位 20 ', 0, 0, 'Index页面', NULL, 1),
(21, 'Index页面自动增加广告位 21 ', 0, 0, 'Index页面', NULL, 1),
(22, 'Index页面自动增加广告位 22 ', 0, 0, 'Index页面', NULL, 1),
(23, 'Index页面自动增加广告位 23 ', 0, 0, 'Index页面', NULL, 1),
(24, 'Index页面自动增加广告位 24 ', 0, 0, 'Index页面', NULL, 1),
(25, 'Index页面自动增加广告位 25 ', 0, 0, 'Index页面', NULL, 1),
(26, 'Index页面自动增加广告位 26 ', 0, 0, 'Index页面', NULL, 1),
(27, 'Index页面自动增加广告位 27 ', 0, 0, 'Index页面', NULL, 1),
(28, 'Index页面自动增加广告位 28 ', 0, 0, 'Index页面', NULL, 1),
(32, 'Index页面自动增加广告位 32 ', 0, 0, 'Index页面', NULL, 1),
(49, 'Index页面自动增加广告位 49 ', 0, 0, 'Index页面', NULL, 1),
(50, 'Index页面自动增加广告位 50 ', 0, 0, 'Index页面', '', 1),
(51, 'Index页面自动增加广告位 51 ', 0, 0, 'Index页面', '', 1),
(52, 'Index页面自动增加广告位 52 ', 0, 0, 'Index页面', '', 1),
(53, 'Index页面自动增加广告位 53 ', 0, 0, 'Index页面', '', 1),
(54, 'Index页面自动增加广告位 54 ', 0, 0, 'Index页面', '', 1),
(55, 'Index页面自动增加广告位 55 ', 0, 0, 'Index页面', '', 1),
(56, 'Index页面自动增加广告位 56 ', 0, 0, 'Index页面', '', 1),
(57, 'Index页面自动增加广告位 57 ', 0, 0, 'Index页面', '', 1),
(58, 'Index页面自动增加广告位 58 ', 0, 0, 'Index页面', '', 1),
(59, 'Index页面自动增加广告位 59 ', 0, 0, 'Index页面', '', 1),
(60, 'Index页面自动增加广告位 60 ', 0, 0, 'Index页面', '', 1),
(61, 'Index页面自动增加广告位 61 ', 0, 0, 'Index页面', '', 1),
(70, 'Index页面自动增加广告位 70 ', 0, 0, 'Index页面', '', 1),
(71, 'Index页面自动增加广告位 71 ', 0, 0, 'Index页面', '', 1),
(72, 'Index页面自动增加广告位 72 ', 0, 0, 'Index页面', '', 1),
(81, 'Index页面自动增加广告位 81 ', 0, 0, 'Index页面', '', 1),
(82, 'Index页面自动增加广告位 82 ', 0, 0, 'Index页面', '', 1),
(83, 'Index页面自动增加广告位 83 ', 0, 0, 'Index页面', '', 1),
(84, 'Index页面自动增加广告位 84 ', 0, 0, 'Index页面', '', 1),
(85, 'Index页面自动增加广告位 85 ', 0, 0, 'Index页面', '', 1),
(86, 'Index页面自动增加广告位 86 ', 0, 0, 'Index页面', '', 1),
(87, 'Index页面自动增加广告位 87 ', 0, 0, 'Index页面', '', 1),
(99, 'Index页面自动增加广告位 99 ', 0, 0, 'Index页面', '', 1),
(100, 'Index页面自动增加广告位 100 ', 0, 0, 'Index页面', '', 1),
(101, 'Index页面自动增加广告位 101 ', 0, 0, 'Index页面', '', 1),
(102, 'Index页面自动增加广告位 102 ', 0, 0, 'Index页面', '', 1),
(200, 'Channel页面自动增加广告位 200 ', 0, 0, 'Channel页面', '', 1),
(201, 'Channel页面自动增加广告位 201 ', 0, 0, 'Channel页面', '', 1),
(203, 'Channel页面自动增加广告位 203 ', 0, 0, 'Channel页面', '', 1),
(204, 'Channel页面自动增加广告位 204 ', 0, 0, 'Channel页面', '', 1),
(205, 'Channel页面自动增加广告位 205 ', 0, 0, 'Channel页面', '', 1),
(206, 'Channel页面自动增加广告位 206 ', 0, 0, 'Channel页面', '', 1),
(207, 'Channel页面自动增加广告位 207 ', 0, 0, 'Channel页面', '', 1),
(208, 'Activity页面自动增加广告位 208 ', 0, 0, 'Activity页面', NULL, 1),
(209, 'Channel页面自动增加广告位 209 ', 0, 0, 'Channel页面', '', 1),
(210, 'Channel页面自动增加广告位 210 ', 0, 0, 'Channel页面', '', 1),
(211, 'Channel页面自动增加广告位 211 ', 0, 0, 'Channel页面', '', 1),
(212, 'Channel页面自动增加广告位 212 ', 0, 0, 'Channel页面', '', 1),
(213, 'Channel页面自动增加广告位 213 ', 0, 0, 'Channel页面', '', 1),
(214, 'Channel页面自动增加广告位 214 ', 0, 0, 'Channel页面', '', 1),
(216, 'Channel页面自动增加广告位 216 ', 0, 0, 'Channel页面', '', 1),
(221, 'Channel页面自动增加广告位 221 ', 0, 0, 'Channel页面', '', 1),
(227, 'Channel页面自动增加广告位 227 ', 0, 0, 'Channel页面', '', 1),
(232, 'Channel页面自动增加广告位 232 ', 0, 0, 'Channel页面', '', 1),
(255, 'Index页面自动增加广告位 800 ', 0, 0, 'Index页面', '', 1),
(300, 'Index页面自动增加广告位 300 ', 0, 0, 'Index页面', '', 1),
(301, 'Index页面自动增加广告位 301 ', 0, 0, 'Index页面', '', 1),
(302, 'Index页面自动增加广告位 302 ', 0, 0, 'Index页面', '', 1),
(303, 'Index页面自动增加广告位 303 ', 0, 0, 'Index页面', '', 1),
(304, 'Index页面自动增加广告位 304 ', 0, 0, 'Index页面', '', 1),
(305, 'Index页面自动增加广告位 305 ', 0, 0, 'Index页面', '', 1),
(306, 'Index页面自动增加广告位 306 ', 0, 0, 'Index页面', '', 1),
(307, 'Index页面自动增加广告位 307 ', 0, 0, 'Index页面', '', 1),
(308, 'Index页面自动增加广告位 308 ', 0, 0, 'Index页面', '', 1),
(309, 'Index页面自动增加广告位 309 ', 0, 0, 'Index页面', '', 1),
(400, 'Goods页面自动增加广告位 400 ', 0, 0, 'Goods页面', '', 1),
(401, 'Goods页面自动增加广告位 401 ', 0, 0, 'Goods页面', NULL, 1),
(500, 'Ad页面自动增加广告位 500 ', 0, 0, 'Ad页面', NULL, 1),
(502, 'Channel页面自动增加广告位 502 ', 0, 0, 'Channel页面', '', 1),
(503, 'Channel页面自动增加广告位 503 ', 0, 0, 'Channel页面', '', 1),
(506, 'Ad页面自动增加广告位 506 ', 0, 0, 'Ad页面', NULL, 1),
(507, 'Ad页面自动增加广告位 507 ', 0, 0, 'Ad页面', NULL, 1),
(508, 'Ad页面自动增加广告位 508 ', 0, 0, 'Ad页面', NULL, 1),
(509, 'Ad页面自动增加广告位 509 ', 0, 0, 'Ad页面', NULL, 1),
(510, 'Ad页面自动增加广告位 510 ', 0, 0, 'Ad页面', NULL, 1),
(511, 'Channel页面自动增加广告位 511 ', 0, 0, 'Channel页面', '', 1),
(512, 'Channel页面自动增加广告位 512 ', 0, 0, 'Channel页面', '', 1),
(513, 'Channel页面自动增加广告位 513 ', 0, 0, 'Channel页面', '', 1),
(514, 'Channel页面自动增加广告位 514 ', 0, 0, 'Channel页面', '', 1),
(515, 'Ad页面自动增加广告位 515 ', 0, 0, 'Ad页面', NULL, 1),
(516, 'Ad页面自动增加广告位 516 ', 0, 0, 'Ad页面', NULL, 1),
(517, 'Ad页面自动增加广告位 517 ', 0, 0, 'Ad页面', NULL, 1),
(518, 'Ad页面自动增加广告位 518 ', 0, 0, 'Ad页面', NULL, 1),
(522, 'Channel页面自动增加广告位 522 ', 0, 0, 'Channel页面', '', 1),
(854, 'Index页面自动增加广告位 854 ', 0, 0, 'Index页面', NULL, 1),
(5011, 'Channel页面自动增加广告位 5011 ', 0, 0, 'Channel页面', '', 1),
(5012, 'Channel页面自动增加广告位 5012 ', 0, 0, 'Channel页面', '', 1),
(5013, 'Channel页面自动增加广告位 5013 ', 0, 0, 'Channel页面', '', 1),
(5014, 'Channel页面自动增加广告位 5014 ', 0, 0, 'Channel页面', '', 1),
(5015, 'Channel页面自动增加广告位 5015 ', 0, 0, 'Channel页面', '', 1),
(5021, 'Channel页面自动增加广告位 5021 ', 0, 0, 'Channel页面', '', 1),
(5022, 'Channel页面自动增加广告位 5022 ', 0, 0, 'Channel页面', '', 1),
(5023, 'Channel页面自动增加广告位 5023 ', 0, 0, 'Channel页面', '', 1),
(5024, 'Channel页面自动增加广告位 5024 ', 0, 0, 'Channel页面', '', 1),
(5025, 'Channel页面自动增加广告位 5025 ', 0, 0, 'Channel页面', '', 1),
(5031, 'Channel页面自动增加广告位 5031 ', 0, 0, 'Channel页面', '', 1),
(5032, 'Channel页面自动增加广告位 5032 ', 0, 0, 'Channel页面', '', 1),
(5033, 'Channel页面自动增加广告位 5033 ', 0, 0, 'Channel页面', '', 1),
(5034, 'Channel页面自动增加广告位 5034 ', 0, 0, 'Channel页面', '', 1),
(5035, 'Channel页面自动增加广告位 5035 ', 0, 0, 'Channel页面', '', 1),
(5111, 'Channel页面自动增加广告位 5111 ', 0, 0, 'Channel页面', '', 1),
(5113, 'Channel页面自动增加广告位 5113 ', 0, 0, 'Channel页面', '', 1),
(5114, 'Channel页面自动增加广告位 5114 ', 0, 0, 'Channel页面', '', 1),
(5123, 'Channel页面自动增加广告位 5123 ', 0, 0, 'Channel页面', '', 1),
(5124, 'Channel页面自动增加广告位 5124 ', 0, 0, 'Channel页面', '', 1),
(5136, 'Channel页面自动增加广告位 5136 ', 0, 0, 'Channel页面', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_ad_position`
--
ALTER TABLE `nze_ad_position`
 ADD PRIMARY KEY (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_ad_position`
--
ALTER TABLE `nze_ad_position`
MODIFY `position_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=5137;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
