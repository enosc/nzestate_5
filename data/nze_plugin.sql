-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2018 at 07:25 AM
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
-- Table structure for table `nze_plugin`
--

CREATE TABLE IF NOT EXISTS `nze_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0PC+手机 1手机 2PC 3APP 4小程序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nze_plugin`
--

INSERT INTO `nze_plugin` (`code`, `name`, `version`, `author`, `config`, `config_value`, `desc`, `status`, `type`, `icon`, `bank_code`, `scene`) VALUES
('alipay', 'PC端支付宝', '1.0', 'jy_pwn', 'a:6:{i:0;a:4:{s:4:"name";s:14:"alipay_account";s:5:"label";s:15:"支付宝帐户";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:10:"alipay_key";s:5:"label";s:21:"交易安全校验码";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:14:"alipay_partner";s:5:"label";s:17:"合作者身份ID";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:3;a:4:{s:4:"name";s:18:"alipay_private_key";s:5:"label";s:6:"秘钥";s:4:"type";s:8:"textarea";s:5:"value";s:0:"";}i:4;a:4:{s:4:"name";s:17:"alipay_pay_method";s:5:"label";s:19:" 选择接口类型";s:4:"type";s:6:"select";s:6:"option";a:2:{i:0;s:24:"使用担保交易接口";i:1;s:30:"使用即时到帐交易接口";}}i:5;a:4:{s:4:"name";s:7:"is_bank";s:5:"label";s:18:"是否开通网银";s:4:"type";s:6:"select";s:6:"option";a:2:{i:0;s:3:"否";i:1;s:3:"是";}}}', NULL, 'PC端支付宝插件 ', 0, 'payment', 'logo.jpg', 'a:8:{s:12:"招商银行";s:9:"CMB-DEBIT";s:18:"中国工商银行";s:10:"ICBC-DEBIT";s:12:"交通银行";s:10:"COMM-DEBIT";s:18:"中国建设银行";s:9:"CCB-DEBIT";s:18:"中国民生银行";s:4:"CMBC";s:12:"中国银行";s:9:"BOC-DEBIT";s:18:"中国农业银行";s:3:"ABC";s:12:"上海银行";s:6:"SHBANK";}', 2),
('cod', '到货付款', '1.0', 'IT宇宙人', 'a:1:{i:0;a:4:{s:4:"name";s:9:"code_desc";s:5:"label";s:12:"配送描述";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:1:{s:9:"code_desc";s:9:"545234234";}', '货到付款插件 ', 1, 'payment', 'logo.jpg', 'N;', 0),
('weixin', '微信支付', '1.0', 'IT宇宙人', 'a:4:{i:0;a:4:{s:4:"name";s:5:"appid";s:5:"label";s:20:"绑定支付的APPID";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:5:"mchid";s:5:"label";s:9:"商户号";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:3:"key";s:5:"label";s:18:"商户支付密钥";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:3;a:4:{s:4:"name";s:9:"appsecret";s:5:"label";s:57:"公众帐号secert（仅JSAPI支付的时候需要配置)";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:4:{s:5:"appid";s:18:"wxe7abd314562c2753";s:5:"mchid";s:10:"1275166901";s:3:"key";s:32:"s123456789098765432101234567890b";s:9:"appsecret";s:32:"5352dc24e322f1eef06b3c9454d62c56";}', '微信支付插件 ', 1, 'payment', 'logo.jpg', 'N;', 0),
('alipay', '支付宝快捷登陆', '1.0', '彭老师', 'a:2:{i:0;a:4:{s:4:"name";s:14:"alipay_partner";s:5:"label";s:17:"合作者身份ID";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:10:"alipay_key";s:5:"label";s:15:"安全检验码";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:2:{s:14:"alipay_partner";s:0:"";s:10:"alipay_key";s:0:"";}', '支付宝快捷登陆插件 ', 1, 'login', 'logo.jpg', 'N;', 0),
('weixin', '微信登录', '1.0', '彭老师', 'a:2:{i:0;a:4:{s:4:"name";s:5:"appid";s:5:"label";s:17:"开放平台appid";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:6:"secret";s:5:"label";s:18:"开放平台secret";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', NULL, '微信扫码登录插件 ', 0, 'login', 'logo.jpg', 'N;', NULL),
('shentong', '申通物流', '1.0', '宇宙人', 'N;', NULL, '申通物流插件 ', 1, 'shipping', 'logo.jpg', 'N;', NULL),
('shunfeng', '顺丰物流', '1.0', 'shunfeng', 'a:5:{s:10:"background";s:70:"/public/upload/plugins/2017/04-10/3dd0b06777c48add1fbfe1ea2cfcbf9b.jpg";s:5:"width";s:3:"840";s:6:"height";s:3:"480";s:8:"offset_x";s:1:"0";s:8:"offset_y";s:1:"0";}', '\r\n                            \r\n                                                    <div style="z-index: 4; top: 100px; left: 122px;" class="item"><pre>发货点-名称</pre><div class="resize"></div></div>                        <div style="z-index: 5; top: 255px; left: 228px;" class="item"><pre>发货点-电话</pre><div class="resize"></div></div>', '顺丰物流插件 ', 1, 'shipping', 'logo.jpg', 'N;', NULL),
('qq', 'QQ登陆', '1.0', '彭老师', 'a:2:{i:0;a:4:{s:4:"name";s:6:"app_id";s:5:"label";s:6:"app_id";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:10:"app_secret";s:5:"label";s:10:"app_secret";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:2:{s:6:"app_id";s:9:"101277529";s:10:"app_secret";s:32:"13cc93773c625583d137060cfd354286";}', 'QQ登陆插件 ', 1, 'login', 'logo.jpg', 'N;', NULL),
('alipayMobile', '手机网站支付宝', '1.0', '宇宙人', 'a:6:{i:0;a:4:{s:4:"name";s:14:"alipay_account";s:5:"label";s:15:"支付宝帐户";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:10:"alipay_key";s:5:"label";s:21:"交易安全校验码";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:14:"alipay_partner";s:5:"label";s:17:"合作者身份ID";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:3;a:4:{s:4:"name";s:18:"alipay_private_key";s:5:"label";s:6:"秘钥";s:4:"type";s:8:"textarea";s:5:"value";s:0:"";}i:4;a:4:{s:4:"name";s:17:"alipay_pay_method";s:5:"label";s:19:" 选择接口类型";s:4:"type";s:6:"select";s:6:"option";a:2:{i:0;s:24:"使用担保交易接口";i:1;s:30:"使用即时到帐交易接口";}}i:5;a:4:{s:4:"name";s:7:"is_bank";s:5:"label";s:18:"是否开通网银";s:4:"type";s:6:"select";s:6:"option";a:2:{i:0;s:3:"否";i:1;s:3:"是";}}}', 'a:6:{s:14:"alipay_account";s:0:"";s:10:"alipay_key";s:0:"";s:14:"alipay_partner";s:0:"";s:18:"alipay_private_key";s:0:"";s:17:"alipay_pay_method";s:1:"2";s:7:"is_bank";s:1:"2";}', '手机端网站支付宝 ', 1, 'payment', 'logo.jpg', 'N;', 1),
('unionpay', '银联在线支付', '1.0', '奇闻科技', 'a:4:{i:0;a:4:{s:4:"name";s:12:"unionpay_mid";s:5:"label";s:9:"商户号";s:4:"type";s:4:"text";s:5:"value";s:15:"777290058130619";}i:1;a:4:{s:4:"name";s:21:"unionpay_cer_password";s:5:"label";s:25:" 商户私钥证书密码";s:4:"type";s:4:"text";s:5:"value";s:6:"000000";}i:2;a:4:{s:4:"name";s:13:"unionpay_user";s:5:"label";s:19:" 企业网银账号";s:4:"type";s:4:"text";s:5:"value";s:12:"123456789001";}i:3;a:4:{s:4:"name";s:17:"unionpay_password";s:5:"label";s:19:" 企业网银密码";s:4:"type";s:4:"text";s:5:"value";s:6:"789001";}}', NULL, '银联在线支付插件 ', 0, 'payment', 'logo.jpg', 'N;', 0),
('helloworld', 'HelloWorld插件', 'v1.2.0,v1.2.1', 'IT宇宙人', 'N;', NULL, '适合v1.2.0 , v1.2.1', 0, 'function', 'logo.jpg', 'N;', NULL),
('tenpay', 'PC端财付通', '1.0', 'IT宇宙人', 'a:2:{i:0;a:4:{s:4:"name";s:7:"partner";s:5:"label";s:7:"partner";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:3:"key";s:5:"label";s:3:"key";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:2:{s:7:"partner";s:0:"";s:3:"key";s:0:"";}', 'PC端财付通插件 ', 1, 'payment', 'logo.jpg', 'N;', 2),
('appWeixinPay', 'App微信支付', '1.0', 'wangqh', 'a:3:{i:0;a:5:{s:4:"name";s:5:"appid";s:5:"label";s:20:"绑定支付的APPID";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:4:"hint";s:0:"";}i:1;a:4:{s:4:"name";s:5:"mchid";s:5:"label";s:9:"商户号";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:3:"key";s:5:"label";s:18:"商户支付密钥";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', NULL, '微信开放平台支付信息', 0, 'payment', 'logo.jpg', 'N;', 3),
('miniAppPay', '微信小程序支付', '1.0', 'lhb', 'a:4:{i:0;a:5:{s:4:"name";s:5:"appid";s:5:"label";s:20:"绑定支付的APPID";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:4:"hint";s:0:"";}i:1;a:4:{s:4:"name";s:5:"mchid";s:5:"label";s:9:"商户号";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:3:"key";s:5:"label";s:18:"商户支付密钥";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:3;a:4:{s:4:"name";s:9:"appsecret";s:5:"label";s:15:"小程序secret";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:4:{s:5:"appid";s:18:"wx0355086f1ee9a78c";s:5:"mchid";s:10:"1275166901";s:3:"key";s:32:"s123456789098765432101234567890b";s:9:"appsecret";s:32:"86b9aa41577523ceb71a735fd26c0b76";}', '微信小程序支付信息', 1, 'payment', 'logo.jpg', 'N;', 4),
('zhongtong', '中通快递', '1.0', '管理员', '', NULL, ' ', 0, 'shipping', 'logo.jpg', 'N;', NULL),
('weixinH5', '微信支付', '1.0', 'lhb', 'a:3:{i:0;a:4:{s:4:"name";s:5:"appid";s:5:"label";s:20:"绑定支付的APPID";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:5:"mchid";s:5:"label";s:9:"商户号";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:3:"key";s:5:"label";s:18:"商户支付密钥";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', '', '微信支付【H5】', 1, 'payment', 'logo.jpg', 'N;', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
