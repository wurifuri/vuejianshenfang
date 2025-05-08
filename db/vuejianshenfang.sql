/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80042
Source Host           : localhost:3306
Source Database       : vuejianshenfang

Target Server Type    : MYSQL
Target Server Version : 80042
File Encoding         : 65001

Date: 2025-04-18 21:45:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aboutus`
-- ----------------------------
DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='关于我们';

-- ----------------------------
-- Records of aboutus
-- ----------------------------
INSERT INTO `aboutus` VALUES ('1', '2023-04-07 08:14:09', '关于我们', 'ABOUT US', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?\n你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。', 'upload/aboutus_picture1.jpg', 'upload/aboutus_picture2.jpg', 'upload/aboutus_picture3.jpg');

-- ----------------------------
-- Table structure for `baomingkecheng`
-- ----------------------------
DROP TABLE IF EXISTS `baomingkecheng`;
CREATE TABLE `baomingkecheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `jine` float DEFAULT NULL COMMENT '费用',
  `goumaishijian` datetime DEFAULT NULL COMMENT '购买时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `huiyuanyue` float DEFAULT NULL COMMENT '会员余额',
  `jiaolianzhanghao` varchar(200) DEFAULT NULL COMMENT '教练账号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb3 COMMENT='报名课程';

-- ----------------------------
-- Records of baomingkecheng
-- ----------------------------
INSERT INTO `baomingkecheng` VALUES ('91', '2023-04-07 08:14:09', '1111111111', '课程名称1', '1', '2023-04-07 08:14:09', '账号1', '姓名1', '手机1', '1', '教练账号1', '教练姓名1', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('92', '2023-04-07 08:14:09', '2222222222', '课程名称2', '2', '2023-04-07 08:14:09', '账号2', '姓名2', '手机2', '2', '教练账号2', '教练姓名2', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('93', '2023-04-07 08:14:09', '3333333333', '课程名称3', '3', '2023-04-07 08:14:09', '账号3', '姓名3', '手机3', '3', '教练账号3', '教练姓名3', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('94', '2023-04-07 08:14:09', '4444444444', '课程名称4', '4', '2023-04-07 08:14:09', '账号4', '姓名4', '手机4', '4', '教练账号4', '教练姓名4', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('95', '2023-04-07 08:14:09', '5555555555', '课程名称5', '5', '2023-04-07 08:14:09', '账号5', '姓名5', '手机5', '5', '教练账号5', '教练姓名5', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('96', '2023-04-07 08:14:09', '6666666666', '课程名称6', '6', '2023-04-07 08:14:09', '账号6', '姓名6', '手机6', '6', '教练账号6', '教练姓名6', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('97', '2023-04-07 08:14:09', '7777777777', '课程名称7', '7', '2023-04-07 08:14:09', '账号7', '姓名7', '手机7', '7', '教练账号7', '教练姓名7', '是', '', '未支付');
INSERT INTO `baomingkecheng` VALUES ('98', '2023-04-07 08:14:09', '8888888888', '课程名称8', '8', '2023-04-07 08:14:09', '账号8', '姓名8', '手机8', '8', '教练账号8', '教练姓名8', '是', '', '未支付');

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'picture1', 'upload/picture1.jpg');
INSERT INTO `config` VALUES ('2', 'picture2', 'upload/picture2.jpg');
INSERT INTO `config` VALUES ('3', 'picture3', 'upload/picture3.jpg');

-- ----------------------------
-- Table structure for `daoqitixing`
-- ----------------------------
DROP TABLE IF EXISTS `daoqitixing`;
CREATE TABLE `daoqitixing` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `tixingneirong` varchar(200) NOT NULL COMMENT '提醒内容',
  `tixingshijian` datetime DEFAULT NULL COMMENT '提醒时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COMMENT='到期提醒';

-- ----------------------------
-- Records of daoqitixing
-- ----------------------------
INSERT INTO `daoqitixing` VALUES ('61', '2023-04-07 08:14:09', '标题1', '提醒内容1', '2023-04-07 08:14:09', '账号1', '姓名1');
INSERT INTO `daoqitixing` VALUES ('62', '2023-04-07 08:14:09', '标题2', '提醒内容2', '2023-04-07 08:14:09', '账号2', '姓名2');
INSERT INTO `daoqitixing` VALUES ('63', '2023-04-07 08:14:09', '标题3', '提醒内容3', '2023-04-07 08:14:09', '账号3', '姓名3');
INSERT INTO `daoqitixing` VALUES ('64', '2023-04-07 08:14:09', '标题4', '提醒内容4', '2023-04-07 08:14:09', '账号4', '姓名4');
INSERT INTO `daoqitixing` VALUES ('65', '2023-04-07 08:14:09', '标题5', '提醒内容5', '2023-04-07 08:14:09', '账号5', '姓名5');
INSERT INTO `daoqitixing` VALUES ('66', '2023-04-07 08:14:09', '标题6', '提醒内容6', '2023-04-07 08:14:09', '账号6', '姓名6');
INSERT INTO `daoqitixing` VALUES ('67', '2023-04-07 08:14:09', '标题7', '提醒内容7', '2023-04-07 08:14:09', '账号7', '姓名7');
INSERT INTO `daoqitixing` VALUES ('68', '2023-04-07 08:14:09', '标题8', '提醒内容8', '2023-04-07 08:14:09', '账号8', '姓名8');

-- ----------------------------
-- Table structure for `goumaishangpin`
-- ----------------------------
DROP TABLE IF EXISTS `goumaishangpin`;
CREATE TABLE `goumaishangpin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `shangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `jiage` float DEFAULT NULL COMMENT '价格',
  `shuliang` int NOT NULL COMMENT '数量',
  `jine` float DEFAULT NULL COMMENT '总价',
  `xiadanshijian` datetime DEFAULT NULL COMMENT '下单时间',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `huiyuanyue` float DEFAULT NULL COMMENT '会员余额',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COMMENT='购买商品';

-- ----------------------------
-- Records of goumaishangpin
-- ----------------------------
INSERT INTO `goumaishangpin` VALUES ('111', '2023-04-07 08:14:09', '1111111111', '商品名称1', '1', '1', '1', '2023-04-07 08:14:09', '备注1', '账号1', '姓名1', '手机1', '1', '未支付');
INSERT INTO `goumaishangpin` VALUES ('112', '2023-04-07 08:14:09', '2222222222', '商品名称2', '2', '2', '2', '2023-04-07 08:14:09', '备注2', '账号2', '姓名2', '手机2', '2', '未支付');
INSERT INTO `goumaishangpin` VALUES ('113', '2023-04-07 08:14:09', '3333333333', '商品名称3', '3', '3', '3', '2023-04-07 08:14:09', '备注3', '账号3', '姓名3', '手机3', '3', '未支付');
INSERT INTO `goumaishangpin` VALUES ('114', '2023-04-07 08:14:09', '4444444444', '商品名称4', '4', '4', '4', '2023-04-07 08:14:09', '备注4', '账号4', '姓名4', '手机4', '4', '未支付');
INSERT INTO `goumaishangpin` VALUES ('115', '2023-04-07 08:14:09', '5555555555', '商品名称5', '5', '5', '5', '2023-04-07 08:14:09', '备注5', '账号5', '姓名5', '手机5', '5', '未支付');
INSERT INTO `goumaishangpin` VALUES ('116', '2023-04-07 08:14:09', '6666666666', '商品名称6', '6', '6', '6', '2023-04-07 08:14:09', '备注6', '账号6', '姓名6', '手机6', '6', '未支付');
INSERT INTO `goumaishangpin` VALUES ('117', '2023-04-07 08:14:09', '7777777777', '商品名称7', '7', '7', '7', '2023-04-07 08:14:09', '备注7', '账号7', '姓名7', '手机7', '7', '未支付');
INSERT INTO `goumaishangpin` VALUES ('118', '2023-04-07 08:14:09', '8888888888', '商品名称8', '8', '8', '8', '2023-04-07 08:14:09', '备注8', '账号8', '姓名8', '手机8', '8', '未支付');

-- ----------------------------
-- Table structure for `huiyuan`
-- ----------------------------
DROP TABLE IF EXISTS `huiyuan`;
CREATE TABLE `huiyuan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` int DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `touxiang` longtext COMMENT '头像',
  `jine` float DEFAULT NULL COMMENT '金额',
  `huiyuankaleixing` varchar(200) DEFAULT NULL COMMENT '会员卡类型',
  `youxiaotianshu` varchar(200) DEFAULT NULL COMMENT '有效天数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COMMENT='会员';

-- ----------------------------
-- Records of huiyuan
-- ----------------------------
INSERT INTO `huiyuan` VALUES ('11', '2023-04-07 08:14:09', '账号1', '123456', '姓名1', '1', '男', '13823888881', 'upload/huiyuan_touxiang1.jpg', '1', '会员卡类型1', '有效天数1');
INSERT INTO `huiyuan` VALUES ('12', '2023-04-07 08:14:09', '账号2', '123456', '姓名2', '2', '男', '13823888882', 'upload/huiyuan_touxiang2.jpg', '2', '会员卡类型2', '有效天数2');
INSERT INTO `huiyuan` VALUES ('13', '2023-04-07 08:14:09', '账号3', '123456', '姓名3', '3', '男', '13823888883', 'upload/huiyuan_touxiang3.jpg', '3', '会员卡类型3', '有效天数3');
INSERT INTO `huiyuan` VALUES ('14', '2023-04-07 08:14:09', '账号4', '123456', '姓名4', '4', '男', '13823888884', 'upload/huiyuan_touxiang4.jpg', '4', '会员卡类型4', '有效天数4');
INSERT INTO `huiyuan` VALUES ('15', '2023-04-07 08:14:09', '账号5', '123456', '姓名5', '5', '男', '13823888885', 'upload/huiyuan_touxiang5.jpg', '5', '会员卡类型5', '有效天数5');
INSERT INTO `huiyuan` VALUES ('16', '2023-04-07 08:14:09', '账号6', '123456', '姓名6', '6', '男', '13823888886', 'upload/huiyuan_touxiang6.jpg', '6', '会员卡类型6', '有效天数6');
INSERT INTO `huiyuan` VALUES ('17', '2023-04-07 08:14:09', '账号7', '123456', '姓名7', '7', '男', '13823888887', 'upload/huiyuan_touxiang7.jpg', '7', '会员卡类型7', '有效天数7');
INSERT INTO `huiyuan` VALUES ('18', '2023-04-07 08:14:09', '账号8', '123456', '姓名8', '8', '男', '13823888888', 'upload/huiyuan_touxiang8.jpg', '8', '会员卡类型8', '有效天数8');

-- ----------------------------
-- Table structure for `huiyuanbanka`
-- ----------------------------
DROP TABLE IF EXISTS `huiyuanbanka`;
CREATE TABLE `huiyuanbanka` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `huiyuankaleixing` varchar(200) DEFAULT NULL COMMENT '会员卡类型',
  `jine` float DEFAULT NULL COMMENT '售价',
  `youxiaotianshu` varchar(200) DEFAULT NULL COMMENT '有效天数',
  `bankashijian` datetime DEFAULT NULL COMMENT '办卡时间',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COMMENT='会员办卡';

-- ----------------------------
-- Records of huiyuanbanka
-- ----------------------------
INSERT INTO `huiyuanbanka` VALUES ('51', '2023-04-07 08:14:09', '账号1', '姓名1', '会员卡类型1', '1', '有效天数1', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('52', '2023-04-07 08:14:09', '账号2', '姓名2', '会员卡类型2', '2', '有效天数2', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('53', '2023-04-07 08:14:09', '账号3', '姓名3', '会员卡类型3', '3', '有效天数3', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('54', '2023-04-07 08:14:09', '账号4', '姓名4', '会员卡类型4', '4', '有效天数4', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('55', '2023-04-07 08:14:09', '账号5', '姓名5', '会员卡类型5', '5', '有效天数5', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('56', '2023-04-07 08:14:09', '账号6', '姓名6', '会员卡类型6', '6', '有效天数6', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('57', '2023-04-07 08:14:09', '账号7', '姓名7', '会员卡类型7', '7', '有效天数7', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanbanka` VALUES ('58', '2023-04-07 08:14:09', '账号8', '姓名8', '会员卡类型8', '8', '有效天数8', '2023-04-07 08:14:09', '未支付');

-- ----------------------------
-- Table structure for `huiyuanleixing`
-- ----------------------------
DROP TABLE IF EXISTS `huiyuanleixing`;
CREATE TABLE `huiyuanleixing` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huiyuankaleixing` varchar(200) DEFAULT NULL COMMENT '会员卡类型',
  `youxiaotianshu` int DEFAULT NULL COMMENT '有效天数',
  `jine` float DEFAULT NULL COMMENT '售价',
  `xiangqing` varchar(200) DEFAULT NULL COMMENT '详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COMMENT='会员类型';

-- ----------------------------
-- Records of huiyuanleixing
-- ----------------------------
INSERT INTO `huiyuanleixing` VALUES ('41', '2023-04-07 08:14:09', '月卡', '1', '1', '详情1');
INSERT INTO `huiyuanleixing` VALUES ('42', '2023-04-07 08:14:09', '月卡', '2', '2', '详情2');
INSERT INTO `huiyuanleixing` VALUES ('43', '2023-04-07 08:14:09', '月卡', '3', '3', '详情3');
INSERT INTO `huiyuanleixing` VALUES ('44', '2023-04-07 08:14:09', '月卡', '4', '4', '详情4');
INSERT INTO `huiyuanleixing` VALUES ('45', '2023-04-07 08:14:09', '月卡', '5', '5', '详情5');
INSERT INTO `huiyuanleixing` VALUES ('46', '2023-04-07 08:14:09', '月卡', '6', '6', '详情6');
INSERT INTO `huiyuanleixing` VALUES ('47', '2023-04-07 08:14:09', '月卡', '7', '7', '详情7');
INSERT INTO `huiyuanleixing` VALUES ('48', '2023-04-07 08:14:09', '月卡', '8', '8', '详情8');

-- ----------------------------
-- Table structure for `huiyuanxuka`
-- ----------------------------
DROP TABLE IF EXISTS `huiyuanxuka`;
CREATE TABLE `huiyuanxuka` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `huiyuankaleixing` varchar(200) DEFAULT NULL COMMENT '会员卡类型',
  `jine` float DEFAULT NULL COMMENT '售价',
  `youxiaotianshu` varchar(200) DEFAULT NULL COMMENT '有效天数',
  `xukashijian` datetime DEFAULT NULL COMMENT '续卡时间',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 COMMENT='会员续卡';

-- ----------------------------
-- Records of huiyuanxuka
-- ----------------------------
INSERT INTO `huiyuanxuka` VALUES ('71', '2023-04-07 08:14:09', '账号1', '姓名1', '会员卡类型1', '1', '有效天数1', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('72', '2023-04-07 08:14:09', '账号2', '姓名2', '会员卡类型2', '2', '有效天数2', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('73', '2023-04-07 08:14:09', '账号3', '姓名3', '会员卡类型3', '3', '有效天数3', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('74', '2023-04-07 08:14:09', '账号4', '姓名4', '会员卡类型4', '4', '有效天数4', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('75', '2023-04-07 08:14:09', '账号5', '姓名5', '会员卡类型5', '5', '有效天数5', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('76', '2023-04-07 08:14:09', '账号6', '姓名6', '会员卡类型6', '6', '有效天数6', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('77', '2023-04-07 08:14:09', '账号7', '姓名7', '会员卡类型7', '7', '有效天数7', '2023-04-07 08:14:09', '未支付');
INSERT INTO `huiyuanxuka` VALUES ('78', '2023-04-07 08:14:09', '账号8', '姓名8', '会员卡类型8', '8', '有效天数8', '2023-04-07 08:14:09', '未支付');

-- ----------------------------
-- Table structure for `jianshenkecheng`
-- ----------------------------
DROP TABLE IF EXISTS `jianshenkecheng`;
CREATE TABLE `jianshenkecheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) NOT NULL COMMENT '课程名称',
  `kechengfenlei` varchar(200) DEFAULT NULL COMMENT '课程分类',
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `keshi` varchar(200) NOT NULL COMMENT '课时',
  `jine` float DEFAULT NULL COMMENT '费用',
  `shangkedidian` varchar(200) DEFAULT NULL COMMENT '上课地点',
  `jiaolianzhanghao` varchar(200) DEFAULT NULL COMMENT '教练账号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `chuangjianshijian` datetime DEFAULT NULL COMMENT '创建时间',
  `kechengneirong` longtext COMMENT '课程内容',
  `fengmian` longtext COMMENT '封面',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3 COMMENT='健身课程';

-- ----------------------------
-- Records of jianshenkecheng
-- ----------------------------
INSERT INTO `jianshenkecheng` VALUES ('81', '2023-04-07 08:14:09', '课程名称1', '课程分类1', '2023-04-07 08:14:09', '课时1', '1', '上课地点1', '教练账号1', '教练姓名1', '2023-04-07 08:14:09', '课程内容1', 'upload/jianshenkecheng_fengmian1.jpg,upload/jianshenkecheng_fengmian2.jpg,upload/jianshenkecheng_fengmian3.jpg', '2023-04-07 08:14:09', '1');
INSERT INTO `jianshenkecheng` VALUES ('82', '2023-04-07 08:14:09', '课程名称2', '课程分类2', '2023-04-07 08:14:09', '课时2', '2', '上课地点2', '教练账号2', '教练姓名2', '2023-04-07 08:14:09', '课程内容2', 'upload/jianshenkecheng_fengmian2.jpg,upload/jianshenkecheng_fengmian3.jpg,upload/jianshenkecheng_fengmian4.jpg', '2023-04-07 08:14:09', '2');
INSERT INTO `jianshenkecheng` VALUES ('83', '2023-04-07 08:14:09', '课程名称3', '课程分类3', '2023-04-07 08:14:09', '课时3', '3', '上课地点3', '教练账号3', '教练姓名3', '2023-04-07 08:14:09', '课程内容3', 'upload/jianshenkecheng_fengmian3.jpg,upload/jianshenkecheng_fengmian4.jpg,upload/jianshenkecheng_fengmian5.jpg', '2023-04-07 08:14:09', '3');
INSERT INTO `jianshenkecheng` VALUES ('84', '2023-04-07 08:14:09', '课程名称4', '课程分类4', '2023-04-07 08:14:09', '课时4', '4', '上课地点4', '教练账号4', '教练姓名4', '2023-04-07 08:14:09', '课程内容4', 'upload/jianshenkecheng_fengmian4.jpg,upload/jianshenkecheng_fengmian5.jpg,upload/jianshenkecheng_fengmian6.jpg', '2023-04-07 08:14:09', '4');
INSERT INTO `jianshenkecheng` VALUES ('85', '2023-04-07 08:14:09', '课程名称5', '课程分类5', '2023-04-07 08:14:09', '课时5', '5', '上课地点5', '教练账号5', '教练姓名5', '2023-04-07 08:14:09', '课程内容5', 'upload/jianshenkecheng_fengmian5.jpg,upload/jianshenkecheng_fengmian6.jpg,upload/jianshenkecheng_fengmian7.jpg', '2023-04-07 08:14:09', '5');
INSERT INTO `jianshenkecheng` VALUES ('86', '2023-04-07 08:14:09', '课程名称6', '课程分类6', '2023-04-07 08:14:09', '课时6', '6', '上课地点6', '教练账号6', '教练姓名6', '2023-04-07 08:14:09', '课程内容6', 'upload/jianshenkecheng_fengmian6.jpg,upload/jianshenkecheng_fengmian7.jpg,upload/jianshenkecheng_fengmian8.jpg', '2023-04-07 08:14:09', '6');
INSERT INTO `jianshenkecheng` VALUES ('87', '2023-04-07 08:14:09', '课程名称7', '课程分类7', '2023-04-07 08:14:09', '课时7', '7', '上课地点7', '教练账号7', '教练姓名7', '2023-04-07 08:14:09', '课程内容7', 'upload/jianshenkecheng_fengmian7.jpg,upload/jianshenkecheng_fengmian8.jpg,upload/jianshenkecheng_fengmian9.jpg', '2023-04-07 08:14:09', '7');
INSERT INTO `jianshenkecheng` VALUES ('88', '2023-04-07 08:14:09', '课程名称8', '课程分类8', '2023-04-07 08:14:09', '课时8', '8', '上课地点8', '教练账号8', '教练姓名8', '2023-04-07 08:14:09', '课程内容8', 'upload/jianshenkecheng_fengmian8.jpg,upload/jianshenkecheng_fengmian9.jpg,upload/jianshenkecheng_fengmian10.jpg', '2023-04-07 08:14:09', '8');

-- ----------------------------
-- Table structure for `jianshenshangpin`
-- ----------------------------
DROP TABLE IF EXISTS `jianshenshangpin`;
CREATE TABLE `jianshenshangpin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) NOT NULL COMMENT '商品名称',
  `shangpinfenlei` varchar(200) NOT NULL COMMENT '商品分类',
  `guige` varchar(200) DEFAULT NULL COMMENT '规格',
  `jiage` float NOT NULL COMMENT '价格',
  `shuliang` int NOT NULL COMMENT '数量',
  `fengmian` longtext COMMENT '封面',
  `shiyongshuoming` longtext COMMENT '使用说明',
  `shangjiariqi` date DEFAULT NULL COMMENT '上架日期',
  `shangpinjieshao` longtext COMMENT '商品介绍',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 COMMENT='健身商品';

-- ----------------------------
-- Records of jianshenshangpin
-- ----------------------------
INSERT INTO `jianshenshangpin` VALUES ('101', '2023-04-07 08:14:09', '商品名称1', '商品分类1', '规格1', '1', '1', 'upload/jianshenshangpin_fengmian1.jpg,upload/jianshenshangpin_fengmian2.jpg,upload/jianshenshangpin_fengmian3.jpg', '使用说明1', '2023-04-07', '商品介绍1', '2023-04-07 08:14:09', '1');
INSERT INTO `jianshenshangpin` VALUES ('102', '2023-04-07 08:14:09', '商品名称2', '商品分类2', '规格2', '2', '2', 'upload/jianshenshangpin_fengmian2.jpg,upload/jianshenshangpin_fengmian3.jpg,upload/jianshenshangpin_fengmian4.jpg', '使用说明2', '2023-04-07', '商品介绍2', '2023-04-07 08:14:09', '2');
INSERT INTO `jianshenshangpin` VALUES ('103', '2023-04-07 08:14:09', '商品名称3', '商品分类3', '规格3', '3', '3', 'upload/jianshenshangpin_fengmian3.jpg,upload/jianshenshangpin_fengmian4.jpg,upload/jianshenshangpin_fengmian5.jpg', '使用说明3', '2023-04-07', '商品介绍3', '2023-04-07 08:14:09', '3');
INSERT INTO `jianshenshangpin` VALUES ('104', '2023-04-07 08:14:09', '商品名称4', '商品分类4', '规格4', '4', '4', 'upload/jianshenshangpin_fengmian4.jpg,upload/jianshenshangpin_fengmian5.jpg,upload/jianshenshangpin_fengmian6.jpg', '使用说明4', '2023-04-07', '商品介绍4', '2023-04-07 08:14:09', '4');
INSERT INTO `jianshenshangpin` VALUES ('105', '2023-04-07 08:14:09', '商品名称5', '商品分类5', '规格5', '5', '5', 'upload/jianshenshangpin_fengmian5.jpg,upload/jianshenshangpin_fengmian6.jpg,upload/jianshenshangpin_fengmian7.jpg', '使用说明5', '2023-04-07', '商品介绍5', '2023-04-07 08:14:09', '5');
INSERT INTO `jianshenshangpin` VALUES ('106', '2023-04-07 08:14:09', '商品名称6', '商品分类6', '规格6', '6', '6', 'upload/jianshenshangpin_fengmian6.jpg,upload/jianshenshangpin_fengmian7.jpg,upload/jianshenshangpin_fengmian8.jpg', '使用说明6', '2023-04-07', '商品介绍6', '2023-04-07 08:14:09', '6');
INSERT INTO `jianshenshangpin` VALUES ('107', '2023-04-07 08:14:09', '商品名称7', '商品分类7', '规格7', '7', '7', 'upload/jianshenshangpin_fengmian7.jpg,upload/jianshenshangpin_fengmian8.jpg,upload/jianshenshangpin_fengmian9.jpg', '使用说明7', '2023-04-07', '商品介绍7', '2023-04-07 08:14:09', '7');
INSERT INTO `jianshenshangpin` VALUES ('108', '2023-04-07 08:14:09', '商品名称8', '商品分类8', '规格8', '8', '8', 'upload/jianshenshangpin_fengmian8.jpg,upload/jianshenshangpin_fengmian9.jpg,upload/jianshenshangpin_fengmian10.jpg', '使用说明8', '2023-04-07', '商品介绍8', '2023-04-07 08:14:09', '8');

-- ----------------------------
-- Table structure for `jiaolian`
-- ----------------------------
DROP TABLE IF EXISTS `jiaolian`;
CREATE TABLE `jiaolian` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaolianzhanghao` varchar(200) NOT NULL COMMENT '教练账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `nianling` int DEFAULT NULL COMMENT '年龄',
  `jiaoling` int DEFAULT NULL COMMENT '教龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `touxiang` longtext COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaolianzhanghao` (`jiaolianzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='教练';

-- ----------------------------
-- Records of jiaolian
-- ----------------------------
INSERT INTO `jiaolian` VALUES ('21', '2023-04-07 08:14:09', '教练账号1', '123456', '教练姓名1', '1', '1', '男', '13823888881', 'upload/jiaolian_touxiang1.jpg');
INSERT INTO `jiaolian` VALUES ('22', '2023-04-07 08:14:09', '教练账号2', '123456', '教练姓名2', '2', '2', '男', '13823888882', 'upload/jiaolian_touxiang2.jpg');
INSERT INTO `jiaolian` VALUES ('23', '2023-04-07 08:14:09', '教练账号3', '123456', '教练姓名3', '3', '3', '男', '13823888883', 'upload/jiaolian_touxiang3.jpg');
INSERT INTO `jiaolian` VALUES ('24', '2023-04-07 08:14:09', '教练账号4', '123456', '教练姓名4', '4', '4', '男', '13823888884', 'upload/jiaolian_touxiang4.jpg');
INSERT INTO `jiaolian` VALUES ('25', '2023-04-07 08:14:09', '教练账号5', '123456', '教练姓名5', '5', '5', '男', '13823888885', 'upload/jiaolian_touxiang5.jpg');
INSERT INTO `jiaolian` VALUES ('26', '2023-04-07 08:14:09', '教练账号6', '123456', '教练姓名6', '6', '6', '男', '13823888886', 'upload/jiaolian_touxiang6.jpg');
INSERT INTO `jiaolian` VALUES ('27', '2023-04-07 08:14:09', '教练账号7', '123456', '教练姓名7', '7', '7', '男', '13823888887', 'upload/jiaolian_touxiang7.jpg');
INSERT INTO `jiaolian` VALUES ('28', '2023-04-07 08:14:09', '教练账号8', '123456', '教练姓名8', '8', '8', '男', '13823888888', 'upload/jiaolian_touxiang8.jpg');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('131', '2023-04-07 08:14:09', '有梦想，就要努力去实现', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。', 'upload/news_picture1.jpg', '<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>');
INSERT INTO `news` VALUES ('132', '2023-04-07 08:14:09', '又是一年毕业季', '又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。', 'upload/news_picture2.jpg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `news` VALUES ('133', '2023-04-07 08:14:09', '挫折路上，坚持常在心间', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture3.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news` VALUES ('134', '2023-04-07 08:14:09', '挫折是另一个生命的开端', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。', 'upload/news_picture4.jpg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `news` VALUES ('135', '2023-04-07 08:14:09', '你要去相信，没有到不了的明天', '有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。', 'upload/news_picture5.jpg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');
INSERT INTO `news` VALUES ('136', '2023-04-07 08:14:09', '离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture6.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES ('137', '2023-04-07 08:14:09', 'Leave未必是一种痛苦', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture7.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES ('138', '2023-04-07 08:14:09', '坚持才会成功', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture8.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');

-- ----------------------------
-- Table structure for `storeup`
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='收藏表';

-- ----------------------------
-- Records of storeup
-- ----------------------------

-- ----------------------------
-- Table structure for `systemintro`
-- ----------------------------
DROP TABLE IF EXISTS `systemintro`;
CREATE TABLE `systemintro` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='关于我们';

-- ----------------------------
-- Records of systemintro
-- ----------------------------
INSERT INTO `systemintro` VALUES ('1', '2023-04-07 08:14:09', '系统简介', 'SYSTEM INTRODUCTION', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。', 'upload/systemintro_picture1.jpg', 'upload/systemintro_picture2.jpg', 'upload/systemintro_picture3.jpg');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', '1', 'admin', 'users', '管理员', '32n7yvcu9o6ife841s6l5aj4xmzeeeqd', '2025-04-18 21:41:31', '2025-04-18 22:41:32');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin', '管理员', '2023-04-07 08:14:09');

-- ----------------------------
-- Table structure for `yuechongzhi`
-- ----------------------------
DROP TABLE IF EXISTS `yuechongzhi`;
CREATE TABLE `yuechongzhi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `jine` float DEFAULT NULL COMMENT '金额',
  `chongzhishijian` datetime DEFAULT NULL COMMENT '充值时间',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COMMENT='余额充值';

-- ----------------------------
-- Records of yuechongzhi
-- ----------------------------
INSERT INTO `yuechongzhi` VALUES ('31', '2023-04-07 08:14:09', '账号1', '姓名1', '1', '2023-04-07 08:14:09', '备注1', '未支付');
INSERT INTO `yuechongzhi` VALUES ('32', '2023-04-07 08:14:09', '账号2', '姓名2', '2', '2023-04-07 08:14:09', '备注2', '未支付');
INSERT INTO `yuechongzhi` VALUES ('33', '2023-04-07 08:14:09', '账号3', '姓名3', '3', '2023-04-07 08:14:09', '备注3', '未支付');
INSERT INTO `yuechongzhi` VALUES ('34', '2023-04-07 08:14:09', '账号4', '姓名4', '4', '2023-04-07 08:14:09', '备注4', '未支付');
INSERT INTO `yuechongzhi` VALUES ('35', '2023-04-07 08:14:09', '账号5', '姓名5', '5', '2023-04-07 08:14:09', '备注5', '未支付');
INSERT INTO `yuechongzhi` VALUES ('36', '2023-04-07 08:14:09', '账号6', '姓名6', '6', '2023-04-07 08:14:09', '备注6', '未支付');
INSERT INTO `yuechongzhi` VALUES ('37', '2023-04-07 08:14:09', '账号7', '姓名7', '7', '2023-04-07 08:14:09', '备注7', '未支付');
INSERT INTO `yuechongzhi` VALUES ('38', '2023-04-07 08:14:09', '账号8', '姓名8', '8', '2023-04-07 08:14:09', '备注8', '未支付');
