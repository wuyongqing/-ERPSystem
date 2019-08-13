/*
Navicat MySQL Data Transfer

Source Server         : newroot
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : erpsystem

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-07-26 17:32:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ab01
-- ----------------------------
DROP TABLE IF EXISTS `ab01`;
CREATE TABLE `ab01` (
  `aab101` int(11) NOT NULL AUTO_INCREMENT,
  `aab102` varchar(6) NOT NULL,
  `aab103` varchar(13) NOT NULL,
  `aab104` varchar(20) NOT NULL,
  `aab105` date NOT NULL,
  `aab106` char(1) NOT NULL COMMENT '1---男\n            2---女\n            3---不确定',
  `aab107` char(2) NOT NULL,
  `aab108` varchar(50) NOT NULL,
  `aab109` varchar(15) NOT NULL,
  `aab110` varchar(50) NOT NULL,
  `aab111` int(11) NOT NULL,
  `aab112` varchar(6) NOT NULL,
  `aab113` varchar(15) NOT NULL,
  `aab114` date NOT NULL,
  `aab115` char(1) NOT NULL,
  `aab116` text,
  PRIMARY KEY (`aab101`),
  KEY `FK_Reference_6` (`aab111`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`aab111`) REFERENCES `ab03` (`aab301`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab01
-- ----------------------------
INSERT INTO `ab01` VALUES ('1', '测试学生1', '20190001', '42****************', '2019-07-17', '男', '1', '天津', '12345678', '12345@163.com', '1', '学生1监护人', '123456', '2019-07-20', '1', '测试123');
INSERT INTO `ab01` VALUES ('2', '测试学生2', '20190002', '42****************', '2019-07-17', '男', '1', '天津', '12345678', '12345@163.com', '1', '学生1监护人', '123456789', '2019-07-20', '1', '测试');
INSERT INTO `ab01` VALUES ('3', '徐俊德', '20190003', '42******************', '2007-02-01', '男', '1', '江西', '111111111111111', '1@qq.com', '1', '徐俊德的爸爸', '111111111111111', '2019-07-21', '1', '测试1');
INSERT INTO `ab01` VALUES ('4', '姜弘义', '20190004', '42******************', '2001-01-31', '女', '2', '湖北', '111111111111111', '1@qq.com', '1', '姜弘义的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('5', '陆弘量', '20190005', '42******************', '2019-07-02', '男', '1', '天津', '111111111111111', '1@qq.com', '1', '陆弘量的妈妈', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('6', '李宏伯', '20190006', '42******************', '2019-07-02', '男', '2', '北京', '111111111111111', '1@qq.com', '1', '李宏伯的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('7', '白元嘉', '20190007', '42******************', '2019-07-02', '男', '11', '湖北', '111111111111111', '1@qq.com', '1', '白元嘉的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('8', '田自珍', '20190008', '42******************', '2019-07-04', '女', '8', '江西', '111111111111111', '1@qq.com', '1', '田自珍的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('9', '曾俊艾', '20190009', '42******************', '2019-07-05', '女', '1', '江西', '111111111111111', '1@qq.com', '1', '曾俊艾的妈妈', '111111111111111', '2019-07-21', '2', '测试');
INSERT INTO `ab01` VALUES ('10', '康建柏', '20190010', '42******************', '2019-07-06', '男', '1', '天津', '111111111111111', '1@qq.com', '1', '康建柏的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('11', '易阳华', '20190011', '42******************', '2019-07-08', '男', '1', '天津', '111111111111111', '1@qq.com', '1', '易阳华的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('12', '万成益', '20190012', '42******************', '2019-07-09', '男', '1', '江西', '111111111111111', '1@qq.com', '1', '万成益的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('13', '贺光启', '20190013', '42******************', '2019-07-10', '男', '11', '江西', '111111111111111', '1@qq.com', '1', '贺光启的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('14', '魏鸿宝', '20190014', '42******************', '2019-07-11', '男', '1', '江西', '111111111111111', '1@qq.com', '3', '魏鸿宝的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('15', '尹凯乐', '20190015', '42******************', '2019-07-11', '男', '20', '云南', '111111111111111', '1@qq.com', '4', '尹凯乐的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('16', '许子平', '20190016', '42******************', '2019-07-12', '男', '18', '广西', '111111111111111', '1@qq.com', '4', '许子平的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('17', '郝明旭', '20190017', '42******************', '2019-07-14', '男', '13', '福建', '111111111111111', '1@qq.com', '4', '郝明旭的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('18', '邵嘉木', '20190018', '42******************', '2019-07-15', '女', '1', '新疆', '111111111111111', '1@qq.com', '3', '邵嘉木的妈妈', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('19', '傅永思', '20190019', '42******************', '2019-07-16', '男', '1', '江西', '111111111111111', '1@qq.com', '3', '傅永思的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('20', '武承弼', '20190020', '42******************', '2019-07-16', '男', '1', '安徽', '111111111111111', '1@qq.com', '3', '武承弼的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('21', '邓永昌', '20190021', '42******************', '2019-07-17', '男', '1', '广州', '111111111111111', '1@qq.com', '3', '邓永昌的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('22', '魏高兴', '20190022', '42******************', '2019-07-18', '男', '1', '内蒙古', '111111111111111', '1@qq.com', '4', '魏高兴的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('23', '高冠宇', '20190023', '42******************', '2019-07-20', '男', '14', '山西', '111111111111111', '1@qq.com', '4', '高冠宇的妈妈', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('24', '赖彭祖', '20190024', '42******************', '2019-07-21', '男', '1', '江西', '111111111111111', '1@qq.com', '3', '赖彭祖的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('25', '顾雅达', '20190025', '42******************', '2019-07-23', '女', '1', '山东', '111111111111111', '1@qq.com', '3', '顾雅达的爸爸', '111111111111111', '2019-07-21', '1', '测试');
INSERT INTO `ab01` VALUES ('26', '苏智敏', '20190026', '42******************', '2019-07-23', '女', '1', '哈尔滨', '111111111111111', '1@qq.com', '4', '苏智敏的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('27', '陈学海', '20190027', '42******************', '2019-07-24', '男', '9', '湖南', '111111111111111', '1@qq.com', '4', '陈学海的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('28', '龚明杰', '20190028', '42******************', '2019-07-25', '男', '1', '沈阳', '111111111111111', '1@qq.com', '3', '龚明杰的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('29', '熊鹏程', '20190029', '42******************', '2019-07-26', '男', '56', '重庆', '111111111111111', '1@qq.com', '3', '熊鹏程的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('30', '潘文乐', '20190030', '42******************', '2019-07-27', '男', '1', '西藏', '111111111111111', '1@qq.com', '3', '潘文乐的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('31', '董弘业', '20190031', '42******************', '2019-07-29', '男', '54', '江西', '111111111111111', '1@qq.com', '3', '董弘业的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('32', '龙文轩', '20190032', '42******************', '2019-07-30', '女', '19', '吉林', '111111111111111', '1@qq.com', '4', '龙文轩的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('33', '周兴国', '20190033', '42******************', '2019-07-31', '女', '98', '纽约', '111111111111111', '1@qq.com', '3', '周兴国的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('34', '范凯安', '20190034', '42******************', '2019-08-01', '女', '1', '兰州', '111111111111111', '1@qq.com', '4', '范凯安的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('35', '廖向笛', '20190035', '42******************', '2019-08-03', '女', '1', '北京', '111111111111111', '1@qq.com', '4', '廖向笛的爸爸', '111111111111111', '2019-07-22', '1', '测试');
INSERT INTO `ab01` VALUES ('37', '测试学生', '20190037', '42111111111111111111', '2019-07-01', '女', '1', '北京', '111111111111111', '1@1', '8', '测试', '111111111111111', '2019-07-25', '1', '测试');

-- ----------------------------
-- Table structure for ab02
-- ----------------------------
DROP TABLE IF EXISTS `ab02`;
CREATE TABLE `ab02` (
  `aab201` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab202` varchar(2) NOT NULL,
  `aab203` varchar(2) NOT NULL,
  `aab204` text NOT NULL,
  `aab205` date NOT NULL,
  `aab206` datetime NOT NULL,
  `aab207` varchar(2) NOT NULL,
  PRIMARY KEY (`aab201`),
  KEY `FK_Reference_1` (`aab101`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab02
-- ----------------------------
INSERT INTO `ab02` VALUES ('1', '1', '1', '2', '生病静养', '2019-07-21', '2019-07-21 16:31:37', '1');
INSERT INTO `ab02` VALUES ('2', '3', '1', '3', '不想学了', '2019-08-22', '2019-07-22 00:09:39', '1');
INSERT INTO `ab02` VALUES ('3', '9', '1', '2', '回家种田', '2019-07-28', '2019-07-22 00:10:15', '2');

-- ----------------------------
-- Table structure for ab03
-- ----------------------------
DROP TABLE IF EXISTS `ab03`;
CREATE TABLE `ab03` (
  `aab301` int(11) NOT NULL AUTO_INCREMENT,
  `aab302` varchar(20) NOT NULL,
  `aab303` varchar(20) NOT NULL,
  `aab306` date NOT NULL,
  `aab307` datetime NOT NULL,
  `aab501` int(11) NOT NULL,
  `aae101` int(11) NOT NULL,
  `ae0_aae101` int(11) NOT NULL,
  `aab308` int(11) NOT NULL,
  `aab309` int(11) NOT NULL,
  `aab3010` date NOT NULL,
  `aab3011` varchar(6) NOT NULL,
  PRIMARY KEY (`aab301`),
  KEY `FK_Reference_53` (`aae101`),
  KEY `FK_Reference_54` (`ae0_aae101`),
  KEY `FK_Reference_62` (`aab501`),
  CONSTRAINT `FK_Reference_53` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_54` FOREIGN KEY (`ae0_aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_62` FOREIGN KEY (`aab501`) REFERENCES `ab05` (`aab501`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab03
-- ----------------------------
INSERT INTO `ab03` VALUES ('1', '测试班级1', '20190001', '2019-07-20', '2019-07-20 17:14:17', '1', '4', '6', '13', '100', '2019-07-31', '202');
INSERT INTO `ab03` VALUES ('2', '测试班级2', '20190002', '2019-08-21', '2019-07-21 16:37:46', '1', '14', '7', '0', '100', '2019-07-25', '202');
INSERT INTO `ab03` VALUES ('3', '测试班级3', '20190003', '2019-07-21', '2019-07-21 23:38:38', '2', '18', '21', '12', '40', '2020-01-01', '301');
INSERT INTO `ab03` VALUES ('4', '测试班级4', '20190004', '2019-07-01', '2019-07-21 23:39:23', '4', '19', '22', '10', '40', '2019-07-31', '215');
INSERT INTO `ab03` VALUES ('5', '测试班级5', '20190005', '2019-07-24', '2019-07-24 09:28:08', '1', '17', '20', '0', '40', '2019-07-25', '216');
INSERT INTO `ab03` VALUES ('8', '合并班级1', '20190008', '2019-07-25', '2019-07-25 16:12:10', '1', '17', '23', '1', '40', '2019-08-22', '321');

-- ----------------------------
-- Table structure for ab04
-- ----------------------------
DROP TABLE IF EXISTS `ab04`;
CREATE TABLE `ab04` (
  `aab401` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab402` int(11) NOT NULL,
  `aab403` int(11) NOT NULL,
  `aab404` text NOT NULL,
  `aab405` date NOT NULL,
  `aab406` datetime NOT NULL,
  `aab407` varchar(2) NOT NULL,
  PRIMARY KEY (`aab401`),
  KEY `FK_Reference_4` (`aab101`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab04
-- ----------------------------
INSERT INTO `ab04` VALUES ('1', '1', '1', '2', '换个环境学习', '2019-07-21', '2019-07-21 16:39:05', '1');
INSERT INTO `ab04` VALUES ('2', '5', '1', '3', '换一个学习环境', '2019-07-25', '2019-07-22 00:11:17', '1');
INSERT INTO `ab04` VALUES ('3', '7', '1', '4', '换环境学习', '2019-08-04', '2019-07-22 00:11:50', '1');
INSERT INTO `ab04` VALUES ('4', '37', '5', '8', '测试', '2019-07-25', '2019-07-25 16:12:10', '2');

-- ----------------------------
-- Table structure for ab05
-- ----------------------------
DROP TABLE IF EXISTS `ab05`;
CREATE TABLE `ab05` (
  `aab501` int(11) NOT NULL AUTO_INCREMENT,
  `aab502` varchar(20) NOT NULL,
  `aab503` varchar(6) NOT NULL,
  `aab504` decimal(10,2) NOT NULL,
  `aab505` text NOT NULL,
  `aab506` datetime NOT NULL,
  `aab507` text,
  PRIMARY KEY (`aab501`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab05
-- ----------------------------
INSERT INTO `ab05` VALUES ('1', 'C++', '201901', '2000.00', 'C++教学课程1', '2019-07-20 17:13:37', '测试测试');
INSERT INTO `ab05` VALUES ('2', 'Java程序设计', '201902', '2000.00', 'Java基础与进阶知识', '2019-07-21 16:50:11', '测试');
INSERT INTO `ab05` VALUES ('4', 'C#程序设计', '201905', '1000.00', 'C#程序设计', '2019-07-21 19:57:15', '测试数据');
INSERT INTO `ab05` VALUES ('5', '系统级程序设计', '201906', '2000.00', '系统级程序设计', '2019-07-21 20:14:05', '测试数据');

-- ----------------------------
-- Table structure for ab06
-- ----------------------------
DROP TABLE IF EXISTS `ab06`;
CREATE TABLE `ab06` (
  `aab601` int(11) NOT NULL AUTO_INCREMENT,
  `aab301` int(11) NOT NULL,
  `aab602` varchar(10) NOT NULL,
  `aab603` date NOT NULL,
  `aab604` time NOT NULL,
  `aab605` time NOT NULL,
  `aab606` varchar(20) NOT NULL,
  `aab607` datetime NOT NULL,
  `aab608` text,
  PRIMARY KEY (`aab601`),
  KEY `FK_Reference_63` (`aab301`),
  CONSTRAINT `FK_Reference_63` FOREIGN KEY (`aab301`) REFERENCES `ab03` (`aab301`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab06
-- ----------------------------
INSERT INTO `ab06` VALUES ('2', '1', '20190011', '2019-07-25', '09:00:00', '09:30:00', '202', '2019-07-23 19:11:49', '测试');
INSERT INTO `ab06` VALUES ('3', '1', '20190012', '2019-07-25', '09:00:00', '09:00:00', '东软', '2019-07-24 09:19:23', '测试');

-- ----------------------------
-- Table structure for ab07
-- ----------------------------
DROP TABLE IF EXISTS `ab07`;
CREATE TABLE `ab07` (
  `aab701` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab601` int(11) NOT NULL,
  `aab702` int(11) NOT NULL,
  `aab703` int(11) NOT NULL,
  `aab704` char(1) DEFAULT NULL,
  `aab705` text,
  `aab706` datetime NOT NULL,
  PRIMARY KEY (`aab701`),
  KEY `FK_Reference_8` (`aab101`),
  KEY `FK_Reference_9` (`aab601`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`aab601`) REFERENCES `ab06` (`aab601`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab07
-- ----------------------------
INSERT INTO `ab07` VALUES ('1', '2', '3', '50', '50', 'A', '测试', '2019-07-24 11:38:12');

-- ----------------------------
-- Table structure for ab08
-- ----------------------------
DROP TABLE IF EXISTS `ab08`;
CREATE TABLE `ab08` (
  `aab801` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab802` char(1) NOT NULL COMMENT '1---奖\n            2---惩',
  `aab803` text NOT NULL,
  `aab804` text NOT NULL,
  `aab805` date NOT NULL,
  `aab806` datetime NOT NULL,
  PRIMARY KEY (`aab801`),
  KEY `FK_Reference_52` (`aab101`),
  CONSTRAINT `FK_Reference_52` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab08
-- ----------------------------
INSERT INTO `ab08` VALUES ('1', '1', '奖', '一个本子', '表现良好', '2019-07-21', '2019-07-21 16:20:13');
INSERT INTO `ab08` VALUES ('3', '1', '惩', '罚站', '不安分a', '2019-07-22', '2019-07-21 16:21:19');

-- ----------------------------
-- Table structure for ab09
-- ----------------------------
DROP TABLE IF EXISTS `ab09`;
CREATE TABLE `ab09` (
  `aab901` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab902` date NOT NULL,
  `aab903` char(1) NOT NULL,
  `aab904` text NOT NULL,
  `aab905` datetime NOT NULL,
  PRIMARY KEY (`aab901`),
  KEY `FK_Reference_11` (`aab101`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab09
-- ----------------------------
INSERT INTO `ab09` VALUES ('1', '1', '2019-07-23', '1', '测试', '2019-07-23 19:24:50');

-- ----------------------------
-- Table structure for ab10
-- ----------------------------
DROP TABLE IF EXISTS `ab10`;
CREATE TABLE `ab10` (
  `aab1001` int(11) NOT NULL AUTO_INCREMENT,
  `aab1101` int(11) NOT NULL,
  `aab101` int(11) NOT NULL,
  PRIMARY KEY (`aab1001`),
  KEY `FK_Reference_24` (`aab1101`),
  KEY `FK_Reference_25` (`aab101`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`aab1101`) REFERENCES `ab11` (`aab1101`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab10
-- ----------------------------
INSERT INTO `ab10` VALUES ('1', '1', '1');
INSERT INTO `ab10` VALUES ('2', '1', '2');
INSERT INTO `ab10` VALUES ('3', '2', '3');
INSERT INTO `ab10` VALUES ('4', '2', '4');

-- ----------------------------
-- Table structure for ab11
-- ----------------------------
DROP TABLE IF EXISTS `ab11`;
CREATE TABLE `ab11` (
  `aab1101` int(11) NOT NULL AUTO_INCREMENT,
  `aab1102` varchar(3) NOT NULL,
  `aab1103` char(1) NOT NULL,
  `aab1104` int(11) NOT NULL,
  `aab1105` int(11) NOT NULL,
  `aab1106` text,
  `aab1107` decimal(10,2) NOT NULL,
  PRIMARY KEY (`aab1101`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab11
-- ----------------------------
INSERT INTO `ab11` VALUES ('1', '101', 'A', '4', '2', '测试', '50.00');
INSERT INTO `ab11` VALUES ('2', '102', 'A', '5', '2', '测试数据', '30.00');
INSERT INTO `ab11` VALUES ('3', '103', 'A', '4', '0', '测试', '20.00');
INSERT INTO `ab11` VALUES ('6', '104', 'A', '10', '0', '测试测试', '20.00');

-- ----------------------------
-- Table structure for ab12
-- ----------------------------
DROP TABLE IF EXISTS `ab12`;
CREATE TABLE `ab12` (
  `aab1201` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aab101` int(11) NOT NULL,
  `aab1202` date NOT NULL,
  `aab1203` text NOT NULL,
  `aab1204` text NOT NULL,
  PRIMARY KEY (`aab1201`),
  KEY `FK_Reference_32` (`aae101`),
  KEY `FK_Reference_33` (`aab101`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_33` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab12
-- ----------------------------
INSERT INTO `ab12` VALUES ('1', '8', '1', '2019-07-21', '上课大声喧哗', '批评,教育');

-- ----------------------------
-- Table structure for ab13
-- ----------------------------
DROP TABLE IF EXISTS `ab13`;
CREATE TABLE `ab13` (
  `aab1301` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab1302` varchar(20) NOT NULL,
  `aab1303` date NOT NULL,
  `aab1304` text NOT NULL,
  `aab1305` text NOT NULL,
  PRIMARY KEY (`aab1301`),
  KEY `FK_Reference_50` (`aab101`),
  CONSTRAINT `FK_Reference_50` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab13
-- ----------------------------
INSERT INTO `ab13` VALUES ('2', '1', 'java特级证书', '2019-07-21', '东软睿道', '技术专精吃');
INSERT INTO `ab13` VALUES ('3', '1', 'java高级证书', '2019-07-21', '东软睿道', '技术成熟');

-- ----------------------------
-- Table structure for ab14
-- ----------------------------
DROP TABLE IF EXISTS `ab14`;
CREATE TABLE `ab14` (
  `aab1401` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aab1402` varchar(3) NOT NULL,
  `aab1403` varchar(3) NOT NULL,
  `aab1404` date NOT NULL,
  `aab1405` datetime NOT NULL,
  `aab1406` varchar(20) NOT NULL,
  `aab1407` varchar(2) NOT NULL,
  PRIMARY KEY (`aab1401`),
  KEY `FK_Reference_45` (`aab101`),
  CONSTRAINT `FK_Reference_45` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ab14
-- ----------------------------
INSERT INTO `ab14` VALUES ('1', '1', '101', '102', '2019-07-25', '2019-07-25 16:45:04', '测试', '1');

-- ----------------------------
-- Table structure for ac01
-- ----------------------------
DROP TABLE IF EXISTS `ac01`;
CREATE TABLE `ac01` (
  `aac101` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac102` date NOT NULL,
  `aac103` text NOT NULL,
  `aac104` char(1) NOT NULL,
  `aac105` text,
  PRIMARY KEY (`aac101`),
  KEY `FK_Reference_41` (`aae101`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac01
-- ----------------------------
INSERT INTO `ac01` VALUES ('1', '4', '2019-07-02', '今天努力工作了', '1', '明天继续努力啊啊啊');
INSERT INTO `ac01` VALUES ('2', '4', '2019-07-23', '测试', '1', '测试');

-- ----------------------------
-- Table structure for ac02
-- ----------------------------
DROP TABLE IF EXISTS `ac02`;
CREATE TABLE `ac02` (
  `aac201` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac1001` int(11) NOT NULL,
  `aac203` char(1) NOT NULL,
  `aac204` text,
  `aac205` datetime NOT NULL,
  PRIMARY KEY (`aac201`),
  KEY `FK_Reference_39` (`aae101`),
  KEY `FK_Reference_56` (`aac1001`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_56` FOREIGN KEY (`aac1001`) REFERENCES `ac10` (`aac1001`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac02
-- ----------------------------
INSERT INTO `ac02` VALUES ('1', '4', '1', '2', '本人文档', '2019-07-21 15:46:38');
INSERT INTO `ac02` VALUES ('2', '4', '2', '2', '本人文档', '2019-07-21 15:53:13');
INSERT INTO `ac02` VALUES ('3', '4', '3', '2', '本人文档', '2019-07-22 01:09:51');
INSERT INTO `ac02` VALUES ('4', '4', '4', '2', '本人文档', '2019-07-22 01:21:45');
INSERT INTO `ac02` VALUES ('5', '4', '5', '2', '本人文档', '2019-07-22 09:15:16');
INSERT INTO `ac02` VALUES ('6', '14', '5', '1', '他人文档', '2019-07-22 14:16:29');
INSERT INTO `ac02` VALUES ('7', '14', '4', '2', '他人文档', '2019-07-22 14:16:31');
INSERT INTO `ac02` VALUES ('8', '14', '2', '1', '他人文档', '2019-07-22 14:35:01');
INSERT INTO `ac02` VALUES ('9', '14', '6', '2', '本人文档', '2019-07-22 15:19:22');
INSERT INTO `ac02` VALUES ('10', '14', '7', '2', '本人文档', '2019-07-22 15:28:27');
INSERT INTO `ac02` VALUES ('11', '4', '8', '2', '本人文档', '2019-07-23 16:44:00');
INSERT INTO `ac02` VALUES ('12', '4', '6', '1', '他人文档', '2019-07-23 16:44:23');
INSERT INTO `ac02` VALUES ('13', '14', '8', '1', '他人文档', '2019-07-23 16:46:28');
INSERT INTO `ac02` VALUES ('14', '4', '9', '2', '本人文档', '2019-07-24 13:10:57');
INSERT INTO `ac02` VALUES ('15', '4', '10', '2', '本人文档', '2019-07-25 15:28:23');
INSERT INTO `ac02` VALUES ('16', '14', '10', '3', '他人文档', '2019-07-25 16:56:32');

-- ----------------------------
-- Table structure for ac03
-- ----------------------------
DROP TABLE IF EXISTS `ac03`;
CREATE TABLE `ac03` (
  `aac301` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac302` varchar(20) NOT NULL,
  `aac303` char(1) NOT NULL,
  `aac304` text,
  PRIMARY KEY (`aac301`),
  KEY `FK_Reference_36` (`aae101`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac03
-- ----------------------------
INSERT INTO `ac03` VALUES ('2', '4', '测试3', '1', null);
INSERT INTO `ac03` VALUES ('6', '4', '教师1号的第二个方案', '2', null);
INSERT INTO `ac03` VALUES ('10', '4', '教师1号的第三个方案', '2', null);
INSERT INTO `ac03` VALUES ('11', '4', '教师1号的第四个方案', '4', null);

-- ----------------------------
-- Table structure for ac04
-- ----------------------------
DROP TABLE IF EXISTS `ac04`;
CREATE TABLE `ac04` (
  `aac401` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac402` date NOT NULL,
  `aac403` varchar(50) NOT NULL,
  `aac404` text NOT NULL,
  `aac405` text,
  PRIMARY KEY (`aac401`),
  KEY `FK_Reference_37` (`aae101`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac04
-- ----------------------------
INSERT INTO `ac04` VALUES ('1', '4', '2019-07-21', '东软', '测试4', null);
INSERT INTO `ac04` VALUES ('3', '4', '2019-07-19', '东软', '上课', null);

-- ----------------------------
-- Table structure for ac05
-- ----------------------------
DROP TABLE IF EXISTS `ac05`;
CREATE TABLE `ac05` (
  `aac501` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac502` text NOT NULL,
  `aac503` decimal(10,2) NOT NULL,
  `aac504` date NOT NULL,
  `aac505` char(1) NOT NULL,
  `aac506` text,
  `aac507` char(1) NOT NULL COMMENT '0---未通过\n            1---已通过\n            2---已拨出\n            3---已提交\n            4---已结算',
  `aac508` char(1) NOT NULL,
  PRIMARY KEY (`aac501`),
  KEY `FK_Reference_27` (`aae101`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac05
-- ----------------------------
INSERT INTO `ac05` VALUES ('1', '4', '用于研究人工智能的深层次开发', '2000.00', '2019-07-21', '6', null, '4', '1');
INSERT INTO `ac05` VALUES ('2', '4', '用于后勤物资购买', '2000.00', '2019-07-21', '6', null, '4', '3');
INSERT INTO `ac05` VALUES ('3', '4', '教研', '4004.00', '2019-07-21', '5', null, '2', '1');
INSERT INTO `ac05` VALUES ('6', '4', '测试', '1000.00', '2019-07-23', '4', '测试', '1', '1');
INSERT INTO `ac05` VALUES ('7', '3', '测试', '1000.00', '2019-07-25', '2', '测试', '0', '3');
INSERT INTO `ac05` VALUES ('8', '4', '测试', '1000.00', '2019-07-25', '2', '测试', '0', '1');
INSERT INTO `ac05` VALUES ('9', '4', 'houqin', '4444.00', '2019-07-26', '4', null, '1', '3');

-- ----------------------------
-- Table structure for ac06
-- ----------------------------
DROP TABLE IF EXISTS `ac06`;
CREATE TABLE `ac06` (
  `aac601` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aae501` int(11) NOT NULL,
  `aac602` date NOT NULL,
  `aac603` int(11) NOT NULL,
  `aac604` varchar(25) NOT NULL,
  `aac605` varchar(2) NOT NULL,
  `aac606` date DEFAULT NULL,
  `aac607` varchar(20) DEFAULT NULL,
  `ac0_aae101` int(11) DEFAULT NULL,
  `aac608` text,
  PRIMARY KEY (`aac601`),
  KEY `FK_Reference_10` (`aae101`),
  KEY `FK_Reference_12` (`ac0_aae101`),
  KEY `FK_Reference_17` (`aae501`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`ac0_aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`aae501`) REFERENCES `ae05` (`aae501`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac06
-- ----------------------------
INSERT INTO `ac06` VALUES ('1', '2', '1', '2019-07-20', '1', '做清洁', '2', '2019-07-20', '测试通过', '3', '测试备注');
INSERT INTO `ac06` VALUES ('2', '11', '1', '2019-07-22', '1', '清扫教师', '3', '2019-07-23', '测试', '3', '测试');
INSERT INTO `ac06` VALUES ('3', '12', '1', '2019-07-23', '12', '测试', '2', '2019-07-23', '测试', '3', '测试');

-- ----------------------------
-- Table structure for ac07
-- ----------------------------
DROP TABLE IF EXISTS `ac07`;
CREATE TABLE `ac07` (
  `aac701` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac702` varchar(10) NOT NULL,
  `aac703` varchar(20) NOT NULL,
  `aac704` date NOT NULL,
  `aac705` char(1) NOT NULL,
  `aac706` text NOT NULL,
  `aac707` text,
  PRIMARY KEY (`aac701`),
  KEY `FK_Reference_46` (`aae101`),
  CONSTRAINT `FK_Reference_46` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac07
-- ----------------------------
INSERT INTO `ac07` VALUES ('2', '4', '20190037', '测试1', '2019-07-23', '1', '测试', '测试');

-- ----------------------------
-- Table structure for ac08
-- ----------------------------
DROP TABLE IF EXISTS `ac08`;
CREATE TABLE `ac08` (
  `aac801` int(11) NOT NULL AUTO_INCREMENT,
  `aac701` int(11) NOT NULL,
  `aae101` int(11) NOT NULL,
  `aac802` char(1) NOT NULL,
  PRIMARY KEY (`aac801`),
  KEY `FK_Reference_47` (`aac701`),
  KEY `FK_Reference_48` (`aae101`),
  CONSTRAINT `FK_Reference_47` FOREIGN KEY (`aac701`) REFERENCES `ac07` (`aac701`),
  CONSTRAINT `FK_Reference_48` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac08
-- ----------------------------
INSERT INTO `ac08` VALUES ('1', '2', '4', '1');
INSERT INTO `ac08` VALUES ('2', '2', '6', '2');

-- ----------------------------
-- Table structure for ac09
-- ----------------------------
DROP TABLE IF EXISTS `ac09`;
CREATE TABLE `ac09` (
  `aac901` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac902` datetime NOT NULL,
  `aac903` text NOT NULL,
  `aac904` varchar(20) NOT NULL,
  PRIMARY KEY (`aac901`),
  KEY `FK_Reference_49` (`aae101`),
  CONSTRAINT `FK_Reference_49` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac09
-- ----------------------------
INSERT INTO `ac09` VALUES ('2', '4', '2019-07-22 01:07:00', '测试', '教师1号的1号底稿');
INSERT INTO `ac09` VALUES ('3', '4', '2019-07-23 06:50:34', '测试123', '教师1号的2号底稿');
INSERT INTO `ac09` VALUES ('5', '4', '2019-07-23 06:51:00', '测试', '教师1号的4号底稿');

-- ----------------------------
-- Table structure for ac10
-- ----------------------------
DROP TABLE IF EXISTS `ac10`;
CREATE TABLE `ac10` (
  `aac1001` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aac1002` datetime NOT NULL,
  `aac1003` text NOT NULL,
  `aac1004` text,
  `aac1005` varchar(20) NOT NULL,
  PRIMARY KEY (`aac1001`),
  KEY `FK_Reference_40` (`aae101`),
  CONSTRAINT `FK_Reference_40` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac10
-- ----------------------------
INSERT INTO `ac10` VALUES ('1', '4', '2019-07-21 03:46:38', 'G:\\android\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\10\\9\\6d50a964-5d02-4ebc-8f33-ff356052994b_erp数据库.txt', '成果测试', '教师1号的成果');
INSERT INTO `ac10` VALUES ('2', '4', '2019-07-21 03:53:13', 'G:\\android\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\9\\5\\13b22df4-5ffb-4873-a107-bb400d83e1bf_EEEF.txt', '成果测试2', '教师1号的第二个成果');
INSERT INTO `ac10` VALUES ('3', '4', '2019-07-22 01:09:51', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\10\\7\\3493af58-5969-4c35-9c82-b3c436c81ba9_队员信息', '测试', '教师1号的1号成果');
INSERT INTO `ac10` VALUES ('4', '4', '2019-07-22 01:21:45', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\14\\9\\74a08de8-8058-4e8d-992b-6ab48bb4ce74_test.txt', '测试', '教师1号的4号成果');
INSERT INTO `ac10` VALUES ('5', '4', '2019-07-22 09:15:16', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\13\\6\\d96abb79-5ed7-4b46-baf0-0d3ae45118b2_1.xls', '测试', '教师1号的5号成果');
INSERT INTO `ac10` VALUES ('6', '14', '2019-07-22 03:19:22', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20190001\\9\\13\\e8fa89d2-5397-459e-8fc0-55788a441434_学生数据.docx', '测试', '教师2号的1号成果');
INSERT INTO `ac10` VALUES ('7', '14', '2019-07-22 03:28:27', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20190001\\11\\2\\3f72ebc1-af62-4efd-b087-141ba2877ced_Tools.java', '测试', '教师2号的2号成果');
INSERT INTO `ac10` VALUES ('8', '4', '2019-07-23 04:44:00', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\15\\9\\5fb8d79a-952f-4a68-995a-d1a224c572f8_test.txt', '测试', '教师1号的6号成果');
INSERT INTO `ac10` VALUES ('9', '4', '2019-07-24 01:10:57', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\7\\12\\6ee41c37-83b2-4be9-8c68-81466905b8e7_实习报告.doc', '测试', '教师1号的7号成果');
INSERT INTO `ac10` VALUES ('10', '4', '2019-07-25 03:28:23', 'D:\\Eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\ERPSystem\\WEB-INF\\upload\\20150004\\3\\10\\3e64bb99-338f-4b9c-ae4e-f53610bfcee7_tstyle.css', '测试', '测试');

-- ----------------------------
-- Table structure for ac11
-- ----------------------------
DROP TABLE IF EXISTS `ac11`;
CREATE TABLE `ac11` (
  `aac1101` int(11) NOT NULL AUTO_INCREMENT,
  `aac301` int(11) NOT NULL,
  `aac401` int(11) NOT NULL,
  PRIMARY KEY (`aac1101`),
  KEY `FK_Reference_34` (`aac301`),
  KEY `FK_Reference_35` (`aac401`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`aac301`) REFERENCES `ac03` (`aac301`),
  CONSTRAINT `FK_Reference_35` FOREIGN KEY (`aac401`) REFERENCES `ac04` (`aac401`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ac11
-- ----------------------------
INSERT INTO `ac11` VALUES ('1', '2', '1');
INSERT INTO `ac11` VALUES ('3', '2', '3');

-- ----------------------------
-- Table structure for ad01
-- ----------------------------
DROP TABLE IF EXISTS `ad01`;
CREATE TABLE `ad01` (
  `aad101` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aad102` varchar(1) NOT NULL,
  `aad103` decimal(10,0) NOT NULL,
  `aad104` text NOT NULL,
  `aad105` datetime NOT NULL,
  `aad106` text,
  PRIMARY KEY (`aad101`),
  KEY `FK_Reference_28` (`aae101`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ad01
-- ----------------------------
INSERT INTO `ad01` VALUES ('1', '4', '1', '2000', '经费收入', '2019-07-18 00:00:00', null);
INSERT INTO `ad01` VALUES ('2', '4', '2', '300', '活动举办费用', '2019-07-21 00:00:00', null);
INSERT INTO `ad01` VALUES ('3', '4', '1', '2000', '经费获取', '2019-07-19 00:00:00', null);
INSERT INTO `ad01` VALUES ('4', '4', '1', '300', '货单', '2019-07-20 00:00:00', null);

-- ----------------------------
-- Table structure for ad02
-- ----------------------------
DROP TABLE IF EXISTS `ad02`;
CREATE TABLE `ad02` (
  `aad201` int(11) NOT NULL AUTO_INCREMENT,
  `aab101` int(11) NOT NULL,
  `aad202` varchar(6) NOT NULL,
  `aad203` decimal(10,2) NOT NULL,
  `aad204` char(1) NOT NULL,
  `aad206` text,
  `aad207` char(1) NOT NULL,
  PRIMARY KEY (`aad201`),
  KEY `FK_Reference_29` (`aab101`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`aab101`) REFERENCES `ab01` (`aab101`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ad02
-- ----------------------------
INSERT INTO `ad02` VALUES ('1', '2', '学生学费', '2000.00', '1', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('2', '1', '住宿费', '500.00', '1', '测试', '0');
INSERT INTO `ad02` VALUES ('3', '1', '学生学费', '2009.00', '1', '测试', '1');
INSERT INTO `ad02` VALUES ('4', '3', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('5', '4', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('6', '5', '学生学费', '2000.00', '1', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('7', '6', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('8', '7', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('9', '8', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('10', '9', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('11', '10', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('12', '11', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('13', '12', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('14', '13', '学生学费', '2000.00', '0', '测试班级1', '0');
INSERT INTO `ad02` VALUES ('15', '14', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('16', '15', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('17', '16', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('18', '17', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('19', '18', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('20', '19', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('21', '20', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('22', '21', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('23', '22', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('24', '23', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('25', '24', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('26', '25', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('27', '26', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('28', '27', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('29', '28', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('30', '29', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('31', '30', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('32', '31', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('33', '32', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('34', '33', '学生学费', '2000.00', '0', '测试班级3', '0');
INSERT INTO `ad02` VALUES ('35', '34', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('36', '35', '学生学费', '1000.00', '0', '测试班级4', '0');
INSERT INTO `ad02` VALUES ('37', '37', '学生学费', '2000.00', '0', '测试班级5', '0');
INSERT INTO `ad02` VALUES ('38', '2', '住宿费', '1500.00', '0', '测试', '0');
INSERT INTO `ad02` VALUES ('39', '3', '住宿费', '900.00', '0', '测试', '0');
INSERT INTO `ad02` VALUES ('40', '4', '住宿费', '900.00', '0', '测试', '0');

-- ----------------------------
-- Table structure for ad03
-- ----------------------------
DROP TABLE IF EXISTS `ad03`;
CREATE TABLE `ad03` (
  `aad301` int(11) NOT NULL AUTO_INCREMENT,
  `aad306` int(11) NOT NULL,
  `ad0_aae101` int(11) NOT NULL,
  `aad302` varchar(8) NOT NULL,
  `aad303` decimal(10,0) NOT NULL,
  `aad304` datetime NOT NULL,
  `aad305` text,
  `aad307` char(1) NOT NULL COMMENT '1---职工\n            2---学生\n            ',
  `aad308` char(1) NOT NULL COMMENT '0---未审查\n            1---已审查',
  `aad309` char(1) NOT NULL COMMENT '0---支出\n            1---收入',
  PRIMARY KEY (`aad301`),
  KEY `FK_Reference_44` (`ad0_aae101`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`ad0_aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ad03
-- ----------------------------
INSERT INTO `ad03` VALUES ('1', '4', '12', '后勤经费', '2000', '2019-07-21 11:53:20', null, '1', '1', '0');
INSERT INTO `ad03` VALUES ('2', '1', '12', '住宿费', '500', '2019-07-21 12:09:25', null, '2', '0', '1');
INSERT INTO `ad03` VALUES ('3', '4', '12', '经费结余', '1700', '2019-07-21 13:34:28', null, '1', '1', '1');
INSERT INTO `ad03` VALUES ('4', '4', '12', '经费结余', '1700', '2019-07-21 13:34:37', null, '1', '1', '1');
INSERT INTO `ad03` VALUES ('5', '4', '12', '经费结余', '1700', '2019-07-21 13:34:39', null, '1', '0', '1');
INSERT INTO `ad03` VALUES ('6', '4', '12', '经费结余', '1700', '2019-07-21 13:36:16', null, '1', '0', '1');
INSERT INTO `ad03` VALUES ('7', '2', '12', '学生学费', '2000', '2019-07-21 13:36:30', null, '2', '0', '1');
INSERT INTO `ad03` VALUES ('8', '4', '12', '经费结余', '1700', '2019-07-21 13:52:36', null, '1', '0', '1');
INSERT INTO `ad03` VALUES ('9', '4', '12', '经费结余', '1700', '2019-07-21 13:52:54', null, '1', '0', '1');
INSERT INTO `ad03` VALUES ('10', '4', '12', '教研经费', '2000', '2019-07-21 15:19:58', null, '1', '0', '0');
INSERT INTO `ad03` VALUES ('11', '4', '12', '经费结余', '2300', '2019-07-21 15:21:30', null, '1', '0', '1');
INSERT INTO `ad03` VALUES ('12', '4', '12', '教研经费', '4004', '2019-07-21 17:31:27', null, '1', '0', '0');
INSERT INTO `ad03` VALUES ('13', '5', '12', '学生学费', '2000', '2019-07-23 19:40:12', null, '2', '0', '1');
INSERT INTO `ad03` VALUES ('14', '1', '12', '学生学费', '2009', '2019-07-23 19:47:47', null, '2', '0', '1');

-- ----------------------------
-- Table structure for ad04
-- ----------------------------
DROP TABLE IF EXISTS `ad04`;
CREATE TABLE `ad04` (
  `aad401` int(11) NOT NULL AUTO_INCREMENT,
  `aad101` int(11) NOT NULL,
  `aac501` int(11) NOT NULL,
  PRIMARY KEY (`aad401`),
  KEY `FK_Reference_57` (`aad101`),
  KEY `FK_Reference_58` (`aac501`),
  CONSTRAINT `FK_Reference_57` FOREIGN KEY (`aad101`) REFERENCES `ad01` (`aad101`),
  CONSTRAINT `FK_Reference_58` FOREIGN KEY (`aac501`) REFERENCES `ac05` (`aac501`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ad04
-- ----------------------------
INSERT INTO `ad04` VALUES ('1', '1', '1');
INSERT INTO `ad04` VALUES ('2', '2', '1');
INSERT INTO `ad04` VALUES ('3', '3', '2');
INSERT INTO `ad04` VALUES ('4', '4', '2');

-- ----------------------------
-- Table structure for ae01
-- ----------------------------
DROP TABLE IF EXISTS `ae01`;
CREATE TABLE `ae01` (
  `aae101` int(11) NOT NULL AUTO_INCREMENT,
  `aae301` int(11) NOT NULL,
  `aae102` varchar(6) NOT NULL,
  `aae103` varchar(8) NOT NULL,
  `aae104` date NOT NULL,
  `aae105` char(1) NOT NULL,
  `aae106` char(2) NOT NULL,
  `aae107` varchar(20) NOT NULL,
  `aae108` varchar(15) NOT NULL,
  `aae109` varchar(50) NOT NULL,
  `aae1110` varchar(2) NOT NULL,
  `aae1111` decimal(10,2) NOT NULL,
  `aae1112` varchar(2) NOT NULL,
  `aae1113` text,
  `aae1114` varchar(45) NOT NULL,
  PRIMARY KEY (`aae101`),
  KEY `FK_Reference_14` (`aae301`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`aae301`) REFERENCES `ae03` (`aae301`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae01
-- ----------------------------
INSERT INTO `ae01` VALUES ('1', '1', '账号管理员', '20150001', '2015-01-01', '2', '1', '湖北武汉', '123456789', '123456@163.com', '1', '1000.00', '1', '测试1', '42****************');
INSERT INTO `ae01` VALUES ('2', '1', '总务人员1', '20150002', '2015-01-01', '1', '1', '四川成都', '12345678', '12345@163.com', '1', '1000.00', '1', '测试的', '42****************');
INSERT INTO `ae01` VALUES ('3', '2', '内务人员1', '20150003', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('4', '3', '教师1号', '20150004', '2015-01-01', '1', '2', '天津', '123456', '123@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('5', '4', '门卫1', '20150005', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('6', '3', '班主任1', '20150006', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('7', '3', '班主任2', '20150007', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('8', '1', '总务人员2', '20150008', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('9', '2', '内务人员2', '20150009', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('10', '5', '招生人员1', '20150010', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('11', '5', '招生人员2', '20150011', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('12', '6', '财务人员1', '20150012', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '1', '1000.00', '1', '测试', '42****************');
INSERT INTO `ae01` VALUES ('13', '0', '财务人员2', '20150013', '2015-01-01', '1', '1', '北京', '1234567', '1234@163.com', '0', '0.00', '3', '测试', '42****************');
INSERT INTO `ae01` VALUES ('14', '3', '教师2号', '20190001', '1990-02-01', '1', '1', '江西', '12312312312', 'NNiA15@qq.com', '3', '2000.03', '1', '测试2', '362502199002012353');
INSERT INTO `ae01` VALUES ('15', '3', '教师7号', '20190002', '1990-02-01', '1', '1', '江西', '12312312312', 'NNiA15@qq.com', '3', '2000.03', '1', '测试2', '362502199002012353');
INSERT INTO `ae01` VALUES ('16', '3', '教师6号', '20190003', '2019-02-07', '1', '1', '江西', '12312312312', 'NNiA15@qq.com', '3', '2000.03', '1', '测试', '362502199002012353');
INSERT INTO `ae01` VALUES ('17', '3', '教师8号', '20190004', '2019-02-07', '1', '1', '江西', '12312312312', 'NNiA15@qq.com', '3', '2000.03', '1', '测试', '362502199002012353');
INSERT INTO `ae01` VALUES ('18', '3', '教师3号', '20190005', '2019-07-01', '1', '1', '湖北', '11111112222', 'NNifa5@qq.com', '3', '2000.00', '1', '测试', '362502199002013232');
INSERT INTO `ae01` VALUES ('19', '3', '教师4号', '20190006', '2019-07-22', '2', '6', '湖北', '11212121212', 'N1235@qq.com', '1', '1123.00', '1', '测试', '362502199609142353');
INSERT INTO `ae01` VALUES ('20', '3', '教师5号', '20190007', '2019-07-04', '2', '1', '江西', '11111112222', 'Nerta5@qq.com', '3', '2000.00', '1', '测试', '362502199002012353');
INSERT INTO `ae01` VALUES ('21', '3', '班主任3', '20190008', '1996-07-06', '2', '2', '北京', '12345678901', '123@qq.com', '4', '2000.00', '1', '测试', '42******************');
INSERT INTO `ae01` VALUES ('22', '3', '班主任4', '20190009', '1987-08-04', '1', '1', '上海', '12345678902', '456@qq.com', '4', '2000.00', '1', '测试', '42******************');
INSERT INTO `ae01` VALUES ('23', '3', '班主任5', '20190023', '2019-07-18', '1', '1', '北京', '333333333333333', '3@3', '4', '1111.00', '1', '测试', '43222222222222222222');

-- ----------------------------
-- Table structure for ae02
-- ----------------------------
DROP TABLE IF EXISTS `ae02`;
CREATE TABLE `ae02` (
  `aae201` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aae301` int(11) NOT NULL,
  `ae0_aae301` int(11) NOT NULL,
  `aae202` varchar(2) NOT NULL,
  `aae203` varchar(2) NOT NULL,
  `aae204` text NOT NULL,
  `aae205` date NOT NULL,
  PRIMARY KEY (`aae201`),
  KEY `FK_Reference_16` (`aae101`),
  KEY `FK_Reference_23` (`aae301`),
  KEY `FK_Reference_51` (`ae0_aae301`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`aae301`) REFERENCES `ae03` (`aae301`),
  CONSTRAINT `FK_Reference_51` FOREIGN KEY (`ae0_aae301`) REFERENCES `ae03` (`aae301`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae02
-- ----------------------------
INSERT INTO `ae02` VALUES ('1', '13', '6', '0', '1', '0', '离职', '2019-07-20');
INSERT INTO `ae02` VALUES ('8', '20', '0', '3', '0', '3', '入职', '2019-07-08');
INSERT INTO `ae02` VALUES ('9', '21', '0', '3', '0', '4', '入职', '2019-07-11');
INSERT INTO `ae02` VALUES ('10', '22', '0', '3', '0', '4', '入职', '2019-04-10');
INSERT INTO `ae02` VALUES ('11', '23', '0', '3', '0', '4', '入职', '2019-07-25');

-- ----------------------------
-- Table structure for ae03
-- ----------------------------
DROP TABLE IF EXISTS `ae03`;
CREATE TABLE `ae03` (
  `aae301` int(11) NOT NULL AUTO_INCREMENT,
  `aae302` varchar(8) NOT NULL,
  `aae303` int(11) NOT NULL,
  `aae305` varchar(20) NOT NULL,
  `aae306` text NOT NULL,
  `aae307` text,
  PRIMARY KEY (`aae301`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae03
-- ----------------------------
INSERT INTO `ae03` VALUES ('0', '无', '0', '测试', '测试', '测试');
INSERT INTO `ae03` VALUES ('1', '总务部', '3', '天津东软', '处理总务事务', '测试1测试');
INSERT INTO `ae03` VALUES ('2', '内务部', '2', '天津东软', '处理内务事务', '测试');
INSERT INTO `ae03` VALUES ('3', '教学部', '13', '天津东软', '处理教学事务', '测试');
INSERT INTO `ae03` VALUES ('4', '保卫部', '1', '天津东软', '处理安保事务', '测试');
INSERT INTO `ae03` VALUES ('5', '招生部', '2', '天津东软', '处理招生事务', '测试');
INSERT INTO `ae03` VALUES ('6', '财务部', '1', '天津东软', '处理财务事务', '测试');

-- ----------------------------
-- Table structure for ae04
-- ----------------------------
DROP TABLE IF EXISTS `ae04`;
CREATE TABLE `ae04` (
  `aae401` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aae402` date NOT NULL,
  `aae403` varchar(2) NOT NULL,
  `aae404` varchar(25) NOT NULL,
  `aae405` date NOT NULL,
  `aae406` date NOT NULL,
  `aae407` varchar(2) NOT NULL,
  `aae408` varchar(20) DEFAULT NULL,
  `aae409` date DEFAULT NULL,
  `ae0_aae101` int(11) DEFAULT NULL,
  `aae410` text,
  PRIMARY KEY (`aae401`),
  KEY `FK_Reference_20` (`ae0_aae101`),
  KEY `FK_Reference_61` (`aae101`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`ae0_aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_61` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae04
-- ----------------------------
INSERT INTO `ae04` VALUES ('1', '2', '2019-07-20', '1', '测试请假', '2019-07-20', '2019-07-21', '3', '测试审核不通过', '2019-07-20', '3', '测试备注');
INSERT INTO `ae04` VALUES ('2', '12', '2019-07-23', '1', '测试', '2019-07-23', '2019-07-25', '3', '测试', '2019-07-23', '3', '测试');

-- ----------------------------
-- Table structure for ae05
-- ----------------------------
DROP TABLE IF EXISTS `ae05`;
CREATE TABLE `ae05` (
  `aae501` int(11) NOT NULL AUTO_INCREMENT,
  `aae502` varchar(10) NOT NULL,
  `aae503` int(11) NOT NULL,
  `aae504` text,
  PRIMARY KEY (`aae501`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae05
-- ----------------------------
INSERT INTO `ae05` VALUES ('1', '拖把', '20', '备注1');
INSERT INTO `ae05` VALUES ('2', '抹布', '123', '擦桌子的抹布');

-- ----------------------------
-- Table structure for ae06
-- ----------------------------
DROP TABLE IF EXISTS `ae06`;
CREATE TABLE `ae06` (
  `aae601` int(11) NOT NULL AUTO_INCREMENT,
  `aae501` int(11) NOT NULL,
  `aae101` int(11) NOT NULL,
  `aae602` varchar(2) NOT NULL,
  `aae603` date NOT NULL,
  `aae604` int(11) NOT NULL,
  `aae605` text,
  PRIMARY KEY (`aae601`),
  KEY `FK_Reference_18` (`aae501`),
  KEY `FK_Reference_19` (`aae101`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`aae501`) REFERENCES `ae05` (`aae501`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae06
-- ----------------------------
INSERT INTO `ae06` VALUES ('1', '1', '3', '1', '2019-07-20', '10', '测试备注');
INSERT INTO `ae06` VALUES ('2', '1', '3', '1', '2019-07-24', '10', '测试');
INSERT INTO `ae06` VALUES ('3', '2', '3', '1', '2019-07-24', '123', '测试');

-- ----------------------------
-- Table structure for ae07
-- ----------------------------
DROP TABLE IF EXISTS `ae07`;
CREATE TABLE `ae07` (
  `aae701` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aae702` date NOT NULL,
  `aae703` varchar(20) NOT NULL,
  `aae704` varchar(6) NOT NULL,
  `aae705` int(11) NOT NULL COMMENT '01---本人，02---母亲，03---父亲，04---其他（写在备注里）',
  `aae706` varchar(15) NOT NULL,
  `aae707` varchar(6) NOT NULL,
  `aae708` int(11) NOT NULL,
  `aae709` text NOT NULL,
  `aae710` text NOT NULL,
  `aae711` datetime NOT NULL,
  `aae712` text,
  PRIMARY KEY (`aae701`),
  KEY `FK_Reference_3` (`aae101`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk COMMENT='招生部门咨询记录表';

-- ----------------------------
-- Records of ae07
-- ----------------------------
INSERT INTO `ae07` VALUES ('1', '10', '2019-07-20', '东软睿道', '测试家长1', '2', '123465', '测试学生1', '15', '测试概况', '测试意向', '2019-07-20 17:26:45', '测试备注');

-- ----------------------------
-- Table structure for ae08
-- ----------------------------
DROP TABLE IF EXISTS `ae08`;
CREATE TABLE `ae08` (
  `aae801` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aae802` date NOT NULL,
  `aae803` varchar(20) NOT NULL,
  `aae804` varchar(6) NOT NULL,
  `aae805` varchar(20) NOT NULL,
  `aae806` text,
  PRIMARY KEY (`aae801`),
  KEY `FK_Reference_15` (`aae101`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ae08
-- ----------------------------
INSERT INTO `ae08` VALUES ('1', '10', '2019-07-20', '天津东软', '测试学生1', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('2', '10', '2019-07-20', '天津东软', '测试学生1', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('3', '11', '2019-07-21', '东软睿道', '徐俊德', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('4', '11', '2019-07-21', '东软睿道', '姜弘义', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('5', '11', '2019-07-21', '东软睿道', '陆弘量', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('6', '11', '2019-07-21', '东软睿道', '李宏伯', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('7', '11', '2019-07-21', '东软睿道', '白元嘉', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('8', '11', '2019-07-21', '东软睿道', '田自珍', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('9', '11', '2019-07-21', '东软睿道', '曾俊艾', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('10', '11', '2019-07-21', '东软睿道', '康建柏', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('11', '11', '2019-07-21', '东软睿道', '易阳华', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('12', '11', '2019-07-21', '东软睿道', '万成益', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('13', '11', '2019-07-21', '东软睿道', '贺光启', '测试班级1', '测试');
INSERT INTO `ae08` VALUES ('14', '11', '2019-07-21', '东软睿道', '魏鸿宝', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('15', '11', '2019-07-21', '东软睿道', '尹凯乐', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('16', '11', '2019-07-21', '东软睿道', '许子平', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('17', '11', '2019-07-21', '东软睿道', '郝明旭', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('18', '11', '2019-07-21', '东软睿道', '邵嘉木', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('19', '11', '2019-07-21', '东软睿道', '傅永思', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('20', '11', '2019-07-21', '东软睿道', '武承弼', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('21', '11', '2019-07-21', '东软睿道', '邓永昌', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('22', '11', '2019-07-21', '东软睿道', '魏高兴', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('23', '11', '2019-07-21', '东软睿道', '高冠宇', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('24', '11', '2019-07-21', '东软睿道', '赖彭祖', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('25', '11', '2019-07-21', '东软睿道', '顾雅达', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('26', '11', '2019-07-22', '东软睿道', '苏智敏', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('27', '11', '2019-07-22', '东软睿道', '陈学海', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('28', '11', '2019-07-22', '东软睿道', '龚明杰', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('29', '11', '2019-07-22', '东软睿道', '熊鹏程', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('30', '11', '2019-07-22', '东软睿道', '潘文乐', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('31', '11', '2019-07-22', '东软睿道', '董弘业', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('32', '11', '2019-07-22', '东软睿道', '龙文轩', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('33', '11', '2019-07-22', '东软睿道', '周兴国', '测试班级3', '测试');
INSERT INTO `ae08` VALUES ('34', '11', '2019-07-22', '东软睿道', '范凯安', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('35', '11', '2019-07-22', '东软睿道', '廖向笛', '测试班级4', '测试');
INSERT INTO `ae08` VALUES ('38', '10', '2019-07-25', '东软', '测试学生', '测试班级5', '测试');

-- ----------------------------
-- Table structure for af02
-- ----------------------------
DROP TABLE IF EXISTS `af02`;
CREATE TABLE `af02` (
  `aaf201` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `af0_aae101` int(11) NOT NULL,
  `aaf202` date NOT NULL,
  `aaf203` text NOT NULL,
  `aaf204` text NOT NULL,
  PRIMARY KEY (`aaf201`),
  KEY `FK_Reference_30` (`aae101`),
  KEY `FK_Reference_31` (`af0_aae101`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`af0_aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of af02
-- ----------------------------
INSERT INTO `af02` VALUES ('2', '4', '8', '2019-07-17', '测试违纪原因', '测试处理结果');
INSERT INTO `af02` VALUES ('4', '4', '2', '2019-07-18', '测试违纪原因---2', '测试处理结果---2');
INSERT INTO `af02` VALUES ('5', '4', '2', '2019-07-18', '测试违纪原因---3', '测试处理结果---3');

-- ----------------------------
-- Table structure for af03
-- ----------------------------
DROP TABLE IF EXISTS `af03`;
CREATE TABLE `af03` (
  `aaf301` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aaf302` text NOT NULL,
  `aaf303` datetime NOT NULL,
  `aaf304` text NOT NULL,
  PRIMARY KEY (`aaf301`),
  KEY `FK_Reference_42` (`aae101`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of af03
-- ----------------------------
INSERT INTO `af03` VALUES ('1', '1', '为流水号为[ 2 ]的用户添加账号[ 20150002 ]', '2019-07-20 15:04:50', '添加账号成功');
INSERT INTO `af03` VALUES ('2', '1', '为流水号为[ 10 ]的用户添加账号[ 20150010 ]', '2019-07-20 15:07:53', '添加账号成功');
INSERT INTO `af03` VALUES ('3', '1', '停用流水号为[ 3 ]的账号', '2019-07-20 15:08:42', '停用账号');
INSERT INTO `af03` VALUES ('4', '1', '为流水号为[ 3 ]的账号修改账号信息', '2019-07-20 15:09:05', '修改账号成功');
INSERT INTO `af03` VALUES ('5', '1', '停用流水号为[ 3 ]的账号', '2019-07-20 15:09:07', '停用账号');
INSERT INTO `af03` VALUES ('6', '1', '为流水号为[ 3 ]的账号修改账号信息', '2019-07-20 15:09:14', '修改账号成功');
INSERT INTO `af03` VALUES ('7', '1', '停用流水号为[ 3 ]的账号', '2019-07-20 15:09:31', '停用账号');
INSERT INTO `af03` VALUES ('8', '1', '停用流水号为[ 3 ]的账号', '2019-07-20 15:09:31', '停用账号');
INSERT INTO `af03` VALUES ('9', '1', '为流水号为[ 3 ]的账号修改账号信息', '2019-07-20 15:09:34', '修改账号成功');
INSERT INTO `af03` VALUES ('10', '1', '批量停用账号', '2019-07-20 15:09:40', '停用账号');
INSERT INTO `af03` VALUES ('11', '1', '为流水号为[ 3 ]的账号修改账号信息', '2019-07-20 15:09:44', '修改账号成功');
INSERT INTO `af03` VALUES ('12', '1', '为流水号为[ 3 ]的用户添加账号[ 20150003 ]', '2019-07-20 15:10:04', '添加账号成功');
INSERT INTO `af03` VALUES ('13', '1', '为流水号为[ 4 ]的用户添加账号[ 20150004 ]', '2019-07-20 15:12:34', '添加账号成功');
INSERT INTO `af03` VALUES ('14', '1', '为流水号为[ 5 ]的用户添加账号[ 20150006 ]', '2019-07-20 15:12:44', '添加账号成功');
INSERT INTO `af03` VALUES ('15', '1', '为流水号为[ 6 ]的账号修改账号信息', '2019-07-20 15:14:50', '修改账号成功');
INSERT INTO `af03` VALUES ('16', '5', '添加姓名为[ 苏胜 ]的访客登记记录', '2019-07-20 15:18:13', '添加访客登记记录');
INSERT INTO `af03` VALUES ('17', '1', '为流水号为[ 6 ]的账号修改账号信息', '2019-07-20 15:29:59', '修改账号成功');
INSERT INTO `af03` VALUES ('18', '1', '为流水号为[ 6 ]的用户添加账号[ 20150006 ]', '2019-07-20 15:30:23', '添加账号成功');
INSERT INTO `af03` VALUES ('19', '1', '为流水号为[ 12 ]的用户添加账号[ 20150012 ]', '2019-07-20 15:32:56', '添加账号成功');
INSERT INTO `af03` VALUES ('20', '2', '添加了课程流水号为[ 1 ]的班级[ 1 ]', '2019-07-20 17:14:17', '班级添加成功');
INSERT INTO `af03` VALUES ('21', '2', '添加宿舍[ A101 ]的宿舍信息', '2019-07-20 17:15:00', '添加宿舍信息');
INSERT INTO `af03` VALUES ('22', '1', '为流水号为[ 11 ]的用户添加账号[ 20150011 ]', '2019-07-20 17:28:39', '添加账号成功');
INSERT INTO `af03` VALUES ('23', '2', '添加[ Java,2 ] 内容为[ String 是最基本的数据类型吗？ ]的题目信息', '2019-07-21 10:26:08', '添加题目信息');
INSERT INTO `af03` VALUES ('24', '2', '添加了课程流水号为[ 1 ]的班级[ 2 ]', '2019-07-21 16:37:46', '班级添加成功');
INSERT INTO `af03` VALUES ('25', '2', '修改流水号为[ 2 ]的课程信息', '2019-07-21 16:50:17', '修改课程');
INSERT INTO `af03` VALUES ('26', '2', '添加员工流水号为[ 4 ]的员工的违纪记录', '2019-07-21 17:03:31', '添加员工违纪记录');
INSERT INTO `af03` VALUES ('27', '2', '修改流水号为[ 1 ]的员工违纪记录', '2019-07-21 17:03:41', '修改员工违纪记录');
INSERT INTO `af03` VALUES ('28', '2', '修改流水号为[ 1 ]的员工违纪记录', '2019-07-21 17:03:47', '修改员工违纪记录');
INSERT INTO `af03` VALUES ('29', '2', '修改流水号为[ 1 ]的员工违纪记录', '2019-07-21 17:04:42', '修改员工违纪记录');
INSERT INTO `af03` VALUES ('30', '2', '添加宿舍[ A102 ]的宿舍信息', '2019-07-21 17:05:52', '添加宿舍信息');
INSERT INTO `af03` VALUES ('31', '2', '添加流水号为[ 1 ]的学生的违纪记录', '2019-07-21 17:07:28', '添加学生违纪记录');
INSERT INTO `af03` VALUES ('32', '2', '删除流水号为[ 3 ]的课程信息', '2019-07-21 17:46:28', '删除课程');
INSERT INTO `af03` VALUES ('33', '2', '添加宿舍[ A103 ]的宿舍信息', '2019-07-21 17:57:17', '添加宿舍信息');
INSERT INTO `af03` VALUES ('34', '2', '添加宿舍[ A104 ]的宿舍信息', '2019-07-21 17:57:23', '添加宿舍信息');
INSERT INTO `af03` VALUES ('35', '2', '添加宿舍[ A105 ]的宿舍信息', '2019-07-21 17:57:25', '添加宿舍信息');
INSERT INTO `af03` VALUES ('36', '2', '删除流水号为[ 5 ]的宿舍信息', '2019-07-21 17:57:38', '删除宿舍信息');
INSERT INTO `af03` VALUES ('37', '2', '添加员工流水号为[ 4 ]的员工的违纪记录', '2019-07-21 17:58:36', '添加员工违纪记录');
INSERT INTO `af03` VALUES ('38', '2', '添加员工流水号为[ 4 ]的员工的违纪记录', '2019-07-21 17:58:50', '添加员工违纪记录');
INSERT INTO `af03` VALUES ('39', '2', '添加员工流水号为[ 4 ]的员工的违纪记录', '2019-07-21 17:58:57', '添加员工违纪记录');
INSERT INTO `af03` VALUES ('40', '2', '添加员工流水号为[ 4 ]的员工的违纪记录', '2019-07-21 17:59:03', '添加员工违纪记录');
INSERT INTO `af03` VALUES ('41', '2', '删除流水号为[ 1 ]的员工违纪记录', '2019-07-21 17:59:11', '删除员工违纪记录');
INSERT INTO `af03` VALUES ('42', '2', '添加姓名为[ 周航 ]的访客登记记录', '2019-07-21 19:57:58', '添加访客登记记录');
INSERT INTO `af03` VALUES ('43', '2', '添加[ C#,1 ] 内容为[ 编写一个控制台应用程序，要求用户输入4个int值，并显示他们的乘积。 ]的题目信息', '2019-07-21 20:00:20', '添加题目信息');
INSERT INTO `af03` VALUES ('44', '2', '修改流水号为[ 2 ]的题目信息', '2019-07-21 20:00:26', '修改题目信息');
INSERT INTO `af03` VALUES ('45', '1', '为流水号为[ 21 ]的用户添加账号[ 20190008 ]', '2019-07-21 23:34:57', '添加账号成功');
INSERT INTO `af03` VALUES ('46', '1', '为流水号为[ 22 ]的用户添加账号[ 20190009 ]', '2019-07-21 23:35:15', '添加账号成功');
INSERT INTO `af03` VALUES ('47', '2', '修改流水号为[ 2 ]的班级信息', '2019-07-21 23:37:23', '修改班级信息');
INSERT INTO `af03` VALUES ('48', '2', '添加了课程流水号为[ 2 ]的班级[ 3 ]', '2019-07-21 23:38:38', '班级添加成功');
INSERT INTO `af03` VALUES ('49', '2', '添加了课程流水号为[ 4 ]的班级[ 4 ]', '2019-07-21 23:39:23', '班级添加成功');
INSERT INTO `af03` VALUES ('50', '2', '添加[ Java,1 ] 内容为[  运算符优先级别排序正确的是（）\r\n\r\nA、 由高向低分别是：()、!、算术运算符、关系运算符、逻辑运算符、赋值运算符；\r\n\r\nB、 由高向低分别是：()、关系运算符、算术运算符、赋值运算符、!、逻辑运算符；\r\n\r\nC、 由高向低分别是：()、算术运算符、逻辑运算符、关系运算符、!、赋值运算符；\r\n\r\nD、 由高向低分别是：()、!、关系运算符、赋值运算符、算术运算符、逻辑运算符； ]的题目信息', '2019-07-22 01:51:09', '添加题目信息');
INSERT INTO `af03` VALUES ('51', '2', '添加[ Java,1 ] 内容为[ 下列值不为true的表达式有（）。\r\n\r\nA、 \"john\" = = \"john\"\r\n\r\nB、 \"john\".equals(\"john\")\r\n\r\nC、 \"john\" = \"john\"\r\n\r\nD、 \"john\".equals(new String(\"john\")) ]的题目信息', '2019-07-22 01:52:07', '添加题目信息');
INSERT INTO `af03` VALUES ('52', '2', '添加[ Java,1 ] 内容为[ 下面有关for循环的描述正确的是（）\r\n\r\nA、 for循环体语句中，可以包含多条语句，但要用大括号括起来\r\n\r\nB、 for循环只能用于循环次数已经确定的情况\r\n\r\nC、 在for循环中，不能使用break语句跳出循环\r\n\r\nD、 for循环是先执行循环体语句，后进行条件判断 ]的题目信息', '2019-07-22 01:52:23', '添加题目信息');
INSERT INTO `af03` VALUES ('53', '2', '添加[ Java,1 ] 内容为[ 对象的特征在类中表示为变量，称为类的（）。\r\n\r\nA、 对象\r\n\r\nB、 属性\r\n\r\nC、 方法\r\n\r\nD、 数据类型 ]的题目信息', '2019-07-22 01:52:38', '添加题目信息');
INSERT INTO `af03` VALUES ('54', '2', '添加[ Java,1 ] 内容为[ 在java中下列关于自动类型转换说法正确的是（）\r\n\r\nA、 基本数据类型和String相加结果一定是字符串型\r\n\r\nB、 char类型和int类型相加结果一定是字符\r\n\r\nC、 double类型可以自动转换为int\r\n\r\nD、 char + int + double +\"\" 结果一定是double； ]的题目信息', '2019-07-22 01:52:53', '添加题目信息');
INSERT INTO `af03` VALUES ('55', '2', '添加[ Java,1 ] 内容为[ 以下（）代码，能够对数组正确初始化（或者是默认初始化）。\r\n\r\nA、 int[] a;\r\n\r\nB、 a = {1, 2, 3, 4, 5};\r\n\r\nC、 int[] a = new int[5]{1, 2, 3, 4, 5};\r\n\r\nD、 int[] a = new int[5]; ]的题目信息', '2019-07-22 01:53:05', '添加题目信息');
INSERT INTO `af03` VALUES ('56', '2', '添加[ Java,1 ] 内容为[ 在Java中,关于构造方法，下列说法错误的是( )\r\n\r\nA、 构造方法的名称必须与类名相同\r\n\r\nB、 构造方法可以带参数\r\n\r\nC、 构造方法不可以重载\r\n\r\nD、 构造方法绝对不能有返回值 ]的题目信息', '2019-07-22 01:53:27', '添加题目信息');
INSERT INTO `af03` VALUES ('57', '1', '为流水号为[ 14 ]的用户添加账号[ 20190001 ]', '2019-07-22 14:14:56', '添加账号成功');
INSERT INTO `af03` VALUES ('58', '6', '为流水号为[ 1 ]的学生修改学籍', '2019-07-23 16:28:22', '修改学籍成功');
INSERT INTO `af03` VALUES ('59', '4', '流水号为[ 4 ]的教师提交了教研成果', '2019-07-23 16:44:01', '提交成果成功');
INSERT INTO `af03` VALUES ('60', '4', '流水号为[ 4 ]的教师提交了成果查看申请', '2019-07-23 16:44:24', '提交成果查看申请成功');
INSERT INTO `af03` VALUES ('61', '14', '流水号为[ 14 ]的教师提交了成果查看申请', '2019-07-23 16:46:28', '提交成果查看申请成功');
INSERT INTO `af03` VALUES ('62', '2', '驳回流水号为[ 12 ]的教学成果查看申请', '2019-07-23 16:46:53', '驳回教学成果查看申请');
INSERT INTO `af03` VALUES ('63', '2', '驳回流水号为[ 8 ]的教学成果查看申请', '2019-07-23 16:46:55', '驳回教学成果查看申请');
INSERT INTO `af03` VALUES ('64', '4', '添加新的教研活动', '2019-07-23 18:10:59', '修改成功');
INSERT INTO `af03` VALUES ('65', '4', '为流水号为[ 4 ]的教研方案添加教研活动', '2019-07-23 18:16:06', '添加成功');
INSERT INTO `af03` VALUES ('66', '4', '为流水号为[ 4 ]的教研方案添加教研活动', '2019-07-23 18:16:32', '添加成功');
INSERT INTO `af03` VALUES ('67', '4', '为流水号为[ 4 ]的教研方案添加教研活动', '2019-07-23 18:16:51', '添加成功');
INSERT INTO `af03` VALUES ('68', '4', '删除流水号为[ 8 ]的教研活动', '2019-07-23 18:25:15', '删除成功');
INSERT INTO `af03` VALUES ('69', '4', '为流水号为[ 4 ]的教研方案添加教研活动', '2019-07-23 18:25:33', '添加成功');
INSERT INTO `af03` VALUES ('70', '4', '批量删除教研活动', '2019-07-23 18:25:39', '删除成功');
INSERT INTO `af03` VALUES ('71', '4', '批量删除教研活动', '2019-07-23 18:26:12', '删除成功');
INSERT INTO `af03` VALUES ('72', '4', '批量删除教研活动', '2019-07-23 18:26:34', '删除成功');
INSERT INTO `af03` VALUES ('73', '4', '批量删除教研活动', '2019-07-23 18:28:34', '删除成功');
INSERT INTO `af03` VALUES ('74', '4', '添加新的教研活动', '2019-07-23 18:38:01', '修改成功');
INSERT INTO `af03` VALUES ('75', '4', '添加新的教研活动', '2019-07-23 18:38:22', '修改成功');
INSERT INTO `af03` VALUES ('76', '4', '添加新的教研活动', '2019-07-23 18:42:14', '修改成功');
INSERT INTO `af03` VALUES ('77', '4', '添加新的教研活动', '2019-07-23 18:43:48', '修改成功');
INSERT INTO `af03` VALUES ('78', '4', '添加新的教研活动', '2019-07-23 18:45:16', '修改成功');
INSERT INTO `af03` VALUES ('79', '4', '删除流水号为[ null ]的教研活动', '2019-07-23 18:49:16', '删除成功');
INSERT INTO `af03` VALUES ('80', '4', '删除流水号为[ null ]的教研活动', '2019-07-23 18:49:18', '删除成功');
INSERT INTO `af03` VALUES ('81', '4', '删除流水号为[ null ]的教研活动', '2019-07-23 18:49:20', '删除成功');
INSERT INTO `af03` VALUES ('82', '4', '删除流水号为[ null ]的教研活动', '2019-07-23 18:49:21', '删除成功');
INSERT INTO `af03` VALUES ('83', '4', '删除流水号为[ null ]的教研活动', '2019-07-23 18:49:22', '删除成功');
INSERT INTO `af03` VALUES ('84', '4', '添加新的教研活动', '2019-07-23 18:50:10', '修改成功');
INSERT INTO `af03` VALUES ('85', '4', '撤销流水号为[ null ]的教研活动', '2019-07-23 18:50:14', '撤销成功');
INSERT INTO `af03` VALUES ('86', '4', '修改流水号为[ 3 ]的教研底稿', '2019-07-23 18:50:31', '修改成功');
INSERT INTO `af03` VALUES ('87', '4', '修改流水号为[ 3 ]的教研底稿', '2019-07-23 18:50:34', '修改成功');
INSERT INTO `af03` VALUES ('88', '4', '删除流水号为[ 4 ]的教研底稿', '2019-07-23 18:51:49', '删除成功');
INSERT INTO `af03` VALUES ('89', '4', '添加新的教研底稿', '2019-07-23 18:51:58', '添加成功');
INSERT INTO `af03` VALUES ('90', '4', '添加新的经费申请', '2019-07-23 18:52:21', '添加成功');
INSERT INTO `af03` VALUES ('91', '4', '添加新的经费申请', '2019-07-23 18:57:51', '添加成功');
INSERT INTO `af03` VALUES ('92', '4', '删除流水号为[ 5 ]的经费申请', '2019-07-23 18:57:55', '删除成功');
INSERT INTO `af03` VALUES ('93', '4', '添加新的教学日志', '2019-07-23 18:58:16', '添加成功');
INSERT INTO `af03` VALUES ('94', '4', '添加新的考试信息', '2019-07-23 19:06:36', '添加成功');
INSERT INTO `af03` VALUES ('95', '4', '删除流水号为[ 1 ]的考试信息', '2019-07-23 19:09:55', '删除成功');
INSERT INTO `af03` VALUES ('96', '4', '添加新的考试信息', '2019-07-23 19:11:49', '添加成功');
INSERT INTO `af03` VALUES ('97', '4', '批量添加考题', '2019-07-23 19:12:02', '批量添加成功');
INSERT INTO `af03` VALUES ('98', '4', '添加新的考勤记录', '2019-07-23 19:24:50', '添加成功');
INSERT INTO `af03` VALUES ('99', '4', '添加新的课题', '2019-07-23 19:25:43', '添加成功');
INSERT INTO `af03` VALUES ('100', '4', '删除流水号为[ 1 ]的课题', '2019-07-23 19:25:49', '删除成功');
INSERT INTO `af03` VALUES ('101', '4', '添加新的课题', '2019-07-23 19:26:04', '添加成功');
INSERT INTO `af03` VALUES ('102', '4', '添加新的课题组成员', '2019-07-23 19:30:30', '添加成功');
INSERT INTO `af03` VALUES ('103', '4', '添加新的课题组成员', '2019-07-23 19:31:44', '添加成功');
INSERT INTO `af03` VALUES ('104', '4', '添加新的经费申请', '2019-07-23 19:38:35', '添加成功');
INSERT INTO `af03` VALUES ('105', '2', '拒绝流水号为[ 6 ]的经费申请', '2019-07-23 19:38:47', '操作成功');
INSERT INTO `af03` VALUES ('106', '2', '通过流水号为[ 6 ]的经费申请', '2019-07-23 19:39:28', '操作成功');
INSERT INTO `af03` VALUES ('107', '12', '为流水号为[ 6 ]的缴费单缴费', '2019-07-23 19:40:13', '缴费成功');
INSERT INTO `af03` VALUES ('108', '12', '审查流水号为[ 1 ]的资金收支记录', '2019-07-23 19:44:13', '审查成功');
INSERT INTO `af03` VALUES ('109', '12', '修改流水号为[ 3 ]的缴费单', '2019-07-23 19:47:33', '修改成功');
INSERT INTO `af03` VALUES ('110', '12', '为流水号为[ 3 ]的缴费单缴费', '2019-07-23 19:47:47', '缴费成功');
INSERT INTO `af03` VALUES ('111', '12', '新建休假申请', '2019-07-23 19:57:51', '新建休假申请成功');
INSERT INTO `af03` VALUES ('112', '12', '新建物资申请', '2019-07-23 19:58:03', '新建物资申请成功');
INSERT INTO `af03` VALUES ('113', '3', '审核流水号为[3]的物资申请', '2019-07-23 19:58:41', '审核物资申请成功');
INSERT INTO `af03` VALUES ('114', '3', '审核流水号为[2]的物资申请', '2019-07-23 19:58:48', '审核物资申请成功');
INSERT INTO `af03` VALUES ('115', '3', '审核流水号为[2]的休假申请', '2019-07-23 19:59:15', '审核休假申请成功');
INSERT INTO `af03` VALUES ('116', '4', '添加新的考试信息', '2019-07-24 09:19:23', '添加成功');
INSERT INTO `af03` VALUES ('117', '4', '批量添加考题', '2019-07-24 09:19:44', '批量添加成功');
INSERT INTO `af03` VALUES ('118', '2', '添加姓名为[ 测试1 ]的访客登记记录', '2019-07-24 09:24:11', '添加访客登记记录');
INSERT INTO `af03` VALUES ('119', '2', '删除流水号为[ 3 ]的访客登记记录', '2019-07-24 09:24:22', '删除访客登记记录');
INSERT INTO `af03` VALUES ('120', '2', '添加姓名为[ 测试1 ]的访客登记记录', '2019-07-24 09:24:53', '添加访客登记记录');
INSERT INTO `af03` VALUES ('121', '2', '添加姓名为[ 测试2 ]的访客登记记录', '2019-07-24 09:25:27', '添加访客登记记录');
INSERT INTO `af03` VALUES ('122', '2', '批量删除流水号为[ 4,5 ]的访客登记记录', '2019-07-24 09:25:32', '批量删除访客登记记录');
INSERT INTO `af03` VALUES ('123', '2', '添加了课程流水号为[ 1 ]的班级[ 5 ]', '2019-07-24 09:28:08', '班级添加成功');
INSERT INTO `af03` VALUES ('124', '2', '将流水号为[ 5,2 ]的班级合并为流水号为[ 6 ]的班级', '2019-07-24 09:28:58', '合并班级');
INSERT INTO `af03` VALUES ('125', '2', '删除流水号为[ 6 ]的班级', '2019-07-24 09:33:26', '删除班级成功');
INSERT INTO `af03` VALUES ('126', '2', '添加了课程流水号为[ 1 ]的班级[ 7 ]', '2019-07-24 09:35:43', '班级添加成功');
INSERT INTO `af03` VALUES ('127', '2', '删除流水号为[ 7 ]的班级', '2019-07-24 09:35:50', '删除班级成功');
INSERT INTO `af03` VALUES ('128', '2', '添加[ Java,1 ] 内容为[ 测试 ]的题目信息', '2019-07-24 09:36:24', '添加题目信息');
INSERT INTO `af03` VALUES ('129', '2', '修改宿舍[ A103 ]的宿舍信息', '2019-07-24 09:37:02', '修改宿舍信息');
INSERT INTO `af03` VALUES ('130', '2', '删除流水号为[ 4 ]的宿舍信息', '2019-07-24 09:37:18', '删除宿舍信息');
INSERT INTO `af03` VALUES ('131', '2', '添加宿舍[ A104 ]的宿舍信息', '2019-07-24 09:37:51', '添加宿舍信息');
INSERT INTO `af03` VALUES ('132', '2', '修改宿舍[ A104 ]的宿舍信息', '2019-07-24 09:37:58', '修改宿舍信息');
INSERT INTO `af03` VALUES ('133', '2', '修改宿舍[ A104 ]的宿舍信息', '2019-07-24 09:38:05', '修改宿舍信息');
INSERT INTO `af03` VALUES ('134', '2', '修改宿舍[ A104 ]的宿舍信息', '2019-07-24 09:39:27', '修改宿舍信息');
INSERT INTO `af03` VALUES ('135', '2', '添加流水号为[ 1 ]的学生的违纪记录', '2019-07-24 09:41:16', '添加学生违纪记录');
INSERT INTO `af03` VALUES ('136', '2', '删除流水号为[ 2 ]的学生违纪记录', '2019-07-24 09:41:36', '删除学生违纪记录');
INSERT INTO `af03` VALUES ('137', '2', '添加流水号为[ 1 ]的学生的违纪记录', '2019-07-24 09:41:56', '添加学生违纪记录');
INSERT INTO `af03` VALUES ('138', '2', '添加流水号为[ 1 ]的学生的违纪记录', '2019-07-24 09:42:10', '添加学生违纪记录');
INSERT INTO `af03` VALUES ('139', '2', '批量删除流水号为[ 4,3 ]的学生违纪记录', '2019-07-24 09:42:16', '批量删除学生违纪记录');
INSERT INTO `af03` VALUES ('140', '2', '添加员工流水号为[ 2 ]的员工的违纪记录', '2019-07-24 09:42:52', '添加员工违纪记录');
INSERT INTO `af03` VALUES ('141', '2', '批量删除流水号为[ 6,3 ]的员工违纪记录', '2019-07-24 09:42:59', '批量删除员工违纪记录');
INSERT INTO `af03` VALUES ('142', '2', '修改流水号为[ 1 ]的课程信息', '2019-07-24 09:43:08', '修改课程');
INSERT INTO `af03` VALUES ('143', '2', '批量删除流水号为[ [Ljava.lang.String;@204d31cc ]的课程信息', '2019-07-24 09:44:39', '批量删除课程');
INSERT INTO `af03` VALUES ('144', '2', '删除流水号为[ 6 ]的课程信息', '2019-07-24 09:44:40', '删除课程');
INSERT INTO `af03` VALUES ('145', '1', '为流水号为[ 7 ]的用户添加账号[ 20150007 ]', '2019-07-24 09:45:33', '添加账号成功');
INSERT INTO `af03` VALUES ('146', '1', '停用流水号为[ 7 ]的账号', '2019-07-24 09:45:39', '停用账号');
INSERT INTO `af03` VALUES ('147', '1', '停用流水号为[ 7 ]的账号', '2019-07-24 09:45:39', '停用账号');
INSERT INTO `af03` VALUES ('148', '1', '为流水号为[ 7 ]的账号修改账号信息', '2019-07-24 09:47:01', '修改账号成功');
INSERT INTO `af03` VALUES ('149', '1', '为流水号为[ 7 ]的账号修改账号信息', '2019-07-24 09:47:23', '修改账号成功');
INSERT INTO `af03` VALUES ('150', '1', '为流水号为[ 7 ]的账号修改账号信息', '2019-07-24 09:47:37', '修改账号成功');
INSERT INTO `af03` VALUES ('151', '1', '为流水号为[ 7 ]的账号修改账号信息', '2019-07-24 09:48:09', '修改账号成功');
INSERT INTO `af03` VALUES ('152', '1', '为流水号为[ 13 ]的账号修改账号信息', '2019-07-24 09:48:37', '修改账号成功');
INSERT INTO `af03` VALUES ('153', '1', '为流水号为[ 13 ]的账号修改账号信息', '2019-07-24 09:48:54', '修改账号成功');
INSERT INTO `af03` VALUES ('154', '2', '批准流水号为[ 9 ]的学生提出的状态变更申请', '2019-07-24 09:50:33', '批准学生状态变更申请成功');
INSERT INTO `af03` VALUES ('155', '3', '修改部门信息,部门名[总务部]', '2019-07-24 09:56:05', '修改部门信息成功');
INSERT INTO `af03` VALUES ('156', '3', '变更流水号为[1]的物资信息', '2019-07-24 10:03:26', '变更物资信息成功');
INSERT INTO `af03` VALUES ('157', '3', '新建物资信息', '2019-07-24 10:03:48', '新建物资信息成功');
INSERT INTO `af03` VALUES ('158', '3', '变更流水号为[2]的物资信息', '2019-07-24 10:04:32', '变更物资信息成功');
INSERT INTO `af03` VALUES ('159', '4', '添加新的学生成绩', '2019-07-24 11:38:13', '添加成功');
INSERT INTO `af03` VALUES ('160', '4', '流水号为[ 4 ]的教师提交了教研成果', '2019-07-24 13:10:57', '提交成果成功');
INSERT INTO `af03` VALUES ('161', '4', '添加新的教研底稿', '2019-07-25 11:49:53', '添加成功');
INSERT INTO `af03` VALUES ('162', '4', '删除流水号为[ 6 ]的教研底稿', '2019-07-25 11:50:04', '删除成功');
INSERT INTO `af03` VALUES ('163', '4', '添加新的教研底稿', '2019-07-25 14:47:12', '添加成功');
INSERT INTO `af03` VALUES ('164', '4', '删除流水号为[ 7 ]的教研底稿', '2019-07-25 14:47:25', '删除成功');
INSERT INTO `af03` VALUES ('165', '3', '添加新的经费申请', '2019-07-25 15:12:53', '添加成功');
INSERT INTO `af03` VALUES ('166', '4', '流水号为[ 4 ]的教师提交了成果查看申请', '2019-07-25 15:26:35', '提交成果查看申请成功');
INSERT INTO `af03` VALUES ('167', '4', '流水号为[ 4 ]的教师提交了教研成果', '2019-07-25 15:28:23', '提交成果成功');
INSERT INTO `af03` VALUES ('168', '4', '添加新的经费申请', '2019-07-25 15:29:33', '添加成功');
INSERT INTO `af03` VALUES ('169', '10', '添加学生编号为[20190044]的报名信息,学籍信息及学费单', '2019-07-25 15:55:01', '添加报名信息成功');
INSERT INTO `af03` VALUES ('170', '3', '新员工入职,编号[20190023]', '2019-07-25 16:09:29', '新员工入职成功');
INSERT INTO `af03` VALUES ('171', '2', '将流水号为[ 5,2 ]的班级合并为流水号为[ 8 ]的班级', '2019-07-25 16:12:10', '合并班级');
INSERT INTO `af03` VALUES ('172', '3', '修改员工流水号为[2]的员工信息', '2019-07-25 16:15:30', '修改员工信息成功');
INSERT INTO `af03` VALUES ('173', '10', '添加学生编号为[20190002]的入住信息及住宿费缴费单', '2019-07-25 16:43:10', '添加入住信息成功');
INSERT INTO `af03` VALUES ('174', '10', '添加学生编号为[20190003]的入住信息及住宿费缴费单', '2019-07-25 16:43:24', '添加入住信息成功');
INSERT INTO `af03` VALUES ('175', '10', '添加学生编号为[20190004]的入住信息及住宿费缴费单', '2019-07-25 16:43:36', '添加入住信息成功');
INSERT INTO `af03` VALUES ('176', '6', '为流水号为[ 1 ]的学生添加宿舍变更申请', '2019-07-25 16:45:05', '添加宿舍变更申请成功');
INSERT INTO `af03` VALUES ('177', '2', '驳回流水号为[ 12 ]的教学成果查看申请', '2019-07-25 16:55:23', '驳回教学成果查看申请');
INSERT INTO `af03` VALUES ('178', '2', '驳回流水号为[ 13 ]的教学成果查看申请', '2019-07-25 16:55:24', '驳回教学成果查看申请');
INSERT INTO `af03` VALUES ('179', '6', '修改流水号为[ 2 ]的证书发放记录', '2019-07-25 16:55:51', '修改证书发放记录成功');
INSERT INTO `af03` VALUES ('180', '14', '流水号为[ 14 ]的教师提交了成果查看申请', '2019-07-25 16:56:33', '提交成果查看申请成功');
INSERT INTO `af03` VALUES ('181', '12', '审查流水号为[ 3 ]的资金收支记录', '2019-07-26 10:21:03', '审查成功');
INSERT INTO `af03` VALUES ('182', '12', '审查流水号为[ 4 ]的资金收支记录', '2019-07-26 10:29:44', '审查成功');
INSERT INTO `af03` VALUES ('183', '4', '添加新的经费申请', '2019-07-26 11:47:38', '添加成功');
INSERT INTO `af03` VALUES ('184', '2', '通过流水号为[ 9 ]的经费申请', '2019-07-26 11:48:17', '操作成功');

-- ----------------------------
-- Table structure for af04
-- ----------------------------
DROP TABLE IF EXISTS `af04`;
CREATE TABLE `af04` (
  `aaf401` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `aaf402` varchar(6) NOT NULL,
  `aaf403` datetime NOT NULL,
  `aaf404` datetime NOT NULL,
  `aaf405` varchar(20) NOT NULL,
  `aaf406` varchar(15) NOT NULL,
  `aaf407` varchar(50) NOT NULL,
  `aaf408` text NOT NULL,
  `aaf409` text,
  PRIMARY KEY (`aaf401`),
  KEY `FK_Reference_26` (`aae101`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of af04
-- ----------------------------
INSERT INTO `af04` VALUES ('1', '5', '苏胜', '2019-07-20 15:15:00', '2019-07-20 16:00:00', '400000000000000000', '10000', '武汉大学信息学部', '测试来访目的', '测试备注');
INSERT INTO `af04` VALUES ('2', '2', '周航', '2019-07-20 10:00:00', '2019-07-20 11:00:00', '400000000000000000', '10000', '武汉大学信息学部', '测试', '测试');

-- ----------------------------
-- Table structure for af05
-- ----------------------------
DROP TABLE IF EXISTS `af05`;
CREATE TABLE `af05` (
  `aaf501` int(11) NOT NULL AUTO_INCREMENT,
  `aaf502` char(1) NOT NULL,
  `aaf503` varchar(10) NOT NULL,
  `aaf504` text NOT NULL,
  `aaf505` text NOT NULL,
  `aaf506` text,
  PRIMARY KEY (`aaf501`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of af05
-- ----------------------------
INSERT INTO `af05` VALUES ('1', '2', 'Java', 'String 是最基本的数据类型吗？', '不是。Java中的基本数据类型只有8个：byte、short、int、long、float、double、char、boolean；除了基本类型（primitive type）和枚举类型（enumeration type），剩下的都是引用类型（reference type）。', '基本数据类型');
INSERT INTO `af05` VALUES ('2', '2', 'C#', '编写一个控制台应用程序，要求用户输入4个int值，并显示他们的乘积。', 'Console.WriteLine(\"请输入4个整数，以回车为分隔：\");\r\nint a = Convert.ToInt32(Console.ReadLine());\r\nint b = Convert.ToInt32(Console.ReadLine());\r\nint c = Convert.ToInt32(Console.ReadLine());\r\nint d = Convert.ToInt32(Console.ReadLine());\r\n\r\ndouble s = a * b * c * d;\r\n\r\nConsole.WriteLine(\"四个数的乘积是：\"+s);', 'int乘法');
INSERT INTO `af05` VALUES ('3', '1', 'Java', ' 运算符优先级别排序正确的是（）\r\n\r\nA、 由高向低分别是：()、!、算术运算符、关系运算符、逻辑运算符、赋值运算符；\r\n\r\nB、 由高向低分别是：()、关系运算符、算术运算符、赋值运算符、!、逻辑运算符；\r\n\r\nC、 由高向低分别是：()、算术运算符、逻辑运算符、关系运算符、!、赋值运算符；\r\n\r\nD、 由高向低分别是：()、!、关系运算符、赋值运算符、算术运算符、逻辑运算符；', 'A', null);
INSERT INTO `af05` VALUES ('4', '1', 'Java', '下列值不为true的表达式有（）。\r\n\r\nA、 \"john\" = = \"john\"\r\n\r\nB、 \"john\".equals(\"john\")\r\n\r\nC、 \"john\" = \"john\"\r\n\r\nD、 \"john\".equals(new String(\"john\"))', 'C', null);
INSERT INTO `af05` VALUES ('5', '1', 'Java', '下面有关for循环的描述正确的是（）\r\n\r\nA、 for循环体语句中，可以包含多条语句，但要用大括号括起来\r\n\r\nB、 for循环只能用于循环次数已经确定的情况\r\n\r\nC、 在for循环中，不能使用break语句跳出循环\r\n\r\nD、 for循环是先执行循环体语句，后进行条件判断', 'A', null);
INSERT INTO `af05` VALUES ('6', '1', 'Java', '对象的特征在类中表示为变量，称为类的（）。\r\n\r\nA、 对象\r\n\r\nB、 属性\r\n\r\nC、 方法\r\n\r\nD、 数据类型', 'B', null);
INSERT INTO `af05` VALUES ('7', '1', 'Java', '在java中下列关于自动类型转换说法正确的是（）\r\n\r\nA、 基本数据类型和String相加结果一定是字符串型\r\n\r\nB、 char类型和int类型相加结果一定是字符\r\n\r\nC、 double类型可以自动转换为int\r\n\r\nD、 char + int + double +\"\" 结果一定是double；', 'A', null);
INSERT INTO `af05` VALUES ('8', '1', 'Java', '以下（）代码，能够对数组正确初始化（或者是默认初始化）。\r\n\r\nA、 int[] a;\r\n\r\nB、 a = {1, 2, 3, 4, 5};\r\n\r\nC、 int[] a = new int[5]{1, 2, 3, 4, 5};\r\n\r\nD、 int[] a = new int[5];', 'D', null);
INSERT INTO `af05` VALUES ('9', '1', 'Java', '在Java中,关于构造方法，下列说法错误的是( )\r\n\r\nA、 构造方法的名称必须与类名相同\r\n\r\nB、 构造方法可以带参数\r\n\r\nC、 构造方法不可以重载\r\n\r\nD、 构造方法绝对不能有返回值', 'C', null);
INSERT INTO `af05` VALUES ('10', '1', 'Java', '\n下面（）不是String类提供的合法的方法。\n\nA、 equals(String)\n\nB、 trim()\n\nC、 append()\n\nD、 indexOf()\n', '\nC\n', null);
INSERT INTO `af05` VALUES ('11', '1', 'Java', '\n在JAVA中，以下（ ）类的对象以键-值的方式存储对象\n\nA、 java.util.List\n\nB、 java.util.ArrayList\n\nC、 java.util.HashMap\n\nD、 java.util.LinkedList\n', '\nC\n', null);
INSERT INTO `af05` VALUES ('12', '1', 'Java', '\n在Java语言中，下列关于类的继承的描述，正确的是（）。\n\nA、 一个类可以继承多个父类\n\nB、 一个类可以具有多个子类\n\nC、 子类可以使用父类的所有方法\n\nD、 子类一定比父类有更多的成员方法\n', '\nB\n', null);
INSERT INTO `af05` VALUES ('13', '1', 'Java', '\n下列选项中关于Java中super关键字的说法正确的是（）。\n\nA、 super关键字是在子类对象内部指代其父类对象的引用\n\nB、 super关键字不仅可以指代子类的直接父类，还可以指代父类的父类\n\nC、 子类通过super关键字只能调用父类的方法，而不能调用父类的属性\n\nD、 子类通过super关键字只能调用父类的属性，而不能调用父类的方法\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('14', '1', 'Java', '\n在JAVA的异常处理模型中，能单独和finally语句一起使用的块是（）。\n\nA、 try\n\nB、 catch\n\nC、 throw\n\nD、 throws\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('15', '1', 'Java', '\n下列选项中关于Java中封装的说法错误的是（）。\n\nA、 封装就是将属性私有化，提供共有的方法访问私有属性\n\nB、 属性的访问方法包括setter方法和getter方法\n\nC、 setter方法用于赋值，getter方法用于取值\n\nD、 包含属性的类都必须封装属性，否则无法通过编译\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('16', '1', 'Java', '\nJava中，如果类C是类B的子类，类B是类A的子类，那么下面描述正确的是（）\n\nA、 C不仅继承了B中的成员，同样也继承了A中的成员\n\nB、 C只继承了B中的成员\n\nC、 C只继承了A中的成员\n\nD、 C不能继承A或B中的成员\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('17', '1', 'Java', '\n在JAVA中，LinkedList类和ArrayList类同属于集合框架类，下列（）选项中的方法是LinkedList类有而ArrayList类没有的。\n\nA、 add(Object o)\n\nB、 add(int index，Object o)\n\nC、 remove(Object o)\n\nD、 removeLast()\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('18', '1', 'Java', '\n以下关于抽象类和接口的说法错误的是（）\n\nA、 抽象类在Java语言中表示的是一种继承关系，一个类只能使用一次继承。但是一个类却可以实现多个接口。\n\nB、 在抽象类中可以没有抽象方法\n\nC、 实现抽象类和接口的类必须实现其中的所有方法，除非它也是抽象类。接口中的方法都不能被实现\n\nD、 接口中定义的变量默认是public static final 型，且必须给其初值，所以实现类中不能重新定义，也不能改变其值。\n\nE、 接口中的方法都必须加上public关键字。\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('19', '1', 'Java', '\n关于面向对象的说法正确的是（）\n\nA、 类可以让我们用程序模拟现实世界中的实体 \n\nB、 有多少个实体就要创建多少个类\n\nC、 对象的行为和属性被封装在类中，外界通过调用类的方法来获得，但是要知道类的内部是如何实现\n\nD、 现实世界中的某些实体不能用类来描述\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('20', '2', 'C++', '\n C++中什么数据分配在栈或堆，静态存储区以及常量存储区中？\n', '\n栈，里面的变量通常是局部变量、函数参数等。\n堆，就是那些由 new 分配的内存块\n全局/静态存储区，全局变量和静态变量被分配到同一块内存中\n常量存储区，这是一块比较特殊的存储区，他们里面存放的是常量，不允许修改\n', null);
INSERT INTO `af05` VALUES ('21', '2', 'C++', '\nC++编译器自动为类产生的四个缺省函数是什么？\n', '\n默认构造函数、析构函数、拷贝构造函数、赋值函数\n', null);
INSERT INTO `af05` VALUES ('22', '2', 'C++', '\n我们可以用static修饰一个类的成员函数，也可以用const修饰类的而成员函数请问：能不能同时用const和static修饰类的成员函数? 并进行说明.\n', '\n\n不可以。\nC++编译器在实现const的成员函数的时候为了确保该函数不能修改类的实例的状态，会在函数中添加一个隐式的参数const this*。\n但当一个成员为static的时候，该函数是没有this指针的。也就是说此时const的用法和static是冲突的。\n', null);
INSERT INTO `af05` VALUES ('23', '2', 'C++', '\n在C++中，构造函数是没有返回值的，那么该如何处理构造函数中可能发生的错误（例如资源分配失败）？\n', '\nTry catch 抛出异常，或者assert\n', null);
INSERT INTO `af05` VALUES ('24', '2', 'C++', '\n为什么析构函数建议加virtual属性\n', '\n如果delete一个基类的指针时， 如果它指向的是一个子类的对象，那么析构函数不为虚就会导致无法调用子类析构函数，从而导致资源泄露。\n', null);
INSERT INTO `af05` VALUES ('25', '2', 'C++', '\n请简述深拷贝和浅拷贝的定义。\n', '\n深拷贝：如果一个类拥有资源，当这个类的对象发生复制过程的时候，资源重新分配，这个过程就是深拷贝，\n反之，没有重新分配资源，就是浅拷贝。\n', null);
INSERT INTO `af05` VALUES ('26', '2', 'C++', '\n简述多态作用及应用方式？\n', '\n\n多态：同一操作作用于不同的对象，可以有不同的解释，产生不同的执行结果。\n在运行时，可以通过指向基类的指针，来调用实现派生类中的方法。C++中，实现多态有以下方法：虚函数，抽象类，覆盖，模板\n（重载和多态无关）。C++中的多态性具体体现在运行和编译两个方面。运行时多态是动态多态，其具体引用的对象在运行时才能确定。\n编译时多态是静态多态，在编译时就可以确定对象使用的形式。\n', null);
INSERT INTO `af05` VALUES ('27', '2', 'C++', '\n C++拷贝构造函数和赋值用算符有那些不同和相同点？\n', '\n相同点：实现复制功能\n不同点：copy：源对象存在而目标对象未被创建\n=：源对象和目标对象都不存在\n', null);
INSERT INTO `af05` VALUES ('28', '2', 'C++', '\n评价多继承的优点和缺点。\n', '\n多重继承的优点是对象可以调用多个基类中的接口具备多个基类的特性。\n多重继承的缺点是容易出现继承向上的二义性，会造成冗余和浪费。\n', null);
INSERT INTO `af05` VALUES ('29', '2', 'C++', '\n什么是虚指针？\n', '\n用virtual关键字申明的函数叫做虚函数，虚函数肯定是类的成员函数。\n存在虚函数的类都有一个一维的虚函数表叫做虚表。类的对象有一个指向虚表开始的虚指针。\n虚表是和类对应的，虚表指针是和对象对应的。\n', null);
INSERT INTO `af05` VALUES ('30', '2', 'C++', '\n虚函数的入口地址和普通函数有什么不同？\n', '\n\n每个虚函数都在vtable中占了一个表项，保存真一条跳到它的入口地址的指令（实际上\n就是保存了它的入口地址）。当一个包含虚函数的对象（注意，不是对象的指针）被创建的时候，它在头部附加了一个指针，指向vtable中相应\n的位置。\n调用虚函数的时候，不管你是用什么指针调用，它先根据vtable找到入口地址再执行，从而实现了“动态联编”。\n普通函数只是简单的\n跳到一个固定的地址。\n\n', null);
INSERT INTO `af05` VALUES ('31', '2', 'C++', '\n简述C++语言中的dynamic_cast相对于C语言中强制类型转换的必要性.\n', '\n1.用在多态的子类情况下,父类不能提供处理接口,这时可以针对子类做特殊的处理。\n2.dynamic_cast比另外3个cast优势就是会对转换进行检查，如果出错，会报错。', null);
INSERT INTO `af05` VALUES ('32', '2', 'Java', '\n什么是JavaBean？\n', '\n一个可以重复使用的软件组件，是遵循一定标准、用java语言编写的一个类，该类的一个实例称为JavaBean，简称bean（非可视化的javabean）\n', null);
INSERT INTO `af05` VALUES ('33', '2', 'Java', '\n什么是Java虚拟机？为什么Java被称作是“平台无关的编程语言”？\n ', '\nJava虚拟机是一个可以执行Java字节码的虚拟机进程。Java源文件被编译成能被Java虚拟机执行的字节码文件。 \nJava被设计成允许应用程序可以运行在任意的平台，而不需要程序员为每一个平台单独重写或者是重新编译。\nJava虚拟机让这个变为可能，因为它知道底层硬件平台的指令长度和其他特性。\n', null);
INSERT INTO `af05` VALUES ('34', '2', 'Java', '\nJDK和JRE的区别是什么？\n', '\nJava运行时环境(JRE)是将要执行Java程序的Java虚拟机。它同时也包含了执行applet需要的浏览器插件。\nJava开发工具包(JDK)是完整的Java软件开发包，包含了JRE，编译器和其他的工具(比如：JavaDoc，Java调试器)，\n可以让开发者开发、编译、执行Java应用程序。\n', null);
INSERT INTO `af05` VALUES ('35', '2', 'Java', '\n\"static\"关键字是什么意思？Java中是否可以覆盖(override)一个private或者是static的方法？\n', '\n“static”关键字表明一个成员变量或者是成员方法可以在没有所属的类的实例变量的情况下被访问。 \nJava中static方法不能被覆盖，因为方法覆盖是基于运行时动态绑定的，而static方法是编译时静态绑定的。\nstatic方法跟类的任何实例都不相关，所以概念上不适用。\n', null);
INSERT INTO `af05` VALUES ('36', '2', 'Java', '\nJava中的方法覆盖(Overriding)和方法重载(Overloading)是什么意思？\n', '\nJava中的方法重载发生在同一个类里面两个或者是多个方法的方法名相同但是参数不同的情况。与此相对，方法覆盖是说子类重新定义了父类的方法。\n方法覆盖必须有相同的方法名，参数列表和返回类型。覆盖者可能不会限制它所覆盖的方法的访问。\n', null);
INSERT INTO `af05` VALUES ('37', '2', 'Java', '\n什么是值传递和引用传递？\n ', '\n值传递是对基本型变量而言的,传递的是该变量的一个副本,改变副本不影响原变量. \n引用传递一般是对于对象型变量而言的,传递的是该对象地址的一个副本, 并不是原对象本身 。 \n所以对引用对象进行操作会同时改变原对象. \n一般认为,java内的传递都是值传递.\n', null);
INSERT INTO `af05` VALUES ('38', '2', 'Java', '\n进程和线程的区别是什么？ \n', '\n进程是执行着的应用程序，而线程是进程内部的一个执行序列。一个进程可以有多个线程。线程又叫做轻量级进程。\n', null);
INSERT INTO `af05` VALUES ('39', '2', 'Java', '\n创建线程有几种不同的方式？你喜欢哪一种？为什么？\n ', '\n有三种方式可以用来创建线程： \n继承Thread类\n实现Runnable接口 \n应用程序可以使用Executor框架来创建线程池 \n实现Runnable接口这种方式更受欢迎，因为这不需要继承Thread类。在应用设计中已经继承了别的对象的情况下，\n这需要多继承（而Java不支持多继承），只能实现接口。同时，线程池也是非常高效的，很容易实现和使用。\n', null);
INSERT INTO `af05` VALUES ('40', '2', 'Java', '\n在监视器(Monitor)内部，是如何做线程同步的？程序应该做哪种级别的同步？ \n', '\n监视器和锁在Java虚拟机中是一块使用的。监视器监视一块同步代码块，确保一次只有一个线程执行同步代码块。\n每一个监视器都和一个对象引用相关联。线程在获取锁之前不允许执行同步代码。\n', null);
INSERT INTO `af05` VALUES ('41', '2', 'Java', '\n什么是死锁(deadlock)？ \n', '\n两个线程或两个以上线程都在等待对方执行完毕才能继续往下执行的时候就发生了死锁。结果就是这些线程都陷入了无限的等待中。\n', null);
INSERT INTO `af05` VALUES ('42', '2', 'Java', '\n什么是迭代器(Iterator)？ \n', '\nIterator接口提供了很多对集合元素进行迭代的方法。每一个集合类都包含了可以返回迭代器实例的 \n迭代方法。\n迭代器可以在迭代的过程中删除底层集合的元素,但是不可以直接调用集合的 \nremove(Object Obj)删除，可以通过\n迭代器的remove()方法删除。\n', null);
INSERT INTO `af05` VALUES ('43', '2', 'Java', '\nJava中的HashMap的工作原理是什么？\n', '\nJava中的HashMap是以键值对(key-value)的形式存储元素的。HashMap需要一个hash函数，它使用hashCode()和equals()方法\n来向集合/从集合添加和检索元素。当调用put()方法的时候，HashMap会计算key的hash值，然后把键值对存储在集合中合适的索引上。\n如果key已经存在了，value会被更新成新值。HashMap的一些重要的特性是它的容量(capacity)，负载因子(load factor)和扩容极限(threshold resizing)。\n', null);
INSERT INTO `af05` VALUES ('44', '2', 'Java', '\nhashCode()和equals()方法的重要性体现在什么地方？\n', '\nJava中的HashMap使用hashCode()和equals()方法来确定键值对的索引，当根据键获取值的时候也会用到这两个方法。如果没有正确\n的实现这两个方法，两个不同的键可能会有相同的hash值，因此，可能会被集合认为是相等的。而且，这两个方法也用来发现重复元素。\n所以这两个方法的实现对HashMap的精确性和正确性是至关重要的。\n', null);
INSERT INTO `af05` VALUES ('45', '2', 'Java', '\nHashMap和Hashtable有什么区别？\n', '\nHashMap和Hashtable都实现了Map接口，因此很多特性非常相似。但是，他们有以下不同点： \nHashMap允许键和值是null，\n而Hashtable不允许键或者值是null。 \nHashtable是同步的，而HashMap不是。因此，HashMap更适合于单线程环境，而Hashtable适合\n于多线程环境。 \nHashMap提供了可供应用迭代的键的集合，因此，HashMap是快速失败的。另一方面，Hashtable提供了对键的\n列举(Enumeration)。 \n一般认为Hashtable是一个遗留的类。\n', null);
INSERT INTO `af05` VALUES ('46', '2', 'Java', '\nComparable和Comparator接口是干什么的？列出它们的区别。\n', '\nJava提供了只包含一个compareTo()方法的Comparable接口。这个方法可以个给两个对象排序。具体来说，它返回负数，0，正数来\n表明已经存在的对象小于，等于，大于输入对象。 \nJava提供了包含compare()和equals()两个方法的Comparator接口。compare()方法\n用来给两个输入参数排序，返回负数，0，正数表明第一个参数是小于，等于，大于第二个参数。equals()方法需要一个对象作为参数，它\n用来决定输入参数是否和comparator相等。只有当输入参数也是一个comparator并且输入参数和当前comparator的排序结果是相同的\n时候，这个方法才返回true。\n', null);
INSERT INTO `af05` VALUES ('47', '2', 'Java', '\n如何权衡是使用无序的数组还是有序的数组？ \n', '\n有序数组最大的好处在于查找的时间复杂度是O(log n)，而无序数组是O(n)。有序数组的缺点是插入操作的时间复杂度是O(n)，\n因为值大的元素需要往后移动来给新元素腾位置。相反，无序数组的插入时间复杂度是常量O(1)。\n', null);
INSERT INTO `af05` VALUES ('48', '2', 'Java', '\nEnumeration接口和Iterator接口的区别有哪些？ \n', '\nEnumeration速度是Iterator的2倍，同时占用更少的内存。但是，Iterator远远比Enumeration安全，因为其他线程不能够修改正在\n被iterator遍历的集合里面的对象。同时，Iterator允许调用者删除底层集合里面的元素，这对Enumeration来说是不可能的。\n', null);
INSERT INTO `af05` VALUES ('49', '1', 'C++', '\n在面向对象方法中，不属于“对象”基本特点的是( )。\nA) 一致性 \nB) 分类性 \nC) 多态性 \nD) 标识唯一性\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('50', '1', 'C++', '\n对类的构造函数和析构函数描述正确的是()。\n  A. 构造函数可以重载，析构函数不能重载\n  B. 构造函数不能重载，析构函数可以重载\n  C. 构造函数可以重载，析构函数也可以重载\n  D. 构造函数不能重载，析构函数也不能重裁\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('51', '1', 'C++', '\nC++系统预定义了4个用于标准数据流的对象，下列选项中不属于此类对象的是()。\nA. cout\nB. cin\nC. cerr\nD. cset\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('52', '1', 'C++', '\n下列情况中，不会调用拷贝构造函数的是（）。\n??????? \nA. 用一个对象去初始化同一类的另一个新对象时\n??????? \nB. 将类的一个对象赋值给该类的另一个对象时\n??????? \nC. 函数的形参是类的对象，调用函数进行形参和实参结合时\n??????? \nD. 函数的返回值是类的对象，函数执行返回调用时\n', '\nB\n', null);
INSERT INTO `af05` VALUES ('53', '1', 'C++', '\n下列字符串中可以用作C++标识符的是（ ）\nA. _123	B. foo~bar\nC. case	D. 3var\n', '\n A\n', null);
INSERT INTO `af05` VALUES ('54', '1', 'C++', '\n字符串\"student\"占用几个字节的空间（  ）\nA. 7	B. 6	C. 5	D. 8\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('55', '1', 'C++', '\n在int a[][3]={{1},{3,2},{4,5,6},{0}}中，a[2][2]的值是（  ）\nA. 3	B.2	C. 6	D. 4\n', '\nC\n', null);
INSERT INTO `af05` VALUES ('56', '1', 'C++', '\n在C++语言中，对函数参数默认值描述正确的是（ ）\nA. 函数参数的默认值只能设定一个。\nB. 一个函数的参数若有多个，则参数默认值的设定可以不连续。\nC. 函数参数必须设定默认值。\nD. 在设定了参数的默认值后，该参数后面定义的所有参数都必须设定默认值。\n', '\nD \n', null);
INSERT INTO `af05` VALUES ('57', '1', 'C++', '\n声明类Test的拷贝构造函数的正确形式是（ ）\nA. int Test	B. void Test	C. Test(void)	D. Test(Test &)\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('58', '1', 'C++', '\n下列关于构造函数的描述中，错误的是（  ）\nA. 构造函数可以设置默认参数。\nB. 构造函数在声明对象时自动执行。\nC. 构造函数可以对静态数据成员进行初始化。\nD. 构造函数可以重载。\n', '\nC\n', null);
INSERT INTO `af05` VALUES ('59', '1', 'C++', '\n循环语句whlie(int i=0 )i--;的循环次数是（  ）\nA. 0	B. 1	C. 5	D. 无限\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('60', '1', 'C++', '\n一个函数无返回值时，应选择的说明符是（  ）\nA. static	B.extern	C. void	D. 无说明符\n', '\nC\n', null);
INSERT INTO `af05` VALUES ('61', '1', 'C++', '\n若数组名作实参而指针变量作形参，函数调用时实参传给形参的是（ ）\nA. 数组的长度\nB. 数组第一个元素的值\nC. 数组所有元素的值\nD. 数组第一个元素的地址\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('62', '1', 'C++', '\n能够释放对象所占资源的是（  ）\nA. 析构函数	B. 数据成员	C. 构造函数	D. 静态成员函数\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('63', '1', 'C++', '\n下列关于C++函数的叙述中，正确的是（ ）\nA. 每个函数至少要具有一个参数。	B. 每个函数都必须返回一个值。\nC. 函数在被调用之前必须先声明。	D. 函数不能自己调用自己。\n', '\nC\n', null);
INSERT INTO `af05` VALUES ('64', '1', 'C++', '\n下列关于类和对象的叙述中，错误的是（  ）\nA. 一个类只能有一个对象。\nB. 对象是类的具体实例。\nC. 类是对某一类对象的抽象。\nD. 类和对象的关系是一种数据类型与变量的关系。\n', '\nA\n', null);
INSERT INTO `af05` VALUES ('65', '1', 'C++', '\n将两个字符串连接起来组成一个字符串时，应选用的函数是（  ）\nA. strlen()	B. strcpy() C. strcat() D. strcmp()\n', '\nC', null);
INSERT INTO `af05` VALUES ('66', '1', 'C++', '\n若有以下类型标识符定义 :\nint x=2; char w=\'a\'; float y=23.45f; double z=45.6712;\n则表达式w*x+y-z的结果类型是（  ）\nA. float	B. char	C. int	D. double\n', '\nD\n', null);
INSERT INTO `af05` VALUES ('67', '1', 'Java', '测试', '测试', '测试');

-- ----------------------------
-- Table structure for af06
-- ----------------------------
DROP TABLE IF EXISTS `af06`;
CREATE TABLE `af06` (
  `aaf601` int(11) NOT NULL AUTO_INCREMENT,
  `aaf501` int(11) DEFAULT NULL,
  `aab601` int(11) DEFAULT NULL,
  PRIMARY KEY (`aaf601`),
  KEY `FK_Reference_59` (`aaf501`),
  KEY `FK_Reference_60` (`aab601`),
  CONSTRAINT `FK_Reference_59` FOREIGN KEY (`aaf501`) REFERENCES `af05` (`aaf501`),
  CONSTRAINT `FK_Reference_60` FOREIGN KEY (`aab601`) REFERENCES `ab06` (`aab601`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of af06
-- ----------------------------
INSERT INTO `af06` VALUES ('1', '7', '2');
INSERT INTO `af06` VALUES ('2', '6', '2');
INSERT INTO `af06` VALUES ('3', '19', '2');
INSERT INTO `af06` VALUES ('4', '18', '2');
INSERT INTO `af06` VALUES ('5', '11', '2');
INSERT INTO `af06` VALUES ('6', '13', '2');
INSERT INTO `af06` VALUES ('7', '10', '2');
INSERT INTO `af06` VALUES ('8', '14', '2');
INSERT INTO `af06` VALUES ('9', '5', '2');
INSERT INTO `af06` VALUES ('10', '16', '2');
INSERT INTO `af06` VALUES ('11', '47', '2');
INSERT INTO `af06` VALUES ('12', '48', '2');
INSERT INTO `af06` VALUES ('13', '33', '2');
INSERT INTO `af06` VALUES ('14', '37', '2');
INSERT INTO `af06` VALUES ('15', '45', '2');
INSERT INTO `af06` VALUES ('16', '35', '2');
INSERT INTO `af06` VALUES ('17', '46', '2');
INSERT INTO `af06` VALUES ('18', '42', '2');
INSERT INTO `af06` VALUES ('19', '36', '2');
INSERT INTO `af06` VALUES ('20', '43', '2');
INSERT INTO `af06` VALUES ('21', '5', '3');
INSERT INTO `af06` VALUES ('22', '11', '3');
INSERT INTO `af06` VALUES ('23', '4', '3');
INSERT INTO `af06` VALUES ('24', '14', '3');
INSERT INTO `af06` VALUES ('25', '7', '3');
INSERT INTO `af06` VALUES ('26', '15', '3');
INSERT INTO `af06` VALUES ('27', '3', '3');
INSERT INTO `af06` VALUES ('28', '9', '3');
INSERT INTO `af06` VALUES ('29', '19', '3');
INSERT INTO `af06` VALUES ('30', '10', '3');
INSERT INTO `af06` VALUES ('31', '38', '3');
INSERT INTO `af06` VALUES ('32', '35', '3');
INSERT INTO `af06` VALUES ('33', '47', '3');
INSERT INTO `af06` VALUES ('34', '39', '3');
INSERT INTO `af06` VALUES ('35', '43', '3');
INSERT INTO `af06` VALUES ('36', '41', '3');
INSERT INTO `af06` VALUES ('37', '45', '3');
INSERT INTO `af06` VALUES ('38', '44', '3');
INSERT INTO `af06` VALUES ('39', '33', '3');
INSERT INTO `af06` VALUES ('40', '1', '3');

-- ----------------------------
-- Table structure for sa01
-- ----------------------------
DROP TABLE IF EXISTS `sa01`;
CREATE TABLE `sa01` (
  `ssa101` int(11) NOT NULL AUTO_INCREMENT,
  `ssa102` varchar(8) NOT NULL,
  `ssa103` varchar(20) NOT NULL,
  `ssa104` varchar(100) NOT NULL,
  `ssa105` varchar(1) NOT NULL COMMENT '1--有效\n            2--停用',
  PRIMARY KEY (`ssa101`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sa01
-- ----------------------------
INSERT INTO `sa01` VALUES ('1', 'EA01', '账号管理', 'eA01Query.html', '1');
INSERT INTO `sa01` VALUES ('2', 'EA06', '课程管理', 'eA06Query.html', '1');
INSERT INTO `sa01` VALUES ('3', 'EA0701', '员工违纪管理', 'eA0701Query.html', '1');
INSERT INTO `sa01` VALUES ('4', 'EA0702', '学生违纪管理', 'eA0702Query.html', '1');
INSERT INTO `sa01` VALUES ('5', 'EA1001', '宿舍信息管理', 'eA1001Query.html', '1');
INSERT INTO `sa01` VALUES ('6', 'EA15', '题库管理', 'eA15Query.html', '1');
INSERT INTO `sa01` VALUES ('7', 'EA04', '班级管理', 'eA0301Query.html', '1');
INSERT INTO `sa01` VALUES ('8', 'EA09', '来访登记管理', 'eA0901Query.html', '1');
INSERT INTO `sa01` VALUES ('9', 'EA08', '工作记录', 'EA0801Query.html', '1');
INSERT INTO `sa01` VALUES ('11', 'EC0901', '教研方案管理', 'EC0901QueryPlan.html', '1');
INSERT INTO `sa01` VALUES ('12', 'EC1101', '教研底稿管理', 'EC1101QueryDraft.html', '1');
INSERT INTO `sa01` VALUES ('13', 'EC1001', '经费申请管理', 'EC1001QueryFRequest.html', '1');
INSERT INTO `sa01` VALUES ('14', 'EA1401', '经费审批管理', 'EA1401QueryCFRequest.html', '1');
INSERT INTO `sa01` VALUES ('15', 'EB0201', '经费拨出与结算', 'EB0201QueryAFRequest.html', '1');
INSERT INTO `sa01` VALUES ('16', 'EC1201', '教研成果管理', 'EC1201QueryResult.html', '1');
INSERT INTO `sa01` VALUES ('17', 'EB0101', '缴费管理', 'EB0101QueryPay.html', '1');
INSERT INTO `sa01` VALUES ('18', 'ED0601', '资金审查', 'ED0601QueryFundRecord.html', '1');
INSERT INTO `sa01` VALUES ('19', 'EC0101', '教学日志编写', 'EC0101QueryJournal.html', '1');
INSERT INTO `sa01` VALUES ('20', 'EC0201', '考试管理', 'EC0201QueryExam.html', '1');
INSERT INTO `sa01` VALUES ('21', 'EC0202', '试卷生成', 'EC0202ExamPaper.html', '1');
INSERT INTO `sa01` VALUES ('22', 'EC0301', '成绩管理', 'EC0301QueryScore.html', '1');
INSERT INTO `sa01` VALUES ('23', 'EC0501', '学生考勤', 'EC0501QueryAbsence.html', '1');
INSERT INTO `sa01` VALUES ('24', 'EC0601', '课题立项', 'EC0601QuerySubject.html', '1');
INSERT INTO `sa01` VALUES ('25', 'EC0801', '课题组设定', 'EC0801QueryMember.html', '1');
INSERT INTO `sa01` VALUES ('26', 'EE01', '咨询管理', 'EE0101.html', '1');
INSERT INTO `sa01` VALUES ('28', 'EE02', '学生报名', 'eE0201.html', '1');
INSERT INTO `sa01` VALUES ('29', 'EE03', '入住办理', 'EA1001QueryForSub.html', '1');
INSERT INTO `sa01` VALUES ('30', 'EF01', '部门管理', 'eF0101.html', '1');
INSERT INTO `sa01` VALUES ('31', 'EF02', '员工管理', 'eF0201.html', '1');
INSERT INTO `sa01` VALUES ('32', 'EF04', '休假管理', 'eF0401.html', '1');
INSERT INTO `sa01` VALUES ('33', 'EF05', '个人休假申请', 'eF0501.html', '1');
INSERT INTO `sa01` VALUES ('34', 'EF06', '个人物资申请', 'eF0601.html', '1');
INSERT INTO `sa01` VALUES ('35', 'EF07', '物资申请管理', 'eF0701.html', '1');
INSERT INTO `sa01` VALUES ('36', 'EF08', '物资管理', 'eF0801.html', '1');
INSERT INTO `sa01` VALUES ('38', 'EA0201', '转班申请审批', 'EA0201.html', '1');
INSERT INTO `sa01` VALUES ('39', 'EA0202', '退休复学申请审批', 'EA0203.html', '1');
INSERT INTO `sa01` VALUES ('40', 'EA0203', '宿舍调转申请审批', 'EA0205.html', '1');
INSERT INTO `sa01` VALUES ('41', 'EA13', '教研方案审阅', 'EA1301.html', '1');
INSERT INTO `sa01` VALUES ('42', 'EA12', '教研成果查阅授权', 'EA1201QueryRequestToLook.html', '1');
INSERT INTO `sa01` VALUES ('43', 'EA11', '日志批阅', 'EA1101.html', '1');
INSERT INTO `sa01` VALUES ('45', 'ED04', '转班申请记录', 'changeClassRecords.html', '1');
INSERT INTO `sa01` VALUES ('46', 'ED02', '退、休、复学申请', 'stuReqRecords.html', '1');
INSERT INTO `sa01` VALUES ('47', 'ED01', '学籍维护', 'queryStu.html', '1');
INSERT INTO `sa01` VALUES ('48', 'ED07', '奖惩处理记录', 'ED0702.html', '1');
INSERT INTO `sa01` VALUES ('49', 'ED06', '证书发放记录', 'ED0602.html', '1');
INSERT INTO `sa01` VALUES ('50', 'ED05', '宿舍调转申请记录', 'ED0502.html', '1');

-- ----------------------------
-- Table structure for sa02
-- ----------------------------
DROP TABLE IF EXISTS `sa02`;
CREATE TABLE `sa02` (
  `ssa201` int(11) NOT NULL AUTO_INCREMENT,
  `ssa202` varchar(10) NOT NULL,
  `ssa203` varchar(1) NOT NULL COMMENT '1--在用\n            2--停用\n            ',
  `ssa204` text NOT NULL,
  PRIMARY KEY (`ssa201`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sa02
-- ----------------------------
INSERT INTO `sa02` VALUES ('1', '老师', '1', '角色:老师');
INSERT INTO `sa02` VALUES ('2', '班主任', '1', '角色:班主任');
INSERT INTO `sa02` VALUES ('3', '总务', '1', '角色:总务');
INSERT INTO `sa02` VALUES ('4', '财务', '1', '角色:财务');
INSERT INTO `sa02` VALUES ('5', '咨询', '1', '角色:咨询部门');
INSERT INTO `sa02` VALUES ('6', '内务', '1', '角色:内务部门');
INSERT INTO `sa02` VALUES ('7', '账号管理', '1', '角色:账号管理');
INSERT INTO `sa02` VALUES ('8', '门卫', '1', '角色:门房/前台');

-- ----------------------------
-- Table structure for sa03
-- ----------------------------
DROP TABLE IF EXISTS `sa03`;
CREATE TABLE `sa03` (
  `ssa301` int(11) NOT NULL AUTO_INCREMENT,
  `ssa101` int(11) DEFAULT NULL,
  `ssa201` int(11) DEFAULT NULL,
  `ssa302` varchar(1) NOT NULL COMMENT '1--在用\n            2--停用',
  PRIMARY KEY (`ssa301`),
  KEY `FK_Reference_2` (`ssa101`),
  KEY `FK_Reference_65` (`ssa201`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`ssa101`) REFERENCES `sa01` (`ssa101`),
  CONSTRAINT `FK_Reference_65` FOREIGN KEY (`ssa201`) REFERENCES `sa02` (`ssa201`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sa03
-- ----------------------------
INSERT INTO `sa03` VALUES ('1', '2', '3', '1');
INSERT INTO `sa03` VALUES ('2', '3', '3', '1');
INSERT INTO `sa03` VALUES ('3', '4', '3', '1');
INSERT INTO `sa03` VALUES ('4', '5', '3', '1');
INSERT INTO `sa03` VALUES ('5', '1', '7', '1');
INSERT INTO `sa03` VALUES ('6', '6', '3', '1');
INSERT INTO `sa03` VALUES ('7', '7', '3', '1');
INSERT INTO `sa03` VALUES ('8', '8', '3', '1');
INSERT INTO `sa03` VALUES ('9', '9', '3', '1');
INSERT INTO `sa03` VALUES ('10', '11', '1', '1');
INSERT INTO `sa03` VALUES ('11', '12', '1', '1');
INSERT INTO `sa03` VALUES ('12', '13', '1', '1');
INSERT INTO `sa03` VALUES ('13', '14', '3', '1');
INSERT INTO `sa03` VALUES ('14', '15', '4', '1');
INSERT INTO `sa03` VALUES ('15', '16', '1', '1');
INSERT INTO `sa03` VALUES ('16', '17', '4', '1');
INSERT INTO `sa03` VALUES ('17', '18', '4', '1');
INSERT INTO `sa03` VALUES ('18', '8', '8', '1');
INSERT INTO `sa03` VALUES ('19', '19', '1', '1');
INSERT INTO `sa03` VALUES ('20', '20', '1', '1');
INSERT INTO `sa03` VALUES ('21', '21', '1', '1');
INSERT INTO `sa03` VALUES ('22', '22', '1', '1');
INSERT INTO `sa03` VALUES ('23', '23', '1', '1');
INSERT INTO `sa03` VALUES ('24', '24', '1', '1');
INSERT INTO `sa03` VALUES ('25', '25', '1', '1');
INSERT INTO `sa03` VALUES ('26', '26', '5', '1');
INSERT INTO `sa03` VALUES ('28', '28', '5', '1');
INSERT INTO `sa03` VALUES ('29', '29', '5', '1');
INSERT INTO `sa03` VALUES ('30', '30', '6', '1');
INSERT INTO `sa03` VALUES ('31', '31', '6', '1');
INSERT INTO `sa03` VALUES ('32', '32', '6', '1');
INSERT INTO `sa03` VALUES ('33', '35', '6', '1');
INSERT INTO `sa03` VALUES ('34', '36', '6', '1');
INSERT INTO `sa03` VALUES ('35', '33', '1', '1');
INSERT INTO `sa03` VALUES ('36', '33', '2', '1');
INSERT INTO `sa03` VALUES ('37', '33', '3', '1');
INSERT INTO `sa03` VALUES ('38', '33', '4', '1');
INSERT INTO `sa03` VALUES ('39', '33', '5', '1');
INSERT INTO `sa03` VALUES ('40', '34', '1', '1');
INSERT INTO `sa03` VALUES ('41', '34', '2', '1');
INSERT INTO `sa03` VALUES ('42', '34', '3', '1');
INSERT INTO `sa03` VALUES ('43', '34', '4', '1');
INSERT INTO `sa03` VALUES ('44', '34', '5', '1');
INSERT INTO `sa03` VALUES ('46', '38', '3', '1');
INSERT INTO `sa03` VALUES ('47', '39', '3', '1');
INSERT INTO `sa03` VALUES ('48', '40', '3', '1');
INSERT INTO `sa03` VALUES ('49', '41', '3', '1');
INSERT INTO `sa03` VALUES ('50', '42', '3', '1');
INSERT INTO `sa03` VALUES ('51', '43', '3', '1');
INSERT INTO `sa03` VALUES ('52', '45', '2', '1');
INSERT INTO `sa03` VALUES ('53', '46', '2', '1');
INSERT INTO `sa03` VALUES ('54', '47', '2', '1');
INSERT INTO `sa03` VALUES ('55', '48', '2', '1');
INSERT INTO `sa03` VALUES ('56', '49', '2', '1');
INSERT INTO `sa03` VALUES ('57', '50', '2', '1');
INSERT INTO `sa03` VALUES ('58', '9', '1', '1');
INSERT INTO `sa03` VALUES ('59', '9', '2', '1');
INSERT INTO `sa03` VALUES ('60', '9', '4', '1');
INSERT INTO `sa03` VALUES ('61', '9', '5', '1');
INSERT INTO `sa03` VALUES ('62', '9', '6', '1');
INSERT INTO `sa03` VALUES ('63', '9', '7', '1');
INSERT INTO `sa03` VALUES ('64', '9', '8', '1');
INSERT INTO `sa03` VALUES ('65', '13', '6', '1');

-- ----------------------------
-- Table structure for sa04
-- ----------------------------
DROP TABLE IF EXISTS `sa04`;
CREATE TABLE `sa04` (
  `ssa401` int(11) NOT NULL AUTO_INCREMENT,
  `aae101` int(11) NOT NULL,
  `ssa402` varchar(20) NOT NULL,
  `ssa404` varchar(32) NOT NULL,
  `ssa405` varchar(1) NOT NULL COMMENT '1--在用\n            2--停用',
  PRIMARY KEY (`ssa401`),
  UNIQUE KEY `AK_Key_2` (`ssa402`),
  KEY `FK_Reference_55` (`aae101`),
  CONSTRAINT `FK_Reference_55` FOREIGN KEY (`aae101`) REFERENCES `ae01` (`aae101`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sa04
-- ----------------------------
INSERT INTO `sa04` VALUES ('1', '1', 'test1', '90464e5c0aa02be366102ec9ae368b09', '1');
INSERT INTO `sa04` VALUES ('2', '2', '20150002', 'd93605cb326cb7d586b4174ad1a59d2b', '1');
INSERT INTO `sa04` VALUES ('3', '10', '20150010', '6df86aecf01fb7f410169d3a4ef0aa95', '1');
INSERT INTO `sa04` VALUES ('4', '3', '20150003', '4b0b890e4fc79c26b8cd8c8f14e46e06', '1');
INSERT INTO `sa04` VALUES ('5', '4', '20150004', '5c4cc3f19b647f0f3cb3fcf56878071b', '1');
INSERT INTO `sa04` VALUES ('6', '5', '20150005', 'f9fc798b27647ab4b262edb82a9fd2eb', '1');
INSERT INTO `sa04` VALUES ('7', '6', '20150006', '933208dbe1c58db2e595cc7540f904e1', '1');
INSERT INTO `sa04` VALUES ('8', '12', '20150012', '23ee7a87ae8bf9eacd56176464cf52d4', '1');
INSERT INTO `sa04` VALUES ('9', '11', '20150011', '7a4bee41a6c9698ce5fd7ecac6119dfc', '1');
INSERT INTO `sa04` VALUES ('10', '21', '20190008', 'a95a7c090b5175b11b6e6bfd5c0aa51f', '1');
INSERT INTO `sa04` VALUES ('11', '22', '20190009', 'e771da5a920ab2bc339419205c0b5a25', '1');
INSERT INTO `sa04` VALUES ('12', '14', '20190001', '209cefcbe521ee641139d8fd90696df2', '1');
INSERT INTO `sa04` VALUES ('13', '7', '20150007', 'a42a08834707559136d20bb8928b014e', '1');

-- ----------------------------
-- Table structure for sa05
-- ----------------------------
DROP TABLE IF EXISTS `sa05`;
CREATE TABLE `sa05` (
  `ssa501` int(11) NOT NULL AUTO_INCREMENT,
  `ssa401` int(11) NOT NULL,
  `ssa201` int(11) NOT NULL,
  `ssa502` varchar(1) NOT NULL,
  PRIMARY KEY (`ssa501`),
  KEY `FK_Reference_5` (`ssa201`),
  KEY `FK_Reference_64` (`ssa401`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`ssa201`) REFERENCES `sa02` (`ssa201`),
  CONSTRAINT `FK_Reference_64` FOREIGN KEY (`ssa401`) REFERENCES `sa04` (`ssa401`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sa05
-- ----------------------------
INSERT INTO `sa05` VALUES ('1', '1', '7', '1');
INSERT INTO `sa05` VALUES ('2', '2', '3', '1');
INSERT INTO `sa05` VALUES ('3', '3', '5', '1');
INSERT INTO `sa05` VALUES ('4', '4', '6', '1');
INSERT INTO `sa05` VALUES ('5', '5', '1', '1');
INSERT INTO `sa05` VALUES ('6', '6', '8', '1');
INSERT INTO `sa05` VALUES ('7', '7', '2', '1');
INSERT INTO `sa05` VALUES ('8', '8', '4', '1');
INSERT INTO `sa05` VALUES ('9', '9', '5', '1');
INSERT INTO `sa05` VALUES ('10', '10', '2', '1');
INSERT INTO `sa05` VALUES ('11', '11', '2', '1');
INSERT INTO `sa05` VALUES ('12', '12', '1', '1');
INSERT INTO `sa05` VALUES ('13', '13', '2', '1');

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `pkname` varchar(50) NOT NULL,
  `pkvalue` int(11) NOT NULL,
  `sdate` date DEFAULT NULL,
  PRIMARY KEY (`seqid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('1', 'Co', '9', '2019-07-20');
INSERT INTO `sequence` VALUES ('2', 'Class', '8', '2019-07-20');
INSERT INTO `sequence` VALUES ('3', 'aab301', '8', null);
INSERT INTO `sequence` VALUES ('4', 'S', '37', '2019-07-20');
INSERT INTO `sequence` VALUES ('5', 'aad101', '4', null);
INSERT INTO `sequence` VALUES ('6', 'aac301', '11', null);
INSERT INTO `sequence` VALUES ('7', 'aac401', '9', null);
INSERT INTO `sequence` VALUES ('8', 'aac1001', '10', null);
INSERT INTO `sequence` VALUES ('9', 'E', '23', '2019-07-21');
INSERT INTO `sequence` VALUES ('10', 'aab101', '37', null);
INSERT INTO `sequence` VALUES ('11', 'aae101', '23', null);

-- ----------------------------
-- Table structure for syscode
-- ----------------------------
DROP TABLE IF EXISTS `syscode`;
CREATE TABLE `syscode` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(10) NOT NULL,
  `fcode` varchar(50) NOT NULL,
  `fvalue` varchar(20) NOT NULL,
  `pfcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of syscode
-- ----------------------------
INSERT INTO `syscode` VALUES ('1', 'aac303', '1', '审核通过', null);
INSERT INTO `syscode` VALUES ('2', 'aac303', '2', '审核中', null);
INSERT INTO `syscode` VALUES ('3', 'aac303', '3', '审核未通过', null);
INSERT INTO `syscode` VALUES ('4', 'aac303', '4', '已撤销', null);
INSERT INTO `syscode` VALUES ('5', 'aac303', '5', '无', null);
INSERT INTO `syscode` VALUES ('6', 'aad102', '1', '经费获取', null);
INSERT INTO `syscode` VALUES ('7', 'aad102', '2', '活动支出', null);
INSERT INTO `syscode` VALUES ('8', 'aad102', '3', '物资采购', null);
INSERT INTO `syscode` VALUES ('9', 'aac505', '1', '已撤销', null);
INSERT INTO `syscode` VALUES ('10', 'aac505', '2', '审核中', null);
INSERT INTO `syscode` VALUES ('11', 'aac505', '3', '未通过', null);
INSERT INTO `syscode` VALUES ('12', 'aac505', '4', '已通过', null);
INSERT INTO `syscode` VALUES ('13', 'aac505', '5', '已拨出', null);
INSERT INTO `syscode` VALUES ('14', 'aac505', '6', '已结算', null);
INSERT INTO `syscode` VALUES ('15', 'aad204', '0', '待缴纳', null);
INSERT INTO `syscode` VALUES ('16', 'aad204', '1', '已缴纳', null);
INSERT INTO `syscode` VALUES ('17', 'aad308', '0', '未审查', null);
INSERT INTO `syscode` VALUES ('18', 'aad308', '1', '已审查', null);
INSERT INTO `syscode` VALUES ('163', 'aab107', '1', '汉族', null);
INSERT INTO `syscode` VALUES ('164', 'aab107', '2', '蒙古族', null);
INSERT INTO `syscode` VALUES ('165', 'aab107', '3', '回族', null);
INSERT INTO `syscode` VALUES ('166', 'aab107', '4', '藏族', null);
INSERT INTO `syscode` VALUES ('167', 'aab107', '5', '维吾尔族', null);
INSERT INTO `syscode` VALUES ('168', 'aab107', '6', '苗族', null);
INSERT INTO `syscode` VALUES ('169', 'aab107', '7', '彝族', null);
INSERT INTO `syscode` VALUES ('170', 'aab107', '8', '壮族', null);
INSERT INTO `syscode` VALUES ('171', 'aab107', '9', '布依族', null);
INSERT INTO `syscode` VALUES ('172', 'aab107', '10', '朝鲜族', null);
INSERT INTO `syscode` VALUES ('173', 'aab107', '11', '满族', null);
INSERT INTO `syscode` VALUES ('174', 'aab107', '12', '侗族', null);
INSERT INTO `syscode` VALUES ('175', 'aab107', '13', '瑶族', null);
INSERT INTO `syscode` VALUES ('176', 'aab107', '14', '白族', null);
INSERT INTO `syscode` VALUES ('177', 'aab107', '15', '土家族', null);
INSERT INTO `syscode` VALUES ('178', 'aab107', '16', '哈尼族', null);
INSERT INTO `syscode` VALUES ('179', 'aab107', '17', '哈萨克族', null);
INSERT INTO `syscode` VALUES ('180', 'aab107', '18', '傣族', null);
INSERT INTO `syscode` VALUES ('181', 'aab107', '19', '黎族', null);
INSERT INTO `syscode` VALUES ('182', 'aab107', '20', '傈僳族', null);
INSERT INTO `syscode` VALUES ('183', 'aab107', '21', '佤族', null);
INSERT INTO `syscode` VALUES ('184', 'aab107', '22', '畲族', null);
INSERT INTO `syscode` VALUES ('185', 'aab107', '23', '高山族', null);
INSERT INTO `syscode` VALUES ('186', 'aab107', '24', '拉祜族', null);
INSERT INTO `syscode` VALUES ('187', 'aab107', '25', '水族', null);
INSERT INTO `syscode` VALUES ('188', 'aab107', '26', '东乡族', null);
INSERT INTO `syscode` VALUES ('189', 'aab107', '27', '纳西族', null);
INSERT INTO `syscode` VALUES ('190', 'aab107', '28', '景颇族', null);
INSERT INTO `syscode` VALUES ('191', 'aab107', '29', '柯尔克孜族', null);
INSERT INTO `syscode` VALUES ('192', 'aab107', '30', '土族', null);
INSERT INTO `syscode` VALUES ('193', 'aab107', '31', '达斡尔族', null);
INSERT INTO `syscode` VALUES ('194', 'aab107', '32', '仫佬族', null);
INSERT INTO `syscode` VALUES ('195', 'aab107', '33', '羌族', null);
INSERT INTO `syscode` VALUES ('196', 'aab107', '34', '布朗族', null);
INSERT INTO `syscode` VALUES ('197', 'aab107', '35', '撒拉族', null);
INSERT INTO `syscode` VALUES ('198', 'aab107', '36', '毛难族', null);
INSERT INTO `syscode` VALUES ('199', 'aab107', '37', '仡佬族', null);
INSERT INTO `syscode` VALUES ('200', 'aab107', '38', '锡伯族', null);
INSERT INTO `syscode` VALUES ('201', 'aab107', '39', '阿昌族', null);
INSERT INTO `syscode` VALUES ('202', 'aab107', '40', '普米族', null);
INSERT INTO `syscode` VALUES ('203', 'aab107', '41', '塔吉克族', null);
INSERT INTO `syscode` VALUES ('204', 'aab107', '42', '怒族', null);
INSERT INTO `syscode` VALUES ('205', 'aab107', '43', '乌孜别克族', null);
INSERT INTO `syscode` VALUES ('206', 'aab107', '44', '俄罗斯族', null);
INSERT INTO `syscode` VALUES ('207', 'aab107', '45', '鄂温克族', null);
INSERT INTO `syscode` VALUES ('208', 'aab107', '46', '崩龙族', null);
INSERT INTO `syscode` VALUES ('209', 'aab107', '47', '保安族', null);
INSERT INTO `syscode` VALUES ('210', 'aab107', '48', '裕固族', null);
INSERT INTO `syscode` VALUES ('211', 'aab107', '49', '京族', null);
INSERT INTO `syscode` VALUES ('212', 'aab107', '50', '塔塔尔族', null);
INSERT INTO `syscode` VALUES ('213', 'aab107', '51', '独龙族', null);
INSERT INTO `syscode` VALUES ('214', 'aab107', '52', '鄂伦春族', null);
INSERT INTO `syscode` VALUES ('215', 'aab107', '53', '赫哲族', null);
INSERT INTO `syscode` VALUES ('216', 'aab107', '54', '门巴族', null);
INSERT INTO `syscode` VALUES ('217', 'aab107', '55', '珞巴族', null);
INSERT INTO `syscode` VALUES ('218', 'aab107', '56', '基诺族', null);
INSERT INTO `syscode` VALUES ('219', 'aab107', '97', '其他', null);
INSERT INTO `syscode` VALUES ('220', 'aab107', '98', '外国血统', null);
INSERT INTO `syscode` VALUES ('221', 'aae106', '1', '汉族', null);
INSERT INTO `syscode` VALUES ('222', 'aae106', '2', '蒙古族', null);
INSERT INTO `syscode` VALUES ('223', 'aae106', '3', '回族', null);
INSERT INTO `syscode` VALUES ('224', 'aae106', '4', '藏族', null);
INSERT INTO `syscode` VALUES ('225', 'aae106', '5', '维吾尔族', null);
INSERT INTO `syscode` VALUES ('226', 'aae106', '6', '苗族', null);
INSERT INTO `syscode` VALUES ('227', 'aae106', '7', '彝族', null);
INSERT INTO `syscode` VALUES ('228', 'aae106', '8', '壮族', null);
INSERT INTO `syscode` VALUES ('229', 'aae106', '9', '布依族', null);
INSERT INTO `syscode` VALUES ('230', 'aae106', '10', '朝鲜族', null);
INSERT INTO `syscode` VALUES ('231', 'aae106', '11', '满族', null);
INSERT INTO `syscode` VALUES ('232', 'aae106', '12', '侗族', null);
INSERT INTO `syscode` VALUES ('233', 'aae106', '13', '瑶族', null);
INSERT INTO `syscode` VALUES ('234', 'aae106', '14', '白族', null);
INSERT INTO `syscode` VALUES ('235', 'aae106', '15', '土家族', null);
INSERT INTO `syscode` VALUES ('236', 'aae106', '16', '哈尼族', null);
INSERT INTO `syscode` VALUES ('237', 'aae106', '17', '哈萨克族', null);
INSERT INTO `syscode` VALUES ('238', 'aae106', '18', '傣族', null);
INSERT INTO `syscode` VALUES ('239', 'aae106', '19', '黎族', null);
INSERT INTO `syscode` VALUES ('240', 'aae106', '20', '傈僳族', null);
INSERT INTO `syscode` VALUES ('241', 'aae106', '21', '佤族', null);
INSERT INTO `syscode` VALUES ('242', 'aae106', '22', '畲族', null);
INSERT INTO `syscode` VALUES ('243', 'aae106', '23', '高山族', null);
INSERT INTO `syscode` VALUES ('244', 'aae106', '24', '拉祜族', null);
INSERT INTO `syscode` VALUES ('245', 'aae106', '25', '水族', null);
INSERT INTO `syscode` VALUES ('246', 'aae106', '26', '东乡族', null);
INSERT INTO `syscode` VALUES ('247', 'aae106', '27', '纳西族', null);
INSERT INTO `syscode` VALUES ('248', 'aae106', '28', '景颇族', null);
INSERT INTO `syscode` VALUES ('249', 'aae106', '29', '柯尔克孜族', null);
INSERT INTO `syscode` VALUES ('250', 'aae106', '30', '土族', null);
INSERT INTO `syscode` VALUES ('251', 'aae106', '31', '达斡尔族', null);
INSERT INTO `syscode` VALUES ('252', 'aae106', '32', '仫佬族', null);
INSERT INTO `syscode` VALUES ('253', 'aae106', '33', '羌族', null);
INSERT INTO `syscode` VALUES ('254', 'aae106', '34', '布朗族', null);
INSERT INTO `syscode` VALUES ('255', 'aae106', '35', '撒拉族', null);
INSERT INTO `syscode` VALUES ('256', 'aae106', '36', '毛难族', null);
INSERT INTO `syscode` VALUES ('257', 'aae106', '37', '仡佬族', null);
INSERT INTO `syscode` VALUES ('258', 'aae106', '38', '锡伯族', null);
INSERT INTO `syscode` VALUES ('259', 'aae106', '39', '阿昌族', null);
INSERT INTO `syscode` VALUES ('260', 'aae106', '40', '普米族', null);
INSERT INTO `syscode` VALUES ('261', 'aae106', '41', '塔吉克族', null);
INSERT INTO `syscode` VALUES ('262', 'aae106', '42', '怒族', null);
INSERT INTO `syscode` VALUES ('263', 'aae106', '43', '乌孜别克族', null);
INSERT INTO `syscode` VALUES ('264', 'aae106', '44', '俄罗斯族', null);
INSERT INTO `syscode` VALUES ('265', 'aae106', '45', '鄂温克族', null);
INSERT INTO `syscode` VALUES ('266', 'aae106', '46', '崩龙族', null);
INSERT INTO `syscode` VALUES ('267', 'aae106', '47', '保安族', null);
INSERT INTO `syscode` VALUES ('268', 'aae106', '48', '裕固族', null);
INSERT INTO `syscode` VALUES ('269', 'aae106', '49', '京族', null);
INSERT INTO `syscode` VALUES ('270', 'aae106', '50', '塔塔尔族', null);
INSERT INTO `syscode` VALUES ('271', 'aae106', '51', '独龙族', null);
INSERT INTO `syscode` VALUES ('272', 'aae106', '52', '鄂伦春族', null);
INSERT INTO `syscode` VALUES ('273', 'aae106', '53', '赫哲族', null);
INSERT INTO `syscode` VALUES ('274', 'aae106', '54', '门巴族', null);
INSERT INTO `syscode` VALUES ('275', 'aae106', '55', '珞巴族', null);
INSERT INTO `syscode` VALUES ('276', 'aae106', '56', '基诺族', null);
INSERT INTO `syscode` VALUES ('277', 'aae106', '97', '其他', null);
INSERT INTO `syscode` VALUES ('278', 'aae106', '98', '外国血统', null);
INSERT INTO `syscode` VALUES ('298', 'aae105', '1', '男', null);
INSERT INTO `syscode` VALUES ('299', 'aae105', '2', '女', null);
INSERT INTO `syscode` VALUES ('300', 'aae105', '3', '不确定', null);
INSERT INTO `syscode` VALUES ('301', 'aae1110', '0', '无', null);
INSERT INTO `syscode` VALUES ('302', 'aae1110', '1', '一般员工', null);
INSERT INTO `syscode` VALUES ('303', 'aae1110', '2', '部门主管', null);
INSERT INTO `syscode` VALUES ('304', 'aae1110', '3', '教师', null);
INSERT INTO `syscode` VALUES ('305', 'aae1110', '4', '班主任', null);
INSERT INTO `syscode` VALUES ('306', 'aae1110', '5', '门卫', null);
INSERT INTO `syscode` VALUES ('307', 'aae1112', '1', '正常', null);
INSERT INTO `syscode` VALUES ('308', 'aae1112', '2', '休假', null);
INSERT INTO `syscode` VALUES ('309', 'aae1112', '3', '离职', null);
INSERT INTO `syscode` VALUES ('310', 'aae602', '1', '新购', null);
INSERT INTO `syscode` VALUES ('311', 'aae602', '2', '领用', null);
INSERT INTO `syscode` VALUES ('312', 'aae403', '1', '事假', null);
INSERT INTO `syscode` VALUES ('313', 'aae403', '2', '病假', null);
INSERT INTO `syscode` VALUES ('314', 'aae403', '3', '休假', null);
INSERT INTO `syscode` VALUES ('315', 'aae403', '4', '其他', null);
INSERT INTO `syscode` VALUES ('316', 'aae705', '1', '本人', null);
INSERT INTO `syscode` VALUES ('317', 'aae705', '2', '父亲', null);
INSERT INTO `syscode` VALUES ('318', 'aae705', '3', '母亲', null);
INSERT INTO `syscode` VALUES ('319', 'aae705', '4', '其他', null);
INSERT INTO `syscode` VALUES ('320', 'aae407', '1', '未审核', null);
INSERT INTO `syscode` VALUES ('321', 'aae407', '2', '审核通过', null);
INSERT INTO `syscode` VALUES ('322', 'aae407', '3', '审核不通过', null);
INSERT INTO `syscode` VALUES ('323', 'aac605', '1', '未审核', null);
INSERT INTO `syscode` VALUES ('324', 'aac605', '2', '审核通过', null);
INSERT INTO `syscode` VALUES ('325', 'aac605', '3', '审核不通过', null);
INSERT INTO `syscode` VALUES ('326', 'aac508', '1', '教研经费', null);
INSERT INTO `syscode` VALUES ('327', 'aac508', '2', '活动经费', null);
INSERT INTO `syscode` VALUES ('328', 'aac508', '3', '后勤经费', null);
INSERT INTO `syscode` VALUES ('329', 'aac104', '1', '未审核', null);
INSERT INTO `syscode` VALUES ('330', 'aac104', '2', '已审核', null);
INSERT INTO `syscode` VALUES ('331', 'aab903', '1', '缺勤', null);
INSERT INTO `syscode` VALUES ('332', 'aab903', '2', '请假', null);
INSERT INTO `syscode` VALUES ('333', 'aac802', '1', '组长', null);
INSERT INTO `syscode` VALUES ('334', 'aac802', '2', '组员', null);
