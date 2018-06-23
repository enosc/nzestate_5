-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 12:45 PM
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
-- Table structure for table `nze_sms_template`
--

CREATE TABLE IF NOT EXISTS `nze_sms_template` (
`template_id` mediumint(8) NOT NULL COMMENT '自增ID',
  `sms_sign` varchar(50) NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_template_code` varchar(100) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `template_content` varchar(512) NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `add_time` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_sms_template`
--

INSERT INTO `nze_sms_template` (`template_id`, `sms_sign`, `sms_template_code`, `template_content`, `send_scene`, `add_time`) VALUES
(20, '诺庄NZestate', 'SMS_35385001', '验证码${code}，您正在注册成为${product}用户，感谢您的支持!', '1', 1483345812),
(21, '诺庄NZestate', 'SMS_35225087', '尊敬的${user_name}用户，您的订单${order_sn}已发货，收货人${consignee}，请您及时查收', '5', 1483345826),
(24, '诺庄NZestate', 'SMS_352210151', '尊敬的用户，您的验证码为${code}, 请勿告诉他人.', '6', 1505894281),
(25, '诺庄NZestate', '122121212', '验证码${code}，用于密码找回，如非本人操作，请及时检查账户安全', '2', 1508919825);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_sms_template`
--
ALTER TABLE `nze_sms_template`
 ADD PRIMARY KEY (`template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_sms_template`
--
ALTER TABLE `nze_sms_template`
MODIFY `template_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
