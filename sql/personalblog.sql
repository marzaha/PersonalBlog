/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : personalblog

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-11-05 16:30:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diary
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `headimage` varchar(255) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `sex` int(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `constellation` varchar(50) DEFAULT NULL,
  `hobby` varchar(50) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
