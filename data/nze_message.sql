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
-- Table structure for table `nze_message`
--

CREATE TABLE IF NOT EXISTS `nze_message` (
`message_id` int(11) NOT NULL,
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理者id',
  `message` text NOT NULL COMMENT '站内信内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '个体消息：0，全体消息1',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 系统消息：0，活动消息：1',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `data` text COMMENT '消息序列化内容'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_message`
--

INSERT INTO `nze_message` (`message_id`, `admin_id`, `message`, `type`, `category`, `send_time`, `data`) VALUES
(1, 1, 'fefef', 0, 0, 1484881802, ''),
(2, 1, 'dsfsdf', 0, 0, 1496470375, ''),
(3, 1, '顶顶顶顶', 1, 0, 1507390602, ''),
(4, 1, '啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德阿萨德啊啊实打实大道阿萨德', 1, 0, 1507390621, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_message`
--
ALTER TABLE `nze_message`
 ADD PRIMARY KEY (`message_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_message`
--
ALTER TABLE `nze_message`
MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
