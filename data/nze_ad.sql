-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2018 at 05:19 PM
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
-- Table structure for table `nze_ad`
--

CREATE TABLE IF NOT EXISTS `nze_ad` (
`ad_id` int(11) unsigned NOT NULL COMMENT '广告id',
  `position_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `ad_title` varchar(60) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_image` text NOT NULL COMMENT '图片地址',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `link_man` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `is_enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) DEFAULT NULL COMMENT '背景颜色'
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_ad`
--

INSERT INTO `nze_ad` (`ad_id`, `position_id`, `media_type`, `ad_title`, `ad_link`, `ad_image`, `start_time`, `end_time`, `link_man`, `link_email`, `link_phone`, `click_count`, `is_enabled`, `sort_order`, `target`, `bgcolor`) VALUES
(1, 1, 0, '无限惊喜', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571dafa754296.jpg', 1451577600, 1767715200, '', '', '', 0, 1, 50, 1, '#ffffff'),
(2, 1, 0, '无限惊喜', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/5b3261f64a247198d8c23a2d4bf3f8b7.jpg', 1451577600, 1864656000, '', '', '', 0, 1, 50, 1, NULL),
(3, 2, 0, '首页banner轮播1', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/43b1b124a21c6a42769117abd343be81.jpg', 1441123200, 1731513600, '', '', '', 0, 1, 50, 1, '#f6f6f6'),
(4, 2, 0, '首页banner轮播2', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/27236e6d014ff4d1070ff849a03e774f.jpg', 1443542400, 1601481600, '', '', '', 0, 1, 50, 1, '#0e1a43'),
(5, 3, 0, '客户下单赢4999元红包', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/650182d2eb12c7e3918922546e3046a8.jpg', 1451577600, 1832515200, '', '', '', 0, 1, 50, 1, '#000000'),
(6, 4, 0, 'TPshop视频教程', 'http://www.tp-shop.cn', '/public/upload/ad/2016/03-11/56e29344381c4.jpg', 1452614400, 1864137600, '', '', '', 0, 1, 50, 1, NULL),
(7, 5, 0, '荣耀畅玩5X优惠购买', 'http://www.tp-shop.cn', '/public/upload/ad/2016/03-11/56e29344381c4.jpg', 1451577600, 1863878400, '', '', '', 0, 1, 50, 1, NULL),
(8, 6, 0, '荣耀畅玩5X优惠购买', 'http://www.tp-shop.cn', '/public/upload/ad/2016/03-11/56e29344381c4.jpg', 1451577600, 1768147200, '', '', '', 0, 1, 50, 1, NULL),
(9, 7, 0, '荣耀4C增强版8GB变16GB', 'http://www.tp-shop.cn', '/public/upload/ad/2016/03-01/56d539e55544a.jpg', 1451577600, 1547049600, '', '', '', 0, 1, 50, 1, NULL),
(10, 8, 0, '依旧换新最高能低4428元', 'http://www.tp-shop.cn', '/public/upload/ad/2016/03-01/56d5391451968.jpg', 1451577600, 1546531200, '', '', '', 0, 1, 50, 1, NULL),
(11, 10, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/99488f3012772462383639c10eede529.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#d9006c'),
(12, 10, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-27/57ea1214a4bb8.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#fdfdca'),
(13, 10, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-27/57ea1234b3155.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#e41d63'),
(14, 15, 0, '箱包,珠宝', 'http://www.tp-shop.cn', '/public/upload/ad/2017/11-07/56fad0f916b87f97fc548227652de627.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#ffffff'),
(15, 15, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-23/571b80a8ab8d1.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#ffffff'),
(16, 11, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d89bd99535.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#fa2c60'),
(17, 11, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/ce541437e150a0e4ff8b174602962cf5.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 1, '#34b304'),
(18, 11, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d8b39793fb.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#9507b8'),
(19, 204, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d8d5860c91.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(20, 204, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d8d956510b.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(21, 201, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d93e4679da.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(22, 203, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d940194117.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(23, 100, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d9661339d6.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(24, 101, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d968285f75.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(25, 102, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d9698966f5.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(26, 99, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/04-25/571d9975e6e5f.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(27, 300, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/a57d01a0e3fe52cfe1f6e62205e098ce.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(28, 301, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/6cc541fbc5c36149c939284e9353fe51.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(29, 302, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/9c29fb3ff8231eddfa312d9b7ede856d.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(30, 303, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/ab53a0b6f69f6abc004a3cbda2447482.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(31, 304, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/1b4fce071f0626609d98b4a917dabc08.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(32, 305, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/5bff00097097c0862e2167983b6d5f23.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(33, 306, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/2ac6beb6282abff42f53a0430713ce84.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(34, 307, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/11a98af2bbbf3a159b5989afcc49265a.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(36, 309, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/07-03/57792a47d30c8.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(37, 309, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/07-03/57792a5f74d36.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(38, 400, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/07-03/57792b4ee20e3.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(39, 502, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d618d59ee5c.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#ff373d'),
(40, 502, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d6194ce4f2a.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#9210d8'),
(41, 503, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d6197b595a1.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#28bc03'),
(42, 511, 3, '男士洗面奶', '122', '/public/upload/ad/2017/11-06/b3132ff4f438882e2a9ad57363726e1a.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(43, 512, 4, '女士洗面奶', '1_12_100', '/public/upload/ad/2017/11-06/e65d9c129ee46358793be0069242bd35.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(44, 513, 3, '很漂亮的', '123', '/public/upload/ad/2017/11-06/f24b3ea77452f7d758c1b9944948c795.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(45, 514, 3, '用起来爽', '121', '/public/upload/ad/2017/11-06/1f28f1188126466bfd08d4d0e7986d08.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(46, 522, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d621ecbcc5e.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(47, 50011, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d6440cd154d.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#fd2848'),
(48, 5011, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d64497e6953.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#f8072c'),
(49, 5021, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d645374e8ea.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#a012f5'),
(50, 5012, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d64576130c1.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(51, 5013, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d6459bc4dbe.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(52, 5022, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d645b225205.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(53, 5023, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d645cd48344.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(54, 5111, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d645ec27e00.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(55, 5114, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d6460060058.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(56, 5124, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d64616d745c.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(57, 51312, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-12/57d64661cd041.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(58, 53, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/8ef6780ae11a771bae7a18e4b7f7f26a.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(59, 56, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-14/57d8cb20146e4.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(60, 60, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2016/09-14/57d8cb3c50d00.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(61, 2, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/2d4fac0fcdf7025722ea0f14a2b7b59c.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#622075'),
(62, 52, 0, '自定义广告名称', 'http://www.tp-shop.cn/', '/public/upload/ad/2017/08-26/5ef1c1051da19d4a5ae32dc9463fd397.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(63, 52, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/065d485ed0988f5d087521b2cf0b3760.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(64, 53, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/a5029f75c12b2abe25e06910f105f27a.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(65, 53, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/8e173c51d5d7589b43258d09c9bd2078.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(66, 12, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/13cab56b9c1214bbff54208884e54713.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(67, 13, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/05-20/b2c6cdbcb6e1e83febabeec75ffdd94f.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(68, 51, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/b06ed7e423787cc91b0f31e15ca52a10.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#000000'),
(69, 2, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/fa802d856d9948dcd35c0d950eef2e59.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#2d77c1'),
(70, 2, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/573e4eec7dcbc0de46f822d382c26c9e.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 1, '#36aee2'),
(71, 14, 0, '自定义广告名称', 'http://www.tp-shop.cn/', '/public/upload/ad/2017/11-07/6ce2bad9eb9b362c52e2ab9e1bff2840.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(72, 9, 0, '自定义广告名称', 'http://www.tp-shop.cn/', '/public/upload/ad/2017/05-22/d6a9ae319ce035d6d951ecb09eeb1185.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(73, 9, 0, '自定义广告名称', '', '/public/upload/ad/2017/05-20/d4dff2e69fc808175a0babf32b31dece.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(74, 9, 0, '自定义广告名称', '', '/public/upload/ad/2017/05-20/e0f16fcdc9da9721a169be6acb379864.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(75, 50, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/8a4b9f0be773f3f07f02c20da11393d2.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(76, 50, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/695a2fb821de7a4792ad7c8b9723c334.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(77, 50, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/6c7a648ff3b5a77a7827d26d24c4e074.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(78, 20, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/627e74080bfc0d2e1354c2ee2afa1c21.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(79, 21, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/7d58d7ff43d01a01d5b2b401a5c68686.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(80, 22, 0, '自定义广告名称', 'http://www.tp-shop.cn', '/public/upload/ad/2017/08-26/216d820148cb7a6ee9f44137c1148f11.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(81, 49, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2017/05-20/82811b2eccedab5fad8f64b966ee6996.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(82, 500, 3, '自定义广告名称', '', '/public/upload/ad/2017/10-31/f9025d55b5b885b95ca57c535252e324.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(83, 500, 3, '自定义广告名称', '', '/public/upload/ad/2017/10-31/097edac77e73aa27518765e076261d4f.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(84, 500, 3, '自定义广告名称', '', '/public/upload/ad/2017/10-31/5bc4adcc7a415aa6c53edd981a23ae8f.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(85, 506, 3, '自定义广告名称', '143', '/public/upload/ad/2017/11-06/47935bbeb8543648bd2717f5aa21708a.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(86, 507, 3, '自定义广告名称', '131', '/public/upload/ad/2017/11-06/4ac29748f277398068199cea1f9d6c79.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(87, 508, 3, '自定义广告名称', '130', '/public/upload/ad/2017/11-06/91f440403562753c52f9dce09e9ee802.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(88, 509, 3, '自定义广告名称', '129', '/public/upload/ad/2017/11-06/ec4f4009477d9d83f2b0d1b0722648af.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(89, 510, 3, '自定义广告名称', '127', '/public/upload/ad/2017/11-06/43341c745d7230ad6c929265b57355d0.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(90, 515, 3, '自定义广告名称', '120', '/public/upload/ad/2017/11-06/26bafea6919b893c3eceb197639aa468.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(91, 516, 3, '自定义广告名称', '117', '/public/upload/ad/2017/11-06/22b79b97e50705acbbe4bf39ab0500eb.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(92, 517, 3, '自定义广告名称', '116', '/public/upload/ad/2017/11-06/5b37d9c57e684abfe31ec9a6793c8b1d.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(93, 518, 3, '自定义广告名称', '116', '/public/upload/ad/2017/11-06/d96778f275ed8bd1a3110ff287cf18da.png', 1451577600, 1546272000, '', '', '', 0, 1, 50, 0, NULL),
(94, 32, 0, '自定义广告名称', '', '/public/upload/ad/2017/11-06/cd83f60d002d810e5222de3bdf3c3c37.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(95, 32, 0, '自定义广告名称', 'http://apispec.tp-shop.cn/Mobile/Goods/goodsInfo/id/116.html', '/public/upload/ad/2017/11-06/415af054f8b4d4a05733097ff1838ba2.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(96, 32, 0, '自定义广告名称', 'http://apispec.tp-shop.cn/Mobile/Goods/goodsInfo/id/116.html', '/public/upload/ad/2017/11-06/f572c911e6571d2c61e3844cc486ba18.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(97, 304, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/dcf248bb04c5a44fa962203669af1a94.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(98, 307, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/743aea6a53247c85934454badc431b87.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(99, 307, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/990caaf89f94ec247f4b0dffdb59e4e0.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(100, 307, 0, '自定义广告名称', 'javascript:void(0);', '/public/upload/ad/2018/03-29/902ad48cbb215372cc6f67d5af61b05c.png', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(101, 23, 0, '自定义广告名称', '', '/public/upload/ad/2017/11-07/a74d3e0a61047cefb96694d4a3d61700.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(102, 24, 0, '自定义广告名称', '', '/public/upload/ad/2017/11-07/1e8e439546e88569655038af7f03cd4b.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(103, 25, 0, '自定义广告名称', '', '/public/upload/ad/2017/11-07/a75d46b60232aa616fdc329a4814c3b0.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(104, 16, 0, '自定义广告名称', '', '/public/upload/ad/2017/11-08/7d77526328760636a69b24c072f98637.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000'),
(105, 26, 0, '自定义广告名称', '', '/public/upload/ad/2017/11-08/d44d92301ad36da5eb6125abe562b0e4.jpg', 1451577600, 1546272000, '', '', '', 0, 1, 0, 0, '#000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_ad`
--
ALTER TABLE `nze_ad`
 ADD PRIMARY KEY (`ad_id`), ADD KEY `is_enabled` (`is_enabled`), ADD KEY `position_id` (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_ad`
--
ALTER TABLE `nze_ad`
MODIFY `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',AUTO_INCREMENT=106;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
