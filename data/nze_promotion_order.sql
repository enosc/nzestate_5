-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 05:21 PM
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
-- Table structure for table `nze_promotion_order`
--

CREATE TABLE IF NOT EXISTS `nze_promotion_order` (
`promotion_id` bigint(20) NOT NULL,
  `promotion_name` varchar(60) NOT NULL DEFAULT '' COMMENT '活动名称',
  `promotion_type` int(2) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `money` float(10,2) DEFAULT '0.00' COMMENT '最小金额',
  `expression` varchar(100) DEFAULT NULL COMMENT '优惠体现',
  `promotion_desc` text COMMENT '活动描述',
  `start_time` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `is_close` tinyint(1) DEFAULT '0',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_promotion_order`
--

INSERT INTO `nze_promotion_order` (`promotion_id`, `promotion_name`, `promotion_type`, `money`, `expression`, `promotion_desc`, `start_time`, `end_time`, `is_close`, `group`) VALUES
(1, '订单满300送代金券30元', 3, 300.00, '12', '&lt;p&gt;订单满300送代金券30元&lt;br/&gt;&lt;/p&gt;', 1463760000, 1556640000, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_promotion_order`
--
ALTER TABLE `nze_promotion_order`
 ADD PRIMARY KEY (`promotion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_promotion_order`
--
ALTER TABLE `nze_promotion_order`
MODIFY `promotion_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
