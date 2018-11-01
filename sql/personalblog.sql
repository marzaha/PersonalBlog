/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : personalblog

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-11-01 17:03:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', 'jiang', '123456', '5');
INSERT INTO `user` VALUES ('21', 'lofts', '123456', '32');
