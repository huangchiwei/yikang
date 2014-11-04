/*
Navicat MySQL Data Transfer

Source Server         : MySQL01
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : yikang

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2014-11-04 22:49:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `ad_position`;
CREATE TABLE `ad_position` (
  `ID` int(11) NOT NULL auto_increment,
  `PosName` varchar(255) default NULL,
  `Width` int(11) default NULL,
  `Height` int(11) default NULL,
  `Des` varchar(500) default NULL COMMENT '描述',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位置';

-- ----------------------------
-- Records of ad_position
-- ----------------------------

-- ----------------------------
-- Table structure for `advert`
-- ----------------------------
DROP TABLE IF EXISTS `advert`;
CREATE TABLE `advert` (
  `ID` bigint(20) NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `AdPositionId` int(11) default NULL COMMENT '位置',
  `Url` varchar(500) default NULL,
  `Img` varchar(255) default NULL,
  `IsShow` int(11) default NULL,
  `OrderNo` int(11) default NULL,
  `Creater` varchar(255) default NULL,
  `CreatDate` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of advert
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CategoryId` varchar(255) default NULL COMMENT '分类',
  `Title` varchar(200) default NULL COMMENT '标题',
  `Content` longtext COMMENT '文档内容',
  `Digest` text COMMENT '摘要',
  `From` varchar(255) default NULL COMMENT '来源',
  `Author` varchar(50) default NULL COMMENT '作者',
  `CreateTime` varchar(20) default NULL COMMENT '文档创建时间',
  `RealTime` varchar(20) default NULL COMMENT '文档原始时间',
  `OrderNo` int(18) default NULL COMMENT '显示次序',
  `Status` varchar(4) default NULL COMMENT '文档当前状态(外键)',
  `CreateUser` varchar(100) default NULL COMMENT '创建用户',
  `LastUpdateUser` varchar(100) default NULL COMMENT '最后更新人',
  `LastUpdateTime` varchar(20) default NULL COMMENT '最后更新时间',
  `IsTop` int(18) default NULL COMMENT '是否置顶',
  `IsRecommend` int(18) default NULL COMMENT '是否推荐',
  `Clicks` int(18) default NULL COMMENT '阅读次数',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_category`
-- ----------------------------
DROP TABLE IF EXISTS `news_category`;
CREATE TABLE `news_category` (
  `ID` int(11) NOT NULL auto_increment,
  `CategoryName` varchar(255) default NULL,
  `OrderNo` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯类型';

-- ----------------------------
-- Records of news_category
-- ----------------------------
INSERT INTO `news_category` VALUES ('1', '法律法规', null);
