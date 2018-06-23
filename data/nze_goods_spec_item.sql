-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 04:44 PM
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
-- Table structure for table `nze_goods_spec_item`
--

CREATE TABLE IF NOT EXISTS `nze_goods_spec_item` (
`item_id` int(11) NOT NULL COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项'
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_goods_spec_item`
--

INSERT INTO `nze_goods_spec_item` (`item_id`, `spec_id`, `item`) VALUES
(1, 1, '红色'),
(3, 1, '绿色'),
(4, 2, 'S'),
(5, 2, 'M'),
(7, 4, '长袖'),
(8, 4, '短袖'),
(11, 5, '4G'),
(12, 5, '3G'),
(13, 6, '16G'),
(14, 6, '8G'),
(17, 1, '黄色'),
(18, 1, '蓝色'),
(21, 7, '触屏'),
(23, 7, '文字屏'),
(24, 3, '纯棉'),
(25, 3, '羽绒'),
(26, 3, '蝉丝'),
(28, 6, '32G'),
(29, 2, 'L2'),
(30, 8, '深圳'),
(31, 8, '广州'),
(32, 8, '河南'),
(35, 10, '联通'),
(36, 10, '移动'),
(37, 10, '电信'),
(38, 11, '双核'),
(39, 11, '4核'),
(40, 11, '8核'),
(41, 12, '7寸及以下'),
(42, 12, '7.8-9寸'),
(43, 12, '9-9.7寸'),
(44, 12, '10.1寸'),
(45, 12, '11.6寸及以上'),
(46, 12, '其它'),
(47, 13, '16G'),
(48, 13, '32G'),
(49, 13, '64G'),
(50, 13, '128G'),
(51, 14, '银白色'),
(52, 14, '黑色'),
(53, 15, '银色'),
(54, 15, '黑色'),
(55, 16, '黑色'),
(56, 16, '白色'),
(57, 16, '金色'),
(58, 17, '白色'),
(59, 17, '黑色'),
(60, 18, '白色'),
(61, 18, '黑色'),
(62, 19, '30'),
(63, 19, '32'),
(64, 19, '40'),
(65, 19, '42'),
(66, 19, '50'),
(67, 19, '55'),
(68, 19, '58'),
(69, 20, '20W'),
(70, 20, '22W'),
(71, 20, '24W'),
(72, 20, '26W'),
(73, 20, '28W'),
(74, 20, '30W'),
(75, 20, '36W'),
(76, 20, '72W'),
(77, 21, 'S'),
(78, 21, 'M'),
(79, 21, 'L'),
(80, 21, 'XL'),
(81, 21, 'XXL'),
(82, 22, 'S'),
(83, 22, 'M'),
(84, 22, 'L'),
(85, 22, 'XL'),
(86, 22, 'XXL'),
(87, 23, '70A'),
(88, 23, '70B'),
(89, 23, '70C'),
(90, 23, '75A'),
(91, 23, '75B'),
(92, 23, '75C'),
(93, 23, '80A'),
(94, 23, '80B'),
(95, 23, '80C'),
(96, 23, '85A'),
(97, 23, '85B'),
(98, 23, '85C'),
(99, 16, '银色'),
(100, 16, '玫瑰金'),
(101, 6, '64G'),
(102, 6, '128G'),
(103, 24, '土豪金'),
(104, 24, '象牙白'),
(105, 24, '宝石蓝'),
(106, 25, '乐享4G套餐59元'),
(107, 25, '乐享4G套餐79元'),
(108, 25, '乐享4G套餐99元'),
(109, 25, '乐享4G套餐129元'),
(110, 25, '乐享4G套餐169元'),
(111, 25, '乐享4G套餐199元'),
(112, 26, '微型卡'),
(113, 26, '普通卡');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_goods_spec_item`
--
ALTER TABLE `nze_goods_spec_item`
 ADD PRIMARY KEY (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_goods_spec_item`
--
ALTER TABLE `nze_goods_spec_item`
MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',AUTO_INCREMENT=114;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
