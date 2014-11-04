/*
Navicat MySQL Data Transfer

Source Server         : MySQL01
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : yikang

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2014-11-04 20:47:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` bigint(20) NOT NULL auto_increment,
  `Category` varchar(255) default NULL COMMENT '分类',
  `Title` varchar(200) default NULL COMMENT '标题',
  `SubTitle` text COMMENT '子标题',
  `Content` longtext COMMENT '文档内容',
  `Digest` text COMMENT '摘要',
  `From` varchar(255) default NULL COMMENT '来源',
  `Author` varchar(50) default NULL COMMENT '作者',
  `Auditor` varchar(50) default NULL COMMENT '审核人员',
  `PubTime` varchar(20) default NULL COMMENT '文档最后发布时间',
  `CreateTime` varchar(20) default NULL COMMENT '文档创建时间',
  `RealTime` varchar(20) default NULL COMMENT '文档原始时间',
  `OrderNo` int(18) default NULL COMMENT '显示次序',
  `Status` varchar(4) default NULL COMMENT '文档当前状态(外键)',
  `CreateUser` varchar(100) default NULL COMMENT '创建用户',
  `LastUpdateUser` varchar(100) default NULL COMMENT '最后更新人',
  `LastUpdateTime` varchar(20) default NULL COMMENT '最后更新时间',
  `PubUser` varchar(100) default NULL COMMENT '发布人',
  `AuditTime` varchar(20) default NULL COMMENT '审核时间',
  `IsTop` int(18) default NULL COMMENT '是否置顶',
  `IsRecommend` int(18) default NULL COMMENT '是否推荐',
  `Clicks` int(18) default NULL COMMENT '阅读次数',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档表';

-- ----------------------------
-- Records of news
-- ----------------------------
