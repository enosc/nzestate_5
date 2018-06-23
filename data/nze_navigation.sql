-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 03:27 PM
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
-- Table structure for table `nze_navigation`
--

CREATE TABLE IF NOT EXISTS `nze_navigation` (
`nav_id` int(11) NOT NULL COMMENT '前台导航表',
  `nav_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '导航名称',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `is_new` tinyint(1) DEFAULT '1' COMMENT '是否新窗口',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `nav_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '链接地址',
  `nav_position` enum('top','bottom') CHARACTER SET latin1 NOT NULL DEFAULT 'top' COMMENT '菜单位置，top顶部，bottom底部'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_navigation`
--

INSERT INTO `nze_navigation` (`nav_id`, `nav_name`, `is_show`, `is_new`, `sort_order`, `nav_url`, `nav_position`) VALUES
(1, '手机城', 1, 1, 99, '/index.php?m=Home&amp;c=Goods&amp;a=goodsList&amp;id=123', 'top'),
(2, '家电城', 1, 1, 97, '/index.php?m=Home&amp;c=Goods&amp;a=goodsList&amp;id=20', 'top'),
(3, '珠宝', 1, 1, 98, '/index.php?m=Home&amp;c=Goods&amp;a=goodsList&amp;id=51', 'top'),
(4, '促销商品', 1, 0, 96, '/index.php?m=Home&c=Activity&a=promoteList', 'top'),
(6, '预售', 1, 1, 95, '/index.php?m=Home&amp;c=Activity&amp;a=pre_sell_list', 'top'),
(8, '数码城', 1, 1, 94, '/index.php/Home/Goods/goodsList/id/1.html', 'top'),
(9, '团购', 1, 0, 0, '/index.php?m=Home&amp;c=Activity&amp;a=group_list', 'top'),
(10, '积分商城', 1, 0, 0, '/index.php?m=Home&amp;c=Goods&amp;a=integralMall', 'top');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_navigation`
--
ALTER TABLE `nze_navigation`
 ADD PRIMARY KEY (`nav_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_navigation`
--
ALTER TABLE `nze_navigation`
MODIFY `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前台导航表',AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
