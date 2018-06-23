-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 06:17 PM
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
-- Table structure for table `nze_group_buy`
--

CREATE TABLE IF NOT EXISTS `nze_group_buy` (
`groupbuy_id` int(10) unsigned NOT NULL COMMENT '团购ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` bigint(20) DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `goods_num` int(10) DEFAULT '0' COMMENT '商品参团数',
  `buy_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品已购买数',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已下单人数',
  `virtual_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟购买数',
  `rebate` decimal(10,1) NOT NULL COMMENT '折扣',
  `intro` text COMMENT '本团介绍',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否结束'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='团购商品表';

--
-- Dumping data for table `nze_group_buy`
--

INSERT INTO `nze_group_buy` (`groupbuy_id`, `title`, `start_time`, `end_time`, `goods_id`, `item_id`, `price`, `goods_num`, `buy_num`, `order_num`, `virtual_num`, `rebate`, `intro`, `goods_price`, `goods_name`, `is_recommend`, `views`, `is_end`) VALUES
(2, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 1388937600, 1773158400, 71, 0, '228.00', 50, 0, 0, 21, '2.5', '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', '1580.00', '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 1, 23, 0),
(3, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 1457625600, 1836748800, 103, 0, '95.00', 50, 0, 0, 30, '6.3', '货真价实珠宝活动便宜卖珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制的可以联系店主', '1999.00', '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 1, 10, 0),
(4, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 1457625600, 1805644800, 49, 0, '100.00', 50, 0, 0, 12, '8.4', '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', '999.00', '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 0, 0, 0),
(5, '海力（Horion）55A1华数TV版55英寸 4K轻薄智能网络平板液晶电视', 1457625600, 1837872000, 63, 0, '7991.00', 20, 0, 0, 21, '8.7', '海力（Horion）55A1华数TV版55英寸 4K轻薄智能网络平板液晶电视', '3699.00', '海力（Horion）55A1华数TV版55英寸 4K轻薄智能网络平板液晶电视', 0, 0, 0),
(6, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 1457712000, 1520784000, 81, 0, '61.00', 100, 0, 0, 34, '5.9', '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', '108.00', '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 0, 0, 0),
(7, ' 金地珠宝足金花之恋金花3D硬金吊坠优雅大方时尚百搭唯美花朵黄金吊坠项坠', 1457712000, 1551715200, 100, 0, '1300.00', 50, 0, 0, 21, '9.6', ' 金地珠宝足金花之恋金花3D硬金吊坠优雅大方时尚百搭唯美花朵黄金吊坠项坠', '1405.00', '金地珠宝足金花之恋金花3D硬金吊坠优雅大方时尚百搭唯美花朵黄金吊坠项坠', 0, 0, 0),
(8, 'ces1', 1476374400, 1477670400, 131, 0, '20.00', 30, 0, 0, 10, '0.0', 'ces1', '0.00', '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_group_buy`
--
ALTER TABLE `nze_group_buy`
 ADD PRIMARY KEY (`groupbuy_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_group_buy`
--
ALTER TABLE `nze_group_buy`
MODIFY `groupbuy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID',AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
