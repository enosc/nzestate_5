-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 06:28 AM
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
-- Table structure for table `nze_user_message`
--

CREATE TABLE IF NOT EXISTS `nze_user_message` (
`rec_id` int(11) NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `message_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息id',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统消息0，活动消息',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '查看状态：0未查看，1已查看'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_user_message`
--

INSERT INTO `nze_user_message` (`rec_id`, `user_id`, `message_id`, `category`, `status`) VALUES
(1, 6061, 1, 0, 0),
(2, 6062, 1, 0, 0),
(3, 2590, 2, 0, 0),
(4, 2591, 2, 0, 0),
(5, 175, 3, 0, 0),
(6, 175, 4, 0, 0),
(7, 3146, 3, 0, 0),
(8, 3146, 4, 0, 0),
(9, 3178, 3, 0, 0),
(10, 3178, 4, 0, 0),
(11, 1, 3, 0, 1),
(12, 1, 4, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_user_message`
--
ALTER TABLE `nze_user_message`
 ADD PRIMARY KEY (`rec_id`), ADD KEY `user_id` (`user_id`), ADD KEY `message_id` (`message_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_user_message`
--
ALTER TABLE `nze_user_message`
MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
