-- phpMyAdmin SQL Dump
-- version 4.0.10.19
-- https://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019-12-16 10:23:20
-- 服务器版本: 5.6.44-log
-- PHP 版本: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `yibenzhang_cicsc`
--

-- --------------------------------------------------------

--
-- 替换视图以便查看 `two`
--
CREATE TABLE IF NOT EXISTS `two` (
`num` varchar(30)
,`custname` varchar(50)
,`htmoney` decimal(10,2)
,`daishou` decimal(11,2)
,`yishou` decimal(10,2)
,`dayt` date
);
-- --------------------------------------------------------

--
-- 表的结构 `xinhu_account`
--

CREATE TABLE IF NOT EXISTS `xinhu_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'crs_account  账户维护表',
  `acc_name` varchar(100) NOT NULL COMMENT '开户名',
  `acc_num` varchar(100) NOT NULL COMMENT '账号',
  `bank` varchar(255) NOT NULL COMMENT '开户银行',
  `saving` double(11,2) DEFAULT '0.00' COMMENT '账户余额',
  `acc_from` int(11) DEFAULT '0' COMMENT '所属账套:备用',
  `acc_type` int(4) DEFAULT NULL COMMENT '账户属性：0.银行 1.微信 2.支付宝',
  `comid` int(11) DEFAULT '0' COMMENT '对应单位id',
  `uid` int(11) DEFAULT NULL COMMENT '对应uid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_account`
--

INSERT INTO `xinhu_account` (`id`, `acc_name`, `acc_num`, `bank`, `saving`, `acc_from`, `acc_type`, `comid`, `uid`) VALUES
(1, '测试账号', '123456', '测试银行', 0.00, 0, 0, 1, 0),
(2, '大润发', '1234567864687', '浦东发展银行', 0.00, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_admin`
--

CREATE TABLE IF NOT EXISTS `xinhu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `pass` varchar(100) DEFAULT NULL COMMENT '密码',
  `loginci` smallint(6) DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `type` tinyint(1) DEFAULT '0' COMMENT '0普通1管理员',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `face` varchar(300) DEFAULT NULL COMMENT '头像地址',
  `deptid` int(11) DEFAULT '0' COMMENT '主部门ID',
  `deptname` varchar(50) DEFAULT NULL COMMENT '部门',
  `deptids` varchar(50) DEFAULT NULL COMMENT '其他部门ID',
  `deptnames` varchar(100) DEFAULT NULL COMMENT '多部门',
  `rankings` varchar(100) DEFAULT NULL COMMENT '多职位',
  `deptallname` varchar(200) DEFAULT NULL COMMENT '部门全部路径',
  `superid` varchar(100) DEFAULT NULL,
  `superman` varchar(100) DEFAULT NULL COMMENT '上级主管',
  `ranking` varchar(255) DEFAULT NULL COMMENT '岗位',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `deptpath` varchar(100) DEFAULT NULL COMMENT '部门路径',
  `superpath` varchar(100) DEFAULT NULL COMMENT '上级主管路径',
  `groupname` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `apptx` tinyint(1) DEFAULT '1' COMMENT '是否app提醒',
  `workdate` date DEFAULT NULL COMMENT '入职时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `lastpush` datetime DEFAULT NULL COMMENT '最后app推送时间',
  `adddt` datetime DEFAULT NULL COMMENT '新增时间',
  `weixinid` varchar(50) DEFAULT NULL COMMENT '微信号',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `style` tinyint(2) DEFAULT '0' COMMENT '默认样式',
  `pingyin` varchar(50) DEFAULT NULL COMMENT '名字拼音',
  `emailpass` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `companyid` int(11) DEFAULT '0' COMMENT '所在公司单位Id',
  `online` tinyint(1) DEFAULT '0' COMMENT '在线状态',
  `lastonline` datetime DEFAULT NULL COMMENT '最后在线时间',
  `isvcard` tinyint(1) DEFAULT '1' COMMENT '是否在通讯录上显示',
  `randslat` varchar(50) DEFAULT NULL COMMENT '随机字符串',
  `dwid` varchar(50) DEFAULT NULL COMMENT '加入单位id',
  `editpass` int(11) DEFAULT '0' COMMENT '修改密码次数',
  `comid` smallint(6) DEFAULT '0' COMMENT '默认单位Id',
  `source` smallint(6) DEFAULT '0' COMMENT '0:后端添加  1 前端注册  by andy.ma',
  PRIMARY KEY (`id`,`user`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `xinhu_admin`
--

INSERT INTO `xinhu_admin` (`id`, `num`, `user`, `name`, `pass`, `loginci`, `status`, `type`, `sex`, `tel`, `face`, `deptid`, `deptname`, `deptids`, `deptnames`, `rankings`, `deptallname`, `superid`, `superman`, `ranking`, `sort`, `deptpath`, `superpath`, `groupname`, `mobile`, `apptx`, `workdate`, `email`, `lastpush`, `adddt`, `weixinid`, `quitdt`, `style`, `pingyin`, `emailpass`, `companyid`, `online`, `lastonline`, `isvcard`, `randslat`, `dwid`, `editpass`, `comid`, `source`) VALUES
(1, 'A001', 'admin', '管理员', 'e99a18c428cb38d5f260853678922e03', 3174, 1, 1, '男', '0592-1234569', 'upload/face/1.jpg', 2, '壹本账科技', NULL, NULL, NULL, '壹本帐集团/壹本账科技', '5', '54646', '项目主管', 1, '[1],[2]', '[5]', NULL, '15800000023', 1, '2016-06-01', NULL, '2017-03-08 09:52:30', NULL, NULL, NULL, 18, 'guanliyuan', NULL, 1, 0, '2019-12-16 10:06:04', 1, NULL, '1,6,5', 1, 1, NULL),
(2, NULL, 'admin1', '一本账科技', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 0, '男', NULL, NULL, 1, '壹本帐集团', NULL, NULL, NULL, '壹本帐集团', NULL, NULL, '系统管理员', 0, '[1]', NULL, '4', '13410101779', 1, '2019-12-11', NULL, NULL, '2019-12-11 15:23:06', NULL, NULL, 0, 'yibenzhangkeji', NULL, 5, 0, '2019-12-11 15:33:46', 1, NULL, NULL, 0, 1, NULL),
(3, NULL, 'adminAA', '分公司AA', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 0, '男', NULL, NULL, 7, '分公司A', NULL, NULL, NULL, '壹本帐集团/分公司A', NULL, NULL, '系统管理员', 0, '[1],[7]', NULL, '4', '1592003122', 1, '2019-12-11', NULL, NULL, '2019-12-11 15:34:48', NULL, NULL, 0, 'fengongsiaa', NULL, 6, 0, '2019-12-12 17:30:30', 1, NULL, NULL, 0, 1, NULL),
(4, NULL, 'xcytech', '阿达', 'e99a18c428cb38d5f260853678922e03', 18, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 10, 1, '2019-12-16 10:06:55', 1, NULL, NULL, 0, 0, 1),
(5, '2019-12-006', '1561651616', '54646', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, 0, '男', NULL, NULL, 1, '壹本帐集团', NULL, NULL, NULL, '壹本帐集团', NULL, NULL, '看了看', 0, '[1]', NULL, NULL, '15021121212121', 1, '2019-12-13', NULL, NULL, '2019-12-13 14:41:44', NULL, NULL, 0, '54646', NULL, 1, 0, NULL, 1, NULL, NULL, 0, 1, 0),
(6, NULL, 'userb', 'Beyond', 'e99a18c428cb38d5f260853678922e03', 2, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '4,6', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 11, 0, '2019-12-16 09:57:48', 1, NULL, NULL, 0, 0, 1),
(7, NULL, 'adminC', '周先生', 'e10adc3949ba59abbe56e057f20f883e', 3, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 12, 0, '2019-12-15 16:54:46', 1, NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_assetm`
--

CREATE TABLE IF NOT EXISTS `xinhu_assetm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) DEFAULT '0' COMMENT '类别',
  `title` varchar(50) DEFAULT NULL COMMENT '名称',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `brand` varchar(20) DEFAULT NULL COMMENT '品牌',
  `model` varchar(100) DEFAULT NULL COMMENT '规格型号',
  `laiyuan` varchar(50) DEFAULT NULL COMMENT '来源',
  `shuname` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `dt` date DEFAULT NULL COMMENT '日期',
  `ckid` smallint(50) DEFAULT '0' COMMENT '存放地点',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `buydt` date DEFAULT NULL COMMENT '购进日期',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `optid` smallint(6) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `useid` varchar(50) DEFAULT '0',
  `usename` varchar(50) DEFAULT NULL COMMENT '使用人',
  `fengmian` varchar(50) DEFAULT NULL COMMENT '封面图片',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='固定资产表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_book`
--

CREATE TABLE IF NOT EXISTS `xinhu_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '书名',
  `typeid` smallint(6) DEFAULT '0' COMMENT '对应分类',
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `chuban` varchar(50) DEFAULT NULL COMMENT '出版社',
  `cbdt` date DEFAULT NULL COMMENT '出版日期',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `weizhi` varchar(50) DEFAULT NULL COMMENT '存放位置',
  `shul` smallint(6) DEFAULT '0' COMMENT '数量',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optid` smallint(6) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `isbn` varchar(30) DEFAULT NULL,
  `jieshu` smallint(6) DEFAULT '0' COMMENT '被借阅数',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图书表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_bookborrow`
--

CREATE TABLE IF NOT EXISTS `xinhu_bookborrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `bookid` smallint(6) DEFAULT '0',
  `bookname` varchar(50) DEFAULT NULL COMMENT '书名',
  `jydt` date DEFAULT NULL COMMENT '借阅日期',
  `yjdt` date DEFAULT NULL COMMENT '预计归还',
  `ghtime` datetime DEFAULT NULL COMMENT '归还时间',
  `isgh` tinyint(1) DEFAULT '0' COMMENT '是否归返',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图书借阅' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_carm`
--

CREATE TABLE IF NOT EXISTS `xinhu_carm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carnum` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `carbrand` varchar(20) DEFAULT NULL COMMENT '车辆品牌',
  `carmode` varchar(30) DEFAULT NULL COMMENT '型号',
  `cartype` varchar(10) DEFAULT NULL COMMENT '车辆类型',
  `buydt` date DEFAULT NULL COMMENT '购买日期',
  `buyprice` mediumint(9) DEFAULT NULL COMMENT '购买价格',
  `enginenb` varchar(50) DEFAULT NULL COMMENT '发动机号',
  `ispublic` tinyint(1) DEFAULT '1' COMMENT '是否公开使用',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `createname` varchar(20) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态@0|办理中,1|可用,2|维修中,3|报废',
  `framenum` varchar(50) DEFAULT NULL COMMENT '车架号',
  `status` tinyint(4) DEFAULT '1',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_carmang`
--

CREATE TABLE IF NOT EXISTS `xinhu_carmang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `carid` smallint(6) DEFAULT '0' COMMENT '维修车辆',
  `reason` varchar(500) DEFAULT NULL COMMENT '维修原因',
  `address` varchar(50) DEFAULT NULL COMMENT '维修地点',
  `jianame` varchar(50) DEFAULT NULL COMMENT '驾驶员',
  `jiaid` varchar(50) DEFAULT NULL,
  `bujian` varchar(200) DEFAULT NULL COMMENT '更换部件',
  `startdt` datetime DEFAULT NULL COMMENT '维修时间',
  `enddt` datetime DEFAULT NULL COMMENT '维修截止时间',
  `money` decimal(8,2) DEFAULT '0.00' COMMENT '维修金额',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|车辆维修,1|保养',
  `nextdt` date DEFAULT NULL COMMENT '下次保养日期',
  `kmshu` varchar(20) DEFAULT NULL COMMENT '当前保养公里数',
  `kmnshu` varchar(20) DEFAULT NULL COMMENT '下次保养公里数',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆维修保养记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_carmrese`
--

CREATE TABLE IF NOT EXISTS `xinhu_carmrese` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `useid` varchar(200) DEFAULT NULL,
  `usename` varchar(200) DEFAULT NULL COMMENT '使用者',
  `useren` smallint(6) DEFAULT '0' COMMENT '使用人数',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `address` varchar(50) DEFAULT NULL COMMENT '目的地',
  `carid` smallint(6) DEFAULT NULL,
  `carnum` varchar(10) DEFAULT NULL COMMENT '使用车辆',
  `xianlines` varchar(200) DEFAULT NULL COMMENT '线路',
  `jiaid` varchar(200) DEFAULT NULL,
  `jianame` varchar(200) DEFAULT NULL COMMENT '驾驶员',
  `kmstart` varchar(20) DEFAULT NULL COMMENT '起始公里数',
  `kmend` varchar(20) DEFAULT NULL COMMENT '结束公里数',
  `returndt` datetime DEFAULT NULL COMMENT '归还时间',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆预定' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_carms`
--

CREATE TABLE IF NOT EXISTS `xinhu_carms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carid` int(11) DEFAULT '0' COMMENT '车辆Id',
  `otype` varchar(20) DEFAULT NULL COMMENT '类型,加油',
  `startdt` date DEFAULT NULL,
  `enddt` date DEFAULT NULL COMMENT '截止时间',
  `money` decimal(8,2) DEFAULT '0.00' COMMENT '花费金额',
  `optid` int(11) DEFAULT '0' COMMENT '添加人id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '添加人',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `unitname` varchar(50) DEFAULT NULL COMMENT '对应名称',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `address` varchar(100) DEFAULT NULL COMMENT '地点',
  `jiaid` varchar(30) DEFAULT NULL,
  `jianame` varchar(30) DEFAULT NULL COMMENT '驾驶员',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆信息登记表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_chargems`
--

CREATE TABLE IF NOT EXISTS `xinhu_chargems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0',
  `mid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `updatedt` datetime DEFAULT NULL,
  `key` varchar(200) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0' COMMENT '对应安装模块Id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`,`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统升级' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `xinhu_chargems`
--

INSERT INTO `xinhu_chargems` (`id`, `type`, `mid`, `optdt`, `updatedt`, `key`, `modeid`) VALUES
(1, 0, 1, '2019-12-11 15:10:47', '2019-12-04 15:08:09', NULL, 1),
(2, 1, 1, '2019-12-11 15:10:43', '2019-11-29 15:26:15', NULL, 1),
(5, 0, 22, '2019-12-11 15:11:07', '2019-12-04 15:08:10', NULL, 22),
(6, 0, 4, '2019-12-11 15:12:58', '2019-08-26 10:13:45', NULL, 4),
(7, 0, 24, '2019-12-11 15:15:04', '2019-10-04 21:32:29', NULL, 24),
(8, 1, 1278, '2019-12-11 15:16:27', '2018-09-04 12:20:22', NULL, 5),
(9, 0, 5, '2019-12-11 15:16:29', '2018-06-15 19:25:37', NULL, 5),
(10, 1, 6586, '2019-12-11 15:16:35', '2019-11-10 20:49:08', NULL, 37),
(11, 0, 37, '2019-12-11 15:16:43', '2019-10-04 13:25:27', NULL, 37),
(12, 1, 6117, '2019-12-11 15:17:09', '2019-04-26 23:30:06', NULL, 35),
(13, 0, 35, '2019-12-11 15:17:16', '2019-07-12 18:54:11', NULL, 35),
(14, 1, 1720, '2019-12-11 15:17:31', '2018-02-07 21:05:59', NULL, 10),
(15, 0, 10, '2019-12-11 15:17:32', '2019-09-11 18:47:55', NULL, 10),
(16, 0, 7, '2019-12-11 15:18:44', '2018-04-24 11:59:14', NULL, 7);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_city`
--

CREATE TABLE IF NOT EXISTS `xinhu_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ＩＤ',
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '类型0国家,1省,2市,3县',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `pinyin` varchar(50) DEFAULT NULL,
  `pinyins` varchar(50) DEFAULT NULL COMMENT '拼音简称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`pid`) USING BTREE,
  KEY `region_type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='城市表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_company`
--

CREATE TABLE IF NOT EXISTS `xinhu_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(200) DEFAULT NULL COMMENT '对应logo',
  `name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `nameen` varchar(200) DEFAULT NULL COMMENT '英文名',
  `oaname` varchar(100) DEFAULT NULL COMMENT '显示OA名称',
  `oanemes` varchar(100) DEFAULT NULL COMMENT '移动端显示名称',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `pid` int(11) DEFAULT '0' COMMENT '对应上级',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `fuzeid` varchar(30) DEFAULT NULL COMMENT '对应负责人Id',
  `fuzename` varchar(30) DEFAULT NULL COMMENT '对应负责人',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `city` varchar(30) DEFAULT NULL COMMENT '所在城市',
  `num` varchar(500) DEFAULT NULL COMMENT '单位编号',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `regtime` datetime DEFAULT NULL COMMENT '注册时间  by andy.ma',
  `exptime` datetime DEFAULT NULL COMMENT '过期时间  by andy.ma',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司单位表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `xinhu_company`
--

INSERT INTO `xinhu_company` (`id`, `logo`, `name`, `nameen`, `oaname`, `oanemes`, `tel`, `fax`, `pid`, `sort`, `fuzeid`, `fuzename`, `address`, `city`, `num`, `comid`, `regtime`, `exptime`) VALUES
(1, 'images/logo.png', '壹本帐', NULL, '壹本帐', '壹本帐', '0755-25110281', '0755-25110281', 0, 0, '5', '磐石', '罗湖', '深圳', '0001', 1, NULL, NULL),
(6, NULL, 'A分公司', NULL, NULL, NULL, NULL, NULL, 1, 0, '1', '管理员', NULL, NULL, 'A001', 1, NULL, NULL),
(5, NULL, '一本账科技', NULL, NULL, NULL, NULL, NULL, 1, 0, '2', '一本账科技', NULL, NULL, 'HT-001', 1, NULL, NULL),
(10, NULL, '新超越科技', NULL, '新超越科技', NULL, '0755-25110121', NULL, 1, 0, NULL, NULL, NULL, 'SZ', 'bb', 1, '2019-12-13 14:19:51', NULL),
(11, NULL, '公司B', NULL, '公司B', NULL, '0755-25110121', NULL, 0, 0, NULL, NULL, NULL, 'SZ', '20191213004', 0, '2019-12-13 16:58:32', NULL),
(12, NULL, '中税财务分公司C', NULL, '中税财务分公司C', NULL, '', NULL, 0, 0, NULL, NULL, NULL, '深圳', '20191215005', 0, '2019-12-15 15:10:49', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_custappy`
--

CREATE TABLE IF NOT EXISTS `xinhu_custappy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `custid` int(11) DEFAULT '0' COMMENT '客户ID',
  `custname` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `custid` (`custid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户申请使用' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_custfee`
--

CREATE TABLE IF NOT EXISTS `xinhu_custfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '费用单 by andy.ma',
  `htid` int(11) DEFAULT '0' COMMENT '合同ID',
  `htnum` varchar(20) DEFAULT NULL COMMENT '合同编号[*]',
  `paydt` datetime DEFAULT NULL COMMENT '付费日期',
  `uid` smallint(6) DEFAULT '0' COMMENT '操作者id',
  `custid` smallint(6) DEFAULT '0' COMMENT '客户id',
  `custname` varchar(50) DEFAULT NULL COMMENT '客户名字  by andy.ma',
  `optdt` datetime DEFAULT NULL COMMENT '操作日期',
  `optname` varchar(10) DEFAULT NULL COMMENT '经办人[*]',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '付款金额',
  `type` int(11) DEFAULT '0' COMMENT '费用类型',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `createname` varchar(10) DEFAULT NULL COMMENT '经办人[*]',
  `createid` smallint(6) DEFAULT '0' COMMENT '创建者id',
  `depart` varchar(50) DEFAULT NULL COMMENT '部门[*]  id  by andy.ma',
  `paymtd` int(11) DEFAULT NULL COMMENT '付款方式 1 现金 2 支票 3 转账',
  `accid` int(11) DEFAULT NULL COMMENT '付款账户',
  `file_content` varchar(255) DEFAULT NULL COMMENT '附件',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `departid` smallint(6) DEFAULT NULL COMMENT '部门的ID',
  `optnameid` smallint(6) DEFAULT NULL COMMENT '经办人[*的ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `htid` (`htid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户收付款' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xinhu_custfee`
--

INSERT INTO `xinhu_custfee` (`id`, `htid`, `htnum`, `paydt`, `uid`, `custid`, `custname`, `optdt`, `optname`, `money`, `type`, `explain`, `createdt`, `createname`, `createid`, `depart`, `paymtd`, `accid`, `file_content`, `comid`, `departid`, `optnameid`) VALUES
(1, 1, '2019-12-001', '2019-12-11 18:10:36', 1, 1, NULL, '2019-12-11 18:11:08', '管理员', '1000.00', 1, '电脑维修费用', '2019-12-11 18:11:08', '管理员', 1, '总经办', 1, 1, NULL, 1, 8, 2);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_custfina`
--

CREATE TABLE IF NOT EXISTS `xinhu_custfina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `htid` int(11) DEFAULT '0' COMMENT '合同ID',
  `htnum` varchar(20) DEFAULT NULL,
  `dt` date DEFAULT NULL COMMENT '所属日期',
  `uid` smallint(6) DEFAULT '0',
  `custid` smallint(6) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收款单,1付款单',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否收款,付款',
  `paydt` datetime DEFAULT NULL COMMENT '收付款时间',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `createname` varchar(10) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `ismove` tinyint(1) DEFAULT '0' COMMENT '是否转移的',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `depart` varchar(50) DEFAULT NULL COMMENT '部门名称  by andy.ma',
  `accid` int(11) DEFAULT NULL COMMENT '对应的收付款账户 by andy.ma',
  `paymtd` int(11) DEFAULT NULL COMMENT '付款方式 1 现金 2 支票 3 转账   by andy.ma',
  `paytype` int(11) DEFAULT NULL COMMENT '0.合同 ，1.采购付款， 2 外协付款  3.未定义（其他收入/支出）by andy.ma',
  `departid` int(11) DEFAULT NULL COMMENT '部门的ID  by andy.ma',
  `qishu` varchar(20) DEFAULT NULL COMMENT '对应第几期 by andy.ma',
  `optnameid` smallint(6) DEFAULT NULL COMMENT '所属人的ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `htid` (`htid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户收付款' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xinhu_custfina`
--

INSERT INTO `xinhu_custfina` (`id`, `htid`, `htnum`, `dt`, `uid`, `custid`, `custname`, `optdt`, `optname`, `money`, `type`, `ispay`, `paydt`, `explain`, `createdt`, `createname`, `createid`, `ismove`, `comid`, `depart`, `accid`, `paymtd`, `paytype`, `departid`, `qishu`, `optnameid`) VALUES
(1, 2, '2019-12-002', '2019-12-11', 1, 1, '测试客户A', '2019-12-11 17:34:08', '管理员', '10000.00', 0, 1, '2019-12-11 17:32:00', '第一期', '2019-12-11 17:34:08', '管理员', 1, 0, 1, '一本账科技', 1, 1, 0, 2, '第一期', 2),
(2, 2, '2019-12-002', '2019-12-11', 1, 1, '测试客户A', '2019-12-11 17:36:19', '管理员', '2000.00', 1, 1, '2019-12-11 17:36:00', '第一期付款给A公司2000元', '2019-12-11 17:36:19', '管理员', 1, 0, 1, '分公司A', 1, 1, 0, 7, '第一期', 2),
(3, 4, '2019-12-004', '2019-12-13', 1, 1, '测试客户A', '2019-12-13 09:39:34', '管理员', '10000.00', 0, 0, NULL, NULL, '2019-12-13 09:39:34', '管理员', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_custfinaa`
--

CREATE TABLE IF NOT EXISTS `xinhu_custfinaa` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调账单 by andy.ma',
  `htid` int(11) DEFAULT '0' COMMENT '合同ID',
  `htnum` varchar(20) DEFAULT NULL COMMENT '合同编号[*]',
  `paydt` datetime DEFAULT NULL COMMENT '调账日期[*]',
  `uid` smallint(6) DEFAULT '0' COMMENT '操作者id',
  `custid` smallint(6) DEFAULT '0' COMMENT '调账单位[*]（客户）  by andy.ma',
  `optdt` datetime DEFAULT NULL COMMENT '操作日期',
  `optname` varchar(10) DEFAULT NULL COMMENT '经办人[*]',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '调账金额[*]',
  `type` tinyint(1) DEFAULT '0' COMMENT '调账方式 ： 0 调账增加 1 调账减少',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `createname` varchar(10) DEFAULT NULL COMMENT '经办人[*]',
  `createid` smallint(6) DEFAULT '0' COMMENT '创建者id',
  `depart` varchar(50) DEFAULT NULL COMMENT '部门[*]  id  by andy.ma',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `departid` smallint(6) DEFAULT NULL COMMENT '部门的ID',
  `optnameid` smallint(6) DEFAULT NULL COMMENT '经办人的ID',
  `paytype` tinyint(2) DEFAULT '0' COMMENT '0 合同调账  1 采购调账 , 2 外协调账',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `htid` (`htid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户收付款' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xinhu_custfinaa`
--

INSERT INTO `xinhu_custfinaa` (`id`, `htid`, `htnum`, `paydt`, `uid`, `custid`, `optdt`, `optname`, `money`, `type`, `explain`, `createdt`, `createname`, `createid`, `depart`, `comid`, `departid`, `optnameid`, `paytype`) VALUES
(1, 2, '2019-12-002', '2019-12-12 09:22:00', 1, 1, '2019-12-12 09:23:29', '管理员', '1000.00', 0, '合同跟编号必须对应，必须选择编号，否则htid会无值', '2019-12-12 09:23:29', '管理员', 1, '分公司A', 1, 7, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_customer`
--

CREATE TABLE IF NOT EXISTS `xinhu_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(20) DEFAULT NULL COMMENT '客户类型',
  `uid` smallint(6) DEFAULT '0' COMMENT '所属人',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `linkname` varchar(20) DEFAULT NULL COMMENT '联系人',
  `unitname` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `laiyuan` varchar(20) DEFAULT NULL COMMENT '来源',
  `tel` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `routeline` varchar(100) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL COMMENT '主页地址',
  `status` tinyint(4) DEFAULT '1' COMMENT '启用停用',
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `createname` varchar(10) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `shate` varchar(50) DEFAULT NULL COMMENT '共享给',
  `shateid` varchar(50) DEFAULT NULL,
  `isgys` tinyint(1) DEFAULT '0' COMMENT '是否供应商',
  `isstat` tinyint(1) DEFAULT '0' COMMENT '是否标*客户',
  `fzid` smallint(6) DEFAULT '0',
  `fzname` varchar(20) DEFAULT NULL COMMENT '客户负责人',
  `htshu` smallint(6) DEFAULT '0' COMMENT '合同数',
  `moneyz` decimal(10,2) DEFAULT '0.00' COMMENT '销售总额',
  `moneyd` decimal(10,2) DEFAULT '0.00' COMMENT '待收金额',
  `sheng` varchar(50) DEFAULT NULL COMMENT '所在省',
  `shi` varchar(50) DEFAULT NULL COMMENT '所在市',
  `isgh` tinyint(1) DEFAULT '0' COMMENT '是否放入公海',
  `lastdt` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `shibieid` varchar(30) DEFAULT NULL COMMENT '纳税识别号',
  `openbank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `cardid` varchar(50) DEFAULT NULL COMMENT '开户帐号',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_customer`
--

INSERT INTO `xinhu_customer` (`id`, `name`, `type`, `uid`, `optdt`, `optname`, `linkname`, `unitname`, `laiyuan`, `tel`, `mobile`, `email`, `explain`, `address`, `routeline`, `url`, `status`, `adddt`, `createname`, `createid`, `shate`, `shateid`, `isgys`, `isstat`, `fzid`, `fzname`, `htshu`, `moneyz`, `moneyd`, `sheng`, `shi`, `isgh`, `lastdt`, `shibieid`, `openbank`, `cardid`, `comid`) VALUES
(1, '测试客户A', '互联网', 1, '2019-12-11 16:02:32', '管理员', 'Auser', '测试客户A公司', '网上开拓', '0755-25110121', '13410101774', '424031034@qq.com', NULL, '深圳罗湖区', NULL, NULL, 1, '2019-12-11 16:02:32', '管理员', 1, NULL, NULL, 0, 0, 0, NULL, 0, '0.00', '0.00', NULL, 'SZ', 0, NULL, NULL, NULL, NULL, 1),
(2, '亿鑫广告', '互联网', 7, '2019-12-15 15:14:55', '周先生', NULL, NULL, '电话开拓', NULL, NULL, NULL, NULL, '梧桐山', NULL, NULL, 1, '2019-12-15 15:14:55', '周先生', 7, NULL, NULL, 0, 0, 0, NULL, 0, '0.00', '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, 12);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_custract`
--

CREATE TABLE IF NOT EXISTS `xinhu_custract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `num` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `custid` int(11) DEFAULT '0',
  `custname` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `linkman` varchar(20) DEFAULT NULL COMMENT '客户联系人',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '合同金额',
  `moneys` decimal(10,2) DEFAULT '0.00' COMMENT '待收金额',
  `startdt` date DEFAULT NULL COMMENT '生效日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `content` text COMMENT '合同内容',
  `saleid` smallint(6) DEFAULT '0' COMMENT '销售机会Id',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `signdt` date DEFAULT NULL COMMENT '签约日期',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收款合同，1付款合同',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '0待,1已完成,2部分',
  `isover` tinyint(1) DEFAULT '0' COMMENT '是否已全部创建收付款单',
  `createname` varchar(20) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `xiaoid` int(11) DEFAULT '0' COMMENT '对应销售goodm.id',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `fenlei` varchar(50) DEFAULT NULL COMMENT '合同分类',
  `fpid` int(11) DEFAULT '0' COMMENT '对应的发票类型id feelv表 by andy.ma',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户合同' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `xinhu_custract`
--

INSERT INTO `xinhu_custract` (`id`, `uid`, `num`, `optdt`, `optname`, `applydt`, `explain`, `status`, `custid`, `custname`, `linkman`, `money`, `moneys`, `startdt`, `enddt`, `content`, `saleid`, `isturn`, `signdt`, `type`, `ispay`, `isover`, `createname`, `createid`, `xiaoid`, `comid`, `fenlei`, `fpid`) VALUES
(1, 1, '2019-12-001', '2019-12-11 16:03:06', '管理员', '2019-12-11', '合同内容测试测试', 1, 1, '测试客户A', NULL, '10000.00', '10000.00', '2019-12-11', '2019-12-31', '合同内容测试测试', NULL, 1, '2019-12-11', 0, 0, 0, '管理员', 1, 0, 1, '普通合同', 1),
(2, 1, '2019-12-002', '2019-12-11 16:37:39', '管理员', '2019-12-11', '是道达尔泛微都是撒翁访问啊发文', 1, 1, '测试客户A', NULL, '50000.00', '38000.00', '2019-12-11', '2019-12-31', '30号收完款拜拜你条尾', NULL, 1, '2019-12-11', 0, 2, 0, '管理员', 1, 0, 1, '普通合同', 1),
(3, 1, '2019-12-003', '2019-12-11 16:41:33', '管理员', '2019-12-11', '说明说明说明说明', 1, 1, '测试客户A', NULL, '10000.00', '10000.00', '2019-12-11', '2019-12-19', '合同内容合同内容合同内容合同内容', NULL, 1, '2019-12-11', 0, 0, 0, '管理员', 1, 0, 1, '普通合同', 1),
(4, 1, '2019-12-004', '2019-12-11 16:55:05', '管理员', '2019-12-11', '说明说明说明说明说明说明', 1, 1, '测试客户A', NULL, '10000.00', '10000.00', '2019-12-11', '2019-12-31', '合同内容合同内容合同内容合同内容合同内容合同内容合同内容', NULL, 1, '2019-12-11', 0, 0, 1, '管理员', 1, 0, 1, '普通合同', 2),
(5, 1, '2019-12-005', '2019-12-13 11:57:45', '管理员', '2019-12-13', NULL, 1, 1, '测试客户A', NULL, '10000.00', '10000.00', '2019-12-13', '2019-12-28', '推', NULL, 1, '2019-12-13', 0, 0, 0, '管理员', 1, 0, 1, NULL, 1),
(6, 7, '2019-12-0061', '2019-12-15 15:15:55', '周先生', '2019-12-15', NULL, 1, 2, '亿鑫广告', NULL, '10000.00', '10000.00', '2019-12-15', '2020-12-15', '可以自定义内容', NULL, 1, '2019-12-15', 0, 0, 0, '周先生', 7, 0, 12, NULL, 3),
(7, 7, '2019-12-007', '2019-12-15 15:17:06', '周先生', '2019-12-15', NULL, 1, 2, '亿鑫广告', NULL, '20000.00', '20000.00', '2019-12-15', '2020-12-31', '推广费', NULL, 1, '2019-12-15', 0, 0, 0, '周先生', 7, 0, 12, NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_custsale`
--

CREATE TABLE IF NOT EXISTS `xinhu_custsale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL,
  `uid` smallint(6) DEFAULT '0',
  `optname` varchar(10) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0' COMMENT '状态',
  `explain` varchar(500) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `applydt` date DEFAULT NULL,
  `dealdt` datetime DEFAULT NULL COMMENT '成交时间',
  `adddt` datetime DEFAULT NULL,
  `laiyuan` varchar(20) DEFAULT NULL COMMENT '销售来源',
  `createid` smallint(6) DEFAULT '0',
  `createname` varchar(20) DEFAULT NULL,
  `htid` smallint(6) DEFAULT '0' COMMENT '合同ID',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='销售机会' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_daily`
--

CREATE TABLE IF NOT EXISTS `xinhu_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `adddt` datetime DEFAULT NULL COMMENT '新增时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `uid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|日报,1|周报,2|月报,3|年报',
  `plan` varchar(2000) DEFAULT NULL COMMENT '明日计划',
  `status` tinyint(1) DEFAULT '0',
  `enddt` date DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `mark` smallint(6) DEFAULT '0' COMMENT '得分',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日报' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_dailyfx`
--

CREATE TABLE IF NOT EXISTS `xinhu_dailyfx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `optdt` datetime DEFAULT NULL COMMENT '分析时间',
  `day1` tinyint(1) DEFAULT '0' COMMENT '0未写,1已写,2请假,3休息日',
  `day2` tinyint(1) DEFAULT '0',
  `day3` tinyint(1) DEFAULT '0',
  `day4` tinyint(1) DEFAULT '0',
  `day5` tinyint(1) DEFAULT '0',
  `day6` tinyint(1) DEFAULT '0',
  `day7` tinyint(1) DEFAULT '0',
  `day8` tinyint(1) DEFAULT '0',
  `day9` tinyint(1) DEFAULT '0',
  `day10` tinyint(1) DEFAULT '0',
  `day11` tinyint(1) DEFAULT '0',
  `day12` tinyint(1) DEFAULT '0',
  `day13` tinyint(1) DEFAULT '0',
  `day14` tinyint(1) DEFAULT '0',
  `day15` tinyint(1) DEFAULT '0',
  `day16` tinyint(1) DEFAULT '0',
  `day17` tinyint(1) DEFAULT '0',
  `day18` tinyint(1) DEFAULT '0',
  `day19` tinyint(1) DEFAULT '0',
  `day20` tinyint(1) DEFAULT '0',
  `day21` tinyint(1) DEFAULT '0',
  `day22` tinyint(1) DEFAULT '0',
  `day23` tinyint(1) DEFAULT '0',
  `day24` tinyint(1) DEFAULT '0',
  `day25` tinyint(1) DEFAULT '0',
  `day26` tinyint(1) DEFAULT '0',
  `day27` tinyint(1) DEFAULT '0',
  `day28` tinyint(1) DEFAULT '0',
  `day29` tinyint(1) DEFAULT '0',
  `day30` tinyint(1) DEFAULT '0',
  `day31` tinyint(1) DEFAULT '0',
  `totaly` smallint(6) DEFAULT '0' COMMENT '应写次数',
  `totalx` smallint(6) DEFAULT '0' COMMENT '已写次数',
  `totalw` smallint(6) DEFAULT '0' COMMENT '未写次数',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`,`month`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日报分析统计表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_demo`
--

CREATE TABLE IF NOT EXISTS `xinhu_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheng` varchar(50) DEFAULT NULL COMMENT '省',
  `shi` varchar(50) DEFAULT NULL COMMENT '市',
  `xian` varchar(50) DEFAULT NULL COMMENT '县(区)',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `tanxuan` varchar(50) DEFAULT NULL COMMENT '弹出下来单选',
  `tanxuancheck` varchar(50) DEFAULT NULL COMMENT '弹框下拉多选',
  `upfile1` varchar(50) DEFAULT NULL COMMENT '文件上传1',
  `upfile2` varchar(50) DEFAULT NULL COMMENT '文件上传2',
  `testfirs` varchar(50) DEFAULT NULL COMMENT '测试字段',
  `custname` varchar(100) DEFAULT NULL COMMENT '客户',
  `custid` int(11) DEFAULT '0' COMMENT '客户id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `tanxuanid` smallint(6) DEFAULT NULL COMMENT '单选弹出选择id',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面图片',
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='演示测试模块' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_dept`
--

CREATE TABLE IF NOT EXISTS `xinhu_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `headman` varchar(50) DEFAULT NULL COMMENT '负责人',
  `headid` varchar(50) DEFAULT NULL,
  `companyid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组织结构部门' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `xinhu_dept`
--

INSERT INTO `xinhu_dept` (`id`, `num`, `name`, `pid`, `sort`, `optdt`, `headman`, `headid`, `companyid`) VALUES
(1, NULL, '壹本帐集团', 0, 0, NULL, NULL, NULL, 0),
(2, NULL, '壹本账科技', 1, 0, NULL, '一本账科技', '2', 1),
(3, NULL, '总经办', 2, 0, NULL, '一本账科技', '2', 0),
(4, NULL, '财务部', 2, 0, NULL, '一本账科技', '2', 0),
(5, NULL, '销售部', 2, 0, NULL, '一本账科技', '2', 0),
(6, NULL, '管理组', 2, 0, NULL, '一本账科技', '2', 0),
(7, NULL, '分公司A', 1, 0, NULL, '一本账科技,管理员', '2,1', 0),
(8, NULL, '总经办', 7, 0, NULL, '一本账科技,管理员', '2,1', 0),
(9, NULL, '财务部', 7, 0, NULL, '一本账科技,管理员', '2,1', 0),
(10, NULL, '销售部', 7, 0, NULL, '一本账科技,管理员', '2,1', 0),
(11, NULL, '管理组', 7, 0, NULL, '一本账科技,管理员', '2,1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_editrecord`
--

CREATE TABLE IF NOT EXISTS `xinhu_editrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldsname` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `oldval` varchar(1000) DEFAULT NULL COMMENT '原来值',
  `newval` varchar(1000) DEFAULT NULL COMMENT '新值',
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT NULL COMMENT '操作人Id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `editci` smallint(6) DEFAULT '0' COMMENT '第几次修改记录',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='修改记录表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `xinhu_editrecord`
--

INSERT INTO `xinhu_editrecord` (`id`, `fieldsname`, `oldval`, `newval`, `table`, `mid`, `optdt`, `optid`, `optname`, `editci`) VALUES
(1, '对应负责人id', NULL, '2', 'company', 5, '2019-12-11 15:24:08', 1, '管理员', 1),
(2, '对应负责人', NULL, '一本账科技', 'company', 5, '2019-12-11 15:24:08', 1, '管理员', 1),
(3, '部门id', '2', '1', 'admin', 1, '2019-12-11 15:25:35', 1, '管理员', 1),
(4, '部门', '一本账科技', '信呼开发团队', 'admin', 1, '2019-12-11 15:25:35', 1, '管理员', 1),
(5, '多职位', '财务总监', NULL, 'admin', 1, '2019-12-11 15:25:35', 1, '管理员', 1),
(6, '更多单位', '1,2,3,4', '1,5', 'admin', 1, '2019-12-11 15:25:35', 1, '管理员', 1),
(7, '部门id', '1', '2', 'admin', 1, '2019-12-11 15:26:26', 1, '管理员', 2),
(8, '部门', '信呼开发团队', '一本账科技', 'admin', 1, '2019-12-11 15:26:26', 1, '管理员', 2),
(9, '多部门id', '3', NULL, 'admin', 1, '2019-12-11 15:32:53', 1, '管理员', 2),
(10, '多部门', '总经办', NULL, 'admin', 1, '2019-12-11 15:32:53', 1, '管理员', 2),
(11, '更多单位', '1,5', '1,5,6', 'admin', 1, '2019-12-11 15:32:53', 1, '管理员', 2),
(12, '名称', '信呼开发团队', '壹本帐', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(13, '显示OA名称', NULL, '壹本帐', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(14, '移动端显示', NULL, '壹本帐', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(15, '电话', '0592-123456', '0755-25110281', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(16, '传真', '0592-123456', '0755-25110281', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(17, '地址', '软件园', '罗湖', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(18, '所在城市', '厦门', '深圳', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(19, '单位编号', NULL, '0001', 'company', 1, '2019-12-12 23:43:30', 1, '管理员', 1),
(20, '更多单位', '1,5,6', '1,6,5,10', 'admin', 1, '2019-12-13 14:25:22', 1, '管理员', 2),
(21, '更多单位', '1,6,5,10', '1,6,5', 'admin', 1, '2019-12-13 14:46:51', 1, '管理员', 2),
(22, '所属单位', '0', '1', 'company', 10, '2019-12-13 14:52:48', 1, '管理员', 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_emailm`
--

CREATE TABLE IF NOT EXISTS `xinhu_emailm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0' COMMENT '用户iD',
  `title` varchar(220) DEFAULT NULL COMMENT '主题',
  `content` longtext COMMENT '邮件内容',
  `sendid` smallint(6) DEFAULT NULL,
  `sendname` varchar(100) DEFAULT NULL COMMENT '发送人',
  `senddt` datetime DEFAULT NULL COMMENT '发送时间',
  `receid` varchar(2000) DEFAULT NULL,
  `recename` varchar(4000) DEFAULT NULL COMMENT '接收人',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|草稿,1|已发送',
  `hid` smallint(6) DEFAULT '0' COMMENT '@回复id',
  `isfile` tinyint(1) DEFAULT '0' COMMENT '@是否有附件',
  `applydt` date DEFAULT NULL,
  `message_id` varchar(100) DEFAULT NULL COMMENT '邮件Id',
  `fromemail` varchar(500) DEFAULT NULL COMMENT '发送人邮件',
  `toemail` varchar(500) DEFAULT NULL COMMENT '发给邮件人',
  `reply_toemail` varchar(500) DEFAULT NULL COMMENT '回复邮件',
  `ccemail` varchar(500) DEFAULT NULL COMMENT '抄送给',
  `size` int(11) DEFAULT '0' COMMENT '邮件大小',
  `ccname` varchar(100) DEFAULT NULL COMMENT '抄送给',
  `ccid` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0内部邮件,1用邮件外发',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `numoi` int(11) DEFAULT '0',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_id` (`message_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邮件主表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_emails`
--

CREATE TABLE IF NOT EXISTS `xinhu_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0',
  `uid` smallint(6) DEFAULT '0',
  `zt` tinyint(1) DEFAULT '0' COMMENT '@0|未读,1|已读',
  `type` tinyint(1) DEFAULT '0' COMMENT '0接收,1抄送,2发送者',
  `ishui` tinyint(1) DEFAULT '0' COMMENT '是否回复',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '@0|未删,1|已删',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `email` varchar(50) DEFAULT NULL,
  `personal` varchar(20) DEFAULT NULL COMMENT '人员',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`,`email`,`type`) USING BTREE,
  KEY `mid_2` (`mid`,`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邮件子表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_email_cont`
--

CREATE TABLE IF NOT EXISTS `xinhu_email_cont` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `body` longtext COMMENT '内容',
  `receid` varchar(500) DEFAULT '0',
  `recename` varchar(500) DEFAULT NULL COMMENT '接收人',
  `receemail` varchar(500) DEFAULT NULL COMMENT '接收邮件',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '添加人',
  `status` tinyint(1) DEFAULT '0' COMMENT '0待发送,1成功,2失败',
  `senddt` datetime DEFAULT NULL COMMENT '发送时间',
  `ccname` varchar(500) DEFAULT NULL COMMENT '抄送给',
  `ccemail` varchar(500) DEFAULT NULL COMMENT '抄送邮件',
  `attachpath` varchar(500) DEFAULT NULL COMMENT '附件路径',
  `attachname` varchar(500) DEFAULT NULL COMMENT '福建名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统发送邮件内容' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_feelv`
--

CREATE TABLE IF NOT EXISTS `xinhu_feelv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票税率表 feelv',
  `fpname` varchar(255) DEFAULT NULL COMMENT '发票名称',
  `felv` decimal(11,2) DEFAULT '0.00' COMMENT '对应的费率',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `comid` int(11) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `xinhu_feelv`
--

INSERT INTO `xinhu_feelv` (`id`, `fpname`, `felv`, `uid`, `comid`) VALUES
(1, '普通发票', '0.60', 1, 0),
(2, '专用发票', '0.60', 1, 0),
(3, '收据', '0.00', 7, 0),
(4, '增值税发票', '0.50', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_feetype`
--

CREATE TABLE IF NOT EXISTS `xinhu_feetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '费用类型表 xinhu_feetype',
  `feename` varchar(100) DEFAULT NULL COMMENT '字典名字字段',
  `seq` int(11) DEFAULT '0' COMMENT '排序',
  `uid` int(11) DEFAULT '0' COMMENT '对应用户id',
  `comid` int(11) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `xinhu_feetype`
--

INSERT INTO `xinhu_feetype` (`id`, `feename`, `seq`, `uid`, `comid`) VALUES
(1, '管理费--电脑维修', 0, 1, 1),
(2, '税费', 1, 1, 1),
(3, '水电费', 2, 7, 1),
(4, '报纸费', 0, 1, 1),
(5, '生果金', 5, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_file`
--

CREATE TABLE IF NOT EXISTS `xinhu_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filenum` varchar(20) DEFAULT NULL COMMENT '文件编号',
  `valid` tinyint(4) DEFAULT '1',
  `filename` varchar(200) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `fileext` varchar(20) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesizecn` varchar(30) DEFAULT NULL,
  `filepath` varchar(100) DEFAULT NULL,
  `thumbpath` varchar(100) DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(50) DEFAULT NULL COMMENT '上传者',
  `adddt` datetime DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `web` varchar(300) DEFAULT NULL,
  `mtype` varchar(50) DEFAULT NULL COMMENT '对应类型',
  `mid` int(11) DEFAULT '0' COMMENT '管理id',
  `downci` int(11) DEFAULT '0' COMMENT '下载次数',
  `keyoi` varchar(20) DEFAULT NULL COMMENT '对应序号邮件附件中用到',
  `pdfpath` varchar(100) DEFAULT NULL COMMENT '转pdf后路径',
  `oid` int(11) DEFAULT '0' COMMENT '旧ID',
  `mknum` varchar(30) DEFAULT NULL COMMENT '模块编号',
  `comid` smallint(6) DEFAULT '0' COMMENT '所属单位',
  `thumbplat` varchar(100) DEFAULT NULL COMMENT '上传到平台上缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='上传文件记录表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_file`
--

INSERT INTO `xinhu_file` (`id`, `filenum`, `valid`, `filename`, `filetype`, `fileext`, `filesize`, `filesizecn`, `filepath`, `thumbpath`, `optid`, `optname`, `adddt`, `ip`, `web`, `mtype`, `mid`, `downci`, `keyoi`, `pdfpath`, `oid`, `mknum`, `comid`, `thumbplat`) VALUES
(1, NULL, 1, 'timg1.jpg', 'image/jpeg', 'jpg', 109127, '106.57 KB', 'upload/2019-12/12_23522668.jpg', 'upload/2019-12/12_23522668_s.jpg', 1, '管理员', '2019-12-12 23:52:26', '113.118.36.110', 'Chrome', NULL, 0, 0, NULL, NULL, 0, NULL, 1, NULL),
(2, NULL, 1, '0 (1).jpg', 'image/jpeg', 'jpg', 6569, '6.42 KB', 'upload/2019-12/13_11570526.jpg', 'upload/2019-12/13_11570526_s.jpg', 1, '管理员', '2019-12-13 11:57:05', '127.0.0.1', 'Chrome', 'custract', 5, 0, NULL, NULL, 0, 'custract', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_files`
--

CREATE TABLE IF NOT EXISTS `xinhu_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optname` varchar(50) DEFAULT NULL COMMENT '操作人',
  `fileid` int(11) DEFAULT '0' COMMENT '关联file.id',
  `optid` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0预览,1下载',
  `ip` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fileid` (`fileid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件记录下载和预览' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_fininfom`
--

CREATE TABLE IF NOT EXISTS `xinhu_fininfom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) DEFAULT '0' COMMENT '类型@0|报销单,1|出差报销,2|借款单,3|还款单,4|付款申请,5|开票申请',
  `uid` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `moneycn` varchar(100) DEFAULT NULL COMMENT '大写金额',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `bills` smallint(6) DEFAULT NULL COMMENT '附单据(张)',
  `paytype` varchar(20) DEFAULT NULL COMMENT '付款方式',
  `fullname` varchar(100) DEFAULT NULL COMMENT '收款人全称',
  `cardid` varchar(50) DEFAULT NULL COMMENT '收款帐号',
  `openbank` varchar(50) DEFAULT NULL COMMENT '开户行',
  `purpose` varchar(100) DEFAULT NULL COMMENT '用途',
  `purresult` varchar(100) DEFAULT NULL,
  `paydt` date DEFAULT NULL COMMENT '付款日期',
  `num` varchar(30) DEFAULT NULL COMMENT '合同号/订单号',
  `name` varchar(50) DEFAULT NULL COMMENT '开票名称',
  `shibieid` varchar(50) DEFAULT NULL COMMENT '纳税识别号',
  `address` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `custid` int(11) DEFAULT '0' COMMENT '对应客户ID',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `paycard` varchar(50) DEFAULT NULL COMMENT '付款账号： by andy.ma',
  `depart` varchar(50) DEFAULT NULL COMMENT '部门  by andy.ma',
  `optnameid` int(11) DEFAULT NULL COMMENT '操作者id  by andy.ma',
  `departid` int(11) DEFAULT NULL COMMENT '部门id  by andy.ma',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='费用报销' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_fininfom`
--

INSERT INTO `xinhu_fininfom` (`id`, `type`, `uid`, `money`, `moneycn`, `optdt`, `optid`, `optname`, `applydt`, `explain`, `status`, `isturn`, `bills`, `paytype`, `fullname`, `cardid`, `openbank`, `purpose`, `purresult`, `paydt`, `num`, `name`, `shibieid`, `address`, `tel`, `custid`, `comid`, `paycard`, `depart`, `optnameid`, `departid`) VALUES
(1, 2, 1, '100.00', '壹佰元整', '2019-12-12 10:16:23', 1, '管理员', '2019-12-12', '借个100元吃饭', 0, 1, NULL, '现金', 'szrwtech开发团队', 'admin@szrwtech.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '分公司A', 2, 7),
(2, 3, 1, '1000.00', '壹仟元整', '2019-12-12 10:42:06', 1, '管理员', '2019-12-12', '资金借入1000', 0, 1, NULL, '银行转账', '一本账', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '分公司A', 2, 7);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_fininfos`
--

CREATE TABLE IF NOT EXISTS `xinhu_fininfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表fininfom.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `sdt` date DEFAULT NULL COMMENT '发生日期',
  `name` varchar(20) DEFAULT NULL COMMENT '所属项目',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `sm` varchar(100) DEFAULT NULL COMMENT '说明',
  `didian` varchar(50) DEFAULT NULL COMMENT '发生地点',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='费用报销子表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_finjibook`
--

CREATE TABLE IF NOT EXISTS `xinhu_finjibook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收入,1支出',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `custid` int(11) DEFAULT '0' COMMENT '对应客户Id',
  `custname` varchar(100) DEFAULT NULL COMMENT '关联客户名',
  `applydt` date DEFAULT NULL COMMENT '记账日期',
  `optid` int(11) DEFAULT '0',
  `optname` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT '0' COMMENT '相关人员',
  `xguid` int(11) DEFAULT '0',
  `xgname` varchar(50) DEFAULT NULL,
  `xgdeptname` varchar(100) DEFAULT NULL COMMENT '关联部门',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `mknum` varchar(100) DEFAULT NULL COMMENT '关联单据',
  `accountid` int(11) DEFAULT '0' COMMENT '关联财务帐号finount.id',
  `zhangid` int(11) DEFAULT '0' COMMENT '关联账套finzhang.id',
  `jtype` varchar(50) DEFAULT NULL COMMENT '记账类型',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_finkemu`
--

CREATE TABLE IF NOT EXISTS `xinhu_finkemu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `type` tinyint(1) DEFAULT '0' COMMENT '0资产1负债2权益3成本4损益',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`,`num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_finount`
--

CREATE TABLE IF NOT EXISTS `xinhu_finount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `bankname` varchar(50) DEFAULT NULL COMMENT '开户行',
  `banknum` varchar(30) DEFAULT NULL COMMENT '帐号',
  `bankming` varchar(50) DEFAULT NULL COMMENT '开户名',
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  `money` decimal(12,2) DEFAULT '0.00' COMMENT '剩余金额',
  `opendt` date DEFAULT NULL COMMENT '开户日期',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_finpiao`
--

CREATE TABLE IF NOT EXISTS `xinhu_finpiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optname` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optid` int(11) DEFAULT '0',
  `custid` int(11) DEFAULT '0' COMMENT '对应客户ID',
  `maicustname` varchar(100) DEFAULT NULL COMMENT '购买方',
  `maicustid` int(11) DEFAULT '0' COMMENT '购买方Id',
  `type` tinyint(1) DEFAULT '0' COMMENT '0开,1收到',
  `custname` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `daima` varchar(50) DEFAULT NULL COMMENT '发票代码',
  `haoma` varchar(50) DEFAULT NULL COMMENT '发票号码',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `opendt` date DEFAULT NULL COMMENT '开票日期',
  `ptype` varchar(50) DEFAULT NULL COMMENT '发票类型',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `kainame` varchar(50) DEFAULT NULL COMMENT '开票人',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `opendt` (`opendt`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='发票管理表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_finzhang`
--

CREATE TABLE IF NOT EXISTS `xinhu_finzhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `name` varchar(100) DEFAULT NULL COMMENT '账套名称',
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  `optid` int(11) DEFAULT '0' COMMENT '创建人',
  `optname` varchar(50) DEFAULT NULL COMMENT '创建人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_bill`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sericnum` varchar(50) DEFAULT NULL COMMENT '单号',
  `table` varchar(50) DEFAULT NULL COMMENT '对应表',
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `modeid` smallint(6) DEFAULT '0' COMMENT '模块id',
  `modename` varchar(20) DEFAULT NULL COMMENT '模块名称',
  `uname` varchar(20) DEFAULT NULL COMMENT '申请人姓名',
  `uid` smallint(6) DEFAULT NULL COMMENT '用户id',
  `udeptid` int(11) DEFAULT '0' COMMENT '部门0为主部门',
  `udeptname` varchar(30) DEFAULT NULL COMMENT '申请人部门',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0' COMMENT '操作人Id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `allcheckid` varchar(500) DEFAULT NULL COMMENT '@所有审核人',
  `isdel` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '当前状态值',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `nstatustext` varchar(100) DEFAULT NULL COMMENT '当前状态',
  `status` tinyint(1) DEFAULT '0',
  `nowcourseid` int(11) DEFAULT '0' COMMENT '当前步骤Id',
  `nowcheckid` varchar(500) DEFAULT NULL COMMENT '当前审核人id',
  `nowcheckname` varchar(500) DEFAULT NULL COMMENT '当前审核人',
  `checksm` varchar(200) DEFAULT NULL COMMENT '最后审核说明',
  `updt` datetime DEFAULT NULL COMMENT '最后更新时间',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `tuiid` int(11) DEFAULT '0' COMMENT '退回flow_log.Id',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '是否已提交了',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sericnum` (`sericnum`) USING BTREE,
  KEY `table` (`table`,`mid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `modeid` (`modeid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程单据' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_flow_bill`
--

INSERT INTO `xinhu_flow_bill` (`id`, `sericnum`, `table`, `mid`, `modeid`, `modename`, `uname`, `uid`, `udeptid`, `udeptname`, `optdt`, `optid`, `optname`, `allcheckid`, `isdel`, `nstatus`, `applydt`, `nstatustext`, `status`, `nowcourseid`, `nowcheckid`, `nowcheckname`, `checksm`, `updt`, `createdt`, `tuiid`, `isturn`) VALUES
(1, 'FC-20191212-001', 'fininfom', 1, 26, '借款单', '管理员', 1, 0, '壹本账科技', '2019-12-12 10:16:23', 1, '管理员', '5', 0, 0, '2019-12-12', '待处理', 0, 13, '5', NULL, NULL, '2019-12-12 10:16:23', '2019-12-12 10:16:23', 0, 1),
(2, 'FD-20191212-001', 'fininfom', 2, 27, '资金借入单', '管理员', 1, 0, '壹本账科技', '2019-12-12 10:42:06', 1, '管理员', '1', 0, 0, '2019-12-12', '待处理', 0, 16, NULL, NULL, NULL, '2019-12-12 10:42:06', '2019-12-12 10:42:06', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_chao`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_chao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modeid` int(11) DEFAULT '0',
  `table` varchar(50) DEFAULT NULL COMMENT '对应表',
  `mid` int(11) DEFAULT '0' COMMENT '对应记录Id',
  `uid` int(11) DEFAULT '0' COMMENT '人员Id',
  `csname` varchar(500) DEFAULT NULL COMMENT '抄送给',
  `csnameid` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0抄送,1关注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `table` (`table`,`mid`) USING BTREE,
  KEY `modeid` (`modeid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='抄送表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_checks`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT '0',
  `mid` int(11) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0',
  `courseid` smallint(6) DEFAULT '0',
  `checkid` varchar(100) DEFAULT NULL,
  `checkname` varchar(100) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `addlx` tinyint(1) DEFAULT '0' COMMENT '类型1自定义,2撤回添加,3退回添加,4转移添加',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据的审核人' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_cname`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_cname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '审核组名',
  `checkid` varchar(50) DEFAULT NULL,
  `checkname` varchar(50) DEFAULT NULL COMMENT '审核人',
  `pid` int(11) DEFAULT '0' COMMENT '上级ID',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '适用对象',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `num` (`num`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='自定义审核人组' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `xinhu_flow_cname`
--

INSERT INTO `xinhu_flow_cname` (`id`, `num`, `name`, `checkid`, `checkname`, `pid`, `receid`, `recename`, `sort`) VALUES
(1, 'group1', '审核人员分组1', '1', '管理员', 0, 'd5', '管理层', 0),
(2, 'group', '审核人员分组', '5', '磐石', 1, 'd1', '信呼开发团队', 0),
(4, 'wewwe', NULL, '3', '小乔', 1, 'd3', '财务部', 22);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_course`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT '上级ID',
  `nid` int(11) DEFAULT '0' COMMENT '下级步骤ID',
  `setid` smallint(6) DEFAULT '0' COMMENT '模块ID',
  `name` varchar(20) DEFAULT NULL COMMENT '步骤名称',
  `num` varchar(20) DEFAULT NULL,
  `checktype` varchar(20) DEFAULT NULL COMMENT '审核人类型',
  `checktypeid` varchar(200) DEFAULT NULL,
  `checktypename` varchar(200) DEFAULT NULL COMMENT '审核人',
  `sort` smallint(6) DEFAULT '0',
  `whereid` smallint(6) DEFAULT '0' COMMENT '流程模块条件下的Id',
  `where` varchar(500) DEFAULT NULL COMMENT '审核条件',
  `explain` varchar(100) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `courseact` varchar(50) DEFAULT NULL COMMENT '审核动作',
  `checkshu` tinyint(2) DEFAULT '1' COMMENT '至少几人审核 ,0全部',
  `checkfields` varchar(500) DEFAULT NULL COMMENT '审核处理表单',
  `pid` smallint(6) DEFAULT '0' COMMENT '上级Id(弃用)',
  `optid` smallint(6) DEFAULT '0' COMMENT '操作人id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人姓名',
  `receid` varchar(1000) DEFAULT NULL COMMENT '适用对象id',
  `recename` varchar(1000) DEFAULT NULL COMMENT '适用对象',
  `iszf` tinyint(1) DEFAULT '0' COMMENT '是否可以转给他人办理',
  `isqm` tinyint(1) DEFAULT '0' COMMENT '手写签名0不用,1都需要,2只需要通过,3只需要不通过',
  `coursetype` tinyint(1) DEFAULT '0' COMMENT '审批方式0顺序,1前置审批,2后置审批',
  `zshtime` int(11) DEFAULT '0' COMMENT '超时时间(分钟)',
  `zshstate` tinyint(2) DEFAULT '1' COMMENT '自动审核类型',
  `zbrangeame` varchar(200) DEFAULT NULL COMMENT '转办人员可选范围',
  `zbrangeid` varchar(200) DEFAULT NULL COMMENT '转办人员可选范围ID',
  `smlx` tinyint(1) DEFAULT '0' COMMENT '处理说明类型',
  `wjlx` tinyint(1) DEFAULT '0' COMMENT '相关文件类型',
  `isxgfj` tinyint(1) DEFAULT '0' COMMENT '审批时是否可直接编辑附件',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `setid` (`setid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程步骤表' AUTO_INCREMENT=89 ;

--
-- 转存表中的数据 `xinhu_flow_course`
--

INSERT INTO `xinhu_flow_course` (`id`, `mid`, `nid`, `setid`, `name`, `num`, `checktype`, `checktypeid`, `checktypename`, `sort`, `whereid`, `where`, `explain`, `optdt`, `status`, `courseact`, `checkshu`, `checkfields`, `pid`, `optid`, `optname`, `receid`, `recename`, `iszf`, `isqm`, `coursetype`, `zshtime`, `zshstate`, `zbrangeame`, `zbrangeid`, `smlx`, `wjlx`, `isxgfj`) VALUES
(1, 0, 0, 5, '上级审核', 'super', 'superall', NULL, NULL, 0, 0, NULL, NULL, '2019-09-23 17:09:58', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 4, NULL, NULL, 0, 0, 0),
(2, 1, 0, 5, '人事审核', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2018-05-07 09:47:03', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(3, 0, 0, 6, '上级审核', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-07-02 22:25:29', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(4, 2, 0, 5, '总经理审核', NULL, 'user', '5', '磐石', 0, 2, NULL, '超过3天24小时', '2016-09-25 14:53:34', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(5, 0, 0, 23, '上级审核', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-08-27 08:46:27', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(6, 0, 0, 24, '行政发放', NULL, 'user', '4', '大乔', 0, 0, NULL, NULL, '2017-08-10 11:42:24', 1, '发放,驳回|red', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(7, 0, 0, 11, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-09-02 17:36:36', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(8, 7, 0, 11, '人事审核', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-09-02 17:38:15', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(9, 8, 0, 11, '财务审核', NULL, 'rank', NULL, '财务总监', 0, 0, NULL, NULL, '2016-09-02 17:39:07', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(10, 0, 0, 25, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-09-03 09:26:32', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(11, 10, 0, 25, '人事审核', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-09-03 09:27:00', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(12, 11, 0, 25, '财务审核', NULL, 'rank', NULL, '财务总监', 0, 0, NULL, NULL, '2016-09-03 09:27:26', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(13, 0, 0, 26, '上级审核', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-09-03 09:27:55', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(14, 13, 0, 26, '人事审核', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-09-03 09:28:18', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(15, 14, 0, 26, '财务审核', NULL, 'rank', NULL, '财务总监', 0, 0, NULL, NULL, '2016-09-03 09:28:35', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(16, 0, 0, 27, '财务确认', NULL, 'rank', NULL, '财务总监', 0, 0, NULL, NULL, '2016-09-03 15:29:45', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(17, 16, 0, 27, '付款确认', NULL, 'apply', NULL, NULL, 0, 0, NULL, NULL, '2016-09-03 15:32:25', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(18, 17, 0, 27, '确认收款', NULL, 'rank', NULL, '财务总监', 0, 0, NULL, NULL, '2016-09-03 15:33:23', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(19, 0, 0, 28, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2017-02-08 14:39:04', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(20, 19, 0, 28, '行政审批', NULL, 'cname', 'group1', '审核人员分组1', 0, 0, NULL, NULL, '2018-07-28 22:05:34', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(21, 0, 0, 19, '上级复搞', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2019-04-10 20:17:46', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 1, 2, NULL, 0, 1, '小乔,貂蝉', 'u3,u2', 0, 0, 1),
(22, 21, 0, 19, '主要领导会签', NULL, 'rank', NULL, '分管领导', 0, 0, NULL, NULL, '2019-04-10 20:43:05', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 2, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(23, 22, 0, 19, '领导签发', NULL, 'change', NULL, NULL, 0, 0, NULL, NULL, '2019-04-10 20:43:13', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 1),
(24, 0, 0, 20, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2017-10-24 10:07:45', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(25, 24, 0, 20, '主要领导会签', NULL, 'change', NULL, NULL, 0, 0, NULL, NULL, '2019-04-22 19:17:16', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(26, 25, 0, 20, '领导签发', NULL, 'change', NULL, NULL, 0, 0, NULL, NULL, '2019-04-22 19:17:22', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(27, 0, 0, 32, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-10-06 20:43:27', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(28, 27, 0, 32, '人事审批', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-10-07 10:24:03', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(29, 0, 0, 33, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-10-07 11:41:01', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(30, 29, 0, 33, '人事审批', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-10-07 11:41:17', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(31, 0, 0, 34, '人事审核', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-10-07 19:24:54', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(32, 0, 0, 38, '人事审批', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-10-19 21:48:34', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(33, 0, 0, 37, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2019-04-06 22:37:58', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(34, 33, 0, 37, '人事审批', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2019-04-06 22:38:02', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(35, 0, 0, 39, '当事人确认', 'objectque', 'auto', NULL, NULL, 0, 0, NULL, NULL, '2016-10-20 20:52:15', 1, '无异议,不认可', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(36, 35, 0, 39, '人事审批', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-10-20 20:53:10', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(37, 0, 0, 44, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-10-28 11:29:50', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(38, 37, 0, 44, '行政确认', NULL, 'user', '3', '小乔', 0, 0, NULL, NULL, '2017-08-25 20:03:02', 1, NULL, 1, 'kmstart,carid,carnum', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(39, 0, 0, 46, '行政确认', NULL, 'user', '3', '小乔', 0, 0, NULL, NULL, '2018-11-06 20:58:16', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(40, 39, 0, 46, '借阅人归返', NULL, 'apply', NULL, NULL, 0, 0, NULL, NULL, '2016-10-29 22:26:13', 1, '确认归还', 1, 'ghtime', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(41, 0, 0, 49, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-12-08 21:32:07', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(42, 41, 0, 49, '保管人确认', 'bgque', 'auto', NULL, NULL, 0, 0, NULL, NULL, '2019-04-19 18:22:12', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(43, 42, 0, 49, '申请人确认', NULL, 'apply', NULL, NULL, 0, 0, NULL, NULL, '2016-12-08 21:56:33', 1, '已盖章,放弃盖章', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(44, 0, 0, 51, '上级审核', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-12-16 18:02:01', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(45, 44, 0, 51, '人事确认', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2016-12-16 18:02:21', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(46, 0, 0, 52, '上级审核', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2016-12-19 09:58:39', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(47, 0, 0, 24, '行政确认', NULL, 'rank', NULL, '人事主管', 1, 0, NULL, NULL, '2017-09-26 10:20:04', 1, NULL, 1, NULL, 0, 0, NULL, 'd3,d4', '财务部,行政人事部', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(48, 47, 0, 24, '行政发放', NULL, 'user', '3', '小乔', 1, 0, NULL, NULL, '2017-08-09 16:58:39', 1, '发放,驳回|red', 1, NULL, 0, 0, NULL, 'u3', '小乔', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(50, 38, 0, 44, '驾驶员归还', 'jias', 'auto', NULL, NULL, 0, 0, NULL, NULL, '2017-03-01 14:58:11', 1, '已归还', 1, 'kmend,returndt', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(51, 0, 52, 4, '任务分配', NULL, 'super', NULL, NULL, 0, 4, NULL, '未分配时', '2018-07-06 16:14:45', 1, '同意分配|green|3,不通过|red', 1, 'dist', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(52, 0, 0, 4, '执行人执行', 'run', 'auto', NULL, NULL, 0, 0, NULL, '已分配', '2017-08-12 16:16:16', 1, '已完成||6,无法完成|red,执行中||4', 1, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(53, 52, 0, 4, '提交人验证', NULL, 'opt', NULL, NULL, 0, 0, NULL, NULL, '2017-08-15 17:46:47', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(55, 0, 0, 59, '行政确认', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2017-06-26 21:26:30', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(56, 0, 0, 60, '行政确认', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2017-06-27 13:03:25', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(57, 56, 0, 60, '驾驶员处理', 'jia', 'auto', NULL, NULL, 0, 0, NULL, NULL, '2017-06-27 13:04:24', 1, NULL, 1, 'address,bujian,kmshu', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(58, 57, 0, 60, '驾驶员取车', 'jia', 'auto', NULL, NULL, 0, 0, NULL, NULL, '2017-06-27 13:05:41', 1, NULL, 1, 'nextdt,kmnshu,enddt,money', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(59, 3, 0, 6, '核算加班费', NULL, 'rank', NULL, '人事主管', 0, 129, NULL, NULL, '2017-06-29 10:05:49', 1, NULL, 1, 'jiafee', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(60, 0, 0, 62, '行政人员检查', NULL, 'user', '4', '大乔', 0, 0, NULL, NULL, '2017-07-07 13:16:02', 1, '确认', 1, 'iswx,reasons,money,wxname', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(61, 60, 0, 62, '外修确认', NULL, 'user', '4', '大乔', 0, 140, NULL, NULL, '2017-07-07 13:36:48', 1, NULL, 1, 'money,wxname', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(62, 0, 0, 64, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2017-08-07 20:21:47', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(63, 62, 0, 64, '出纳付款', NULL, 'rank', NULL, '出纳', 0, 0, NULL, NULL, '2017-10-09 15:32:23', 1, '已付款', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(64, 0, 0, 65, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2017-08-07 21:11:40', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(65, 64, 0, 65, '财务审批', NULL, 'rank', NULL, '财务总监', 0, 0, NULL, NULL, '2017-08-07 21:11:58', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(66, 65, 0, 65, '会计开票', NULL, 'rank', NULL, '出纳', 0, 0, NULL, NULL, '2017-08-07 21:12:24', 1, '已开票', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(71, 0, 0, 72, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2019-08-15 21:08:25', 1, NULL, 1, 'tanxuan|tanxuancheck', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(72, 0, 0, 76, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2017-12-28 14:12:41', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(73, 0, 0, 77, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2018-03-06 14:49:42', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(74, 0, 0, 78, '人事审核', NULL, 'rank', NULL, '人事主管', 0, 0, NULL, NULL, '2018-04-18 19:41:00', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(75, 0, 0, 79, '面试人确认', 'msque', 'field', 'msuserid', '面试人员(msuserid)', 0, 0, NULL, NULL, '2018-04-18 22:35:24', 1, '可以面试,不适合', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(76, 75, 0, 79, '面试结果', NULL, 'field', 'msuserid', '面试人员(msuserid)', 0, 0, NULL, NULL, '2018-04-18 21:34:30', 1, '面试记录', 1, 'state,mscont', 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(77, 76, 0, 79, '安排人确认', NULL, 'apply', NULL, NULL, 0, 0, NULL, NULL, '2018-04-18 23:03:09', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0),
(78, 71, 0, 72, '人事审批', 'rsnum', 'user', '2', '貂蝉', 0, 0, NULL, NULL, '2019-04-24 16:14:43', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 1, 1, NULL, 0, 1, '磐石', 'u5', 0, 0, 0),
(79, 78, 0, 72, '财务审批', 'cwnum', 'change', 'g3', '部门负责人', 0, 0, NULL, NULL, '2019-04-24 19:48:07', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, 0, 1, '本部门(含下级部门)', 'deptall', 0, 0, 0),
(82, 79, 0, 72, '最后确认', 'queren', 'apply', NULL, NULL, 0, 0, NULL, NULL, '2019-02-24 12:17:24', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(83, 0, 0, 87, '接收人接收', NULL, 'field', 'qiannameid', '签收人(qiannameid)', 0, 0, NULL, NULL, '2019-03-09 12:34:20', 1, '接收,拒接', 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 1),
(84, 78, 0, 72, '行政审批', NULL, 'change', 'd4,d3', '行政人事部,财务部', 0, 0, NULL, NULL, '2019-04-25 10:33:38', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(85, 84, 0, 72, '管理层审批', NULL, 'change', NULL, NULL, 0, 0, NULL, NULL, '2019-04-24 23:23:06', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(86, 84, 0, 72, '领导审批', NULL, 'user', '5', '磐石', 0, 0, NULL, NULL, '2019-04-25 20:06:22', 1, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(87, 0, 84, 72, '上级处理', NULL, 'change', 'd2', '开发部', 0, 0, NULL, NULL, '2019-04-24 22:11:45', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0),
(88, 0, 0, 92, '上级审批', NULL, 'super', NULL, NULL, 0, 0, NULL, NULL, '2019-05-09 17:40:51', 1, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_element`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `fields` varchar(50) DEFAULT NULL COMMENT '对应字段',
  `fieldstype` varchar(30) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `dev` varchar(100) DEFAULT NULL COMMENT '默认值',
  `isbt` tinyint(1) DEFAULT '0' COMMENT '是否必填',
  `data` varchar(500) DEFAULT NULL COMMENT '数据源',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否录入元素',
  `iszs` tinyint(1) DEFAULT '1' COMMENT '是否列表展示',
  `attr` varchar(500) DEFAULT NULL COMMENT '属性',
  `iszb` tinyint(1) DEFAULT '0',
  `isss` tinyint(1) DEFAULT '0',
  `lattr` varchar(100) DEFAULT NULL COMMENT '列属性',
  `width` varchar(10) DEFAULT NULL COMMENT '列宽',
  `lens` smallint(6) DEFAULT '0' COMMENT '字段长度',
  `savewhere` varchar(100) DEFAULT NULL COMMENT '保存条件',
  `islb` tinyint(1) DEFAULT '1' COMMENT '是否列表列',
  `ispx` tinyint(1) DEFAULT '0' COMMENT '是否可排序',
  `isalign` tinyint(1) DEFAULT '0' COMMENT '0居中,1居左,2居右',
  `issou` tinyint(1) DEFAULT '0' COMMENT '是否可搜索',
  `istj` tinyint(1) DEFAULT '0' COMMENT '是否可统计',
  `gongsi` varchar(500) DEFAULT NULL COMMENT '计算公式',
  `placeholder` varchar(50) DEFAULT NULL COMMENT '提示内容',
  `isonly` tinyint(1) DEFAULT '0' COMMENT '是否唯一',
  `isdr` tinyint(1) DEFAULT '0' COMMENT '是否导入字段',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `fields` (`fields`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块元素' AUTO_INCREMENT=1073 ;

--
-- 转存表中的数据 `xinhu_flow_element`
--

INSERT INTO `xinhu_flow_element` (`id`, `mid`, `name`, `fields`, `fieldstype`, `sort`, `dev`, `isbt`, `data`, `islu`, `iszs`, `attr`, `iszb`, `isss`, `lattr`, `width`, `lens`, `savewhere`, `islb`, `ispx`, `isalign`, `issou`, `istj`, `gongsi`, `placeholder`, `isonly`, `isdr`) VALUES
(1, 1, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(2, 1, '类型名称', 'typename', 'rockcombo', 2, NULL, 1, 'gongtype,name,tree', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(3, 1, '内容', 'content', 'htmlediter', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(4, 1, '发送给', 'recename', 'changedeptusercheck', 4, NULL, 0, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '不选默认为发给全部人员', 0, 0),
(5, 1, '相应地址', 'url', 'text', 5, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(6, 2, '会议室', 'hyname', 'rockcombo', 0, NULL, 1, 'hyname', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(7, 2, '主题', 'title', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(8, 2, '开始时间', 'startdt', 'datetime', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(9, 2, '结束时间', 'enddt', 'datetime', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(10, 2, '参会人', 'joinname', 'changedeptusercheck', 5, NULL, 1, 'joinid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(11, 2, '说明', 'explain', 'textarea', 8, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(12, 3, '日期', 'dt', 'date', 3, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(13, 3, '日报类型', 'type', 'select', 2, '0', 1, '0|日报,1|周报,2|月报,3|年报', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(14, 3, '截止日期', 'enddt', 'date', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(15, 3, '内容', 'content', 'textarea', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(16, 3, '明日计划', 'plan', 'textarea', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(17, 3, '新增时间', 'adddt', 'hidden', 7, '{now}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(18, 3, '人员', 'optname', 'text', 1, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(19, 2, '发起人', 'optname', 'text', 9, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(20, 4, '类型', 'type', 'rockcombo', 1, NULL, 1, 'worktype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(21, 4, '等级', 'grade', 'rockcombo', 2, NULL, 1, 'workgrade', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(22, 4, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(23, 4, '分配给', 'dist', 'changeuser', 3, NULL, 0, 'distid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(24, 4, '说明', 'explain', 'textarea', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(26, 4, '创建人', 'optname', 'text', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(27, 4, '创建时间', 'optdt', 'datetime', 12, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(28, 4, '开始时间', 'startdt', 'datetime', 6, '{now}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(29, 4, '截止时间', 'enddt', 'datetime', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(30, 5, '请假', 'kind', 'fixed', 0, '请假', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(31, 5, '请假类型', 'qjkind', 'rockcombo', 1, NULL, 1, 'kqqjkind', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(32, 5, '开始时间', 'stime', 'datetime', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(33, 5, '截止时间', 'etime', 'datetime', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(34, 5, '时间(小时)', 'totals', 'number', 4, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(35, 5, '说明', 'explain', 'textarea', 7, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(36, 6, '类型', 'kind', 'fixed', 0, '加班', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(37, 6, '开始时间', 'stime', 'datetime', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(38, 6, '截止时间', 'etime', 'datetime', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(39, 6, '时间(小时)', 'totals', 'number', 4, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0),
(40, 6, '说明', 'explain', 'textarea', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(41, 7, '客户名称', 'name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 1, 1),
(42, 7, '所属人', 'suoname', 'text', 1, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(43, 7, '客户类型', 'type', 'rockcombo', 2, NULL, 1, 'crmtype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 1),
(44, 7, '来源', 'laiyuan', 'rockcombo', 3, NULL, 1, 'crmlaiyuan', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 1, NULL, NULL, 0, 1),
(45, 7, '客户单位', 'unitname', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(47, 7, '联系电话', 'tel', 'text', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 1),
(48, 7, '联系手机', 'mobile', 'text', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 1),
(49, 7, '邮箱', 'email', 'text', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(50, 7, '说明', 'explain', 'textarea', 19, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(51, 7, '地址', 'address', 'text', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 1),
(52, 7, '交通路线', 'routeline', 'textarea', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(53, 8, '客户', 'custid', 'hidden', 0, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(54, 8, '客户', 'custname', 'selectdatafalse', 1, NULL, 1, 'selectcust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(55, 8, '状态', 'state', 'rockcombo', 8, '0', 1, 'crmstate,value', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(56, 8, '说明', 'explain', 'textarea', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(57, 8, '申请日期', 'applydt', 'date', 2, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(58, 8, '来源', 'laiyuan', 'rockcombo', 3, NULL, 1, 'custsalelai', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(59, 8, '金额', 'money', 'number', 4, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(60, 8, '添加时间', 'adddt', 'datetime', 5, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(61, 8, '创建人', 'createname', 'text', 6, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(62, 8, '销售人员', 'optname', 'text', 7, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(63, 9, '名称', 'name', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(64, 9, '对应分类', 'typeid', 'select', 2, NULL, 1, 'option:getcnumdata,goodstype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(65, 9, '规格', 'guige', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(66, 9, '型号', 'xinghao', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(67, 9, '单价', 'price', 'number', 5, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(68, 9, '单位', 'unit', 'rockcombo', 6, NULL, 1, 'rockunit', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(69, 9, '说明', 'explain', 'textarea', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(70, 10, '用户Id', 'id', 'number', 22, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(71, 10, '姓名', 'name', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(72, 10, '部门Id', 'deptid', 'number', 8, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(73, 10, '部门', 'deptname', 'changedept', 9, NULL, 1, 'deptid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 1, NULL, NULL, 0, 1),
(74, 10, '职位', 'ranking', 'text', 10, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 1, NULL, NULL, 0, 1),
(75, 10, '上级主管', 'superman', 'changeusercheck', 13, NULL, 0, 'superid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 1, NULL, NULL, 0, 1),
(76, 10, '上级主管id', 'superid', 'text', 14, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(77, 10, '用户名', 'user', 'text', 2, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '不能包含中文', 1, 1),
(78, 10, '编号', 'num', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '唯一编号/工号', 1, 0),
(79, 7, '状态', 'status', 'select', 15, '1', 1, '1|启用,0|停用', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(80, 12, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(81, 12, '提醒时间', 'startdt', 'datetime', 1, '{now}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(82, 12, '重复', 'rate', 'select', 2, NULL, 0, 'd|每天,w|每周,m|每月', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(83, 12, '重复值', 'rateval', 'checkboxall', 3, NULL, 0, '0|无,1|啊', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(84, 12, '说明', 'explain', 'textarea', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(85, 12, '记事人', 'optname', 'text', 5, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(86, 12, '截止时间', 'enddt', 'datetime', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(87, 12, '提醒', 'txsj', 'select', 7, '0', 1, '0|不提醒,1|提醒', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(88, 21, '打卡时间', 'dkdt', 'datetime', 1, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(89, 21, '打卡类型', 'type', 'text', 2, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(90, 21, '添加时间', 'optdt', 'datetime', 3, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(91, 21, '定位地址', 'address', 'text', 4, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(92, 21, '姓名', 'base_name', 'text', 0, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(93, 22, '项目类型', 'type', 'rockcombo', 2, NULL, 1, 'projecttype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(94, 22, '编号', 'num', 'text', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(95, 22, '名称', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(96, 22, '开始时间', 'startdt', 'datetime', 3, '{now}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(97, 22, '预计结束时间', 'enddt', 'datetime', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(98, 22, '负责人', 'fuze', 'changeuser', 5, NULL, 1, 'fuzeid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(99, 22, '执行人', 'runuser', 'changedeptusercheck', 6, NULL, 1, 'runuserid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(100, 22, '进度(%)', 'progress', 'select', 7, '0', 1, 'progressdata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(101, 22, '内容', 'content', 'htmlediter', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(102, 22, '状态', 'status', 'select', 20, '0', 1, '0|待执行,1|已完成,3|执行中', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(103, 23, '类型', 'atype', 'select', 1, '外出', 1, '外出,出差', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(104, 23, '外出地址', 'address', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(105, 23, '外出时间', 'outtime', 'datetime', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(106, 23, '预计回岗', 'intime', 'datetime', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(107, 23, '外出理由', 'reason', 'text', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(108, 23, '说明', 'explain', 'textarea', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(109, 24, '申请日期', 'applydt', 'text', 0, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(110, 24, '类型', 'type', 'fixed', 0, '0', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(111, 24, '说明', 'explain', 'textarea', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(112, 24, '物品', 'temp_aid', 'selectdatatrue', 0, NULL, 1, 'getgoodsdata,aid', 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(113, 24, '领用数量', 'count', 'number', 2, '0', 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(114, 11, '申请日期', 'applydt', 'text', 0, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(115, 11, '单据数(张)', 'bills', 'number', 0, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(116, 11, '收款人全称', 'fullname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(117, 11, '付款方式', 'paytype', 'rockcombo', 0, NULL, 1, 'paytype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(118, 11, '收款帐号', 'cardid', 'text', 0, '', 1, '', 1, 1, '', 0, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(119, 11, '开户行', 'openbank', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(120, 11, '报销金额', 'money', 'number', 0, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(121, 11, '大写金额', 'moneycn', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(122, 11, '发生日期', 'sdt', 'date', 0, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(123, 11, '报销项目', 'name', 'rockcombo', 0, NULL, 1, 'finaitems', 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(124, 11, '金额', 'money', 'number', 0, '0', 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(125, 11, '说明', 'sm', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(126, 24, '单位', 'unit', 'text', 3, NULL, 0, NULL, 0, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(127, 25, '申请日期', 'applydt', 'text', 0, '{date}', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0),
(128, 25, '附单据(张)', 'bills', 'number', 1, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(129, 25, '出差目的', 'purpose', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(130, 25, '出差成果', 'purresult', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(131, 25, '收款人全称', 'fullname', 'text', 4, '', 1, '', 1, 1, '', 0, 0, '', '', 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(132, 25, '付款方式', 'paytype', 'rockcombo', 5, '', 1, 'paytype', 1, 1, '', 0, 0, '', '', 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(133, 25, '收款帐号', 'cardid', 'text', 6, '', 1, '', 1, 1, '', 0, 0, '', '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(134, 25, '开户行', 'openbank', 'text', 7, '', 1, '', 1, 1, '', 0, 0, '', '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(135, 25, '报销金额', 'money', 'text', 8, '0', 1, '', 1, 1, '', 0, 0, '', '', 0, NULL, 1, 0, 0, 1, 1, NULL, NULL, 0, 0),
(136, 25, '大写金额', 'moneycn', 'text', 9, '', 1, '', 1, 1, '', 0, 0, '', '', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(137, 25, '发生日期', 'sdt', 'date', 0, '', 1, '', 1, 1, '', 1, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(138, 25, '报销项目', 'name', 'rockcombo', 1, '', 1, 'finaitems', 1, 1, '', 1, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(139, 25, '金额', 'money', 'number', 2, '0', 1, '', 1, 1, '', 1, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(140, 25, '说明', 'sm', 'text', 4, '', 0, '', 1, 1, '', 1, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(141, 25, '发生地点', 'didian', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(142, 25, '说明', 'explain', 'textarea', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(143, 25, '单据类型', 'type', 'fixed', 11, '1', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(144, 26, '单据类型', 'type', 'fixed', 0, '2', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(145, 26, '申请日期', 'applydt', 'text', 1, '{date}', 1, NULL, 1, 1, 'readonly', 0, 1, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(146, 26, '借款用途', 'purpose', 'text', 2, NULL, 0, NULL, 0, 1, NULL, 0, 1, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(147, 26, '收款人全称', 'fullname', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 0, 1, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(148, 26, '付款方式', 'paytype', 'rockcombo', 4, NULL, 1, 'paytype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(149, 26, '收款帐号', 'cardid', 'text', 5, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(150, 26, '开户行', 'openbank', 'text', 6, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(151, 26, '借款金额', 'money', 'text', 7, '0', 1, NULL, 1, 1, NULL, 0, 1, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(152, 26, '借款金额大写', 'moneycn', 'text', 8, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(153, 26, '说明', 'explain', 'textarea', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(154, 11, '说明', 'explain', 'textarea', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(155, 27, '类型', 'type', 'fixed', 0, '3', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(156, 27, '申请日期', 'applydt', 'text', 0, '{date}', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(157, 27, '付款方式', 'paytype', 'rockcombo', 0, NULL, 1, 'paytype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(158, 27, '收款人全称', 'fullname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(159, 27, '收款帐号', 'cardid', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(160, 27, '还款金额', 'money', 'number', 0, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(161, 27, '还款金额大写', 'moneycn', 'text', 0, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(162, 27, '说明', 'explain', 'textarea', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(163, 27, '需还款金额', 'temp_money', 'auto', 0, NULL, 0, 'jiekuantongs', 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(164, 28, '申请日期', 'applydt', 'text', 0, '{date}', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(165, 28, '说明', 'explain', 'textarea', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(166, 28, '类型', 'type', 'fixed', 2, '1', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(168, 28, '供应商名称', 'custname', 'selectdatafalse', 3, NULL, 1, 'goods:getgys,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(169, 28, '采购金额', 'money', 'number', 5, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, '[{zb0.count}*{zb0.price}] - [{discount}]', NULL, 0, 0),
(170, 28, '物品', 'temp_aid', 'selectdatatrue', 0, NULL, 1, 'getgoodsdata,aid', 1, 1, NULL, 1, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(171, 28, '采购数量', 'count', 'number', 2, '0', 1, '', 1, 1, '', 1, 0, '', '', 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(172, 28, '单位', 'unit', 'text', 3, NULL, 0, NULL, 1, 1, 'readonly', 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(173, 28, '单价', 'price', 'number', 4, '0', 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(174, 7, '供应商', 'isgys', 'checkbox', 17, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(175, 19, '标题', 'title', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(176, 19, '主题词', 'titles', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '多个空格分开', 0, 0),
(177, 19, '公文等级', 'grade', 'rockcombo', 6, NULL, 1, 'officialgrade', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(178, 19, '公文类型', 'class', 'rockcombo', 7, NULL, 1, 'officialclass', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(179, 19, '公文编号', 'num', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(180, 19, '公文内容', 'content', 'htmlediter', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(181, 19, '拟办意见', 'explain', 'textarea', 13, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(182, 19, '需要查阅', 'recename', 'changedeptusercheck', 16, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '选可查阅人员对象', 0, 0),
(183, 20, '标题', 'title', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(184, 20, '主题词', 'titles', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, '多个空格分开', 0, 0),
(185, 20, '公文等级', 'grade', 'rockcombo', 6, NULL, 1, 'officialgrade', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(186, 20, '公文密级', 'miji', 'rockcombo', 8, NULL, 1, 'officialmiji', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(187, 20, '公文编号', 'num', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(188, 20, '公文内容', 'content', 'htmlediter', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(189, 20, '说明', 'explain', 'textarea', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(190, 20, '需要查阅', 'recename', 'changedeptusercheck', 13, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(191, 20, '类型', 'type', 'fixed', 2, '1', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(192, 4, '所属项目', 'projectid', 'select', 4, NULL, 0, 'projectdata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(193, 30, '类型', 'kind', 'rockcombo', 1, '请假', 1, 'kqkind', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(199, 30, '对应人员', 'uname', 'changeuser', 0, NULL, 1, 'uid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(195, 30, '开始时间', 'stime', 'datetime', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(196, 30, '截止时间', 'etime', 'datetime', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(197, 30, '时间(小时)', 'totals', 'number', 1, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(198, 30, '说明', 'explain', 'textarea', 2, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(200, 2, '状态', 'state', 'text', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(201, 1, '来源', 'zuozhe', 'text', 6, '{deptname}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(202, 1, '日期', 'indate', 'date', 7, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(203, 29, '电话', 'tel', 'text', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(204, 29, '手机号', 'mobile', 'text', 10, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(205, 29, '邮箱', 'email', 'text', 11, NULL, 0, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(206, 29, '生日类型', 'birtype', 'select', 12, '0', 1, '0|阳历', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(207, 29, '生日', 'birthday', 'date', 13, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '选择身份证上日期', 0, 1),
(208, 29, '学历', 'xueli', 'text', 14, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(209, 29, '民族', 'minzu', 'text', 15, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(210, 29, '籍贯', 'jiguan', 'selectdatafalse', 16, NULL, 1, 'city:alldata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(211, 29, '婚姻', 'hunyin', 'select', 9, NULL, 1, '未婚,已婚', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(212, 29, '现住址', 'nowdizhi', 'text', 8, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(213, 29, '家庭住址', 'housedizhi', 'text', 7, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(214, 29, '姓名', 'name', 'text', 0, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(215, 29, '部门', 'deptname', 'text', 1, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(216, 29, '职位', 'ranking', 'text', 2, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(217, 29, '人员状态', 'state', 'rockcombo', 3, NULL, 0, 'userstate,value', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 1),
(218, 31, '合同名称', 'name', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(219, 31, '开始日期', 'startdt', 'date', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(220, 31, '截止日期', 'enddt', 'date', 7, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(221, 31, '合同类型', 'httype', 'rockcombo', 5, NULL, 1, 'userhttype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(222, 31, '状态', 'state', 'text', 8, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(223, 31, '签署单位', 'company', 'hidden', 3, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(224, 31, '签署人', 'uname', 'changeuser', 0, NULL, 1, 'uid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(225, 31, '说明', 'explain', 'textarea', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(226, 31, '提前终止日期', 'tqenddt', 'date', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(227, 32, '职位', 'ranking', 'text', 3, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(228, 32, '入职日期', 'entrydt', 'text', 4, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(229, 32, '试用到期日', 'syenddt', 'date', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(230, 32, '转正日期', 'positivedt', 'date', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(231, 32, '申请说明', 'explain', 'textarea', 7, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(232, 33, '职位', 'ranking', 'text', 2, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(233, 33, '入职日期', 'entrydt', 'text', 4, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(234, 33, '离职类型', 'redundtype', 'rockcombo', 5, NULL, 1, 'redundtype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(235, 33, '离职日期', 'quitdt', 'date', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(236, 33, '离职原因', 'redundreson', 'textarea', 7, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(237, 33, '说明', 'explain', 'textarea', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(238, 34, '月份', 'month', 'selectdatafalse', 1, '{month-1}', 1, 'selectmonth', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 1),
(239, 34, '对应人', 'uname', 'changeuser', 0, '{admin}|{uid}', 1, 'xuid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(240, 34, '基本工资', 'base', 'number', 1, '1500', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(241, 34, '岗位工资', 'postjt', 'number', 1, '3500', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(242, 34, '技能津贴', 'skilljt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(243, 34, '交通补贴', 'travelbt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(244, 34, '通信补贴', 'telbt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(245, 34, '实发工资', 'money', 'text', 100, '0', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 1),
(246, 34, '对应人员部门', 'udeptname', 'text', 0, '{deptname}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(247, 34, '职位', 'ranking', 'text', 0, '{ranking}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(248, 34, '奖励', 'reward', 'number', 20, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(249, 34, '处罚', 'punish', 'number', 40, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(250, 34, '说明', 'explain', 'textarea', 101, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(251, 34, '个人社保', 'socials', 'number', 41, '181', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(252, 34, '个人所得税', 'taxes', 'number', 42, '0', 0, NULL, 0, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(253, 29, '开户行', 'bankname', 'text', 18, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(254, 29, '工资卡帐号', 'banknum', 'text', 17, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(255, 34, '其它增加', 'otherzj', 'number', 20, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(256, 34, '其它减少', 'otherjs', 'number', 43, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(257, 34, '迟到(次)', 'cidao', 'text', 50, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(258, 34, '迟到处罚', 'cidaos', 'number', 50, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(259, 34, '早退(次)', 'zaotui', 'text', 50, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(260, 34, '早退处罚', 'zaotuis', 'number', 50, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(261, 34, '请假(小时)', 'leave', 'text', 51, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(262, 34, '请假减少', 'leaves', 'number', 51, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(263, 34, '加班(小时)', 'jiaban', 'text', 20, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(264, 34, '加班补贴', 'jiabans', 'number', 20, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(265, 34, '未打卡(次)', 'weidk', 'text', 50, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(266, 34, '未打卡处罚', 'weidks', 'number', 50, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(267, 35, '客户名称', 'custid', 'hidden', 2, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(268, 35, '客户名称', 'custname', 'selectdatafalse', 3, NULL, 1, 'selectcust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(269, 35, '销售机会', 'saleid', 'select', 5, NULL, 0, 'selectsale', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(270, 35, '签约日期', 'signdt', 'date', 6, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(271, 35, '合同金额', 'money', 'number', 7, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(272, 35, '生效日期', 'startdt', 'date', 8, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(273, 35, '截止日期', 'enddt', 'date', 9, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(274, 35, '合同类型', 'content', 'text', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(275, 35, '说明', 'explain', 'textarea', 13, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(276, 35, '合同编号', 'num', 'num', 0, NULL, 1, 'HT-', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(277, 35, '合同方式', 'type', 'select', 11, '0', 1, '0|收款合同,1|付款合同', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(278, 36, '合同', 'htid', 'select', 1, NULL, 0, 'hetongdata', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(279, 36, '合同/销售单', 'htnum', 'hidden', 2, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(280, 36, '客户名称', 'custname', 'selectdatafalse', 4, NULL, 1, 'selectcust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(281, 36, '类型', 'type', 'select', 6, NULL, 1, '0|收款单,1|付款单', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(282, 36, '金额', 'money', 'number', 7, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(283, 36, '说明', 'explain', 'textarea', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(284, 35, '待收/付金额', 'moneys', 'text', 12, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(285, 36, '客户名称', 'custid', 'hidden', 5, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(286, 36, '是否付款', 'ispay', 'select', 8, '0', 1, '0|否,1|是', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(287, 36, '收付款时间', 'paydt', 'datetime', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(288, 7, '联系人', 'linkname', 'text', 18, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(289, 36, '所属日期', 'dt', 'date', 3, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(290, 38, '要调动人', 'tranname', 'changeuser', 0, NULL, 1, 'tranuid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(291, 38, '调动类型', 'trantype', 'rockcombo', 0, NULL, 1, 'transfertype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(292, 38, '原来部门', 'olddeptname', 'text', 0, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(293, 38, '原来职位', 'oldranking', 'text', 0, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(294, 38, '调动后部门', 'newdeptname', 'changedept', 0, NULL, 1, 'newdeptid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(295, 38, '调动后职位', 'newranking', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(296, 38, '生效日期', 'effectivedt', 'date', 0, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(297, 38, '说明', 'explain', 'textarea', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(298, 37, '调薪幅度', 'floats', 'number', 4, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(299, 37, '生效日期', 'effectivedt', 'date', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(300, 37, '申请日期', 'applydt', 'date', 3, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0),
(301, 37, '说明', 'explain', 'textarea', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(302, 37, '职位', 'ranking', 'text', 2, '{ranking}', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(303, 39, '奖惩对象', 'object', 'changeuser', 3, NULL, 1, 'objectid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(304, 39, '奖惩类型', 'type', 'select', 6, '0', 1, '0|奖励,1|处罚', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(305, 39, '奖惩结果', 'result', 'rockcombo', 7, NULL, 1, 'rewardresult', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(306, 39, '奖惩金额', 'money', 'number', 8, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0),
(307, 39, '说明', 'explain', 'textarea', 9, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(308, 39, '申请日期', 'applydt', 'text', 2, '{date}', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(309, 39, '发生时间', 'happendt', 'datetime', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(310, 39, '发生地点', 'hapaddress', 'text', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(311, 40, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(312, 40, '对应分类', 'typeid', 'select', 0, NULL, 1, 'option:getcnumdata,knowledgetype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(313, 40, '排序', 'sort', 'number', 0, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(314, 40, '内容', 'content', 'htmlediter', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(315, 41, '资产分类', 'typeid', 'select', 0, NULL, 1, 'option:getcnumdata,assetstype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(316, 41, '编号', 'num', 'num', 1, NULL, 0, 'ZC-', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 1, 1),
(317, 41, '名称', 'title', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(318, 41, '品牌', 'brand', 'rockcombo', 3, NULL, 0, 'rockbrand', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(319, 41, '存放仓库', 'ckid', 'rockcombo', 4, NULL, 1, 'warehouse,id', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(320, 41, '规格型号', 'model', 'text', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(321, 41, '资产来源', 'laiyuan', 'rockcombo', 6, NULL, 1, 'wplaiyuan', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(322, 41, '状态', 'state', 'select', 7, '0', 1, '0|闲置,1|在用,2|维修,3|报废,4|丢失', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(323, 41, '购进日期', 'buydt', 'date', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(324, 41, '价格', 'price', 'number', 11, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(325, 41, '说明', 'explain', 'textarea', 30, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(326, 41, '使用人', 'usename', 'changedeptusercheck', 15, NULL, 0, 'useid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(327, 42, '车牌号', 'carnum', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(328, 42, '车辆类型', 'cartype', 'rockcombo', 1, NULL, 1, 'cartype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(329, 42, '车辆品牌', 'carbrand', 'rockcombo', 2, NULL, 1, 'carbrand', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(330, 42, '型号', 'carmode', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(331, 42, '购买日期', 'buydt', 'date', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(332, 42, '购买价格', 'buyprice', 'number', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(333, 42, '车架号', 'framenum', 'text', 7, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(334, 42, '发动机号', 'enginenb', 'text', 8, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(335, 42, '是否公开使用', 'ispublic', 'checkbox', 9, '1', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(336, 42, '说明', 'explain', 'textarea', 50, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(337, 42, '状态', 'state', 'select', 11, '1', 1, '0|办理中,1|可用,2|维修中,3|报废', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(516, 58, '状态', 'ztname', 'text', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(515, 42, '登记数', 'djshu', 'text', 51, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(346, 43, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(347, 43, '对应分类', 'typeid', 'select', 1, NULL, 1, 'option:getcnumdata,knowtikutype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(348, 43, '类型', 'type', 'select', 2, '0', 1, '0|单选,1|多选,2|判断题', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(349, 43, 'A', 'ana', 'text', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(350, 43, 'B', 'anb', 'text', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(351, 43, 'C', 'anc', 'text', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(352, 43, 'D', 'and', 'text', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(353, 43, '答案', 'answer', 'text', 9, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(354, 43, '状态', 'status', 'select', 10, '1', 1, '0|停用,1|启用', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(355, 43, '说明', 'explain', 'textarea', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(356, 43, '题内容', 'content', 'htmlediter', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(357, 44, '使用者', 'usename', 'changedeptusercheck', 0, NULL, 1, 'useid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(358, 44, '使用人数', 'useren', 'number', 1, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(359, 44, '开始时间', 'startdt', 'datetime', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(360, 44, '截止时间', 'enddt', 'datetime', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(361, 44, '目的地', 'address', 'text', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(362, 44, '线路', 'xianlines', 'text', 5, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(363, 44, '预定车辆', 'carid', 'hidden', 6, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(364, 44, '车牌号', 'carnum', 'selectdatafalse', 7, NULL, 1, 'getcardata,carid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(365, 44, '驾驶员', 'jianame', 'changeusercheck', 8, NULL, 1, 'jiaid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(366, 44, '说明', 'explain', 'textarea', 12, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(367, 45, '书名', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(368, 45, '对应分类', 'typeid', 'select', 0, '0', 1, 'option:getcnumdata,booktype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(369, 45, '编号', 'num', 'num', 0, NULL, 1, 'TS-', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 1, 1),
(370, 45, '作者', 'author', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(371, 45, '出版社', 'chuban', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(372, 45, '出版日期', 'cbdt', 'date', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(373, 45, '价格', 'price', 'number', 0, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(374, 45, '数量', 'shul', 'number', 0, '1', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1);
INSERT INTO `xinhu_flow_element` (`id`, `mid`, `name`, `fields`, `fieldstype`, `sort`, `dev`, `isbt`, `data`, `islu`, `iszs`, `attr`, `iszb`, `isss`, `lattr`, `width`, `lens`, `savewhere`, `islb`, `ispx`, `isalign`, `issou`, `istj`, `gongsi`, `placeholder`, `isonly`, `isdr`) VALUES
(375, 45, '说明', 'explain', 'textarea', 20, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(376, 45, '存放位置', 'weizhi', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(377, 45, 'ISBN', 'isbn', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(378, 46, '借阅书名', 'bookid', 'hidden', 0, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(379, 46, '借阅书名', 'bookname', 'selectdatafalse', 0, NULL, 1, 'getbookdata,bookid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(380, 46, '借阅日期', 'jydt', 'date', 0, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(381, 46, '预计归还', 'yjdt', 'date', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{jydt}|{0}必须大于借阅日期', 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(382, 46, '归还时间', 'ghtime', 'datetime', 0, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{jydt}|{0}必须大于借阅日期,lt|{now}|{0}必须小于当前时间', 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(383, 46, '是否归返', 'isgh', 'select', 0, '0', 0, '0|否,1|是', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(384, 46, '说明', 'explain', 'textarea', 20, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(385, 4, '督导人', 'ddname', 'changeusercheck', 8, NULL, 0, 'ddid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(386, 4, '任务分值', 'score', 'number', 9, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(387, 3, '评分分数', 'mark', 'text', 8, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(388, 47, '主题', 'title', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(389, 47, '发送给', 'recename', 'changedeptusercheck', 2, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(390, 47, '邮件内容', 'content', 'htmlediter', 10, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(391, 47, '抄送给', 'ccname', 'changeusercheck', 3, NULL, 0, 'ccid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(392, 47, '立即发送', 'isturn', 'checkbox', 11, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(393, 47, '发送人', 'sendname', 'text', 0, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(395, 48, '名称', 'name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(396, 48, '类型', 'type', 'rockcombo', 0, NULL, 1, 'sealtype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(397, 48, '保管人', 'bgname', 'changeusercheck', 0, NULL, 1, 'bgid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(398, 49, '对应ID', 'sealid', 'hidden', 1, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(399, 49, '印章/证照', 'sealname', 'selectdatatrue', 2, NULL, 1, 'getsealdata,sealid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(400, 49, '是否外带', 'isout', 'select', 3, '0', 1, 'usefangshi', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(401, 49, '说明', 'explain', 'textarea', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(402, 5, '剩余考勤统计', 'temp_kqtotal', 'auto', 5, NULL, 0, 'getshentime', 1, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(403, 41, '封面图片', 'fengmian', 'uploadimg', 16, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(404, 47, '是否外发', 'type', 'select', 1, '0', 1, '0|否,1|是', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(405, 51, '异常类型', 'errtype', 'rockcombo', 1, NULL, 1, 'kqerrtype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(406, 51, '异常日期', 'dt', 'date', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, 'elt|{date}|异常日期应小于当前日期', 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(407, 51, '应打卡时间', 'ytime', 'time', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(408, 51, '说明', 'explain', 'textarea', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(409, 52, '流程模块', 'modeid', 'select', 0, '0', 1, 'modebill', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(410, 52, '流程模块', 'modename', 'hidden', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(411, 52, '作废单号', 'tonum', 'select', 3, NULL, 1, 'gettonum', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(412, 52, '作废类型', 'type', 'select', 4, '0', 1, '0|作废单据,1|删除单据', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(413, 52, '说明', 'explain', 'textarea', 10, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(414, 53, '姓名', 'name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(415, 53, '手机号', 'mobile', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(416, 53, '电话', 'tel', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(417, 53, '邮箱', 'email', 'email', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(418, 53, '所在组', 'gname', 'select', 0, NULL, 0, 'getgname', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(419, 53, '地址', 'address', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(420, 53, '单位名称', 'unitname', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(421, 29, '照片', 'zhaopian', 'uploadimg', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(422, 29, '身份证号', 'idnum', 'text', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(423, 29, '备用联系人', 'spareman', 'text', 19, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(424, 29, '备用联系人电话', 'sparetel', 'text', 20, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(425, 29, '开始日期', 'startdt', 'date', 0, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(426, 29, '截止日期', 'enddt', 'date', 1, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(427, 29, '职位', 'rank', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(428, 29, '单位名称', 'unitname', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(429, 29, '开始日期', 'startdt', 'date', 0, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(430, 29, '截止日期', 'enddt', 'date', 1, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(431, 29, '专业', 'rank', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(432, 29, '学校名称', 'unitname', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(433, 1, '封面图片', 'fengmian', 'uploadimg', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 1, 0, 0, NULL, NULL, 0, 0),
(434, 19, '正文文件', 'filecontid', 'uploadfile', 10, NULL, 0, 'doc,docx,pdf,jpg,png,xls,xlsx,ppt,pptx', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(435, 20, '公文文件', 'filecontid', 'uploadfile', 9, NULL, 0, 'doc,docx,pdf', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(436, 12, '提醒给', 'recename', 'changedeptusercheck', 8, NULL, 0, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(437, 2, '会议纪要人', 'jyname', 'changeusercheck', 11, NULL, 0, 'jyid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(438, 2, '会议纪要内容', 'content', 'htmlediter', 12, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(439, 54, '对应会议', 'mid', 'select', 0, NULL, 1, 'meetdata', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(440, 54, '会议纪要内容', 'content', 'htmlediter', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(441, 54, '类型@0|普通,1|固定@not', 'type', 'fixed', 3, '2', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(442, 54, '会议主题', 'title', 'hidden', 1, NULL, 0, NULL, 0, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(443, 44, '起始公里数', 'kmstart', 'number', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(444, 44, '结束公里数', 'kmend', 'number', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{kmstart}|结束公里数必须大于起始公路数', 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(445, 44, '归还时间', 'returndt', 'datetime', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{startdt}|归还时间必须大于开始时间', 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(446, 10, '入职日期', 'workdate', 'date', 5, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 1, 0, 1, 1, NULL, NULL, 0, 0),
(447, 10, '性别', 'sex', 'select', 6, '男', 1, '男,女', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(448, 10, '名字拼音', 'pingyin', 'text', 15, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '拼音全拼(方便人员搜索)', 0, 0),
(449, 10, '手机号', 'mobile', 'text', 7, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 1, 1),
(451, 1, '操作人', 'optname', 'text', 8, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(452, 3, '操作时间', 'optdt', 'datetime', 9, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(453, 3, '部门', 'deptname', 'text', 0, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(454, 22, '任务数', 'workshu', 'number', 9, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(456, 7, '合同数', 'htshu', 'number', 20, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(455, 7, '是否标★', 'isstat', 'select', 16, '0', 1, '0|否,1|是', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(457, 7, '销售总额', 'moneyz', 'number', 21, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(458, 7, '待收金额', 'moneyd', 'number', 22, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(459, 29, '入职日期', 'workdate', 'date', 21, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 1),
(460, 29, '转正日期', 'positivedt', 'date', 23, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 1),
(461, 28, '物品Id', 'aid', 'hidden', 1, '0', 1, NULL, 1, 0, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(462, 24, '物品Id', 'aid', 'hidden', 1, '0', 1, NULL, 1, 0, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(463, 32, '申请日期', 'applydt', 'date', 2, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(467, 33, '申请日期', 'applydt', 'date', 3, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(474, 56, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(475, 56, '考试时间(分钟)', 'kstime', 'select', 2, '10', 1, 'kstimelist', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(484, 56, '状态', 'state', 'select', 16, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(476, 56, '开始时间', 'startdt', 'datetime', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(477, 56, '截止时间', 'enddt', 'datetime', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(478, 56, '多选题数', 'dxshu', 'number', 6, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(479, 56, '单选题数', 'dsshu', 'number', 5, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(480, 56, '考试对象', 'recename', 'changedeptusercheck', 8, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(481, 56, '培训人数', 'reshu', 'number', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0),
(482, 56, '已答数', 'ydshu', 'number', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(483, 56, '说明', 'explain', 'textarea', 14, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(485, 56, '总分', 'zfenshu', 'number', 12, '100', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(486, 56, '合格分数', 'hgfen', 'number', 13, '60', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(487, 6, '加班兑换', 'jiatype', 'select', 6, '0', 1, '0|调休,1|加班费', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(488, 6, '加班费', 'jiafee', 'number', 7, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(489, 48, '相关图片', 'sealimg', 'uploadimg', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(490, 48, '说明', 'explain', 'textarea', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(491, 56, '培训题库', 'tikuname', 'selectdatatrue', 9, NULL, 0, 'tikunamedata,tikuid', 1, 1, 'placeholder="不选/为空为全部题库"', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(492, 56, '题库id', 'tikuid', 'hidden', 1, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(504, 58, '车辆', 'carid', 'select', 0, NULL, 1, 'getcardata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(505, 58, '登记类型', 'otype', 'rockcombo', 1, NULL, 1, 'carotype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(506, 58, '开始日期', 'startdt', 'date', 2, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(507, 58, '截止日期', 'enddt', 'date', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(508, 58, '驾驶员', 'jianame', 'changeusercheck', 4, NULL, 0, 'jiaid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(509, 58, '对应名称', 'unitname', 'text', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 1, NULL, NULL, 0, 0),
(510, 58, '金额', 'money', 'number', 6, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(511, 58, '地点', 'address', 'text', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(512, 58, '说明', 'explain', 'textarea', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(513, 58, '登记人', 'optname', 'text', 9, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(514, 58, '登记时间', 'optdt', 'text', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(517, 35, '状态', 'statetext', 'text', 14, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(518, 35, '创建人', 'createname', 'text', 15, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(519, 35, '拥有者', 'optname', 'text', 4, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(520, 36, '创建人', 'createname', 'text', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(521, 36, '所属人', 'optname', 'changeuser', 0, NULL, 1, 'optnameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(522, 59, '维修车辆', 'carid', 'select', 0, '0', 1, 'getcardata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(523, 59, '维修原因', 'reason', 'textarea', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(524, 59, '维修地点', 'address', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(525, 59, '驾驶员', 'jianame', 'changeusercheck', 3, NULL, 1, 'jiaid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(526, 59, '更换部件', 'bujian', 'text', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 200, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(527, 59, '维修时间', 'startdt', 'datetime', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(528, 59, '维修截止时间', 'enddt', 'datetime', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{startdt}|截止时间必须大于开始时间', 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(529, 59, '维修金额', 'money', 'number', 7, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(530, 59, '说明', 'explain', 'textarea', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(531, 60, '保养车辆', 'carid', 'select', 0, '0', 1, 'getcardata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(532, 60, '保养原因', 'reason', 'textarea', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(533, 60, '保养地点', 'address', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(534, 60, '驾驶员', 'jianame', 'changeusercheck', 2, NULL, 1, 'jiaid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(535, 60, '保养内容', 'bujian', 'text', 5, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 200, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(536, 60, '保养时间', 'startdt', 'datetime', 6, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(537, 60, '取车时间', 'enddt', 'datetime', 7, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{startdt}|截止时间必须大于开始时间', 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(538, 60, '保养金额', 'money', 'number', 8, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(539, 60, '说明', 'explain', 'textarea', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(540, 60, '当前保养公里数', 'kmshu', 'text', 9, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(541, 60, '下次保养日期', 'nextdt', 'date', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(542, 60, '下次保养公里数', 'kmnshu', 'text', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, 'gt|{kmshu}|下次保养公里数必须大于当前公里数', 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(543, 60, '单据类型', 'type', 'fixed', 1, '1', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(544, 12, '状态', 'status', 'select', 9, '1', 1, '1|启用,0|停用', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(556, 61, '主Id', 'mid', 'text', 1, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(546, 61, '开始时间', 'startdt', 'datetime', 3, '{now}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(547, 61, '重复', 'rate', 'hidden', 5, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(548, 61, '重复值', 'rateval', 'hidden', 7, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(549, 61, '提醒内容', 'explain', 'textarea', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(555, 61, '模块编号', 'modenum', 'text', 0, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(551, 61, '截止时间', 'enddt', 'datetime', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(553, 61, '提醒给', 'recename', 'changedeptusercheck', 6, NULL, 0, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(554, 61, '状态', 'status', 'select', 10, '1', 1, '1|启用,0|停用', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(557, 61, '频率设置', 'temp_rateval', 'auto', 9, NULL, 0, 'ratevalset', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(558, 61, '提醒频率', 'ratecont', 'text', 8, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(559, 61, '操作时间', 'optdt', 'datetime', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(560, 61, '操作人', 'optname', 'text', 12, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(561, 4, '得分', 'mark', 'text', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(562, 28, '优惠价格', 'discount', 'number', 4, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(563, 62, '报修资产', 'assetm', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 100, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(564, 62, '保修原因', 'reason', 'textarea', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(565, 62, '实际原因', 'reasons', 'textarea', 3, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(566, 62, '需要外修', 'iswx', 'select', 2, '0', 0, '0|否,1|是', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(567, 62, '维修金额', 'money', 'number', 5, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(569, 62, '维修人员', 'wxname', 'text', 6, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(570, 62, '说明', 'explain', 'textarea', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(571, 63, '名称', 'name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(572, 63, '所属单位', 'pid', 'select', 5, '0', 1, 'companydata', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(573, 63, '对应负责人', 'fuzename', 'changeusercheck', 6, NULL, 0, 'fuzeid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(574, 63, '所在城市', 'city', 'text', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(575, 63, '地址', 'address', 'text', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 1, 1, 0, NULL, NULL, 0, 0),
(576, 63, '电话', 'tel', 'text', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(577, 63, '传真', 'fax', 'text', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(578, 63, '排序号', 'sort', 'number', 11, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(579, 63, '对应英文名', 'nameen', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(580, 63, 'ID', 'id', 'text', 12, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(581, 31, '签署单位', 'companyid', 'select', 4, NULL, 1, 'companydata', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(582, 31, '部门', 'deptname', 'text', 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(585, 10, '微信号', 'weixinid', 'text', 18, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '手机号不能作为微信号', 1, 0),
(583, 10, '电话', 'tel', 'text', 16, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(584, 10, '邮箱', 'email', 'email', 17, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 1, 1),
(586, 10, '所属单位', 'companyid', 'select', 19, NULL, 1, 'companydata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(588, 10, '启用', 'status', 'select', 20, '1', 0, '1|启用,0|停用', 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(589, 10, '管理员', 'type', 'select', 21, '0', 0, '0|普通,1|管理员', 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(590, 10, '排序号', 'sort', 'number', 23, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(591, 10, '头像', 'face', 'uploadimg', 0, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(592, 10, '所在组', 'groupname', 'checkboxall', 24, NULL, 0, 'groupdata', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(593, 29, '所属单位', 'companyid', 'select', 25, NULL, 0, 'companydata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(594, 29, '试用期到', 'syenddt', 'date', 22, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(595, 29, '离职日期', 'quitdt', 'date', 24, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(596, 10, '密码', 'pass', 'text', 3, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '新增默认123456,不填不修改密码', 0, 0),
(597, 9, '编号', 'num', 'num', 0, '0', 1, 'WP-', 1, 1, 'min="0"', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 1, 1),
(598, 5, '请假天数', 'totday', 'text', 6, '0', 0, NULL, 1, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(599, 30, '天数', 'totday', 'text', 1, '0', 0, NULL, 1, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(600, 34, '是否发放', 'ispay', 'text', 102, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(601, 64, '付款编号', 'num', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '可为合同号/订单号', 0, 0),
(602, 64, '付款金额', 'money', 'number', 1, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(603, 64, '付款日期', 'paydt', 'date', 2, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(604, 64, '收款单位', 'fullname', 'selectdatafalse', 3, NULL, 1, 'selectcust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '填写全称，可从自己客户选择', 0, 0),
(605, 64, '收款银行', 'openbank', 'text', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(606, 64, '收款帐号', 'cardid', 'text', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(607, 64, '付款方式', 'paytype', 'rockcombo', 6, NULL, 1, 'paytype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(608, 64, '说明', 'explain', 'textarea', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(609, 64, '类型', 'type', 'fixed', 8, '4', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(611, 65, '开票名称', 'name', 'text', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(610, 65, '类型', 'type', 'fixed', 0, '5', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(612, 65, '开票金额', 'money', 'number', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, NULL, NULL, 0, 0),
(613, 65, '开票日期', 'paydt', 'date', 3, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(614, 65, '公司单位名称', 'fullname', 'selectdatafalse', 4, NULL, 1, 'selectcust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '从自己客户选择，选了就不要在换', 0, 0),
(615, 65, '纳税识别号', 'shibieid', 'text', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '开企业发票这必须填写', 0, 0),
(616, 65, '开户行', 'openbank', 'text', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(617, 65, '开户帐号', 'cardid', 'text', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(618, 65, '开票类型', 'paytype', 'rockcombo', 10, NULL, 1, 'openpiaotype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(619, 65, '说明', 'explain', 'textarea', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(620, 65, '公司地址', 'address', 'text', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(621, 65, '联系电话', 'tel', 'text', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(622, 65, '相关单号', 'num', 'text', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '可填写合同号/订单号', 0, 0),
(623, 53, '性别', 'sex', 'select', 0, NULL, 1, '男,女', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(624, 66, '对应模块', 'setid', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(625, 66, '通知内容摘要', 'summary', 'textarea', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(626, 1, '开始时间', 'startdt', 'datetime', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '投票时需开始时间', 0, 0),
(627, 1, '截止时间', 'enddt', 'datetime', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '投票时需截止时间', 0, 0),
(628, 1, '至少投票', 'mintou', 'number', 9, '0', 0, NULL, 1, 1, 'min="0"', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '为0不填说明就不用投票', 0, 0),
(629, 1, '最多投票', 'maxtou', 'number', 10, '0', 0, NULL, 1, 1, 'min="0"', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '0不限制', 0, 0),
(630, 1, '投票选项', 'touitems', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(631, 19, '发文字号', 'zinum', 'rockcombo', 0, NULL, 1, 'officiazinum', 1, 1, NULL, 0, 0, NULL, NULL, 30, NULL, 0, 1, 0, 1, 1, NULL, NULL, 0, 0),
(632, 19, '主送单位', 'unitname', 'selectdatatrue', 8, NULL, 1, 'getofficiaunit', 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 0, 0, NULL, '可输入多个,分开', 0, 0),
(633, 20, '来文日期', 'laidt', 'date', 1, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(634, 20, '来文单位', 'unitsame', 'selectdatafalse', 5, NULL, 1, 'getofficiaunit', 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 1, 0, NULL, '可输入多个,分开', 0, 0),
(635, 19, '发文单位', 'unitsame', 'text', 5, '{deptname}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(636, 19, '公文密级', 'miji', 'rockcombo', 9, NULL, 1, 'officialmiji', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(637, 20, '接收单位', 'unitname', 'text', 7, '{deptname}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(638, 67, '订阅标题', 'title', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(639, 67, '订阅提醒内容', 'cont', 'textarea', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(640, 67, '订阅说明', 'explain', 'textarea', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(641, 67, '订阅人', 'optname', 'text', 0, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(642, 67, '订阅时间', 'optdt', 'datetime', 4, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(643, 67, '状态', 'status', 'checkbox', 5, '1', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(644, 67, '同时订阅给', 'recename', 'text', 6, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(645, 67, '订阅提醒时间', 'ratecont', 'text', 7, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(646, 67, '订阅地址', 'suburl', 'textarea', 8, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(647, 67, '订阅地址post参数', 'suburlpost', 'textarea', 9, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(648, 67, '最后运行时间', 'lastdt', 'datetime', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(649, 67, 'ID', 'id', 'text', 12, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(650, 68, '订阅标题', 'title', 'text', 0, NULL, 1, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(651, 68, '订阅内容', 'cont', 'text', 0, NULL, 1, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(652, 68, '添加时候', 'optdt', 'datetime', 0, NULL, 1, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(653, 68, '订阅提醒对象', 'recename', 'text', 0, NULL, 1, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(654, 68, '文件', 'filepath', 'text', 0, NULL, 1, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(655, 67, '共享给', 'shatename', 'changedeptusercheck', 11, NULL, 0, 'shateid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '共享给他人让他也可以订阅设置这个订阅', 0, 0),
(656, 34, '是否核算', 'isturn', 'text', 103, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 1, 0, 0, 0, NULL, NULL, 0, 1),
(657, 34, '是否审核', 'status', 'text', 104, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(658, 69, '标题', 'title', 'text', 1, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(659, 69, '发文单位', 'unitsame', 'text', 3, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(660, 69, '公文编号', 'num', 'text', 0, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(661, 69, '公文密级', 'miji', 'text', 4, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(662, 69, '操作时间', 'optdt', 'datetime', 5, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(663, 10, '多部门', 'deptnames', 'changedeptcheck', 11, NULL, 0, 'deptids', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(664, 10, '多职位', 'rankings', 'text', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, '多个用,分开', 0, 0),
(665, 70, '设备号', 'num', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 1, 0),
(666, 70, '设备名称', 'name', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(667, 70, '公司名', 'company', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(668, 70, '状态', 'status', 'text', 3, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(669, 70, '最后请求时间', 'lastdt', 'datetime', 6, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(670, 70, '排序号', 'sort', 'number', 5, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(671, 70, 'ID', 'id', 'number', 7, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(672, 70, 'sd卡剩余空间', 'space', 'number', 21, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(673, 70, '剩余内存', 'memory', 'number', 22, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(674, 70, '人员数', 'usershu', 'number', 10, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(675, 70, '指纹数', 'fingerprintshu', 'number', 11, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(676, 70, '头像数量', 'headpicshu', 'number', 13, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(677, 70, '打卡数', 'clockinshu', 'number', 12, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(678, 70, '现场照片数', 'picshu', 'number', 14, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(679, 70, '系统版本', 'romver', 'text', 15, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(680, 70, '应用版本', 'appver', 'text', 16, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(681, 70, '设备型号', 'model', 'text', 17, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(682, 71, '创建时间', 'createdt', 'datetime', 8, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(683, 71, '考核项目', 'title', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(684, 71, '日期', 'startdt', 'date', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(789, 71, '评分内容', 'itemname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(685, 71, '评分截止日期', 'enddt', 'date', 4, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(686, 71, '状态', 'pfrenids', 'text', 5, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(687, 71, '最后得分', 'fen', 'number', 7, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(688, 71, '操作人', 'optname', 'text', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(689, 7, '所在省', 'sheng', 'selectdatafalse', 8, NULL, 0, 'city:citydata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(690, 7, '所在市', 'shi', 'text', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(691, 72, '省', 'sheng', 'select', 5, NULL, 0, 'city:shengdata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(692, 72, '市', 'shi', 'select', 6, NULL, 0, 'citydata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(693, 72, '县(区)', 'xian', 'select', 7, NULL, 0, 'xiandata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(694, 72, '申请日期', 'applydt', 'date', 0, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(695, 72, '说明', 'explain', 'textarea', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(696, 72, '弹出下 拉单选', 'tanxuan', 'selectdatafalse', 9, NULL, 0, 'tanxuan,tanxuanid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(697, 72, '弹框下 拉多选', 'tanxuancheck', 'selectdatatrue', 11, NULL, 0, 'tanxuancheck', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(698, 72, '文件上传1', 'upfile1', 'uploadfile', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(699, 72, '文件上传2', 'upfile2', 'uploadfile', 13, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(700, 69, '正文文件', 'filecontid', 'uploadfile', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(701, 73, '仓库名称', 'depotname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(702, 73, '仓库地址', 'depotaddress', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 100, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(703, 73, '仓库管理员', 'cgname', 'changeusercheck', 1, NULL, 1, 'cgid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(704, 73, '说明', 'depotexplain', 'textarea', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(705, 73, '排序号', 'sort', 'number', 4, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(706, 73, '仓库编号', 'depotnum', 'text', 2, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(707, 28, '入库状态', 'state', 'select', 6, '0', 0, '0|待入库,1|已入库,2|部分入库', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(708, 24, '出库状态', 'state', 'select', 1, '0', 0, '0|待入库,1|已入库,2|部分入库', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(709, 28, '供应商ID', 'custid', 'hidden', 3, '0', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(710, 74, '名称', 'name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(711, 74, '可查看人员', 'recename', 'changedeptusercheck', 1, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(712, 74, '管理人员', 'guanname', 'changedeptusercheck', 2, NULL, 0, 'guanid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '不选只有管理员可管理', 0, 0),
(713, 74, '排序号', 'sort', 'number', 4, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(714, 74, '操作人', 'optname', 'text', 5, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(715, 76, '申请日期', 'applydt', 'text', 0, '{date}', 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(716, 76, '类型', 'type', 'fixed', 1, '3', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(717, 76, '说明', 'explain', 'textarea', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(718, 76, '物品', 'temp_aid', 'selectdatatrue', 0, NULL, 1, 'getgoodsdata,aid', 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(719, 76, '调拨数量', 'count', 'number', 2, '0', 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(721, 76, '物品Id', 'aid', 'hidden', 1, '0', 1, NULL, 1, 0, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(722, 76, '出库状态', 'state', 'select', 5, '0', 0, '0|待入库,1|已入库,2|部分入库', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(723, 76, '调出仓库', 'custid', 'select', 2, NULL, 1, 'goods:godepotarr', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(724, 74, '限制上传类型', 'uptype', 'text', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 100, NULL, 1, 0, 0, 0, 0, NULL, '如:doc,xlsx,不写为全部', 0, 0),
(725, 77, '客户名称', 'custname', 'selectdatafalse', 0, NULL, 1, 'custghaidata,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(726, 77, '客户ID', 'custid', 'hidden', 0, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(727, 77, '说明', 'explain', 'textarea', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(728, 78, '需求岗位', 'zhiwei', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(729, 78, '薪资', 'xinzi', 'text', 2, '面议', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(730, 78, '需求人数', 'renshu', 'number', 3, '1', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(731, 78, '职位要求', 'content', 'textarea', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(732, 78, '说明', 'explain', 'textarea', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(733, 78, '需求部门', 'bumen', 'text', 1, '{deptname}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(734, 79, '面试者', 'name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(735, 79, '类型', 'type', 'fixed', 1, '1', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(736, 79, '面试岗位', 'zhiwei', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(737, 79, '所属部门', 'bumen', 'text', 3, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(738, 79, '面试人员', 'msuser', 'changeusercheck', 5, NULL, 1, 'msuserid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(739, 79, '面试时间', 'msdt', 'datetime', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(740, 79, '说明', 'explain', 'textarea', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(743, 79, '面试结果', 'state', 'select', 19, '0', 0, '1|录用,2|不适合', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(741, 79, '面试者简历', 'content', 'htmlediter', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(742, 79, '面试记录', 'mscont', 'textarea', 20, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(744, 7, '放入公海', 'isgh', 'select', 23, NULL, 0, '0|否,1|是', 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(745, 70, '品牌', 'pinpai', 'select', 4, '0', 1, '0|群英,1|中控', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(746, 70, '分配的ip', 'snip', 'text', 18, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '中控才要填局域网IP', 0, 0),
(747, 70, '分配端口号', 'snport', 'text', 20, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '中控的需要填默认4370', 0, 0),
(748, 5, '请假人', 'uname', 'changeuser', 0, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(749, 32, '申请人', 'applyname', 'changeuser', 0, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(750, 33, '申请人', 'applyname', 'changeuser', 0, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(751, 37, '申请人', 'applyname', 'changeuser', 0, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(788, 71, '分数', 'fenshu', 'number', 1, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(787, 71, '考评内容', 'itemname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(752, 71, '姓名', 'applyname', 'changeuser', 1, '{admin}|{uid}', 1, 'uid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(753, 23, '申请人', 'applyname', 'changeuser', 0, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(754, 6, '申请人', 'uname', 'changeuser', 1, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(755, 51, '申请人', 'uname', 'changeuser', 0, '{admin}|{uid}', 1, 'uid', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0);
INSERT INTO `xinhu_flow_element` (`id`, `mid`, `name`, `fields`, `fieldstype`, `sort`, `dev`, `isbt`, `data`, `islu`, `iszs`, `attr`, `iszb`, `isss`, `lattr`, `width`, `lens`, `savewhere`, `islb`, `ispx`, `isalign`, `issou`, `istj`, `gongsi`, `placeholder`, `isonly`, `isdr`) VALUES
(756, 72, '测试字段', 'testfirs', 'checkboxall', 14, NULL, 0, '我是,他是,大家都是', 1, 1, NULL, 0, 0, NULL, NULL, 50, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(757, 80, '对应模块编号', 'modenum', 'text', 0, NULL, 1, NULL, 1, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(758, 80, '模块名称', 'modename', 'text', 1, NULL, 1, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(759, 80, '对应主表', 'table', 'hidden', 2, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(760, 80, '主表Id', 'mid', 'text', 3, NULL, 1, NULL, 1, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(761, 80, '需回执人', 'recename', 'changedeptusercheck', 4, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(762, 80, '说明', 'explain', 'textarea', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(763, 80, '总人数', 'ushuz', 'number', 6, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(764, 80, '已确认', 'ushuy', 'number', 7, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(765, 80, '操作时间', 'optdt', 'datetime', 8, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(766, 80, '状态', 'status', 'checkbox', 9, '1', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(767, 7, '最后跟进', 'lastdt', 'datetime', 24, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(768, 30, '截止使用时间', 'enddt', 'datetime', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 1, 0, 1, 0, NULL, '不设置默认长期有效', 0, 0),
(769, 81, '考核名称', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(770, 81, '开始日期', 'startdt', 'date', 1, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(771, 81, '截止日期', 'enddt', 'date', 2, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(772, 81, '考核对象', 'recename', 'changedeptusercheck', 3, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(773, 81, '考核频率', 'pinlv', 'select', 4, 'm', 1, 'm|每月,j|每季,y|每年', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(774, 81, '生成时间', 'sctime', 'date', 5, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 30, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(775, 81, '最高分数', 'maxfen', 'number', 7, '100', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(776, 81, '评分时间(天)', 'pfsj', 'number', 6, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(777, 81, '合格分数', 'hegfen', 'number', 8, '60', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(778, 81, '考评项目', 'itemname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(779, 81, '比重(%)', 'weight', 'number', 1, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(780, 81, '考核内容', 'temp_zbcont', 'text', 9, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(781, 81, '评分名称', 'pfname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(782, 81, '评分人类型', 'pftype', 'select', 1, NULL, 1, 'my|自己,super|直属上级,user|选择人', 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(783, 81, '评分人', 'pfren', 'changeuser', 2, NULL, 0, 'pfrenid', 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(784, 81, '评分权重', 'pfweight', 'number', 3, '0', 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(785, 81, '评分人', 'temp_pfren', 'text', 10, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(786, 81, '状态', 'status', 'select', 11, '1', 1, '0|不启用,1|启用', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(790, 71, '评分类型', 'pfname', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(791, 71, '评分人', 'optname', 'text', 2, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(792, 71, '评分分数', 'fenshu', 'number', 3, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(793, 71, '最后得分', 'defen', 'number', 4, NULL, 1, NULL, 1, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(794, 71, '评分时间', 'optdt', 'datetime', 5, NULL, 0, NULL, 0, 1, NULL, 2, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(795, 71, '部门', 'deptname', 'text', 0, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(796, 10, '通讯录', 'isvcard', 'checkbox', 25, '1', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(797, 48, '签发日期', 'startdt', 'date', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(798, 48, '截止日期', 'enddt', 'date', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '不选长期有效', 0, 0),
(799, 49, '申请日期', 'applydt', 'date', 0, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(800, 48, '排序号', 'sort', 'number', 0, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(801, 83, '适用对象', 'recename', 'changedeptusercheck', 2, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(802, 83, '模版类型', 'atype', 'select', 1, NULL, 1, '基本工资,考勤,绩效,个人所得税,社保公积金,补贴,其他', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(803, 83, '模版名称', 'title', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(804, 83, '开始月份', 'startdt', 'month', 3, '{month}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(805, 83, '截止月份', 'enddt', 'month', 4, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '设置个期限', 0, 0),
(806, 83, '名称', 'name', 'selectdatafalse', 0, NULL, 1, 'xinzifields,fields', 1, 1, NULL, 1, 0, NULL, NULL, 50, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(807, 83, '类型', 'type', 'select', 1, '0', 1, '0|字段,1|增加,2|减少,3|仅实发增加,4|仅实发减少,5|仅应发增加,6|仅应发减少', 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(808, 83, '默认值', 'devzhi', 'number', 2, '0', 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(809, 83, '公式', 'gongsi', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(810, 83, '备注', 'beizhu', 'text', 4, NULL, 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(811, 83, '说明', 'explain', 'textarea', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(812, 34, '绩效基数', 'jxjs', 'number', 60, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(814, 34, '绩效分数', 'jxdf', 'number', 61, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(813, 34, '绩效系数', 'jxxs', 'number', 60, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(815, 34, '绩效收入', 'jtpost', 'number', 61, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(816, 83, '排序号', 'sort', 'number', 7, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(817, 34, '应出勤天数', 'ysbtime', 'number', 49, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(818, 34, '出勤天数', 'zsbtime', 'number', 49, '0', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(819, 83, '对应字段', 'fields', 'hidden', 0, NULL, 1, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(820, 34, '应发工资', 'mones', 'text', 99, '0', 0, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(821, 34, '个税起征点', 'taxbase', 'number', 42, '3500', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(822, 84, '名称', 'title', 'text', 0, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(823, 84, '适用对象', 'recename', 'changedeptusercheck', 1, NULL, 1, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(824, 84, '养老保险基数', 'yljishu', 'number', 3, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(825, 84, '养老个人比例(%)', 'ylgeren', 'number', 4, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(826, 84, '养老单位比例(%)', 'ylunit', 'number', 5, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(827, 84, '失业个人比例(%)', 'sygeren', 'number', 7, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(828, 84, '失业单位比例(%)', 'syunit', 'number', 8, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(829, 84, '工伤个人比例(%)', 'gsgeren', 'number', 10, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(830, 84, '工伤单位比例(%)', 'gsunit', 'number', 11, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(831, 84, '生育个人比例(%)', 'syugeren', 'number', 13, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(832, 84, '生育单位比例(%)', 'syuunit', 'number', 14, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(833, 84, '医疗个人比例(%)', 'yigeren', 'number', 16, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(834, 84, '大病个人(元)', 'dbgeren', 'number', 18, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(835, 84, '个人社保缴费(元)', 'shebaogeren', 'text', 19, '0', 0, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, '({yljishu}*{ylgeren}*0.01)+({syjishu}*{sygeren}*0.01)+({gsjishu}*{gsgeren}*0.01)+({syujishu}*{syugeren}*0.01)+({yijishu}*{yigeren}*0.01)+{dbgeren}', NULL, 0, 0),
(836, 84, '单位社保缴费(元)', 'shebaounit', 'text', 20, '0', 0, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, '({yljishu}*{ylunit}*0.01)+({syjishu}*{syunit}*0.01)+({gsjishu}*{gsunit}*0.01)+({syujishu}*{syuunit}*0.01)+({yijishu}*{yiunit}*0.01)', NULL, 0, 0),
(837, 84, '公积金基数', 'gongjishu', 'number', 21, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(838, 84, '公积金个人比例(%)', 'gjjgeren', 'number', 22, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(839, 84, '公积金单位比例(%)', 'gjjunit', 'number', 23, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(840, 84, '公积金个人(元)', 'gonggeren', 'text', 24, '0', 0, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, '{gongjishu}*{gjjgeren}*0.01', NULL, 0, 0),
(841, 84, '公积金单位(元)', 'gongunit', 'text', 25, '0', 0, NULL, 1, 1, 'readonly', 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, '{gongjishu}*{gjjunit}*0.01', NULL, 0, 0),
(842, 84, '每月生成时间', 'sctime', 'date', 28, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(843, 84, '说明', 'explian', 'textarea', 29, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 500, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(844, 84, '医疗单位比例(%)', 'yiunit', 'number', 17, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(845, 84, '开始月份', 'startdt', 'month', 26, '{month}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(846, 84, '截止月份', 'enddt', 'month', 27, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(847, 84, '失业保险基数', 'syjishu', 'number', 6, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(848, 84, '工伤保险基数', 'gsjishu', 'number', 9, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(849, 84, '生育保险基数', 'syujishu', 'number', 12, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(850, 84, '医疗保险基数', 'yijishu', 'number', 15, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(851, 1, '发手机短信', 'issms', 'checkbox', 13, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '发短信', 0, 0),
(852, 2, '短信提醒', 'issms', 'checkbox', 13, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '发短信', 0, 0),
(853, 34, '单位社保缴费', 'socialsunit', 'number', 41, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(854, 34, '公积金个人', 'gonggeren', 'number', 41, '0', 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(855, 34, '公积金单位', 'gongunit', 'number', 41, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(856, 84, '状态', 'status', 'checkbox', 2, '1', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '启用', 0, 0),
(857, 83, '状态', 'status', 'checkbox', 8, '1', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '启用', 0, 0),
(858, 24, '领用的物品', 'wupinlist', 'text', 2, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(859, 34, '餐补贴', 'foodbt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(860, 34, '高温津贴', 'hotbt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(861, 34, '电脑补贴', 'dnbt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(862, 34, '其他补贴', 'otherbt', 'number', 1, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(863, 34, '计件收入', 'jiansr', 'number', 71, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(864, 34, '工号', 'gonghao', 'text', 0, '{urs.num}', 0, NULL, 0, 0, 'readonly', 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(865, 7, '纳税识别号', 'shibieid', 'text', 12, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 30, NULL, 0, 0, 0, 0, 0, NULL, '用来开发票', 0, 0),
(866, 7, '开户行', 'openbank', 'text', 13, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 100, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(867, 7, '开户帐号', 'cardid', 'text', 14, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 50, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(868, 65, '对应客户ID', 'custid', 'hidden', 4, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(869, 64, '对应客户ID', 'custid', 'hidden', 3, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(870, 85, '类型', 'type', 'select', 0, '1', 1, '1|收到的发票,0|开出去的发票', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 1),
(871, 85, '销售方名称', 'custname', 'selectdatafalse', 3, NULL, 1, 'crm:custdata,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(872, 85, '销售方名称ID', 'custid', 'hidden', 4, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(873, 85, '购买方名称', 'maicustname', 'selectdatafalse', 6, NULL, 1, 'crm:custdata,maicustid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(874, 85, '开票日期', 'opendt', 'date', 2, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 1),
(875, 85, '开票人', 'kainame', 'text', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(876, 85, '发票类型', 'ptype', 'rockcombo', 1, NULL, 1, 'openpiaotype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 1),
(877, 85, '金额', 'money', 'number', 7, '0', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 1),
(878, 85, '说明', 'explain', 'textarea', 11, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(879, 85, '购买方Id', 'maicustid', 'hidden', 8, '0', 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(880, 85, '发票代码', 'daima', 'text', 9, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(881, 85, '发票号码', 'haoma', 'text', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 1),
(882, 86, '文档名称', 'name', 'text', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(883, 86, '类型', 'wtype', 'select', 0, NULL, 1, 'docx|word文档,xlsx|Excel表格,pptx|PPT文档', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(884, 86, '协作人', 'xiename', 'changedeptusercheck', 2, NULL, 0, 'xienameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '不选默认自己', 0, 0),
(885, 86, '可查看人', 'recename', 'changedeptusercheck', 3, NULL, 0, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '不选默认自己', 0, 0),
(886, 86, '创建人', 'optname', 'text', 4, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(887, 86, '操作时间', 'optdt', 'datetime', 5, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(888, 86, '说明', 'explian', 'textarea', 6, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(889, 86, '分类', 'fenlei', 'text', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(890, 86, '操作', 'temp_opt', 'text', 10, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(891, 87, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(892, 87, '相关文件', 'filecontid', 'uploadfile', 1, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(893, 87, '说明', 'explain', 'textarea', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(894, 87, '接收人', 'qianname', 'changeusercheck', 2, NULL, 1, 'qiannameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(895, 72, '客户', 'custname', 'selectdatafalse', 2, NULL, 0, 'getmycust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(896, 72, '客户id', 'custid', 'hidden', 3, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(897, 2, '类型', 'type', 'select', 6, '0', 1, '0|普通会议,1|固定会议', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(898, 2, '会议频率', 'rate', 'select', 7, NULL, 0, 'getratestore', 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(899, 19, '拟稿日期', 'applydt', 'date', 1, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(900, 19, '抄送单位', 'chaoname', 'selectdatatrue', 9, NULL, 0, 'getofficiaunit', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, '可输入多个,分开', 0, 0),
(901, 19, '正文上称呼', 'zuncheng', 'text', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 200, NULL, 0, 0, 0, 0, 0, NULL, '如：尊敬各位领导', 0, 0),
(902, 88, '标题', 'title', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 1, 0, NULL, NULL, 0, 0),
(903, 88, '类型名称', 'typename', 'rockcombo', 2, NULL, 1, 'newstype,name,tree', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 0, NULL, NULL, 0, 0),
(904, 88, '内容', 'content', 'htmlediter', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, 0, 0),
(905, 88, '发送给', 'recename', 'changedeptusercheck', 4, NULL, 0, 'receid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '不选默认为发给全部人员', 0, 0),
(906, 88, '相应地址', 'url', 'text', 5, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(907, 88, '来源', 'zuozhe', 'text', 6, '{deptname}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(908, 88, '日期', 'indate', 'date', 7, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, NULL, NULL, 0, 0),
(909, 88, '封面图片', 'fengmian', 'uploadimg', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 1, 0, 0, NULL, NULL, 0, 0),
(910, 88, '发布人', 'optname', 'text', 8, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(911, 88, '展示日期', 'startdt', 'date', 12, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '设置开始展示日期', 0, 0),
(912, 88, '展示截止', 'enddt', 'date', 13, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '不设置长期展示', 0, 0),
(913, 88, '状态', 'status', 'checkbox', 16, '1', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(914, 88, '发手机短信', 'issms', 'checkbox', 14, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '发短信', 0, 0),
(915, 88, '排序号', 'istop', 'checkbox', 15, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(916, 1, '排序号', 'istop', 'checkbox', 14, '0', 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(917, 1, '展示日期', 'zstart', 'date', 16, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '设置开始展示日期', 0, 0),
(918, 1, '展示截止', 'zsend', 'date', 17, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, '不设置长期展示', 0, 0),
(932, 19, '是否套红', 'thid', 'select', 14, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(934, 19, '盖章', 'yzid', 'number', 15, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(935, 49, '关联模块单据', 'mknum', 'hidden', 5, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 0),
(947, 20, '正文上称呼', 'zuncheng', 'text', 10, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(948, 69, '正文上称呼', 'zuncheng', 'text', 7, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(949, 69, '公文内容', 'content', 'htmlediter', 8, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(950, 69, '主题词', 'titles', 'text', 2, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(952, 73, '物品数', 'wpshu', 'number', 6, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, NULL, NULL, 0, 0),
(953, 92, '客户名称', 'custname', 'selectdatafalse', 3, NULL, 1, 'getmycust,custid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(954, 92, '客户id', 'custid', 'hidden', 4, NULL, 1, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(955, 92, '优惠价格', 'discount', 'number', 5, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(956, 92, '销售金额', 'money', 'number', 6, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 1, 1, '[{zb0.count}*{zb0.price}] - [{discount}]', NULL, 0, 0),
(957, 92, '销售日期', 'applydt', 'date', 1, '{date}', 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(958, 92, '物品', 'temp_aid', 'selectdatatrue', 0, NULL, 1, 'getgoodsdata,aid', 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(959, 92, '销售数量', 'count', 'number', 2, '0', 1, '', 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(960, 92, '单位', 'unit', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(961, 92, '单价', 'price', 'number', 4, '0', 0, NULL, 1, 1, NULL, 1, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(962, 92, '物品Id', 'aid', 'hidden', 1, '0', 1, NULL, 1, 0, NULL, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(963, 92, '说明', 'explain', 'textarea', 7, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(964, 92, '关联合同', 'custractid', 'select', 2, '0', 1, 'getmycustract', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(965, 92, '销售单号', 'num', 'text', 0, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(966, 92, '出库状态', 'state', 'select', 8, NULL, 0, '0|待入库,1|已入库,2|部分入库', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(967, 92, '收款状态', 'shoukuzt', 'text', 9, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(968, 72, '单选弹出选择id', 'tanxuanid', 'hidden', 10, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(969, 10, '更多单位', 'dwid', 'hidden', 26, NULL, 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(970, 10, '更多所属单位', 'temp_dwid', 'selectdatatrue', 26, NULL, 0, 'companydata,dwid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(971, 63, '对应logo', 'logo', 'uploadimg', 1, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(972, 63, '显示OA名称', 'oaname', 'text', 2, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, 'PC上显示的名称，不设置就默认', 0, 0),
(973, 63, '移动端显示', 'oanemes', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, '手机版OA上的名称，不设置就默认', 0, 0),
(976, 43, 'E', 'ane', 'text', 8, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1),
(975, 63, '单位编号', 'num', 'text', 3, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(977, 56, '判断题数', 'pdshu', 'number', 7, '0', 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(978, 56, '操作人', 'optname', 'text', 15, NULL, 0, NULL, 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(979, 72, '封面图片', 'fengmian', 'uploadimg', 4, NULL, 0, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 200, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0),
(980, 2, '主持人', 'zcren', 'changeusercheck', 2, NULL, 0, 'zcrenid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, '为空默认发起人主持', 0, 0),
(981, 72, '编号', 'num', 'num', 1, NULL, 1, 'ABCYmd', 1, 1, 'readonly', 0, 0, NULL, NULL, 50, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(982, 69, '需查阅人', 'recename', 'text', 9, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(983, 69, '需查阅(总/未)人', 'chatotal', 'text', 10, NULL, 0, NULL, 0, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(984, 1, 'APP首页显示', 'appxs', 'checkbox', 15, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(985, 88, 'APP首页显示', 'appxs', 'checkbox', 17, '0', 0, NULL, 1, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 1, 0, 0, 0, NULL, NULL, 0, 0),
(1032, 35, '合同分类', 'fenlei', 'rockcombo', 1, NULL, 0, 'crmhtfenlei', 0, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 1, 0, NULL, NULL, 0, 0),
(1033, 35, '发票类型', 'fpid', 'select', 0, NULL, 1, 'selecfapiao', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1034, 36, '部门名称', 'depart', 'changedept', 0, NULL, 1, 'departid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1035, 36, '付款方式', 'paymtd', 'select', 0, '1', 1, '1|现金,2|支票,3|转账', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1036, 36, '付款类型', 'paytype', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1037, 36, '收付款账户', 'accid', 'select', 0, NULL, 1, 'selectacct', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1038, 36, '对应第几期', 'qishu', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1039, 98, '合同编号[*', 'htnum', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1040, 98, '付费日期', 'paydt', 'datetime', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1041, 98, '客户id', 'custid', 'select', 0, NULL, 1, 'selectcust', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1042, 98, '部门[*', 'depart', 'changedept', 0, NULL, 1, 'departid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1043, 98, '付款方式', 'paymtd', 'select', 0, NULL, 1, '1|现金,2|支票,3|转账', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1044, 98, '经办人', 'optname', 'changeuser', 0, NULL, 1, 'optnameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1045, 98, '付款账户', 'accid', 'select', 0, NULL, 1, 'selectacct', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1046, 98, '费用类型', 'type', 'select', 0, NULL, 1, 'getfeetype', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1047, 98, '说明', 'explain', 'textarea', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1048, 98, '付款金额', 'money', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1049, 98, '合同ID', 'htid', 'select', 0, NULL, 1, 'hetongdata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1050, 99, '调账日期', 'paydt', 'datetime', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1051, 99, '合同编号', 'htnum', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1052, 99, '合同ID', 'htid', 'select', 0, NULL, 1, 'hetongdata', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1053, 99, '部门', 'depart', 'changedept', 0, NULL, 1, 'departid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1054, 99, '调账方式', 'type', 'select', 0, NULL, 1, '0|调账增加,1|调账减少', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1055, 99, '调账金额[*', 'money', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1056, 99, '经办人', 'optname', 'changeuser', 0, NULL, 1, 'optnameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1057, 99, '说明', 'explain', 'textarea', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1058, 99, '调账单位', 'custid', 'select', 0, NULL, 1, 'selectcust', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1059, 99, '调账类型', 'paytype', 'select', 0, NULL, 1, '0|合同调账 ,1|采购调账 , 2|外协调账', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1060, 26, '部门', 'depart', 'changedept', 0, NULL, 1, 'departid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1061, 26, '操作人', 'optname', 'changeuser', 0, NULL, 1, 'optnameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1062, 27, '经办人', 'optname', 'changeuser', 0, NULL, 1, 'optnameid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1063, 27, '部门', 'depart', 'changedept', 0, NULL, 1, 'departid', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1064, 100, '开户名', 'acc_name', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1065, 100, '账号', 'acc_num', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1066, 100, '开户银行', 'bank', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1067, 100, '账户属性', 'acc_type', 'select', 0, NULL, 1, '0|银行,1|微信,2|支付宝', 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1068, 101, '字典名字字段', 'feename', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1069, 101, '排序', 'seq', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1070, 102, '发票名称', 'fpname', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1071, 102, '对应的费率', 'felv', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0),
(1072, 10, '来源', 'source', 'text', 0, NULL, 1, NULL, 1, 1, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_extent`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_extent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recename` varchar(4000) DEFAULT NULL,
  `receid` varchar(4000) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0' COMMENT '模块',
  `type` tinyint(1) DEFAULT '0' COMMENT '0查看,1添加,2编辑,3删除',
  `wherestr` varchar(500) DEFAULT NULL COMMENT '条件',
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `whereid` smallint(6) DEFAULT '0' COMMENT '条件Id',
  `fieldstr` varchar(500) DEFAULT NULL COMMENT '相关字段',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `modeid` (`modeid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块权限' AUTO_INCREMENT=244 ;

--
-- 转存表中的数据 `xinhu_flow_extent`
--

INSERT INTO `xinhu_flow_extent` (`id`, `recename`, `receid`, `modeid`, `type`, `wherestr`, `explain`, `status`, `whereid`, `fieldstr`) VALUES
(1, '全体人员', 'all', 1, 1, NULL, NULL, 1, 0, NULL),
(2, '全体人员', 'all', 1, 0, 'e3JlY2VpZH0:', '发布给包含我', 1, 0, NULL),
(3, '全体人员', 'all', 3, 1, NULL, NULL, 1, 0, NULL),
(4, '全体人员', 'all', 2, 1, NULL, NULL, 1, 0, NULL),
(5, '全体人员', 'all', 2, 0, 'YWxs', '全部数据', 1, 0, NULL),
(6, '全体人员', 'all', 3, 0, 'e2FsbHN1cGVyfQ::', '所有下属人员', 1, 0, NULL),
(10, '全体人员', 'all', 1, 2, 'b3B0aWQ9e3VpZH0:', '自己发布的', 1, 0, NULL),
(11, '全体人员', 'all', 2, 2, 'YHR5cGVgPTAgYW5kIGBvcHRpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9MA::', '我创建的', 1, 0, NULL),
(12, '全体人员', 'all', 4, 1, NULL, NULL, 1, 0, NULL),
(13, '全体人员', 'all', 4, 0, 'YWxs', '任何人都可以看到任务', 1, 0, NULL),
(14, '全体人员', 'all', 5, 1, NULL, NULL, 1, 0, NULL),
(15, '全体人员', 'all', 6, 1, NULL, NULL, 1, 0, NULL),
(16, '管理员', 'u1', 1, 3, 'b3B0aWQ!MA::', NULL, 1, 0, NULL),
(117, '管理员', 'u1', 5, 0, 'YWxs', NULL, 1, 0, NULL),
(18, '全体人员', 'all', 2, 3, 'YHR5cGVgPTAgYW5kIGBvcHRpZGA9e3VpZH0gYW5kIHN0YXRlIGluKDAsMyk:', '可删除我创建的', 1, 0, NULL),
(19, '全体人员', 'all', 8, 3, 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', '删除自己未成交的', 1, 0, NULL),
(20, '全体人员', 'all', 7, 1, NULL, NULL, 1, 0, NULL),
(21, '全体人员', 'all', 8, 1, NULL, NULL, 1, 0, NULL),
(22, '全体人员', 'all', 9, 2, 'b3B0aWQ9e3VpZH0:', '本人添加可编辑', 1, 0, NULL),
(24, '全体人员', 'all', 3, 0, 'dWlkPXt1aWR9', '可查看我自己', 1, 0, NULL),
(25, '全体人员', 'all', 8, 0, 'dWlkPXt1aWR9', '可查看我自己', 1, 0, NULL),
(26, '全体人员', 'all', 7, 0, 'dWlkPXt1aWR9', '可查看我自己的', 1, 0, NULL),
(27, '全体人员', 'all', 12, 2, 'dWlkPXt1aWR9', '编辑我自己', 1, 0, NULL),
(28, '全体人员', 'all', 12, 3, 'dWlkPXt1aWR9', '删除自己', 1, 0, NULL),
(29, '全体人员', 'all', 12, 1, NULL, NULL, 1, 0, NULL),
(30, '全体人员', 'all', 12, 0, 'dWlkPXt1aWR9', NULL, 1, 0, NULL),
(31, '全体人员', 'all', 10, 0, 'MT0x', NULL, 1, 0, NULL),
(32, '全体人员', 'all', 13, 0, 'YWxs', '全体人员都可以查看组织结构', 1, 0, NULL),
(33, '管理员', 'u1', 13, 3, 'YWxs', NULL, 1, 0, NULL),
(34, '管理员', 'u1', 10, 3, 'YHR5cGVgPTA:', '只能删除非管理员帐号', 1, 0, NULL),
(35, '管理员', 'u1', 14, 0, 'YWxs', NULL, 1, 0, NULL),
(36, '管理员', 'u1', 14, 3, 'YWxs', NULL, 1, 0, NULL),
(37, '管理员', 'u1', 15, 0, 'YWxs', NULL, 1, 0, NULL),
(38, '管理员', 'u1', 15, 3, 'YWxs', NULL, 1, 0, NULL),
(39, '管理员', 'u1', 16, 0, 'YWxs', NULL, 1, 0, NULL),
(40, '管理员', 'u1', 16, 3, 'YWxs', NULL, 1, 0, NULL),
(41, '管理员', 'u1', 17, 0, 'YWxs', NULL, 1, 0, NULL),
(42, '管理员', 'u1', 17, 3, 'YWxs', NULL, 1, 0, NULL),
(43, '管理员', 'u1', 18, 0, 'YWxs', NULL, 1, 0, NULL),
(44, '管理员', 'u1', 18, 3, 'YWxs', NULL, 1, 0, NULL),
(45, '管理员', 'u1', 9, 3, 'YWxs', '管理可删除全部', 1, 0, NULL),
(46, '全体人员', 'all', 24, 1, NULL, NULL, 1, 0, NULL),
(47, '全体人员', 'all', 25, 1, NULL, NULL, 1, 0, NULL),
(48, '全体人员', 'all', 26, 1, NULL, NULL, 1, 0, NULL),
(49, '全体人员', 'all', 7, 2, 'dWlkPXt1aWR9', '可编辑我自己的', 1, 0, NULL),
(50, '全体人员', 'all', 22, 1, NULL, NULL, 1, 0, NULL),
(51, '全体人员', 'all', 22, 2, 'b3B0aWQ9e3VpZH0:', '创建人可修改', 1, 0, NULL),
(52, '全体人员', 'all', 23, 1, NULL, NULL, 1, 0, NULL),
(53, '全体人员', 'all', 11, 1, NULL, NULL, 1, 0, NULL),
(54, '全体人员', 'all', 27, 1, NULL, NULL, 1, 0, NULL),
(55, '全体人员', 'all', 8, 2, 'dWlkPXt1aWR9IGFuZCBodGlkPTA:', '可编辑自己未创建合同的单子', 1, 0, NULL),
(56, '全体人员', 'all', 3, 2, 'dWlkPXt1aWR9IGFuZCBkdD57ZGF0ZS0zfQ::', '自己可编辑3天前日报', 1, 0, NULL),
(57, '全体人员', 'all', 29, 2, 'aWQ9e3VpZH0:', '可编辑自己的', 1, 0, NULL),
(58, '管理员', 'u1', 29, 0, 'YWxs', NULL, 1, 0, NULL),
(59, '全体人员', 'all', 29, 0, 'aWQ9e3VpZH0:', '可查看自己', 1, 0, NULL),
(60, '管理员', 'u1', 31, 0, 'YWxs', '可查看所有人', 1, 0, NULL),
(61, '管理员', 'u1', 31, 2, 'YWxs', '管理员可编辑所有人', 1, 0, NULL),
(62, '管理员,行政人事部', 'u1,d4', 29, 3, 'YWxs', NULL, 1, 0, NULL),
(63, '全体人员', 'all', 33, 1, NULL, NULL, 1, 0, NULL),
(64, '全体人员', 'all', 32, 1, NULL, NULL, 1, 0, NULL),
(65, '全体人员', 'all', 34, 0, 'YHh1aWRgPXt1aWR9', '可查看自己薪资', 1, 0, NULL),
(66, '全体人员', 'all', 34, 0, 'YG9wdGlkYD17dWlkfQ::', '可查看我提交的', 1, 0, NULL),
(67, '部门负责人', 'g3', 34, 0, NULL, NULL, 1, 220, NULL),
(68, '全体人员', 'all', 35, 1, NULL, NULL, 1, 0, NULL),
(69, '全体人员', 'all', 35, 2, 'dWlkPXt1aWR9IGFuZCBtb25leT1tb25leXM:', '编辑我的合同', 1, 0, NULL),
(70, '全体人员', 'all', 36, 2, 'dWlkPXt1aWR9IGFuZCBpc3BheT0w', '未付款前可以编辑', 1, 0, NULL),
(71, '管理员', 'u1', 36, 0, 'YWxs', NULL, 1, 0, NULL),
(72, '全体人员', 'all', 37, 1, NULL, NULL, 1, 0, NULL),
(73, '全体人员', 'all', 40, 0, 'YWxs', '任何人都可以查看知识', 1, 0, NULL),
(74, '管理员,大乔', 'u1,u4', 40, 2, 'YWxs', NULL, 1, 0, NULL),
(75, '管理员,行政人事部', 'u1,d4', 41, 2, 'YWxs', NULL, 1, 0, NULL),
(76, '行政人事部', 'd4', 41, 1, NULL, NULL, 1, 0, NULL),
(77, '全体人员', 'all', 41, 0, 'YWxs', NULL, 1, 0, NULL),
(78, '管理员,行政人事部', 'u1,d4', 41, 3, 'YWxs', NULL, 1, 0, NULL),
(79, '管理员,行政人事部', 'u1,d4', 42, 1, NULL, NULL, 1, 0, NULL),
(80, '管理员,行政人事部', 'u1,d4', 42, 0, 'YWxs', NULL, 1, 0, NULL),
(81, '管理员,行政人事部', 'u1,d4', 42, 2, 'YWxs', NULL, 1, 0, NULL),
(82, '管理员,行政人事部', 'u1,d4', 42, 3, 'YWxs', NULL, 1, 0, NULL),
(83, '管理员,行政人事部', 'u1,d4', 43, 1, NULL, NULL, 1, 0, NULL),
(84, '信呼开发团队', 'd1', 43, 2, 'b3B0aWQ9e3VpZH0:', NULL, 1, 0, NULL),
(85, '管理员,行政人事部', 'u1,d4', 43, 2, 'YWxs', NULL, 1, 0, NULL),
(86, '管理员,行政人事部', 'u1,d4', 43, 3, 'YWxs', NULL, 1, 0, NULL),
(87, '全体人员', 'all', 43, 0, 'YWxs', NULL, 1, 0, NULL),
(88, '全体人员', 'all', 44, 1, NULL, NULL, 1, 0, NULL),
(89, '全体人员', 'all', 44, 0, 'YWxs', NULL, 1, 0, NULL),
(90, '全体人员', 'all', 45, 0, 'YWxs', NULL, 1, 0, NULL),
(91, '全体人员', 'all', 45, 2, 'b3B0aWQ9e3VpZH0:', '可编辑自己添加', 1, 0, NULL),
(92, '管理员,行政人事部', 'u1,d4', 45, 2, 'YWxs', NULL, 1, 0, NULL),
(93, '管理员,行政人事部', 'u1,d4', 45, 3, 'YWxs', NULL, 1, 0, NULL),
(94, '全体人员', 'all', 46, 1, NULL, NULL, 1, 0, NULL),
(95, '全体人员', 'all', 46, 0, 'YWxs', NULL, 1, 0, NULL),
(96, '全体人员', 'all', 22, 3, 'b3B0aWQ9e3VpZH0:', '创建人可删除自己的', 1, 0, NULL),
(97, '全体人员', 'all', 47, 1, NULL, NULL, 1, 0, NULL),
(98, '全体人员', 'all', 47, 2, 'c2VuZGlkPXt1aWR9IGFuZCBpc3R1cm49MA::', '可编辑草稿', 1, 0, NULL),
(99, '全体人员', 'all', 47, 3, 'c2VuZGlkPXt1aWR9IGFuZCBpc3R1cm49MA::', '可删除草稿', 1, 0, NULL),
(100, '管理员', 'u1', 21, 3, 'YWxs', NULL, 1, 0, NULL),
(101, '全体人员', 'all', 48, 0, 'YWxs', NULL, 1, 0, NULL),
(102, '全体人员', 'all', 48, 2, 'YWxs', NULL, 1, 0, NULL),
(103, '全体人员', 'all', 48, 3, 'YWxs', NULL, 1, 0, NULL),
(104, '全体人员', 'all', 49, 1, NULL, NULL, 1, 0, NULL),
(105, '全体人员', 'all', 51, 1, NULL, NULL, 1, 0, NULL),
(106, '全体人员', 'all', 52, 1, NULL, NULL, 1, 0, NULL),
(107, '全体人员', 'all', 53, 1, NULL, NULL, 1, 0, NULL),
(108, '全体人员', 'all', 53, 2, 'dWlkPXt1aWR9', NULL, 1, 0, NULL),
(109, '全体人员', 'all', 53, 3, 'dWlkPXt1aWR9', NULL, 1, 0, NULL),
(110, '全体人员', 'all', 36, 1, NULL, NULL, 1, 0, NULL),
(111, '全体人员', 'all', 36, 3, 'dWlkPXt1aWR9IGFuZCBpc3BheT0w', NULL, 1, 0, NULL),
(112, '行政人事部', 'd4', 28, 1, NULL, NULL, 1, 0, NULL),
(113, '全体人员', 'all', 54, 1, NULL, NULL, 1, 0, NULL),
(114, '全体人员', 'all', 54, 0, 'YWxs', NULL, 1, 0, NULL),
(115, '全体人员', 'all', 54, 2, 'b3B0aWQ9e3VpZH0:', NULL, 1, 0, NULL),
(116, '全体人员', 'all', 38, 1, NULL, NULL, 1, 0, NULL),
(120, '全体人员', 'all', 10, 0, 'e2RlcHR9', '可以查看本部门人员', 1, 152, NULL),
(123, '管理员,行政人事部', 'u1,d4', 56, 1, NULL, NULL, 1, 0, NULL),
(124, '全体人员', 'all', 56, 3, 'YG9wdGlkYD17dWlkfSBhbmQgYHN0YXJ0ZHRgPm5vdygp', '时间还未开始就可以删除', 1, 0, NULL),
(125, '全体人员', 'all', 56, 2, 'YG9wdGlkYD17dWlkfSBhbmQgYHN0YXJ0ZHRgPm5vdygp', '时间还未开始就可以编辑', 1, 0, NULL),
(126, '全体人员', 'all', 56, 0, 'YG9wdGlkYD17dWlkfQ::', NULL, 1, 0, NULL),
(127, '管理员,行政人事部', 'u1,d4', 56, 0, 'YWxs', NULL, 1, 0, NULL),
(130, '全体人员', 'all', 58, 2, 'b3B0aWQ9e3VpZH0:', NULL, 1, 0, NULL),
(131, '全体人员', 'all', 58, 3, 'b3B0aWQ9e3VpZH0:', NULL, 1, 0, NULL),
(132, '全体人员', 'all', 61, 1, NULL, NULL, 1, 0, NULL),
(133, '全体人员', 'all', 61, 2, 'dWlkPXt1aWR9', '可编辑我自己', 1, 0, NULL),
(134, '全体人员', 'all', 61, 3, 'dWlkPXt1aWR9', '可删除我自己的', 1, 0, NULL),
(135, '管理员', 'u1', 61, 3, 'YWxs', NULL, 1, 0, NULL),
(136, '管理员', 'u1', 61, 0, 'YWxs', NULL, 1, 0, NULL),
(137, '全体人员', 'all', 62, 1, NULL, NULL, 1, 0, NULL),
(138, '行政人事部', 'd4', 62, 0, 'YWxs', NULL, 1, 0, NULL),
(139, '全体人员', 'all', 63, 0, 'YWxs', NULL, 1, 0, NULL),
(140, '管理员', 'u1', 63, 1, NULL, NULL, 1, 0, NULL),
(141, '管理员', 'u1', 63, 3, 'YGlkYD4x', NULL, 1, 0, NULL),
(142, '管理员', 'u1', 63, 2, 'YWxs', NULL, 1, 0, NULL),
(143, '管理员', 'u1', 10, 2, 'YWxs', NULL, 1, 0, NULL),
(144, '全体人员', 'all', 7, 3, 'dWlkPXt1aWR9', '可删除我自己的', 1, 0, NULL),
(145, '全体人员', 'all', 64, 1, NULL, NULL, 1, 0, NULL),
(146, '全体人员', 'all', 65, 1, NULL, NULL, 1, 0, NULL),
(147, '管理员', 'u1', 10, 4, NULL, NULL, 1, 0, NULL),
(148, '全体人员', 'all', 7, 4, NULL, NULL, 1, 0, NULL),
(149, '管理员', 'u1', 67, 3, 'YWxs', '管理员可删除全部人的', 1, 0, NULL),
(150, '全体人员', 'all', 67, 3, 'YG9wdGlkYD17dWlkfQ::', '可删除我的订阅', 1, 0, NULL),
(151, '全体人员', 'all', 67, 2, 'YG9wdGlkYD17dWlkfQ::', '编辑自己订阅', 1, 0, NULL),
(153, '全体人员', 'all', 68, 1, NULL, NULL, 1, 0, NULL),
(154, '全体人员', 'all', 68, 0, 'e3JlY2VpZCx1aWRpbn0:', NULL, 1, 0, NULL),
(155, '管理员', 'u1', 68, 3, 'YWxs', '管理员可删除所有', 1, 0, NULL),
(156, '管理员', 'u1', 70, 2, 'YWxs', NULL, 1, 0, NULL),
(157, '管理员', 'u1', 70, 3, 'YWxs', NULL, 1, 0, NULL),
(158, '管理员,行政人事部', 'u1,d4', 29, 2, 'YWxs', '编辑所有人', 1, 0, NULL),
(159, '全体人员', 'all', 71, 1, NULL, NULL, 1, 0, NULL),
(160, '全体人员', 'all', 72, 1, NULL, NULL, 1, 0, NULL),
(161, '全体人员', 'all', 72, 0, 'YWxs', NULL, 1, 0, NULL),
(162, '全体人员', 'all', 69, 0, 'e3JlY2VpZH0:', NULL, 1, 0, NULL),
(163, '管理员', 'u1', 73, 2, 'YWxs', NULL, 1, 0, NULL),
(164, '管理员', 'u1', 73, 3, 'YWxs', NULL, 1, 0, NULL),
(165, '管理员', 'u1', 7, 2, 'YGlzZ3lzYD0x', '可编辑供应商', 1, 0, NULL),
(166, '全体人员', 'all', 74, 1, NULL, NULL, 1, 0, NULL),
(167, '管理员', 'u1', 74, 2, 'YWxs', NULL, 1, 0, NULL),
(168, '管理员', 'u1', 74, 3, 'YWxs', NULL, 1, 0, NULL),
(169, '全体人员', 'all', 74, 2, 'YHVpZGA9e3VpZH0:', NULL, 1, 0, NULL),
(170, '全体人员', 'all', 74, 3, 'YHVpZGA9e3VpZH0:', NULL, 1, 0, NULL),
(172, '管理员', 'u1', 7, 2, 'YGlzZ2hgPTE:', '管理员可编辑公海库', 1, 0, NULL),
(173, '全体人员', 'all', 77, 1, NULL, NULL, 1, 0, NULL),
(174, '全体人员', 'all', 7, 0, 'YGlzZ2hgPTE:', '可查看公海库客户信息', 1, 0, NULL),
(175, '全体人员', 'all', 78, 1, NULL, NULL, 1, 0, NULL),
(176, '全体人员', 'all', 79, 1, NULL, NULL, 1, 0, NULL),
(177, '全体人员', 'all', 39, 1, NULL, NULL, 1, 0, NULL),
(178, '管理员', 'u1', 10, 5, NULL, NULL, 1, 0, NULL),
(179, '全体人员', 'all', 80, 1, NULL, NULL, 1, 0, NULL),
(180, '全体人员', 'all', 80, 2, 'dWlkPXt1aWR9', NULL, 1, 0, NULL),
(181, '全体人员', 'all', 80, 3, 'dWlkPXt1aWR9', NULL, 1, 0, NULL),
(182, '管理员', 'u1', 29, 4, NULL, NULL, 1, 0, NULL),
(183, '全体人员', 'all', 81, 2, 'YG9wdGlkYD17dWlkfQ::', NULL, 1, 0, NULL),
(184, '全体人员', 'all', 81, 3, 'YG9wdGlkYD17dWlkfQ::', NULL, 1, 0, NULL),
(185, '行政人事部', 'd4', 81, 0, 'YWxs', NULL, 1, 0, NULL),
(187, '管理员', 'u1', 71, 0, 'YWxs', NULL, 0, 0, NULL),
(188, '管理员', 'u1', 71, 5, NULL, NULL, 1, 0, NULL),
(189, '管理员,行政人事部', 'u1,d4', 83, 2, 'YWxs', NULL, 1, 0, NULL),
(190, '管理员,行政人事部', 'u1,d4', 83, 3, 'YWxs', NULL, 1, 0, NULL),
(191, '行政人事部,管理员', 'd4,u1', 84, 2, 'YWxs', NULL, 1, 0, NULL),
(192, '行政人事部,管理员', 'd4,u1', 84, 3, 'YWxs', NULL, 1, 0, NULL),
(193, '行政人事部', 'd4', 84, 1, NULL, NULL, 1, 0, NULL),
(194, '管理员,行政人事部', 'u1,d4', 83, 0, 'YWxs', NULL, 1, 0, NULL),
(195, '行政人事部', 'd4', 34, 1, NULL, NULL, 1, 0, NULL),
(196, '部门负责人', 'g3', 34, 2, NULL, NULL, 1, 220, NULL),
(197, '管理员', 'u1', 34, 0, 'MT0x', NULL, 1, 0, NULL),
(198, '全体人员', 'all', 85, 2, 'YG9wdGlkYD17dWlkfQ::', '可编辑自己添加', 1, 0, NULL),
(199, '全体人员', 'all', 85, 3, 'YG9wdGlkYD17dWlkfQ::', '可删除自己添加', 1, 0, NULL),
(200, '管理员', 'u1', 85, 4, NULL, NULL, 1, 0, NULL),
(201, '全体人员', 'all', 86, 1, NULL, NULL, 1, 0, NULL),
(202, '全体人员', 'all', 86, 2, 'YG9wdGlkYD17dWlkfQ::', NULL, 1, 0, NULL),
(203, '全体人员', 'all', 86, 3, 'YG9wdGlkYD17dWlkfQ::', NULL, 1, 0, NULL),
(204, '全体人员', 'all', 86, 0, NULL, NULL, 1, 228, NULL),
(205, '全体人员', 'all', 86, 0, NULL, NULL, 1, 227, NULL),
(206, '全体人员', 'all', 86, 5, NULL, NULL, 1, 0, NULL),
(207, '全体人员', 'all', 75, 0, 'YG9wdGlkYD17dWlkfQ::', NULL, 1, 0, NULL),
(208, '管理员', 'u1', 2, 2, 'YHR5cGVgPTE:', NULL, 1, 0, NULL),
(209, '管理员', 'u1', 2, 3, 'YHR5cGVgPTEg', NULL, 1, 0, NULL),
(210, '管理员', 'u1', 29, 5, NULL, NULL, 1, 0, NULL),
(211, '全体人员', 'all', 10, 6, 'MT0x', NULL, 0, 0, 'workdate,mobile,tel,email'),
(213, '管理员组', 'g4', 11, 5, NULL, NULL, 1, 0, NULL),
(214, '管理员组', 'g4', 34, 5, NULL, NULL, 1, 0, NULL),
(215, '管理员', 'u1', 88, 2, 'MT0x', NULL, 1, 0, NULL),
(216, '管理员', 'u1', 88, 3, 'MT0x', NULL, 1, 0, NULL),
(217, '全体人员', 'all', 88, 2, 'YG9wdGlkYD17dWlkfQ::', '可以编辑我发布', 1, 0, NULL),
(218, '全体人员', 'all', 88, 3, 'YG9wdGlkYD17dWlkfQ::', '可以删除我发布', 1, 0, NULL),
(219, '全体人员', 'all', 88, 0, 'MT0x', NULL, 1, 0, NULL),
(225, '大乔', 'u4', 31, 1, 'YWxs', NULL, 1, 0, NULL),
(226, '全体人员', 'all', 5, 7, 'e3N1cGVyfQ::', NULL, 1, 0, NULL),
(229, '管理员组', 'g4', 72, 7, 'MT0x', NULL, 1, 0, NULL),
(234, '管理员', 'u1', 22, 5, NULL, NULL, 1, 0, NULL),
(239, '全体人员', 'all', 74, 0, 'e3JlY2VpZH0:', NULL, 1, 0, NULL),
(240, '全体人员', 'all', 75, 0, 'e3NoYXRlaWQscmVjZWFsbH0:', '共享给对应人', 1, 0, NULL),
(241, '一本账科技', 'u2', 10, 1, NULL, NULL, 1, 0, NULL),
(242, '一本账科技', 'u2', 10, 2, NULL, NULL, 1, 149, NULL),
(243, '管理员', 'u1', 22, 0, NULL, NULL, 1, 26, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_log`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1通过',
  `statusname` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `name` varchar(50) DEFAULT NULL COMMENT '进程名称',
  `courseid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `ip` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `checkname` varchar(20) DEFAULT NULL,
  `checkid` smallint(6) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT NULL COMMENT '@模块Id',
  `color` varchar(10) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `step` smallint(6) DEFAULT '0' COMMENT '步骤号',
  `qmimg` text COMMENT '签名的图片base64',
  `iszb` tinyint(1) DEFAULT '0' COMMENT '是否转办记录',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据操作记录' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `xinhu_flow_log`
--

INSERT INTO `xinhu_flow_log` (`id`, `table`, `mid`, `status`, `statusname`, `name`, `courseid`, `optdt`, `explain`, `ip`, `web`, `checkname`, `checkid`, `modeid`, `color`, `valid`, `step`, `qmimg`, `iszb`) VALUES
(1, 'company', 5, 1, NULL, '提交', 0, '2019-12-11 15:21:38', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 63, NULL, 1, 0, NULL, 0),
(2, 'admin', 2, 1, NULL, '提交', 0, '2019-12-11 15:23:06', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(3, 'company', 5, 1, NULL, '编辑', 0, '2019-12-11 15:24:08', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 63, NULL, 1, 0, NULL, 0),
(4, 'admin', 1, 1, NULL, '编辑', 0, '2019-12-11 15:25:35', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(5, 'admin', 1, 1, NULL, '编辑', 0, '2019-12-11 15:26:26', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(6, 'company', 6, 1, NULL, '提交', 0, '2019-12-11 15:32:32', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 63, NULL, 1, 0, NULL, 0),
(7, 'admin', 1, 1, NULL, '编辑', 0, '2019-12-11 15:32:53', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(8, 'admin', 3, 1, NULL, '提交', 0, '2019-12-11 15:34:48', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(9, 'customer', 1, 1, NULL, '提交', 0, '2019-12-11 16:02:32', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 7, NULL, 1, 0, NULL, 0),
(10, 'custract', 1, 1, NULL, '提交', 0, '2019-12-11 16:03:06', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 35, NULL, 1, 0, NULL, 0),
(11, 'custract', 2, 1, NULL, '提交', 0, '2019-12-11 16:37:39', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 35, NULL, 1, 0, NULL, 0),
(12, 'custract', 3, 1, NULL, '提交', 0, '2019-12-11 16:41:33', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 35, NULL, 1, 0, NULL, 0),
(13, 'custract', 4, 1, NULL, '提交', 0, '2019-12-11 16:55:05', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 35, NULL, 1, 0, NULL, 0),
(14, 'custfina', 1, 1, NULL, '提交', 0, '2019-12-11 17:34:07', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 36, NULL, 1, 0, NULL, 0),
(15, 'custfina', 2, 1, NULL, '提交', 0, '2019-12-11 17:36:19', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 36, NULL, 1, 0, NULL, 0),
(16, 'custfee', 1, 1, NULL, '提交', 0, '2019-12-11 18:11:08', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 98, NULL, 1, 0, NULL, 0),
(17, 'custfinaa', 1, 1, NULL, '提交', 0, '2019-12-12 09:23:29', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 99, NULL, 1, 0, NULL, 0),
(18, 'fininfom', 1, 1, NULL, '提交', 0, '2019-12-12 10:16:23', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 26, NULL, 1, 0, NULL, 0),
(19, 'fininfom', 2, 1, NULL, '提交', 0, '2019-12-12 10:42:06', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 27, NULL, 1, 0, NULL, 0),
(20, 'feelv', 4, 1, NULL, '提交', 0, '2019-12-12 14:36:13', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 102, NULL, 1, 0, NULL, 0),
(21, 'feetype', 5, 1, NULL, '提交', 0, '2019-12-12 14:51:16', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 101, NULL, 1, 0, NULL, 0),
(22, 'account', 2, 1, NULL, '提交', 0, '2019-12-12 14:51:52', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 100, NULL, 1, 0, NULL, 0),
(23, 'company', 1, 1, NULL, '编辑', 0, '2019-12-12 23:43:30', NULL, '113.118.36.110', 'Chrome', '管理员', 1, 63, NULL, 1, 0, NULL, 0),
(24, 'fininfom', 1, 1, NULL, '催办', 0, '2019-12-13 00:13:49', '快点', '113.118.36.110', 'wxbro', '管理员', 1, 26, NULL, 1, 0, NULL, 0),
(25, 'custract', 5, 1, NULL, '提交', 0, '2019-12-13 11:57:45', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 35, NULL, 1, 0, NULL, 0),
(26, 'admin', 1, 1, NULL, '编辑', 0, '2019-12-13 14:25:22', NULL, '127.0.0.1', 'Chrome', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(27, 'admin', 5, 1, NULL, '提交', 0, '2019-12-13 14:41:44', NULL, '127.0.0.1', 'MSIE 11', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(28, 'admin', 1, 1, NULL, '编辑', 0, '2019-12-13 14:46:51', NULL, '127.0.0.1', 'MSIE 11', '管理员', 1, 10, NULL, 1, 0, NULL, 0),
(29, 'company', 10, 1, NULL, '编辑', 0, '2019-12-13 14:52:48', NULL, '127.0.0.1', 'MSIE 11', '管理员', 1, 63, NULL, 1, 0, NULL, 0),
(30, 'customer', 2, 1, NULL, '提交', 0, '2019-12-15 15:14:55', NULL, '183.13.203.31', 'Chrome', '周先生', 7, 7, NULL, 1, 0, NULL, 0),
(31, 'custract', 6, 1, NULL, '提交', 0, '2019-12-15 15:15:55', NULL, '183.13.203.31', 'Chrome', '周先生', 7, 35, NULL, 1, 0, NULL, 0),
(32, 'custract', 7, 1, NULL, '提交', 0, '2019-12-15 15:17:06', NULL, '183.13.203.31', 'Chrome', '周先生', 7, 35, NULL, 1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_menu`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '显示名称',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `sort` tinyint(4) DEFAULT '0',
  `statusname` varchar(20) DEFAULT NULL,
  `statuscolor` varchar(20) DEFAULT NULL,
  `statusvalue` tinyint(1) DEFAULT '1' COMMENT '状态值',
  `actname` varchar(20) DEFAULT NULL COMMENT '动作名称',
  `setid` smallint(6) DEFAULT '0' COMMENT '对应模块',
  `wherestr` varchar(300) DEFAULT NULL COMMENT '显示条件',
  `explain` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `islog` tinyint(1) DEFAULT '1',
  `issm` tinyint(1) DEFAULT '1',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型',
  `changeaction` varchar(20) DEFAULT NULL COMMENT '触发的方法',
  `fields` varchar(50) DEFAULT NULL,
  `upgcont` varchar(500) DEFAULT NULL COMMENT '更新内容',
  `iszs` tinyint(1) DEFAULT '0' COMMENT '是否在详情页面显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `setid` (`setid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据操作菜单' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `xinhu_flow_menu`
--

INSERT INTO `xinhu_flow_menu` (`id`, `name`, `num`, `sort`, `statusname`, `statuscolor`, `statusvalue`, `actname`, `setid`, `wherestr`, `explain`, `status`, `islog`, `issm`, `type`, `changeaction`, `fields`, `upgcont`, `iszs`) VALUES
(1, '标为已读', 'yd', 0, '已读', 'green', 1, '标识', 1, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, 0),
(2, '全部标识已读', 'allyd', 0, NULL, NULL, 1, NULL, 1, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, 0),
(3, '标为已读', 'yd', 0, '已读', 'green', 1, '标识', 3, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, 0),
(4, '全部标识已读', 'allyd', 0, NULL, NULL, 1, NULL, 3, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, 0),
(40, '创建项目任务', NULL, 0, NULL, NULL, 0, NULL, 22, 'c3RhdHVzIG5vdCBpbigxLDUp', NULL, 1, 0, 0, 5, NULL, NULL, 'YWRkfHdvcmt8ZGVmX3Byb2plY3RpZD17aWR9', 0),
(6, '取消会议', NULL, 0, '取消', 'gray', 3, NULL, 2, 'dHlwZT0wIGFuZCBvcHRpZD17dWlkfSBhbmQgc3RhcnRkdD57bm93fSAgYW5kIHN0YXRlPTA:', '我发起，未开始会议可取消', 1, 1, 1, 1, NULL, NULL, NULL, 0),
(7, '结束会议', NULL, 0, '结束', 'orange', 2, NULL, 2, 'YHR5cGVgPTAgYW5kIG9wdGlkPXt1aWR9IGFuZCBzdGFydGR0PHtub3d9IGFuZCBlbmRkdD57bm93fSAgYW5kIHN0YXRlPTE:', '我发起，开会中可提前结束', 1, 1, 1, 1, NULL, NULL, NULL, 0),
(12, '＋添加跟进记录', NULL, 0, '跟进', NULL, 1, '跟进记录', 7, 'KHVpZD17dWlkfSBvciB7c2hhdGVpZCx1aWRpbn0p', NULL, 1, 1, 1, 1, NULL, NULL, 'YGxhc3RkdGA9bm93KCk:', 0),
(13, '启用', 'ztqh', 0, '启用', 'green', 1, '状态切换', 7, 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MA::', NULL, 1, 1, 0, 1, NULL, NULL, 'c3RhdHVzPTE:', 0),
(14, '停用', 'ztqh', 0, '停用', 'gray', 0, '状态切换', 7, 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', NULL, 1, 1, 1, 1, NULL, NULL, 'c3RhdHVzPTA:', 0),
(15, '共享给...', 'shate', 5, NULL, NULL, 1, NULL, 7, 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', NULL, 1, 1, 0, 3, NULL, NULL, NULL, 0),
(16, '＋添加跟进', 'genjin', 0, NULL, NULL, 1, '跟进', 8, 'dWlkPXt1aWR9', NULL, 1, 1, 1, 1, NULL, NULL, NULL, 0),
(17, '标为跟进中', 'ztqh', 0, '跟进中', 'blue', 0, '状态切换', 8, 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MCBhbmQgaHRpZD0w', NULL, 1, 1, 0, 1, NULL, NULL, NULL, 0),
(18, '标为已成交', 'ztqh', 0, '已成交', 'green', 1, '状态切换', 8, 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', NULL, 1, 1, 1, 1, NULL, NULL, NULL, 0),
(19, '标为已丢失', 'ztqh', 0, '已丢失', 'gray', 2, '状态切换', 8, 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MiBhbmQgaHRpZD0w', NULL, 1, 1, 1, 1, NULL, NULL, NULL, 0),
(20, '转移给...', 'zhuan', 0, NULL, NULL, 1, NULL, 8, 'dWlkPXt1aWR9IGFuZCBzdGF0ZT0w', NULL, 1, 1, 1, 2, NULL, NULL, NULL, 0),
(21, '标为执行中', 'state2', 1, '执行中', 'orange', 3, '进度报告', 22, 'YHN0YXR1c2Agbm90IGluKDEsNSk:', NULL, 1, 1, 0, 1, NULL, NULL, NULL, 0),
(22, '更新进度', 'upprogress', 0, NULL, NULL, 0, NULL, 22, 'cHJvZ3Jlc3M8PjEwMCBhbmQgYHN0YXR1c2A8PjUgYW5kIHtpc21vYmlsZX09MA::', NULL, 1, 1, 0, 4, NULL, 'progress', NULL, 0),
(23, '标为已完成', 'state1', 1, '已完成', 'green', 1, '进度报告', 22, 'c3RhdHVzIG5vdCBpbigxLDUp', NULL, 1, 1, 0, 1, NULL, NULL, NULL, 0),
(24, '终止项目', 'state3', 1, '终止', 'gray', 5, '进度报告', 22, 'YHN0YXR1c2Agbm90IGluKDEsNSk:', NULL, 1, 1, 1, 1, NULL, NULL, NULL, 0),
(25, '提前终止', NULL, 0, '终止', 'gray', 2, '提前终止', 31, 'c3RhdGU9MQ::', NULL, 1, 1, 1, 4, NULL, 'tqenddt', NULL, 0),
(26, '创建收款单', 'cjdaishou', 0, NULL, 'chocolate', 1, NULL, 35, 'dWlkPXt1aWR9IGFuZCBpc292ZXI9MCBhbmQgdHlwZT0w', NULL, 1, 0, 0, 1, NULL, NULL, NULL, 0),
(27, '标已收款', 'pay', 0, '已收款', 'green', 0, NULL, 36, 'dWlkPXt1aWR9IGFuZCB0eXBlPTAgYW5kIGlzcGF5PTA:', NULL, 1, 1, 1, 4, NULL, 'paydt', NULL, 0),
(28, '标已付款', 'pay', 0, '已付款', 'green', 0, NULL, 36, 'dWlkPXt1aWR9IGFuZCB0eXBlPTEgYW5kIGlzcGF5PTA:', NULL, 1, 1, 1, 4, NULL, 'paydt', NULL, 0),
(29, '创建付款单', 'cjdaishou', 0, NULL, 'chocolate', 1, NULL, 35, 'dWlkPXt1aWR9IGFuZCBpc292ZXI9MCBhbmQgdHlwZT0x', NULL, 1, 0, 0, 1, NULL, NULL, NULL, 0),
(30, '领用登记', NULL, 0, '领用', NULL, 1, NULL, 41, 'YHN0YXRlYD0w', NULL, 1, 1, 1, 4, NULL, 'usename', 'YHN0YXRlYD0x', 0),
(31, '维修登记', NULL, 0, '维修', 'gray', 1, NULL, 41, NULL, NULL, 1, 1, 1, 1, NULL, NULL, 'YHN0YXRlYD0y', 0),
(32, '标☆', NULL, 0, '标星', 'chocolate', 1, '状态切换', 7, 'dWlkPXt1aWR9IGFuZCBpc3N0YXQ9MA::', NULL, 1, 1, 0, 1, NULL, NULL, 'aXNzdGF0PTE:', 0),
(33, '取消标☆', NULL, 0, '取消标星', 'gray', 0, '状态切换', 7, 'dWlkPXt1aWR9IGFuZCBpc3N0YXQ9MQ::', NULL, 1, 1, 0, 1, NULL, NULL, 'aXNzdGF0PTA:', 0),
(34, '取消共享', 'unshate', 6, NULL, 'gray', 1, NULL, 7, 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MSBhbmQgc2hhdGUgaXMgbm90IG51bGw:', NULL, 1, 1, 0, 1, NULL, NULL, NULL, 0),
(35, '会议签到', 'qdnoup', 0, '签到', 'blue', 6, '签到', 2, 'YHR5cGVgPTAgYW5kIChgc3RhdGVgPTEgb3IgKDYwMD4odW5peF90aW1lc3RhbXAoYHN0YXJ0ZHRgKS11bml4X3RpbWVzdGFtcCgpKT4wIGFuZCBgc3RhdGVgPTApKQ::', '只能手机端上签到, 可提前10分钟签到', 1, 1, 0, 1, NULL, NULL, NULL, 1),
(36, '设置为管理员', NULL, 0, NULL, NULL, 0, NULL, 10, 'YGlkYD4xICBhbmQge3VpZH09MSBhbmQgYHR5cGVgPTA:', NULL, 1, 1, 1, 0, NULL, NULL, 'YHR5cGVgPTE:', 0),
(37, '取消管理员', NULL, 0, NULL, NULL, 0, NULL, 10, 'YGlkYD4xICBhbmQge3VpZH09MSBhbmQgYHR5cGVgPTE:', NULL, 1, 1, 1, 0, NULL, NULL, 'YHR5cGVgPTA:', 0),
(38, '放入客户公海库', 'ghnoup', 7, NULL, 'deeppink', 1, NULL, 7, 'YGlzZ2hgPTA:', NULL, 1, 1, 0, 1, NULL, NULL, NULL, 1),
(39, '进度+5%', NULL, 0, NULL, NULL, 0, NULL, 22, 'cHJvZ3Jlc3M8PjEwMCBhbmQgYHN0YXR1c2A8PjU:', NULL, 1, 1, 0, 1, NULL, NULL, 'cHJvZ3Jlc3M9cHJvZ3Jlc3MrNQ::', 0),
(41, '相关项目信息', NULL, 0, NULL, NULL, 0, NULL, 4, 'cHJvamVjdGlkPjA:', NULL, 1, 0, 0, 5, NULL, NULL, 'eGlhbmd8cHJvamVjdHxtaWQ9e3Byb2plY3RpZH0:', 0),
(42, '归还登记', NULL, 0, '归还', NULL, 1, NULL, 41, NULL, NULL, 1, 1, 0, 1, NULL, NULL, 'YHN0YXRlYD0wLGB1c2VpZGA9JzAnLGB1c2VuYW1lYD1udWxs', 0),
(43, '停用会议', 'tynoup', 0, NULL, 'gray', 0, NULL, 2, 'YHR5cGVgPTEgYW5kIGBzdGF0dXNgPTE:', '固定会议停用的', 1, 1, 0, 1, NULL, NULL, 'YHN0YXR1c2A9MA::', 0),
(44, '启用会议', 'qynoup', 0, NULL, 'green', 0, NULL, 2, 'YHR5cGVgPTEgYW5kIGBzdGF0dXNgPTA:', '固定会议启用', 1, 1, 0, 1, NULL, NULL, 'YHN0YXR1c2A9MQ::', 0),
(45, '分配给...', NULL, 10, NULL, NULL, 0, '分配', 7, 'YHVpZGA9MA::', NULL, 1, 1, 0, 2, NULL, NULL, 'YHVpZGA9e2NuYW1laWR9LGBpc2doYD0w', 0),
(54, '创建收款单', NULL, 0, NULL, 'chocolate', 0, NULL, 92, 'YHN0YXR1c2A9MSBhbmQgYGlzcGF5YD0wIGFuZCBgY3VzdHJhY3RpZGA9MA::', '未关联合同需要创建收款单', 1, 0, 0, 5, NULL, NULL, 'YWRkfGN1c3RmaW5hfGRlZl9odGlkPS17aWR9JmRlZl90eXBlPTA:', 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_remind`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `uid` smallint(6) DEFAULT NULL COMMENT '用户Id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `modenum` varchar(30) DEFAULT NULL COMMENT '对应模块编号',
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT '0' COMMENT '主Id',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '频率',
  `explain` varchar(500) DEFAULT NULL COMMENT '提醒内容',
  `rate` varchar(50) DEFAULT NULL COMMENT '提醒频率o仅一次,d天,w周,m月',
  `rateval` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `receid` varchar(500) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '提醒给',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `table` (`uid`,`table`,`mid`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`modenum`,`mid`) USING BTREE,
  KEY `table_2` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据提醒设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_set`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '模块名称',
  `num` varchar(30) NOT NULL DEFAULT '' COMMENT '模块编号',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `table` varchar(50) DEFAULT NULL COMMENT '对应的表',
  `where` varchar(500) DEFAULT NULL COMMENT '相关条件',
  `summary` varchar(500) DEFAULT NULL COMMENT '摘要',
  `summarx` varchar(500) DEFAULT NULL COMMENT '应用摘要',
  `type` varchar(20) DEFAULT NULL COMMENT '分类',
  `pctx` tinyint(1) DEFAULT '0' COMMENT 'pc端提醒',
  `mctx` tinyint(1) DEFAULT '0' COMMENT 'app提醒',
  `wxtx` tinyint(1) DEFAULT '0' COMMENT '微信提醒',
  `emtx` tinyint(1) DEFAULT '0' COMMENT '是否邮件提醒',
  `sericnum` varchar(50) DEFAULT NULL COMMENT '编号规则',
  `isflow` tinyint(1) DEFAULT '1' COMMENT '是否有流程',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `status` tinyint(1) DEFAULT '1',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否可录入',
  `tables` varchar(500) DEFAULT NULL COMMENT '多行子表',
  `names` varchar(500) DEFAULT NULL COMMENT '多行子表名称',
  `statusstr` varchar(500) DEFAULT NULL COMMENT '状态值设置',
  `isgbjl` tinyint(1) DEFAULT '0' COMMENT '是否关闭操作记录',
  `isgbcy` tinyint(1) DEFAULT '0' COMMENT '是否不显示查阅记录',
  `isscl` tinyint(1) DEFAULT '0' COMMENT '是否生成列表页',
  `isup` tinyint(1) DEFAULT '1' COMMENT '更新时是否同步',
  `ddtx` tinyint(1) DEFAULT '0' COMMENT '是否钉钉提醒',
  `isbxs` tinyint(1) DEFAULT '0' COMMENT '录入页面是否不显示流程图',
  `lbztxs` tinyint(1) DEFAULT '0' COMMENT '列表页状态搜索显示0默认,1必须显示,2显示',
  `isflowlx` tinyint(1) DEFAULT '0' COMMENT '从新提交时0默认，1从新走流程',
  `iscs` tinyint(1) DEFAULT '0' COMMENT '是否自定义抄送',
  `zfeitime` int(11) DEFAULT '0' COMMENT '超过分钟自动作废',
  `ispl` tinyint(1) DEFAULT '1' COMMENT '是否开启评论',
  `istxset` tinyint(1) DEFAULT '1' COMMENT '是否开启单据提醒设置',
  `ishz` tinyint(1) DEFAULT '0' COMMENT '回执确认0不开启,1必须选择,2可选',
  PRIMARY KEY (`id`,`num`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程模块' AUTO_INCREMENT=103 ;

--
-- 转存表中的数据 `xinhu_flow_set`
--

INSERT INTO `xinhu_flow_set` (`id`, `name`, `num`, `sort`, `table`, `where`, `summary`, `summarx`, `type`, `pctx`, `mctx`, `wxtx`, `emtx`, `sericnum`, `isflow`, `receid`, `recename`, `optdt`, `status`, `islu`, `tables`, `names`, `statusstr`, `isgbjl`, `isgbcy`, `isscl`, `isup`, `ddtx`, `isbxs`, `lbztxs`, `isflowlx`, `iscs`, `zfeitime`, `ispl`, `istxset`, `ishz`) VALUES
(1, '通知公告', 'gong', 1, 'infor', NULL, '[{typename}]{title}', 'title:[{typename}]{title}\noptdt:{optdt}', '行政', 1, 0, 0, 0, 'XA-Ymd-', 0, 'all', '全体人员', '2019-06-03 13:51:12', 1, 1, 'infors', '投票选项', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1),
(2, '会议', 'meet', 2, 'meet', '`type` in(0,1)', '[{hyname}]{title},{startdt}→{enddt}', 'title:{title}\ncont:会议室：{hyname}[br]发起人：{optname}[br]参会人：{joinname}\noptdt:{startdt}→{enddt}', '行政', 1, 0, 0, 0, 'XB-Ymd-', 0, 'all', '全体人员', '2019-06-03 13:54:09', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(3, '工作日报', 'daily', 21, 'daily', NULL, '[{optname}]{content}', 'title:[{optname}]{dt}的{type}\noptdt:{optdt}\ncont:{content}', '基础', 1, 0, 0, 0, 'XC-Ymd-', 0, 'all', '全体人员', '2019-06-03 17:12:00', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 2, 0, 1, 1, 0),
(4, '任务', 'work', 23, 'work', NULL, '[{type}]{title},分配给:{dist}', 'title:{title}\noptdt:{optdt}\ncont:类型：{type}[br]等级：{grade}[br]分配给：{dist}[br]创建者：{optname}[br]截止时间：{enddt}', '基础', 1, 0, 0, 0, 'XW-Ymd-', 1, 'all', '全体人员', '2019-06-06 16:33:39', 1, 1, NULL, NULL, '待?分配,已完成,未通过,待?执行,?执行中,已作废,待?验证', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(5, '请假条', 'leave', 30, 'kqinfo', 'kind=[F]请假[F]', '[{qjkind}]{stime}→{etime}共{totals}小时,{explain}', 'title:[{qjkind}]共{totals}小时\ncont:时间：{stime}→{etime}[br]说明：{explain}\noptdt:{optdt}', '考勤', 1, 0, 0, 0, 'KA-Ymd-', 1, 'all', '全体人员', '2019-09-23 17:02:28', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0),
(6, '加班单', 'jiaban', 31, 'kqinfo', 'kind=[F]加班[F]', '{stime}→{stime}共加班{totals}小时,{explain}', 'title:加班共{totals}小时\ncont:时间：{stime}→{etime}[br]说明：{explain}\noptdt:{optdt}', '考勤', 1, 0, 0, 0, 'KB-Ymd-', 1, 'all', '全体人员', '2017-06-29 10:26:09', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(7, '客户管理', 'customer', 50, 'customer', NULL, '{name}', 'title:{name}\noptdt:{optdt}\ncont:来源：{laiyuan}[br]操作人：{optname}[br]共享给：{shate}', '客户', 1, 0, 0, 0, 'CA-Ymd-', 0, 'all', '全体人员', '2019-06-07 19:13:47', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(8, '销售机会', 'custsale', 51, 'custsale', NULL, NULL, 'title:{custname}\noptdt:{optdt}\ncont:来源：{laiyuan}[br]销售人：{optname}[br]申请日期：{applydt}[br]预计金额：{money}', '客户', 1, 0, 0, 0, 'CB-Ymd-', 0, 'all', '全体人员', '2019-06-07 19:13:49', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(9, '物品', 'goods', 80, 'goods', NULL, NULL, NULL, '物品', 1, 0, 0, 0, 'CC-Ymd-', 0, 'all', '全体人员', '2019-06-07 09:38:10', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, '费用报销', 'finfybx', 90, 'fininfom', 'type=0', '报销：{money},收款人：{fullname}', NULL, '财务', 1, 0, 0, 0, 'FA-Ymd-', 1, 'all', '全体人员', '2019-06-07 14:16:05', 1, 1, 'fininfos', '报销明细', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '用户', 'user', 201, 'admin', NULL, '{deptallname}，{name}', 'title:{name}\ncont:部门：{deptallname}[br]职位：{ranking}[br]电话：{tel}[br]手机：{mobile}[br]邮箱：{email}', '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2019-06-17 09:34:13', 1, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(12, '日程', 'schedule', 24, 'schedule', NULL, '{title}', 'title:{title}\noptdt:{optdt}\ncont:时间：{startdt}[br]截止：{enddt}[br]说明：{explain}[br]重复：{rate}{rateval}[br]提醒：{txsj}', '基础', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-03 17:12:10', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(13, '部门', 'dept', 202, 'dept', NULL, '{name}', NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2019-06-03 17:25:41', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, '系统组', 'group', 203, 'group', NULL, NULL, NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2016-08-13 17:47:58', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, '计划任务', 'task', 204, 'task', NULL, NULL, NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2016-08-13 17:23:01', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, '会话管理', 'huihua', 205, 'im_group', 'type<>2', NULL, NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2016-08-13 17:26:59', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '应用管理', 'yingyong', 206, 'im_group', 'type=2', NULL, NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2016-08-13 17:26:25', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '应用菜单', 'yymenu', 207, 'im_menu', NULL, NULL, NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2016-08-13 17:27:41', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '发文单', 'officia', 40, 'official', 'type=0', '{num}[{class}]{title}', 'title:{title}\noptdt:{optdt}\ncont:编号：{num}[br]接收单位：{unitname}', '公文', 1, 0, 0, 0, 'GA-Ymd-', 1, 'all', '全体人员', '2019-06-06 16:34:43', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(20, '收文单', 'officib', 41, 'official', 'type=1', '{num}{title}，来文单位：{unitname}', 'title:{title}\noptdt:{optdt}\ncont:编号：{num}[br]来文单位：{unitname}[br]来文日期：{laidt}', '公文', 1, 0, 0, 0, 'GB-Ymd-', 1, 'all', '全体人员', '2018-10-27 12:57:09', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, '打卡记录', 'kqdkjl', 32, 'kqdkjl', NULL, NULL, 'title:{dkdt}(星期{week})\ncont:姓名：{name}[br]打卡类型：{type}[br]打卡IP：{ip}[br]说明：{explain}', '考勤', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 18:00:18', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, '项目', 'project', 22, 'project', NULL, '项目 “{title}”,执行人：{runuser}', 'title:{title}\noptdt:{startdt}\ncont:类型：{type}[br]创建者：{optname}[br]预计结束：{enddt}[br]进度：{progress}%', '基础', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 16:33:47', 1, 1, NULL, NULL, '待执行|blue,已完成|green,结束|#888888,执行中|#ff6600', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(23, '外出出差', 'waichu', 33, 'kqout', NULL, '[{atype}]{address}{outtime}', 'title:{optname}[{atype}]{reason}\noptdt:{optdt}\ncont:外出时间：{outtime}[br]预计回岗：{intime}[br]地点：{address}', '考勤', 1, 0, 0, 0, 'KD-Ymd-', 1, 'all', '全体人员', '2019-06-06 18:00:21', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(24, '物品领用', 'goodly', 82, 'goodm', 'type=0', '领用物品：{wupinlist}', 'cont:日期：{applydt}[br]领用物品：{wupinlist}', '物品', 1, 0, 0, 0, 'WA-Ymd-', 1, 'all', '全体人员', '2019-06-07 09:38:17', 1, 1, 'goodn', '领用物品', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, '出差报销', 'finccbx', 91, 'fininfom', 'type=1', '报销金额:{money},目的:{purpose},成果:{purresult}', NULL, '财务', 1, 0, 0, 0, 'FB-Ymd-', 1, 'all', '全体人员', '2017-05-06 21:29:35', 1, 1, 'fininfos', '报销明细', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, '资金借出单', 'finjkd', 92, 'fininfom', 'type=2', '借款金额:{money},用途:{purpose}', NULL, '财务', 1, 0, 0, 0, 'FC-Ymd-', 1, 'all', '全体人员', '2017-05-06 21:45:31', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, '资金借入单', 'finhkd', 93, 'fininfom', 'type=3', '还款金额：{money}，还款方式:{paytype}，还款到：{fullname}', NULL, '财务', 1, 0, 0, 0, 'FD-Ymd-', 1, 'all', '全体人员', '2017-05-06 21:45:35', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, '物品采购', 'caigou', 83, 'goodm', 'type=1', '从[{custname}]采购金额:{money}元，采购物品：{wupinlist}', 'cont:供应商：{custname}[br]采购物品：{wupinlist}[br]金额：{money}元', '物品', 1, 0, 0, 0, 'WB-Ymd-', 1, 'all', '全体人员', '2019-04-29 11:16:52', 1, 1, 'goodn', '采购物品', NULL, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(29, '人员档案', 'userinfo', 60, 'userinfo', NULL, NULL, NULL, '人事', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-03 17:07:09', 1, 0, 'userinfos,userinfos', '工作经历,教育经历', NULL, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0),
(30, '考勤信息', 'leavehr', 34, 'kqinfo', NULL, NULL, NULL, '考勤', 1, 0, 0, 0, NULL, 0, 'd4', '行政人事部', '2016-09-13 13:46:55', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, '员工合同', 'userract', 61, 'userract', NULL, NULL, NULL, '人事', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 17:57:19', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(32, '转正申请', 'hrpositive', 62, 'hrpositive', NULL, '申请[{positivedt}]转正', NULL, '人事', 1, 0, 0, 0, 'HA-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:11', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(33, '离职申请', 'hrredund', 63, 'hrredund', NULL, '[{redundtype}],在{quitdt}离职', NULL, '人事', 1, 0, 0, 0, 'HB-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:15', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(34, '薪资', 'hrsalary', 65, 'hrsalary', NULL, '{uname}[{month}]月份的薪资', 'title:{month}薪资', '人事', 1, 0, 0, 0, 'HC-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:28', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, '客户合同', 'custract', 52, 'custract', NULL, '编号[{num}],客户:{custname},{enddt}到期', 'title:{custname}\ncont:合同编号：{num}[br]日期：{startdt}→{enddt}[br]状态：{moneys}', '客户', 0, 0, 0, 0, 'CC-Ymd-', 0, 'all', '全体人员', '2019-06-07 19:13:52', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(36, '收付款单', 'custfina', 53, 'custfina', NULL, '{type}：日期[{dt}],{custname},{ispay}', 'title:{custname}\noptdt:{optdt}\ncont:金额：{money}[br]对应合同：{htnum}', '客户', 0, 0, 0, 0, 'CD-Ymd-', 0, 'all', '全体人员', '2019-06-07 19:13:55', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(37, '调薪申请', 'hrtrsalary', 66, 'hrtrsalary', NULL, '{optname}申请调薪', NULL, '人事', 1, 0, 0, 0, 'HD-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:31', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(38, '人事调动', 'hrtransfer', 67, 'hrtransfer', NULL, '[{tranname}]【{trantype}】:{olddeptname}→{newdeptname},{oldranking}→{newranking}', NULL, '人事', 1, 0, 0, 0, 'HE-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:36', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(39, '奖惩处罚', 'reward', 68, 'reward', NULL, '对【{object}】的{atype},奖惩结果:{result},金额:{money}', NULL, '人事', 1, 0, 0, 0, 'HF-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:40', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(40, '知识', 'knowledge', 75, 'knowledge', NULL, '{title}', 'title:{title}\noptdt:{optdt}', '资源', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-05 18:11:27', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(41, '固定资产', 'assetm', 7, 'assetm', NULL, NULL, NULL, '行政', 0, 0, 0, 0, 'CF-Ymd-', 0, 'all', '全体人员', '2019-06-03 17:11:29', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, '车辆管理', 'carm', 101, 'carm', NULL, NULL, NULL, '车辆', 0, 0, 0, 0, 'CH-Ymd-', 0, 'all', '全体人员', '2019-06-07 13:32:06', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(43, '题库', 'knowtiku', 76, 'knowtiku', NULL, NULL, 'title:[{typename}]{title}\ncont:A：{ana}[br]B：{anb}[br]C：{anc}[br]D：{and}[br]E：{ane}', '资源', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-22 20:21:52', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, '车辆预定', 'carmrese', 103, 'carmrese', NULL, '{usename}预定车辆【{carnum}】在{startdt}前往{address}', NULL, '车辆', 1, 0, 0, 0, 'CJ-Ymd-', 1, 'all', '全体人员', '2019-06-07 13:32:15', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(45, '图书管理', 'book', 8, 'book', NULL, '{title}', 'title:{title}', '行政', 0, 0, 0, 0, 'CK-Ymd-', 0, 'all', '全体人员', '2019-06-03 17:11:37', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, '图书借阅', 'bookborrow', 9, 'bookborrow', NULL, '{optname}借阅[{bookname}]', NULL, '行政', 1, 0, 0, 0, 'CL-Ymd-', 1, 'all', '全体人员', '2019-06-03 13:55:41', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(47, '邮件', 'emailm', 25, 'emailm', NULL, '{title},发件人:{sendname}', 'title:{title}\noptdt:{senddt}\ncont:发件人：{sendname}[br]收件人：{recename}', '基础', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-03 17:12:14', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(48, '印章证照', 'seal', 10, 'seal', NULL, NULL, NULL, '行政', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-07 13:43:19', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, '印章证照使用', 'sealapl', 11, 'sealapl', NULL, '{optname}申请使用[{sealname}]', NULL, '行政', 1, 0, 0, 0, 'CM-Ymd-', 1, 'all', '全体人员', '2019-06-07 13:43:21', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(50, '待办处理', 'daiban', 208, 'flow_bill', NULL, NULL, NULL, '系统', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2016-12-15 17:48:55', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, '打卡异常', 'kqerr', 35, 'kqerr', NULL, '{optname}[{errtype}]申请', NULL, '考勤', 1, 0, 0, 0, 'KE-Ymd-', 1, 'all', '全体人员', '2019-06-06 18:00:26', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(52, '单据作废申请', 'tovoid', 27, 'tovoid', NULL, '{optname}申请单号:{tonum}作废,模块:{modename}', NULL, '基础', 1, 0, 0, 0, 'ZF-Ymd-', 1, 'all', '全体人员', '2019-07-04 13:37:44', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(53, '个人通讯录', 'vcard', 26, 'vcard', NULL, NULL, 'title:{name}\ncont:电话：{tel}[br]手机：{mobile}[br]邮箱：{email}[br]所在组：{gname}', '基础', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-03 17:12:17', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, '会议纪要', 'meetjy', 3, 'meet', 'type=2', NULL, NULL, '行政', 1, 0, 0, 0, 'XC-Ymd-', 0, 'all', '全体人员', '2019-06-03 13:54:23', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(55, '定位记录', 'kqdw', 36, 'location', NULL, NULL, 'title:{name}\noptdt:{optdt}\ncont:星期：{week}[br]地址：{label}[br]说明：{explain}', '考勤', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 18:00:29', 1, 0, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(56, '考试培训', 'knowtraim', 77, 'knowtraim', NULL, '{title},时间{startdt}→{enddt}', 'title:{title}\noptdt:{start}', '资源', 1, 0, 0, 0, 'ZA-Ymd-', 0, 'all', '全体人员', '2019-06-05 18:11:42', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, '车辆信息登记', 'carms', 102, 'carms', NULL, NULL, NULL, '车辆', 1, 0, 0, 0, 'CN-Ymd', 0, 'all', '全体人员', '2019-06-07 13:32:09', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(59, '车辆维修', 'carmwx', 104, 'carmang', 'type=0', NULL, NULL, '车辆', 1, 0, 0, 0, 'CX-Ymd-', 1, 'all', '全体人员', '2019-06-07 13:32:18', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(60, '车辆保养', 'carmby', 105, 'carmang', 'type=1', '车辆保养', NULL, '车辆', 1, 0, 0, 0, 'CY-Ymd-', 1, 'all', '全体人员', '2019-06-07 13:32:21', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(61, '单据提醒设置', 'remind', 28, 'flow_remind', NULL, NULL, NULL, '基础', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-03 17:14:33', 1, 0, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(62, '维修报修', 'repair', 12, 'repair', NULL, '{assetm}:{reason}', NULL, '行政', 1, 0, 0, 0, 'WX-Ymd-', 1, 'all', '全体人员', '2019-06-03 17:11:49', 1, 1, NULL, NULL, '待?处理,已完成', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(63, '公司单位', 'company', 200, 'company', NULL, '{name}', NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2019-06-17 09:28:55', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, '付款申请', 'finpay', 94, 'fininfom', 'type=4', '申请付款{money}元', NULL, '财务', 1, 0, 0, 0, 'FE-Ymd-', 1, 'all', '全体人员', '2017-08-07 20:46:42', 1, 1, NULL, NULL, '待?处理,已付款', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(65, '开票申请', 'finkai', 95, 'fininfom', 'type=5', '[{fullname}]要开票{money}元', NULL, '财务', 1, 0, 0, 0, 'FF-Ymd-', 1, 'all', '全体人员', '2018-08-31 16:27:44', 1, 1, NULL, NULL, '待?处理,已开票,不同意', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, '单据通知设置', 'flowtodo', 209, 'flow_todo', NULL, '{summary}', NULL, '系统', 0, 0, 0, 0, NULL, 0, 'u1', '管理员', '2017-08-23 13:51:23', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(67, '订阅管理', 'subscribe', 210, 'subscribe', NULL, '{cont}', NULL, '系统', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-07 19:22:20', 1, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(68, '订阅报表', 'subscribeinfo', 211, 'subscribeinfo', NULL, '{title}', 'title:{title}\noptdt:{optdt}\ncont:{cont}', '系统', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-07 19:22:09', 1, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(69, '公文查阅', 'officic', 42, 'official', 'status=1 and ffid>0', '{title}', 'title:{title}\noptdt:{optdt}\ncont:编号：{num}[br]来文单位：{unitsame}', '公文', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-07-12 14:52:36', 1, 0, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(70, '考勤机设备', 'kqjsn', 37, 'kqjsn', NULL, NULL, NULL, '考勤', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 17:48:03', 1, 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(71, '考核评分', 'hrcheck', 72, 'hrcheck', NULL, '{startdt}“{title}”考核', 'title:{title}\noptdt:{startdt}', '人事', 1, 0, 0, 0, 'HG-Ymd-', 0, 'all', '全体人员', '2019-06-06 17:03:53', 1, 0, 'hrchecks,hrcheckn', '考核内容,评分记录', NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(72, '演示测试', 'demo', 300, 'demo', NULL, NULL, NULL, '系统', 1, 0, 0, 0, 'YS-Ymd-', 1, 'all', '全体人员', '2019-04-24 17:14:03', 1, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0),
(73, '仓库管理', 'godepot', 81, 'godepot', NULL, NULL, NULL, '物品', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-07 09:38:14', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, '文档分区', 'worc', 110, 'worc', NULL, NULL, NULL, '文档', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-05 13:28:30', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(75, '文档', 'word', 111, 'word', NULL, NULL, NULL, '文档', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-05 13:28:38', 1, 0, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(76, '调拨单', 'diaobo', 84, 'goodm', 'type=3', '从仓库“{custname}”调拨物品：{wupinlist}', 'cont:日期：{applydt}[br]调拨仓库：{custname}[br]调拨物品：{wupinlist}', '物品', 1, 0, 0, 0, 'WC-Ymd-', 1, 'all', '全体人员', '2019-04-29 11:36:10', 1, 1, 'goodn', '调拨物品', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, '客户申请使用', 'custappy', 54, 'custappy', NULL, '{optname}申请客户[{custname}]使用', NULL, '客户', 1, 0, 0, 0, 'CE-Ymd-', 1, 'all', '全体人员', '2019-06-07 19:13:59', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, NULL, 0, 0, 1440, 1, 1, 0),
(78, '人员需求', 'hrdemand', 69, 'hrdemint', 'type=0', '{bumen}，岗位“{zhiwei}”需{renshu}人', NULL, '人事', 1, 0, 0, 0, 'HH-Ymd-', 1, 'all', '全体人员', '2019-06-06 17:03:44', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(79, '面试安排', 'hrmanshi', 70, 'hrdemint', 'type=1', '{name}在{msdt}面试{zhiwei}，面试人{msuser}', NULL, '人事', 1, 0, 0, 0, 'HI-Ymd', 1, 'all', '全体人员', '2019-06-06 17:03:47', 1, 1, NULL, NULL, '待?处理,已完成,不适合', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(80, '回执确认', 'receipt', 212, 'receipt', NULL, NULL, 'cont:模块：{modename}[br]发送人：{optname}[br]内容：{explain}', '系统', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-07 19:22:45', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(83, '薪资模版', 'hrsalarm', 64, 'hrsalarm', NULL, NULL, NULL, '人事', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 17:03:23', 1, 0, 'hrsalars', '字段内容项目', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, '考核项目', 'hrkaohem', 71, 'hrkaohem', NULL, NULL, NULL, '人事', 0, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 17:03:50', 1, 0, 'hrkaohes,hrkaohen', '考核项目内容,评分人', NULL, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(84, '社保公积金', 'hrshebao', 63, 'hrshebao', NULL, NULL, NULL, '人事', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-06 17:03:19', 1, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(85, '发票管理', 'finpiao', 96, 'finpiao', NULL, NULL, NULL, '财务', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-07 14:16:10', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, '文档协作', 'wordxie', 112, 'wordxie', NULL, '{name}', 'title:{name}.{wtype}\ncont:创建人：{optname}[br]协作人：{xiename}[br]可查看人：{recename}\noptdt:{optdt}', '文档', 1, 0, 0, 0, NULL, 0, 'all', '全体人员', '2019-06-05 13:28:41', 1, 1, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(87, '文件传送', 'wordeil', 113, 'wordeil', NULL, '{title}，接收人：{qianname}', NULL, '文档', 1, 0, 0, 0, 'FI-Ymd-', 1, 'all', '全体人员', '2019-06-05 13:28:44', 1, 1, NULL, NULL, '待?接收,已接收,拒收', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(88, '新闻资讯', 'news', 13, 'news', NULL, '[{typename}]{title}', 'title:[{typename}]{title}\noptdt:{optdt}', '行政', 1, 0, 0, 0, 'XA-Ymd-', 0, 'all', '全体人员', '2019-06-03 17:11:53', 1, 1, NULL, NULL, '停用,启用', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(92, '销售', 'custxiao', 55, 'goodm', 'type=2', '从[{custname}]销售金额:{money}元，销售物品：{wupinlist}', 'cont:客户：{custname}[br]销售物品：{wupinlist}[br]销售金额：{money}元', '客户', 1, 0, 0, 0, 'CF-Ymd-', 1, 'all', '全体人员', '2019-06-07 19:14:02', 1, 1, 'goodn', '销售物品', NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, '费用单', 'custfee', 0, 'custfee', NULL, NULL, NULL, '客户', 1, 0, 0, 0, NULL, 0, NULL, NULL, '2019-12-11 17:46:34', 1, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, '调账单', 'custfinaa', 0, 'custfinaa', NULL, NULL, NULL, '客户', 0, 0, 0, 0, NULL, 0, NULL, NULL, '2019-12-11 18:16:02', 1, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, '账户维护', 'account', 0, 'account', NULL, NULL, NULL, '客户', 0, 0, 0, 0, NULL, 0, NULL, NULL, '2019-12-12 13:45:36', 1, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, '费用类型', 'feetype', 0, 'feetype', NULL, NULL, NULL, '客户', 0, 0, 0, 0, NULL, 0, NULL, NULL, '2019-12-12 13:56:56', 1, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(102, '发票费率', 'feelv', 0, 'feelv', NULL, NULL, NULL, '合同', 0, 0, 0, 0, NULL, 0, NULL, NULL, '2019-12-12 14:09:25', 1, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_todo`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '名称标题',
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `setid` smallint(6) DEFAULT '0' COMMENT '对应模块',
  `explain` varchar(100) DEFAULT NULL COMMENT '说明',
  `whereid` smallint(6) DEFAULT '0' COMMENT '对应条件id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `receid` varchar(500) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '通知给',
  `changefields` varchar(200) DEFAULT NULL COMMENT '改变字段',
  `changecourse` varchar(30) DEFAULT NULL COMMENT '对应步做id',
  `boturn` tinyint(1) DEFAULT '0' COMMENT '提交时',
  `boedit` tinyint(1) DEFAULT '0' COMMENT '编辑时',
  `bochang` tinyint(1) DEFAULT '0' COMMENT '字段改变时',
  `bodel` tinyint(1) DEFAULT '0' COMMENT '删除时',
  `bozuofei` tinyint(1) DEFAULT '0' COMMENT '作废时',
  `botong` tinyint(1) DEFAULT '0' COMMENT '步骤处理通过时',
  `bobutong` tinyint(1) DEFAULT '0' COMMENT '步骤处理不通过时',
  `bofinish` tinyint(1) DEFAULT '0' COMMENT '处理完成时',
  `bozhui` tinyint(1) DEFAULT '0' COMMENT '追加说明时',
  `bozhuan` tinyint(1) DEFAULT '0' COMMENT '流程转办时',
  `toturn` tinyint(1) DEFAULT '0' COMMENT '是否通知给提交人',
  `tocourse` tinyint(1) DEFAULT '0' COMMENT '是否通知给流程所有参与人',
  `todofields` varchar(500) DEFAULT NULL COMMENT '通知给主表上字段',
  `summary` varchar(500) DEFAULT NULL COMMENT '通知内容摘要',
  `botask` tinyint(1) DEFAULT '0' COMMENT '计划任务',
  `boping` tinyint(1) DEFAULT '0' COMMENT '评论时',
  `bohuiz` tinyint(1) DEFAULT '0' COMMENT '回执时',
  `tosuper` tinyint(1) DEFAULT '0' COMMENT '直属上级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据通知设置表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `xinhu_flow_todo`
--

INSERT INTO `xinhu_flow_todo` (`id`, `name`, `num`, `setid`, `explain`, `whereid`, `status`, `receid`, `recename`, `changefields`, `changecourse`, `boturn`, `boedit`, `bochang`, `bodel`, `bozuofei`, `botong`, `bobutong`, `bofinish`, `bozhui`, `bozhuan`, `toturn`, `tocourse`, `todofields`, `summary`, `botask`, `boping`, `bohuiz`, `tosuper`) VALUES
(1, '车辆信息到期提醒', NULL, 58, '这只是个事例', 96, 0, 'u1', '管理员', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, '车辆[{carid}]的{otype}将在{enddt}到期。', 1, 0, 0, 0),
(4, '通知仓库管理员出库操作', NULL, 24, NULL, 0, 1, 'u1', '管理员', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, '有人申请物品领用，请及时处理出库操作。', 0, 0, 0, 0),
(7, '新增项目提醒', NULL, 22, NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'runuserid,fuzeid', '{optname}新增项目“{title}”，负责人{fuze}', 0, 0, 0, 0),
(6, '项目信息修改提醒', NULL, 22, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'runuserid,fuzeid', '项目“{title}”被{optname}修改了', 0, 1, 0, 0),
(9, '考核评分提醒', 'pftodo', 71, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'pfrenids', '你有“{applyname}”的考核评分需要你评分', 0, 0, 0, 0),
(11, '物品库存预警', NULL, 9, NULL, 225, 1, 'u1', '管理员', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '物品“{num}.{name}”库存为{stock}已不足10，请知晓。', 1, 0, 0, 0),
(12, NULL, NULL, 86, NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'receid', '{optname}添加协作文档“{name}.{wtype}”需要你查看', 0, 0, 0, 0),
(13, NULL, NULL, 86, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'xienameid', '{optname}修改协作文档“{name}.{wtype}”的信息', 0, 0, 0, 0),
(14, NULL, NULL, 86, NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'xienameid', '{optname}添加协作文档“{name}.{wtype}”需要你协作完成', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_todos`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_todos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modenum` varchar(30) DEFAULT '0' COMMENT '对应模块编号',
  `modename` varchar(30) DEFAULT NULL COMMENT '模块名称',
  `table` varchar(30) DEFAULT NULL COMMENT '对应主表',
  `mid` int(11) DEFAULT '0' COMMENT '主表Id',
  `uid` int(11) DEFAULT '0' COMMENT '对应人员',
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `readdt` datetime DEFAULT NULL COMMENT '已读时间',
  `isread` tinyint(1) DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `table` (`table`,`mid`) USING BTREE,
  KEY `modenum` (`modenum`,`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据通知给对应人员' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_flow_where`
--

CREATE TABLE IF NOT EXISTS `xinhu_flow_where` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `setid` smallint(6) DEFAULT '0' COMMENT '对应模块',
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `pnum` varchar(30) DEFAULT NULL COMMENT '编号分组',
  `name` varchar(50) DEFAULT NULL COMMENT '条件名称',
  `wheresstr` varchar(500) DEFAULT NULL COMMENT '对应表条件',
  `whereustr` varchar(500) DEFAULT NULL COMMENT '用户条件',
  `wheredstr` varchar(500) DEFAULT NULL COMMENT '对应部门条件',
  `sort` smallint(6) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL COMMENT '包含用户',
  `nreceid` varchar(200) DEFAULT NULL,
  `nrecename` varchar(200) DEFAULT NULL COMMENT '不包含用户',
  `islb` tinyint(1) DEFAULT '0' COMMENT '是否在生成列表页面上显示',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `syrid` varchar(200) DEFAULT NULL,
  `syrname` varchar(200) DEFAULT NULL COMMENT '此条件可适用对象',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `setid` (`setid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据条件' AUTO_INCREMENT=261 ;

--
-- 转存表中的数据 `xinhu_flow_where`
--

INSERT INTO `xinhu_flow_where` (`id`, `setid`, `num`, `pnum`, `name`, `wheresstr`, `whereustr`, `wheredstr`, `sort`, `explain`, `receid`, `recename`, `nreceid`, `nrecename`, `islb`, `status`, `syrid`, `syrname`) VALUES
(1, 1, 'my', NULL, '与我相关', 'YHN0YXR1c2A9MSBhbmQge3JlY2VpZH0:', NULL, NULL, 0, 'receid包含用户', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(2, 5, NULL, NULL, '大于3天', 'YHRvdGFsc2AgPiAyNA::', NULL, NULL, 0, '时间(小时) 大于 24', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL),
(3, 34, NULL, NULL, '管理员对应开发部', NULL, NULL, NULL, 0, NULL, 'd2', '开发部', NULL, NULL, 0, 1, NULL, NULL),
(4, 4, NULL, NULL, '未分配的记录', 'YGRpc3RgIGlzIG51bGw:', NULL, NULL, 20, '分配给 为空 ', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL),
(5, 1, 'wfb', NULL, '我发布', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 1, 'optid字段等于当前用户', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(7, 3, 'my', NULL, '我的日报', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(8, 3, 'undall', NULL, '下属全部日报', 'YHVpZGAgaW4oe2FsbHN1cGVyfSk:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(9, 3, 'undwd', NULL, '全部下属未读', 'e3VpZCxkb3duYWxsfSBhbmQge3VucmVhZH0:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(10, 1, 'wexx', NULL, '我未读', 'YHN0YXR1c2A9MSBhbmQge3JlY2VpZH0gYW5kIHt1bnJlYWR9', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(11, 2, 'today', NULL, '今日会议', 'YHR5cGVgPTAgYW5kIGBzdGF0dXNgPTEgYW5kIGBzdGFydGR0YCBsaWtlICdbZGF0ZV0lJw::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(12, 2, 'bzhy', NULL, '本周会议', 'YHR5cGVgPTAgYW5kIGBzdGF0dXNgPTEgYW5kIGBzdGFydGR0YCA!PSAne3dlZWtmaXJzdH0n', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(13, 2, 'all', NULL, '全部会议', 'YHR5cGVgPTAgYW5kIGBzdGF0dXNgPTE:', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(14, 2, 'myfq', NULL, '我发起会议', 'YHR5cGVgPTAgYW5kIGBzdGF0dXNgPTEgYW5kIGBvcHRpZGA9e3VpZH0:', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(15, 13, NULL, NULL, '大乔查看权限', NULL, NULL, NULL, 0, NULL, 'd3,d4', '财务部,行政人事部', NULL, NULL, 0, 1, NULL, NULL),
(16, 4, 'my', NULL, '我的任务', 'e2Rpc3RpZCx1aWRpbn0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(17, 4, 'down', NULL, '我下属任务', 'e2Rpc3RpZCxkb3dufQ::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(18, 4, 'wcj', NULL, '我创建任务', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(19, 4, 'dd', NULL, '我督导任务', 'e2RkaWQsdWlkaW59', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(20, 4, 'wwc', NULL, '我未完成任务', 'YHN0YXR1c2AgaW4oMyw0KSBhbmQge2Rpc3RpZCx1aWRpbn0:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(21, 4, 'all', 'all', '所有任务', 'MT0x', NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(22, 22, 'my', NULL, '我执行项目', 'e3J1bnVzZXJpZCxyZWNlbm90fQ::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(23, 22, 'wwc', NULL, '我未完成项目', 'e3J1bnVzZXJpZCxyZWNlbm90fSBhbmQgYHN0YXR1c2AgaW4oMCwzKQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(24, 22, 'myfz', NULL, '我负责项目', 'e2Z1emVpZCx1aWRpbn0:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(25, 22, 'mycj', NULL, '我创建项目', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(26, 22, 'all', 'all', '所有项目', 'MT0x', NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(27, 12, 'my', NULL, '我的日程', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(28, 12, 'rece', NULL, '提醒给我的', 'e3JlY2VpZCxyZWNlbm90fQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(29, 4, 'ywc', NULL, '已完成任务', 'e2Rpc3RpZCx1aWRpbn0gYW5kIGBzdGF0dXNgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL),
(30, 7, 'my', NULL, '我的客户', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(31, 7, 'gxgw', 'shate', '共享给我的', 'e3NoYXRlaWQsdWlkaW59', NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(32, 7, 'myall', NULL, '我全部客户', 'YHVpZGA9e3VpZH0:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(33, 7, 'my_ting', NULL, '我停用客户', 'dWlkPXt1aWR9IGFuZCBgc3RhdHVzYD0w', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(34, 7, 'downall', 'down', '下属全部客户', 'YHVpZGAgaW4oe3N1cGVyfSk:', NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(35, 7, 'downty', 'down', '下属停用', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0dXNgPTA:', NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(36, 7, 'downstat', 'down', '下属标★', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBpc3N0YXRgPTE:', NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(37, 7, 'mystat', NULL, '我标★客户', 'YHVpZGA9e3VpZH0gYW5kIGBpc3N0YXRgPTE:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(38, 7, 'distdfp', 'dist', '待分配客户', 'KGB1aWRgPXt1aWR9IG9yIGBmemlkYD17dWlkfSBvciBgY3JlYXRlaWRgPXt1aWR9IG9yIGB1aWRgIGluKHtzdXBlcn0pKSBhbmQgYHVpZGA9MA::', NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(39, 7, 'distyfp', 'dist', '已分配的', 'KGB1aWRgPXt1aWR9IG9yIGBmemlkYD17dWlkfSBvciBgY3JlYXRlaWRgPXt1aWR9ICBvciBgdWlkYCBpbih7c3VwZXJ9KSkgYW5kIGB1aWRgPjA:', NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(40, 7, 'distall', 'dist', '全部分配状态', 'KGB1aWRgPXt1aWR9IG9yIGBmemlkYD17dWlkfSBvciBgY3JlYXRlaWRgPXt1aWR9ICBvciBgdWlkYCBpbih7c3VwZXJ9KSk:', NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(41, 7, 'mycj', NULL, '我创建', 'YGNyZWF0ZWlkYD17dWlkfQ::', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(42, 7, 'all', 'all', '所有客户', 'MT0x', NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(43, 7, 'allty', 'all', '所有停用客户', 'YHN0YXR1c2A9MA::', NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(44, 29, 'my', NULL, '我的档案', 'W0FdYGlkYD17dWlkfQ::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(45, 34, 'my', NULL, '我的薪资', 'YHh1aWRgPXt1aWR9', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL),
(46, 8, 'mygx', NULL, '我需跟进', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9MA::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(47, 8, 'mycj', NULL, '已成交', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(48, 8, 'myds', NULL, '已丢失', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9Mg::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(49, 8, 'myall', NULL, '我所有销售机会', 'YHVpZGA9e3VpZH0g', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(50, 8, 'downgj', 'down', '下属需跟进', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0ZWA9MA::', NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(51, 8, 'downcj', 'down', '下属已成交', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0ZWA9MQ::', NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(52, 8, 'downds', 'down', '下属已丢失', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0ZWA9Mg::', NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(53, 8, 'downall', 'down', '下属所有销售机会', 'YHVpZGAgaW4oe3N1cGVyfSkg', NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(54, 8, 'all', 'all', '所有销售机会', 'MT0x', NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(55, 8, 'allgj', 'all', '所有需跟进', 'YHN0YXRlYD0w', NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(56, 8, 'allcj', 'all', '所有已成交', 'YHN0YXRlYD0x', NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(57, 8, 'allds', 'all', '所有已丢失', 'YHN0YXRlYD0y', NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(58, 38, 'my', NULL, '我的调动', 'W0FdYHRyYW51aWRgPXt1aWR9', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(59, 38, 'mysq', NULL, '我申请调动', 'YHVpZGA9e3VpZH0:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(60, 38, 'all', 'all', '所有调动', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(61, 32, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(62, 32, 'all', 'all', '所有申请', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(63, 33, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(64, 33, 'all', 'all', '所有申请', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(65, 37, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(66, 37, 'all', 'all', '所有申请', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(67, 39, 'objmy', NULL, '奖惩对象是我', 'YG9iamVjdGlkYD17dWlkfQ::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(68, 39, 'my', NULL, '我申请的', 'YHVpZGA9e3VpZH0:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(69, 39, 'all', 'all', '所有奖惩', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(70, 1, 'all', 'all', '所有公告', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(71, 11, 'all', 'all', '所有费用报销', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(72, 11, 'my', NULL, '我的报销', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(73, 25, 'all', 'all', '所有出差报销', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(74, 25, 'my', NULL, '我的出差报销', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(75, 26, 'all', 'all', '所有借款单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(76, 26, 'my', NULL, '我的借款单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(77, 27, 'all', 'all', '所有还款单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(78, 27, 'my', NULL, '我的还款单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(79, 49, 'all', 'all', '所有印章申请', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(80, 49, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(81, 44, 'all', 'all', '所有车辆预定', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(82, 44, 'my', NULL, '我的预定', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(83, 44, 'myjia', NULL, '驾驶员是我', 'e2ppYWlkLHVpZGlufQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(84, 44, 'myuse', NULL, '使用人包含我', 'e3VzZWlkLHJlY2VhbGx9', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(85, 46, 'all', 'all', '所有图书借阅', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(86, 46, 'my', NULL, '我的借阅', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(87, 29, 'all', 'all', '所有档案', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(88, 3, 'all', 'all', '所有日报', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(89, 56, 'all', 'all', '所有培训', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(90, 43, 'all', 'all', '所有题库', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(91, 43, 'weidu', NULL, '我未读', 'e3VucmVhZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(167, 20, 'all', 'all', '所有收文单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(93, 58, 'all', 'all', '所有登记', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(94, 42, 'all', 'all', '所有车辆', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(95, 42, 'public', 'all', '可预定车辆', 'YGlzcHVibGljYD0x', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(96, 58, 'kydq', 'all', '7天内到期', 'YGVuZGR0YCBpcyBub3QgbnVsbCBhbmQgYGVuZGR0YDx7ZGF0ZSs3fSBhbmQgYGVuZGR0YD49e2RhdGV9', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(97, 35, 'my', NULL, '我所有合同', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(98, 35, 'ygq', NULL, '已过期', 'YHVpZGA9e3VpZH0gYW5kIGBlbmRkdGA8e2RhdGV9', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(99, 35, 'daisfk', NULL, '待收/付款', 'YHVpZGA9e3VpZH0gYW5kIGBpc3BheWA9MA::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(100, 35, 'qbsfk', NULL, '已全部收/付款', 'YHVpZGA9e3VpZH0gYW5kIGBpc3BheWA9MQ::', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(101, 35, 'bfsfk', NULL, '部分收/付款', 'YHVpZGA9e3VpZH0gYW5kIGBpc3BheWA9Mg::', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(102, 35, 'downall', 'down', '下属所有合同', 'IHt1aWQsZG93bn0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(103, 35, 'downygq', 'down', '已过期', 'IHt1aWQsZG93bn0gYW5kIGBlbmRkdGA8e2RhdGV9', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(104, 35, 'all', 'all', '所有合同', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(105, 36, 'myskd', NULL, '我收款单', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0w', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(106, 36, 'myskdys', NULL, '我已收款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0wIGFuZCBgaXNwYXlgPTE:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(107, 36, 'myskdws', NULL, '我未收款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0wIGFuZCBgaXNwYXlgPTA:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(108, 36, 'downskd', 'downskd', '下属收款单', 'IHt1aWQsZG93bn0gYW5kIGB0eXBlYD0w', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(109, 36, 'downskdys', 'downskd', '下属已收款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTAgYW5kIGBpc3BheWA9MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(110, 36, 'downskdwsk', 'downskd', '下属未收款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTAgYW5kIGBpc3BheWA9MA::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(111, 36, 'allskd', 'allskd', '所有收款单', 'YHR5cGVgPTA:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(112, 36, 'allskdys', 'allskd', '所有已收款', 'YHR5cGVgPTAgYW5kIGBpc3BheWA9MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(113, 36, 'allskdwsk', 'allskd', '所有未收款', 'YHR5cGVgPTAgYW5kIGBpc3BheWA9MA::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(114, 36, 'myfkd', 'fkd', '我的付款单', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(115, 36, 'myfkdyf', 'fkd', '我已付款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0xIGFuZCBgaXNwYXlgPTE:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(116, 36, 'myfkdwf', 'fkd', '我未付款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0xIGFuZCBgaXNwYXlgPTA:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(117, 36, 'downfkd', 'downfkd', '下属付款单', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(118, 36, 'downfkdyf', 'downfkd', '下属已付款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTEgYW5kIGBpc3BheWA9MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(119, 36, 'downfkdwf', 'downfkd', '下属未付款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTEgYW5kIGBpc3BheWA9MA::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(120, 36, 'allfkd', 'allfkd', '所有付款单', 'YHR5cGVgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(121, 36, 'allfkdyf', 'allfkd', '所有已付款', 'YHR5cGVgPTEgYW5kIGBpc3BheWA9MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(122, 36, 'allfkdwf', 'allfkd', '所有未付款', 'YHR5cGVgPTEgYW5kIGBpc3BheWA9MA::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(123, 59, 'all', 'all', '所有维修', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(124, 60, 'all', 'all', '所有保养记录', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(125, 59, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(126, 59, 'myjia', NULL, '驾驶员包含我', 'e2ppYWlkLHVpZGlufQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(127, 60, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(128, 60, 'myjia', NULL, '驾驶员包含我', 'IHtqaWFpZCx1aWRpbn0:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(129, 6, 'allfee', 'all', '加班费单据', 'YGppYXR5cGVgPTE:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(130, 6, 'all', 'all', '所有加班单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(131, 6, 'my', NULL, '我的加班单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(132, 5, 'my', NULL, '我的请假条', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(133, 5, 'all', 'all', '所有请假条', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(136, 42, 'my', NULL, '可预定车辆', 'YGlzcHVibGljYD0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(137, 61, 'my', NULL, '我的设置', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(138, 62, 'my', NULL, '我的报修', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(139, 62, 'all', 'all', '所有报修', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(140, 62, 'allsx', 'all', '需要外修', 'YGlzd3hgPTE:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(141, 63, 'all', 'all', '所有公司单位', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(142, 31, 'my', NULL, '我的合同', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(143, 31, 'all', 'all', '所有合同', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(144, 31, 'all30', 'all', '30天内过期', 'YGVuZGR0YDw9e2RhdGUrMzB9IGFuZCBgc3RhdGVgPTE:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(145, 31, 'allsxz', 'all', '生效中', 'YHN0YXRlYD0x', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(146, 31, 'allyzz', 'all', '已终止', 'YHN0YXRlYD0y', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(147, 10, 'all', 'all', '所有用户', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(148, 10, 'allty', 'all', '已停用', 'YHN0YXR1c2A9MA::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(149, 10, 'allgly', 'all', '管理员用户', 'YHR5cGVgPTE:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(150, 10, 'txlmy', 'txl', '通讯录', 'YHN0YXR1c2A9MSBhbmQgYGlzdmNhcmRgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(151, 10, 'txldown', 'txl', '我直属下级', 'YHN0YXR1c2A9MSBhbmQgYGlzdmNhcmRgPTEgYW5kIHtpZCxkb3dufQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(152, 10, 'txldownall', 'txl', '我全部下属', 'YHN0YXR1c2A9MSBhbmQgYGlzdmNhcmRgPTEgYW5kIHtpZCxkb3duYWxsfQ::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(153, 64, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(154, 64, 'all', 'all', '所有申请', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(155, 65, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(156, 65, 'all', 'all', '所有申请', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(157, 23, 'my', NULL, '我的外出出差', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(158, 23, 'all', 'all', '所有外出出差', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(159, 23, 'mytoday', NULL, '我今日外出', 'YHVpZGA9e3VpZH0gYW5kIGBpbnRpbWVgID4gJ1tkYXRlXScgYW5kIGBvdXR0aW1lYDwgJ1tkYXRlXSAyMzo1OTo1OSc:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(160, 23, 'alltoday', 'all', '所有今日外出', 'YGludGltZWAgPiAnW2RhdGVdJyBhbmQgYG91dHRpbWVgPCAnW2RhdGVdIDIzOjU5OjU5Jw::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(161, 23, 'downtoday', 'down', '下属今日外出', 'e3VpZCxkb3dufSBhbmQgYGludGltZWAgPiAnW2RhdGVdJyBhbmQgYG91dHRpbWVgPCAnW2RhdGVdIDIzOjU5OjU5Jw::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(162, 23, 'downall', 'down', '下属所有外出', 'e3VpZCxkb3dufQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(163, 51, 'my', NULL, '我的打卡异常', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(164, 51, 'all', 'all', '所有打卡异常', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(165, 19, 'all', 'all', '所有发文', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(166, 19, 'my', NULL, '我的发文', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(168, 20, 'my', NULL, '我的收文单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(169, 67, 'my', NULL, '我的订阅管理', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(170, 67, 'all', 'all', '所有订阅管理', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(171, 68, 'my', NULL, '给我的订阅', 'e3JlY2VpZCx1aWRpbn0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(172, 68, 'all', 'all', '所有订阅报表', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(173, 67, 'shate', NULL, '共享给我订阅', 'e3NoYXRlaWQscmVjZW5vdH0:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(174, 69, 'my', NULL, '需我查阅公文', 'KHtyZWNlaWQscmVjZW5vdH0p', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(175, 69, 'mywcy', NULL, '未查阅公文', 'e3JlY2VpZCxyZWNlbm90fSBhbmQge3VucmVhZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(176, 70, 'all', 'all', '所有考勤机设备', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(177, 70, 'offline', 'all', '不在线设备', 'KGBsYXN0ZHRgIGlzIG51bGwgb3IgYGxhc3RkdGA8e3NlY29uZC0zMDB9KQ::', NULL, NULL, 1, '最后请求在5分钟之前就不在线', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(178, 29, 'nowbirty', 'all', '当月人员生日', 'TUlEKGBiaXJ0aGRheWAsNiwyKT1kYXRlX2Zvcm1hdChub3coKSwnJW0nKQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(179, 71, 'all', 'all', '所有考核评分', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(180, 71, 'my', NULL, '我的考核评分', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(181, 72, 'all', 'all', '所有演示数据', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(182, 73, 'all', 'all', '仓库管理', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(183, 73, 'my', NULL, '我管理的仓库', 'e2NnaWQsdWlkaW59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(184, 7, 'gys', 'gys', '供应商管理', 'YGlzZ3lzYD0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(185, 28, 'all', 'all', '所有采购单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(186, 24, 'all', 'all', '所有领用单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(187, 24, 'my', NULL, '我的领用单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(188, 28, 'my', NULL, '我的采购单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(189, 24, 'alldck', 'all', '待领用出库', 'YHN0YXR1c2A9MSBhbmQgYHN0YXRlYDw!MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(190, 28, 'alldrk', 'all', '待采购入库', 'YHN0YXR1c2A9MSBhbmQgYHN0YXRlYDw!MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(191, 74, 'all', 'all', '所有文档分区', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(192, 74, 'my', NULL, '我的文档分区', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(193, 76, 'my', NULL, '我的调拨单', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(194, 76, 'all', 'all', '所有调拨单', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(195, 76, 'alldck', 'all', '待调拨入库', 'YHN0YXR1c2A9MSBhbmQgYHN0YXRlYDw!MQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(196, 7, 'allgh', 'ghai', '所有公海库', 'YGlzZ2hgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(197, 77, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(198, 77, 'all', 'all', '所有申请', 'MT0x', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(199, 77, 'down', NULL, '我下级申请', 'e3VpZCxkb3duYWxsfQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(200, 29, 'lizhi', 'all', '离职人员', 'YHF1aXRkdGAgaXMgbm90IG51bGw:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(201, 78, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(202, 78, 'all', 'all', '所有需求', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(203, 79, 'my', NULL, '我的安排', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(204, 79, 'myms', NULL, '我的面试', 'e21zdXNlcmlkLHVpZGlufQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(205, 79, 'all', 'all', '所有面试', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(206, 80, 'my', NULL, '我未回执确认', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(207, 80, 'myall', NULL, '我全部回执确认', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(208, 80, 'my创建', NULL, '我创建的', 'YHVpZGA9e3VpZH0:', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(209, 80, 'all', 'all', '所有回执确认', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(210, 81, 'all', 'all', '所有考核项目', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(211, 81, 'my', NULL, '我的考核项目', 'e3JlY2VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(212, 71, 'wopf', NULL, '需我评分', 'IHtwZnJlbmlkLHVpZGlufQ::', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(213, 71, 'wowpf', NULL, '需我未评分', 'e3BmcmVuaWRzLHVpZGlufQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(214, 71, 'tjall', 'tjall', '考核评分详情', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(215, 10, 'notall', 'all', '未通讯录显示', 'YGlzdmNhcmRgPTA:', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(216, 48, 'all', 'all', '所有', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(217, 83, 'all', 'all', '所有模版', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(218, 84, 'all', 'all', '所有记录', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(220, 34, NULL, NULL, '本部门人员', 'e3h1aWQsZGVwdGFsbH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL),
(221, 34, 'all', 'all', '所有人薪资', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(222, 85, 'shou', 'all', '收到的发票', 'YHR5cGVgPTE:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(223, 85, 'kai', 'all', '开出去的发票', 'YHR5cGVgPTA:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(224, 85, 'my', NULL, '我添加的发票', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(225, 9, NULL, NULL, '物品库存小于10', 'YHN0b2NrYDw9MTA:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL),
(226, 29, 'zaizhi', 'all', '在职人员', 'YHF1aXRkdGAgaXMgbnVsbA::', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(227, 86, 'myxie', NULL, '需我协作', 'KGBvcHRpZGA9e3VpZH0gb3Ige3hpZW5hbWVpZCxyZWNlbm90fSk:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(228, 86, 'myview', NULL, '我可查看', 'KGBvcHRpZGA9e3VpZH0gb3Ige3JlY2VpZCxyZWNlbm90fSk:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(229, 86, 'my', NULL, '我创建', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(230, 87, 'my', NULL, '我的传送', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(231, 87, 'tomy', NULL, '接收人是我', 'e3FpYW5uYW1laWQsdWlkaW59', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(232, 2, 'all', 'all', '所有会议', 'YHR5cGVgPTA:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(233, 2, 'allgd', 'all', '固定会议', 'YHR5cGVgPTE:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(234, 88, 'all', 'all', '所有记录', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(235, 88, 'my', NULL, '发给我的', 'YHN0YXR1c2A9MSBhbmQge3JlY2VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(236, 88, 'wfb', NULL, '我发布的', 'YG9wdGlkYD17dWlkfQ::', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(239, 19, 'mymb', 'hong', '所有需套红公文', 'YHN0YXR1c2A9MQ::', NULL, NULL, 1, '必须已审核的', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(240, 19, 'xuth', 'hong', '需套红公文', 'YHN0YXR1c2A9MSBhbmQgYHRoaWRgPTA:', NULL, NULL, 0, '必须已审核的', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(241, 19, 'yuth', 'hong', '已套红公文', 'YHN0YXR1c2A9MSBhbmQgYHRoaWRgPjA:', NULL, NULL, 2, '必须已审核的', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(242, 19, 'wgz', 'gaiz', '未申请盖章', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTEgYW5kIGB0aGlkYD4wIGFuZCBgeXppZGA9MA::', NULL, NULL, 0, '需套红后才可以盖章', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(243, 19, 'bygz', 'gaiz', '不需要盖章', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTEgYW5kIGB0aGlkYD4wIGFuZCBgeXppZGA9LTE:', NULL, NULL, 1, '需套红后才可以盖章', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(244, 19, 'ygz', 'gaiz', '已申请盖章的', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTEgYW5kIGB0aGlkYD4wIGFuZCBgeXppZGA!MA::', NULL, NULL, 2, '需套红后才可以盖章', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(245, 19, 'allgz', 'gaiz', '所有需盖章', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTEgYW5kIGB0aGlkYD4w', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(246, 19, 'ffall', 'ffa', '公文分发', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTEgYW5kIGB0aGlkYD4wIGFuZCAoYHl6aWRgPjAgb3IgYHl6aWRgPS0xKQ::', NULL, NULL, 0, '需已套红和盖章的', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(247, 19, 'dfefa', 'ffa', '待分发公文', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTEgYW5kIGB0aGlkYD4wIGFuZCAoYHl6aWRgPjAgb3IgYHl6aWRgPS0xKSBhbmQgaWZudWxsKGByZWNlaWRgLCcnKT0nJyA:', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(249, 92, 'my', NULL, '我的销售', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(250, 92, 'downall', 'down', '下属的销售', 'YHVpZGAgaW4oe3N1cGVyfSk:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(251, 92, 'all', 'all', '所有销售', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(252, 52, 'my', NULL, '我的申请', 'YHVpZGA9e3VpZH0:', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(253, 7, 'alllizi', 'all', '离职人员客户', 'YHVpZGA!MCBhbmQgYHVpZGAgbm90IGluKHNlbGVjdCBpZCBmcm9tIFtRXWFkbWluIHdoZXJlIHN0YXR1cz0xKQ::', NULL, NULL, 52, '无主客户', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(254, 69, 'all', 'all', '所有查阅', 'MT0x', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(260, 10, 'lookall', 'lookall', '看全部人员', 'IHtjb21wYW55aWQsZGVwdGFsbH0:', NULL, NULL, 0, NULL, 'u1', '管理员', NULL, NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_godepot`
--

CREATE TABLE IF NOT EXISTS `xinhu_godepot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depotname` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `depotaddress` varchar(100) DEFAULT NULL COMMENT '仓库地址',
  `cgname` varchar(50) DEFAULT NULL COMMENT '仓库管理员',
  `cgid` varchar(50) DEFAULT NULL COMMENT '仓库管理员的ID',
  `depotexplain` varchar(500) DEFAULT NULL COMMENT '说明',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `depotnum` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `wpshu` int(11) DEFAULT '0' COMMENT '物品数',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物品仓库表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xinhu_godepot`
--

INSERT INTO `xinhu_godepot` (`id`, `depotname`, `depotaddress`, `cgname`, `cgid`, `depotexplain`, `sort`, `depotnum`, `wpshu`, `comid`) VALUES
(1, '默认仓库', NULL, '赵子龙', '7', NULL, 0, 'depot', 3, 0),
(2, '仓库2', NULL, '貂蝉', '2', NULL, 1, 'cknu', 4, 0),
(3, '泉州仓库', NULL, '大乔', '4', NULL, 0, NULL, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_goodm`
--

CREATE TABLE IF NOT EXISTS `xinhu_goodm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '编号如销售号',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `type` tinyint(1) DEFAULT '0' COMMENT '0领用,1采购申请',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '费用',
  `custid` smallint(6) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `discount` decimal(8,2) DEFAULT '0.00' COMMENT '优惠价格',
  `state` tinyint(1) DEFAULT '0' COMMENT '0待出入库,2部分出入库,1已全部出入库',
  `custractid` int(11) DEFAULT '0' COMMENT '关联客户合同custract.id',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否全部创建收款单',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物品领用采购申请主表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_goodn`
--

CREATE TABLE IF NOT EXISTS `xinhu_goodn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表',
  `aid` smallint(6) DEFAULT '0' COMMENT '物品Id',
  `count` smallint(6) DEFAULT '0' COMMENT '数量',
  `couns` smallint(6) DEFAULT '0' COMMENT '已出库入库数跟count相等时就全部了',
  `sort` smallint(6) DEFAULT '0',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物品库存详细表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `xinhu_goodn`
--

INSERT INTO `xinhu_goodn` (`id`, `mid`, `aid`, `count`, `couns`, `sort`, `unit`, `price`, `comid`) VALUES
(1, 1, 3, 22, 22, 0, '台', '1200.00', 0),
(2, 1, 5, 33, 33, 1, '支', '2.00', 0),
(3, 2, 2, 5, 5, 0, NULL, '0.00', 0),
(4, 3, 3, 12, 0, 0, '台', '1200.00', 0),
(5, 4, 5, 12, 12, 0, '支', '2.00', 0),
(6, 5, 3, 2, 2, 0, NULL, '0.00', 0),
(7, 5, 6, 33, 33, 1, NULL, '0.00', 0),
(8, 6, 2, 22, 22, 0, NULL, '0.00', 0),
(10, 8, 3, 2, 2, 0, '台', '1200.00', 0),
(11, 9, 3, 22, 0, 0, NULL, '0.00', 0),
(12, 9, 5, 2, 0, 1, NULL, '0.00', 0),
(13, 10, 1, 1, 0, 0, NULL, '0.00', 0),
(14, 10, 3, 1, 0, 1, NULL, '0.00', 0),
(15, 11, 2, 5, 5, 0, '个', '12.00', 0),
(17, 13, 8, 10, 10, 0, '盒', '0.10', 2),
(18, 13, 9, 22, 0, 1, '支', '50.00', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_goods`
--

CREATE TABLE IF NOT EXISTS `xinhu_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) DEFAULT '0' COMMENT '对应分类',
  `num` varchar(30) DEFAULT NULL COMMENT '物品编号',
  `name` varchar(30) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL COMMENT '规格',
  `xinghao` varchar(50) DEFAULT NULL COMMENT '型号',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `stockcs` int(11) DEFAULT '0' COMMENT '初始库存',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typeid` (`typeid`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_goodss`
--

CREATE TABLE IF NOT EXISTS `xinhu_goodss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` smallint(6) DEFAULT '0' COMMENT '物品Id',
  `count` smallint(6) DEFAULT '0' COMMENT '数量',
  `uid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0入库,1出库',
  `kind` tinyint(2) DEFAULT '0' COMMENT '出入库类型',
  `optname` varchar(20) DEFAULT NULL,
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `optid` int(11) DEFAULT '0',
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表',
  `sort` smallint(6) DEFAULT '0',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `depotid` smallint(6) DEFAULT '1' COMMENT '存放仓库ID',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `aiddepotid` (`aid`,`depotid`) USING BTREE,
  KEY `applydt` (`applydt`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物品库存详细表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_group`
--

CREATE TABLE IF NOT EXISTS `xinhu_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '组名',
  `sort` int(11) DEFAULT '0',
  `ispir` tinyint(4) DEFAULT '1' COMMENT '是否权限验证',
  `indate` datetime DEFAULT NULL,
  `companyid` smallint(6) DEFAULT '0' COMMENT '所属单位Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统组' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `xinhu_group`
--

INSERT INTO `xinhu_group` (`id`, `name`, `sort`, `ispir`, `indate`, `companyid`) VALUES
(1, '外地职工', 1, 1, '2014-09-04 17:33:47', 0),
(2, '本地职工', 2, 1, '2014-09-04 17:33:56', 0),
(3, '部门负责人', 0, 1, '2018-09-26 11:51:56', 1),
(4, '管理员组', 0, 1, '2019-04-01 16:12:45', 0),
(5, '泉州分公司组', 0, 1, '2019-06-03 21:49:27', 2),
(6, '注册用户组', 0, 1, '2019-12-13 14:04:51', 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_homeitems`
--

CREATE TABLE IF NOT EXISTS `xinhu_homeitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `num` varchar(30) NOT NULL COMMENT '编号',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `row` tinyint(1) DEFAULT '0' COMMENT '所在位置',
  PRIMARY KEY (`id`,`num`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='桌面项目表' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `xinhu_homeitems`
--

INSERT INTO `xinhu_homeitems` (`id`, `name`, `num`, `receid`, `recename`, `sort`, `status`, `row`) VALUES
(1, '快捷入口', 'kjrk', NULL, NULL, 0, 1, 0),
(2, '通知公告', 'gong', NULL, NULL, 1, 1, 0),
(3, '考勤打卡', 'kqdk', NULL, NULL, 4, 1, 0),
(4, '微信办公', 'gwwx', 'u1', '管理员', 10, 1, 0),
(5, '我的申请', 'apply', NULL, NULL, 0, 1, 1),
(6, '今日会议', 'meet', NULL, NULL, 2, 1, 1),
(7, '系统日志', 'syslog', 'u1', '管理员', 4, 1, 1),
(8, '关于信呼', 'about', 'u1', '管理员', 10, 1, 1),
(9, '公文查阅', 'officic', NULL, NULL, 3, 1, 1),
(10, '快捷入口(大图标)', 'kjrko', NULL, NULL, 0, 1, 0),
(11, '新闻资讯', 'news', NULL, NULL, 3, 0, 0),
(12, '今日出勤情况', 'kqtotal', 'd4', '行政人事部', 2, 1, 0),
(13, '登录统计', 'tjlogin', 'u1', '管理员', 5, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrcheck`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `title` varchar(100) DEFAULT NULL COMMENT '考核名称',
  `applyname` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `uname` varchar(20) DEFAULT NULL COMMENT '对应人',
  `month` varchar(50) DEFAULT '{month}' COMMENT '月份',
  `content` varchar(2000) DEFAULT NULL COMMENT '考核内容',
  `fenzp` decimal(6,1) DEFAULT '0.0' COMMENT '自评分数',
  `fensj` decimal(6,1) DEFAULT '0.0' COMMENT '上级评分',
  `fenrs` decimal(6,1) DEFAULT '0.0' COMMENT '人事评分',
  `fen` decimal(6,1) DEFAULT '0.0' COMMENT '最后得分',
  `khid` int(11) DEFAULT '0' COMMENT '关联考核项目hrkaohem.id',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `startdt` date DEFAULT NULL COMMENT '评分开始时间',
  `enddt` date DEFAULT NULL COMMENT '评分截止时间',
  `pfren` varchar(500) DEFAULT NULL COMMENT '评分人',
  `pfrenid` varchar(500) DEFAULT NULL,
  `pfrenids` varchar(500) DEFAULT NULL COMMENT '未评分人Id',
  `pfrens` varchar(500) DEFAULT NULL COMMENT '未评分人',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `startdt` (`startdt`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核评分表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrcheckn`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrcheckn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(100) DEFAULT NULL COMMENT '评分项目',
  `pfname` varchar(100) DEFAULT NULL COMMENT '评分名称',
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表hrcheck.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `sid` int(11) DEFAULT '0' COMMENT '对应hrchecks.id',
  `fenshu` smallint(6) DEFAULT '0' COMMENT '评分分数',
  `weight` decimal(6,1) DEFAULT '0.0' COMMENT '权重',
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '评分人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `defen` decimal(6,1) DEFAULT '0.0' COMMENT '最后得分',
  `pfid` int(11) DEFAULT '0' COMMENT '关联评分hrkaohen.Id',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核评分记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrchecks`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrchecks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表hrkaohem.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `itemname` varchar(200) DEFAULT NULL COMMENT '考评项目',
  `weight` decimal(6,1) DEFAULT '0.0' COMMENT '权重(%)',
  `fenshu` decimal(6,1) DEFAULT '0.0' COMMENT '占用分数',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考评内容' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrdemint`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrdemint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `type` tinyint(1) DEFAULT '0' COMMENT '0需求,1面试',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `zhiwei` varchar(50) DEFAULT NULL COMMENT '需求职位',
  `xinzi` varchar(50) DEFAULT NULL COMMENT '薪资',
  `renshu` smallint(6) DEFAULT '1' COMMENT '需求人数',
  `content` varchar(2000) DEFAULT NULL COMMENT '职位要求/面试者简历',
  `bumen` varchar(50) DEFAULT NULL COMMENT '需求部门',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `msuser` varchar(50) DEFAULT NULL COMMENT '面试人员',
  `msuserid` varchar(50) DEFAULT NULL COMMENT '面试人员的ID',
  `mscont` varchar(2000) DEFAULT NULL COMMENT '面试记录',
  `state` tinyint(1) DEFAULT '0' COMMENT '面试结果0待面试,1录用,2不适合',
  `msdt` datetime DEFAULT NULL COMMENT '面试时间',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='面试和人员需求表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrkaohem`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrkaohem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '考核名称',
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `receid` varchar(1000) DEFAULT NULL,
  `recename` varchar(1000) DEFAULT NULL COMMENT '对应考核人',
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `hegfen` smallint(6) DEFAULT '0' COMMENT '合格分数',
  `maxfen` smallint(6) DEFAULT '100' COMMENT '最高分数',
  `pinlv` varchar(50) DEFAULT 'm' COMMENT '考核频率',
  `sctime` varchar(30) DEFAULT NULL COMMENT '生成时间',
  `pfsj` smallint(6) DEFAULT '3' COMMENT '评分时间(天)',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核项目' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrkaohen`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrkaohen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表hrkaohem.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `pfname` varchar(50) DEFAULT NULL COMMENT '评分名称',
  `pftype` varchar(20) DEFAULT NULL COMMENT '评分人类型',
  `pfren` varchar(20) DEFAULT NULL COMMENT '评分人',
  `pfrenid` varchar(20) DEFAULT NULL,
  `pfweight` decimal(6,1) DEFAULT '0.0' COMMENT '评分权重',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核项目人员' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrkaohes`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrkaohes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表hrkaohem.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `itemname` varchar(200) DEFAULT NULL COMMENT '考评项目',
  `weight` decimal(6,1) DEFAULT '0.0' COMMENT '权重(%)',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核项目的内容' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrpositive`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrpositive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `applyname` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `ranking` varchar(30) DEFAULT NULL COMMENT '职位',
  `entrydt` date DEFAULT NULL COMMENT '入职日期',
  `syenddt` date DEFAULT NULL COMMENT '试用到期日',
  `positivedt` date DEFAULT NULL COMMENT '转正日期',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='HR转正' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrredund`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrredund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `applyname` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `ranking` varchar(30) DEFAULT NULL COMMENT '职位',
  `entrydt` date DEFAULT NULL COMMENT '入职日期',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `redundtype` varchar(20) DEFAULT NULL COMMENT '离职类型',
  `redundreson` varchar(100) DEFAULT NULL COMMENT '离职原因',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='离职申请' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrsalarm`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrsalarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '模版名称',
  `receid` varchar(500) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '适用对象',
  `explain` varchar(500) DEFAULT NULL,
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `atype` varchar(20) DEFAULT NULL COMMENT '模版类型',
  `startdt` varchar(20) DEFAULT NULL COMMENT '开始月份',
  `enddt` varchar(20) DEFAULT NULL COMMENT '截止月份',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='薪资模版' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `xinhu_hrsalarm`
--

INSERT INTO `xinhu_hrsalarm` (`id`, `title`, `receid`, `recename`, `explain`, `optid`, `optname`, `optdt`, `atype`, `startdt`, `enddt`, `sort`, `status`, `comid`) VALUES
(1, NULL, 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-09-30 13:26:47', '基本工资', '2013-12', '2050-12', 0, 1, 0),
(2, '绩效考核', 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-09-30 13:26:47', '绩效', '2013-12', '2050-12', 10, 1, 0),
(3, '人事考勤', 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-09-30 13:26:47', '考勤', '2013-01', '2050-12', 20, 1, 0),
(4, NULL, 'd1', '信呼开发团队', '起征点3500', 1, '管理员', '2018-10-09 19:37:48', '个人所得税', '2013-01', '2018-09', 70, 1, 0),
(5, NULL, 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-09-30 13:26:47', '社保公积金', '2013-01', '2050-12', 50, 1, 0),
(6, '人事考勤', 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-09-30 13:26:47', '考勤', '2013-01', '2050-12', 20, 0, 0),
(7, NULL, 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-10-09 19:39:10', '补贴', '2013-01', '2050-12', 30, 1, 0),
(8, NULL, 'd1', '信呼开发团队', NULL, 1, '管理员', '2018-09-30 13:26:47', '其他', '2013-01', '2050-12', 40, 1, 0),
(9, NULL, 'd1', '信呼开发团队', '起征点5000，2018年10月起', 1, '管理员', '2018-09-30 13:26:47', '个人所得税', '2018-10', '2050-12', 70, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrsalars`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrsalars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表hrsalarm.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `fields` varchar(50) DEFAULT NULL COMMENT '对应字段',
  `gongsi` varchar(1000) DEFAULT NULL COMMENT '公式',
  `type` tinyint(1) DEFAULT '0' COMMENT '0字段,1增加,2减少',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `devzhi` varchar(20) DEFAULT NULL COMMENT '默认值',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='薪资模版子表' AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `xinhu_hrsalars`
--

INSERT INTO `xinhu_hrsalars` (`id`, `mid`, `sort`, `name`, `fields`, `gongsi`, `type`, `beizhu`, `devzhi`, `comid`) VALUES
(1, 1, 0, '基本工资', 'base', NULL, 1, '厦门市最低工资', '1700', 0),
(2, 8, 0, '其它增加', 'otherzj', NULL, 1, NULL, '0', 0),
(3, 2, 0, '绩效基数', 'jxjs', NULL, 0, NULL, '2000', 0),
(4, 2, 1, '绩效系数', 'jxxs', NULL, 0, NULL, '1.5', 0),
(5, 2, 2, '绩效分数', 'jxdf', NULL, 0, NULL, '0', 0),
(6, 2, 3, '绩效收入', 'jtpost', '{jxjs}*{jxxs}*{jxdf}*0.01', 1, NULL, '0', 0),
(7, 3, 0, '应出勤天数', 'ysbtime', NULL, 0, NULL, '0', 0),
(8, 3, 1, '出勤天数', 'zsbtime', NULL, 0, NULL, '0', 0),
(9, 9, 0, '个税起征点', 'taxbase', NULL, 0, NULL, '5000', 0),
(10, 9, 1, '个人所得税', 'taxes', 'faxgerenn({mones}-{taxbase})', 4, NULL, '0', 0),
(11, 7, 0, '交通补贴', 'travelbt', 'last', 1, NULL, '0', 0),
(12, 4, 1, '个人所得税', 'taxes', 'faxgeren({mones}-{taxbase})', 4, NULL, '0', 0),
(13, 4, 0, '个税起征点', 'taxbase', NULL, 0, NULL, '3500', 0),
(14, 3, 2, '奖励', 'reward', NULL, 1, NULL, '0', 0),
(15, 3, 3, '处罚', 'punish', NULL, 2, NULL, '0', 0),
(16, 3, 4, '加班(小时)', 'jiaban', NULL, 0, NULL, '0', 0),
(17, 3, 5, '加班补贴', 'jiabans', NULL, 1, NULL, '0', 0),
(18, 5, 0, '个人社保', 'socials', NULL, 2, NULL, '0', 0),
(19, 5, 1, '单位社保缴费', 'socialsunit', NULL, 0, NULL, '0', 0),
(20, 5, 2, '公积金个人', 'gonggeren', NULL, 2, NULL, '0', 0),
(21, 5, 3, '公积金单位', 'gongunit', NULL, 0, NULL, '0', 0),
(22, 6, 4, '早退(次)', 'zaotui', NULL, 0, NULL, '0', 0),
(23, 6, 2, '迟到(次)', 'cidao', NULL, 0, NULL, '0', 0),
(24, 6, 3, '迟到处罚', 'cidaos', NULL, 2, NULL, '0', 0),
(25, 8, 2, '计件收入', 'jiansr', NULL, 1, NULL, '0', 0),
(26, 8, 1, '其它减少', 'otherjs', NULL, 2, NULL, '0', 0),
(27, 7, 6, '其他补贴', 'otherbt', NULL, 1, NULL, '0', 0),
(28, 7, 5, '电脑补贴', 'dnbt', 'last', 1, NULL, '0', 0),
(29, 7, 4, '高温津贴', 'hotbt', 'last', 1, NULL, '0', 0),
(30, 7, 3, '餐补贴', 'foodbt', 'last', 1, NULL, '0', 0),
(31, 7, 1, '通信补贴', 'telbt', 'last', 1, NULL, '0', 0),
(32, 7, 2, '技能津贴', 'skilljt', 'last', 1, NULL, '0', 0),
(33, 6, 5, '早退处罚', 'zaotuis', NULL, 2, NULL, '0', 0),
(34, 6, 6, '未打卡(次)', 'weidk', NULL, 0, NULL, '0', 0),
(35, 6, 7, '未打卡处罚', 'weidks', NULL, 2, NULL, '0', 0),
(36, 6, 8, '请假(小时)', 'leave', NULL, 0, NULL, '0', 0),
(37, 6, 9, '请假减少', 'leaves', NULL, 2, NULL, '0', 0),
(38, 6, 0, '应出勤天数', 'ysbtime', NULL, 0, NULL, '0', 0),
(39, 6, 1, '出勤天数', 'zsbtime', NULL, 0, NULL, '0', 0),
(40, 6, 10, '奖励', 'reward', NULL, 1, NULL, '0', 0),
(41, 6, 11, '处罚', 'punish', NULL, 2, NULL, '0', 0),
(42, 6, 12, '加班(小时)', 'jiaban', NULL, 0, NULL, '0', 0),
(43, 6, 13, '加班补贴', 'jiabans', NULL, 1, NULL, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrsalary`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `xuid` smallint(6) DEFAULT '0',
  `uname` varchar(20) DEFAULT NULL COMMENT '对应人',
  `udeptname` varchar(20) DEFAULT NULL COMMENT '对应人员部门',
  `ranking` varchar(20) DEFAULT NULL COMMENT '职位',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `base` decimal(10,2) DEFAULT '0.00' COMMENT '基本工资',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '实发',
  `mones` decimal(10,2) DEFAULT '0.00' COMMENT '应发工资',
  `postjt` decimal(10,2) DEFAULT '0.00' COMMENT '职务津贴',
  `skilljt` decimal(10,2) DEFAULT '0.00' COMMENT '技能津贴',
  `travelbt` decimal(10,2) DEFAULT '0.00' COMMENT '交通补贴',
  `telbt` decimal(10,2) DEFAULT '0.00' COMMENT '通信补贴',
  `reward` decimal(10,2) DEFAULT '0.00' COMMENT '奖励',
  `punish` decimal(10,2) DEFAULT '0.00' COMMENT '处罚',
  `socials` decimal(10,2) DEFAULT '0.00' COMMENT '个人社保',
  `socialsunit` decimal(10,2) DEFAULT '0.00' COMMENT '单位社保缴费',
  `taxes` decimal(10,2) DEFAULT '0.00' COMMENT '个人所得税',
  `taxbase` decimal(10,2) DEFAULT '0.00' COMMENT '个税起征点',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否发放',
  `otherzj` decimal(10,2) DEFAULT '0.00' COMMENT '其它增加',
  `otherjs` decimal(10,2) DEFAULT '0.00' COMMENT '其它减少',
  `cidao` smallint(6) DEFAULT '0' COMMENT '迟到(次)',
  `cidaos` decimal(10,2) DEFAULT '0.00' COMMENT '迟到处罚',
  `zaotui` smallint(6) DEFAULT '0' COMMENT '早退(次)',
  `zaotuis` decimal(10,2) DEFAULT '0.00' COMMENT '早退处罚',
  `leave` smallint(6) DEFAULT '0' COMMENT '请假(小时)',
  `leaves` decimal(10,2) DEFAULT '0.00' COMMENT '请假减少',
  `jiaban` smallint(6) DEFAULT '0' COMMENT '加班(小时)',
  `jiabans` decimal(10,2) DEFAULT '0.00' COMMENT '加班补贴',
  `weidk` smallint(6) DEFAULT '0' COMMENT '未打卡(次)',
  `weidks` decimal(10,2) DEFAULT '0.00' COMMENT '未打卡减少',
  `jxjs` decimal(10,2) DEFAULT '0.00' COMMENT '绩效基数',
  `jxxs` decimal(10,2) DEFAULT '0.00' COMMENT '绩效系数',
  `jxdf` decimal(10,2) DEFAULT '0.00' COMMENT '绩效打分',
  `jtpost` decimal(10,2) DEFAULT '0.00' COMMENT '绩效收入',
  `ysbtime` decimal(10,1) DEFAULT '0.0' COMMENT '应上班天数',
  `zsbtime` decimal(10,1) DEFAULT '0.0' COMMENT '已上班天数',
  `gonggeren` decimal(10,2) DEFAULT '0.00' COMMENT '公积金个人',
  `gongunit` decimal(10,2) DEFAULT '0.00' COMMENT '公积金单位',
  `foodbt` decimal(10,2) DEFAULT '0.00' COMMENT '餐补贴',
  `hotbt` decimal(10,2) DEFAULT '0.00' COMMENT '高温津贴',
  `dnbt` decimal(10,2) DEFAULT '0.00' COMMENT '电脑补贴',
  `jiansr` decimal(10,2) DEFAULT '0.00' COMMENT '计件收入',
  `otherbt` decimal(10,2) DEFAULT '0.00' COMMENT '其他补贴',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xuid` (`xuid`) USING BTREE,
  KEY `month` (`month`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='工资表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrshebao`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrshebao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `recename` varchar(500) DEFAULT NULL COMMENT '适用对象',
  `receid` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否开启',
  `gongjishu` decimal(10,2) DEFAULT '0.00' COMMENT '公积金基数',
  `yljishu` decimal(10,2) DEFAULT '0.00' COMMENT '养老保险基数',
  `ylgeren` decimal(10,2) DEFAULT '0.00' COMMENT '养老个人比例(%)',
  `ylunit` decimal(10,2) DEFAULT '0.00' COMMENT '养老单位比例(%)',
  `syjishu` decimal(10,2) DEFAULT '0.00' COMMENT '失业报销基数',
  `sygeren` decimal(10,2) DEFAULT '0.00' COMMENT '失业个人比例(%)',
  `syunit` decimal(10,2) DEFAULT '0.00' COMMENT '失业单位比例(%)',
  `gsjishu` decimal(10,2) DEFAULT '0.00' COMMENT '工伤报销基数',
  `gsgeren` decimal(10,2) DEFAULT '0.00' COMMENT '工伤个人比例(%)',
  `gsunit` decimal(10,2) DEFAULT '0.00' COMMENT '工伤单位比例(%)',
  `syujishu` decimal(10,2) DEFAULT '0.00' COMMENT '生育保险基数',
  `syugeren` decimal(10,2) DEFAULT '0.00' COMMENT '生育个人比例(%)',
  `syuunit` decimal(10,2) DEFAULT '0.00' COMMENT '生育单位比例(%)',
  `yijishu` decimal(10,2) DEFAULT '0.00' COMMENT '医疗报销基数',
  `yigeren` decimal(10,2) DEFAULT '0.00' COMMENT '医疗个人比例(%)',
  `yiunit` decimal(10,2) DEFAULT '0.00' COMMENT '医疗单位比例(%)',
  `dbgeren` decimal(10,2) DEFAULT '0.00' COMMENT '大病个人',
  `gjjgeren` decimal(10,2) DEFAULT '0.00' COMMENT '公积金个人比例(%)',
  `gjjunit` decimal(10,2) DEFAULT '0.00' COMMENT '公积金单位比例(%)',
  `shebaogeren` decimal(10,2) DEFAULT '0.00' COMMENT '个人社保缴费',
  `shebaounit` decimal(10,2) DEFAULT '0.00' COMMENT '单位社保缴费',
  `sctime` varchar(20) DEFAULT NULL COMMENT '每月生成时间',
  `optdt` datetime DEFAULT NULL,
  `gonggeren` decimal(10,2) DEFAULT '0.00' COMMENT '公积金个人',
  `gongunit` decimal(10,2) DEFAULT '0.00' COMMENT '公积金单位',
  `explian` varchar(500) DEFAULT NULL COMMENT '说明',
  `startdt` varchar(20) DEFAULT NULL COMMENT '开始月份',
  `enddt` varchar(20) DEFAULT NULL COMMENT '截止月份',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='社保公积金' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_hrshebao`
--

INSERT INTO `xinhu_hrshebao` (`id`, `title`, `recename`, `receid`, `status`, `gongjishu`, `yljishu`, `ylgeren`, `ylunit`, `syjishu`, `sygeren`, `syunit`, `gsjishu`, `gsgeren`, `gsunit`, `syujishu`, `syugeren`, `syuunit`, `yijishu`, `yigeren`, `yiunit`, `dbgeren`, `gjjgeren`, `gjjunit`, `shebaogeren`, `shebaounit`, `sctime`, `optdt`, `gonggeren`, `gongunit`, `explian`, `startdt`, `enddt`, `comid`) VALUES
(1, '厦门本地社保', '本地职工', 'g2', 1, '1700.00', '1700.00', '8.00', '12.00', '1700.00', '0.00', '0.50', '1700.00', '0.00', '0.20', '3772.80', '0.00', '0.70', '3772.80', '2.00', '3.00', '10.00', '5.00', '10.00', '221.46', '355.49', '2018-09-21', '2018-09-23 19:30:39', '85.00', '170.00', NULL, '2014-12', '2024-12', 0),
(2, '厦门外来社保', '外地职工', 'g1', 1, '1700.00', '1700.00', '8.00', '12.00', '1700.00', '0.00', '0.50', '1700.00', '0.00', '0.20', '3772.80', '0.00', '0.70', '3772.80', '2.00', '3.00', '10.00', '5.00', '10.00', '221.46', '355.49', '2018-09-21', '2018-09-23 19:30:16', '85.00', '170.00', NULL, '2014-12', '2024-12', 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrtransfer`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrtransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `tranuid` smallint(6) DEFAULT '0',
  `tranname` varchar(20) DEFAULT NULL COMMENT '要调动人',
  `trantype` varchar(20) DEFAULT NULL COMMENT '调动类型',
  `olddeptname` varchar(50) DEFAULT NULL COMMENT '原来部门',
  `oldranking` varchar(20) DEFAULT NULL COMMENT '原来职位',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `newdeptname` varchar(50) DEFAULT NULL COMMENT '调动后部门',
  `newdeptid` smallint(6) DEFAULT NULL,
  `newranking` varchar(20) DEFAULT NULL COMMENT '调动后职位',
  `isover` tinyint(1) DEFAULT '0' COMMENT '是否已完成',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='职位调动' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_hrtrsalary`
--

CREATE TABLE IF NOT EXISTS `xinhu_hrtrsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `applyname` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `floats` smallint(6) DEFAULT '0' COMMENT '调薪幅度',
  `ranking` varchar(20) DEFAULT NULL COMMENT '职位',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='调薪申请' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_im_group`
--

CREATE TABLE IF NOT EXISTS `xinhu_im_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `pid` smallint(6) DEFAULT '0' COMMENT '对应上级',
  `types` varchar(10) DEFAULT NULL COMMENT '应用分类',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|群,1|讨论组,2|应用',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `createid` int(11) DEFAULT NULL,
  `createname` varchar(20) DEFAULT NULL COMMENT '创建人',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `face` varchar(50) DEFAULT NULL COMMENT '头像',
  `num` varchar(20) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `explain` varchar(200) DEFAULT NULL,
  `iconfont` varchar(30) DEFAULT NULL COMMENT '对应字体图标',
  `iconcolor` varchar(7) DEFAULT NULL COMMENT '字体图标颜色',
  `yylx` tinyint(1) DEFAULT '0' COMMENT '应用类型0全部,1pc,2手机',
  `urlpc` varchar(200) DEFAULT NULL COMMENT '应用上PC地址',
  `urlm` varchar(200) DEFAULT NULL COMMENT '应用上手机端地址',
  `deptid` varchar(100) DEFAULT NULL COMMENT '对应部门id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `num` (`num`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='IM会话表' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `xinhu_im_group`
--

INSERT INTO `xinhu_im_group` (`id`, `name`, `pid`, `types`, `type`, `sort`, `createid`, `createname`, `createdt`, `face`, `num`, `receid`, `recename`, `url`, `valid`, `explain`, `iconfont`, `iconcolor`, `yylx`, `urlpc`, `urlm`, `deptid`) VALUES
(1, '信呼团队', 0, '官网', 2, 0, NULL, NULL, NULL, 'images/logo.png', 'xinhu', NULL, NULL, 'link', 1, NULL, 'cf-c90', '#1ABC9C', 0, 'http://www.rockoa.com/', NULL, NULL),
(2, '全体人员', 0, NULL, 0, 0, 1, NULL, NULL, 'images/logo.png', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, '1'),
(3, '通知公告', 0, '基础', 2, 28, NULL, NULL, NULL, 'images/gong.png', 'gong', NULL, NULL, 'link', 1, NULL, 'xiaolaba', '#f25e94', 0, 'gong', NULL, NULL),
(4, '会议', 0, '基础', 2, 27, NULL, NULL, NULL, 'images/meet.png', 'meet', NULL, NULL, 'auto', 1, NULL, 'huiyi-copy', '#fc6419', 0, NULL, NULL, NULL),
(7, '工作日报', 0, '基础', 2, 26, NULL, NULL, '2015-06-25 16:03:34', 'images/daily.png', 'daily', NULL, NULL, 'auto', 1, NULL, 'ribaojindu', '#578dc4', 0, NULL, NULL, NULL),
(12, '任务', 0, '任务', 2, 13, 1, '管理员', '2015-09-10 13:38:07', 'images/work.png', 'work', NULL, NULL, 'auto', 1, NULL, 'renwu', '#91cd4a', 0, NULL, NULL, NULL),
(13, '万年历', 0, '基础', 2, 25, NULL, NULL, NULL, 'images/calendar.png', 'calendar', NULL, NULL, 'link', 1, NULL, 'rili', '#e0815c', 0, 'http://www.rockoa.com/rili.html', NULL, NULL),
(14, '高管群', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(15, '流程申请', 0, '流程', 2, 10, NULL, NULL, NULL, 'images/flow.png', 'flow', NULL, NULL, 'buin', 1, NULL, 'shenqingliuchengicon', '#3fbfc2', 0, NULL, NULL, NULL),
(16, '流程待办', 0, '流程', 2, 11, NULL, NULL, NULL, 'images/daiban.png', 'daiban', NULL, NULL, 'link', 1, NULL, 'daiban', '#33b5e5', 0, 'daiban', NULL, NULL),
(17, '客户管理', 0, '客户', 2, 51, NULL, NULL, NULL, 'images/crm.png', 'customer', NULL, NULL, 'auto', 1, NULL, 'kehu', '#2e98f1', 0, NULL, NULL, NULL),
(18, '客户主页', 0, '客户', 2, 50, NULL, NULL, NULL, 'images/crm.png', 'crmindex', NULL, NULL, 'link', 1, NULL, 'kehu', '#2e98f1', 1, 'crmindex', NULL, NULL),
(19, '销售机会', 0, '客户', 2, 52, NULL, NULL, NULL, 'images/sale.png', 'custsale', NULL, NULL, 'auto', 1, NULL, 'xiaoshou', '#5c8fba', 0, NULL, NULL, NULL),
(20, '文档', 0, '资源', 2, 31, NULL, NULL, NULL, 'images/folder.png', 'word', NULL, NULL, 'link', 1, NULL, 'wenjian-copy', '#f5d95a', 0, 'word', 'http://www.rockoa.com', NULL),
(21, '日程', 0, '基础', 2, 23, NULL, NULL, NULL, 'images/bwl2.png', 'schedule', NULL, NULL, 'link', 1, NULL, 'richeng', '#158aad', 0, 'schedule', NULL, NULL),
(24, '外出出差', 0, '考勤', 2, 7, NULL, NULL, NULL, 'images/waichu.png', 'waichu', NULL, NULL, 'auto', 1, NULL, 'waichu', '#cc9999', 0, NULL, NULL, NULL),
(26, '邮件', 0, '基础', 2, 22, NULL, NULL, NULL, 'images/email.png', 'emailm', NULL, NULL, 'link', 1, NULL, 'youjian', '#7CD3B0', 0, 'email', NULL, NULL),
(27, '知识信息', 0, '资源', 2, 33, NULL, NULL, NULL, 'images/zhishi.png', 'knowledge', NULL, NULL, 'auto', 1, NULL, 'knowledge', '#F28794', 0, NULL, NULL, NULL),
(5, '通讯录', 0, '基础', 2, 21, NULL, NULL, NULL, 'images/tongxunlu.png', 'user', NULL, NULL, 'link', 1, NULL, 'tongxunlu', '#B28649', 0, 'reimtxl', NULL, NULL),
(28, '考勤信息', 0, '考勤', 2, 5, NULL, NULL, NULL, 'images/kaoqin.png', 'kqdkjl', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(29, '考勤打卡', 0, '考勤', 2, 3, NULL, NULL, NULL, 'images/adddk.png', 'kqdaka', NULL, NULL, 'link', 1, NULL, NULL, NULL, 0, NULL, '?d=we&m=ying&a=daka', NULL),
(30, '考勤统计', 0, '考勤', 2, 6, NULL, NULL, NULL, 'images/kaoqin.png', 'kqtotal', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(31, '开发部', 0, NULL, 0, 1, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, '2'),
(32, '题库', 0, '资源', 2, 34, NULL, NULL, NULL, 'images/tiku.png', 'knowtiku', NULL, NULL, 'auto', 1, NULL, 'tiku', '#fb2b16', 0, NULL, NULL, NULL),
(33, '培训考试', 0, '资源', 2, 35, NULL, NULL, NULL, 'images/kaoshi.png', 'kaoshi', NULL, NULL, 'auto', 1, NULL, 'kaoshi', '#4f68b0', 0, NULL, NULL, NULL),
(34, '客户合同', 0, '客户', 2, 53, NULL, NULL, NULL, 'images/hetong.png', 'custract', NULL, NULL, 'auto', 1, NULL, 'kehu-kehuhetong', '#4ca2fa', 0, NULL, NULL, NULL),
(35, '收款单', 0, '客户', 2, 54, NULL, NULL, NULL, 'images/skuan.png', 'custfina', NULL, NULL, 'auto', 1, NULL, 'achargeaudit', '#339966', 0, NULL, NULL, NULL),
(36, '付款单', 0, '客户', 2, 55, NULL, NULL, NULL, 'images/fkuan.png', 'custfkd', NULL, NULL, 'auto', 1, NULL, 'apayaudit', '#cf9d31', 0, NULL, NULL, NULL),
(38, '工资条', 0, '基础', 2, 29, NULL, NULL, NULL, 'images/gzt.png', 'hrsalary', NULL, NULL, 'auto', 1, NULL, NULL, '#FF6666', 0, NULL, NULL, NULL),
(39, '申请流程', 0, '流程', 2, 12, NULL, NULL, NULL, 'images/apply.png', 'flowapply', NULL, NULL, 'link', 1, NULL, NULL, NULL, 0, 'flowapply', '?d=we&m=flow&a=apply', NULL),
(40, '订阅报表', 0, '基础', 2, 30, NULL, NULL, NULL, 'images/work.png', 'subscribeinfo', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(41, '公文查阅', 0, '公文', 2, 15, NULL, NULL, NULL, 'images/gw.png', 'officic', NULL, NULL, 'auto', 1, NULL, NULL, '#ff6600', 0, NULL, NULL, NULL),
(42, '发文单', 0, '公文', 2, 16, NULL, NULL, NULL, 'images/fawen.png', 'officia', NULL, NULL, 'auto', 1, NULL, NULL, '#f85252', 0, NULL, NULL, NULL),
(43, '收文单', 0, '公文', 2, 17, NULL, NULL, NULL, 'images/shouwen.png', 'officib', NULL, NULL, 'auto', 1, NULL, NULL, '#ff0000', 0, NULL, NULL, NULL),
(44, '项目', 0, '任务', 2, 14, NULL, NULL, NULL, 'images/project.png', 'project', NULL, NULL, 'auto', 1, NULL, NULL, '#30c7b0', 0, NULL, NULL, NULL),
(45, '排班查看', 0, '考勤', 2, 4, NULL, NULL, NULL, 'images/bwl2.png', 'kqpai', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(46, '回执确认', 0, '基础', 2, 30, NULL, NULL, NULL, 'images/jwcl.png', 'receipt', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(49, '提醒消息', 0, '基础', 2, 20, NULL, NULL, NULL, 'images/todo.png', 'todo', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(50, '文档协作', 0, '资源', 2, 32, NULL, NULL, NULL, 'images/wjj.png', 'wordxie', NULL, NULL, 'link', 1, NULL, NULL, NULL, 0, 'wordxie', NULL, NULL),
(52, '新闻资讯', 0, '基础', 2, 30, NULL, NULL, NULL, 'images/news.png', 'news', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(53, '流程监控', 0, '流程', 2, 11, NULL, NULL, NULL, 'images/jiank.png', 'jiankong', NULL, NULL, 'auto', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_im_groupuser`
--

CREATE TABLE IF NOT EXISTS `xinhu_im_groupuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` smallint(6) NOT NULL DEFAULT '0',
  `uid` smallint(6) NOT NULL DEFAULT '0',
  `istx` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='IM会话人员' AUTO_INCREMENT=137 ;

--
-- 转存表中的数据 `xinhu_im_groupuser`
--

INSERT INTO `xinhu_im_groupuser` (`id`, `gid`, `uid`, `istx`) VALUES
(19, 0, 0, 1),
(120, 14, 4, 1),
(45, 26, 9, 1),
(124, 14, 1, 1),
(44, 26, 8, 1),
(43, 26, 1, 1),
(135, 31, 1, 1),
(70, 14, 5, 1),
(133, 2, 1, 1),
(111, 47, 6, 1),
(117, 51, 3, 1),
(112, 47, 5, 1),
(116, 51, 1, 1),
(125, 14, 2, 1),
(136, 2, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_im_history`
--

CREATE TABLE IF NOT EXISTS `xinhu_im_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `receid` smallint(6) DEFAULT '0',
  `uid` smallint(6) DEFAULT NULL,
  `sendid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `cont` varchar(200) DEFAULT NULL,
  `stotal` smallint(6) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL COMMENT '推送时标题',
  `xgurl` varchar(200) DEFAULT NULL COMMENT '相关地址',
  `messid` int(11) DEFAULT '0' COMMENT '最后一条消息id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`,`receid`,`uid`) USING BTREE,
  KEY `optdt` (`optdt`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='IM会话记录历史表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_im_menu`
--

CREATE TABLE IF NOT EXISTS `xinhu_im_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) NOT NULL DEFAULT '0',
  `pid` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(10) DEFAULT NULL COMMENT '名称',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0' COMMENT '1url,0事件',
  `url` varchar(300) DEFAULT NULL COMMENT '对应地址',
  `num` varchar(20) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL COMMENT '颜色',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(300) DEFAULT NULL COMMENT '可使用人员',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='IM下应用菜单' AUTO_INCREMENT=173 ;

--
-- 转存表中的数据 `xinhu_im_menu`
--

INSERT INTO `xinhu_im_menu` (`id`, `mid`, `pid`, `name`, `sort`, `type`, `url`, `num`, `color`, `receid`, `recename`) VALUES
(1, 13, 0, '上月', 0, 0, 'prevmonth', NULL, NULL, NULL, NULL),
(2, 13, 0, '当月', 0, 0, 'nowmonth', NULL, NULL, NULL, NULL),
(3, 13, 0, '下月', 0, 0, 'nextmonth', NULL, NULL, NULL, NULL),
(4, 3, 0, '全部信息', 0, 0, 'my', NULL, NULL, NULL, NULL),
(5, 3, 0, '未读信息', 0, 0, 'wexx', 'weidu', NULL, NULL, NULL),
(6, 12, 0, '我的任务', 0, 0, NULL, 'myrw', NULL, NULL, NULL),
(7, 12, 0, '下属任务', 0, 0, 'down', NULL, NULL, NULL, NULL),
(8, 12, 0, '＋创建任务', 0, 1, 'add', NULL, NULL, NULL, NULL),
(9, 3, 0, '新增公告', 0, 1, 'add', NULL, NULL, NULL, NULL),
(10, 4, 0, '今日会议', 0, 0, 'today', 'today', NULL, NULL, NULL),
(11, 4, 0, '本周会议', 0, 0, 'week', NULL, NULL, NULL, NULL),
(12, 4, 0, '＋新增会议', 0, 1, 'add', NULL, NULL, NULL, NULL),
(13, 7, 0, '我的日报', 0, 0, 'my', NULL, NULL, NULL, NULL),
(14, 7, 0, '下属日报', 0, 0, 'under', 'under', NULL, NULL, NULL),
(15, 7, 0, '＋写日报', 0, 1, 'add', NULL, NULL, NULL, NULL),
(16, 7, 14, '全部', 0, 0, 'undall', NULL, NULL, NULL, NULL),
(17, 7, 14, '未读', 1, 0, 'undwd', NULL, NULL, NULL, NULL),
(18, 1, 0, '最新信息', 0, 0, 'new', NULL, NULL, NULL, NULL),
(19, 1, 0, '＋建议反馈', 1, 1, 'http://www.rockoa.com/fankui.html', NULL, NULL, NULL, NULL),
(22, 12, 6, '我创建的', 2, 0, 'wcj', NULL, NULL, NULL, NULL),
(20, 12, 6, '未完成', 0, 0, 'wwc', NULL, NULL, NULL, NULL),
(21, 12, 6, '已完成', 1, 0, 'ywc', NULL, NULL, NULL, NULL),
(23, 15, 0, '流程申请', 3, 0, NULL, NULL, NULL, NULL, NULL),
(24, 15, 23, '＋请假条', 0, 1, 'add_leave', NULL, NULL, NULL, NULL),
(25, 15, 23, '＋加班单', 0, 1, 'add_jiaban', NULL, NULL, NULL, NULL),
(26, 15, 0, '我的申请', 0, 0, NULL, NULL, NULL, NULL, NULL),
(27, 15, 0, '处理未通过', 0, 0, 'wtg', 'mywtg', NULL, NULL, NULL),
(28, 15, 26, '我所有申请', 0, 0, 'apply', NULL, NULL, NULL, NULL),
(29, 15, 26, '未通过', 0, 0, 'wtg', NULL, 'red', NULL, NULL),
(30, 15, 26, '已完成', 0, 0, 'ywc', NULL, NULL, NULL, NULL),
(31, 16, 0, '所有待办', 0, 0, 'daib', 'daiban', NULL, NULL, NULL),
(32, 16, 0, '单据查看', 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, 16, 32, '直属下级申请', 1, 0, 'myxia', NULL, NULL, NULL, NULL),
(33, 16, 32, '经我处理', 0, 0, 'jwcl', NULL, NULL, NULL, NULL),
(35, 12, 6, '我所有任务', 3, 0, 'my', NULL, NULL, NULL, NULL),
(36, 19, 0, '我的销售机会', 0, 0, NULL, 'gen', NULL, NULL, NULL),
(37, 17, 40, '我的客户', 0, 0, 'my', NULL, NULL, NULL, NULL),
(41, 17, 0, '新增客户', 2, 1, 'add_customer', NULL, NULL, NULL, NULL),
(39, 17, 40, '我全部客户', 0, 0, 'myall', NULL, NULL, NULL, NULL),
(40, 17, 0, '我的客户', 0, 0, NULL, NULL, NULL, NULL, NULL),
(42, 19, 0, '新增销售', 2, 1, 'add_custsale', NULL, NULL, NULL, NULL),
(43, 19, 36, '需跟进', 0, 0, 'mygx', NULL, NULL, NULL, NULL),
(44, 19, 36, '已成交', 1, 0, 'mycj', NULL, 'green', NULL, NULL),
(45, 19, 36, '已丢失', 2, 0, 'myds', NULL, '', NULL, NULL),
(46, 19, 36, '我所有销售', 3, 0, 'myall', NULL, NULL, NULL, NULL),
(47, 17, 40, '我标★客户', 0, 0, 'mystat', NULL, NULL, NULL, NULL),
(48, 17, 40, '我停用客户', 0, 0, 'my_ting', NULL, NULL, NULL, NULL),
(49, 15, 26, '待处理', 0, 0, 'dcl', NULL, NULL, NULL, NULL),
(50, 20, 0, '新建文件夹', 2, 0, 'create', NULL, NULL, NULL, NULL),
(51, 20, 0, '上传文件', 0, 0, 'up', NULL, NULL, NULL, NULL),
(52, 20, 0, '共享的', 1, 0, NULL, NULL, NULL, NULL, NULL),
(53, 21, 0, '日程', 0, 0, NULL, NULL, NULL, NULL, NULL),
(54, 21, 53, '当月', 0, 0, 'nowmonth', NULL, NULL, NULL, NULL),
(55, 21, 53, '下月', 0, 0, 'nextmonth', NULL, NULL, NULL, NULL),
(56, 21, 0, '日程管理', 0, 0, NULL, NULL, NULL, NULL, NULL),
(57, 21, 0, '＋新增', 0, 1, 'add', NULL, NULL, NULL, NULL),
(58, 24, 87, '我今日外出', 0, 0, 'mytoday', NULL, NULL, NULL, NULL),
(59, 24, 0, '＋新增', 2, 1, 'add', NULL, NULL, NULL, NULL),
(60, 24, 87, '我所有外出', 1, 0, 'my', NULL, NULL, NULL, NULL),
(61, 20, 52, '我共享的', 0, 0, 'shate', NULL, NULL, NULL, NULL),
(62, 20, 52, '共享给我的', 0, 0, 'fxgw', NULL, NULL, NULL, NULL),
(63, 15, 23, '更多&gt;&gt;', 0, 0, 'moreapply', NULL, NULL, NULL, NULL),
(64, 26, 0, '收件箱', 0, 0, NULL, 'sjx', NULL, NULL, NULL),
(65, 26, 0, '＋写信', 2, 1, 'add_emailm', NULL, NULL, NULL, NULL),
(66, 27, 0, '知识信息', 0, 0, 'def', NULL, NULL, NULL, NULL),
(67, 26, 0, '草稿箱', 1, 0, 'cgx', NULL, NULL, NULL, NULL),
(68, 26, 64, '未读邮件', 0, 0, 'wdyj', NULL, NULL, NULL, NULL),
(69, 26, 64, '所有邮件', 0, 0, 'sjx', NULL, NULL, NULL, NULL),
(70, 26, 64, '已发送', 0, 0, 'yfs', NULL, NULL, NULL, NULL),
(71, 5, 0, '内部通讯录', 0, 0, 'txlmy|user', NULL, NULL, NULL, NULL),
(72, 5, 0, '个人通讯录', 0, 0, 'def|vcard', NULL, NULL, NULL, NULL),
(73, 5, 0, '＋新增', 0, 1, 'add_vcard', NULL, NULL, NULL, NULL),
(74, 28, 0, '我的记录', 0, 0, NULL, NULL, NULL, NULL, NULL),
(75, 28, 0, '考勤信息', 2, 0, NULL, NULL, NULL, NULL, NULL),
(80, 28, 74, '我的打卡', 0, 0, 'my', NULL, NULL, NULL, NULL),
(77, 28, 75, '＋请假条', 0, 1, 'add_leave', NULL, NULL, NULL, NULL),
(78, 28, 75, '我的请假条', 3, 0, 'my|leave', NULL, NULL, NULL, NULL),
(79, 17, 0, '下属客户', 0, 0, NULL, NULL, NULL, NULL, NULL),
(81, 28, 82, '下属打卡', 0, 0, 'down', NULL, NULL, NULL, NULL),
(82, 28, 0, '下属记录', 0, 0, NULL, NULL, NULL, NULL, NULL),
(83, 28, 74, '我的定位', 0, 0, 'my|kqdw', NULL, NULL, NULL, NULL),
(84, 28, 82, '下属定位', 0, 0, 'down|kqdw', NULL, NULL, NULL, NULL),
(92, 19, 0, '下属销售机会', 1, 0, NULL, NULL, NULL, NULL, NULL),
(85, 28, 75, '我的加班单', 4, 0, 'my|jiaban', NULL, NULL, NULL, NULL),
(86, 28, 75, '＋加班单', 1, 1, 'add_jiaban', NULL, NULL, NULL, NULL),
(87, 24, 0, '我的外出', 0, 0, NULL, NULL, NULL, NULL, NULL),
(88, 24, 91, '下属所有外出', 3, 0, 'downall', NULL, NULL, NULL, NULL),
(89, 1, 0, '打开官网', 0, 1, 'http://www.rockoa.com/', NULL, NULL, NULL, NULL),
(90, 24, 91, '下属今日外出', 2, 0, 'downtoday', NULL, NULL, NULL, NULL),
(91, 24, 0, '下属外出', 0, 0, NULL, NULL, NULL, NULL, NULL),
(93, 30, 0, '我的统计', 0, 0, NULL, NULL, NULL, NULL, NULL),
(94, 30, 0, '下属统计', 0, 0, NULL, NULL, NULL, NULL, NULL),
(95, 30, 93, '当月统计', 0, 0, 'mynow', NULL, NULL, NULL, NULL),
(96, 30, 93, '上月统计', 0, 0, 'mylast', NULL, NULL, NULL, NULL),
(97, 30, 94, '当月统计', 0, 0, 'downnow', NULL, NULL, NULL, NULL),
(98, 30, 94, '上月统计', 0, 0, 'downlast', NULL, NULL, NULL, NULL),
(99, 21, 56, '我的日程', 0, 0, 'my', NULL, NULL, NULL, NULL),
(100, 21, 56, '提醒给我的', 1, 0, 'rece', NULL, NULL, NULL, NULL),
(101, 17, 40, '我创建', 0, 0, 'mycj', NULL, NULL, NULL, NULL),
(102, 17, 40, '共享给我的', 0, 0, 'gxgw', NULL, NULL, NULL, NULL),
(103, 17, 79, '下属全部客户', 0, 0, 'downall', NULL, NULL, NULL, NULL),
(104, 17, 79, '下属停用', 0, 0, 'downty', NULL, NULL, NULL, NULL),
(105, 17, 79, '下属标★', 0, 0, 'downstat', NULL, NULL, NULL, NULL),
(106, 19, 92, '下属需跟进', 0, 0, 'downgj', NULL, NULL, NULL, NULL),
(107, 19, 92, '下属已成交', 1, 0, 'downcj', NULL, NULL, NULL, NULL),
(108, 19, 92, '下属已丢失', 2, 0, 'downds', NULL, NULL, NULL, NULL),
(109, 19, 92, '所有销售机会', 3, 0, 'downall', NULL, NULL, NULL, NULL),
(110, 32, 0, '所有题库', 0, 0, 'all', NULL, NULL, NULL, NULL),
(111, 32, 0, '未读题库', 1, 0, 'weidu', NULL, NULL, NULL, NULL),
(112, 33, 0, '我未考试', 0, 0, 'weiks', 'weiks', NULL, NULL, NULL),
(113, 33, 0, '所有考试', 1, 0, 'myall', NULL, NULL, NULL, NULL),
(114, 34, 0, '我的合同', 0, 0, NULL, NULL, NULL, NULL, NULL),
(115, 34, 114, '我所有合同', 0, 0, 'my', NULL, NULL, NULL, NULL),
(116, 34, 114, '我的已过期', 1, 0, 'ygq', NULL, NULL, NULL, NULL),
(117, 34, 0, '下属合同', 1, 0, NULL, NULL, NULL, NULL, NULL),
(118, 34, 117, '下属所有合同', 0, 0, 'downall', NULL, NULL, NULL, NULL),
(119, 34, 117, '下属已过期', 1, 0, 'downygq', NULL, NULL, NULL, NULL),
(120, 34, 0, '＋新增', 1, 1, 'add', NULL, NULL, NULL, NULL),
(121, 35, 0, '我的收款单', 0, 0, NULL, NULL, NULL, NULL, NULL),
(122, 35, 121, '我未收款', 0, 0, 'myskdws', NULL, NULL, NULL, NULL),
(123, 35, 121, '我已收款', 1, 0, 'myskdys', NULL, NULL, NULL, NULL),
(124, 35, 121, '我所有的', 2, 0, 'myskd', NULL, NULL, NULL, NULL),
(125, 35, 0, '下属收款单', 0, 0, NULL, NULL, NULL, NULL, NULL),
(126, 35, 125, '下属未收款', 0, 0, 'downskdwsk', NULL, NULL, NULL, NULL),
(127, 35, 125, '下属已收款', 0, 0, 'downskdys', NULL, NULL, NULL, NULL),
(128, 35, 125, '下属所有', 0, 0, 'downskd', NULL, NULL, NULL, NULL),
(129, 35, 0, '＋新增', 0, 1, 'add', NULL, NULL, NULL, NULL),
(130, 36, 0, '我的付款单', 0, 0, NULL, NULL, NULL, NULL, NULL),
(131, 36, 130, '我未付款', 0, 0, 'myfkdwf|custfina', NULL, NULL, NULL, NULL),
(132, 36, 130, '我已付款', 1, 0, 'myfkdyf|custfina', NULL, NULL, NULL, NULL),
(133, 36, 130, '我所有的', 2, 0, 'myfkd|custfina', NULL, NULL, NULL, NULL),
(134, 36, 0, '下属付款单', 0, 0, NULL, NULL, NULL, NULL, NULL),
(135, 36, 134, '下属未付款', 0, 0, 'downfkdwf|custfina', NULL, NULL, NULL, NULL),
(136, 36, 134, '下属已付款', 0, 0, 'downfkdyf|custfina', NULL, NULL, NULL, NULL),
(137, 36, 134, '下属所有', 0, 0, 'downfkd|custfina', NULL, NULL, NULL, NULL),
(138, 36, 0, '＋新增', 0, 1, 'add_custfina', NULL, NULL, NULL, NULL),
(139, 38, 0, '我的工资', 0, 0, 'my', NULL, NULL, NULL, NULL),
(140, 40, 0, '给我的订阅', 0, 0, 'my', NULL, NULL, NULL, NULL),
(141, 41, 0, '未查阅', 0, 0, 'mywcy', 'mywcy', NULL, NULL, NULL),
(142, 41, 0, '所有需查阅', 1, 0, 'my', NULL, NULL, NULL, NULL),
(143, 42, 0, '我的发文', 0, 0, 'my', NULL, NULL, NULL, NULL),
(144, 42, 0, '＋拟办', 2, 1, 'add', NULL, NULL, NULL, NULL),
(145, 42, 0, '发文查看', 1, 0, 'grant', NULL, NULL, NULL, NULL),
(146, 43, 0, '我的收文', 0, 0, 'my', NULL, NULL, NULL, NULL),
(147, 43, 0, '收文查看', 1, 0, 'grant', NULL, NULL, NULL, NULL),
(148, 43, 0, '＋收文登记', 3, 1, 'add', NULL, NULL, NULL, NULL),
(149, 44, 0, '我未完成', 0, 0, 'wwc', 'wwc', NULL, NULL, NULL),
(150, 44, 0, '项目查看', 0, 0, NULL, NULL, NULL, NULL, NULL),
(151, 44, 150, '我负责的', 1, 0, 'myfz', NULL, NULL, NULL, NULL),
(152, 44, 150, '我创建的', 2, 0, 'mycj', NULL, NULL, NULL, NULL),
(153, 44, 0, '创建项目', 0, 1, 'add', NULL, NULL, NULL, NULL),
(154, 44, 150, '我执行项目', 0, 0, 'my', NULL, NULL, NULL, NULL),
(155, 7, 14, '抄送给我', 2, 0, 'chaos', NULL, NULL, NULL, NULL),
(156, 15, 26, '抄送给我', 0, 0, 'chaos', NULL, NULL, NULL, NULL),
(157, 45, 0, '上月', 0, 0, 'prevmonth', NULL, NULL, NULL, NULL),
(158, 45, 0, '当月', 0, 0, 'nowmonth', NULL, NULL, NULL, NULL),
(159, 45, 0, '下月', 0, 0, 'nextmonth', NULL, NULL, NULL, NULL),
(160, 46, 0, '我未回执确认', 0, 0, 'my', 'mywei', NULL, NULL, NULL),
(161, 46, 0, '我全部回执确认', 0, 0, 'myall', NULL, NULL, NULL, NULL),
(162, 49, 0, '未读消息', 1, 0, 'wdtodo', 'wdtodo', NULL, NULL, NULL),
(163, 49, 0, '所有消息', 0, 0, NULL, NULL, NULL, NULL, NULL),
(164, 49, 0, '全部标已读', 2, 0, 'allydu', NULL, NULL, NULL, NULL),
(165, 50, 0, '需我协作', 0, 0, 'myxie', NULL, NULL, NULL, NULL),
(166, 50, 0, '我可查看', 0, 0, 'myview', NULL, NULL, NULL, NULL),
(167, 50, 0, '新增', 0, 1, 'add', NULL, NULL, NULL, NULL),
(168, 52, 0, '发给我的', 0, 0, 'my', NULL, NULL, NULL, NULL),
(169, 52, 0, '我发布的', 0, 0, 'wfb', NULL, NULL, NULL, NULL),
(170, 52, 0, '新增', 0, 1, 'add', NULL, NULL, NULL, NULL),
(171, 53, 0, '流程监控记录', 0, 0, 'jiankong', NULL, NULL, NULL, NULL),
(172, 53, 0, '我关注单据', 0, 0, 'follow', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_im_mess`
--

CREATE TABLE IF NOT EXISTS `xinhu_im_mess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optdt` datetime DEFAULT NULL,
  `zt` tinyint(1) DEFAULT '0' COMMENT '状态',
  `cont` varchar(4000) DEFAULT NULL COMMENT '内容',
  `sendid` smallint(6) DEFAULT NULL,
  `receid` smallint(6) DEFAULT '0' COMMENT '接收',
  `receuid` varchar(4000) DEFAULT NULL COMMENT '接收用户id',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `url` varchar(1000) DEFAULT NULL COMMENT '相关地址',
  `fileid` int(11) NOT NULL DEFAULT '0' COMMENT '对应文件Id',
  `msgid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `optdt` (`optdt`,`receid`) USING BTREE,
  KEY `msgid` (`msgid`) USING BTREE,
  KEY `type` (`type`,`receid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='IM聊天记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_im_messzt`
--

CREATE TABLE IF NOT EXISTS `xinhu_im_messzt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '信息id',
  `uid` int(11) DEFAULT NULL COMMENT '人员id',
  `gid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='IM聊天消息状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_infor`
--

CREATE TABLE IF NOT EXISTS `xinhu_infor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `typename` varchar(20) DEFAULT NULL,
  `content` text,
  `url` varchar(200) DEFAULT NULL,
  `receid` varchar(2000) DEFAULT NULL COMMENT '接收人Id',
  `recename` varchar(4000) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `zuozhe` varchar(30) DEFAULT NULL COMMENT '发布者',
  `indate` date DEFAULT NULL COMMENT '日期',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `fengmian` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `mintou` smallint(6) DEFAULT '0' COMMENT '至少投票',
  `maxtou` smallint(6) DEFAULT '0' COMMENT '最多投投票0不限制',
  `issms` tinyint(1) DEFAULT '0' COMMENT '是否发短信',
  `istop` tinyint(1) DEFAULT '0' COMMENT '排序号越大越靠前',
  `zstart` date DEFAULT NULL COMMENT '展示开始日期',
  `zsend` date DEFAULT NULL COMMENT '展示截止日期',
  `comid` smallint(6) DEFAULT '0' COMMENT '所在单位Id',
  `appxs` tinyint(1) DEFAULT '0' COMMENT 'app首页显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通知公告' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_infors`
--

CREATE TABLE IF NOT EXISTS `xinhu_infors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表infor.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `touitems` varchar(200) DEFAULT NULL COMMENT '投票选项',
  `touci` int(11) DEFAULT '0' COMMENT '得到票数',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='信息子表投票项' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_knowledge`
--

CREATE TABLE IF NOT EXISTS `xinhu_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `typeid` smallint(6) DEFAULT '0' COMMENT '对应分类',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `content` text,
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='知识信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_knowtiku`
--

CREATE TABLE IF NOT EXISTS `xinhu_knowtiku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `typeid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0单选,1多选,2判断题',
  `ana` varchar(300) DEFAULT NULL COMMENT '答案A',
  `anb` varchar(300) DEFAULT NULL COMMENT '答案B',
  `anc` varchar(300) DEFAULT NULL COMMENT '答案C',
  `and` varchar(300) DEFAULT NULL COMMENT '答案D',
  `ane` varchar(300) DEFAULT NULL COMMENT '答案E',
  `answer` varchar(10) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `content` varchar(1000) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '相关图片地址',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='知识题库' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_knowtraim`
--

CREATE TABLE IF NOT EXISTS `xinhu_knowtraim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `dxshu` smallint(6) DEFAULT '0' COMMENT '多选题目数量',
  `dsshu` smallint(6) DEFAULT '0' COMMENT '单选题目数量',
  `pdshu` smallint(6) DEFAULT '0' COMMENT '判断题数',
  `reshu` smallint(6) DEFAULT '0' COMMENT '培训人数',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `kstime` smallint(6) DEFAULT '0' COMMENT '考试时间(分钟)',
  `ydshu` smallint(6) DEFAULT '0' COMMENT '已答题人数',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL COMMENT '发给谁培训',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `state` tinyint(1) DEFAULT '0' COMMENT '0还没开始,1考试中,2已结束',
  `zfenshu` int(11) DEFAULT '0' COMMENT '总分',
  `hgfen` int(11) DEFAULT '0' COMMENT '合格分数',
  `tikuid` varchar(200) DEFAULT NULL,
  `tikuname` varchar(200) DEFAULT NULL COMMENT '对应题库',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='培训表出题考试' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_knowtrais`
--

CREATE TABLE IF NOT EXISTS `xinhu_knowtrais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `kssdt` datetime DEFAULT NULL COMMENT '考试时间',
  `ksedt` datetime DEFAULT NULL COMMENT '考试结束时间',
  `fenshu` smallint(6) DEFAULT '0' COMMENT '得分',
  `kstime` int(11) DEFAULT '0' COMMENT '考试时间(秒数)',
  `isks` tinyint(1) DEFAULT '0' COMMENT '是否已考试',
  `tkids` varchar(2000) DEFAULT NULL COMMENT '考试题目id',
  `dyids` varchar(1000) DEFAULT NULL COMMENT '我做题得到答案',
  `dyjgs` varchar(1000) DEFAULT NULL COMMENT '答题结果0未答,1正确,2错误',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mid` (`mid`,`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考试培训子表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqanay`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqanay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `uid` smallint(6) DEFAULT NULL COMMENT '人员id',
  `ztname` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `time` datetime DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `states` varchar(20) DEFAULT NULL COMMENT '其他状态,如请假',
  `sort` smallint(6) DEFAULT '0',
  `iswork` tinyint(4) DEFAULT '1' COMMENT '是否工作日',
  `emiao` int(11) DEFAULT '0' COMMENT '秒数',
  `optdt` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `timesb` decimal(6,1) DEFAULT '0.0' COMMENT '应上班时间(小时)',
  `timeys` decimal(6,1) DEFAULT '0.0' COMMENT '已上班时间(小时)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uiddt` (`uid`,`dt`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤分析' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqdist`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqdist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recename` varchar(1000) DEFAULT NULL COMMENT '适用对象',
  `receid` varchar(1000) DEFAULT NULL,
  `mid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0考勤时间,1休息,2定位的',
  `startdt` date DEFAULT NULL,
  `enddt` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤分配表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `xinhu_kqdist`
--

INSERT INTO `xinhu_kqdist` (`id`, `recename`, `receid`, `mid`, `type`, `startdt`, `enddt`, `status`, `sort`) VALUES
(1, '信呼开发团队', 'd1', 1, 0, '2010-01-01', '2021-09-30', 1, 1),
(4, '信呼开发团队', 'd1', 1, 1, '2014-08-01', '2021-08-31', 1, 0),
(5, '信呼开发团队', 'd1', 1, 2, '2016-11-01', '2017-12-31', 1, 0),
(6, '信呼客服', 'u8', 33, 0, '2017-05-01', '2017-05-16', 1, 0),
(7, '管理员组', 'g4', 21, 0, '2019-04-01', '2019-04-01', 1, 0),
(8, '开发部', 'd2', 2, 2, '2017-05-01', '2019-05-01', 0, 0),
(9, '管理员', 'u1', 44, 0, '2019-06-01', '2019-06-30', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqdisv`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqdisv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plx` tinyint(1) DEFAULT '1' COMMENT '1组排班,2人员',
  `receid` int(11) DEFAULT '0' COMMENT '组id,人员Id',
  `dt` date DEFAULT NULL COMMENT '日期',
  `type` tinyint(1) DEFAULT '0' COMMENT '0考勤时间,1休息,2工作日',
  `mid` int(11) DEFAULT '0' COMMENT '对应主ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `receid` (`plx`,`receid`,`dt`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='考勤排班' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqdkjl`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqdkjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `dkdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0在线打卡,1考勤机,2手机定位,3手动添加,4异常添加,5数据导入,6接口导入',
  `address` varchar(50) DEFAULT NULL COMMENT '定位地址',
  `lat` varchar(20) DEFAULT NULL COMMENT '纬度',
  `lng` varchar(20) DEFAULT NULL COMMENT '经度',
  `accuracy` smallint(6) DEFAULT '0' COMMENT '精确范围',
  `ip` varchar(100) DEFAULT NULL,
  `mac` varchar(100) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL,
  `imgpath` varchar(100) DEFAULT NULL COMMENT '相关图片',
  `snid` int(11) DEFAULT '0' COMMENT '考勤机设备id',
  `sntype` tinyint(4) DEFAULT '0' COMMENT '考勤机打卡方式0密码,1指纹,2刷卡',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`,`dkdt`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='打卡记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqdw`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqdw` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `location_x` varchar(20) DEFAULT NULL,
  `location_y` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL COMMENT '位置名称',
  `precision` int(11) DEFAULT '0' COMMENT '允许误差米',
  `scale` smallint(6) DEFAULT '0',
  `wifiname` varchar(100) DEFAULT NULL COMMENT '打卡wifi名',
  `iswgd` tinyint(1) DEFAULT '0' COMMENT '是否为无固定地点',
  `dwids` varchar(50) DEFAULT NULL COMMENT '关联对应ID,实现多点定位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤定位规则' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xinhu_kqdw`
--

INSERT INTO `xinhu_kqdw` (`id`, `name`, `location_x`, `location_y`, `address`, `precision`, `scale`, `wifiname`, `iswgd`, `dwids`) VALUES
(1, '欣幼儿园', '24.51082360520205', '118.17835986614227', '厦门软件园', 100, 18, NULL, 0, '2'),
(2, '软件园', '24.485332478987026', '118.18730771541595', '望海路', 300, 15, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqerr`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqerr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `uname` varchar(30) DEFAULT NULL COMMENT '申请人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `errtype` varchar(10) DEFAULT NULL COMMENT '异常类型',
  `dt` date DEFAULT NULL COMMENT '异常日期',
  `ytime` varchar(10) DEFAULT NULL COMMENT '应打卡时间',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='打卡异常申请' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqinfo`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `uname` varchar(20) DEFAULT NULL,
  `stime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `kind` varchar(10) DEFAULT NULL COMMENT '类型',
  `qjkind` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `explain` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `totals` decimal(6,1) DEFAULT '0.0' COMMENT '时间',
  `optdt` datetime DEFAULT NULL,
  `isturn` tinyint(1) DEFAULT '0' COMMENT '是否提交',
  `optname` varchar(20) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `jiafee` decimal(6,2) DEFAULT '0.00' COMMENT '加班费',
  `jiatype` tinyint(1) DEFAULT '0' COMMENT '加班方式0换调休,1给加班费',
  `totday` decimal(8,2) DEFAULT '0.00' COMMENT '请假天数',
  `enddt` datetime DEFAULT NULL COMMENT '截止使用时间',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `kind` (`kind`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='请假条加班单' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqjcmd`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqjcmd` (
  `id` int(11) NOT NULL,
  `snid` int(11) DEFAULT '0' COMMENT '设备ID',
  `cmd` text COMMENT '发送命令内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '运行状态0待运行,1已运行,2请求中',
  `qjtime` datetime DEFAULT NULL COMMENT '请求时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `cjtime` datetime DEFAULT NULL COMMENT '处理时间',
  `atype` varchar(30) DEFAULT NULL COMMENT '类型',
  `others` varchar(500) DEFAULT NULL COMMENT '推送主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `snid` (`snid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤机命令发送表';

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqjsn`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqjsn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) NOT NULL DEFAULT '' COMMENT '设备号',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名',
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `deptids` varchar(4000) DEFAULT NULL COMMENT '部门ID聚合',
  `userids` text COMMENT '人员ID聚合',
  `lastdt` datetime DEFAULT NULL COMMENT '最后请求时间',
  `space` int(11) DEFAULT '0' COMMENT 'sd卡剩余空间',
  `memory` int(11) DEFAULT '0' COMMENT '剩余内存',
  `usershu` int(11) DEFAULT '0' COMMENT '人员数',
  `fingerprintshu` int(11) DEFAULT '0' COMMENT '指纹数',
  `headpicshu` int(11) DEFAULT '0' COMMENT '头像数量',
  `clockinshu` int(11) DEFAULT '0' COMMENT '打卡数',
  `picshu` int(11) DEFAULT '0' COMMENT '现场照片数',
  `romver` varchar(30) DEFAULT NULL COMMENT '系统版本',
  `appver` varchar(30) DEFAULT NULL COMMENT '应用版本',
  `model` varchar(30) DEFAULT NULL COMMENT '设备型号',
  `pinpai` tinyint(4) DEFAULT '0' COMMENT '品牌0群英,1中控',
  `snip` varchar(30) DEFAULT NULL COMMENT '分配的ip',
  `snport` varchar(10) DEFAULT NULL COMMENT '分配端口号',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`,`num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤机设备表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqjuser`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqjuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snid` int(11) DEFAULT '0' COMMENT '设备ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `fingerprint1` text COMMENT '指纹1',
  `fingerprint2` text COMMENT '指纹2',
  `headpic` varchar(100) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `snid_uid` (`snid`,`uid`) USING BTREE,
  KEY `snid` (`snid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤机上人员' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqout`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `applyname` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `outtime` datetime DEFAULT NULL COMMENT '外出时间',
  `intime` datetime DEFAULT NULL COMMENT '回岗时间',
  `address` varchar(50) DEFAULT NULL COMMENT '外出地址',
  `reason` varchar(500) DEFAULT NULL COMMENT '外出事由',
  `atype` varchar(20) DEFAULT NULL COMMENT '外出类型@外出,出差',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `isxj` tinyint(1) DEFAULT '0' COMMENT '是否销假@0|否,1|是',
  `sicksm` varchar(500) DEFAULT NULL COMMENT '销假说明',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='外出出差' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqsjgz`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqsjgz` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `pid` smallint(6) DEFAULT '0' COMMENT '主',
  `stime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `etime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `qtype` tinyint(1) DEFAULT '0' COMMENT '取值类型@0|最小值,1|最大值',
  `iskt` tinyint(1) DEFAULT '0' COMMENT '是否跨天',
  `iskq` tinyint(1) DEFAULT '1' COMMENT '是否需要考勤',
  `isxx` tinyint(1) DEFAULT '0' COMMENT '是否休息断',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤时间规则' AUTO_INCREMENT=64 ;

--
-- 转存表中的数据 `xinhu_kqsjgz`
--

INSERT INTO `xinhu_kqsjgz` (`id`, `name`, `sort`, `pid`, `stime`, `etime`, `qtype`, `iskt`, `iskq`, `isxx`) VALUES
(1, '全体人员考勤', 1, 0, NULL, NULL, 0, 0, 1, 0),
(2, '下班', 3, 1, '13:00:00', '18:00:00', 1, 0, 1, 0),
(5, '正常', 0, 12, '06:00:00', '09:00:00', 0, 0, 1, 0),
(6, '迟到', 1, 12, '09:00:01', '12:00:00', 0, 0, 1, 0),
(7, '正常', 0, 2, '18:00:00', '23:59:59', 1, 0, 1, 0),
(8, '早退', 1, 2, '13:00:00', '17:59:59', 1, 0, 1, 0),
(12, '上班', 0, 1, '09:00:00', '12:00:00', 0, 0, 1, 0),
(21, '中班(8点-16点)', 3, 0, NULL, NULL, 0, 0, 1, 0),
(22, '上班', 0, 21, '08:00:00', '12:00:00', 0, 0, 1, 0),
(23, '下班', 1, 21, '12:00:00', '16:00:00', 1, 0, 1, 0),
(24, '正常', 0, 22, '06:00:00', '08:00:00', 0, 0, 1, 0),
(25, '迟到', 1, 22, '08:00:01', '12:00:00', 0, 0, 1, 0),
(26, '早退', 1, 23, '12:00:01', '15:59:59', 1, 0, 1, 0),
(27, '正常', 0, 23, '16:00:00', '18:00:00', 1, 0, 1, 0),
(30, '晚班(16点-24点)', 4, 0, NULL, NULL, 0, 0, 1, 0),
(31, '上班', 0, 30, '16:00:00', '20:00:00', 0, 0, 1, 0),
(32, '下班', 1, 30, '20:00:00', '23:59:59', 1, 0, 1, 0),
(33, '早班(0点-8点)', 2, 0, NULL, NULL, 0, 0, 1, 0),
(34, '上班', 0, 33, '00:00:00', '04:00:00', 0, 0, 1, 0),
(35, '下班', 0, 33, '04:00:00', '08:00:00', 1, 0, 1, 0),
(36, '正常', 0, 34, '22:00:00', '00:00:00', 0, 2, 1, 0),
(37, '迟到', 0, 34, '00:00:01', '02:00:00', 0, 0, 1, 0),
(38, '正常', 0, 35, '08:00:00', '10:00:00', 1, 0, 1, 0),
(39, '早退', 0, 35, '04:00:00', '07:59:59', 1, 0, 1, 0),
(40, '正常', 0, 31, '14:00:00', '16:00:00', 0, 0, 1, 0),
(41, '迟到', 0, 31, '16:00:01', '20:00:00', 0, 0, 1, 0),
(42, '正常', 0, 32, '00:00:00', '02:00:00', 1, 1, 1, 0),
(43, '早退', 0, 32, '20:00:00', '23:59:59', 1, 0, 1, 0),
(44, '全体人员4状态考勤', 5, 0, NULL, NULL, 0, 0, 0, 0),
(45, '上午上班', 0, 44, '08:00:00', '12:00:00', 0, 0, 1, 0),
(46, '上午下班', 1, 44, '12:00:00', '14:30:00', 0, 0, 1, 1),
(47, '下午上班', 2, 44, '14:30:00', '18:00:00', 0, 0, 1, 0),
(48, '下午下班', 3, 44, '18:00:00', '23:59:59', 0, 0, 1, 1),
(49, '正常', 0, 45, '06:00:00', '08:00:00', 0, 0, 0, 0),
(50, '迟到', 1, 45, '08:00:01', '12:00:00', 0, 0, 0, 0),
(51, '正常', 0, 46, '12:00:00', '14:30:00', 0, 0, 0, 0),
(52, '早退', 0, 46, '08:00:01', '11:59:59', 1, 0, 0, 0),
(53, '正常', 0, 47, '12:00:01', '14:30:00', 0, 0, 0, 0),
(54, '迟到', 0, 47, '14:30:00', '18:00:00', 0, 0, 0, 0),
(55, '正常', 0, 48, '18:00:00', '23:59:59', 1, 0, 0, 0),
(56, '早退', 0, 48, '14:30:01', '17:59:59', 1, 0, 0, 0),
(57, '半天班', 6, 0, NULL, NULL, 0, 0, 0, 0),
(58, '上班', 0, 57, '09:00:00', '12:00:00', 0, 0, 1, 0),
(59, '下班', 1, 57, '12:00:00', '23:59:59', 0, 0, 1, 1),
(60, '正常', 0, 58, '06:00:00', '09:00:00', 0, 0, 1, 0),
(61, '迟到', 0, 58, '09:00:01', '12:00:00', 0, 0, 0, 0),
(62, '正常', 0, 59, '12:00:00', '23:59:59', 1, 0, 0, 0),
(63, '早退', 0, 59, '09:00:01', '12:00:00', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_kqxxsj`
--

CREATE TABLE IF NOT EXISTS `xinhu_kqxxsj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `pid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0休息日,1工作日',
  `uid` int(11) DEFAULT '0' COMMENT '对应用户/部门Id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`,`dt`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='休息时间规则' AUTO_INCREMENT=128 ;

--
-- 转存表中的数据 `xinhu_kqxxsj`
--

INSERT INTO `xinhu_kqxxsj` (`id`, `name`, `dt`, `pid`, `type`, `uid`) VALUES
(1, '全体人员休息日', NULL, 0, 0, 0),
(15, NULL, '2019-07-21', 1, 0, 0),
(14, NULL, '2019-07-20', 1, 0, 0),
(13, NULL, '2019-07-14', 1, 0, 0),
(12, NULL, '2019-07-13', 1, 0, 0),
(10, NULL, '2019-07-06', 1, 0, 0),
(11, NULL, '2019-07-07', 1, 0, 0),
(16, NULL, '2019-07-27', 1, 0, 0),
(17, NULL, '2019-07-28', 1, 0, 0),
(18, NULL, '2019-01-05', 1, 0, 0),
(19, NULL, '2019-01-06', 1, 0, 0),
(20, NULL, '2019-01-12', 1, 0, 0),
(21, NULL, '2019-01-13', 1, 0, 0),
(22, NULL, '2019-01-19', 1, 0, 0),
(23, NULL, '2019-01-20', 1, 0, 0),
(24, NULL, '2019-01-26', 1, 0, 0),
(25, NULL, '2019-01-27', 1, 0, 0),
(123, NULL, '2019-02-05', 1, 0, 0),
(122, NULL, '2019-02-04', 1, 0, 0),
(28, NULL, '2019-02-09', 1, 0, 0),
(29, NULL, '2019-02-10', 1, 0, 0),
(30, NULL, '2019-02-16', 1, 0, 0),
(31, NULL, '2019-02-17', 1, 0, 0),
(32, NULL, '2019-02-23', 1, 0, 0),
(33, NULL, '2019-02-24', 1, 0, 0),
(34, NULL, '2019-03-02', 1, 0, 0),
(35, NULL, '2019-03-03', 1, 0, 0),
(36, NULL, '2019-03-09', 1, 0, 0),
(37, NULL, '2019-03-10', 1, 0, 0),
(38, NULL, '2019-03-16', 1, 0, 0),
(39, NULL, '2019-03-17', 1, 0, 0),
(40, NULL, '2019-03-23', 1, 0, 0),
(41, NULL, '2019-03-24', 1, 0, 0),
(42, NULL, '2019-03-30', 1, 0, 0),
(43, NULL, '2019-03-31', 1, 0, 0),
(44, NULL, '2019-04-06', 1, 0, 0),
(45, NULL, '2019-04-07', 1, 0, 0),
(46, NULL, '2019-04-13', 1, 0, 0),
(47, NULL, '2019-04-14', 1, 0, 0),
(48, NULL, '2019-04-20', 1, 0, 0),
(49, NULL, '2019-04-21', 1, 0, 0),
(50, NULL, '2019-04-27', 1, 0, 0),
(51, NULL, '2019-05-01', 1, 0, 0),
(52, NULL, '2019-05-02', 1, 0, 0),
(53, NULL, '2019-05-03', 1, 0, 0),
(54, NULL, '2019-05-04', 1, 0, 0),
(55, NULL, '2019-05-11', 1, 0, 0),
(56, NULL, '2019-05-12', 1, 0, 0),
(57, NULL, '2019-05-18', 1, 0, 0),
(58, NULL, '2019-05-19', 1, 0, 0),
(59, NULL, '2019-05-25', 1, 0, 0),
(60, NULL, '2019-05-26', 1, 0, 0),
(61, NULL, '2019-06-01', 1, 0, 0),
(62, NULL, '2019-06-02', 1, 0, 0),
(63, NULL, '2019-06-07', 1, 0, 0),
(64, NULL, '2019-06-08', 1, 0, 0),
(65, NULL, '2019-06-09', 1, 0, 0),
(66, NULL, '2019-06-15', 1, 0, 0),
(67, NULL, '2019-06-16', 1, 0, 0),
(68, NULL, '2019-06-22', 1, 0, 0),
(69, NULL, '2019-06-23', 1, 0, 0),
(70, NULL, '2019-06-29', 1, 0, 0),
(71, NULL, '2019-06-30', 1, 0, 0),
(72, NULL, '2019-08-03', 1, 0, 0),
(73, NULL, '2019-08-04', 1, 0, 0),
(74, NULL, '2019-08-10', 1, 0, 0),
(75, NULL, '2019-08-11', 1, 0, 0),
(76, NULL, '2019-08-17', 1, 0, 0),
(77, NULL, '2019-08-18', 1, 0, 0),
(78, NULL, '2019-08-24', 1, 0, 0),
(79, NULL, '2019-08-25', 1, 0, 0),
(80, NULL, '2019-08-31', 1, 0, 0),
(81, NULL, '2019-09-01', 1, 0, 0),
(82, NULL, '2019-09-07', 1, 0, 0),
(83, NULL, '2019-09-08', 1, 0, 0),
(84, NULL, '2019-09-13', 1, 0, 0),
(85, NULL, '2019-09-14', 1, 0, 0),
(86, NULL, '2019-09-15', 1, 0, 0),
(87, NULL, '2019-09-21', 1, 0, 0),
(88, NULL, '2019-09-22', 1, 0, 0),
(89, NULL, '2019-09-28', 1, 0, 0),
(90, NULL, '2019-10-01', 1, 0, 0),
(91, NULL, '2019-10-02', 1, 0, 0),
(92, NULL, '2019-10-03', 1, 0, 0),
(93, NULL, '2019-10-04', 1, 0, 0),
(94, NULL, '2019-10-05', 1, 0, 0),
(95, NULL, '2019-10-06', 1, 0, 0),
(96, NULL, '2019-10-07', 1, 0, 0),
(97, NULL, '2019-10-12', 1, 0, 0),
(98, NULL, '2019-10-13', 1, 0, 0),
(99, NULL, '2019-10-19', 1, 0, 0),
(100, NULL, '2019-10-20', 1, 0, 0),
(101, NULL, '2019-10-26', 1, 0, 0),
(102, NULL, '2019-10-27', 1, 0, 0),
(103, NULL, '2019-11-02', 1, 0, 0),
(104, NULL, '2019-11-03', 1, 0, 0),
(105, NULL, '2019-11-09', 1, 0, 0),
(106, NULL, '2019-11-10', 1, 0, 0),
(107, NULL, '2019-11-16', 1, 0, 0),
(108, NULL, '2019-11-17', 1, 0, 0),
(109, NULL, '2019-11-23', 1, 0, 0),
(110, NULL, '2019-11-24', 1, 0, 0),
(111, NULL, '2019-11-30', 1, 0, 0),
(112, NULL, '2019-12-01', 1, 0, 0),
(113, NULL, '2019-12-07', 1, 0, 0),
(114, NULL, '2019-12-08', 1, 0, 0),
(115, NULL, '2019-12-14', 1, 0, 0),
(116, NULL, '2019-12-15', 1, 0, 0),
(117, NULL, '2019-12-21', 1, 0, 0),
(118, NULL, '2019-12-22', 1, 0, 0),
(119, NULL, '2019-12-28', 1, 0, 0),
(120, NULL, '2019-12-29', 1, 0, 0),
(121, NULL, '2019-01-01', 1, 0, 0),
(124, NULL, '2019-02-06', 1, 0, 0),
(125, NULL, '2019-02-07', 1, 0, 0),
(126, NULL, '2019-02-08', 1, 0, 0),
(127, NULL, '2019-04-05', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_location`
--

CREATE TABLE IF NOT EXISTS `xinhu_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `agentid` varchar(20) DEFAULT NULL COMMENT '应用Id',
  `optdt` datetime DEFAULT NULL,
  `location_x` varchar(30) DEFAULT NULL COMMENT '地理位置纬度',
  `location_y` varchar(30) DEFAULT NULL COMMENT '地理位置经度 ',
  `scale` smallint(6) DEFAULT '0' COMMENT '地图缩放大小',
  `label` varchar(50) DEFAULT NULL COMMENT '地理位置',
  `msgid` varchar(50) DEFAULT NULL,
  `precision` smallint(6) DEFAULT '0' COMMENT '地理位置精度',
  `type` tinyint(4) DEFAULT '0' COMMENT '0普通,1事件,2企业微信定位',
  `explain` varchar(50) DEFAULT NULL COMMENT '说明',
  `imgpath` varchar(100) DEFAULT NULL COMMENT '相关图片',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='外勤定位' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_log`
--

CREATE TABLE IF NOT EXISTS `xinhu_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `optid` int(11) DEFAULT NULL COMMENT '操作人id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `optdt` datetime DEFAULT NULL COMMENT '添加时间',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `web` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `device` varchar(50) DEFAULT NULL,
  `level` tinyint(1) DEFAULT '0' COMMENT '日志级别0普通,1提示,2错误',
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志' AUTO_INCREMENT=616 ;

--
-- 转存表中的数据 `xinhu_log`
--

INSERT INTO `xinhu_log` (`id`, `type`, `optid`, `optname`, `remark`, `optdt`, `ip`, `web`, `device`, `level`, `url`) VALUES
(1, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-11 15:20:31', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=552385'),
(2, '打开菜单', 1, '管理员', '菜单[num25.初始化备份]', '2019-12-11 15:20:38', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2JlaWZlbi9yb2NrX2JlaWZlbg::&num=num25&menuname=5Yid5aeL5YyW5aSH5Lu9'),
(3, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-11 15:20:49', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(4, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-11 15:21:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(5, '打开菜单', 1, '管理员', '菜单[group.组管理]', '2019-12-11 15:21:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(6, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-11 15:22:00', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(7, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-11 15:23:13', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(8, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-11 15:23:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(9, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-11 15:23:16', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(10, '打开菜单', 1, '管理员', '菜单[num9.人员→菜单]', '2019-12-11 15:23:33', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num9&menuname=5Lq65ZGY4oaS6I!c5Y2V'),
(11, 'pc登录', 2, '一本账科技', '[admin1]用户名登录成功', '2019-12-11 15:24:53', '127.0.0.1', 'MSIE11', '1576032262203', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=345510'),
(12, '打开菜单', 2, '一本账科技', '菜单[num6.组织结构]', '2019-12-11 15:24:58', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(13, '打开菜单', 2, '一本账科技', '菜单[num6.组织结构]', '2019-12-11 15:25:48', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(14, '打开菜单', 2, '一本账科技', '菜单[group.组管理]', '2019-12-11 15:25:50', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(15, '打开菜单', 2, '一本账科技', '菜单[group.组管理]', '2019-12-11 15:26:32', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(16, '打开菜单', 2, '一本账科技', '菜单[user.用户管理]', '2019-12-11 15:26:50', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(17, '打开菜单', 1, '管理员', '菜单[num24.数据选项]', '2019-12-11 15:27:07', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL29wdGlvbi9yb2NrX29wdGlvbg::&num=num24&menuname=5pWw5o2u6YCJ6aG5'),
(18, '打开菜单', 1, '管理员', '菜单[num21.流程模块权限]', '2019-12-11 15:27:17', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlldw::&num=num21&menuname=5rWB56iL5qih5Z2X5p2D6ZmQ'),
(19, '打开菜单', 1, '管理员', '菜单[flowview0.新增流程模块权限]', '2019-12-11 15:27:30', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlld19lZGl0&num=flowview0&menuname=5paw5aKe5rWB56iL5qih5Z2X5p2D6ZmQ'),
(20, '打开菜单', 2, '一本账科技', '菜单[num6.组织结构]', '2019-12-11 15:28:00', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(21, '打开菜单', 2, '一本账科技', '菜单[user.用户管理]', '2019-12-11 15:28:01', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(22, '打开菜单', 1, '管理员', '菜单[flowview0.新增流程模块权限]', '2019-12-11 15:28:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlld19lZGl0&num=flowview0&menuname=5paw5aKe5rWB56iL5qih5Z2X5p2D6ZmQ'),
(23, '打开菜单', 2, '一本账科技', '菜单[num6.组织结构]', '2019-12-11 15:29:07', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(24, '打开菜单', 2, '一本账科技', '菜单[num6.组织结构]', '2019-12-11 15:33:02', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(25, '打开菜单', 2, '一本账科技', '菜单[user.用户管理]', '2019-12-11 15:33:09', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(26, '打开菜单', 2, '一本账科技', '菜单[group.组管理]', '2019-12-11 15:33:11', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(27, 'pc登录', 3, '分公司AA', '[adminaa]用户名登录成功', '2019-12-11 15:34:58', '127.0.0.1', 'MSIE11', '1576032262203', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=908462'),
(28, '打开菜单', 3, '分公司AA', '菜单[num142.信呼官网]', '2019-12-11 15:35:03', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=aW5kZXgvaWZyYW1lL3JvY2tfaWZyYW1l&num=num142&menuname=5L!h5ZG85a6Y572R'),
(29, '打开菜单', 1, '管理员', '菜单[num9.人员→菜单]', '2019-12-11 15:35:22', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num9&menuname=5Lq65ZGY4oaS6I!c5Y2V'),
(30, '打开菜单', 3, '分公司AA', '菜单[num6.组织结构]', '2019-12-11 15:35:52', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(31, '打开菜单', 3, '分公司AA', '菜单[user.用户管理]', '2019-12-11 15:35:56', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(32, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-11 15:41:49', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(33, '打开菜单', 1, '管理员', '菜单[num21.流程模块权限]', '2019-12-11 15:44:19', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlldw::&num=num21&menuname=5rWB56iL5qih5Z2X5p2D6ZmQ'),
(34, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 15:44:19', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(35, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[客户合同]的元素]', '2019-12-11 15:44:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WuouaIt!WQiOWQjF3nmoTlhYPntKA:'),
(36, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[客户合同]的元素]', '2019-12-11 15:46:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WuouaIt!WQiOWQjF3nmoTlhYPntKA:'),
(37, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 15:46:44', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(38, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[客户合同]的元素]', '2019-12-11 15:46:54', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WuouaIt!WQiOWQjF3nmoTlhYPntKA:'),
(39, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 15:52:33', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(40, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 15:58:10', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(41, '打开菜单', 1, '管理员', '菜单[num112.我的客户]', '2019-12-11 16:01:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num112&menuname=5oiR55qE5a6i5oi3'),
(42, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:15:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(43, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:25:36', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(44, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:28:01', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(45, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:29:09', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(46, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:30:05', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(47, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:31:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(48, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:46:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(49, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-11 16:51:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(50, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 17:05:49', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(51, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[收付款单]的元素]', '2019-12-11 17:08:01', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(52, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[收付款单]的元素]', '2019-12-11 17:08:52', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(53, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[收付款单]的元素]', '2019-12-11 17:11:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(54, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[收付款单]的元素]', '2019-12-11 17:12:06', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(55, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[收付款单]的元素]', '2019-12-11 17:13:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(56, '打开菜单', 1, '管理员', '菜单[num106.我的收款单]', '2019-12-11 17:15:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5oiR55qE5pS25qy!5Y2V'),
(57, '错误SQL', 1, '管理员', 'mysqliError:Table &#39;yibenzhang.xinhu_account&#39; doesn&#39;t exist', '2019-12-11 17:23:24', '127.0.0.1', 'Chrome', NULL, 2, 'upload/logs/2019-12/mysql_sqlerr20191211172324_cknjablimghfde.log'),
(58, '错误SQL', 1, '管理员', 'mysqliError:You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near &#39;1  ORDER BY `name`&#39; at line 1', '2019-12-11 17:29:19', '127.0.0.1', 'Chrome', NULL, 2, 'upload/logs/2019-12/mysql_sqlerr20191211172919_jkdiemnhbglcaf.log'),
(59, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 17:31:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(60, '打开菜单', 1, '管理员', '菜单[flowelement521.编辑[收付款单]的元素]', '2019-12-11 17:31:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement521&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(61, '打开菜单', 1, '管理员', '菜单[num107.我的付款单]', '2019-12-11 17:35:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num107&menuname=5oiR55qE5LuY5qy!5Y2V'),
(62, '打开菜单', 1, '管理员', '菜单[num106.我的收款单]', '2019-12-11 17:36:30', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5oiR55qE5pS25qy!5Y2V'),
(63, '打开菜单', 1, '管理员', '菜单[num106.我的收款单]', '2019-12-11 17:37:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5oiR55qE5pS25qy!5Y2V'),
(64, '打开菜单', 1, '管理员', '菜单[num107.收付款单(我已付款)]', '2019-12-11 17:37:16', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num107&menuname=5pS25LuY5qy!5Y2VKOaIkeW3suS7mOasvik:'),
(65, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-11 17:46:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(66, '打开菜单', 1, '管理员', '菜单[flowset0.新增流程模块]', '2019-12-11 17:46:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXRlZGl0&num=flowset0&menuname=5paw5aKe5rWB56iL5qih5Z2X'),
(67, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 17:47:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(68, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:47:45', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(69, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:48:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(70, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:49:00', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(71, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:49:56', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(72, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:50:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(73, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:51:46', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(74, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:52:19', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(75, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:52:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(76, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:53:38', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(77, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:54:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(78, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用单]的元素]', '2019-12-11 17:54:26', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOWNlV3nmoTlhYPntKA:'),
(79, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-11 17:56:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(80, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-11 17:57:19', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(81, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-11 17:59:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(82, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-11 18:01:43', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(83, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-11 18:03:05', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(84, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-11 18:03:07', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(85, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 18:03:22', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(86, '错误SQL', 1, '管理员', 'mysqliError:Table &#39;yibenzhang.xinhu_feetype&#39; doesn&#39;t exist', '2019-12-11 18:06:47', '127.0.0.1', 'Chrome', NULL, 2, 'upload/logs/2019-12/mysql_sqlerr20191211180647_amkdblfnhgeijc.log'),
(87, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-11 18:12:22', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(88, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-11 18:14:33', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(89, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 18:14:36', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(90, '打开菜单', 1, '管理员', '菜单[flowset0.新增流程模块]', '2019-12-11 18:15:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXRlZGl0&num=flowset0&menuname=5paw5aKe5rWB56iL5qih5Z2X'),
(91, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-11 18:17:10', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(92, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:17:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(93, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:17:46', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(94, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:18:09', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(95, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:18:31', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(96, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:19:38', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(97, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:20:06', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(98, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:20:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(99, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:21:01', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(100, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:21:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(101, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[调账单]的元素]', '2019-12-11 18:21:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!iwg!i0puWNlV3nmoTlhYPntKA:'),
(102, '打开菜单', 1, '管理员', '菜单[num325.调账单]', '2019-12-11 18:24:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYWE:&num=num325&menuname=6LCD6LSm5Y2V'),
(103, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 09:35:29', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(104, '打开菜单', 1, '管理员', '菜单[num190.资金借入单]', '2019-12-12 09:35:30', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5oa2Q:&num=num190&menuname=6LWE6YeR5YCf5YWl5Y2V'),
(105, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 09:42:45', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(106, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[借款单]的元素]', '2019-12-12 09:44:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WAn!asvuWNlV3nmoTlhYPntKA:'),
(107, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[借款单]的元素]', '2019-12-12 10:12:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WAn!asvuWNlV3nmoTlhYPntKA:'),
(108, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[借款单]的元素]', '2019-12-12 10:13:08', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WAn!asvuWNlV3nmoTlhYPntKA:'),
(109, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 10:13:46', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(110, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[借款单]的元素]', '2019-12-12 10:14:32', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WAn!asvuWNlV3nmoTlhYPntKA:'),
(111, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[借款单]的元素]', '2019-12-12 10:15:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WAn!asvuWNlV3nmoTlhYPntKA:'),
(112, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 10:15:57', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(113, '打开菜单', 1, '管理员', '菜单[num190.资金借入单]', '2019-12-12 10:16:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5oa2Q:&num=num190&menuname=6LWE6YeR5YCf5YWl5Y2V'),
(114, '打开菜单', 1, '管理员', '菜单[num24.数据选项]', '2019-12-12 10:17:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL29wdGlvbi9yb2NrX29wdGlvbg::&num=num24&menuname=5pWw5o2u6YCJ6aG5'),
(115, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-12 10:17:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(116, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 10:18:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(117, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 10:18:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(118, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 10:20:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(119, '打开菜单', 1, '管理员', '菜单[num190.资金借入单]', '2019-12-12 10:25:55', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5oa2Q:&num=num190&menuname=6LWE6YeR5YCf5YWl5Y2V'),
(120, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-12 10:26:05', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(121, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 10:30:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(122, '打开菜单', 1, '管理员', '菜单[num189.资金借出单]', '2019-12-12 10:35:11', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2Q:&num=num189&menuname=6LWE6YeR5YCf5Ye65Y2V'),
(123, '打开菜单', 1, '管理员', '菜单[num190.资金借入单]', '2019-12-12 10:37:00', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5oa2Q:&num=num190&menuname=6LWE6YeR5YCf5YWl5Y2V'),
(124, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 10:37:48', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(125, '打开菜单', 1, '管理员', '菜单[num190.资金借入单]', '2019-12-12 10:38:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5oa2Q:&num=num190&menuname=6LWE6YeR5YCf5YWl5Y2V'),
(126, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[资金借入单]的元素]', '2019-12-12 10:38:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i1hOmHkeWAn!WFpeWNlV3nmoTlhYPntKA:'),
(127, '打开菜单', 1, '管理员', '菜单[num190.资金借入单]', '2019-12-12 10:39:41', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5oa2Q:&num=num190&menuname=6LWE6YeR5YCf5YWl5Y2V'),
(128, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[资金借入单]的元素]', '2019-12-12 10:39:56', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i1hOmHkeWAn!WFpeWNlV3nmoTlhYPntKA:'),
(129, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[资金借入单]的元素]', '2019-12-12 10:40:17', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i1hOmHkeWAn!WFpeWNlV3nmoTlhYPntKA:'),
(130, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 10:42:56', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(131, '打开菜单', 1, '管理员', '菜单[num279.发票管理]', '2019-12-12 10:44:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5waWFv&num=num279&menuname=5Y!R56Wo566h55CG'),
(132, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 11:03:52', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(133, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 11:07:56', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(134, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:08:01', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(135, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 11:08:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(136, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:08:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(137, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:08:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(138, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 11:08:21', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(139, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-12 11:08:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(140, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-12 11:08:24', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(141, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-12 11:08:26', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(142, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 11:08:32', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(143, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-12 11:09:49', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(144, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-12 11:09:50', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(145, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:09:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(146, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 11:09:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(147, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 11:09:57', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(148, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-12 11:09:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(149, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:16:24', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(150, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:16:29', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(151, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:16:33', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(152, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:16:37', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(153, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 11:16:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(154, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-12 11:16:43', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(155, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:17:09', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(156, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:17:24', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(157, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 11:19:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(158, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 11:19:53', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(159, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 11:19:57', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(160, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-12 11:19:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(161, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-12 11:20:00', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(162, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-12 11:20:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(163, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-12 11:20:13', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(164, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-12 13:23:54', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(165, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-12 13:24:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(166, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 13:24:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(167, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-12 13:24:06', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(168, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 13:24:08', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(169, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 13:24:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(170, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 13:31:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(171, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 13:32:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(172, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 13:32:32', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(173, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-12 13:44:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(174, '打开菜单', 1, '管理员', '菜单[flowset0.新增流程模块]', '2019-12-12 13:44:16', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXRlZGl0&num=flowset0&menuname=5paw5aKe5rWB56iL5qih5Z2X'),
(175, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 13:45:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(176, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 13:45:48', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(177, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[账户维护]的元素]', '2019-12-12 13:45:55', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0puaIt!e7tOaKpF3nmoTlhYPntKA:'),
(178, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[账户维护]的元素]', '2019-12-12 13:47:17', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0puaIt!e7tOaKpF3nmoTlhYPntKA:'),
(179, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[账户维护]的元素]', '2019-12-12 13:54:48', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0puaIt!e7tOaKpF3nmoTlhYPntKA:'),
(180, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[账户维护]的元素]', '2019-12-12 13:55:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0puaIt!e7tOaKpF3nmoTlhYPntKA:'),
(181, '打开菜单', 1, '管理员', '菜单[flowset0.新增流程模块]', '2019-12-12 13:56:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXRlZGl0&num=flowset0&menuname=5paw5aKe5rWB56iL5qih5Z2X'),
(182, '打开菜单', 1, '管理员', '菜单[flowset101.编辑流程模块]', '2019-12-12 13:57:09', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXRlZGl0&num=flowset101&menuname=57yW6L6R5rWB56iL5qih5Z2X'),
(183, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 13:57:26', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(184, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用类型]的元素]', '2019-12-12 13:59:19', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOexu!Wei13nmoTlhYPntKA:'),
(185, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[费用类型]的元素]', '2019-12-12 14:00:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!i0ueeUqOexu!Wei13nmoTlhYPntKA:'),
(186, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 14:01:22', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(187, '打开菜单', 1, '管理员', '菜单[flowset0.新增流程模块]', '2019-12-12 14:09:08', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXRlZGl0&num=flowset0&menuname=5paw5aKe5rWB56iL5qih5Z2X'),
(188, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 14:12:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(189, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[发票费率]的元素]', '2019-12-12 14:13:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WPkeelqOi0ueeOh13nmoTlhYPntKA:'),
(190, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[发票费率]的元素]', '2019-12-12 14:19:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!WPkeelqOi0ueeOh13nmoTlhYPntKA:'),
(191, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 14:35:55', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(192, '打开菜单', 1, '管理员', '菜单[num337.费用类型]', '2019-12-12 14:35:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L');
INSERT INTO `xinhu_log` (`id`, `type`, `optid`, `optname`, `remark`, `optdt`, `ip`, `web`, `device`, `level`, `url`) VALUES
(193, '打开菜单', 1, '管理员', '菜单[num338.发票费率]', '2019-12-12 14:35:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(194, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:30:07', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(195, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:30:16', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(196, '打开菜单', 1, '管理员', '菜单[num337.费用类型]', '2019-12-12 15:48:43', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(197, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:48:43', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(198, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 15:50:29', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(199, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 15:51:05', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(200, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-12 15:51:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(201, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:51:21', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(202, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:52:06', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(203, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:52:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(204, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 15:55:56', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(205, '打开菜单', 1, '管理员', '菜单[num337.费用类型]', '2019-12-12 15:55:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(206, '打开菜单', 1, '管理员', '菜单[num338.发票费率]', '2019-12-12 15:56:01', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(207, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 16:34:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(208, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-12 16:34:33', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(209, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 16:48:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(210, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-12 17:08:06', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=91653'),
(211, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 17:08:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(212, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 17:08:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(213, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 17:08:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(214, 'pc登录', 1, NULL, '[admin]用户名密码不对', '2019-12-12 17:43:00', '183.13.207.38', 'Chrome', '1575021975234', 3, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=593508'),
(215, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-12 17:43:05', '183.13.207.38', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=540413'),
(216, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 17:43:14', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(217, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 17:43:42', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(218, '打开菜单', 1, '管理员', '菜单[num106.我的收款单]', '2019-12-12 17:44:11', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5oiR55qE5pS25qy!5Y2V'),
(219, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-12 17:44:18', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(220, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 17:44:34', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(221, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-12 17:44:52', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(222, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-12 17:45:01', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(223, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-12 17:45:02', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(224, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-12 23:06:55', '113.118.36.110', 'Chrome', '1575046279000', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=825871'),
(225, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 23:07:17', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(226, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 23:07:21', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(227, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 23:07:29', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(228, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-12 23:07:48', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(229, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 23:08:18', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(230, '打开菜单', 1, '管理员', '菜单[num337.费用类型]', '2019-12-12 23:08:21', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(231, '打开菜单', 1, '管理员', '菜单[num338.发票费率]', '2019-12-12 23:08:22', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(232, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-12 23:08:32', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(233, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-12 23:08:37', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(234, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-12 23:08:42', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(235, '打开菜单', 1, '管理员', '菜单[group.组管理]', '2019-12-12 23:08:47', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(236, '打开菜单', 1, '管理员', '菜单[num187.费用报销]', '2019-12-12 23:08:51', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5meWJ4&num=num187&menuname=6LS555So5oql6ZSA'),
(237, '打开菜单', 1, '管理员', '菜单[num191.费用报销报表]', '2019-12-12 23:09:11', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5jY2J4Y2hhcnQ:&num=num191&menuname=6LS555So5oql6ZSA5oql6KGo'),
(238, '打开菜单', 1, '管理员', '菜单[num188.出差报销]', '2019-12-12 23:09:13', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5jY2J4&num=num188&menuname=5Ye65beu5oql6ZSA'),
(239, '打开菜单', 1, '管理员', '菜单[num218.借款单统计]', '2019-12-12 23:09:14', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5qa2R0b3RhbA::&num=num218&menuname=5YCf5qy!5Y2V57uf6K6h'),
(240, '打开菜单', 1, '管理员', '菜单[num229.付款申请]', '2019-12-12 23:09:16', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5wYXk:&num=num229&menuname=5LuY5qy!55Sz6K!3'),
(241, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-12 23:09:45', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(242, '打开菜单', 1, '管理员', '菜单[upgrade.系统升级]', '2019-12-12 23:11:37', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL3VwZ3JhZGUvcm9ja191cGdyYWRl&num=upgrade&menuname=57O757uf5Y2H57qn'),
(243, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-12 23:14:44', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(244, '打开菜单', 1, '管理员', '菜单[num103.系统信息]', '2019-12-12 23:14:45', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zeXNpbmZv&num=num103&menuname=57O757uf5L!h5oGv'),
(245, '打开菜单', 1, '管理员', '菜单[num147.数据库表]', '2019-12-12 23:15:02', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL3RhYmxlL3JvY2tfdGFibGVfbGlzdA::&num=num147&menuname=5pWw5o2u5bqT6KGo'),
(246, '打开菜单', 1, '管理员', '菜单[num25.初始化备份]', '2019-12-12 23:15:55', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2JlaWZlbi9yb2NrX2JlaWZlbg::&num=num25&menuname=5Yid5aeL5YyW5aSH5Lu9'),
(247, '打开菜单', 1, '管理员', '菜单[taskrun.计划任务]', '2019-12-12 23:15:59', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL3Rhc2svcm9ja190YXNr&num=taskrun&menuname=6K6h5YiS5Lu75Yqh'),
(248, '打开菜单', 1, '管理员', '菜单[upgrade.系统升级]', '2019-12-12 23:16:09', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL3VwZ3JhZGUvcm9ja191cGdyYWRl&num=upgrade&menuname=57O757uf5Y2H57qn'),
(249, '打开菜单', 1, '管理员', '菜单[num161.上传文件管理]', '2019-12-12 23:16:22', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dlcmVuL3JvY2tfZ2VyZW5fZmlsZQ::&num=num161&menuname=5LiK5Lyg5paH5Lu2566h55CG'),
(250, '打开菜单', 1, '管理员', '菜单[syslog.日志查看]', '2019-12-12 23:16:25', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19sb2c:&num=syslog&menuname=5pel5b!X5p!l55yL'),
(251, '打开菜单', 1, '管理员', '菜单[num245.城市管理]', '2019-12-12 23:17:16', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NpdHkvcm9ja19jaXR5&num=num245&menuname=5Z!O5biC566h55CG'),
(252, '打开菜单', 1, '管理员', '菜单[num109.我下属的合同]', '2019-12-12 23:17:32', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num109&menuname=5oiR5LiL5bGe55qE5ZCI5ZCM'),
(253, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 23:17:57', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(254, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-12 23:18:08', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(255, '打开菜单', 1, '管理员', '菜单[num213.审核人员分组]', '2019-12-12 23:18:26', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19jbmFtZQ::&num=num213&menuname=5a6h5qC45Lq65ZGY5YiG57uE'),
(256, '打开菜单', 1, '管理员', '菜单[num26.流程审核步骤]', '2019-12-12 23:18:28', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19jb3Vyc2U:&num=num26&menuname=5rWB56iL5a6h5qC45q2l6aqk'),
(257, '打开菜单', 1, '管理员', '菜单[flowcourse0.新增[上级审核]下的步骤]', '2019-12-12 23:18:44', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19jb3Vyc2VlZGl0&num=flowcourse0&menuname=5paw5aKeW!S4iue6p!WuoeaguF3kuIvnmoTmraXpqqQ:'),
(258, '打开菜单', 1, '管理员', '菜单[num34.单据操作菜单]', '2019-12-12 23:19:37', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19tZW51&num=num34&menuname=5Y2V5o2u5pON5L2c6I!c5Y2V'),
(259, '打开菜单', 1, '管理员', '菜单[num91.流程模块条件]', '2019-12-12 23:19:42', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZQ::&num=num91&menuname=5rWB56iL5qih5Z2X5p2h5Lu2'),
(260, '打开菜单', 1, '管理员', '菜单[flowviewset252.我的申请]', '2019-12-12 23:19:47', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV90b3ZvaWQ:&num=flowviewset252&menuname=5oiR55qE55Sz6K!3'),
(261, '打开菜单', 1, '管理员', '菜单[num185.流程模块统计]', '2019-12-12 23:19:53', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93dG90YWwvcm9ja19mbG93dG90YWw:&num=num185&menuname=5rWB56iL5qih5Z2X57uf6K6h'),
(262, '打开菜单', 1, '管理员', '菜单[danerror.单据异常监控]', '2019-12-12 23:19:54', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lcnJvcg::&num=danerror&menuname=5Y2V5o2u5byC5bi455uR5o6n'),
(263, '打开菜单', 1, '管理员', '菜单[flowcourse8.编辑[人事审核]步骤]', '2019-12-12 23:20:15', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19jb3Vyc2VlZGl0&num=flowcourse8&menuname=57yW6L6RW!S6uuS6i!WuoeaguF3mraXpqqQ:'),
(264, '打开菜单', 1, '管理员', '菜单[num142.信呼官网]', '2019-12-12 23:20:41', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=aW5kZXgvaWZyYW1lL3JvY2tfaWZyYW1l&num=num142&menuname=5L!h5ZG85a6Y572R'),
(265, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-12 23:25:05', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(266, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-12 23:25:06', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(267, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 23:25:12', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(268, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 23:25:16', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(269, '打开菜单', 1, '管理员', '菜单[num229.付款申请]', '2019-12-12 23:39:24', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9maW5wYXk:&num=num229&menuname=5LuY5qy!55Sz6K!3'),
(270, '打开菜单', 1, '管理员', '菜单[num18.服务器设置]', '2019-12-12 23:39:50', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi94aW5odS9yb2NrX3hpbmh1X2NvZw::&num=num18&menuname=5pyN5Yqh5Zmo6K6!572u'),
(271, '打开菜单', 1, '管理员', '菜单[num16.会话管理]', '2019-12-12 23:40:06', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9pbWdyb3VwL3JvY2tfaW1ncm91cA::&num=num16&menuname=5Lya6K!d566h55CG'),
(272, '打开菜单', 1, '管理员', '菜单[yingyong.应用管理]', '2019-12-12 23:40:11', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi95aW5neW9uZy9yb2NrX3lpbmd5b25n&num=yingyong&menuname=5bqU55So566h55CG'),
(273, '打开菜单', 1, '管理员', '菜单[num228.会话记录]', '2019-12-12 23:40:19', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=cmVpbS9yZWNvcmQvcm9ja19yZWNvcmQ:&num=num228&menuname=5Lya6K!d6K6w5b2V'),
(274, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-12 23:40:24', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(275, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-12 23:40:27', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(276, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-12 23:43:46', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(277, '打开菜单', 1, '管理员', '菜单[group.组管理]', '2019-12-12 23:43:48', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(278, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 23:43:50', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(279, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 23:43:56', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(280, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 23:45:42', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(281, '打开菜单', 1, '管理员', '菜单[grcog.个人设置]', '2019-12-12 23:46:05', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dlcmVuL3JvY2tfZ2VyZW5fY29n&num=grcog&menuname=5Liq5Lq66K6!572u'),
(282, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 23:46:20', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(283, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-12 23:46:23', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(284, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 23:46:26', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(285, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 23:46:28', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(286, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 23:46:30', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(287, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-12 23:46:32', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(288, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-12 23:46:33', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(289, '打开菜单', 1, '管理员', '菜单[grcog.个人设置]', '2019-12-12 23:46:39', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dlcmVuL3JvY2tfZ2VyZW5fY29n&num=grcog&menuname=5Liq5Lq66K6!572u'),
(290, '打开菜单', 1, '管理员', '菜单[grcog.个人设置]', '2019-12-12 23:47:01', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dlcmVuL3JvY2tfZ2VyZW5fY29n&num=grcog&menuname=5Liq5Lq66K6!572u'),
(291, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-12 23:47:06', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(292, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-12 23:47:07', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(293, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-12 23:47:08', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(294, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-12 23:47:09', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(295, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-12 23:47:36', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(296, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-12 23:47:45', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(297, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-12 23:47:59', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(298, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-12 23:48:26', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(299, '打开菜单', 1, '管理员', '菜单[email.邮件]', '2019-12-12 23:48:59', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2VtYWlsL3JvY2tfZW1haWw:&num=email&menuname=6YKu5Lu2'),
(300, '打开菜单', 1, '管理员', '菜单[gong.通知公告]', '2019-12-12 23:49:03', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9nb25n&num=gong&menuname=6YCa55!l5YWs5ZGK'),
(301, '打开菜单', 1, '管理员', '菜单[num183.单据查看]', '2019-12-12 23:49:04', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9md29yay9yb2NrX2Z3b3JrX3NlYXJjaA::&num=num183&menuname=5Y2V5o2u5p!l55yL'),
(302, '打开菜单', 1, '管理员', '菜单[flowtodo.单据提醒]', '2019-12-12 23:49:08', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9md29yay9yb2NrX2Z3b3JrX3RvZG8:&num=flowtodo&menuname=5Y2V5o2u5o!Q6YaS'),
(303, '打开菜单', 1, '管理员', '菜单[num185.流程模块统计]', '2019-12-12 23:49:21', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93dG90YWwvcm9ja19mbG93dG90YWw:&num=num185&menuname=5rWB56iL5qih5Z2X57uf6K6h'),
(304, '打开菜单', 1, '管理员', '菜单[danerror.单据异常监控]', '2019-12-12 23:49:21', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lcnJvcg::&num=danerror&menuname=5Y2V5o2u5byC5bi455uR5o6n'),
(305, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-12 23:49:28', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(306, '打开菜单', 1, '管理员', '菜单[num103.系统信息]', '2019-12-12 23:49:43', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zeXNpbmZv&num=num103&menuname=57O757uf5L!h5oGv'),
(307, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-12 23:49:49', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(308, 'mweb登录', 1, '管理员', '[admin]用户名快捷登录', '2019-12-12 23:50:44', '113.118.36.110', 'wxbro', '1576165842598', 0, 'http://yibenzhang.cicscm.com/api.php?m=login&a=check&device=1576165842598&cfrom=mweb&token=4bm2x83p'),
(309, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-12 23:51:15', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(310, '打开菜单', 1, '管理员', '菜单[num221.首页项管理]', '2019-12-12 23:51:26', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2hvbWUvcm9ja19ob21l&num=num221&menuname=6aaW6aG16aG5566h55CG'),
(311, '打开菜单', 1, '管理员', '菜单[num203.文档分区管理]', '2019-12-12 23:51:32', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV93b3Jj&num=num203&menuname=5paH5qGj5YiG5Yy6566h55CG'),
(312, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-12 23:51:47', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(313, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-12 23:51:49', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(314, '打开菜单', 1, '管理员', '菜单[num112.我的客户]', '2019-12-12 23:53:24', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num112&menuname=5oiR55qE5a6i5oi3'),
(315, '打开菜单', 1, '管理员', '菜单[num113.我下属客户]', '2019-12-12 23:53:31', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num113&menuname=5oiR5LiL5bGe5a6i5oi3'),
(316, '打开菜单', 1, '管理员', '菜单[num123.客户分配]', '2019-12-12 23:53:34', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num123&menuname=5a6i5oi35YiG6YWN'),
(317, '打开菜单', 1, '管理员', '菜单[num263.客户申请使用]', '2019-12-12 23:53:35', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0YXBweQ::&num=num263&menuname=5a6i5oi355Sz6K!35L2.55So'),
(318, '打开菜单', 1, '管理员', '菜单[num107.我的付款单]', '2019-12-12 23:53:42', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num107&menuname=5oiR55qE5LuY5qy!5Y2V'),
(319, '打开菜单', 1, '管理员', '菜单[num175.客户一览表]', '2019-12-12 23:53:48', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num175&menuname=5a6i5oi35LiA6KeI6KGo'),
(320, '打开菜单', 1, '管理员', '菜单[num177.所有销售机会]', '2019-12-12 23:53:50', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0c2FsZQ::&num=num177&menuname=5omA5pyJ6ZSA5ZSu5py65Lya'),
(321, '打开菜单', 1, '管理员', '菜单[num176.所有客户合同]', '2019-12-12 23:53:51', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num176&menuname=5omA5pyJ5a6i5oi35ZCI5ZCM'),
(322, '打开菜单', 1, '管理员', '菜单[num302.所有销售]', '2019-12-12 23:54:02', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0eGlhbw::&num=num302&menuname=5omA5pyJ6ZSA5ZSu'),
(323, '打开菜单', 1, '管理员', '菜单[num121.所有收款单]', '2019-12-12 23:54:04', '113.118.36.110', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num121&menuname=5omA5pyJ5pS25qy!5Y2V'),
(324, '打开应用', 1, '管理员', '应用[jiankong.流程监控]', '2019-12-13 00:13:25', '113.118.36.110', 'wxbro', NULL, 0, 'http://yibenzhang.cicscm.com/?m=ying&d=we&num=jiankong'),
(325, '打开应用', 1, '管理员', '应用[flow.流程申请]', '2019-12-13 00:13:32', '113.118.36.110', 'wxbro', NULL, 0, 'http://yibenzhang.cicscm.com/?m=ying&d=we&num=flow'),
(326, '打开应用', 1, '管理员', '应用[news.新闻资讯]', '2019-12-13 00:14:01', '113.118.36.110', 'wxbro', NULL, 0, 'http://yibenzhang.cicscm.com/?m=ying&d=we&num=news'),
(327, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 09:39:14', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(328, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-13 09:39:52', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(329, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-13 09:39:57', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(330, '打开菜单', 1, '管理员', '菜单[num325.调账单]', '2019-12-13 09:40:00', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYWE:&num=num325&menuname=6LCD6LSm5Y2V'),
(331, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-13 09:40:15', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(332, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 09:40:34', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(333, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 09:40:38', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(334, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 09:40:49', '183.13.207.38', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(335, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 10:07:53', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(336, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-13 10:07:53', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(337, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 10:21:20', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(338, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-13 10:21:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(339, '打开菜单', 1, '管理员', '菜单[num337.费用类型]', '2019-12-13 10:21:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(340, '打开菜单', 1, '管理员', '菜单[num338.发票费率]', '2019-12-13 10:21:30', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(341, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-13 10:24:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(342, '打开菜单', 1, '管理员', '菜单[danerror.单据异常监控]', '2019-12-13 10:25:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lcnJvcg::&num=danerror&menuname=5Y2V5o2u5byC5bi455uR5o6n'),
(343, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-13 10:29:35', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(344, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 10:30:46', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(345, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-13 10:46:35', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(346, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-13 10:46:36', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(347, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-13 10:46:38', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(348, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-13 10:46:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(349, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-13 10:46:40', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(350, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-13 10:53:00', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(351, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-13 10:53:01', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(352, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-13 10:53:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(353, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-13 10:53:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(354, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-13 10:53:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(355, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-13 10:53:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(356, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 10:55:34', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(357, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 10:55:49', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(358, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 10:55:54', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(359, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 10:56:34', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(360, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 11:12:36', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(361, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 11:27:47', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(362, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-13 11:28:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(363, '打开菜单', 1, '管理员', '菜单[flowelement1038.编辑[收付款单]的元素]', '2019-12-13 11:28:29', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement1038&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(364, '打开菜单', 1, '管理员', '菜单[flowelement1038.编辑[收付款单]的元素]', '2019-12-13 11:35:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement1038&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(365, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-13 11:38:25', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(366, '打开菜单', 1, '管理员', '菜单[flowelement1038.编辑[收付款单]的元素]', '2019-12-13 11:38:41', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement1038&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(367, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 11:39:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(368, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-13 11:39:47', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(369, '打开菜单', 1, '管理员', '菜单[flowelement1036.编辑[收付款单]的元素]', '2019-12-13 11:40:34', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement1036&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(370, '打开菜单', 1, '管理员', '菜单[flowelement1038.编辑[收付款单]的元素]', '2019-12-13 11:41:10', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement1038&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(371, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 11:41:49', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(372, '打开菜单', 1, '管理员', '菜单[flowelement274.编辑[客户合同]的元素]', '2019-12-13 11:50:55', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement274&menuname=57yW6L6RW!WuouaIt!WQiOWQjF3nmoTlhYPntKA:'),
(373, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 11:58:17', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(374, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-13 12:03:10', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(375, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 12:03:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(376, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-13 13:16:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(377, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-13 13:20:47', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(378, '打开菜单', 1, '管理员', '菜单[flowelement1038.编辑[收付款单]的元素]', '2019-12-13 13:21:15', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement1038&menuname=57yW6L6RW!aUtuS7mOasvuWNlV3nmoTlhYPntKA:'),
(379, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 13:37:16', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=880228'),
(380, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 13:47:28', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=65907'),
(381, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-13 13:47:37', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(382, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 13:50:20', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=521954'),
(383, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-13 13:50:24', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(384, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-13 13:51:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(385, '打开菜单', 1, '管理员', '菜单[flowtodo.单据提醒]', '2019-12-13 13:52:06', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9md29yay9yb2NrX2Z3b3JrX3RvZG8:&num=flowtodo&menuname=5Y2V5o2u5o!Q6YaS'),
(386, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-13 13:52:10', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(387, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:03:02', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=579527');
INSERT INTO `xinhu_log` (`id`, `type`, `optid`, `optname`, `remark`, `optdt`, `ip`, `web`, `device`, `level`, `url`) VALUES
(388, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:03:54', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=603144'),
(389, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:04:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(390, '打开菜单', 1, '管理员', '菜单[group.组管理]', '2019-12-13 14:04:07', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(391, '打开菜单', 1, '管理员', '菜单[num11.组→菜单]', '2019-12-13 14:04:19', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num11&menuname=57uE4oaS6I!c5Y2V'),
(392, '打开菜单', 1, '管理员', '菜单[num12.菜单→组]', '2019-12-13 14:06:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num12&menuname=6I!c5Y2V4oaS57uE'),
(393, '打开菜单', 1, '管理员', '菜单[num11.组→菜单]', '2019-12-13 14:06:13', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num11&menuname=57uE4oaS6I!c5Y2V'),
(394, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:14:53', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=83249'),
(395, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:14:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(396, 'pc登录', 0, NULL, '[xcytech]用户不存在', '2019-12-13 14:15:13', '127.0.0.1', 'Chrome', '1576031006447', 3, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=777956'),
(397, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 14:20:12', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=802755'),
(398, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:20:47', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=747164'),
(399, '打开菜单', 1, '管理员', '菜单[num156.系统设置]', '2019-12-13 14:20:51', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2NvZy9yb2NrX2NvZ19zZXQ:&num=num156&menuname=57O757uf6K6!572u'),
(400, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 14:21:10', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=227454'),
(401, '打开菜单', 4, '阿达', '菜单[num328.每月营业明细表]', '2019-12-13 14:21:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(402, '打开菜单', 4, '阿达', '菜单[num329.合同成本表]', '2019-12-13 14:21:25', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(403, '打开菜单', 4, '阿达', '菜单[num327.营业汇总表]', '2019-12-13 14:21:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(404, '打开菜单', 4, '阿达', '菜单[num327.营业汇总表]', '2019-12-13 14:21:36', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(405, '打开菜单', 4, '阿达', '菜单[num330.利润表]', '2019-12-13 14:21:44', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(406, '打开菜单', 4, '阿达', '菜单[num331.合同应收表]', '2019-12-13 14:21:46', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(407, '打开菜单', 4, '阿达', '菜单[num332.合同回款一览表]', '2019-12-13 14:21:48', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(408, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-13 14:21:53', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(409, '打开菜单', 4, '阿达', '菜单[num112.我的客户]', '2019-12-13 14:22:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num112&menuname=5oiR55qE5a6i5oi3'),
(410, '打开菜单', 4, '阿达', '菜单[num108.我的合同]', '2019-12-13 14:22:16', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(411, '打开菜单', 4, '阿达', '菜单[num324.费用单]', '2019-12-13 14:22:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(412, '打开菜单', 4, '阿达', '菜单[num325.调账单]', '2019-12-13 14:22:33', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYWE:&num=num325&menuname=6LCD6LSm5Y2V'),
(413, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:23:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(414, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:23:29', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=809096'),
(415, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-13 14:23:34', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(416, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-13 14:23:34', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(417, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:23:35', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(418, '打开菜单', 1, '管理员', '菜单[num9.人员→菜单]', '2019-12-13 14:25:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num9&menuname=5Lq65ZGY4oaS6I!c5Y2V'),
(419, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:25:28', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(420, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 14:26:53', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=63015'),
(421, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:26:57', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(422, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:27:26', '127.0.0.1', 'MSIE11', '1576032262203', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=273760'),
(423, '打开菜单', 1, '管理员', '菜单[num21.流程模块权限]', '2019-12-13 14:27:30', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlldw::&num=num21&menuname=5rWB56iL5qih5Z2X5p2D6ZmQ'),
(424, '打开菜单', 1, '管理员', '菜单[flowview0.新增流程模块权限]', '2019-12-13 14:28:01', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlld19lZGl0&num=flowview0&menuname=5paw5aKe5rWB56iL5qih5Z2X5p2D6ZmQ'),
(425, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:28:54', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(426, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:30:44', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(427, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 14:39:08', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=245280'),
(428, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:39:13', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(429, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:39:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(430, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:40:22', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(431, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 14:40:56', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=149001'),
(432, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:40:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(433, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:41:53', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(434, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:43:09', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(435, '打开菜单', 1, '管理员', '菜单[group.组管理]', '2019-12-13 14:43:19', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(436, '打开菜单', 1, '管理员', '菜单[menu.菜单管理]', '2019-12-13 14:43:20', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=c3lzdGVtL21lbnUvcm9ja19tZW51&num=menu&menuname=6I!c5Y2V566h55CG'),
(437, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-13 14:43:43', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(438, '打开菜单', 1, '管理员', '菜单[num21.流程模块权限]', '2019-12-13 14:43:49', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlldw::&num=num21&menuname=5rWB56iL5qih5Z2X5p2D6ZmQ'),
(439, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:45:45', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(440, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:46:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(441, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 14:46:19', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=358055'),
(442, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:46:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(443, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:47:04', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(444, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:47:22', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(445, '打开菜单', 1, '管理员', '菜单[num91.流程模块条件]', '2019-12-13 14:47:59', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZQ::&num=num91&menuname=5rWB56iL5qih5Z2X5p2h5Lu2'),
(446, '打开菜单', 1, '管理员', '菜单[flowviewset152.我全部下属]', '2019-12-13 14:48:38', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=flowviewset152&menuname=5oiR5YWo6YOo5LiL5bGe'),
(447, '打开菜单', 1, '管理员', '菜单[flowwhere152.编辑条件]', '2019-12-13 14:48:43', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZWVkaXQ:&num=flowwhere152&menuname=57yW6L6R5p2h5Lu2'),
(448, '打开菜单', 1, '管理员', '菜单[flowwhere0.新增[10.用户(user)]的条件]', '2019-12-13 14:48:51', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZWVkaXQ:&num=flowwhere0&menuname=5paw5aKeWzEwLueUqOaItyh1c2VyKV3nmoTmnaHku7Y:'),
(449, '打开菜单', 1, '管理员', '菜单[flowwhere152.编辑条件]', '2019-12-13 14:49:10', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZWVkaXQ:&num=flowwhere152&menuname=57yW6L6R5p2h5Lu2'),
(450, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:50:59', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(451, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:51:10', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(452, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-13 14:52:31', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(453, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 14:53:02', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(454, '打开菜单', 1, '管理员', '菜单[num91.流程模块条件]', '2019-12-13 14:53:20', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZQ::&num=num91&menuname=5rWB56iL5qih5Z2X5p2h5Lu2'),
(455, '打开菜单', 1, '管理员', '菜单[flowviewset260.看全部人员]', '2019-12-13 14:53:31', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=flowviewset260&menuname=55yL5YWo6YOo5Lq65ZGY'),
(456, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-13 14:54:25', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(457, '打开菜单', 1, '管理员', '菜单[flowwhere260.编辑条件]', '2019-12-13 14:54:43', '127.0.0.1', 'MSIE 11', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZWVkaXQ:&num=flowwhere260&menuname=57yW6L6R5p2h5Lu2'),
(458, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 14:56:24', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(459, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 15:09:47', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(460, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 15:10:24', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=719907'),
(461, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:10:31', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(462, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:27:26', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(463, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:29:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(464, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:31:58', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(465, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:32:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(466, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:33:39', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(467, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:34:31', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(468, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:38:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(469, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:38:23', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(470, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:39:14', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(471, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:40:02', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(472, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:41:03', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(473, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:42:08', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(474, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:43:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(475, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:45:12', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(476, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:45:21', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(477, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:45:26', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(478, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 15:46:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(479, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 15:47:48', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=424739'),
(480, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 15:48:07', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=550975'),
(481, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 15:48:14', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=540221'),
(482, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 15:49:02', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=732416'),
(483, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 15:49:30', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=552931'),
(484, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 15:49:34', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(485, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 15:50:29', '127.0.0.1', 'Chrome', '1576031006447', 0, 'http://127.0.0.3/index.php?a=check&m=login&d=&ajaxbool=true&rnd=345193'),
(486, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-13 15:53:44', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(487, '打开菜单', 1, '管理员', '菜单[flowelement0.新增[用户]的元素]', '2019-12-13 15:54:43', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50ZWRpdA::&num=flowelement0&menuname=5paw5aKeW!eUqOaIt13nmoTlhYPntKA:'),
(488, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:16:54', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(489, '打开菜单', 1, '管理员', '菜单[num17.流程模块列表]', '2019-12-13 16:16:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19zZXQ:&num=num17&menuname=5rWB56iL5qih5Z2X5YiX6KGo'),
(490, '打开菜单', 1, '管理员', '菜单[num20.表单元素管理]', '2019-12-13 16:17:04', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lbGVtZW50&num=num20&menuname=6KGo5Y2V5YWD57Sg566h55CG'),
(491, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:17:27', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(492, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:17:59', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(493, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:18:18', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(494, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:18:31', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(495, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:18:55', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(496, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 16:19:09', '127.0.0.1', 'Chrome', NULL, 0, 'http://127.0.0.3/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(497, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-13 17:32:29', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(498, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 17:32:36', '183.13.203.31', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=645752'),
(499, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 17:32:42', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(500, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 17:54:22', '183.13.203.31', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=485904'),
(501, '打开菜单', 4, '阿达', '菜单[user.用户管理]', '2019-12-13 17:54:26', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(502, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-13 18:01:32', '183.13.203.31', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=890303'),
(503, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-13 18:10:48', '183.13.203.31', 'Chrome', '1574942347066', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=707585'),
(504, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-13 18:10:54', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(505, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-13 18:11:14', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(506, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-13 18:11:14', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(507, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-14 13:58:31', '113.118.37.147', 'Chrome', '1575046279000', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=535337'),
(508, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-14 13:58:45', '113.118.37.147', 'Chrome', '1575046279000', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=202812'),
(509, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-14 13:58:50', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(510, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-14 13:58:54', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(511, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-14 13:59:00', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(512, '错误SQL', 1, '管理员', 'mysqliError:You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near &#39;) and (`companyid`=1 or instr(concat(&#39;,&#39;, `dwid`, &#39;,&#39;), &#39;,1,&#39;)>0)&#39; at line 1', '2019-12-14 13:59:28', '113.118.37.147', 'Chrome', NULL, 2, 'upload/logs/2019-12/mysql_sqlerr20191214135928_fdbcklehmjnaig.log'),
(513, '错误SQL', 1, '管理员', 'mysqliError:You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near &#39;) and (1=1 or instr(concat(&#39;,&#39;, `dwid`, &#39;,&#39;), &#39;,1,&#39;)>0)      order by sort    li&#39; at line 1', '2019-12-14 13:59:28', '113.118.37.147', 'Chrome', NULL, 2, 'upload/logs/2019-12/mysql_sqlerr20191214135928_gcendkjalmhibf.log'),
(514, '打开菜单', 1, '管理员', '菜单[user.用户(未通讯录显示)]', '2019-12-14 13:59:39', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3KOacqumAmuiur!W9leaYvuekuik:'),
(515, '打开菜单', 1, '管理员', '菜单[group.组管理]', '2019-12-14 14:01:09', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(516, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-14 14:01:19', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(517, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-14 14:01:30', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(518, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-15 15:08:43', '183.13.203.31', 'Chrome', '1574942347066', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=808256'),
(519, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-15 15:09:37', '183.13.203.31', 'Chrome', '1574942347066', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=967336'),
(520, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-15 15:09:49', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(521, 'pc登录', 7, '周先生', '[adminc]用户名登录成功', '2019-12-15 15:10:59', '183.13.203.31', 'Chrome', '1574942347066', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=223438'),
(522, '打开菜单', 7, '周先生', '菜单[user.用户管理]', '2019-12-15 15:11:07', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(523, 'pc登录', 7, '周先生', '[adminc]用户名登录成功', '2019-12-15 15:11:52', '183.13.203.31', 'Chrome', '1575619252531', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=863204'),
(524, 'pc登录', 7, '周先生', '[adminc]用户名登录成功', '2019-12-15 15:12:02', '183.13.203.31', 'Chrome', '1575619252531', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=315942'),
(525, '打开菜单', 7, '周先生', '菜单[num6.组织结构]', '2019-12-15 15:12:07', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(526, '打开菜单', 7, '周先生', '菜单[user.用户管理]', '2019-12-15 15:12:10', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(527, '打开菜单', 7, '周先生', '菜单[group.组管理]', '2019-12-15 15:12:13', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2dyb3VwL3JvY2tfZ3JvdXA:&num=group&menuname=57uE566h55CG'),
(528, '打开菜单', 7, '周先生', '菜单[danerror.单据异常监控]', '2019-12-15 15:12:26', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lcnJvcg::&num=danerror&menuname=5Y2V5o2u5byC5bi455uR5o6n'),
(529, '打开菜单', 7, '周先生', '菜单[num108.我的合同]', '2019-12-15 15:12:34', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(530, '打开菜单', 7, '周先生', '菜单[num336.账户维护]', '2019-12-15 15:13:12', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(531, '打开菜单', 7, '周先生', '菜单[num337.费用类型]', '2019-12-15 15:13:16', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(532, '打开菜单', 7, '周先生', '菜单[num338.发票费率]', '2019-12-15 15:13:17', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(533, '打开菜单', 7, '周先生', '菜单[num21.流程模块权限]', '2019-12-15 15:13:43', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlldw::&num=num21&menuname=5rWB56iL5qih5Z2X5p2D6ZmQ'),
(534, '打开菜单', 7, '周先生', '菜单[flowview0.新增流程模块权限]', '2019-12-15 15:13:58', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlld19lZGl0&num=flowview0&menuname=5paw5aKe5rWB56iL5qih5Z2X5p2D6ZmQ'),
(535, '打开菜单', 7, '周先生', '菜单[num112.我的客户]', '2019-12-15 15:14:32', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num112&menuname=5oiR55qE5a6i5oi3'),
(536, '打开菜单', 7, '周先生', '菜单[num108.我的合同]', '2019-12-15 15:15:09', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(537, '打开菜单', 7, '周先生', '菜单[num6.组织结构]', '2019-12-15 15:17:29', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(538, '打开菜单', 7, '周先生', '菜单[num108.我的合同]', '2019-12-15 15:17:33', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(539, 'pc登录', 1, NULL, '[admin]用户名密码不对', '2019-12-15 15:18:01', '183.13.203.31', 'Chrome', '1575619252531', 3, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=466067'),
(540, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-15 15:18:08', '183.13.203.31', 'Chrome', '1575619252531', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=474400'),
(541, '打开菜单', 1, '管理员', '菜单[num6.组织结构]', '2019-12-15 15:18:15', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2RlcHQvcm9ja19kZXB0&num=num6&menuname=57uE57uH57uT5p6E'),
(542, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-15 15:18:15', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(543, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-15 15:18:16', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(544, '打开菜单', 7, '周先生', '菜单[danerror.单据异常监控]', '2019-12-15 15:21:25', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lcnJvcg::&num=danerror&menuname=5Y2V5o2u5byC5bi455uR5o6n'),
(545, '打开菜单', 7, '周先生', '菜单[num26.流程审核步骤]', '2019-12-15 15:21:33', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19jb3Vyc2U:&num=num26&menuname=5rWB56iL5a6h5qC45q2l6aqk'),
(546, '打开菜单', 7, '周先生', '菜单[num21.流程模块权限]', '2019-12-15 15:21:38', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlldw::&num=num21&menuname=5rWB56iL5qih5Z2X5p2D6ZmQ'),
(547, '打开菜单', 7, '周先生', '菜单[num91.流程模块条件]', '2019-12-15 15:21:49', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd193aGVyZQ::&num=num91&menuname=5rWB56iL5qih5Z2X5p2h5Lu2'),
(548, '打开菜单', 7, '周先生', '菜单[flowview0.新增流程模块权限]', '2019-12-15 15:22:06', '183.13.203.31', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi92aWV3L3JvY2tfdmlld19lZGl0&num=flowview0&menuname=5paw5aKe5rWB56iL5qih5Z2X5p2D6ZmQ'),
(549, 'mweb登录', 1, NULL, '[admin]用户名密码不对', '2019-12-15 15:54:19', '183.13.203.31', 'huawei', '1576223988724', 3, 'http://yibenzhang.cicscm.com/api.php?m=login&a=check&device=1576223988724&cfrom=mweb'),
(550, 'pc登录', 1, NULL, '[admin]用户名密码不对', '2019-12-16 09:31:38', '113.118.37.147', 'Chrome', '1575046279000', 3, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=184048'),
(551, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-16 09:32:40', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=378353'),
(552, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 09:35:14', '113.118.37.147', 'Chrome', '1575046279000', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=40285'),
(553, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 09:40:45', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=675771'),
(554, 'pc登录', 0, NULL, '[xcytech3]用户不存在', '2019-12-16 09:41:01', '183.13.200.203', 'Chrome', '1575021975234', 3, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=468478'),
(555, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-16 09:41:04', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=590728'),
(556, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 09:42:33', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=274887'),
(557, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-16 09:42:38', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(558, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-16 09:42:48', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=282990'),
(559, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 09:54:02', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=68413'),
(560, '打开菜单', 1, '管理员', '菜单[user.用户管理]', '2019-12-16 09:54:10', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(561, 'pc登录', 6, 'Beyond', '[userb]用户名登录成功', '2019-12-16 09:54:28', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=954831'),
(562, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 09:54:53', '113.118.37.147', 'Chrome', '1575046279000', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=490139'),
(563, '打开菜单', 1, '管理员', '菜单[num108.我的合同]', '2019-12-16 09:55:15', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0cmFjdA::&num=num108&menuname=5oiR55qE5ZCI5ZCM'),
(564, '打开菜单', 1, '管理员', '菜单[num106.合同收款单]', '2019-12-16 09:55:19', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYQ::&num=num106&menuname=5ZCI5ZCM5pS25qy!5Y2V'),
(565, '打开菜单', 1, '管理员', '菜单[num324.费用单]', '2019-12-16 09:55:21', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmVl&num=num324&menuname=6LS555So5Y2V'),
(566, '打开菜单', 1, '管理员', '菜单[num325.调账单]', '2019-12-16 09:55:23', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0ZmluYWE:&num=num325&menuname=6LCD6LSm5Y2V'),
(567, '打开菜单', 1, '管理员', '菜单[num327.营业汇总表]', '2019-12-16 09:55:53', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(568, '打开菜单', 1, '管理员', '菜单[num328.每月营业明细表]', '2019-12-16 09:55:55', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9teW14&num=num328&menuname=5q!P5pyI6JCl5Lia5piO57uG6KGo'),
(569, '打开菜单', 1, '管理员', '菜单[num329.合同成本表]', '2019-12-16 09:56:00', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odGNi&num=num329&menuname=5ZCI5ZCM5oiQ5pys6KGo'),
(570, '打开菜单', 1, '管理员', '菜单[num330.利润表]', '2019-12-16 09:56:01', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9saXJ1bg::&num=num330&menuname=5Yip5ram6KGo'),
(571, '打开菜单', 1, '管理员', '菜单[num331.合同应收表]', '2019-12-16 09:56:01', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV95aW5n&num=num331&menuname=5ZCI5ZCM5bqU5pS26KGo'),
(572, '打开菜单', 1, '管理员', '菜单[num332.合同回款一览表]', '2019-12-16 09:56:02', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9odWlr&num=num332&menuname=5ZCI5ZCM5Zue5qy!5LiA6KeI6KGo'),
(573, '打开菜单', 1, '管理员', '菜单[num337.费用类型]', '2019-12-16 09:56:05', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(574, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-16 09:56:06', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(575, '打开菜单', 1, '管理员', '菜单[num338.发票费率]', '2019-12-16 09:56:09', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(576, 'pc登录', 6, 'Beyond', '[userb]用户名登录成功', '2019-12-16 09:57:07', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=22251'),
(577, '打开菜单', 1, '管理员', '菜单[num112.我的客户]', '2019-12-16 09:57:13', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num112&menuname=5oiR55qE5a6i5oi3'),
(578, '打开菜单', 6, 'Beyond', '菜单[num336.账户维护]', '2019-12-16 09:57:19', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(579, '打开菜单', 6, 'Beyond', '菜单[num337.费用类型]', '2019-12-16 09:57:20', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(580, '打开菜单', 6, 'Beyond', '菜单[num338.发票费率]', '2019-12-16 09:57:21', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(581, '打开菜单', 6, 'Beyond', '菜单[user.用户管理]', '2019-12-16 09:57:28', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV91c2Vy&num=user&menuname=55So5oi3566h55CG'),
(582, '打开菜单', 1, '管理员', '菜单[company.公司单位]', '2019-12-16 09:57:52', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jb21wYW55&num=company&menuname=5YWs5Y!45Y2V5L2N'),
(583, '打开菜单', 1, '管理员', '菜单[num112.我的客户]', '2019-12-16 09:57:57', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9jdXN0b21lcg::&num=num112&menuname=5oiR55qE5a6i5oi3'),
(584, '打开菜单', 1, '管理员', '菜单[num336.账户维护]', '2019-12-16 09:58:01', '113.118.37.147', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(585, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 09:58:13', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=663785'),
(586, '打开菜单', 1, '管理员', '菜单[num11.组→菜单]', '2019-12-16 09:58:19', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num11&menuname=57uE4oaS6I!c5Y2V'),
(587, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-16 10:00:43', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=337072'),
(588, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:01:15', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(589, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:01:22', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(590, '打开菜单', 4, '阿达', '菜单[num337.费用类型]', '2019-12-16 10:01:24', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(591, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:01:35', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(592, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 10:01:47', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=534029'),
(593, '打开菜单', 1, '管理员', '菜单[num11.组→菜单]', '2019-12-16 10:01:54', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num11&menuname=57uE4oaS6I!c5Y2V');
INSERT INTO `xinhu_log` (`id`, `type`, `optid`, `optname`, `remark`, `optdt`, `ip`, `web`, `device`, `level`, `url`) VALUES
(594, '打开菜单', 1, '管理员', '菜单[num10.菜单→人员]', '2019-12-16 10:01:55', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num10&menuname=6I!c5Y2V4oaS5Lq65ZGY'),
(595, '打开菜单', 1, '管理员', '菜单[num9.人员→菜单]', '2019-12-16 10:01:56', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num9&menuname=5Lq65ZGY4oaS6I!c5Y2V'),
(596, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-16 10:03:28', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=186078'),
(597, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:03:37', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(598, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:04:12', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(599, 'pc登录', 1, NULL, '[admin]用户名密码不对', '2019-12-16 10:04:29', '183.13.200.203', 'Chrome', '1575021975234', 3, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=52471'),
(600, 'pc登录', 1, '管理员', '[admin]用户名登录成功', '2019-12-16 10:04:34', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=906185'),
(601, '打开菜单', 1, '管理员', '菜单[num11.组→菜单]', '2019-12-16 10:04:45', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num11&menuname=57uE4oaS6I!c5Y2V'),
(602, '打开菜单', 1, '管理员', '菜单[num12.菜单→组]', '2019-12-16 10:04:47', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num12&menuname=6I!c5Y2V4oaS57uE'),
(603, '打开菜单', 1, '管理员', '菜单[num10.菜单→人员]', '2019-12-16 10:05:16', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num10&menuname=6I!c5Y2V4oaS5Lq65ZGY'),
(604, '打开菜单', 1, '管理员', '菜单[num9.人员→菜单]', '2019-12-16 10:05:17', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=c3lzdGVtL2V4dGVudC9yb2NrX2V4dGVudA::&num=num9&menuname=5Lq65ZGY4oaS6I!c5Y2V'),
(605, 'pc登录', 4, '阿达', '[xcytech]用户名登录成功', '2019-12-16 10:06:28', '183.13.200.203', 'Chrome', '1575021975234', 0, 'http://yibenzhang.cicscm.com/index.php?a=check&m=login&d=&ajaxbool=true&rnd=573462'),
(606, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:06:31', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(607, '打开菜单', 4, '阿达', '菜单[num327.营业汇总表]', '2019-12-16 10:06:36', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9oem9uZw::&num=num327&menuname=6JCl5Lia5rGH5oC76KGo'),
(608, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:06:38', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(609, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:06:46', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(610, '打开菜单', 4, '阿达', '菜单[num337.费用类型]', '2019-12-16 10:06:49', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWV0eXBl&num=num337&menuname=6LS555So57G75Z6L'),
(611, '打开菜单', 4, '阿达', '菜单[num338.发票费率]', '2019-12-16 10:06:52', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9mZWVsdg::&num=num338&menuname=5Y!R56Wo6LS5546H'),
(612, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:06:54', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(613, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:06:58', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk'),
(614, '打开菜单', 4, '阿达', '菜单[danerror.单据异常监控]', '2019-12-16 10:07:39', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=bWFpbi9mbG93L3JvY2tfZmxvd19lcnJvcg::&num=danerror&menuname=5Y2V5o2u5byC5bi455uR5o6n'),
(615, '打开菜单', 4, '阿达', '菜单[num336.账户维护]', '2019-12-16 10:07:53', '183.13.200.203', 'Chrome', NULL, 0, 'http://yibenzhang.cicscm.com/?m=index&a=getshtml&surl=Zmxvdy9wYWdlL3JvY2tfcGFnZV9hY2NvdW50&num=num336&menuname=6LSm5oi357u05oqk');

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_logintoken`
--

CREATE TABLE IF NOT EXISTS `xinhu_logintoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `name` varchar(20) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `moddt` datetime DEFAULT NULL,
  `cfrom` varchar(10) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `online` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `token` (`token`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统登录token' AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `xinhu_logintoken`
--

INSERT INTO `xinhu_logintoken` (`id`, `uid`, `name`, `token`, `adddt`, `moddt`, `cfrom`, `device`, `ip`, `web`, `online`) VALUES
(2, 2, '一本账科技', 'dt4v8l4x', '2019-12-11 15:24:53', '2019-12-11 15:33:01', 'pc', '1576032262203', '127.0.0.1', 'MSIE11', 0),
(3, 3, '分公司AA', '8xs4w929', '2019-12-11 15:34:58', '2019-12-12 17:30:30', 'pc', '1576032262203', '127.0.0.1', 'MSIE11', 1),
(57, 4, '阿达', 'vk631kqx', '2019-12-16 10:06:28', '2019-12-16 10:06:55', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 1),
(56, 1, '管理员', '8wx7kerm', '2019-12-16 10:04:34', '2019-12-16 10:04:34', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(7, 1, '管理员', 'jy3nw8jj', '2019-12-12 23:50:44', '2019-12-13 00:21:09', 'mweb', '1576165842598', '113.118.36.110', 'wxbro', 1),
(55, 4, '阿达', '43hwz9hf', '2019-12-16 10:03:28', '2019-12-16 10:04:09', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(54, 1, '管理员', 'ocg8grjb', '2019-12-16 10:01:47', '2019-12-16 10:01:47', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(53, 4, '阿达', 'y6v5sahn', '2019-12-16 10:00:42', '2019-12-16 10:01:17', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(46, 1, '管理员', '5hp2k00c', '2019-12-16 09:42:33', '2019-12-16 09:42:33', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(47, 4, '阿达', '9jgo9pr3', '2019-12-16 09:42:48', '2019-12-16 09:49:27', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(40, 7, '周先生', '7hx1xblb', '2019-12-15 15:12:02', '2019-12-15 15:17:46', 'pc', '1575619252531', '183.13.203.31', 'Chrome', 0),
(52, 1, '管理员', '3cq0burv', '2019-12-16 09:58:13', '2019-12-16 09:58:13', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(39, 7, '周先生', '0yb8rz89', '2019-12-15 15:11:52', '2019-12-15 15:11:52', 'pc', '1575619252531', '183.13.203.31', 'Chrome', 1),
(51, 6, 'Beyond', 'g8zv5m8u', '2019-12-16 09:57:07', '2019-12-16 09:57:07', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(50, 1, '管理员', 'q4amz61d', '2019-12-16 09:54:53', '2019-12-16 10:01:15', 'pc', '1575046279000', '113.118.37.147', 'Chrome', 1),
(49, 6, 'Beyond', 'dt7xjn0f', '2019-12-16 09:54:28', '2019-12-16 09:54:28', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(48, 1, '管理员', 'hrxwkjv9', '2019-12-16 09:54:02', '2019-12-16 09:54:02', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(38, 7, '周先生', '9eb3monn', '2019-12-15 15:10:59', '2019-12-15 16:54:46', 'pc', '1574942347066', '183.13.203.31', 'Chrome', 1),
(44, 1, '管理员', 'lua60eim', '2019-12-16 09:40:45', '2019-12-16 09:40:45', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(45, 4, '阿达', 'qb1ixijy', '2019-12-16 09:41:04', '2019-12-16 09:41:04', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 0),
(42, 4, '阿达', 'j78qarf3', '2019-12-16 09:32:40', '2019-12-16 09:32:40', 'pc', '1575021975234', '183.13.200.203', 'Chrome', 1),
(43, 1, '管理员', '47wtl8th', '2019-12-16 09:35:14', '2019-12-16 09:35:14', 'pc', '1575046279000', '113.118.37.147', 'Chrome', 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_meet`
--

CREATE TABLE IF NOT EXISTS `xinhu_meet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hyname` varchar(20) DEFAULT NULL COMMENT '会议室名称',
  `title` varchar(50) DEFAULT NULL COMMENT '主题',
  `startdt` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `enddt` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '会议状态@0|正常,1|会议中,2|结束,3|取消',
  `status` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|普通,1|固定,2|纪要',
  `joinid` varchar(200) DEFAULT NULL,
  `joinname` varchar(500) DEFAULT NULL COMMENT '参加人员',
  `mid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '发起人',
  `rate` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `cancelreason` varchar(200) DEFAULT NULL,
  `jyid` varchar(100) DEFAULT NULL COMMENT '会议纪要人id',
  `jyname` varchar(100) DEFAULT NULL COMMENT '会议纪要人',
  `content` varchar(4000) DEFAULT NULL COMMENT '会议纪要内容',
  `issms` tinyint(1) DEFAULT '0' COMMENT '是否短信通知',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `zcrenid` varchar(50) DEFAULT NULL,
  `zcren` varchar(50) DEFAULT NULL COMMENT '主持人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会议' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_menu`
--

CREATE TABLE IF NOT EXISTS `xinhu_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `pid` smallint(6) DEFAULT '0' COMMENT '上级id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `url` varchar(500) DEFAULT NULL,
  `icons` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `ispir` tinyint(1) DEFAULT '1' COMMENT '1验证',
  `status` tinyint(1) DEFAULT '1' COMMENT '1启用',
  `color` varchar(10) DEFAULT NULL,
  `ishs` tinyint(1) DEFAULT '0' COMMENT '是否在首页显示',
  `iszm` tinyint(1) DEFAULT '0' COMMENT '是否为桌面版图标',
  `type` smallint(6) DEFAULT '0' COMMENT '菜单类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`,`status`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统菜单' AUTO_INCREMENT=339 ;

--
-- 转存表中的数据 `xinhu_menu`
--

INSERT INTO `xinhu_menu` (`id`, `name`, `pid`, `sort`, `url`, `icons`, `optdt`, `num`, `ispir`, `status`, `color`, `ishs`, `iszm`, `type`) VALUES
(1, '系统', 0, 20, NULL, 'cog', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(2, '菜单管理', 220, 4, 'system,menu', 'list-ul', NULL, 'menu', 1, 1, NULL, 0, 0, 1),
(3, '用户管理', 220, 2, 'flow,page,user,atype=all,pnum=all', 'user', NULL, 'user', 1, 1, '#5AAAE2', 1, 0, 0),
(4, '计划任务', 46, 7, 'system,task', 'time', NULL, 'taskrun', 1, 1, NULL, 0, 0, 1),
(5, '组管理', 220, 3, 'system,group', 'group', NULL, 'group', 1, 1, NULL, 0, 0, 0),
(6, '组织结构', 220, 1, 'system,dept', 'sitemap', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(7, '流程模块', 0, 10, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(8, '权限管理', 1, 6, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(9, '人员→菜单', 8, 0, 'system,extent,type=um', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(10, '菜单→人员', 8, 1, 'system,extent,type=mu', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(11, '组→菜单', 8, 2, 'system,extent,type=gm', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(12, '菜单→组', 8, 3, 'system,extent,type=mg', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(13, '人员权限查看', 8, 4, 'system,extent,type=view', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(14, '即时通信管理', 1, 5, NULL, 'comment', NULL, NULL, 1, 1, NULL, 0, 0, 1),
(15, '应用管理', 14, 4, 'main,yingyong', 'th-large', NULL, 'yingyong', 1, 1, '#1ABC9C', 0, 0, 0),
(16, '会话管理', 14, 3, 'main,imgroup', 'comments', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(17, '流程模块列表', 7, 2, 'main,flow,set', 'th-list', NULL, NULL, 1, 1, NULL, 0, 0, 1),
(18, '服务器设置', 14, 0, 'main,xinhu,cog', 'tasks', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(20, '表单元素管理', 7, 5, 'main,flow,element', 'check', NULL, NULL, 1, 1, NULL, 0, 0, 1),
(21, '流程模块权限', 7, 6, 'main,view', 'lock', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(22, '流程单据查看', 7, 7, 'main,flow,view', 'search', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(23, '系统升级', 46, 10, 'system,upgrade', 'arrow-up', NULL, 'upgrade', 1, 0, '#ff0000', 0, 0, 1),
(24, '数据选项', 7, 1, 'system,option,num=xinhu', 'cog', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(25, '初始化备份', 46, 5, 'system,beifen', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 1),
(26, '流程审核步骤', 7, 4, 'main,flow,course', 'resize-vertical', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(27, '人事考勤', 0, 6, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(28, '物品基础管理', 140, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(29, '单据异常监控', 7, 12, 'main,flow,error', 'briefcase', NULL, 'danerror', 1, 1, '#800000', 1, 0, 0),
(30, '物品列表', 28, 3, 'main,goods', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(31, '出入库详情', 249, 1, 'main,goods,xiang', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(32, '考勤设置', 27, 10, NULL, 'time', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(33, '打卡记录', 57, 0, 'main,kaoqin,dkjl,atype=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(34, '单据操作菜单', 7, 8, 'main,flow,menu', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(36, '考勤信息', 57, 4, 'main,kaoqin,info', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(37, '客户统计', 63, 10, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(38, '个人办公', 0, 0, NULL, 'desktop', NULL, NULL, 0, 1, NULL, 0, 0, 0),
(39, '个人中心', 38, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(40, '流程', 0, 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(41, '我的申请', 40, 2, 'main,fwork,bill,atype=my', 'align-left', NULL, 'applymy', 0, 1, NULL, 0, 0, 0),
(42, '流程申请', 40, 1, 'main,fwork,apply', 'plus', NULL, 'flowapply', 0, 1, NULL, 0, 0, 0),
(43, '待办/处理', 40, 0, 'main,fwork,bill,atype=daib', 'time', NULL, 'daiban', 0, 1, '#3BBDDB', 1, 0, 0),
(44, '我的下属申请', 40, 5, 'main,fwork,bill,atype=xia', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(45, '日程', 38, 2, 'system,schedule,list', 'calendar', NULL, 'schedule', 0, 0, NULL, 0, 0, 0),
(46, '系统工具', 1, 10, NULL, 'wrench', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(53, '考勤时间规则', 32, 1, 'main,kaoqin,sjgz', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(54, '考勤时间分配', 32, 2, 'main,kaoqin,sjfp,type=0', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(55, '休息时间规则', 32, 4, 'main,kaoqin,xxgz', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(56, '休息时间分配', 32, 5, 'main,kaoqin,sjfp,type=1', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(57, '考勤信息', 27, 11, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(58, '考勤分析', 57, 6, 'main,kaoqin,anay', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(59, '我的考勤', 38, 12, NULL, 'time', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(60, '考勤统计简表', 57, 7, 'main,kaoqin,total,atype=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(61, '人员考勤设置', 32, 0, 'main,kaoqin,kqcog', 'cog', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(62, '经我处理', 40, 6, 'main,fwork,bill,atype=jmy', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(63, '客户', 0, 5, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(64, '客户', 63, 2, 'main,customer,list,atype=my', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(65, '我的任务', 66, 1, 'flow,page,work,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(66, '任务', 0, 3, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(67, '我未完成任务', 66, 2, 'flow,page,work,atype=wwc', 'book', NULL, 'workwwc', 0, 0, '#BFC462', 1, 0, 0),
(68, '我创建任务', 66, 3, 'flow,page,work,atype=wcj', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(69, '我执行的项目', 79, 2, 'flow,page,project,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(70, '我未完成项目', 79, 2, 'flow,page,project,atype=wwc', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(71, '我创建的项目', 79, 3, 'flow,page,project,atype=mycj', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(72, '我负责的项目', 79, 2, 'flow,page,project,atype=myfz', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(73, '销售机会', 63, 3, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(74, '我申请未通过', 40, 4, 'main,fwork,bill,atype=mywtg', 'info-sign', NULL, 'applywtg', 0, 1, '#B67FF4', 0, 0, 0),
(75, '共享给我的', 64, 1, 'flow,page,customer,atype=gxgw,pnum=shate', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(76, '工作日报', 38, 13, NULL, 'edit', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(77, '我的日报', 76, 6, 'flow,page,daily,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(78, '我下属日报', 76, 8, 'flow,page,daily,atype=undall', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(79, '项目管理', 66, 0, NULL, 'circle-arrow-right', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(80, '任务督导', 66, 4, 'flow,page,work,atype=dd', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(81, '所有任务一览', 66, 10, 'flow,page,work,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(82, '所有项目一览', 79, 10, 'flow,page,project,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(83, '我下属任务', 66, 2, 'flow,page,work,atype=down', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(84, '人事档案', 27, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(85, '人员档案', 84, 0, 'flow,page,userinfo,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(86, '我的考勤表', 59, 0, 'main,kaoqin,geren', NULL, NULL, 'mykqbiao', 0, 0, NULL, 0, 0, 0),
(87, '我的考勤信息', 59, 4, 'main,kaoqin,kqinfo,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(88, '我的考勤统计', 59, 5, 'main,kaoqin,total,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(89, '会议', 38, 11, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(90, '通知公告', 38, 1, 'flow,page,gong,atype=my', 'volume-up', NULL, 'gong', 0, 1, NULL, 0, 0, 0),
(91, '流程模块条件', 7, 9, 'main,flow,where', 'asterisk', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(92, '我的打卡记录', 59, 1, 'main,kaoqin,dkjl,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(93, '我的定位记录', 59, 6, 'main,kaoqin,location,atype=my', 'map-marker', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(94, '定位记录', 57, 1, 'main,kaoqin,location,atype=all', 'map-marker', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(95, '员工合同', 84, 0, 'flow,page,userract,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(96, '转正申请', 127, 3, 'flow,page,hrpositive,atype=all,pnum=all', ' ', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(97, '离职申请', 127, 4, 'flow,page,hrredund,atype=all,pnum=all', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(98, '薪资管理', 27, 3, NULL, 'money', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(99, '薪资核算', 98, 2, 'main,salary,list', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(100, '提醒信息', 39, 1, 'system,geren,todo', 'bell', NULL, 'todo', 0, 1, '#EFBB62', 1, 0, 0),
(101, '个人资料', 39, 2, 'main,userinfo,geren', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(102, '薪资发放', 98, 4, 'main,salary,fafang', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(103, '系统信息', 46, 1, 'system,cog,sysinfo', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 1),
(104, '合同', 63, 4, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(105, '收款单', 63, 6, NULL, 'money', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(106, '合同收款单', 319, 0, 'flow,page,custfina,atype=myskd', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(107, '我的付款单', 118, 0, 'flow,page,custfina,atype=myfkd,pnum=fkd', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(108, '我的合同', 317, 0, 'flow,page,custract,atype=my', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(109, '我下属的合同', 104, 1, 'flow,page,custract,atype=downall,pnum=down', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(110, '我的销售机会', 73, 0, 'flow,page,custsale,atype=mygx', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(111, '我下属销售机会', 73, 1, 'flow,page,custsale,atype=downgj,pnum=down', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(112, '我的客户', 64, 0, 'flow,page,customer,atype=my', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(113, '我下属客户', 64, 2, 'flow,page,customer,atype=downall,pnum=down', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(114, '金额统计', 63, 20, NULL, 'bar-chart', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(115, '我的财务统计', 114, 0, 'main,customer,total,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(116, '我下属财务统计', 114, 0, 'main,customer,total,atype=down', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(117, '我年度统计', 114, 0, 'main,customer,totalge', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(118, '付款单', 63, 7, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(119, '我下属收款单', 105, 0, 'flow,page,custfina,atype=downskd,pnum=downskd', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(120, '我下属付款单', 118, 0, 'flow,page,custfina,atype=downfkd,pnum=downfkd', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(121, '所有收款单', 126, 4, 'flow,page,custfina,atype=allskd,pnum=allskd', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(122, '所有付款单', 126, 5, 'flow,page,custfina,atype=allfkd,pnum=allfkd', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(123, '客户分配', 64, 6, 'flow,page,customer,atype=distdfp,pnum=dist', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(19, '资源', 0, 2, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(124, '文档中心', 19, 2, 'flow,page,worcword', 'folder-close-alt', NULL, 'word', 0, 0, NULL, 0, 0, 0),
(125, '共享的文档', 19, 4, 'system,word,shate', 'folder-open-alt', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(126, '客户查看', 63, 30, NULL, 'eye-open', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(127, '人事管理', 27, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(128, '人事调动', 127, 5, 'flow,page,hrtransfer,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(129, '调薪申请', 127, 6, 'flow,page,hrtrsalary,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(130, '奖惩处罚', 127, 7, 'flow,page,reward,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(131, '我的客户统计', 37, 0, 'main,customer,alllist,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(132, '下属客户统计', 37, 0, 'main,customer,alllist,atype=downall', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(133, '我上传过的文件', 39, 6, 'system,geren,file', 'folder-close-alt', NULL, NULL, 0, 1, NULL, 0, 0, 0),
(134, '知识信息管理', 19, 21, 'system,infor,zhishi', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(135, '知识题库管理', 19, 22, 'system,infor,tiku', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(136, '知识题库学习', 19, 24, 'system,infor,tikuxx', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(137, '固定资产', 140, 11, 'main,assetm,list', 'laptop', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(138, '车辆管理', 140, 21, NULL, 'truck', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(139, '图书管理', 140, 41, NULL, 'book', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(140, '行政', 0, 7, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(141, '图书列表', 139, 0, 'main,book,list', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(142, '信呼官网', 46, 88, 'http://www.rockoa.com/', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(143, '车辆列表', 138, 0, 'flow,page,carm,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(144, '车辆预定查询', 138, 2, 'flow,page,carmrese,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(145, '图书借阅', 139, 5, 'flow,page,bookborrow,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(146, '车辆预定情况', 138, 3, 'main,carm,carmqing', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(147, '数据库表', 46, 2, 'system,table,list', 'table', NULL, NULL, 1, 1, NULL, 0, 0, 1),
(148, '内部通讯录', 39, 4, 'system,admin,txl', 'phone', NULL, 'reimtxl', 0, 1, NULL, 0, 0, 0),
(149, '人员分析', 84, 0, 'main,userinfo,anay', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(150, '今日会议', 89, 0, 'flow,page,meet,atype=today', NULL, NULL, 'meet', 0, 0, NULL, 0, 0, 0),
(151, '会议室情况', 89, 0, 'main,fwork,meethy', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(152, '定位打卡位置', 32, 6, 'main,kaoqin,kqdw', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(153, '定位打卡位置分配', 32, 7, 'main,kaoqin,sjfp,type=2', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(154, '邮件管理', 1, 3, NULL, 'envelope', NULL, NULL, 1, 0, NULL, 0, 0, 1),
(156, '系统设置', 46, 0, 'system,cog,set', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 1),
(157, '邮件', 38, 0, 'system,email', 'envelope', NULL, 'email', 0, 1, '#0099CC', 0, 0, 0),
(158, '知识信息查看', 19, 23, 'system,infor,zhishixx', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(159, '外出记录', 57, 2, 'flow,page,waichu,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(160, '我的外出记录', 59, 2, 'flow,page,waichu,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(161, '上传文件管理', 46, 15, 'system,geren,file,atype=all', 'folder-close-alt', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(162, '日志查看', 46, 16, 'system,cog,log', NULL, NULL, 'syslog', 1, 1, NULL, 0, 0, 1),
(163, '邮件收发设置', 154, 1, 'system,email,cogsfa', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(164, '用户邮箱设置', 154, 2, 'system,email,coguser', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(165, '印章证照', 140, 51, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(166, '印章证照列表', 165, 0, 'flow,page,seal,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(167, '申请使用查询', 165, 0, 'flow,page,sealapl,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(168, '个人通讯录', 39, 5, 'system,geren,vcard', 'credit-card', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(169, '打卡异常', 57, 3, 'flow,page,kqerr,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(170, '我的打卡异常', 59, 3, 'flow,page,kqerr,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(171, '企业微信', 1, 30, NULL, 'comments-alt', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(172, '企业微信设置', 171, 0, 'system,weixinqy,cog', 'cog', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(155, '企业微信部门', 171, 1, 'system,weixinqy,dept', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(173, '企业微信用户', 171, 2, 'system,weixinqy,user', 'user', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(174, '企业微信应用', 171, 3, 'system,weixinqy,ying', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(179, '客户主页', 63, 0, 'main,customer,index', 'user-md', NULL, 'crmindex', 0, 0, NULL, 0, 0, 0),
(175, '客户一览表', 126, 0, 'flow,page,customer,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(176, '所有客户合同', 126, 2, 'flow,page,custract,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(177, '所有销售机会', 126, 1, 'flow,page,custsale,atype=allgj,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(178, '所有财务统计', 126, 6, 'main,customer,total,atype=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(35, '单据通知设置', 7, 10, 'main,flow,todo', 'bell', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(180, '微信公众号', 1, 19, NULL, 'comments-alt', NULL, NULL, 1, 0, NULL, 0, 0, 1),
(181, '公众号设置', 180, 0, 'system,wxgzh,cog', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(182, '授权单据查看', 40, 8, 'main,fwork,bill,atype=grantview', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(183, '单据查看', 38, 3, 'main,fwork,search', 'search', NULL, NULL, 0, 1, NULL, 0, 0, 0),
(184, '我的薪资', 39, 3, 'main,salary,my', 'money', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(185, '流程模块统计', 7, 11, 'main,flowtotal', 'bar-chart', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(186, '报销借还款', 313, 2, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(187, '费用报销', 186, 0, 'flow,page,finfybx,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(188, '出差报销', 186, 3, 'flow,page,finccbx,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(189, '资金借出单', 322, 5, 'flow,page,finjkd,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(190, '资金借入单', 322, 7, 'flow,page,finhkd,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(191, '费用报销报表', 186, 1, 'flow,page,finccbxchart', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(192, '工作日报', 27, 2, NULL, 'edit', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(193, '所有日报', 192, 1, 'flow,page,daily,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(194, '日报统计', 192, 2, 'flow,page,dailytotal', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(195, '我的日报统计', 76, 7, 'flow,page,dailytotal,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(196, '日报统计分析', 192, 3, 'flow,page,dailychart', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(197, '考勤时间排班', 32, 3, 'main,kaoqin,sjpb', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(198, '我下属日报统计', 76, 9, 'flow,page,dailytotal,atype=down', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(199, '考试培训', 27, 12, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(200, '考试培训列表', 199, 0, 'flow,page,knowtraim,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(201, '考试培训人员', 199, 1, 'flow,page,knowtraimuser,atype=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(202, '我的培训考试', 39, 7, 'flow,page,knowtraimuser,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(203, '文档分区管理', 220, 10, 'flow,page,worc,atype=all,pnum=all', 'folder-close-alt', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(204, '公文', 0, 4, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(205, '收文单', 204, 3, NULL, 'hand-down', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(206, '收文管理', 255, 1, 'flow,page,officib,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(207, '单据提醒', 38, 4, 'main,fwork,todo', 'star-empty', NULL, 'flowtodo', 0, 1, '#ADCC61', 1, 0, 0),
(208, '钉钉管理', 1, 40, NULL, 'bolt', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(209, '钉钉设置', 208, 0, 'system,wding,cog', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(210, '钉钉部门', 208, 1, 'system,wding,dept', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(211, '钉钉用户', 208, 2, 'system,wding,user', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(212, '钉钉微应用', 208, 3, 'system,wding,ying', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(213, '审核人员分组', 7, 3, 'main,flow,cname', 'group', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(214, '车辆信息登记', 138, 1, 'flow,page,carms,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(215, '车辆维修', 138, 4, 'flow,page,carmwx,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(216, '车辆保养', 138, 5, 'flow,page,carmby,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(217, '加班单核算', 57, 5, 'flow,page,jiaban,atype=allfee,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(218, '借款单统计', 186, 6, 'flow,page,finjkdtotal,atype=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(219, '公司单位', 220, 0, 'flow,page,company,atype=all,pnum=all', 'road', NULL, 'company', 1, 1, NULL, 0, 0, 1),
(220, '基础管理', 1, 0, NULL, 'asterisk', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(221, '首页项管理', 220, 5, 'system,home', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 1),
(222, '短信管理', 1, 4, NULL, 'envelope-alt', NULL, NULL, 1, 0, NULL, 0, 0, 1),
(223, '短信设置', 222, 0, 'system,sms,cog', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(224, '短信签名', 222, 1, 'system,sms,qian', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(225, '短信模版', 222, 2, 'system,sms,tpl', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(226, '短信发送记录', 222, 3, 'system,sms,record', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(227, '我的会话记录', 39, 8, 'reim,record,atype=my', 'file-alt', NULL, 'reimrecord', 0, 0, NULL, 0, 0, 0),
(228, '会话记录', 14, 5, 'reim,record,atype=all', 'file-alt', NULL, NULL, 1, 1, NULL, 0, 0, 0),
(229, '付款申请', 315, 8, 'flow,page,finpay,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(230, '开票申请', 315, 9, 'flow,page,finkai,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(231, '日报授权查看', 76, 10, 'flow,page,daily,atype=grant', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(232, '发文单', 204, 2, NULL, 'hand-up', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(233, '发文管理', 255, 0, 'flow,page,officia,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(234, '考勤统计详表', 57, 8, 'main,kaoqin,total,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(235, '订阅管理', 237, 0, 'flow,page,subscribe,atype=all,pnum=all', NULL, NULL, 'rssglall', 1, 0, NULL, 0, 0, 0),
(236, '订阅报表', 270, 5, 'flow,page,subscribeinfo,atype=my', 'rss', NULL, 'subscribeinfo', 0, 0, NULL, 0, 0, 0),
(237, '订阅回执管理', 1, 5, NULL, 'rss', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(238, '订阅报表', 237, 1, 'flow,page,subscribeinfo,atype=all,pnum=all', NULL, NULL, 'rssinfoall', 1, 0, NULL, 0, 0, 0),
(239, '公文查阅', 204, 0, 'flow,page,officic,atype=my', 'suitcase', NULL, 'officic', 0, 0, NULL, 0, 0, 0),
(240, '考勤机管理', 27, 10, NULL, 'hdd', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(241, '考勤机设备', 240, 0, 'flow,page,kqjsn,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(242, '考勤机命令查看', 240, 2, 'main,kaoqinj,cmd', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(243, '考勤机上部门人员', 240, 1, 'main,kaoqinj,dept', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(244, '考核评分', 272, 1, 'flow,page,hrcheck,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(245, '城市管理', 46, 17, 'system,city', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 1),
(246, '演示模块数据', 46, 89, 'flow,page,demo,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 1),
(247, '仓库管理', 28, 0, 'flow,page,godepot,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(251, '物品采购', 249, 2, 'flow,page,caigou,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(248, '供应商管理', 28, 1, 'flow,page,customer,atype=gys,pnum=gys', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(249, '物品管理', 140, 2, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(250, '物品领用', 249, 3, 'flow,page,goodly,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(252, '物品盘点', 249, 10, 'main,goods,pandian', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(253, '出入库操作', 249, 0, 'main,goods,cropt', 'plus-sign', NULL, 'cropt', 1, 0, '#00b6ff', 0, 0, 0),
(254, '个人设置', 39, 0, 'system,geren,cog', 'cog', NULL, 'grcog', 0, 1, NULL, 0, 0, 0),
(255, '公文管理', 204, 10, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(256, '拟办发文', 232, 0, 'add,officia', 'edit', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(257, '收文登记', 205, 0, 'add,officib', 'plus', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(258, '我的发文', 232, 1, 'flow,page,officia,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(259, '我的收文', 205, 1, 'flow,page,officib,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(260, '剩余假期统计', 57, 4, 'main,kaoqin,totaljia', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(261, '物品调拨', 249, 4, 'flow,page,diaobo,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(262, '客户公海库', 63, 1, 'flow,page,customer,atype=allgh,pnum=ghai', 'beaker', NULL, 'crmghai', 0, 0, NULL, 0, 0, 0),
(263, '客户申请使用', 64, 7, 'flow,page,custappy,atype=my', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(264, '所有客户申请使用', 126, 7, 'flow,page,custappy,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(265, '人员需求', 127, 1, 'flow,page,hrdemand,atype=all,pnum=all ', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(266, '面试安排', 127, 2, 'flow,page,hrmanshi,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(267, '抄送给我的单据', 40, 7, 'main,fwork,bill,atype=chaosview', NULL, NULL, NULL, 0, 1, NULL, 0, 0, 0),
(268, '单据回执确认', 270, 3, 'flow,page,receipt,atype=my', 'exchange', NULL, 'receiptmy', 0, 0, '#ed8b8b', 0, 0, 0),
(269, '回执确认管理', 237, 2, 'flow,page,receipt,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(270, '订阅和回执', 38, 5, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(271, '草稿待提交', 40, 3, 'main,fwork,bill,atype=daiturn', 'edit', NULL, 'daiturn', 0, 1, '#ff6600', 0, 0, 0),
(272, '考核管理', 27, 2, NULL, 'ok-circle', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(273, '考核项目', 272, 0, 'flow,page,hrkaohem,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(274, '我的考核', 39, 9, 'flow,page,hrcheck,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(275, '考核评分详情', 272, 2, 'flow,page,hrcheck,atype=tjall,pnum=tjall', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(276, '薪资模版', 98, 1, 'flow,page,hrsalarm,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(277, '社保公积金', 98, 0, 'flow,page,hrshebao,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(278, '部门薪资核算', 98, 3, 'main,salary,bumen', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(279, '发票管理', 323, 10, 'flow,page,finpiao,atype=shou,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(280, '发票管理统计', 315, 11, 'flow,page,finpiaototal', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(281, '文档协作', 19, 5, 'flow,page,wordxie,atype=myxie', 'file', NULL, 'wordxie', 0, 0, NULL, 0, 0, 0),
(282, '文件传送', 19, 6, 'flow,page,wordeil,atype=my', 'signout', NULL, NULL, 0, 0, NULL, 0, 0, 0),
(283, '会议管理', 140, 12, 'flow,page,meet,atype=all,pnum=all', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(284, '模版消息', 180, 1, 'system,wxgzh,tpl', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(285, '授权微信人', 180, 2, 'system,wxgzh,user', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(286, '信息中心', 140, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(287, '通知公告', 286, 1, 'flow,page,gong,atype=all,pnum=all', 'volume-up', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(288, '新闻资讯', 286, 2, 'flow,page,news,atype=all,pnum=all', 'globe', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(295, '腾讯云相关', 1, 50, NULL, 'cloud', NULL, NULL, 1, 0, NULL, 0, 0, 1),
(296, '腾讯云API密钥', 295, 0, 'system,txcloud,cog', 'key', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(297, '人脸库管理', 295, 0, 'system,txcloud,renlian', 'user', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(298, '腾讯云对象存储', 295, 0, 'system,txcloud,objfile', 'file', NULL, NULL, 1, 0, NULL, 0, 0, 0),
(299, '销售', 63, 5, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(300, '我的销售', 299, 0, 'flow,page,custxiao,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(301, '我下属的销售', 299, 0, 'flow,page,custxiao,atype=downall,pnum=down', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(302, '所有销售', 126, 3, 'flow,page,custxiao,atype=all,pnum=all', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(303, '流程监控', 40, 9, 'main,fwork,bill,atype=jiankong', 'retweet', NULL, 'jiankong', 0, 1, NULL, 0, 0, 0),
(306, '我的公文统计', 232, 5, 'flow,page,officiatotal,atype=my', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0),
(313, '财务', 0, 8, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(315, '发票付款', 313, 3, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(317, '合同管理', 0, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(318, '财务管理', 0, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(319, '收入', 318, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(320, '支出', 318, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(321, '调转取', 318, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(322, '借入借出', 318, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(323, '开发票', 318, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(324, '费用单', 320, 0, 'flow,page,custfee,atype=custfee', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(325, '调账单', 321, 0, 'flow,page,custfinaa,atype=custfinaa', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(326, '报表管理', 0, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(327, '营业汇总表', 326, 0, 'flow,page,hzong,atype=my', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(328, '每月营业明细表', 326, 0, 'flow,page,mymx,atype=mx', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(329, '合同成本表', 326, 0, 'flow,page,htcb,atype=cb', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(330, '利润表', 326, 0, 'flow,page,lirun,atype=li', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(331, '合同应收表', 326, 0, 'flow,page,ying,atype=yin', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(332, '合同回款一览表', 326, 0, 'flow,page,huik,atype=yin', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(333, '合同成本明细', 326, 0, 'flow,page,htdt,atype=yin', NULL, NULL, NULL, 1, 0, NULL, 0, 0, 0),
(334, '基础数据', 0, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(335, '财务', 334, 0, '#', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(336, '账户维护', 335, 0, 'flow,page,account,atype=account', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(337, '费用类型', 335, 0, 'flow,page,feetype,atype=feetype', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0),
(338, '发票费率', 335, 0, 'flow,page,feelv,atype=feelv', NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_news`
--

CREATE TABLE IF NOT EXISTS `xinhu_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `typename` varchar(20) DEFAULT NULL,
  `content` text,
  `url` varchar(200) DEFAULT NULL,
  `receid` varchar(2000) DEFAULT NULL COMMENT '接收人Id',
  `recename` varchar(4000) DEFAULT NULL,
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `enddt` date DEFAULT NULL COMMENT '截止时间',
  `startdt` date DEFAULT NULL COMMENT '开始时间',
  `zuozhe` varchar(30) DEFAULT NULL COMMENT '发布者',
  `indate` date DEFAULT NULL COMMENT '日期',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `fengmian` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `mintou` smallint(6) DEFAULT '0' COMMENT '至少投票',
  `maxtou` smallint(6) DEFAULT '0' COMMENT '最多投投票0不限制',
  `issms` tinyint(1) DEFAULT '0' COMMENT '是否发短信',
  `istop` tinyint(1) DEFAULT '0' COMMENT '排序号越大越靠前',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `appxs` tinyint(1) DEFAULT '0' COMMENT 'app首页显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻资讯' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_official`
--

CREATE TABLE IF NOT EXISTS `xinhu_official` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `titles` varchar(255) DEFAULT NULL COMMENT '副标题',
  `class` varchar(10) DEFAULT NULL COMMENT '类型',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收文单,1发文单',
  `grade` varchar(10) DEFAULT NULL COMMENT '等级',
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `content` text COMMENT '内容',
  `receid` varchar(200) DEFAULT NULL COMMENT '来源',
  `recename` varchar(200) DEFAULT NULL COMMENT '发给',
  `applydt` date DEFAULT NULL COMMENT '日期',
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `optid` smallint(6) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `filecontid` varchar(30) DEFAULT NULL COMMENT '正文文件Id',
  `zinum` varchar(30) DEFAULT NULL COMMENT '发文字号',
  `unitname` varchar(200) DEFAULT NULL COMMENT '主送单位',
  `unitsame` varchar(200) DEFAULT NULL COMMENT '发文单位',
  `miji` varchar(50) DEFAULT NULL COMMENT '公文密级',
  `laidt` date DEFAULT NULL COMMENT '来文日期',
  `chaoname` varchar(200) DEFAULT NULL COMMENT '抄送单位',
  `zuncheng` varchar(200) DEFAULT NULL COMMENT '正文上称呼',
  `thid` int(11) DEFAULT '0' COMMENT '对应officialhong里id',
  `yzid` int(11) DEFAULT '0' COMMENT '对应印章sealapl里Id',
  `ffid` int(11) DEFAULT '0' COMMENT '对应分发表officialfa的Id',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `startdt` date DEFAULT NULL COMMENT '查阅日期',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  `ffdt` date DEFAULT NULL COMMENT '分发日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公文' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_officialfa`
--

CREATE TABLE IF NOT EXISTS `xinhu_officialfa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `num` varchar(30) DEFAULT NULL COMMENT '公文编号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `receid` varchar(2000) DEFAULT NULL,
  `recename` varchar(2000) DEFAULT NULL COMMENT '查阅人',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `startdt` date DEFAULT NULL COMMENT '查阅日期',
  `gwid` int(11) DEFAULT '0' COMMENT '对应公文ID',
  `unitsame` varchar(200) DEFAULT NULL COMMENT '发文',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_officialhong`
--

CREATE TABLE IF NOT EXISTS `xinhu_officialhong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officiatitle` varchar(300) DEFAULT NULL COMMENT '抬头',
  `gwtitle` varchar(200) DEFAULT NULL COMMENT '公文标题',
  `gwid` int(11) DEFAULT '0' COMMENT '公文id',
  `mbid` int(11) DEFAULT '0' COMMENT '使用模版id',
  `mbtitle` varchar(100) DEFAULT NULL COMMENT '模版名称',
  `uid` int(11) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `saveimg` varchar(100) DEFAULT NULL COMMENT '相关图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_officialmb`
--

CREATE TABLE IF NOT EXISTS `xinhu_officialmb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '模版标题',
  `fenlei` varchar(20) DEFAULT NULL COMMENT '分类',
  `receid` varchar(1000) DEFAULT NULL,
  `recename` varchar(1000) DEFAULT NULL COMMENT '可使用人',
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `explain` varchar(2000) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_option`
--

CREATE TABLE IF NOT EXISTS `xinhu_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` int(11) DEFAULT '0' COMMENT '选项类型',
  `pid` int(11) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `value` varchar(1000) DEFAULT NULL COMMENT '对应值',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `values` varchar(50) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(300) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `comid` smallint(6) DEFAULT '0' COMMENT '所属单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `num` (`num`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统选项' AUTO_INCREMENT=493 ;

--
-- 转存表中的数据 `xinhu_option`
--

INSERT INTO `xinhu_option` (`id`, `name`, `type`, `pid`, `num`, `value`, `sort`, `values`, `valid`, `optdt`, `optid`, `receid`, `recename`, `explain`, `comid`) VALUES
(4, '流程分类', 0, 1, 'flowfenlei', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(5, '考勤', 0, 4, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(6, '表单类型', 0, 1, 'flowinputtype', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(7, '文本框', 0, 6, NULL, 'text', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(8, '日期', 0, 6, NULL, 'date', 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(9, '日期时间', 0, 6, NULL, 'datetime', 2, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(10, '时间', 0, 6, NULL, 'time', 3, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(11, '隐藏文本框', 0, 6, NULL, 'hidden', 4, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(12, '选择人员(单选)', 0, 6, NULL, 'changeuser', 7, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(13, '选择人员(多选)', 0, 6, NULL, 'changeusercheck', 8, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(14, '自定义', 0, 6, NULL, 'auto', 30, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(15, '数字', 0, 6, NULL, 'number', 5, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(16, '文本域', 0, 6, NULL, 'textarea', 6, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(17, '固定值', 0, 6, NULL, 'fixed', 11, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(18, '系统选项下拉框', 0, 6, NULL, 'rockcombo', 12, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(19, '下拉框', 0, 6, NULL, 'select', 13, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(20, 'html编辑器', 0, 6, NULL, 'htmlediter', 14, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(21, '选择部门人员组', 0, 6, NULL, 'changedeptusercheck', 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(22, '单个复选框', 0, 6, NULL, 'checkbox', 15, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(23, '多个复选框', 0, 6, NULL, 'checkboxall', 16, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(24, '选择部门', 0, 6, NULL, 'changedept', 9, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(25, '行政', 0, 4, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(26, '信息类型', 0, 1, 'gongtype', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(27, '通知公告', 0, 26, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(28, '规则制度', 0, 26, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(29, '会议室', 0, 1, 'hyname', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(30, '会客室', 0, 29, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(1, '信呼', 0, 0, 'xinhu', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(32, '任务类型', 0, 151, 'worktype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(33, '任务等级', 0, 151, 'workgrade', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(34, 'bug', 0, 32, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(35, '改进', 0, 32, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(36, '设计', 0, 32, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(37, '低', 0, 33, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(38, '中', 0, 33, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(39, '高', 0, 33, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(40, '紧急', 0, 33, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(41, '任务状态', 0, 151, 'workstate', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(42, '待执行', 0, 41, NULL, '0', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(43, '执行中', 0, 41, NULL, '2', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(44, '已完成', 0, 41, NULL, '1', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(45, '中止', 0, 41, NULL, '3', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(46, '请假类型', 0, 144, 'kqqjkind', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(47, '事假', 0, 46, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(48, '病假', 0, 46, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(49, '年假', 0, 46, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(50, '客户关系', 0, 1, 'crm', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(51, 'CRM', 0, 4, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(52, '客户来源', 0, 50, 'crmlaiyuan', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(53, '销售状态', 0, 50, 'crmstate', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(54, '网上开拓', 0, 52, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(55, '电话开拓', 0, 52, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(56, '跟进中', 0, 53, NULL, '0', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(57, '已成交', 0, 53, NULL, '1', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(58, '销售来源', 0, 50, 'custsalelai', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(59, '主动来访', 0, 58, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(60, '网上联系', 0, 58, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(61, '电话销售', 0, 58, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(62, '行政选项', 0, 1, 'goods', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(63, '互联网', 0, 83, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(64, '信呼', 0, 63, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(65, '办公耗材', 0, 83, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(66, '显示器', 0, 65, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(67, '鼠标', 0, 65, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(68, '主机', 0, 65, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(357, '编程', 0, 232, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(70, '资产品牌', 0, 62, 'rockbrand', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(71, '单位', 0, 62, 'rockunit', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(72, '台', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(73, '个', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(74, '件', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(75, '箱', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(76, '年', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(77, '月', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(78, '入库类型', 0, 62, 'kutype0', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(79, '出库类型', 0, 62, 'kutype1', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(80, '采购入库', 0, 78, NULL, '0', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(81, '领用出库', 0, 79, NULL, '0', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(82, '归返入库', 0, 78, NULL, '1', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(83, '物品分类', 0, 62, 'goodstype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(84, '销售出库', 0, 79, NULL, '1', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(85, '知识信息', 0, 26, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(86, '管理员文件夹目录', 0, NULL, 'folder1', 'success', 0, NULL, 1, '2016-10-26 20:52:17', 1, NULL, NULL, NULL, 0),
(87, '技术文档', 0, 86, NULL, NULL, 20, NULL, 1, '2016-08-08 22:07:41', 1, NULL, NULL, NULL, 0),
(88, '需求文档', 0, 86, NULL, NULL, 0, NULL, 1, '2016-08-08 22:08:27', 1, NULL, NULL, NULL, 0),
(89, '图片', 0, 86, NULL, NULL, 0, NULL, 1, '2016-08-08 22:44:10', 1, 'd1', '信呼开发团队', NULL, 0),
(92, '文件夹目录', 0, NULL, 'folder3', 'success', 0, NULL, 1, '2016-10-19 19:30:59', 3, NULL, NULL, NULL, 0),
(93, '个人文件', 0, 92, NULL, NULL, 0, NULL, 1, '2016-08-09 13:57:06', 3, NULL, NULL, NULL, 0),
(95, 'js文档', 0, 89, NULL, NULL, 0, NULL, 1, '2016-08-09 22:20:23', 1, NULL, NULL, NULL, 0),
(94, 'php文档', 0, 89, NULL, NULL, 0, NULL, 1, '2016-08-09 22:20:17', 1, NULL, NULL, NULL, 0),
(98, '文件夹目录', 0, NULL, 'folder4', 'success', 0, NULL, 1, '2016-10-19 19:31:27', 4, NULL, NULL, NULL, 0),
(99, '公文选项', 0, 1, 'official', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(100, '公文类型', 0, 99, 'officialclass', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(101, '决议', 0, 100, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(102, '决定', 0, 100, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(103, '请示', 0, 100, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(104, '规定', 0, 100, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(105, '公文等级', 0, 99, 'officialgrade', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(106, '平急', 0, 105, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(107, '加急', 0, 105, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(108, '项目选项', 0, 1, 'project', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(109, '项目类型', 0, 108, 'projecttype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(110, '一般项目', 0, 109, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(111, '重要项目', 0, 109, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(112, '关键项目', 0, 109, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(113, '项目状态', 0, 108, 'projectstate', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(114, '待执行', 0, 113, NULL, '0', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(115, '执行中', 0, 113, NULL, '2', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(116, '已取消', 0, 113, NULL, '3', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(117, '已完成', 0, 113, NULL, '1', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(128, '文件夹目录', 0, NULL, 'folder8', 'success', 0, NULL, 1, '2016-10-01 17:57:12', 8, NULL, NULL, NULL, 0),
(130, '财务选项', 0, 1, 'finance', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(131, '付款方式', 0, 130, 'paytype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(132, '现金', 0, 131, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(133, '支付宝', 0, 131, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(134, '微信', 0, 131, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(135, '银行转账', 0, 131, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(136, '报销项目', 0, 130, 'finaitems', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(137, '市内交通费', 0, 136, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(138, '电话费', 0, 136, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(139, '快递费', 0, 136, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(140, '停车费', 0, 136, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(141, '文件夹目录', 0, NULL, 'folder5', 'success', 0, NULL, 1, '2016-09-08 21:13:56', 5, NULL, NULL, NULL, 0),
(143, '服务文档', 0, 128, NULL, NULL, 0, NULL, 1, '2016-09-13 11:32:22', 8, NULL, NULL, NULL, 0),
(144, '考勤选项', 0, 1, 'kaoqin', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(145, '人事考勤类型', 0, 144, 'kqkind', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(146, '增加年假', 0, 145, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(147, '增加哺乳假', 0, 145, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(148, '增加陪产假', 0, 145, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(149, '奖惩', 0, 26, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(150, '文件夹目录', 0, NULL, 'folder9', NULL, 0, NULL, 1, '2016-10-01 18:38:06', 9, NULL, NULL, NULL, 0),
(151, '任务选项', 0, 1, 'work', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(154, '人事选项', 0, 1, 'usertype', NULL, 10, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(155, '学历', 0, 154, 'xueli', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(156, '小学', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(157, '初中', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(158, '高中', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(159, '中专', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(160, '大专', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(161, '本科', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(162, '自考本科', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(163, '研究生', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(164, '博士', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(165, '其它', 0, 155, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(166, '合同类型', 0, 154, 'userhttype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(167, '劳动合同', 0, 166, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(168, '离职类型', 0, 154, 'redundtype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(169, '自动离职', 0, 168, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(170, '退休', 0, 168, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(171, '病辞', 0, 168, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(172, '辞退', 0, 168, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(173, '辞职', 0, 168, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(174, '月份', 0, 6, NULL, 'month', 17, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(175, '编号', 0, 6, NULL, 'num', 21, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(176, '客户类型', 0, 50, 'crmtype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(177, '互联网', 0, 176, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(178, '软件', 0, 176, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(179, '个体经营', 0, 176, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(180, '个人', 0, 176, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(181, '其它', 0, 176, NULL, NULL, 20, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(182, '政府机构', 0, 176, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(183, '人事调动类型', 0, 154, 'transfertype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(184, '平调', 0, 183, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(185, '晋升', 0, 183, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(186, '降职', 0, 183, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(190, '奖惩结果', 0, 154, 'rewardresult', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(191, '奖励', 0, 190, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(192, '警告', 0, 190, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(193, '辞退', 0, 190, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(194, '降职', 0, 190, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(195, '张飞文件夹目录', 0, NULL, 'folder6', 'success', 0, NULL, 1, '2016-10-24 21:27:22', 6, NULL, NULL, NULL, 0),
(196, '个人经历', 0, 195, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(197, '知识分类', 0, NULL, 'knowledgetype', NULL, 0, NULL, 1, '2016-10-27 21:10:24', 1, NULL, NULL, NULL, 0),
(198, '工作指南', 0, 197, NULL, 'title,typename,recename,zuozhe,indate,optname,caozuo', 0, NULL, 1, '2017-04-21 09:26:50', 1, NULL, NULL, NULL, 0),
(199, '工作效率', 0, 198, NULL, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(200, '工作目标', 0, 198, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(201, '规章制度', 0, 197, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(202, '工作规范', 0, 197, NULL, NULL, 0, NULL, 1, '2016-10-26 20:54:54', 1, NULL, NULL, NULL, 0),
(203, '资产分类', 0, 62, 'assetstype', NULL, 0, NULL, 1, '2016-10-27 21:14:45', 1, NULL, NULL, NULL, 0),
(204, '打印机', 0, 203, NULL, '', 0, NULL, 1, '2017-04-21 09:26:50', 1, NULL, NULL, NULL, 0),
(205, '固定资产来源', 0, 62, 'wplaiyuan', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(206, '电脑', 0, 203, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(207, '台式电脑', 0, 206, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(208, '笔记本', 0, 206, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(209, '平板', 0, 206, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(210, '一体机', 0, 206, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(211, '仓库', 0, 62, 'warehouse', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(212, '购入', 0, 205, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(213, '自建', 0, 205, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(214, '仓库1', 0, 211, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(215, '仓库2', 0, 211, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(216, '联想', 0, 70, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(217, '惠普', 0, 70, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(218, '车辆类型', 0, 327, 'cartype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(219, '小型车', 0, 218, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(220, '轿车', 0, 218, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(221, '车辆品牌', 0, 327, 'carbrand', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(222, '奔驰', 0, 221, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(223, '奥迪', 0, 221, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(224, '夏利', 0, 221, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(226, '题库分类', 0, NULL, 'knowtikutype', NULL, 0, NULL, 1, '2016-10-27 21:17:22', 1, NULL, NULL, NULL, 0),
(227, '官网知识', 0, 226, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(228, 'OA题库', 0, 226, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(229, '会议室1', 0, 29, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(230, '会议室2', 0, 29, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(231, '图书分类', 0, NULL, 'booktype', NULL, 0, NULL, 1, '2016-10-28 23:15:11', 1, NULL, NULL, NULL, 0),
(232, '计算机', 0, 231, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(233, '管理书籍', 0, 231, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(244, '印章证照类型', 0, 62, 'sealtype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(245, '合同章', 0, 244, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(246, '法人章', 0, 244, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(247, '财务章', 0, 244, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(248, '公章', 0, 244, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(249, '调休', 0, 46, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(250, '单图片上传', 0, 6, NULL, 'uploadimg', 19, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(251, '打卡异常类型', 0, 144, 'kqerrtype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(252, '忘记打卡', 0, 251, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(253, '打卡不成功', 0, 251, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(254, '邮箱文本框', 0, 6, NULL, 'email', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(255, 'gerenvcard_1选项', 0, NULL, 'gerenvcard_1', NULL, 0, NULL, 1, '2016-12-20 10:52:49', 1, NULL, NULL, NULL, 0),
(256, '同事', 0, 255, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(257, '盟友', 0, 255, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(258, '敌人', 0, 255, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(259, 'gerenvcard_8选项', 0, NULL, 'gerenvcard_8', NULL, 0, NULL, 1, '2016-12-20 11:23:21', 8, NULL, NULL, NULL, 0),
(260, '同事', 0, 259, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(261, 'gerenvcard_5选项', 0, NULL, 'gerenvcard_5', NULL, 0, NULL, 1, '2016-12-20 11:30:38', 5, NULL, NULL, NULL, 0),
(262, '弹框下拉选择(单选)', 0, 6, NULL, 'selectdatafalse', 22, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(263, '弹框下拉选择(多选)', 0, 6, NULL, 'selectdatatrue', 23, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(365, '默认1天上班小时', 0, 144, 'kqsbtime', '0', 0, NULL, 1, NULL, 0, NULL, NULL, '设置0默认读取考勤规则下的', 0),
(277, '用户bug1', 0, NULL, 'adminbug1', '2017-02-15 10:18:19', 0, NULL, 1, '2017-02-15 10:18:19', 1, NULL, NULL, NULL, 0),
(273, '文件上传(可多选)', 0, 6, NULL, 'uploadfile', 20, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(286, '模块列定义', 0, -1007, 'columns_customer_shate', 'name,suoname,type,laiyuan,unitname,isstat,caozuo', 0, NULL, 1, '2017-07-13 19:02:20', 1, NULL, NULL, NULL, 0),
(287, '模块列定义', 0, -1007, 'columns_customer_dist', 'name,suoname,type,laiyuan,unitname,isgys,linkname', 0, NULL, 1, '2017-04-21 11:55:50', 1, NULL, NULL, NULL, 0),
(288, '模块列定义', 0, -1007, 'columns_customer_', 'name,suoname,type,unitname,mobile,isstat,htshu,moneyz,moneyd,lastdt,caozuo', 0, NULL, 1, '2018-07-07 10:04:31', 1, NULL, NULL, NULL, 0),
(294, '技术姿势', 0, 226, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(295, 'PHP知识', 0, 294, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(296, 'JS知识', 0, 294, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(298, '模块列定义', 0, -1004, 'columns_work_', 'title,type,grade,dist,startdt,enddt,ddname,score,optname,optdt,caozuo', 0, NULL, 1, '2017-05-11 09:55:28', 1, NULL, NULL, NULL, 0),
(299, '模块列定义', 0, -1004, 'columns_work_all', 'title,type,grade,dist,startdt,enddt,ddname,score,mark,optname,optdt,caozuo', 0, NULL, 1, '2018-04-15 16:10:26', 1, NULL, NULL, NULL, 0),
(300, '收款章', 0, 244, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(302, '开发部文件夹目录', 0, NULL, 'deptfolderdev', NULL, 0, NULL, 1, '2017-05-27 17:36:02', 1, NULL, NULL, NULL, 0),
(303, '技术文档', 0, 302, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(304, '赵子龙文件夹目录', 0, NULL, 'folder7', 'success', 0, NULL, 1, '2017-05-27 17:49:46', 7, NULL, NULL, NULL, 0),
(305, '公文密级', 0, 99, 'officialmiji', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(306, '私密', 0, 305, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(307, '机密', 0, 305, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(308, '绝密', 0, 305, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(309, '特急', 0, 105, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(310, '特提', 0, 105, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(311, '公文文件类别', 0, 99, 'officialfiletype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(312, '中央省委', 0, 311, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(313, '单选框', 0, 6, NULL, 'radio', 24, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(320, '车辆登记类型', 0, 327, 'carotype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(321, '加油', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(322, '强险', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(323, '商业险', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(324, '行驶证', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(325, '违章', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(326, '事故', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(327, '车辆管理选项', 0, 62, 'carm', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(328, '车辆几天内提醒(多个,分开)', 0, 327, 'cartodo', '0,3,7,10,30,45', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(331, '过桥费', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(332, '高速费', 0, 320, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(333, '客户合同到期几天内提醒', 0, 50, 'crmtodo', '0,3,7,10,30,45', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(334, '可直接申请请假类型', 0, 144, 'kqsqtype', '病假,事假', 0, NULL, 1, NULL, 0, NULL, NULL, '多个,分开，没有设置的请假类型时，申请请假条需要有剩余假期才可以申请。', 0),
(335, '人员状态', 0, 154, 'userstate', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(336, '试用期', 0, 335, NULL, '0', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(337, '正式', 0, 335, NULL, '1', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(338, '实习生', 0, 335, NULL, '2', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(339, '兼职', 0, 335, NULL, '3', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(340, '临时工', 0, 335, NULL, '4', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(341, '离职', 0, 335, NULL, '5', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(342, 'gerenvcar选项', 0, NULL, 'gerenvcar', NULL, 0, NULL, 1, '2017-07-21 13:37:48', 1, NULL, NULL, NULL, 0),
(344, '支', 0, 71, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(351, '发票类型', 0, 130, 'openpiaotype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(352, '增值税普通发票', 0, 351, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(353, '增值税专用发票', 0, 351, NULL, NULL, 2, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(354, '定额发票', 0, 351, NULL, NULL, 3, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(355, '台式电脑2', 0, 206, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(356, '笔', 0, 65, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(359, '发文字号', 0, 99, 'officiazinum', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(360, '信呼', 0, 359, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(400, '定时清理数据', 0, 144, 'kqcleartime', '6', 0, NULL, 1, NULL, 0, NULL, NULL, '0不清理,1一个月前,2个月,以此类推，清理打卡记录', 0),
(363, '选择部门(多选)', 0, 6, NULL, 'changedeptcheck', 9, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(367, '初始入库', 0, 78, NULL, '2', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(368, '模块列定义', 0, -1007, 'columns_customer_gys', 'name,suoname,type,unitname,tel,address,status,linkname,explain,caozuo', 0, NULL, 1, '2017-11-11 15:04:39', 1, NULL, NULL, NULL, 0),
(369, '行政人事部文件夹目录', 0, NULL, 'deptfolder4', NULL, 0, NULL, 1, '2017-11-13 15:38:38', 4, NULL, NULL, NULL, 0),
(381, '调拨入库', 0, 78, NULL, '3', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(382, '调拨出库', 0, 79, NULL, '3', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(383, '模块列定义', 0, -1007, 'columns_customer_ghai', 'name,suoname,type,unitname,sheng,shi,status,caozuo', 0, NULL, 1, '2018-03-06 14:22:28', 1, NULL, NULL, NULL, 0),
(387, '生日短信提醒', 0, 154, 'smsbirthday', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, '对应值设置：短信模版编号为空不提醒', 0),
(418, '模块列定义', 0, -1071, 'columns_hrcheck_tjall', 'deptname,applyname,title,startdt,pfrenids,fen', 0, NULL, 1, '2018-09-07 22:23:50', 1, NULL, NULL, NULL, 0),
(417, '哺乳假', 0, 46, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(401, '系统选项', 0, 1, 'sysoption', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(402, '用户初始化', 0, 401, 'sysuserinit', '否', 0, NULL, 1, NULL, 0, NULL, NULL, '对应值写:是，就可以多次初始化用户。', 0),
(403, '短信平台', 0, 401, 'syssmsplat', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(405, '阿里云(短信服务)', 0, 403, NULL, 'alisms', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0),
(408, '自动放入公海', 0, 50, 'crmaddghai', '0', 1, NULL, 1, NULL, 0, NULL, NULL, '对应值0不限制,7天未根据自动放入公海', 0),
(409, '模块列定义', 0, -1007, 'columns_customer_all', 'name,suoname,type,unitname,isstat,isgys,htshu,moneyz,moneyd,lastdt,caozuo', 0, NULL, 1, '2018-07-07 10:21:00', 1, NULL, NULL, NULL, 0),
(410, '我短信服务', 0, 403, NULL, 'mysms', 2, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(413, '每月可申请打卡异常次数', 0, 144, 'kqerrapply', '0', 0, NULL, 1, NULL, 0, NULL, NULL, '对应值设置0不限制', 0),
(411, '加班可调休', 0, 144, 'kqjiabanuse', '0', 0, NULL, 1, NULL, 0, NULL, NULL, '加班换调休有效时间0不限制3个月内', 0),
(412, '年假可使用', 0, 144, 'kqnianjiause', '0', 0, NULL, 1, NULL, 0, NULL, NULL, '年假可使用时间0不限制,1一个月,12一年', 0),
(419, '营业执照', 0, 244, NULL, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(420, '组织机构代码证', 0, 244, NULL, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(421, '税务登记证', 0, 244, NULL, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(422, '机构信用代码证', 0, 244, NULL, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(423, '发票专用章', 0, 244, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(424, '云片网', 0, 403, NULL, 'yunpsms', 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(425, '增值税普通电子发票', 0, 351, NULL, NULL, 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(426, '自己企业', 0, 52, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(427, '公文单位', 0, 99, 'officiaunit', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(428, '信呼开发团队', 0, 427, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(429, '厦门市人民政府', 0, 427, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(430, '厦门市税务局', 0, 427, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(431, '福建省人民政府', 0, 427, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(433, '新闻分类', 0, 62, 'newstype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(434, '安全信息', 0, 433, NULL, 'home', 1, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(435, '资讯', 0, 433, NULL, 'home', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(436, '红头标题', 0, 99, 'officiatitle', '	信呼开发团队文件', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(437, '红头模版文件分类', 0, 99, 'officialmbfenlei', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(438, '通用', 0, 437, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(439, '厦门人民政府文件', 0, 436, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(440, '福建省人民政府文件', 0, 436, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(441, '信呼开发团队文件', 0, 436, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(449, 'gerenvcard_4选项', 0, NULL, 'gerenvcard_4', NULL, 0, NULL, 1, '2019-06-04 16:22:19', 4, NULL, NULL, NULL, 0),
(451, 'knowledgetype_qz选项', 0, NULL, 'knowledgetype_qz', NULL, 0, NULL, 1, '2019-06-05 18:10:38', 4, NULL, NULL, NULL, 2),
(452, 'knowtikutype_qz选项', 0, NULL, 'knowtikutype_qz', NULL, 0, NULL, 1, '2019-06-05 18:10:46', 4, NULL, NULL, NULL, 2),
(453, '泉州公司', 0, 451, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(454, '官网知识', 0, 452, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(455, '技术姿势', 0, 452, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(456, 'PHP知识', 0, 455, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(457, 'goodstype_qz选项', 0, NULL, 'goodstype_qz', NULL, 0, NULL, 1, '2019-06-06 18:50:51', 4, NULL, NULL, NULL, 2),
(458, 'assetstype_qz选项', 0, NULL, 'assetstype_qz', NULL, 0, NULL, 1, '2019-06-06 18:51:03', 4, NULL, NULL, NULL, 2),
(459, '办公耗材', 0, 457, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(460, '笔', 0, 459, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(461, '泉州资产', 0, 458, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(462, 'booktype_qz选项', 0, NULL, 'booktype_qz', NULL, 0, NULL, 1, '2019-06-07 13:26:40', 4, NULL, NULL, NULL, 2),
(463, '计算机', 0, 462, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(464, '编程', 0, 463, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(465, 'PC首页自动刷新(秒)', 0, 401, 'syshometime', '200', 0, NULL, 1, NULL, 0, NULL, NULL, '自动刷新秒数最低5秒', 0),
(466, '页面大小设置', 0, 401, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(467, '弹框默认大小', 0, 466, 'tanwidth', '900x800', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(468, '录入页最大宽', 0, 466, 'inputwidth', '750', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(469, '详情页最大宽', 0, 466, 'xiangwidth', '700', 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(471, '模块列定义', 0, -1069, 'columns_officic_', 'num,title,unitsame,optdt,caozuo', 0, NULL, 1, '2019-07-12 14:05:28', 1, NULL, NULL, NULL, 1),
(475, 'APP选项设置', 0, 401, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(476, '首页是否显示快捷应用', 0, 475, 'appsy_yyshow', '是', 0, NULL, 1, NULL, 0, NULL, NULL, '不显示对应值改成“否”', 0),
(477, '首页是否显示公告滚动图片', 0, 475, 'appsy_ggshow', '否', 0, NULL, 1, NULL, 0, NULL, NULL, '不显示对应值改成“否”', 0),
(478, '首页是否显示新闻滚动图片', 0, 475, 'appsy_xwshow', '否', 0, NULL, 1, NULL, 0, NULL, NULL, '显示对应值改成“是”', 0),
(483, '记账收入类型', 0, 130, 'finjishoutype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(484, '记账支出类型', 0, 130, 'finjizhitype', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(485, '转账', 0, 483, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(486, '产品收入', 0, 483, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(487, '转账', 0, 484, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(488, '工资', 0, 484, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(489, '报销', 0, 484, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(490, '客户合同分类', 0, 50, 'crmhtfenlei', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(491, '普通合同', 0, 490, NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0),
(492, NULL, 0, NULL, 'systemnum', '49b660424a6219c20b6c0af274040c23', 0, NULL, 1, '2019-12-11 15:07:16', 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_project`
--

CREATE TABLE IF NOT EXISTS `xinhu_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) DEFAULT '0',
  `type` varchar(20) DEFAULT NULL COMMENT '项目类型',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `status` tinyint(1) DEFAULT '0',
  `title` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '预计结束时间',
  `fuze` varchar(20) DEFAULT NULL COMMENT '负责人',
  `fuzeid` varchar(50) DEFAULT NULL,
  `runuser` varchar(100) DEFAULT NULL COMMENT '执行人员',
  `runuserid` varchar(100) DEFAULT NULL,
  `progress` smallint(6) DEFAULT '0' COMMENT '进度',
  `viewuser` varchar(100) DEFAULT NULL COMMENT '授权查看',
  `viewuserid` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '说明备注',
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_reads`
--

CREATE TABLE IF NOT EXISTS `xinhu_reads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL COMMENT '第一次浏览',
  `stotal` smallint(6) DEFAULT '1' COMMENT '流程次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `table_2` (`table`,`mid`,`optid`) USING BTREE,
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据浏览记录表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `xinhu_reads`
--

INSERT INTO `xinhu_reads` (`id`, `table`, `mid`, `optid`, `optdt`, `ip`, `web`, `adddt`, `stotal`) VALUES
(1, 'admin', 2, 2, '2019-12-11 15:26:54', '127.0.0.1', 'MSIE 11', '2019-12-11 15:26:54', 1),
(2, 'custract', 1, 1, '2019-12-11 16:03:10', '127.0.0.1', 'Chrome', '2019-12-11 16:03:10', 1),
(3, 'custract', 4, 1, '2019-12-13 11:42:30', '127.0.0.1', 'Chrome', '2019-12-12 23:07:54', 9),
(4, 'custract', 2, 1, '2019-12-13 09:40:53', '183.13.207.38', 'Chrome', '2019-12-13 09:40:53', 1),
(5, 'custfina', 3, 1, '2019-12-13 10:27:31', '127.0.0.1', 'Chrome', '2019-12-13 10:27:31', 1),
(6, 'admin', 1, 4, '2019-12-13 14:27:01', '127.0.0.1', 'Chrome', '2019-12-13 14:27:01', 1),
(7, 'admin', 4, 4, '2019-12-13 14:27:05', '127.0.0.1', 'Chrome', '2019-12-13 14:27:05', 1),
(8, 'admin', 1, 1, '2019-12-13 14:29:05', '127.0.0.1', 'MSIE 11', '2019-12-13 14:29:05', 1),
(9, 'admin', 2, 1, '2019-12-14 14:00:58', '113.118.37.147', 'Chrome', '2019-12-14 14:00:58', 1),
(10, 'custract', 6, 7, '2019-12-15 15:15:59', '183.13.203.31', 'Chrome', '2019-12-15 15:15:59', 1),
(11, 'company', 12, 1, '2019-12-15 15:18:54', '183.13.203.31', 'Chrome', '2019-12-15 15:18:54', 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_receipt`
--

CREATE TABLE IF NOT EXISTS `xinhu_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modenum` varchar(30) DEFAULT '0' COMMENT '对应模块编号',
  `modename` varchar(30) DEFAULT NULL COMMENT '模块名称',
  `table` varchar(30) DEFAULT NULL COMMENT '对应主表',
  `mid` int(11) DEFAULT '0' COMMENT '主表Id',
  `uid` int(11) DEFAULT '0' COMMENT '对应人员',
  `receid` varchar(4000) DEFAULT NULL COMMENT '发送给',
  `recename` varchar(200) DEFAULT NULL,
  `receids` varchar(4000) DEFAULT NULL COMMENT '已确认人员Id',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '内容',
  `ushuz` int(11) DEFAULT '0' COMMENT '总人数',
  `ushuy` int(11) DEFAULT '0' COMMENT '已确认',
  `status` tinyint(1) DEFAULT '1',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `modenum` (`modenum`,`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回执确认表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_repair`
--

CREATE TABLE IF NOT EXISTS `xinhu_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `assetm` varchar(100) DEFAULT NULL COMMENT '报修资产',
  `reason` varchar(500) DEFAULT NULL COMMENT '保修原因',
  `reasons` varchar(500) DEFAULT NULL COMMENT '实际原因',
  `iswx` tinyint(1) DEFAULT '0' COMMENT '需要外修',
  `money` decimal(8,2) DEFAULT '0.00' COMMENT '维修金额',
  `wxname` varchar(50) DEFAULT NULL COMMENT '维修人员',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='维修报修' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_reward`
--

CREATE TABLE IF NOT EXISTS `xinhu_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `object` varchar(30) DEFAULT NULL COMMENT '奖惩对象',
  `objectid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '奖惩类型0奖励,1处罚',
  `result` varchar(50) DEFAULT NULL COMMENT '奖惩结果',
  `money` mediumint(6) DEFAULT NULL COMMENT '奖惩金额',
  `happendt` datetime DEFAULT NULL COMMENT '发生时间',
  `hapaddress` varchar(50) DEFAULT NULL COMMENT '发生地点',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='奖惩' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_schedule`
--

CREATE TABLE IF NOT EXISTS `xinhu_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `startdt` datetime DEFAULT NULL,
  `enddt` datetime DEFAULT NULL,
  `uid` smallint(6) DEFAULT NULL COMMENT '用户Id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `mid` int(11) DEFAULT '0' COMMENT '主Id',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '频率',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `rate` varchar(5) DEFAULT NULL,
  `rateval` varchar(50) DEFAULT NULL,
  `txsj` tinyint(1) DEFAULT '0' COMMENT '是否提醒',
  `status` tinyint(1) DEFAULT '1',
  `receid` varchar(100) DEFAULT NULL,
  `recename` varchar(100) DEFAULT NULL COMMENT '提醒给',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_seal`
--

CREATE TABLE IF NOT EXISTS `xinhu_seal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '印章名称',
  `type` varchar(10) DEFAULT NULL COMMENT '印章类型',
  `bgname` varchar(50) DEFAULT NULL COMMENT '保管人',
  `bgid` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `sealimg` varchar(100) DEFAULT NULL COMMENT '对应印章图片',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `startdt` date DEFAULT NULL COMMENT '签发日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='印章表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xinhu_seal`
--

INSERT INTO `xinhu_seal` (`id`, `name`, `type`, `bgname`, `bgid`, `optdt`, `sort`, `sealimg`, `explain`, `startdt`, `enddt`, `comid`) VALUES
(1, '信呼团队收款章', '收款章', '张飞', '6', '2018-07-12 17:18:34', 0, 'http://www.rockoa.com/images/zhang_ys.png', NULL, NULL, NULL, 0),
(2, '信呼团队公章', '公章', '管理员', '1', '2017-05-18 21:04:59', 1, 'http://www.rockoa.com/images/gz.png', NULL, NULL, NULL, 0),
(3, '信呼开发团队营业执照正本', '营业执照', '管理员', '1', '2019-06-16 11:59:21', 0, '{PLATURL}upload/xinhuoa/2019-06/16_11591424.jpg', NULL, '2018-09-01', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_sealapl`
--

CREATE TABLE IF NOT EXISTS `xinhu_sealapl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `sealid` varchar(100) DEFAULT '' COMMENT '印章id',
  `sealname` varchar(200) DEFAULT NULL COMMENT '印章名称',
  `isout` tinyint(1) DEFAULT '0' COMMENT '使用方式',
  `mknum` varchar(50) DEFAULT NULL COMMENT '关联模块单据',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='印章申请使用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_sjoin`
--

CREATE TABLE IF NOT EXISTS `xinhu_sjoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `mid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type_mid` (`type`,`mid`) USING BTREE,
  KEY `type_sid` (`type`,`sid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单权限' AUTO_INCREMENT=421 ;

--
-- 转存表中的数据 `xinhu_sjoin`
--

INSERT INTO `xinhu_sjoin` (`id`, `type`, `mid`, `sid`, `indate`) VALUES
(1, 'ug', 2, 4, '2019-12-11 15:23:06'),
(9, 'um', 2, 6, '2019-12-11 15:26:44'),
(8, 'um', 2, 5, '2019-12-11 15:26:44'),
(7, 'um', 2, 3, '2019-12-11 15:26:44'),
(6, 'um', 2, 1, '2019-12-11 15:26:44'),
(10, 'um', 2, 220, '2019-12-11 15:26:44'),
(11, 'ug', 3, 4, '2019-12-11 15:34:48'),
(12, 'um', 3, 1, '2019-12-11 15:35:41'),
(13, 'um', 3, 3, '2019-12-11 15:35:41'),
(14, 'um', 3, 5, '2019-12-11 15:35:41'),
(15, 'um', 3, 6, '2019-12-11 15:35:41'),
(16, 'um', 3, 203, '2019-12-11 15:35:41'),
(17, 'um', 3, 220, '2019-12-11 15:35:41'),
(18, 'gm', 6, 1, '2019-12-13 14:06:59'),
(19, 'gm', 6, 3, '2019-12-13 14:06:59'),
(20, 'gm', 6, 5, '2019-12-13 14:06:59'),
(21, 'gm', 6, 6, '2019-12-13 14:06:59'),
(22, 'gm', 6, 7, '2019-12-13 14:06:59'),
(23, 'gm', 6, 21, '2019-12-13 14:06:59'),
(24, 'gm', 6, 22, '2019-12-13 14:06:59'),
(25, 'gm', 6, 24, '2019-12-13 14:06:59'),
(26, 'gm', 6, 26, '2019-12-13 14:06:59'),
(27, 'gm', 6, 29, '2019-12-13 14:06:59'),
(28, 'gm', 6, 34, '2019-12-13 14:06:59'),
(29, 'gm', 6, 35, '2019-12-13 14:06:59'),
(30, 'gm', 6, 63, '2019-12-13 14:06:59'),
(31, 'gm', 6, 91, '2019-12-13 14:06:59'),
(32, 'gm', 6, 121, '2019-12-13 14:06:59'),
(33, 'gm', 6, 122, '2019-12-13 14:06:59'),
(34, 'gm', 6, 126, '2019-12-13 14:06:59'),
(35, 'gm', 6, 175, '2019-12-13 14:06:59'),
(36, 'gm', 6, 176, '2019-12-13 14:06:59'),
(37, 'gm', 6, 177, '2019-12-13 14:06:59'),
(38, 'gm', 6, 178, '2019-12-13 14:06:59'),
(39, 'gm', 6, 185, '2019-12-13 14:06:59'),
(40, 'gm', 6, 186, '2019-12-13 14:06:59'),
(41, 'gm', 6, 187, '2019-12-13 14:06:59'),
(42, 'gm', 6, 188, '2019-12-13 14:06:59'),
(43, 'gm', 6, 189, '2019-12-13 14:06:59'),
(44, 'gm', 6, 190, '2019-12-13 14:06:59'),
(45, 'gm', 6, 191, '2019-12-13 14:06:59'),
(46, 'gm', 6, 203, '2019-12-13 14:06:59'),
(47, 'gm', 6, 213, '2019-12-13 14:06:59'),
(48, 'gm', 6, 218, '2019-12-13 14:06:59'),
(49, 'gm', 6, 220, '2019-12-13 14:06:59'),
(50, 'gm', 6, 229, '2019-12-13 14:06:59'),
(51, 'gm', 6, 230, '2019-12-13 14:06:59'),
(52, 'gm', 6, 264, '2019-12-13 14:06:59'),
(53, 'gm', 6, 279, '2019-12-13 14:06:59'),
(54, 'gm', 6, 280, '2019-12-13 14:06:59'),
(55, 'gm', 6, 302, '2019-12-13 14:06:59'),
(56, 'gm', 6, 313, '2019-12-13 14:06:59'),
(57, 'gm', 6, 315, '2019-12-13 14:06:59'),
(58, 'gm', 6, 317, '2019-12-13 14:06:59'),
(59, 'gm', 6, 318, '2019-12-13 14:06:59'),
(60, 'gm', 6, 319, '2019-12-13 14:06:59'),
(61, 'gm', 6, 320, '2019-12-13 14:06:59'),
(62, 'gm', 6, 321, '2019-12-13 14:06:59'),
(63, 'gm', 6, 322, '2019-12-13 14:06:59'),
(64, 'gm', 6, 323, '2019-12-13 14:06:59'),
(65, 'gm', 6, 324, '2019-12-13 14:06:59'),
(66, 'gm', 6, 325, '2019-12-13 14:06:59'),
(67, 'gm', 6, 326, '2019-12-13 14:06:59'),
(68, 'gm', 6, 327, '2019-12-13 14:06:59'),
(69, 'gm', 6, 328, '2019-12-13 14:06:59'),
(70, 'gm', 6, 329, '2019-12-13 14:06:59'),
(71, 'gm', 6, 330, '2019-12-13 14:06:59'),
(72, 'gm', 6, 331, '2019-12-13 14:06:59'),
(73, 'gm', 6, 332, '2019-12-13 14:06:59'),
(74, 'gm', 6, 334, '2019-12-13 14:06:59'),
(75, 'gm', 6, 335, '2019-12-13 14:06:59'),
(76, 'gm', 6, 336, '2019-12-13 14:06:59'),
(77, 'gm', 6, 337, '2019-12-13 14:06:59'),
(78, 'gm', 6, 338, '2019-12-13 14:06:59'),
(79, 'ug', 6, 7, '2019-12-13 14:14:20'),
(80, 'mu', 1, 7, '2019-12-13 14:14:20'),
(81, 'mu', 3, 7, '2019-12-13 14:14:20'),
(82, 'mu', 5, 7, '2019-12-13 14:14:20'),
(83, 'mu', 6, 7, '2019-12-13 14:14:20'),
(84, 'mu', 7, 7, '2019-12-13 14:14:20'),
(85, 'mu', 21, 7, '2019-12-13 14:14:20'),
(86, 'mu', 22, 7, '2019-12-13 14:14:20'),
(87, 'mu', 24, 7, '2019-12-13 14:14:20'),
(88, 'mu', 26, 7, '2019-12-13 14:14:20'),
(89, 'mu', 29, 7, '2019-12-13 14:14:20'),
(90, 'mu', 34, 7, '2019-12-13 14:14:20'),
(91, 'mu', 35, 7, '2019-12-13 14:14:20'),
(92, 'mu', 63, 7, '2019-12-13 14:14:20'),
(93, 'mu', 91, 7, '2019-12-13 14:14:20'),
(94, 'mu', 121, 7, '2019-12-13 14:14:20'),
(95, 'mu', 122, 7, '2019-12-13 14:14:20'),
(96, 'mu', 126, 7, '2019-12-13 14:14:20'),
(97, 'mu', 175, 7, '2019-12-13 14:14:20'),
(98, 'mu', 176, 7, '2019-12-13 14:14:20'),
(99, 'mu', 177, 7, '2019-12-13 14:14:20'),
(100, 'mu', 178, 7, '2019-12-13 14:14:20'),
(101, 'mu', 185, 7, '2019-12-13 14:14:20'),
(102, 'mu', 186, 7, '2019-12-13 14:14:20'),
(103, 'mu', 187, 7, '2019-12-13 14:14:20'),
(104, 'mu', 188, 7, '2019-12-13 14:14:20'),
(105, 'mu', 189, 7, '2019-12-13 14:14:20'),
(106, 'mu', 190, 7, '2019-12-13 14:14:20'),
(107, 'mu', 191, 7, '2019-12-13 14:14:20'),
(108, 'mu', 203, 7, '2019-12-13 14:14:20'),
(109, 'mu', 213, 7, '2019-12-13 14:14:20'),
(110, 'mu', 218, 7, '2019-12-13 14:14:20'),
(111, 'mu', 220, 7, '2019-12-13 14:14:20'),
(112, 'mu', 229, 7, '2019-12-13 14:14:20'),
(113, 'mu', 230, 7, '2019-12-13 14:14:20'),
(114, 'mu', 264, 7, '2019-12-13 14:14:20'),
(115, 'mu', 279, 7, '2019-12-13 14:14:20'),
(116, 'mu', 280, 7, '2019-12-13 14:14:20'),
(117, 'mu', 302, 7, '2019-12-13 14:14:20'),
(118, 'mu', 313, 7, '2019-12-13 14:14:20'),
(119, 'mu', 315, 7, '2019-12-13 14:14:20'),
(120, 'mu', 317, 7, '2019-12-13 14:14:20'),
(121, 'mu', 318, 7, '2019-12-13 14:14:20'),
(122, 'mu', 319, 7, '2019-12-13 14:14:20'),
(123, 'mu', 320, 7, '2019-12-13 14:14:20'),
(124, 'mu', 321, 7, '2019-12-13 14:14:20'),
(125, 'mu', 322, 7, '2019-12-13 14:14:20'),
(126, 'mu', 323, 7, '2019-12-13 14:14:20'),
(127, 'mu', 324, 7, '2019-12-13 14:14:20'),
(128, 'mu', 325, 7, '2019-12-13 14:14:20'),
(129, 'mu', 326, 7, '2019-12-13 14:14:20'),
(130, 'mu', 327, 7, '2019-12-13 14:14:20'),
(131, 'mu', 328, 7, '2019-12-13 14:14:20'),
(132, 'mu', 329, 7, '2019-12-13 14:14:20'),
(133, 'mu', 330, 7, '2019-12-13 14:14:20'),
(134, 'mu', 331, 7, '2019-12-13 14:14:20'),
(135, 'mu', 332, 7, '2019-12-13 14:14:20'),
(136, 'mu', 334, 7, '2019-12-13 14:14:20'),
(137, 'mu', 335, 7, '2019-12-13 14:14:20'),
(138, 'mu', 336, 7, '2019-12-13 14:14:20'),
(139, 'mu', 337, 7, '2019-12-13 14:14:20'),
(140, 'mu', 338, 7, '2019-12-13 14:14:20'),
(141, 'ug', 6, 8, '2019-12-13 14:16:42'),
(142, 'mu', 1, 8, '2019-12-13 14:16:42'),
(143, 'mu', 3, 8, '2019-12-13 14:16:42'),
(144, 'mu', 5, 8, '2019-12-13 14:16:42'),
(145, 'mu', 6, 8, '2019-12-13 14:16:42'),
(146, 'mu', 7, 8, '2019-12-13 14:16:42'),
(147, 'mu', 21, 8, '2019-12-13 14:16:42'),
(148, 'mu', 22, 8, '2019-12-13 14:16:42'),
(149, 'mu', 24, 8, '2019-12-13 14:16:42'),
(150, 'mu', 26, 8, '2019-12-13 14:16:42'),
(151, 'mu', 29, 8, '2019-12-13 14:16:42'),
(152, 'mu', 34, 8, '2019-12-13 14:16:42'),
(153, 'mu', 35, 8, '2019-12-13 14:16:42'),
(154, 'mu', 63, 8, '2019-12-13 14:16:42'),
(155, 'mu', 91, 8, '2019-12-13 14:16:42'),
(156, 'mu', 121, 8, '2019-12-13 14:16:42'),
(157, 'mu', 122, 8, '2019-12-13 14:16:42'),
(158, 'mu', 126, 8, '2019-12-13 14:16:42'),
(159, 'mu', 175, 8, '2019-12-13 14:16:42'),
(160, 'mu', 176, 8, '2019-12-13 14:16:42'),
(161, 'mu', 177, 8, '2019-12-13 14:16:42'),
(162, 'mu', 178, 8, '2019-12-13 14:16:42'),
(163, 'mu', 185, 8, '2019-12-13 14:16:42'),
(164, 'mu', 186, 8, '2019-12-13 14:16:42'),
(165, 'mu', 187, 8, '2019-12-13 14:16:42'),
(166, 'mu', 188, 8, '2019-12-13 14:16:42'),
(167, 'mu', 189, 8, '2019-12-13 14:16:42'),
(168, 'mu', 190, 8, '2019-12-13 14:16:42'),
(169, 'mu', 191, 8, '2019-12-13 14:16:42'),
(170, 'mu', 203, 8, '2019-12-13 14:16:42'),
(171, 'mu', 213, 8, '2019-12-13 14:16:42'),
(172, 'mu', 218, 8, '2019-12-13 14:16:42'),
(173, 'mu', 220, 8, '2019-12-13 14:16:42'),
(174, 'mu', 229, 8, '2019-12-13 14:16:42'),
(175, 'mu', 230, 8, '2019-12-13 14:16:42'),
(176, 'mu', 264, 8, '2019-12-13 14:16:42'),
(177, 'mu', 279, 8, '2019-12-13 14:16:42'),
(178, 'mu', 280, 8, '2019-12-13 14:16:42'),
(179, 'mu', 302, 8, '2019-12-13 14:16:42'),
(180, 'mu', 313, 8, '2019-12-13 14:16:42'),
(181, 'mu', 315, 8, '2019-12-13 14:16:42'),
(182, 'mu', 317, 8, '2019-12-13 14:16:42'),
(183, 'mu', 318, 8, '2019-12-13 14:16:42'),
(184, 'mu', 319, 8, '2019-12-13 14:16:42'),
(185, 'mu', 320, 8, '2019-12-13 14:16:42'),
(186, 'mu', 321, 8, '2019-12-13 14:16:42'),
(187, 'mu', 322, 8, '2019-12-13 14:16:42'),
(188, 'mu', 323, 8, '2019-12-13 14:16:42'),
(189, 'mu', 324, 8, '2019-12-13 14:16:42'),
(190, 'mu', 325, 8, '2019-12-13 14:16:42'),
(191, 'mu', 326, 8, '2019-12-13 14:16:42'),
(192, 'mu', 327, 8, '2019-12-13 14:16:42'),
(193, 'mu', 328, 8, '2019-12-13 14:16:42'),
(194, 'mu', 329, 8, '2019-12-13 14:16:42'),
(195, 'mu', 330, 8, '2019-12-13 14:16:42'),
(196, 'mu', 331, 8, '2019-12-13 14:16:42'),
(197, 'mu', 332, 8, '2019-12-13 14:16:42'),
(198, 'mu', 334, 8, '2019-12-13 14:16:42'),
(199, 'mu', 335, 8, '2019-12-13 14:16:42'),
(200, 'mu', 336, 8, '2019-12-13 14:16:42'),
(201, 'mu', 337, 8, '2019-12-13 14:16:42'),
(202, 'mu', 338, 8, '2019-12-13 14:16:42'),
(203, 'ug', 6, 4, '2019-12-13 14:19:51'),
(204, 'mu', 1, 4, '2019-12-13 14:19:51'),
(205, 'mu', 3, 4, '2019-12-13 14:19:51'),
(206, 'mu', 5, 4, '2019-12-13 14:19:51'),
(207, 'mu', 6, 4, '2019-12-13 14:19:51'),
(208, 'mu', 7, 4, '2019-12-13 14:19:51'),
(209, 'mu', 21, 4, '2019-12-13 14:19:51'),
(210, 'mu', 22, 4, '2019-12-13 14:19:51'),
(211, 'mu', 24, 4, '2019-12-13 14:19:51'),
(212, 'mu', 26, 4, '2019-12-13 14:19:51'),
(213, 'mu', 29, 4, '2019-12-13 14:19:51'),
(214, 'mu', 34, 4, '2019-12-13 14:19:51'),
(215, 'mu', 35, 4, '2019-12-13 14:19:51'),
(216, 'mu', 63, 4, '2019-12-13 14:19:51'),
(217, 'mu', 91, 4, '2019-12-13 14:19:51'),
(218, 'mu', 121, 4, '2019-12-13 14:19:51'),
(219, 'mu', 122, 4, '2019-12-13 14:19:51'),
(220, 'mu', 126, 4, '2019-12-13 14:19:51'),
(221, 'mu', 175, 4, '2019-12-13 14:19:51'),
(222, 'mu', 176, 4, '2019-12-13 14:19:51'),
(223, 'mu', 177, 4, '2019-12-13 14:19:51'),
(224, 'mu', 178, 4, '2019-12-13 14:19:51'),
(225, 'mu', 185, 4, '2019-12-13 14:19:51'),
(226, 'mu', 186, 4, '2019-12-13 14:19:51'),
(227, 'mu', 187, 4, '2019-12-13 14:19:51'),
(228, 'mu', 188, 4, '2019-12-13 14:19:51'),
(229, 'mu', 189, 4, '2019-12-13 14:19:51'),
(230, 'mu', 190, 4, '2019-12-13 14:19:51'),
(231, 'mu', 191, 4, '2019-12-13 14:19:51'),
(232, 'mu', 203, 4, '2019-12-13 14:19:51'),
(233, 'mu', 213, 4, '2019-12-13 14:19:51'),
(234, 'mu', 218, 4, '2019-12-13 14:19:51'),
(235, 'mu', 220, 4, '2019-12-13 14:19:51'),
(236, 'mu', 229, 4, '2019-12-13 14:19:51'),
(237, 'mu', 230, 4, '2019-12-13 14:19:51'),
(238, 'mu', 264, 4, '2019-12-13 14:19:51'),
(239, 'mu', 279, 4, '2019-12-13 14:19:51'),
(240, 'mu', 280, 4, '2019-12-13 14:19:51'),
(241, 'mu', 302, 4, '2019-12-13 14:19:51'),
(242, 'mu', 313, 4, '2019-12-13 14:19:51'),
(243, 'mu', 315, 4, '2019-12-13 14:19:51'),
(244, 'mu', 317, 4, '2019-12-13 14:19:51'),
(245, 'mu', 318, 4, '2019-12-13 14:19:51'),
(246, 'mu', 319, 4, '2019-12-13 14:19:51'),
(247, 'mu', 320, 4, '2019-12-13 14:19:51'),
(248, 'mu', 321, 4, '2019-12-13 14:19:51'),
(249, 'mu', 322, 4, '2019-12-13 14:19:51'),
(250, 'mu', 323, 4, '2019-12-13 14:19:51'),
(251, 'mu', 324, 4, '2019-12-13 14:19:51'),
(252, 'mu', 325, 4, '2019-12-13 14:19:51'),
(253, 'mu', 326, 4, '2019-12-13 14:19:51'),
(254, 'mu', 327, 4, '2019-12-13 14:19:51'),
(255, 'mu', 328, 4, '2019-12-13 14:19:51'),
(256, 'mu', 329, 4, '2019-12-13 14:19:51'),
(257, 'mu', 330, 4, '2019-12-13 14:19:51'),
(258, 'mu', 331, 4, '2019-12-13 14:19:51'),
(259, 'mu', 332, 4, '2019-12-13 14:19:51'),
(260, 'mu', 334, 4, '2019-12-13 14:19:51'),
(261, 'mu', 335, 4, '2019-12-13 14:19:51'),
(262, 'mu', 336, 4, '2019-12-13 14:19:51'),
(263, 'mu', 337, 4, '2019-12-13 14:19:51'),
(264, 'mu', 338, 4, '2019-12-13 14:19:51'),
(265, 'ug', 6, 6, '2019-12-13 16:58:32'),
(266, 'mu', 1, 6, '2019-12-13 16:58:32'),
(267, 'mu', 3, 6, '2019-12-13 16:58:32'),
(268, 'mu', 5, 6, '2019-12-13 16:58:32'),
(269, 'mu', 6, 6, '2019-12-13 16:58:32'),
(270, 'mu', 7, 6, '2019-12-13 16:58:32'),
(271, 'mu', 21, 6, '2019-12-13 16:58:32'),
(272, 'mu', 22, 6, '2019-12-13 16:58:32'),
(273, 'mu', 24, 6, '2019-12-13 16:58:32'),
(274, 'mu', 26, 6, '2019-12-13 16:58:32'),
(275, 'mu', 29, 6, '2019-12-13 16:58:32'),
(276, 'mu', 34, 6, '2019-12-13 16:58:32'),
(277, 'mu', 35, 6, '2019-12-13 16:58:32'),
(278, 'mu', 63, 6, '2019-12-13 16:58:32'),
(279, 'mu', 91, 6, '2019-12-13 16:58:32'),
(280, 'mu', 121, 6, '2019-12-13 16:58:32'),
(281, 'mu', 122, 6, '2019-12-13 16:58:32'),
(282, 'mu', 126, 6, '2019-12-13 16:58:32'),
(283, 'mu', 175, 6, '2019-12-13 16:58:32'),
(284, 'mu', 176, 6, '2019-12-13 16:58:32'),
(285, 'mu', 177, 6, '2019-12-13 16:58:32'),
(286, 'mu', 178, 6, '2019-12-13 16:58:32'),
(287, 'mu', 185, 6, '2019-12-13 16:58:32'),
(288, 'mu', 186, 6, '2019-12-13 16:58:32'),
(289, 'mu', 187, 6, '2019-12-13 16:58:32'),
(290, 'mu', 188, 6, '2019-12-13 16:58:32'),
(291, 'mu', 189, 6, '2019-12-13 16:58:32'),
(292, 'mu', 190, 6, '2019-12-13 16:58:32'),
(293, 'mu', 191, 6, '2019-12-13 16:58:32'),
(294, 'mu', 203, 6, '2019-12-13 16:58:32'),
(295, 'mu', 213, 6, '2019-12-13 16:58:32'),
(296, 'mu', 218, 6, '2019-12-13 16:58:32'),
(297, 'mu', 220, 6, '2019-12-13 16:58:32'),
(298, 'mu', 229, 6, '2019-12-13 16:58:32'),
(299, 'mu', 230, 6, '2019-12-13 16:58:32'),
(300, 'mu', 264, 6, '2019-12-13 16:58:32'),
(301, 'mu', 279, 6, '2019-12-13 16:58:32'),
(302, 'mu', 280, 6, '2019-12-13 16:58:32'),
(303, 'mu', 302, 6, '2019-12-13 16:58:32'),
(304, 'mu', 313, 6, '2019-12-13 16:58:32'),
(305, 'mu', 315, 6, '2019-12-13 16:58:32'),
(306, 'mu', 317, 6, '2019-12-13 16:58:32'),
(307, 'mu', 318, 6, '2019-12-13 16:58:32'),
(308, 'mu', 319, 6, '2019-12-13 16:58:32'),
(309, 'mu', 320, 6, '2019-12-13 16:58:32'),
(310, 'mu', 321, 6, '2019-12-13 16:58:32'),
(311, 'mu', 322, 6, '2019-12-13 16:58:32'),
(312, 'mu', 323, 6, '2019-12-13 16:58:32'),
(313, 'mu', 324, 6, '2019-12-13 16:58:32'),
(314, 'mu', 325, 6, '2019-12-13 16:58:32'),
(315, 'mu', 326, 6, '2019-12-13 16:58:32'),
(316, 'mu', 327, 6, '2019-12-13 16:58:32'),
(317, 'mu', 328, 6, '2019-12-13 16:58:32'),
(318, 'mu', 329, 6, '2019-12-13 16:58:32'),
(319, 'mu', 330, 6, '2019-12-13 16:58:32'),
(320, 'mu', 331, 6, '2019-12-13 16:58:32'),
(321, 'mu', 332, 6, '2019-12-13 16:58:32'),
(322, 'mu', 334, 6, '2019-12-13 16:58:32'),
(323, 'mu', 335, 6, '2019-12-13 16:58:32'),
(324, 'mu', 336, 6, '2019-12-13 16:58:32'),
(325, 'mu', 337, 6, '2019-12-13 16:58:32'),
(326, 'mu', 338, 6, '2019-12-13 16:58:32'),
(327, 'ug', 6, 7, '2019-12-15 15:10:49'),
(328, 'mu', 1, 7, '2019-12-15 15:10:49'),
(329, 'mu', 3, 7, '2019-12-15 15:10:49'),
(330, 'mu', 5, 7, '2019-12-15 15:10:49'),
(331, 'mu', 6, 7, '2019-12-15 15:10:49'),
(332, 'mu', 7, 7, '2019-12-15 15:10:49'),
(333, 'mu', 21, 7, '2019-12-15 15:10:49'),
(334, 'mu', 22, 7, '2019-12-15 15:10:49'),
(335, 'mu', 24, 7, '2019-12-15 15:10:49'),
(336, 'mu', 26, 7, '2019-12-15 15:10:49'),
(337, 'mu', 29, 7, '2019-12-15 15:10:49'),
(338, 'mu', 34, 7, '2019-12-15 15:10:49'),
(339, 'mu', 35, 7, '2019-12-15 15:10:49'),
(340, 'mu', 63, 7, '2019-12-15 15:10:49'),
(341, 'mu', 91, 7, '2019-12-15 15:10:49'),
(342, 'mu', 121, 7, '2019-12-15 15:10:49'),
(343, 'mu', 122, 7, '2019-12-15 15:10:49'),
(344, 'mu', 126, 7, '2019-12-15 15:10:49'),
(345, 'mu', 175, 7, '2019-12-15 15:10:49'),
(346, 'mu', 176, 7, '2019-12-15 15:10:49'),
(347, 'mu', 177, 7, '2019-12-15 15:10:49'),
(348, 'mu', 178, 7, '2019-12-15 15:10:49'),
(349, 'mu', 185, 7, '2019-12-15 15:10:49'),
(350, 'mu', 186, 7, '2019-12-15 15:10:49'),
(351, 'mu', 187, 7, '2019-12-15 15:10:49'),
(352, 'mu', 188, 7, '2019-12-15 15:10:49'),
(353, 'mu', 189, 7, '2019-12-15 15:10:49'),
(354, 'mu', 190, 7, '2019-12-15 15:10:49'),
(355, 'mu', 191, 7, '2019-12-15 15:10:49'),
(356, 'mu', 203, 7, '2019-12-15 15:10:49'),
(357, 'mu', 213, 7, '2019-12-15 15:10:49'),
(358, 'mu', 218, 7, '2019-12-15 15:10:49'),
(359, 'mu', 220, 7, '2019-12-15 15:10:49'),
(360, 'mu', 229, 7, '2019-12-15 15:10:49'),
(361, 'mu', 230, 7, '2019-12-15 15:10:49'),
(362, 'mu', 264, 7, '2019-12-15 15:10:49'),
(363, 'mu', 279, 7, '2019-12-15 15:10:49'),
(364, 'mu', 280, 7, '2019-12-15 15:10:49'),
(365, 'mu', 302, 7, '2019-12-15 15:10:49'),
(366, 'mu', 313, 7, '2019-12-15 15:10:49'),
(367, 'mu', 315, 7, '2019-12-15 15:10:49'),
(368, 'mu', 317, 7, '2019-12-15 15:10:49'),
(369, 'mu', 318, 7, '2019-12-15 15:10:49'),
(370, 'mu', 319, 7, '2019-12-15 15:10:49'),
(371, 'mu', 320, 7, '2019-12-15 15:10:49'),
(372, 'mu', 321, 7, '2019-12-15 15:10:49'),
(373, 'mu', 322, 7, '2019-12-15 15:10:49'),
(374, 'mu', 323, 7, '2019-12-15 15:10:49'),
(375, 'mu', 324, 7, '2019-12-15 15:10:49'),
(376, 'mu', 325, 7, '2019-12-15 15:10:49'),
(377, 'mu', 326, 7, '2019-12-15 15:10:49'),
(378, 'mu', 327, 7, '2019-12-15 15:10:49'),
(379, 'mu', 328, 7, '2019-12-15 15:10:49'),
(380, 'mu', 329, 7, '2019-12-15 15:10:49'),
(381, 'mu', 330, 7, '2019-12-15 15:10:49'),
(382, 'mu', 331, 7, '2019-12-15 15:10:49'),
(383, 'mu', 332, 7, '2019-12-15 15:10:49'),
(384, 'mu', 334, 7, '2019-12-15 15:10:49'),
(385, 'mu', 335, 7, '2019-12-15 15:10:49'),
(386, 'mu', 336, 7, '2019-12-15 15:10:49'),
(387, 'mu', 337, 7, '2019-12-15 15:10:49'),
(388, 'mu', 338, 7, '2019-12-15 15:10:49'),
(389, 'um', 4, 63, '2019-12-16 10:03:19'),
(390, 'um', 4, 126, '2019-12-16 10:03:19'),
(391, 'um', 4, 175, '2019-12-16 10:03:19'),
(392, 'um', 4, 186, '2019-12-16 10:03:19'),
(393, 'um', 4, 187, '2019-12-16 10:03:19'),
(394, 'um', 4, 189, '2019-12-16 10:03:19'),
(395, 'um', 4, 190, '2019-12-16 10:03:19'),
(396, 'um', 4, 191, '2019-12-16 10:03:19'),
(397, 'um', 4, 229, '2019-12-16 10:03:19'),
(398, 'um', 4, 279, '2019-12-16 10:03:19'),
(399, 'um', 4, 313, '2019-12-16 10:03:19'),
(400, 'um', 4, 317, '2019-12-16 10:03:19'),
(401, 'um', 4, 318, '2019-12-16 10:03:19'),
(402, 'um', 4, 319, '2019-12-16 10:03:19'),
(403, 'um', 4, 320, '2019-12-16 10:03:19'),
(404, 'um', 4, 321, '2019-12-16 10:03:19'),
(405, 'um', 4, 322, '2019-12-16 10:03:19'),
(406, 'um', 4, 323, '2019-12-16 10:03:19'),
(407, 'um', 4, 324, '2019-12-16 10:03:19'),
(408, 'um', 4, 325, '2019-12-16 10:03:19'),
(409, 'um', 4, 326, '2019-12-16 10:03:19'),
(410, 'um', 4, 327, '2019-12-16 10:03:19'),
(411, 'um', 4, 328, '2019-12-16 10:03:19'),
(412, 'um', 4, 329, '2019-12-16 10:03:19'),
(413, 'um', 4, 330, '2019-12-16 10:03:19'),
(414, 'um', 4, 331, '2019-12-16 10:03:19'),
(415, 'um', 4, 332, '2019-12-16 10:03:19'),
(416, 'um', 4, 334, '2019-12-16 10:03:19'),
(417, 'um', 4, 335, '2019-12-16 10:03:19'),
(418, 'um', 4, 336, '2019-12-16 10:03:19'),
(419, 'um', 4, 337, '2019-12-16 10:03:19'),
(420, 'um', 4, 338, '2019-12-16 10:03:19');

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_subscribe`
--

CREATE TABLE IF NOT EXISTS `xinhu_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '订阅标题',
  `cont` varchar(200) DEFAULT NULL COMMENT '订阅时提醒内容',
  `explain` varchar(100) DEFAULT NULL COMMENT '订阅说明',
  `optid` int(11) DEFAULT '0' COMMENT '操作人ID',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `suburl` varchar(1000) DEFAULT NULL COMMENT '订阅地址',
  `suburlpost` varchar(4000) DEFAULT NULL COMMENT '订阅地址post参数',
  `lastdt` datetime DEFAULT NULL COMMENT '最后运行时间',
  `shateid` varchar(300) DEFAULT NULL,
  `shatename` varchar(300) DEFAULT NULL COMMENT '共享给',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订阅管理表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_subscribeinfo`
--

CREATE TABLE IF NOT EXISTS `xinhu_subscribeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT '对应定ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `cont` varchar(200) DEFAULT NULL COMMENT '内容',
  `optdt` datetime DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `receid` varchar(4000) DEFAULT NULL COMMENT '发送给',
  `recename` varchar(200) DEFAULT NULL COMMENT '对应人',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订阅内容信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_tabledata153`
--

CREATE TABLE IF NOT EXISTS `xinhu_tabledata153` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '编号',
  `jindu` varchar(100) DEFAULT NULL COMMENT '进度说明',
  `yinsday` varchar(25) DEFAULT NULL COMMENT '应收款日',
  `ysjiner` double(11,2) DEFAULT NULL COMMENT '应收金额',
  `shsjiner` double(11,2) DEFAULT NULL COMMENT '实收金额',
  `kaipiao_day` varchar(25) DEFAULT NULL COMMENT '开票日期',
  `daozday` varchar(25) DEFAULT NULL COMMENT '到账日期',
  `userid` int(11) DEFAULT NULL COMMENT '操作者id',
  `writetime` varchar(25) DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=40 ;

--
-- 转存表中的数据 `xinhu_tabledata153`
--

INSERT INTO `xinhu_tabledata153` (`id`, `title`, `jindu`, `yinsday`, `ysjiner`, `shsjiner`, `kaipiao_day`, `daozday`, `userid`, `writetime`) VALUES
(39, '2019-12-004', '第四期', '2019-12-20 16:54:19', 4000.00, 4000.00, '2019-12-20 16:54:32', '2019-12-20 16:54:35', 1, '2019-12-11 16:55:05'),
(38, '2019-12-004', '第三期', '2019-12-16 16:53:56', 1000.00, 1000.00, '2019-12-18 16:54:06', '2019-12-18 16:54:10', 1, '2019-12-11 16:55:05'),
(37, '2019-12-004', '第二期', '2019-12-13 16:53:29', 1000.00, 1000.00, '2019-12-13 16:53:42', '2019-12-13 16:53:49', 1, '2019-12-11 16:55:05'),
(36, '2019-12-004', '第一期', '2019-12-11 16:53:19', 4000.00, 4000.00, '2019-12-11 16:53:24', '2019-12-11 16:53:25', 1, '2019-12-11 16:55:05'),
(35, '2019-12-003', '第四期', '2019-12-19 16:40:50', 1000.00, 1000.00, '2019-12-19 16:40:58', '2019-12-19 16:41:03', 1, '2019-12-11 16:41:33'),
(34, '2019-12-003', '第三期', '2019-12-14 16:39:22', 1000.00, 1000.00, '2019-12-14 16:39:36', '2019-12-14 16:39:39', 1, '2019-12-11 16:41:33'),
(33, '2019-12-003', '第二期', '2019-12-13 16:39:04', 6000.00, 6000.00, '2019-12-13 16:39:12', '2019-12-13 16:39:16', 1, '2019-12-11 16:41:33'),
(32, '2019-12-003', '第一期', '2019-12-11 16:38:50', 4000.00, 4000.00, '2019-12-11 16:38:54', '2019-12-11 16:38:59', 1, '2019-12-11 16:41:33'),
(31, '2019-12-002', '第三期', '2019-12-27 16:36:16', 10000.00, 10000.00, '2019-12-27 16:36:37', '2019-12-27 16:36:40', 1, '2019-12-11 16:37:40'),
(30, '2019-12-002', '第二期', '2019-12-19 16:35:43', 20000.00, 20000.00, '2019-12-19 16:35:57', '2019-12-19 16:36:03', 1, '2019-12-11 16:37:40'),
(29, '2019-12-002', '第一期', '2019-12-11 16:35:22', 10000.00, 10000.00, '2019-12-11 16:35:37', '2019-12-11 16:35:39', 1, '2019-12-11 16:37:39');

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_task`
--

CREATE TABLE IF NOT EXISTS `xinhu_task` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `fenlei` varchar(10) DEFAULT NULL COMMENT '类型分类',
  `url` varchar(100) DEFAULT NULL COMMENT '运行地址',
  `type` varchar(100) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `ratecont` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `state` tinyint(1) DEFAULT '0' COMMENT '最后状态',
  `lastdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `lastcont` varchar(500) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `todoid` varchar(200) DEFAULT NULL,
  `todoname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='计划任务' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `xinhu_task`
--

INSERT INTO `xinhu_task` (`id`, `name`, `fenlei`, `url`, `type`, `time`, `ratecont`, `status`, `state`, `lastdt`, `optdt`, `sort`, `startdt`, `lastcont`, `explain`, `todoid`, `todoname`) VALUES
(1, '流程从新匹配', '系统', 'flow,pipei', 'd,d', '00:10:00,12:10:00', '每天0,12点', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(2, '数据备份', '系统', 'sys,beifen', 'd', '00:20:00', '每天凌晨00:20', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(3, '系统升级提醒', '系统', 'sys,upgtx', 'd', '00:25:00', '每天凌晨00:25', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, '1,8', '管理员,信呼客服'),
(4, '5分钟运行1次', '系统', 'minute5,run', 'i5', '00', '每5分钟运行一次', 1, 1, '2019-11-29 15:05:00', NULL, 0, NULL, 'success', NULL, NULL, NULL),
(5, '考勤信息提醒', '考勤', 'kaoqin,todo', 'd', '09:25:00', '每天9点', 1, 0, NULL, NULL, 21, NULL, NULL, '在模块【考勤信息】下设置提醒到哪些平台。', NULL, NULL),
(6, '用户数据更新', '用户', 'sys,dataup', 'd', '00:10:00', '每天', 1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(7, '考勤分析', '考勤', 'kaoqin,anay', 'd', '02:15:00', '每天2点', 1, 0, NULL, NULL, 22, NULL, NULL, '分析全体人员昨天的考勤', NULL, NULL),
(8, '员工合同提醒', '人事', 'hr,httodo', 'd', '00:05:00', NULL, 1, 0, NULL, NULL, 30, NULL, NULL, '员工合同到期提醒，hr调用转正离职运行', '4', '大乔'),
(9, '每天运行一次', '系统', 'day,run', 'd', '07:50:00', '每天07:50', 1, 0, NULL, NULL, 0, NULL, NULL, '任务到期,固定会议,待办提醒', NULL, NULL),
(10, '每月1号分析上月考勤', '考勤', 'kaoqin,lmanay', 'm', '01 05:00:00', '每月1号5点', 1, 0, NULL, NULL, 23, NULL, NULL, '分析上月全体人员考勤', NULL, NULL),
(11, '日报统计分析', '考勤', 'kaoqin,dailyfx', 'd', '02:20:00', NULL, 1, 0, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL),
(12, '车辆信息提醒', '车辆', 'carm,run', 'd', '11:35:00', NULL, 1, 0, NULL, NULL, 40, NULL, NULL, NULL, '4', '大乔'),
(13, '客户提醒', 'CRM', 'crm,run', 'd', '08:15:00', NULL, 1, 0, NULL, NULL, 50, NULL, NULL, '客户合同待收付款提醒', NULL, NULL),
(14, '考勤每天运行', '考勤', 'kaoqin,day', 'd', '02:30:00', NULL, 1, 0, NULL, NULL, 20, NULL, NULL, '年假自动添加等', NULL, NULL),
(15, '读取打卡记录', '考勤', 'kaoqin,getdk', 'h', '15:00', '每小时', 0, 0, NULL, NULL, 25, NULL, NULL, '每小时从企业微信和钉钉上读取打卡记录', NULL, NULL),
(16, '定时清理', '系统', 'sys,clear', 'w7', '23:55:00', '每周日23点', 1, 0, NULL, NULL, 0, NULL, NULL, '每周清理日志考勤分析等', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_todo`
--

CREATE TABLE IF NOT EXISTS `xinhu_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '类型',
  `mess` varchar(500) DEFAULT NULL COMMENT '信息内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态@0|未读,1|已读',
  `optdt` datetime DEFAULT NULL COMMENT '时间',
  `table` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `readdt` datetime DEFAULT NULL COMMENT '已读时间',
  `tododt` datetime DEFAULT NULL COMMENT '提醒时间',
  `modenum` varchar(20) DEFAULT NULL COMMENT '对应模块编号',
  `url` varchar(500) DEFAULT NULL COMMENT '相关url',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='提醒消息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_tovoid`
--

CREATE TABLE IF NOT EXISTS `xinhu_tovoid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `type` tinyint(1) DEFAULT '0' COMMENT '0|作废,1|删除',
  `modename` varchar(20) DEFAULT NULL COMMENT '模块',
  `modeid` smallint(6) DEFAULT '0' COMMENT '对应模块id',
  `tonum` varchar(200) DEFAULT NULL COMMENT '作废单号',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据申请作废表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_userinfo`
--

CREATE TABLE IF NOT EXISTS `xinhu_userinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `deptname` varchar(30) DEFAULT NULL,
  `deptnames` varchar(100) DEFAULT NULL COMMENT '多部门',
  `deptallname` varchar(200) DEFAULT NULL,
  `ranking` varchar(20) DEFAULT NULL,
  `rankings` varchar(100) DEFAULT NULL COMMENT '多职位',
  `dkip` varchar(200) DEFAULT NULL,
  `dkmac` varchar(200) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0' COMMENT '状态来自userstate',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `workdate` date DEFAULT NULL COMMENT '入职时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `iskq` tinyint(1) DEFAULT '1' COMMENT '是否考勤',
  `isdwdk` tinyint(1) DEFAULT '0' COMMENT '是否定位打卡',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `xueli` varchar(20) DEFAULT NULL,
  `birtype` tinyint(1) DEFAULT '0' COMMENT '0阳历1农历',
  `minzu` varchar(20) DEFAULT NULL COMMENT '民族',
  `hunyin` varchar(10) DEFAULT NULL COMMENT '婚姻',
  `jiguan` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `nowdizhi` varchar(50) DEFAULT NULL COMMENT '现住址',
  `housedizhi` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `syenddt` date DEFAULT NULL COMMENT '试用期到',
  `positivedt` date DEFAULT NULL COMMENT '转正日期',
  `bankname` varchar(50) DEFAULT NULL COMMENT '开户行',
  `banknum` varchar(30) DEFAULT NULL COMMENT '工资卡帐号',
  `zhaopian` varchar(100) DEFAULT NULL COMMENT '照片',
  `idnum` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `spareman` varchar(30) DEFAULT NULL COMMENT '备用联系人',
  `sparetel` varchar(50) DEFAULT NULL COMMENT '备用联系人电话',
  `isdaily` tinyint(4) DEFAULT '1' COMMENT '是否需要写日报',
  `companyid` int(11) DEFAULT '0' COMMENT '所在公司单位Id',
  `finger` varchar(20) DEFAULT NULL COMMENT '关联考勤机人员编号',
  `dwid` varchar(50) DEFAULT NULL COMMENT '加入单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户档案表';

--
-- 转存表中的数据 `xinhu_userinfo`
--

INSERT INTO `xinhu_userinfo` (`id`, `name`, `num`, `deptname`, `deptnames`, `deptallname`, `ranking`, `rankings`, `dkip`, `dkmac`, `state`, `sex`, `tel`, `mobile`, `workdate`, `email`, `quitdt`, `iskq`, `isdwdk`, `birthday`, `xueli`, `birtype`, `minzu`, `hunyin`, `jiguan`, `nowdizhi`, `housedizhi`, `syenddt`, `positivedt`, `bankname`, `banknum`, `zhaopian`, `idnum`, `spareman`, `sparetel`, `isdaily`, `companyid`, `finger`, `dwid`) VALUES
(2, '一本账科技', NULL, '壹本帐集团', NULL, '壹本帐集团', '系统管理员', NULL, NULL, NULL, 0, '男', NULL, '13410101779', '2019-12-11', NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL),
(1, '管理员', 'A001', '壹本账科技', NULL, '壹本帐集团/壹本账科技', '项目主管', NULL, NULL, NULL, 0, '男', '0592-1234569', '15800000023', '2016-06-01', NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '1,6,5'),
(3, '分公司AA', NULL, '分公司A', NULL, '壹本帐集团/分公司A', '系统管理员', NULL, NULL, NULL, 0, '男', NULL, '1592003122', '2019-12-11', NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL),
(4, '阿达', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL),
(5, '54646', '2019-12-006', '壹本帐集团', NULL, '壹本帐集团', '看了看', NULL, NULL, NULL, 0, '男', NULL, '15021121212121', '2019-12-13', NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(6, 'Beyond', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 11, NULL, NULL),
(7, '周先生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_userinfos`
--

CREATE TABLE IF NOT EXISTS `xinhu_userinfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表userinfo.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `rank` varchar(50) DEFAULT NULL COMMENT '职位',
  `unitname` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `sslx` tinyint(1) DEFAULT '0' COMMENT '0工作经历,1教育经历',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人员档案子表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_userract`
--

CREATE TABLE IF NOT EXISTS `xinhu_userract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `uid` smallint(6) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `httype` varchar(30) DEFAULT NULL COMMENT '合同类型',
  `state` tinyint(1) DEFAULT '0' COMMENT '0|待执行,1|生效中,2|已终止,3|已过期',
  `tqenddt` date DEFAULT NULL COMMENT '提前终止',
  `company` varchar(50) DEFAULT NULL COMMENT '签署公司',
  `uname` varchar(20) DEFAULT NULL COMMENT '签署人',
  `companyid` smallint(6) DEFAULT '0' COMMENT '签署公司Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户合同表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_vcard`
--

CREATE TABLE IF NOT EXISTS `xinhu_vcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `optdt` datetime DEFAULT NULL,
  `uid` smallint(6) DEFAULT '0',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `gname` varchar(20) DEFAULT NULL COMMENT '所在组名',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `unitname` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='个人通讯录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_worc`
--

CREATE TABLE IF NOT EXISTS `xinhu_worc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '文档分区名称',
  `recename` varchar(500) DEFAULT NULL COMMENT '可查看人员',
  `receid` varchar(500) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `guanname` varchar(500) DEFAULT NULL COMMENT '管理人员',
  `guanid` varchar(500) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `uid` int(11) DEFAULT '0' COMMENT '所属用户',
  `optname` varchar(30) DEFAULT NULL COMMENT '创建人',
  `uptype` varchar(100) DEFAULT NULL COMMENT '限制上传类型',
  `upuserid` varchar(500) DEFAULT '' COMMENT '可上传人员ID',
  `upuser` varchar(500) DEFAULT '' COMMENT '可上传人员',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档分区表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `xinhu_worc`
--

INSERT INTO `xinhu_worc` (`id`, `name`, `recename`, `receid`, `sort`, `guanname`, `guanid`, `optdt`, `uid`, `optname`, `uptype`, `upuserid`, `upuser`, `comid`) VALUES
(1, '公共文档区', '信呼开发团队', 'd1', 0, '信呼开发团队', 'd1', '2018-09-13 10:50:01', 1, '管理员', NULL, '', '', 0),
(2, '信呼开发团队', '信呼开发团队', 'd1', 1, NULL, NULL, '2017-11-17 20:25:42', 1, '管理员', NULL, '', '', 0),
(4, '小乔的文件分区', '小乔', 'u3', 0, '小乔', 'u3', '2017-11-20 11:50:04', 3, '小乔', NULL, '', '', 0),
(5, '大乔分区1', '大乔', 'u4', 0, NULL, NULL, '2019-06-05 17:23:42', 4, '大乔', NULL, '', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_word`
--

CREATE TABLE IF NOT EXISTS `xinhu_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `fileid` int(11) DEFAULT '0',
  `shateid` varchar(200) DEFAULT NULL,
  `shate` varchar(200) DEFAULT NULL COMMENT '分享给我的',
  `optdt` datetime DEFAULT NULL,
  `typeid` smallint(6) DEFAULT '0' COMMENT '对应类型',
  `cid` int(11) DEFAULT '0' COMMENT '文档分区ID',
  `type` tinyint(1) DEFAULT '0' COMMENT '0文件,1文件夹',
  `sort` smallint(1) DEFAULT '0' COMMENT '排序号',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `typeid` (`typeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wordeil`
--

CREATE TABLE IF NOT EXISTS `xinhu_wordeil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `filecontid` varchar(100) DEFAULT NULL COMMENT '相关文件',
  `qianname` varchar(50) DEFAULT NULL COMMENT '签收人',
  `qiannameid` varchar(50) DEFAULT NULL COMMENT '签收人的ID',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件传送' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wordxie`
--

CREATE TABLE IF NOT EXISTS `xinhu_wordxie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '文档名称',
  `fenlei` varchar(50) DEFAULT NULL COMMENT '分类',
  `wtype` varchar(20) DEFAULT NULL COMMENT '文档类型',
  `optname` varchar(20) DEFAULT NULL,
  `optid` int(11) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `xiename` varchar(500) DEFAULT NULL COMMENT '协作人',
  `xienameid` varchar(500) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '可查看人',
  `receid` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `fileid` int(11) DEFAULT '0',
  `explian` varchar(2000) DEFAULT NULL COMMENT '说明',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档协作' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_work`
--

CREATE TABLE IF NOT EXISTS `xinhu_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `type` varchar(20) DEFAULT NULL COMMENT '任务类型',
  `grade` varchar(10) DEFAULT NULL COMMENT '任务等级',
  `distid` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL COMMENT '分配给',
  `explain` varchar(4000) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '结束时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态',
  `txdt` datetime DEFAULT NULL,
  `fen` smallint(6) DEFAULT '0' COMMENT '分值',
  `status` tinyint(1) DEFAULT '1',
  `projectid` smallint(6) DEFAULT '0' COMMENT '对应项目Id',
  `ddid` varchar(50) DEFAULT NULL,
  `ddname` varchar(50) DEFAULT NULL COMMENT '督导人员，不填默认上级',
  `score` smallint(6) DEFAULT '0' COMMENT '任务分数',
  `mark` smallint(6) DEFAULT '0' COMMENT '得分',
  `uid` smallint(6) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `comid` smallint(6) DEFAULT '0' COMMENT '对应单位id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wotpl`
--

CREATE TABLE IF NOT EXISTS `xinhu_wotpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` varchar(100) DEFAULT NULL COMMENT '模版消息id',
  `title` varchar(50) DEFAULT NULL COMMENT '模板标题',
  `primary_industry` varchar(50) DEFAULT NULL COMMENT '模板所属行业的一级行业',
  `deputy_industry` varchar(50) DEFAULT NULL COMMENT '模板所属行业的二级行业',
  `content` varchar(1000) DEFAULT NULL COMMENT '模板内容',
  `example` varchar(500) DEFAULT NULL COMMENT '模板示例',
  `modename` varchar(50) DEFAULT NULL COMMENT '使用名称',
  `modeparams` varchar(500) DEFAULT NULL COMMENT '参数设置',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信公众号消息模版' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wouser`
--

CREATE TABLE IF NOT EXISTS `xinhu_wouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '绑定用户Id',
  `openid` varchar(100) DEFAULT '微信openid',
  `nickname` varchar(30) DEFAULT NULL COMMENT '微信昵称',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别1男2女0未知',
  `province` varchar(30) DEFAULT NULL COMMENT '省份',
  `city` varchar(30) DEFAULT NULL COMMENT '城市',
  `country` varchar(30) DEFAULT NULL COMMENT '国家',
  `headimgurl` varchar(300) DEFAULT NULL COMMENT '微信头像',
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信用户信息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wxqy_agent`
--

CREATE TABLE IF NOT EXISTS `xinhu_wxqy_agent` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `agentid` varchar(20) DEFAULT '0' COMMENT '应用Id',
  `sort` smallint(6) DEFAULT '0',
  `square_logo_url` varchar(500) DEFAULT NULL,
  `redirect_domain` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `allow_userinfos` varchar(4000) DEFAULT NULL,
  `allow_partys` varchar(4000) DEFAULT NULL,
  `allow_tags` varchar(500) DEFAULT NULL,
  `close` tinyint(1) DEFAULT '0' COMMENT '是否被禁用',
  `report_location_flag` tinyint(1) DEFAULT '0' COMMENT '@地理位置上报 0：不上报；1：进入会话上报；2：持续上报',
  `isreportenter` tinyint(1) DEFAULT '0' COMMENT '是否上报用户进入应用事件',
  `isreportuser` tinyint(1) DEFAULT '0' COMMENT '是否接收用户变更通知',
  `home_url` varchar(200) DEFAULT NULL,
  `secret` varchar(100) DEFAULT NULL COMMENT 'secret管理密钥',
  `menujson` varchar(2000) DEFAULT NULL COMMENT '菜单json数组',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `agentid` (`agentid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wxqy_dept`
--

CREATE TABLE IF NOT EXISTS `xinhu_wxqy_dept` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wxqy_user`
--

CREATE TABLE IF NOT EXISTS `xinhu_wxqy_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `weixinid` varchar(50) DEFAULT NULL COMMENT '保存快捷登录时DeviceId',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态@1|已关注,2|已冻结,4|未关注',
  `avatar` varchar(300) DEFAULT NULL COMMENT '头像url',
  `enable` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  `isleader` tinyint(1) DEFAULT '0' COMMENT '标示是否为上级',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  `wxplugin_status` tinyint(1) DEFAULT '0' COMMENT '关注微信插件的状态',
  PRIMARY KEY (`id`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_wxtx_renlian`
--

CREATE TABLE IF NOT EXISTS `xinhu_wxtx_renlian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personname` varchar(50) DEFAULT NULL,
  `personid` varchar(100) NOT NULL DEFAULT '' COMMENT '人员id',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `faceids` varchar(500) DEFAULT NULL COMMENT '包含的人脸照片列表',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `uid` int(11) DEFAULT '0' COMMENT '关联用户ID',
  `imgurl` varchar(500) DEFAULT NULL COMMENT '人脸图片',
  PRIMARY KEY (`id`,`personid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_zding_agent`
--

CREATE TABLE IF NOT EXISTS `xinhu_zding_agent` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `agentid` varchar(20) DEFAULT '0' COMMENT '应用Id',
  `sort` smallint(6) DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `ismr` tinyint(1) DEFAULT '0' COMMENT '是否默认找不到应用发这里',
  `color` varchar(6) DEFAULT NULL COMMENT '应用提醒颜色rgb格式',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `agentid` (`agentid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_zding_dept`
--

CREATE TABLE IF NOT EXISTS `xinhu_zding_dept` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `bmid` int(11) DEFAULT '0' COMMENT '部门Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `xinhu_zding_user`
--

CREATE TABLE IF NOT EXISTS `xinhu_zding_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL DEFAULT '',
  `dingid` varchar(100) DEFAULT NULL COMMENT '钉钉ID',
  `name` varchar(20) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态@1|已关注',
  `avatar` varchar(300) DEFAULT NULL COMMENT '头像url',
  `enable` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  `isleader` tinyint(1) DEFAULT '0' COMMENT '标示是否为上级',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `order` int(11) DEFAULT '0' COMMENT '排序号',
  `jobnumber` varchar(30) DEFAULT NULL COMMENT '员工工号',
  `orgemail` varchar(100) DEFAULT NULL COMMENT '员工的企业邮箱',
  `hireddate` date DEFAULT NULL COMMENT '入住日期',
  PRIMARY KEY (`id`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 视图结构 `two`
--
DROP TABLE IF EXISTS `two`;

CREATE ALGORITHM=UNDEFINED DEFINER=`yibenzhang_cicsc`@`183.13.203.31` SQL SECURITY DEFINER VIEW `two` AS select `c`.`num` AS `num`,`u`.`name` AS `custname`,ifnull(`c`.`money`,0) AS `htmoney`,(`c`.`money` - `s`.`money`) AS `daishou`,`s`.`money` AS `yishou`,`c`.`applydt` AS `dayt` from ((`xinhu_custract` `c` left join `xinhu_custfina` `s` on((`c`.`id` = `s`.`htid`))) left join `xinhu_customer` `u` on((`c`.`uid` = `u`.`id`))) where (`s`.`ispay` = 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
