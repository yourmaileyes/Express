/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : expressmanager

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2018-11-13 15:08:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `id` varchar(255) NOT NULL default '',
  `password` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `pt` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('20151612203', '123456', '上海仓', null, null, null);
INSERT INTO `adminuser` VALUES ('20151612204', '123456', '北京仓', null, null, null);
INSERT INTO `adminuser` VALUES ('20151612205', '123456', '太原仓', null, null, null);
INSERT INTO `adminuser` VALUES ('20151612206', '123456', '员工', '12346579876', '杜', '北京仓');
INSERT INTO `adminuser` VALUES ('20151612207', '123456', '员工', '13426549876', '胡', '太原仓');
INSERT INTO `adminuser` VALUES ('2018111221394319', '123456', null, null, null, '北京仓');
INSERT INTO `adminuser` VALUES ('2018111221473918', '123456', null, null, null, '北京仓');
INSERT INTO `adminuser` VALUES ('2018111221484614', '123456', null, null, null, '太原仓');
INSERT INTO `adminuser` VALUES ('2018111221510018', '123123', null, null, null, null);
INSERT INTO `adminuser` VALUES ('2018111221524619', '123123', null, null, null, null);
INSERT INTO `adminuser` VALUES ('2018111311364319', '123456', '员工', '123465987845', '曹', '上海仓');
INSERT INTO `adminuser` VALUES ('admin', 'admin', 'admin', null, null, null);

-- ----------------------------
-- Table structure for `express`
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `id` varchar(255) NOT NULL default '',
  `fromlocation` varchar(255) default NULL,
  `tolocation` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `posttime` datetime default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES ('201811121033131223', '北京市123123123123', '上海市123123123123收13123123', '123123', '2018-11-12 10:33:13', '已签收，感谢您使用本快递系统');
INSERT INTO `express` VALUES ('201811121503141933', '北京市珠宝学院杜张雄', '吕梁市孝义市杜张雄收14071320866', '14701320866', '2018-11-12 15:03:14', '已签收，感谢您使用本快递系统');
INSERT INTO `express` VALUES ('201811130937591138', '太原市123123', '上海市123123收123', '123', '2018-11-13 09:37:59', '正在揽收，快递员：胡,电话：13426549876');
INSERT INTO `express` VALUES ('201811130939401438', '北京市123123', '上海市123123收123', '123', '2018-11-13 09:39:40', '已签收，感谢您使用本快递系统');
INSERT INTO `express` VALUES ('201811130939511865', '北京市123123', '上海市123123收123', '123', '2018-11-13 09:39:51', '已确认收货，感谢您的使用！');
INSERT INTO `express` VALUES ('201811131404591692', '北京市珠宝学院杜张雄2', '太原市ttt杜张雄收14071320866', '14701320866', '2018-11-13 14:04:59', '已签收，感谢您使用本快递系统');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logid` int(255) NOT NULL auto_increment,
  `expressid` varchar(255) default NULL,
  `context` varchar(255) default NULL,
  `time` datetime default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', null, null, null, null);
INSERT INTO `log` VALUES ('3', '201811121033131223', '揽收成功！', '2018-11-12 10:56:45', null);
INSERT INTO `log` VALUES ('4', '201811121033131223', '北京仓已入库', '2018-11-12 14:30:42', null);
INSERT INTO `log` VALUES ('6', '201811121033131223', '已签收', '2018-11-12 14:32:58', '0');
INSERT INTO `log` VALUES ('7', '201811121503141933', '揽收成功！', '2018-11-12 15:05:02', null);
INSERT INTO `log` VALUES ('8', '201811121503141933', '北京仓已入库', '2018-11-12 15:05:55', null);
INSERT INTO `log` VALUES ('12', '201811121503141933', '北京仓已入库', '2018-11-12 22:23:24', null);
INSERT INTO `log` VALUES ('13', '201811121503141933', '北京仓已出库，发往下一目的地', '2018-11-12 22:26:01', null);
INSERT INTO `log` VALUES ('14', '201811121503141933', '太原仓已入库', '2018-11-12 22:26:22', null);
INSERT INTO `log` VALUES ('15', '201811121503141933', '太原仓已出库，发往下一目的地', '2018-11-12 22:26:27', null);
INSERT INTO `log` VALUES ('16', '201811121503141933', '员工已出库，发往下一目的地', '2018-11-12 22:27:05', null);
INSERT INTO `log` VALUES ('17', '201811121503141933', '派件中，快递员：胡电话：13426549876请确保电话畅通！', '2018-11-12 22:28:01', null);
INSERT INTO `log` VALUES ('18', '201811121503141933', '员工已入库', '2018-11-12 22:28:17', null);
INSERT INTO `log` VALUES ('19', '201811121503141933', '已签收', '2018-11-12 22:29:16', '0');
INSERT INTO `log` VALUES ('20', '201811130937591138', '快递员：胡已出发,联系电话13426549876', '2018-11-13 11:19:40', null);
INSERT INTO `log` VALUES ('21', '201811121033131223', '快递员：杜已出发,联系电话12346579876', '2018-11-13 11:20:34', null);
INSERT INTO `log` VALUES ('22', '201811121033131223', '已签收', '2018-11-13 11:25:42', '0');
INSERT INTO `log` VALUES ('24', '201811130939511865', '快递员：杜已出发,联系电话12346579876', '2018-11-13 11:29:21', null);
INSERT INTO `log` VALUES ('25', '201811130939511865', '已签收', '2018-11-13 11:29:41', '0');
INSERT INTO `log` VALUES ('26', '201811130939511865', '已签收', '2018-11-13 11:31:21', '0');
INSERT INTO `log` VALUES ('27', '201811130939511865', '已签收', '2018-11-13 11:31:53', '0');
INSERT INTO `log` VALUES ('28', '201811130939401438', '快递员：杜已出发,联系电话12346579876', '2018-11-13 11:32:42', null);
INSERT INTO `log` VALUES ('29', '201811130939401438', '揽收成功！', '2018-11-13 11:33:01', null);
INSERT INTO `log` VALUES ('30', '201811130939401438', '北京仓已入库', '2018-11-13 11:33:33', null);
INSERT INTO `log` VALUES ('31', '201811130939401438', '北京仓已出库，发往下一目的地', '2018-11-13 11:33:38', null);
INSERT INTO `log` VALUES ('32', '201811130939401438', '上海仓已入库', '2018-11-13 11:36:05', null);
INSERT INTO `log` VALUES ('33', '201811130939401438', '派件中，快递员：曹,电话：123465987845,请确保电话畅通！', '2018-11-13 11:38:56', null);
INSERT INTO `log` VALUES ('34', '201811130939401438', '已签收', '2018-11-13 11:39:47', '0');
INSERT INTO `log` VALUES ('35', '201811131404591692', '快递员：杜已出发,联系电话12346579876', '2018-11-13 14:06:20', null);
INSERT INTO `log` VALUES ('36', '201811131404591692', '揽收成功！', '2018-11-13 14:07:12', null);
INSERT INTO `log` VALUES ('37', '201811131404591692', '北京仓已入库', '2018-11-13 14:07:38', null);
INSERT INTO `log` VALUES ('38', '201811131404591692', '北京仓已出库，发往下一目的地', '2018-11-13 14:07:54', null);
INSERT INTO `log` VALUES ('39', '201811131404591692', '太原仓已入库', '2018-11-13 14:08:28', null);
INSERT INTO `log` VALUES ('40', '201811131404591692', '派件中，快递员：胡,电话：13426549876,请确保电话畅通！', '2018-11-13 14:09:00', null);
INSERT INTO `log` VALUES ('41', '201811131404591692', '已签收', '2018-11-13 14:09:11', '0');
INSERT INTO `log` VALUES ('42', '201811130939511865', '已确认收货，感谢您的使用！', '2018-11-13 14:50:57', '0');
INSERT INTO `log` VALUES ('43', '201811130939511865', '已确认收货，感谢您的使用！', '2018-11-13 14:55:07', '0');
