-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 04:43 PM
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
-- Table structure for table `nze_goods_spec`
--

CREATE TABLE IF NOT EXISTS `nze_goods_spec` (
`spec_id` int(11) NOT NULL COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `spec_name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `sort_order` int(11) DEFAULT '50' COMMENT '排序',
  `search_index` tinyint(1) DEFAULT '1' COMMENT '是否需要检索：1是，0否'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_goods_spec`
--

INSERT INTO `nze_goods_spec` (`spec_id`, `type_id`, `spec_name`, `sort_order`, `search_index`) VALUES
(1, 13, '颜色2', 502, 2),
(2, 13, '尺码', 50, 0),
(3, 13, '布料', 50, 0),
(4, 13, '袖子', 50, 0),
(5, 4, '网络', 50, 0),
(6, 4, '内存', 50, 0),
(7, 4, '屏幕', 50, 1),
(8, 13, '产地', 0, 0),
(10, 9, '卡号', 50, 0),
(11, 9, 'CPU', 50, 0),
(12, 15, '尺寸', 50, 0),
(13, 15, '内存', 50, 0),
(14, 15, '颜色', 50, 0),
(15, 9, '颜色', 50, 0),
(16, 4, '颜色', 50, 0),
(17, 16, '颜色', 50, 0),
(18, 17, '颜色', 50, 1),
(19, 18, '尺寸', 50, 0),
(20, 20, '选择瓦数', 50, 1),
(21, 24, '尺码', 50, 1),
(22, 25, '尺码', 50, 1),
(23, 26, '尺码', 50, 1),
(24, 31, '颜色', 50, 1),
(25, 33, '合约套餐', 50, 1),
(26, 33, '套餐', 50, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_goods_spec`
--
ALTER TABLE `nze_goods_spec`
 ADD PRIMARY KEY (`spec_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_goods_spec`
--
ALTER TABLE `nze_goods_spec`
MODIFY `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
