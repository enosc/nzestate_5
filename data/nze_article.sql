-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 03:20 PM
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
-- Table structure for table `nze_article`
--

CREATE TABLE IF NOT EXISTS `nze_article` (
`article_id` mediumint(8) unsigned NOT NULL,
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `article_img` varchar(255) NOT NULL,
  `article_thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_article`
--

INSERT INTO `nze_article` (`article_id`, `cat_id`, `title`, `content`, `author`, `author_email`, `keywords`, `article_type`, `is_open`, `add_time`, `file_url`, `open_type`, `link`, `description`, `click`, `publish_time`, `article_img`, `article_thumb`) VALUES
(1, 1, '新用户注册', '&lt;p&gt;是打发士大夫&lt;/p&gt;', '', '', '', 2, 1, 1504687587, '', 0, '', '', 1122, 1504195200, '', ''),
(2, 1, '积分细则', '&lt;p&gt;的说法各大省份&lt;/p&gt;', '', '', '', 2, 1, 1504687696, '', 0, '', '', 1201, 1504195200, '', ''),
(3, 1, '忘记密码', '&lt;p&gt;第十个梵蒂冈&lt;/p&gt;', '', '', '', 2, 1, 1504687712, '', 0, '', '', 1060, 1504195200, '', ''),
(4, 1, '如何搜索', '&lt;p&gt;不错vbcvb&lt;/p&gt;', '', '', '', 2, 1, 1504687729, '', 0, '', '', 1013, 1504713600, '', ''),
(5, 2, '会员修改密码', '&lt;p&gt;修改密码&lt;/p&gt;', '', '', '无限惊喜', 2, 1, 1504687769, '', 0, '', '', 1033, 1504195200, '', ''),
(6, 2, '修改个人资料', '&lt;p&gt;修改个人资料&lt;/p&gt;', '', '', '无限惊喜', 2, 1, 1504687791, '', 0, '', '', 1095, 1504195200, '', ''),
(7, 2, '会员等级', '&lt;p&gt;是打发士大夫&lt;/p&gt;', '', '', '', 2, 1, 1504687818, '', 0, '', '', 1030, 1504195200, '', ''),
(8, 2, '常见问题', '&lt;p&gt;的所发生的&lt;/p&gt;', '', '', '', 2, 1, 1504687833, '', 0, '', '', 1223, 1504195200, '', ''),
(9, 4, '银联支付', '&lt;p&gt;是的发送到&lt;/p&gt;', '', '', '', 2, 1, 1504687862, '', 0, '', '', 1038, 1504195200, '', ''),
(10, 4, '支付宝支付', '&lt;p&gt;支付宝支付&lt;/p&gt;', '', '', '', 2, 1, 1504687884, '', 0, '', '', 1250, 1504195200, '', ''),
(11, 4, '微信支付', '&lt;p&gt;水电费水电费&lt;/p&gt;', '', '', '', 2, 1, 1504687900, '', 0, '', '', 1243, 1504195200, '', ''),
(12, 4, '余额支付', '&lt;p&gt;是的发送到水电费&lt;/p&gt;', '', '', '', 2, 1, 1504687920, '', 0, '', '', 1191, 1504195200, '', ''),
(13, 4, '分期付款', '&lt;p&gt;阿萨德发水电费&lt;/p&gt;', '', '', '', 2, 1, 1504687950, '', 0, '', '', 1091, 1504195200, '', ''),
(14, 3, '售后政策', '&lt;p&gt;是的发送到&lt;/p&gt;', '', '', '', 2, 1, 1504687964, '', 0, '', '', 1086, 1504195200, '', ''),
(15, 3, '退换货流程', '&lt;p&gt;&lt;a href=&quot;http://help.suning.com/page/id-287.htm&quot; target=&quot;_blank&quot; style=&quot;color: rgb(84, 84, 84); outline: 0px; font-family: &amp;quot;Microsoft yahei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245); text-decoration-line: none !important;&quot;&gt;退换货流程&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504687979, '', 0, '', '', 1008, 1504195200, '', ''),
(16, 3, '退款说明', '&lt;p&gt;&lt;a href=&quot;http://help.suning.com/page/id-290.htm&quot; target=&quot;_blank&quot; style=&quot;color: rgb(84, 84, 84); outline: 0px; font-family: &amp;quot;Microsoft yahei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245); text-decoration-line: none !important;&quot;&gt;退款说明&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504687995, '', 0, '', '', 1128, 1504195200, '', ''),
(17, 3, '取消订单', '&lt;ul class=&quot;mod_help_nav_con list-paddingleft-2&quot; style=&quot;padding: 0px; color: rgb(102, 102, 102); font-family: &amp;quot;Microsoft YaHei&amp;quot;, tahoma, arial, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;\\\\5b8b体&amp;quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(234, 234, 234);&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://help.jd.com/user/issue/list-50.html&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(200, 22, 35); text-decoration-line: none;&quot;&gt;取消订单&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688016, '', 0, '', '', 1078, 1504195200, '', ''),
(18, 5, '免运费政策', '&lt;p&gt;&lt;a href=&quot;http://help.suning.com/page/channel-37.htm&quot; target=&quot;_blank&quot; style=&quot;color: rgb(255, 102, 0); outline: 0px; font-family: &amp;quot;Microsoft yahei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245); text-decoration-line: none !important;&quot;&gt;免运费政策&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688045, '', 0, '', '', 1041, 1504195200, '', ''),
(19, 5, '物流查询', '&lt;p&gt;&lt;a href=&quot;http://help.suning.com/page/id-204.htm&quot; target=&quot;_blank&quot; style=&quot;color: rgb(84, 84, 84); outline: 0px; font-family: &amp;quot;Microsoft yahei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245); text-decoration-line: none !important;&quot;&gt;物流查询&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688058, '', 0, '', '', 1161, 1504195200, '', ''),
(20, 5, '上门自提', '&lt;ul class=&quot;mod_help_nav_con list-paddingleft-2&quot; style=&quot;padding: 0px; color: rgb(102, 102, 102); font-family: &amp;quot;Microsoft YaHei&amp;quot;, tahoma, arial, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;\\\\5b8b体&amp;quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(234, 234, 234);&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://help.jd.com/user/issue/list-81-100.html&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(200, 22, 35); text-decoration-line: none;&quot;&gt;上门自提&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688077, '', 0, '', '', 1295, 1504195200, '', ''),
(21, 5, '配送服务承诺', '&lt;p&gt;&lt;a href=&quot;http://help.suning.com/page/id-197.htm&quot; target=&quot;_blank&quot; style=&quot;color: rgb(255, 102, 0); outline: 0px; font-family: &amp;quot;Microsoft yahei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245); text-decoration-line: none !important;&quot;&gt;配送服务承诺&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688104, '', 0, '', '', 1259, 1504195200, '', ''),
(22, 2, '修改收货地址', '&lt;p&gt;&lt;a href=&quot;http://v5.33hao.com/member/index.php?act=article&amp;op=show&amp;article_id=21&quot; title=&quot;修改收货地址&quot; style=&quot;color: rgb(153, 153, 153); outline: none medium; transition-property: color; transition-duration: 0.3s; transition-timing-function: ease; font-family: &amp;quot;microsoft yahei&amp;quot;; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;修改收货地址&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688221, '', 0, '', '', 1086, 1504195200, '', ''),
(23, 1, '积分兑换说明', '&lt;p&gt;&lt;a href=&quot;http://v5.33hao.com/member/index.php?act=article&amp;op=show&amp;article_id=40&quot; title=&quot;积分兑换说明&quot; style=&quot;color: rgb(153, 153, 153); text-decoration-line: none; outline: none medium; transition-property: color; transition-duration: 0.3s; transition-timing-function: ease; font-family: &amp;quot;microsoft yahei&amp;quot;; font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;积分兑换说明&lt;/a&gt;&lt;/p&gt;', '', '', '', 2, 1, 1504688275, '', 0, '', '', 1085, 1504195200, '', ''),
(24, 6, '多商家2.09发布了', '&lt;p&gt;阿斯顿发送到范德萨发&lt;/p&gt;', '', '', '', 2, 1, 1504690924, '', 0, '', '', 1195, 1504195200, '', ''),
(25, 6, '台风暴雨期间送货时间通知', '&lt;p&gt;台风暴雨期间送货时间通知&lt;/p&gt;', '', '', '', 2, 1, 1504691037, '', 0, '', '', 1026, 1504195200, '', ''),
(26, 6, '多商户小程序上线了', '&lt;p&gt;多商户小程序上线了&lt;/p&gt;', '', '', 'tpshop', 2, 1, 1504691079, '', 0, '', '', 1299, 1504195200, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_article`
--
ALTER TABLE `nze_article`
 ADD PRIMARY KEY (`article_id`), ADD KEY `cat_id` (`cat_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_article`
--
ALTER TABLE `nze_article`
MODIFY `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
