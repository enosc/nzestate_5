-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 06:55 PM
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
-- Table structure for table `nze_wx_news`
--

CREATE TABLE IF NOT EXISTS `nze_wx_news` (
`news_id` int(11) NOT NULL COMMENT '图文子素材id',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `title` varchar(64) DEFAULT '' COMMENT '标题',
  `material_id` int(10) unsigned DEFAULT NULL COMMENT '图片素材id，一个图片为素材可包括几个子图文',
  `author` varchar(8) DEFAULT '' COMMENT '作者',
  `content` text COMMENT 'html内容',
  `digest` varchar(120) DEFAULT '' COMMENT '摘要',
  `thumb_url` text COMMENT '封面链接',
  `thumb_media_id` varchar(64) DEFAULT '' COMMENT '封面媒体id',
  `content_source_url` text COMMENT '原文链接',
  `show_cover_pic` int(1) DEFAULT '0' COMMENT '是否显示封面'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_wx_news`
--
ALTER TABLE `nze_wx_news`
 ADD PRIMARY KEY (`news_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_wx_news`
--
ALTER TABLE `nze_wx_news`
MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图文子素材id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
