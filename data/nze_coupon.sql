-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 04:07 PM
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
-- Table structure for table `nze_coupon`
--

CREATE TABLE IF NOT EXISTS `nze_coupon` (
`coupon_id` int(8) NOT NULL COMMENT '表coupon_id',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名字',
  `coupon_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放',
  `coupon_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用条件',
  `create_num` int(11) DEFAULT '0' COMMENT '发放数量',
  `send_num` int(11) DEFAULT '0' COMMENT '已领取数量',
  `use_num` int(11) DEFAULT '0' COMMENT '已使用数量',
  `send_start_time` int(11) DEFAULT NULL COMMENT '发放开始时间',
  `send_end_time` int(11) DEFAULT NULL COMMENT '发放结束时间',
  `use_start_time` int(11) DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int(11) DEFAULT NULL COMMENT '使用结束时间',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` int(2) DEFAULT NULL COMMENT '状态：1有效,2无效',
  `use_coupon_type` tinyint(1) DEFAULT '0' COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_coupon`
--

INSERT INTO `nze_coupon` (`coupon_id`, `coupon_name`, `coupon_type`, `coupon_money`, `condition`, `create_num`, `send_num`, `use_num`, `send_start_time`, `send_end_time`, `use_start_time`, `use_end_time`, `add_time`, `status`, `use_coupon_type`) VALUES
(1, '注册优惠券', 2, '50.00', '200.00', 0, 0, 0, 1449840218, 1449842218, NULL, 1449843218, 1449840218, NULL, 0),
(2, '订单满100优惠券', 1, '20.00', '100.00', 11, 1, 0, 1449763200, 1449763200, -28800, 1484602082, 1449840218, NULL, 0),
(3, '按用户类型发放', 4, '30.00', '100.00', 0, 50, 0, 1449840218, 1449842218, NULL, 1449843218, 1449840218, NULL, 0),
(6, '5元券', 0, '5.00', '50.00', 1000, 0, 0, 1450022400, 1450281600, 1464710400, 1480435200, NULL, NULL, 0),
(7, '50代金券', 0, '50.00', '500.00', 100, 2, 0, 1450022400, 1450022400, 1464710400, 1477929600, NULL, NULL, 0),
(9, '订单满100送10元代金券', 1, '10.00', '100.00', 100, 23, 0, 1462204800, 1464796800, -28800, 1484602082, 1462155155, NULL, 0),
(10, '按用户发放优惠券', 4, '10.00', '100.00', 0, 0, 0, 1462204800, 1464796800, NULL, 1467388800, 1462155199, NULL, 0),
(11, '代金券10块', 0, '10.00', '100.00', 100, 0, 0, 1459958400, 1464796800, 1464710400, 1469894400, 1462178614, NULL, 0),
(12, '5元线下券', 4, '7.00', '50.00', 100, 57, 0, 1463846400, 1466438400, 1463846400, 1469030400, 1463826773, NULL, 0),
(13, '50元代金券', 4, '50.00', '150.00', 100, 11, 0, 1467129600, 1472659200, 1467129600, 1472659200, 1467124100, NULL, 0),
(14, 'TPshop代金券10元', 1, '10.00', '100.00', 10, 2, 1, 1469116800, 1471708800, 1469116800, 1857657600, 1469089041, NULL, 0),
(15, 'TPshop代金券10元', 1, '10.00', '100.00', 10, 5, 0, 1469116800, 1471708800, 1469116800, 1857657600, 1484797354, NULL, 0),
(18, '指定发放要过期', 1, '10.00', '20020.00', 20, 2, 0, 1500448180, 1503126581, 1500448183, 1505804947, 1500448190, 1, 0),
(19, '线下发放要过期', 3, '20.00', '200.00', 10, 0, 0, 1500448247, 1503126651, 1500534622, 1505805022, 1500448253, 1, 0),
(20, '九月九', 2, '50.00', '2000.00', 10000, 5, 0, 1509008132, 1511945732, 1509008132, 1514710532, 1509008166, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_coupon`
--
ALTER TABLE `nze_coupon`
 ADD PRIMARY KEY (`coupon_id`), ADD KEY `use_end_time` (`use_end_time`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_coupon`
--
ALTER TABLE `nze_coupon`
MODIFY `coupon_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表coupon_id',AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
