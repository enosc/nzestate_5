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
-- Table structure for table `nze_coupon_list`
--

CREATE TABLE IF NOT EXISTS `nze_coupon_list` (
`list_id` int(8) NOT NULL COMMENT '表id',
  `coupon_id` int(8) NOT NULL DEFAULT '0' COMMENT '优惠券 对应coupon表id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放',
  `user_id` int(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int(8) NOT NULL DEFAULT '0' COMMENT '订单id',
  `get_order_id` int(11) DEFAULT '0' COMMENT '优惠券来自订单ID',
  `use_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `coupon_code` varchar(10) DEFAULT '' COMMENT '优惠券兑换码',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未使用1已使用2已过期'
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_coupon_list`
--

INSERT INTO `nze_coupon_list` (`list_id`, `coupon_id`, `type`, `user_id`, `order_id`, `get_order_id`, `use_time`, `coupon_code`, `send_time`, `status`) VALUES
(1, 2, 1, 1, 0, 0, 0, '', 0, 0),
(2, 2, 1, 1, 0, 0, 0, '', 0, 0),
(103, 11, 1, 24, 211, 0, 1463100569, '', 0, 0),
(105, 9, 1, 82, 269, 0, 1463912176, '', 1463826511, 0),
(106, 9, 1, 1, 0, 0, 0, '', 1464592518, 0),
(107, 2, 1, 1, 0, 0, 0, '', 1464593137, 0),
(108, 12, 4, 0, 0, 0, 0, 'GfmJsl9C', 1467110986, 0),
(109, 12, 4, 0, 0, 0, 0, 'Csgq29K1', 1467110986, 0),
(110, 12, 4, 0, 0, 0, 0, 'p3KayeiJ', 1467110986, 0),
(111, 12, 4, 0, 0, 0, 0, 'f1NDKt9p', 1467110986, 0),
(112, 9, 1, 1, 0, 0, 0, '', 1467111025, 0),
(113, 12, 4, 0, 0, 0, 0, 'MrjFcLim', 1467124712, 0),
(114, 12, 4, 0, 0, 0, 0, 'SxEs1B4B', 1467124712, 0),
(115, 12, 4, 0, 0, 0, 0, 'gPEf24ap', 1467124712, 0),
(116, 12, 4, 0, 0, 0, 0, '21v62h6D', 1467124712, 0),
(117, 12, 4, 0, 0, 0, 0, 'yghBTqQG', 1467124712, 0),
(118, 12, 4, 0, 0, 0, 0, 'PC8Fd2gk', 1467124712, 0),
(119, 12, 4, 0, 0, 0, 0, 'GLpyFqQx', 1467124712, 0),
(120, 12, 4, 0, 0, 0, 0, 'hiuaprDQ', 1467124712, 0),
(121, 12, 4, 0, 0, 0, 0, 'xMpoad4Q', 1467124712, 0),
(122, 12, 4, 0, 0, 0, 0, 'G2sKNy2r', 1467124712, 0),
(123, 12, 4, 0, 0, 0, 0, 'hiSPyDjF', 1467124712, 0),
(124, 12, 4, 0, 0, 0, 0, 'NDFb4iSs', 1467124712, 0),
(125, 12, 4, 0, 0, 0, 0, '2eG3hAHP', 1467124712, 0),
(126, 12, 4, 0, 0, 0, 0, 't8vexovE', 1467124712, 0),
(127, 12, 4, 0, 0, 0, 0, 'wlr3QAzA', 1467124712, 0),
(128, 12, 4, 0, 0, 0, 0, 'deB7nqqg', 1467124712, 0),
(129, 12, 4, 0, 0, 0, 0, 'u59CwGpE', 1467124712, 0),
(130, 12, 4, 0, 0, 0, 0, 'FL3b8oGv', 1467124712, 0),
(131, 12, 4, 0, 0, 0, 0, 'A6ooxQQA', 1467124712, 0),
(132, 12, 4, 0, 0, 0, 0, '2oygFQm9', 1467124712, 0),
(133, 12, 4, 0, 0, 0, 0, 'LmBf2S3x', 1467124712, 0),
(134, 12, 4, 0, 0, 0, 0, 'APzzbe3B', 1467124712, 0),
(135, 12, 4, 0, 0, 0, 0, 'bhSy5D7E', 1467124712, 0),
(136, 12, 4, 0, 0, 0, 0, '1v4wjhv2', 1467124712, 0),
(137, 12, 4, 0, 0, 0, 0, 't67lP1Km', 1467124712, 0),
(138, 12, 4, 0, 0, 0, 0, 'EhMGlEhm', 1467124712, 0),
(139, 12, 4, 0, 0, 0, 0, 'N6LJAJxr', 1467124712, 0),
(140, 12, 4, 0, 0, 0, 0, 'dsPmzif2', 1467124712, 0),
(141, 12, 4, 0, 0, 0, 0, 'fce14Pdy', 1467124712, 0),
(142, 12, 4, 0, 0, 0, 0, '3Eeftmse', 1467124712, 0),
(143, 12, 4, 0, 0, 0, 0, 'icPJLj9Q', 1467124712, 0),
(144, 12, 4, 0, 0, 0, 0, 'BP9a5f2a', 1467124712, 0),
(145, 12, 4, 0, 0, 0, 0, 'h71bL4AE', 1467124712, 0),
(146, 12, 4, 0, 0, 0, 0, 'LFLcTcg9', 1467124712, 0),
(147, 12, 4, 0, 0, 0, 0, 'e3JEcHCD', 1467124712, 0),
(148, 12, 4, 0, 0, 0, 0, 'uCEpHwpE', 1467124712, 0),
(149, 12, 4, 0, 0, 0, 0, 'tgTdbrJM', 1467124712, 0),
(150, 12, 4, 0, 0, 0, 0, '5rQPt4Py', 1467124712, 0),
(151, 12, 4, 0, 0, 0, 0, 'QumSbEtw', 1467124712, 0),
(152, 12, 4, 0, 0, 0, 0, 'q6M7taNP', 1467124712, 0),
(153, 12, 4, 0, 0, 0, 0, 'gDSi3y3S', 1467124712, 0),
(154, 12, 4, 0, 0, 0, 0, 'EHDiBpGo', 1467124712, 0),
(155, 12, 4, 0, 0, 0, 0, 'L2dNHxh7', 1467124712, 0),
(156, 12, 4, 0, 0, 0, 0, 't14N1Hy8', 1467124712, 0),
(157, 12, 4, 0, 0, 0, 0, 'kogdNa3B', 1467124712, 0),
(158, 12, 4, 0, 0, 0, 0, 'HwKhNpwv', 1467124712, 0),
(159, 12, 4, 0, 0, 0, 0, 'iAgE6nNp', 1467124712, 0),
(160, 12, 4, 0, 0, 0, 0, 'fHb7oA5y', 1467124712, 0),
(161, 12, 4, 0, 0, 0, 0, 'EcCAcvbK', 1467124712, 0),
(162, 12, 4, 0, 0, 0, 0, '1MTD9m7h', 1467124712, 0),
(163, 13, 4, 0, 0, 0, 0, '9LvBE2hH', 1467125321, 0),
(164, 13, 4, 0, 0, 0, 0, 'Q7sziLwj', 1467125321, 0),
(165, 13, 4, 0, 0, 0, 0, 'kfld7CFL', 1467125321, 0),
(166, 13, 4, 0, 0, 0, 0, 'udh1siHr', 1467125321, 0),
(167, 13, 4, 0, 0, 0, 0, '2b2x39eJ', 1467125321, 0),
(168, 13, 4, 0, 0, 0, 0, '7wgffDpq', 1467125321, 0),
(169, 13, 4, 0, 0, 0, 0, 'JAuGc8px', 1467125321, 0),
(170, 13, 4, 0, 0, 0, 0, 'cwovF5Py', 1467125321, 0),
(171, 13, 4, 0, 0, 0, 0, '6F5TE9yC', 1467125321, 0),
(172, 13, 4, 0, 0, 0, 0, 'vFJBh61E', 1467125321, 0),
(173, 14, 1, 1080, 0, 0, 0, '', 1469089053, 0),
(174, 14, 1, 1, 1417, 0, 1482990988, '', 1482990900, 0),
(175, 12, 4, 1, 0, 0, 0, '', 1482991261, 0),
(176, 12, 4, 24, 0, 0, 0, '', 1484467118, 0),
(177, 15, 1, 6062, 0, 0, 0, '', 1484807986, 0),
(178, 15, 1, 6061, 0, 0, 0, '', 1484807986, 0),
(179, 15, 1, 6059, 0, 0, 0, '', 1484808192, 0),
(180, 15, 1, 6058, 0, 0, 0, '', 1484808192, 0),
(181, 13, 4, 0, 0, 0, 0, '2EHdbBQJ', 1484810122, 0),
(182, 7, 0, 1, 0, 0, 0, '', 1484971045, 0),
(183, 7, 0, 1, 0, 0, 0, '', 1486699121, 0),
(184, 12, 4, 1, 0, 0, 0, '', 1490346431, 0),
(187, 18, 1, 2592, 0, 0, 0, '', 1500448470, 0),
(188, 20, 2, 3563, 0, 0, 0, '', 1509008252, 0),
(189, 20, 2, 1, 0, 0, 0, '', 1509938962, 0),
(190, 20, 2, 2864, 0, 0, 0, '', 1510120769, 0),
(191, 20, 2, 2865, 0, 0, 0, '', 1510121307, 0),
(192, 20, 2, 2866, 0, 0, 0, '', 1510121332, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_coupon_list`
--
ALTER TABLE `nze_coupon_list`
 ADD PRIMARY KEY (`list_id`), ADD KEY `coupon_id` (`coupon_id`), ADD KEY `user_id` (`user_id`), ADD KEY `coupon_code` (`coupon_code`), ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_coupon_list`
--
ALTER TABLE `nze_coupon_list`
MODIFY `list_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=193;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
