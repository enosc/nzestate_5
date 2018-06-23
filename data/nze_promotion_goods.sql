-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 05:18 PM
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
-- Table structure for table `nze_promotion_goods`
--

CREATE TABLE IF NOT EXISTS `nze_promotion_goods` (
`promotion_id` bigint(20) NOT NULL COMMENT '活动ID',
  `promotion_name` varchar(60) NOT NULL DEFAULT '' COMMENT '促销活动名称',
  `promotion_type` int(2) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `expression` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠体现',
  `promotion_desc` text COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  `promotion_img` varchar(150) DEFAULT NULL COMMENT '活动宣传图片',
  `buy_limit` int(10) DEFAULT NULL COMMENT '每人限购数'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_promotion_goods`
--

INSERT INTO `nze_promotion_goods` (`promotion_id`, `promotion_name`, `promotion_type`, `expression`, `promotion_desc`, `start_time`, `end_time`, `is_end`, `group`, `promotion_img`, `buy_limit`) VALUES
(1, '', 0, '90', '<p>东方航空建国后路口东风路工行卡</p>', 1471968000, 1603555200, 0, '', '/public/upload/activity/2017/05-20/82de9cc854941e6db25501554c090650.jpg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_promotion_goods`
--
ALTER TABLE `nze_promotion_goods`
 ADD PRIMARY KEY (`promotion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_promotion_goods`
--
ALTER TABLE `nze_promotion_goods`
MODIFY `promotion_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
