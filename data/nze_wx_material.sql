-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 06:57 PM
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
-- Table structure for table `nze_wx_material`
--

CREATE TABLE IF NOT EXISTS `nze_wx_material` (
`material_id` int(10) unsigned NOT NULL COMMENT '微信公众号素材',
  `media_id` varchar(64) DEFAULT '' COMMENT '微信媒体id',
  `type` varchar(10) NOT NULL COMMENT '素材类型：text、image、news、video',
  `data` text COMMENT 'json数据',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `key` char(32) DEFAULT NULL COMMENT '便于查询的key，现用于image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_wx_material`
--
ALTER TABLE `nze_wx_material`
 ADD PRIMARY KEY (`material_id`), ADD KEY `media_id` (`media_id`), ADD KEY `key` (`key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_wx_material`
--
ALTER TABLE `nze_wx_material`
MODIFY `material_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信公众号素材';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
