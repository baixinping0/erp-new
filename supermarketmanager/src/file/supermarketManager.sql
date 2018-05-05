/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : erp

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-05 23:56:12
*/

create database erp character set utf8;
use erp;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_dep
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dep`;
CREATE TABLE `tbl_dep` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(28) DEFAULT NULL,
  `tele` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dep
-- ----------------------------
INSERT INTO `tbl_dep` VALUES ('1', '信息中心', '15809294537');
INSERT INTO `tbl_dep` VALUES ('2', '送货部', '1829487034');
INSERT INTO `tbl_dep` VALUES ('3', '财务部', '15965487564');
INSERT INTO `tbl_dep` VALUES ('4', '销售部', '15987456354');
INSERT INTO `tbl_dep` VALUES ('7', '人事部', '15695846634');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(15) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `name` varchar(28) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tele` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `depUuid` bigint(20) NOT NULL,
  `lastLoginTime` bigint(20) NOT NULL,
  `lastLoginIp` varchar(30) NOT NULL,
  `loginTimes` int(11) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '白新平', '1647469340@qq.com', '15809294537', '西安', '1', null, '1', '1525535438257', '0:0:0:0:0:0:0:1', '80');
INSERT INTO `tbl_emp` VALUES ('2', 'zmp', 'e10adc3949ba59abbe56e057f20f883e', '朱美平', '16478964@qq.com', '16895462548', '陕西西安', '1', '799603200000', '1', '1525533305199', '0:0:0:0:0:0:0:1', '2');
INSERT INTO `tbl_emp` VALUES ('3', 'hqf', 'e10adc3949ba59abbe56e057f20f883e', '黄清烽', '123456@qq.com', '5636254897', '广东', '1', '823708800000', '2', '1525532363274', '0:0:0:0:0:0:0:1', '8');

-- ----------------------------
-- Table structure for tbl_emp_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp_role`;
CREATE TABLE `tbl_emp_role` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `empUuid` bigint(20) DEFAULT NULL,
  `roleUuid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp_role
-- ----------------------------
INSERT INTO `tbl_emp_role` VALUES ('1', '1', '1');
INSERT INTO `tbl_emp_role` VALUES ('2', '2', '1');
INSERT INTO `tbl_emp_role` VALUES ('3', '3', '2');

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `origin` varchar(30) NOT NULL,
  `producer` varchar(30) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `inPrice` decimal(10,0) NOT NULL,
  `outPrice` decimal(10,0) NOT NULL,
  `goodsTypeUuid` bigint(20) NOT NULL,
  `useNum` int(11) DEFAULT NULL,
  `maxNum` int(11) NOT NULL,
  `minNum` int(11) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------
INSERT INTO `tbl_goods` VALUES ('1', '白菜', '陕西汉中', '白菜供应商', '千克', '5', '6', '1', '0', '300', '15');
INSERT INTO `tbl_goods` VALUES ('2', '蜜橘', '陕西富平', '蜜橘供应商', '千克', '10', '12', '5', '0', '300', '15');
INSERT INTO `tbl_goods` VALUES ('3', '豆角', '陕西汉中', '豆角供应商', '千克', '8', '10', '2', '0', '300', '15');
INSERT INTO `tbl_goods` VALUES ('4', '黄瓜', '陕西汉中', '黄瓜供应商', '千克', '6', '8', '3', '0', '300', '15');
INSERT INTO `tbl_goods` VALUES ('5', '核桃', '陕西富平', '核桃供应商', '千克', '20', '25', '6', '0', '300', '15');
INSERT INTO `tbl_goods` VALUES ('6', '芒果', '陕西富平', '芒果供应商', '千克', '30', '35', '7', '0', '300', '15');

-- ----------------------------
-- Table structure for tbl_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goodstype`;
CREATE TABLE `tbl_goodstype` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `supplierUuid` bigint(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_goodstype
-- ----------------------------
INSERT INTO `tbl_goodstype` VALUES ('1', '青菜类', '1');
INSERT INTO `tbl_goodstype` VALUES ('2', '豆类', '1');
INSERT INTO `tbl_goodstype` VALUES ('3', '瓜类', '1');
INSERT INTO `tbl_goodstype` VALUES ('4', '葱蒜类', '1');
INSERT INTO `tbl_goodstype` VALUES ('5', '柑橘类', '2');
INSERT INTO `tbl_goodstype` VALUES ('6', '核果类', '2');
INSERT INTO `tbl_goodstype` VALUES ('7', '浆果类', '2');

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `puuid` bigint(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
INSERT INTO `tbl_menu` VALUES ('1', '系统菜单', '-', '0');
INSERT INTO `tbl_menu` VALUES ('2', '基础维护', '-', '1');
INSERT INTO `tbl_menu` VALUES ('3', '员工维护', 'emp_list', '2');
INSERT INTO `tbl_menu` VALUES ('4', '部门维护', 'dep_list', '2');
INSERT INTO `tbl_menu` VALUES ('5', '角色维护', 'role_list', '2');
INSERT INTO `tbl_menu` VALUES ('6', '资源维护', 'res_list', '2');
INSERT INTO `tbl_menu` VALUES ('7', '菜单维护', 'menu_list', '2');
INSERT INTO `tbl_menu` VALUES ('8', '商品管理', '-', '1');
INSERT INTO `tbl_menu` VALUES ('9', '供应商', 'supplier_list', '8');
INSERT INTO `tbl_menu` VALUES ('10', '商品类别', 'goodsType_list', '8');
INSERT INTO `tbl_menu` VALUES ('11', '商品', 'goods_list', '8');
INSERT INTO `tbl_menu` VALUES ('12', '仓库维护', 'store_list', '14');
INSERT INTO `tbl_menu` VALUES ('14', '仓库管理', '', '1');
INSERT INTO `tbl_menu` VALUES ('17', '商品运输', '', '1');
INSERT INTO `tbl_menu` VALUES ('18', '订单管理', '', '1');
INSERT INTO `tbl_menu` VALUES ('20', '运输任务查询', 'transport_taskList', '17');
INSERT INTO `tbl_menu` VALUES ('21', '订单查询', 'order_buyList', '18');
INSERT INTO `tbl_menu` VALUES ('22', '入库管理', 'order_inStoreList', '14');
INSERT INTO `tbl_menu` VALUES ('24', '订单审核', 'order_buyCheckList', '18');
INSERT INTO `tbl_menu` VALUES ('25', '运输结算', 'transport_tasks', '17');
INSERT INTO `tbl_menu` VALUES ('28', '仓库明细查询', 'storeDetail_list', '14');

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(30) NOT NULL,
  `creater` bigint(20) NOT NULL,
  `createTime` bigint(20) NOT NULL,
  `checker` bigint(20) DEFAULT NULL,
  `checkTime` bigint(20) DEFAULT NULL,
  `completer` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `orderType` int(1) NOT NULL,
  `type` int(3) NOT NULL,
  `totalNum` int(11) NOT NULL,
  `totalPrice` decimal(10,0) NOT NULL,
  `supplierUuid` bigint(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('2', '433E4C5A2', '1', '1525518830557', '1', '1525518970046', '1', '1525521629294', '1', '141', '3', '19', '1');
INSERT INTO `tbl_order` VALUES ('3', '433E4C5A1', '1', '1525533055144', '1', '1525533173880', '2', '1525533351256', '1', '151', '100', '60', '2');

-- ----------------------------
-- Table structure for tbl_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orderdetail`;
CREATE TABLE `tbl_orderdetail` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsUuid` bigint(20) NOT NULL,
  `num` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `orderUuid` bigint(20) NOT NULL,
  `surplus` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_orderdetail
-- ----------------------------
INSERT INTO `tbl_orderdetail` VALUES ('1', '4', '1', '6', '2', '1');
INSERT INTO `tbl_orderdetail` VALUES ('2', '1', '1', '5', '2', '0');
INSERT INTO `tbl_orderdetail` VALUES ('3', '3', '1', '8', '2', '1');
INSERT INTO `tbl_orderdetail` VALUES ('4', '5', '30', '20', '3', '0');
INSERT INTO `tbl_orderdetail` VALUES ('5', '6', '50', '30', '3', '0');
INSERT INTO `tbl_orderdetail` VALUES ('6', '2', '20', '10', '3', '0');

-- ----------------------------
-- Table structure for tbl_res
-- ----------------------------
DROP TABLE IF EXISTS `tbl_res`;
CREATE TABLE `tbl_res` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_res
-- ----------------------------
INSERT INTO `tbl_res` VALUES ('1', '添加部门信息', 'com.bxp.erp.auth.dep.web.DepAction.save');

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES ('1', '系统管理员', 'admin');
INSERT INTO `tbl_role` VALUES ('2', '送货人员', 'song_huo');

-- ----------------------------
-- Table structure for tbl_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_menu`;
CREATE TABLE `tbl_role_menu` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleUuid` bigint(20) NOT NULL,
  `menuUuid` bigint(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_role_menu
-- ----------------------------
INSERT INTO `tbl_role_menu` VALUES ('51', '2', '8');
INSERT INTO `tbl_role_menu` VALUES ('52', '2', '2');
INSERT INTO `tbl_role_menu` VALUES ('53', '2', '20');
INSERT INTO `tbl_role_menu` VALUES ('54', '2', '22');
INSERT INTO `tbl_role_menu` VALUES ('55', '2', '25');
INSERT INTO `tbl_role_menu` VALUES ('56', '2', '28');
INSERT INTO `tbl_role_menu` VALUES ('57', '2', '9');
INSERT INTO `tbl_role_menu` VALUES ('58', '2', '4');
INSERT INTO `tbl_role_menu` VALUES ('59', '2', '14');
INSERT INTO `tbl_role_menu` VALUES ('60', '1', '14');
INSERT INTO `tbl_role_menu` VALUES ('61', '1', '10');
INSERT INTO `tbl_role_menu` VALUES ('62', '1', '12');
INSERT INTO `tbl_role_menu` VALUES ('63', '1', '18');
INSERT INTO `tbl_role_menu` VALUES ('64', '1', '2');
INSERT INTO `tbl_role_menu` VALUES ('65', '1', '22');
INSERT INTO `tbl_role_menu` VALUES ('66', '1', '17');
INSERT INTO `tbl_role_menu` VALUES ('67', '1', '25');
INSERT INTO `tbl_role_menu` VALUES ('68', '1', '8');
INSERT INTO `tbl_role_menu` VALUES ('69', '1', '9');
INSERT INTO `tbl_role_menu` VALUES ('70', '1', '3');
INSERT INTO `tbl_role_menu` VALUES ('71', '1', '4');
INSERT INTO `tbl_role_menu` VALUES ('72', '1', '5');
INSERT INTO `tbl_role_menu` VALUES ('73', '1', '7');
INSERT INTO `tbl_role_menu` VALUES ('74', '1', '11');
INSERT INTO `tbl_role_menu` VALUES ('75', '1', '28');
INSERT INTO `tbl_role_menu` VALUES ('76', '1', '24');
INSERT INTO `tbl_role_menu` VALUES ('77', '1', '6');
INSERT INTO `tbl_role_menu` VALUES ('78', '1', '20');
INSERT INTO `tbl_role_menu` VALUES ('79', '1', '21');

-- ----------------------------
-- Table structure for tbl_role_res
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_res`;
CREATE TABLE `tbl_role_res` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleUuid` bigint(20) DEFAULT NULL,
  `resUuid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_role_res
-- ----------------------------
INSERT INTO `tbl_role_res` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for tbl_store
-- ----------------------------
DROP TABLE IF EXISTS `tbl_store`;
CREATE TABLE `tbl_store` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `empUuid` bigint(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_store
-- ----------------------------
INSERT INTO `tbl_store` VALUES ('1', '水果仓库', '陕西省长安区', '1');
INSERT INTO `tbl_store` VALUES ('2', '蔬菜仓库', '陕西省长安区', '1');

-- ----------------------------
-- Table structure for tbl_storedetail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_storedetail`;
CREATE TABLE `tbl_storedetail` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeUuid` bigint(20) NOT NULL,
  `goodsUuid` bigint(20) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_storedetail
-- ----------------------------
INSERT INTO `tbl_storedetail` VALUES ('1', '2', '1', '1');
INSERT INTO `tbl_storedetail` VALUES ('2', '1', '5', '30');
INSERT INTO `tbl_storedetail` VALUES ('3', '1', '6', '50');
INSERT INTO `tbl_storedetail` VALUES ('4', '1', '2', '20');

-- ----------------------------
-- Table structure for tbl_storeoper
-- ----------------------------
DROP TABLE IF EXISTS `tbl_storeoper`;
CREATE TABLE `tbl_storeoper` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `empUuid` bigint(20) NOT NULL,
  `operTime` bigint(20) NOT NULL,
  `type` int(1) NOT NULL,
  `goodsUuid` bigint(20) NOT NULL,
  `storeUuid` bigint(20) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_storeoper
-- ----------------------------
INSERT INTO `tbl_storeoper` VALUES ('1', '1', '1525528277882', '1', '1', '2', '1');
INSERT INTO `tbl_storeoper` VALUES ('2', '2', '1525533347593', '1', '5', '1', '30');
INSERT INTO `tbl_storeoper` VALUES ('3', '2', '1525533349750', '1', '6', '1', '50');
INSERT INTO `tbl_storeoper` VALUES ('4', '2', '1525533351255', '1', '2', '1', '20');

-- ----------------------------
-- Table structure for tbl_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tbl_supplier`;
CREATE TABLE `tbl_supplier` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `tele` varchar(30) NOT NULL,
  `needs` int(1) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_supplier
-- ----------------------------
INSERT INTO `tbl_supplier` VALUES ('1', '陕西蔬菜供应基地', '陕西汉中', '张三', '17798560324', '1');
INSERT INTO `tbl_supplier` VALUES ('2', '水果供应', '陕西省富平', '李四', '16984563275', '1');
