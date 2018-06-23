-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 04:24 PM
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
-- Table structure for table `nze_goods_return`
--

CREATE TABLE IF NOT EXISTS `nze_goods_return` (
`return_id` int(11) NOT NULL COMMENT '退货申请表id自增',
  `rec_id` int(11) DEFAULT '0' COMMENT 'order_goods表id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `goods_num` int(10) DEFAULT '1' COMMENT '退货数量',
  `return_type` tinyint(1) DEFAULT '0' COMMENT '0仅退款 1退货退款 2换货',
  `return_reason` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '退换货原因',
  `return_desc` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '问题描述',
  `return_img` varchar(512) CHARACTER SET utf8 DEFAULT '' COMMENT '拍照图片路径',
  `add_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '-2用户取消-1不同意0待审核1通过2已发货3已收货4换货完成5退款完成',
  `remark` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '客服备注',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `spec_key` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '商品规格key 对应nze_spec_goods_price 表',
  `seller_delivery` text CHARACTER SET utf8 COMMENT '换货服务，卖家重新发货信息',
  `refund_money` decimal(10,2) DEFAULT '0.00' COMMENT '退还金额',
  `refund_deposit` decimal(10,2) DEFAULT '0.00' COMMENT '退还余额',
  `refund_integral` int(11) DEFAULT '0' COMMENT '退还积分',
  `refund_type` tinyint(1) DEFAULT '0' COMMENT '退款类型',
  `refund_mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '退款备注',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `is_receive` tinyint(4) DEFAULT '0' COMMENT '申请售后时是否收到货物',
  `delivery` text CHARACTER SET utf8 COMMENT '用户发货信息',
  `check_time` int(11) DEFAULT NULL COMMENT '卖家审核时间',
  `receive_time` int(11) DEFAULT NULL COMMENT '卖家收货时间',
  `cancel_time` int(11) DEFAULT NULL COMMENT '用户取消时间'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nze_goods_return`
--

INSERT INTO `nze_goods_return` (`return_id`, `rec_id`, `order_id`, `order_sn`, `goods_id`, `goods_num`, `return_type`, `return_reason`, `return_desc`, `return_img`, `add_time`, `status`, `remark`, `user_id`, `spec_key`, `seller_delivery`, `refund_money`, `refund_deposit`, `refund_integral`, `refund_type`, `refund_mark`, `refund_time`, `is_receive`, `delivery`, `check_time`, `receive_time`, `cancel_time`) VALUES
(3, 0, 126, '201603160947074625', 45, 1, 1, 'sdfghjkghfdf', NULL, '/public/upload/return_goods/2016/03-16/56e924a30aa76.jpg,/public/upload/return_goods/2016/03-16/56e924a3392f8.png', 1458119846, 3, '111111111111112344567', 1, '', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(4, 0, 126, '201603160947074625', 61, 1, 0, '234567890-', NULL, '/public/upload/return_goods/2016/03-16/56e94958497a2.jpg,/public/upload/return_goods/2016/03-16/56e949587a3c3.png', 1458129250, 3, 'aaaaaaaaa', 1, '', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(5, 0, 127, '201603162016423697', 47, 1, 1, '132456789', NULL, '', 1458176610, 3, '', 1, '', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(9, 0, 128, '201603170948488775', 104, 1, 0, '管理员申请退换货', NULL, '', 1458183628, 3, '', 1, '', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(11, 0, 177, '201603192017421080', 104, 1, 0, '退货', NULL, '/public/upload/return_goods/2016/05-02/5726b5d708a18.jpg', 1462154743, 3, '', 1, '', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(12, 0, 197, '201605021215126304', 77, 1, 0, '不合适', NULL, '/public/upload/return_goods/2016/05-02/5726d6d6069ea.jpg', 1462163174, 3, '完成', 1, '', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(29, 0, 1463, '201701201517572720', 1, 1, 0, '燃放点是否仍然', NULL, '/public/upload/return_goods/2017/01-22/58845bc63d816.png', 1485069254, 3, '', 1, '11_55', NULL, '0.00', '0.00', 0, 1, '', 1502779595, 0, NULL, NULL, NULL, NULL),
(30, 1755, 1498, '201704111622453006', 111, 1, 0, '快递物流一直未送到', '的风格的双方各', '', 1499166521, 3, '', 1, '', 'a:1:{s:12:"express_time";s:19:"2017-07-05 10:16:30";}', '0.00', '1000.00', 0, 1, '', 1502779566, 1, NULL, NULL, NULL, NULL),
(31, 1753, 1496, '201703241708017153', 104, 1, 1, '', '的风格水电费', '', 1499223652, 0, '', 1, '28_55', NULL, '5512.00', '10.00', 10, 0, '', 0, 0, NULL, NULL, NULL, NULL),
(32, 1848, 1573, '201709271337419178', 115, 2, 1, '不想买了', 'ddssss', '', 1506491846, 0, '', 3138, '103', NULL, '199.80', '0.00', 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_goods_return`
--
ALTER TABLE `nze_goods_return`
 ADD PRIMARY KEY (`return_id`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_goods_return`
--
ALTER TABLE `nze_goods_return`
MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货申请表id自增',AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
