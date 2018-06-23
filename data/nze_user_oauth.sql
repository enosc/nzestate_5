-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 06:21 AM
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
-- Table structure for table `nze_user_oauth`
--

CREATE TABLE IF NOT EXISTS `nze_user_oauth` (
`oauth_id` mediumint(8) unsigned NOT NULL COMMENT '表自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户表ID',
  `openid` varchar(255) NOT NULL COMMENT '第三方开放平台openid',
  `oauth` varchar(50) NOT NULL COMMENT '第三方授权平台',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  `oauth_child` varchar(50) DEFAULT NULL COMMENT 'mp标识来自公众号, open标识来自开放平台,用于标识来自哪个第三方授权平台, 因为同是微信平台有来自公众号和开放平台'
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_user_oauth`
--

INSERT INTO `nze_user_oauth` (`oauth_id`, `user_id`, `openid`, `oauth`, `unionid`, `oauth_child`) VALUES
(18, 3527, 'owg9YuPZ8FVyHL55SwxNZ6QDX9-8', 'weixin', 'oDZRzw6eeDx9NfCDm-Y2wfqqanDs', ''),
(19, 3528, 'owg9YuKSs9O3gWaXrmGQdbnesQkQ', 'weixin', 'oDZRzw30TsZRLWSlUhGXV3_G96VY', ''),
(20, 3534, 'o9cTBwR0XA1T5anCEB4Pw8AJF-s8', 'weixin', 'oDZRzw4_xIbRTQUzvjO24K_InLTg', 'mp'),
(21, 3295, 'o9cTBwcVUEkjjqV9CtGMuwv65OF4', 'weixin', 'oDZRzwyG8hEmr6Kw3eiaWv4F2dq0', 'mp'),
(22, 3540, 'o9cTBwbaZ9V6M91XR5auZw51bA8o', 'weixin', 'oDZRzwxuwHWSOQrcJ5WbHQAD84CM', 'mp'),
(23, 1, 'o9cTBwW3PUb3m_yWS4mSudQkiRx4', 'weixin', 'oDZRzw4dKx3n0p6s1iIN21Njbkm0', 'mp'),
(24, 3558, 'o9cTBwce-d6vmjsxtPVcAOBmO5wY', 'weixin', 'oDZRzwzSy3myntYbFbL33lM5UK_c', 'mp'),
(25, 3563, 'o9cTBwTXLCcedkJoNBNWno95JFe8', 'weixin', 'oDZRzwwQG9AwPi5fC52H3zStALyU', 'mp'),
(26, 3586, 'o9cTBwZLOMxICnJRUGAff34qPk_k', 'weixin', 'oDZRzw2q_zPoftAvJz39YX5hCz6A', 'mp'),
(27, 3605, 'o9cTBwbCONIMmCeo7D3Mxw1mZJSQ', 'weixin', 'oDZRzw2Z08Rt8CkveSXhC1s-fX5U', 'mp'),
(28, 3610, 'o9cTBwS3zn4SSs_le296f04cXG3o', 'weixin', 'oDZRzw8akNiV7vSd0jkpYwNOcTjA', 'mp'),
(29, 2592, 'o9cTBwT0M-vTj2TEex3BtxSrq5dI', 'weixin', 'oDZRzwxse_JeY9n-u3BVM2LHs8Rs', 'mp'),
(30, 2592, 'o9cTBwT0M-vTj2TEex3BtxSrq5dI', 'weixin', 'oDZRzwxse_JeY9n-u3BVM2LHs8Rs', 'mp'),
(31, 3623, 'o9cTBwakCuUsVCGDN2kIAuiPDqqA', 'weixin', 'oDZRzw6IBAd3jdptwUvmImZ7uSXU', 'mp'),
(32, 3631, 'owg9YuDd7bfiWF9NKGG-olhyzIQ8', 'weixin', 'oDZRzw_ShkmpbTNi6IRFLzDzH9kg', ''),
(33, 3644, 'o9cTBwXQCcQrW4d-bYbalJdisyPM', 'weixin', 'oDZRzw7II3tf1w1XDZFA2QFK6S_A', 'mp'),
(34, 3645, 'o9cTBwb5QdLtNHeFOH2aJyb4xmW4', 'weixin', 'oDZRzw9TlWh1YpT7d-GNXY_fqwXI', 'mp'),
(35, 3661, 'o9cTBwQs76oJoehaLVRjXo0NAgkQ', 'weixin', 'oDZRzwyqAL_mdISfRXfYh3ZuNak8', 'mp'),
(36, 3663, 'o9cTBwSEkpAkfXtoEJiJS03Xja58', 'weixin', NULL, 'mp'),
(37, 3665, 'o9cTBwUDY08LVZUAXIvagXZrrp10', 'weixin', NULL, 'mp'),
(38, 3666, 'o9cTBwb1NX__R7n-S96uVbDcjIvw', 'weixin', NULL, 'mp'),
(39, 3668, 'o9cTBwXx3uKUdbtSLEFKYr5VomBc', 'weixin', NULL, 'mp'),
(40, 3671, 'o9cTBwWnWmtdNA1DnI37Cz-EMz20', 'weixin', NULL, 'mp'),
(41, 3672, 'o9cTBwaknqPvx4syVFs6QkXEhmZU', 'weixin', NULL, 'mp'),
(42, 3673, 'o9cTBwWnWmtdNA1DnI37Cz-EMz20', 'weixin', NULL, 'mp'),
(43, 3674, 'o9cTBwWnWmtdNA1DnI37Cz-EMz20', 'weixin', NULL, 'mp'),
(44, 3675, 'oqEse0bXm6wYCJKva0Ef2hEWcH00', 'miniapp', NULL, ''),
(45, 3676, 'oqEse0bXm6wYCJKva0Ef2hEWcH00', 'miniapp', NULL, ''),
(46, 3678, 'oqEse0bXm6wYCJKva0Ef2hEWcH00', 'miniapp', NULL, ''),
(47, 3679, 'oqEse0bXm6wYCJKva0Ef2hEWcH00', 'miniapp', NULL, ''),
(48, 3680, 'oqEse0TIw6VGLmRH770qiw3Mpscw', 'miniapp', NULL, ''),
(49, 3681, 'oqEse0X7t72YWC8Y5JiZgIb_oVpI', 'miniapp', NULL, ''),
(50, 3682, 'oqEse0TIw6VGLmRH770qiw3Mpscw', 'miniapp', NULL, ''),
(51, 3683, 'oqEse0TIw6VGLmRH770qiw3Mpscw', 'miniapp', NULL, ''),
(52, 3684, 'oqEse0TIw6VGLmRH770qiw3Mpscw', 'miniapp', NULL, ''),
(53, 3685, 'oqEse0TIw6VGLmRH770qiw3Mpscw', 'miniapp', NULL, ''),
(54, 2857, 'oqEse0TIw6VGLmRH770qiw3Mpscw', 'miniapp', NULL, ''),
(55, 2858, 'oqEse0fNg6sw77Qx7MGGkUhXk8iM', 'miniapp', NULL, ''),
(56, 2859, 'oqEse0fNg6sw77Qx7MGGkUhXk8iM', 'miniapp', NULL, ''),
(57, 2860, 'oqEse0U-7VhCoUIwg3ziZ4DtUWw8', 'miniapp', NULL, ''),
(58, 2861, 'oqEse0VOLXbY3X84O8kMVLvu2wjE', 'miniapp', NULL, ''),
(59, 2862, 'oqEse0e0F9Y1npIEjZ2GtgTnsDoU', 'miniapp', NULL, ''),
(60, 2863, 'oqEse0YTMeBohXTnJ2TWQCqsdAsM', 'miniapp', NULL, ''),
(61, 2864, 'oqEse0X2ldNNZdZRDns7nU8LmL9U', 'miniapp', NULL, ''),
(62, 2865, 'oqEse0fP_BUdV03htO0erMwe-URU', 'miniapp', NULL, ''),
(63, 2866, 'oqEse0fQZLccETSz_VYmpJLLa-Ro', 'miniapp', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nze_user_oauth`
--
ALTER TABLE `nze_user_oauth`
 ADD PRIMARY KEY (`oauth_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nze_user_oauth`
--
ALTER TABLE `nze_user_oauth`
MODIFY `oauth_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增ID',AUTO_INCREMENT=64;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
