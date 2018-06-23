-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 06:48 PM
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
-- Table structure for table `nze_wx_user`
--

CREATE TABLE IF NOT EXISTS `nze_wx_user` (
`id` int(11) NOT NULL COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL DEFAULT '' COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL DEFAULT '' COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL DEFAULT '' COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) DEFAULT '' COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) DEFAULT '' COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `qr` varchar(200) NOT NULL DEFAULT '' COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

--
-- Dumping data for table `nze_wx_user`
--

INSERT INTO `nze_wx_user` (`id`, `uid`, `wxname`, `aeskey`, `encode`, `appid`, `appsecret`, `wxid`, `weixin`, `headerpic`, `token`, `w_token`, `create_time`, `updatetime`, `tplcontentid`, `share_ticket`, `share_dated`, `authorizer_access_token`, `authorizer_refresh_token`, `authorizer_expires`, `type`, `web_access_token`, `web_refresh_token`, `web_expires`, `qr`, `menu_config`, `wait_access`) VALUES
(25, 0, '搜豹网络科技', '', 0, 'wxdc25f2bdbd6b911d', 'ef4688d7161cfe329bfbb8a3b7b3bdb7', 'gh_e29462503ebe', 'ThinkphpShop', '/public/upload/weixin/2017/05-22/3955fbbfd052fb1b34e1f8d931bb8d7c.jpg', 'eesops1462769263', 'soubao123456', 1486797230, 0, '', '', '', '', '', '', 4, 'UOlvJh2fH30blNEZRwY7qnGJQdDivVXh5tm7I-H3WpHdVrC0t5yuojvx6OBdlM15usXSgbwKk1q7j04Qw1Qx0pGTRofJGmQj50wz-YalrVfZnH7KjnfmH5yelx3zhT1gMMHgAEATTO', '', 0, '/public/upload/weixin/2017/08-28/137f632fd5dcdc6dcba59e6122a9899f.png', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_wx_user`
--
ALTER TABLE `nze_wx_user`
 ADD PRIMARY KEY (`id`), ADD KEY `uid` (`uid`) USING BTREE, ADD KEY `uid_2` (`uid`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_wx_user`
--
ALTER TABLE `nze_wx_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
