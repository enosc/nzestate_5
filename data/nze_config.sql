-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 12:03 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nzestate_tp5_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `nze_config`
--

CREATE TABLE IF NOT EXISTS `nze_config` (
`config_id` smallint(6) unsigned NOT NULL COMMENT '表id',
  `config_key` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `config_value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `config_desc` varchar(50) DEFAULT NULL COMMENT '描述'
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_config`
--

INSERT INTO `nze_config` (`config_id`, `config_key`, `config_value`, `inc_type`, `config_desc`) VALUES
(1, 'site_url', 'http://www.nzestate.com', 'shop_info', NULL),
(2, 'record_no', '粤12345678号', 'shop_info', NULL),
(3, 'store_name', '您的新西兰健康生活馆', 'shop_info', NULL),
(4, 'store_logo', '/public/upload/logo/2018/03-29/7bc911adcb77eeb297aa5f17c18b41df.png', 'shop_info', NULL),
(5, 'store_title', '诺庄NZestate - 新西兰健康生活馆', 'shop_info', NULL),
(6, 'store_desc', '分享新西兰及澳洲高品质的保健母婴及日用品；传达纯净天然、有机无害的保健养生护肤理念；追求摒弃化学添加，回归自然本初状态，唯用自然的力量让人呈现最佳的生命状态。诺庄力求通过最直观的使用体验，辅助每个人找到最适合自己的自然力量。', 'shop_info', NULL),
(7, 'store_keyword', '新西兰 健康 养护 护理 麦卢卡 葡萄籽 奶粉 维生素 鱼油 电商 跨境电商', 'shop_info', NULL),
(8, 'contact', '', 'shop_info', NULL),
(9, 'phone', '+64279099774', 'shop_info', NULL),
(10, 'address', '', 'shop_info', NULL),
(11, 'qq', '1340015870', 'shop_info', NULL),
(12, 'qq2', '114728002', 'shop_info', NULL),
(13, 'qq3', '1394875748', 'shop_info', NULL),
(14, 'freight_free', '100000', 'shopping', NULL),
(15, 'point_rate', '1', 'shopping', NULL),
(16, 'is_mark', '0', 'water', NULL),
(17, 'mark_txt', '', 'water', NULL),
(18, 'mark_img', '/public/upload/public/2017/01-20/10cd966bd5f3549833c09a5c9700a9b8.jpg', 'water', NULL),
(19, 'mark_width', '', 'water', NULL),
(20, 'mark_height', '', 'water', NULL),
(21, 'mark_degree', '54', 'water', NULL),
(22, 'mark_quality', '56', 'water', NULL),
(23, 'sel', '9', 'water', NULL),
(24, 'sms_url', 'https://yunpan.cn/OcRgiKWxZFmjSJ', 'sms', NULL),
(25, 'sms_user', '', 'sms', NULL),
(26, 'sms_pwd', '访问密码 080e', 'sms', NULL),
(27, 'regis_sms_enable', '1', 'sms', NULL),
(28, 'sms_time_out', '60', 'sms', NULL),
(29, 'reg_integral', '100', 'basic', NULL),
(30, 'file_size', '1', 'basic', NULL),
(31, 'default_storage', '1', 'basic', NULL),
(32, 'warning_storage', '1', 'basic', NULL),
(33, 'tax', '6', 'basic', NULL),
(34, 'is_remind', '0', 'basic', NULL),
(35, 'order_finish_time', '', 'basic', NULL),
(36, 'order_cancel_time', '', 'basic', NULL),
(37, 'hot_keywords', '麦卢卡|葡萄籽|爱他美|眼霜|鱼油|蔓越莓', 'basic', NULL),
(38, '__hash__', '8d9fea07e44955760d3407524e469255', 'sms', NULL),
(40, 'app_test', '0', 'basic', NULL),
(41, 'switch', '1', 'distribut', NULL),
(42, 'condition', '0', 'distribut', NULL),
(43, 'name', '我的分销商', 'distribut', NULL),
(44, 'pattern', '0', 'distribut', NULL),
(45, 'order_rate', '30', 'distribut', NULL),
(46, 'first_name', '我的一级分销', 'distribut', NULL),
(47, 'first_rate', '70', 'distribut', NULL),
(48, 'second_name', '我的二级分销', 'distribut', NULL),
(49, 'second_rate', '20', 'distribut', NULL),
(50, 'third_name', '我的三级分销', 'distribut', NULL),
(51, 'third_rate', '10', 'distribut', NULL),
(52, 'date', '2', 'distribut', NULL),
(53, 'need', '200', 'basic', NULL),
(54, 'min', '200', 'basic', NULL),
(55, 'auto_confirm_date', '3', 'shopping', NULL),
(56, 'sms_appkey', '123456789', 'sms', NULL),
(57, 'sms_secretKey', '123456789', 'sms', NULL),
(58, 'sms_product', '诺庄NZestate', 'sms', NULL),
(59, 'sms_templateCode', 'SMS_101234567890', 'sms', NULL),
(60, 'smnze_server', 'smtp.qq.com', 'smtp', NULL),
(61, 'smnze_port', '25', 'smtp', NULL),
(62, 'smnze_user', '123456@qq.com', 'smtp', NULL),
(63, 'smnze_pwd', '123456', 'smtp', NULL),
(64, 'regis_smnze_enable', '0', 'smtp', NULL),
(65, 'test_eamil', '123456@qq.com', 'smtp', NULL),
(66, 'mobile', '123456789', 'shop_info', NULL),
(67, 'province', '28240', 'shop_info', NULL),
(68, 'city', '28558', 'shop_info', NULL),
(69, 'district', '47496', 'shop_info', NULL),
(70, 'forget_pwd_sms_enable', '1', 'sms', NULL),
(71, 'bind_mobile_sms_enable', '1', 'sms', NULL),
(72, 'order_add_sms_enable', '1', 'sms', NULL),
(73, 'order_pay_sms_enable', '1', 'sms', NULL),
(74, 'order_shipping_sms_enable', '1', 'sms', NULL),
(75, 'form_submit', 'ok', 'distribut', NULL),
(76, 'form_submit', 'ok', 'shop_info', NULL),
(77, 'form_submit', 'ok', 'shopping', NULL),
(78, 'reduce', '1', 'shopping', NULL),
(79, 'form_submit', 'ok', '', NULL),
(80, 'reg_integral', '100', '', NULL),
(81, 'file_size', '1', '', NULL),
(82, 'default_storage', '1', '', NULL),
(83, 'warning_storage', '1', '', NULL),
(86, 'tax', '6', '', NULL),
(87, 'hot_keywords', '麦卢卡|葡萄籽|爱他美|眼霜|鱼油|蔓越莓', '', NULL),
(90, 'point_min_limit', '0', 'shopping', NULL),
(91, 'point_use_percent', '50', 'shopping', NULL),
(92, 'inc_type', 'smtp', 'smtp', NULL),
(93, 'qr_back', '', 'distribut', NULL),
(94, 'qr_big_back', '', 'distribut', NULL),
(95, 'qrcode_menu_word', '', 'distribut', NULL),
(96, 'qrcode_input_word', '', 'distribut', NULL),
(97, 'invite', '1', 'basic', NULL),
(98, 'invite_integral', '10', 'basic', NULL),
(99, 'auto_service_date', '15', 'shopping', NULL),
(100, 'sms_platform', '2', 'sms', NULL),
(101, 'virtual_goods_sms_enable', '0', 'sms', NULL),
(102, 'is_audit', '1', 'ios', NULL),
(103, 'is_bind_account', '0', 'basic', NULL),
(104, 'store_user_logo', '/public/upload/logo/2017/11-07/ac0351f4284b701cb9afe48726834a46.png', 'shop_info', NULL),
(105, 'integral_use_enable', '1', 'shopping', NULL),
(106, 'store_ico', '', 'shop_info', NULL),
(107, 'admin_login_logo', '/public/static/images/logo/admin_login_logo_default.png', 'shop_info', NULL),
(108, 'admin_home_logo', '/public/static/images/logo/admin_home_logo_default.png', 'shop_info', NULL),
(109, 'wap_home_logo', '/public/upload/logo/2018/03-29/722d17fb9feb0874d909bb2ab8bf40ae.png', 'shop_info', NULL),
(110, 'wap_login_logo', '/public/static/images/logo/wap_logo_default.png', 'shop_info', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_config`
--
ALTER TABLE `nze_config`
 ADD PRIMARY KEY (`config_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_config`
--
ALTER TABLE `nze_config`
MODIFY `config_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=111;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
