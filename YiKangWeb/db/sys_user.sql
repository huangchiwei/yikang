/*
Navicat MySQL Data Transfer

Source Server         : MySQL01
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : yikang

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2014-11-06 21:11:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` bigint(20) NOT NULL auto_increment,
  `AddTime` date default NULL,
  `Address` varchar(255) default NULL,
  `Email` varchar(255) default NULL,
  `Gender` int(11) default '1',
  `LoginName` varchar(200) NOT NULL,
  `Mobile` varchar(255) default NULL,
  `Pwd` varchar(200) NOT NULL,
  `Status` int(11) default '1',
  `SuperManager` int(11) default '0',
  `UpdateTime` date default NULL,
  `UserName` varchar(200) NOT NULL,
  `Creater` bigint(20) default NULL,
  `Updater` bigint(20) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_USER_UPDATER` (`Updater`),
  KEY `FK_USER_CREATER` (`Creater`),
  CONSTRAINT `FK_USER_CREATER` FOREIGN KEY (`Creater`) REFERENCES `sys_user` (`ID`),
  CONSTRAINT `FK_USER_UPDATER` FOREIGN KEY (`Updater`) REFERENCES `sys_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, null, null, '1', 'admin', null, 'C8sdBdxcsMVwEnDET0SZqfhOkISsjUB4vVPzf6G/OS88uRfag3GdXRZasB0s/NFdPcahqsUQWOn72cirf1BpNw==', '1', '0', null, '超级管理员', null, null);
