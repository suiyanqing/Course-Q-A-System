/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm22710kcjxdyzxt

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2024-09-24 15:04:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '帐号',
  `pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `jiedapingfen`
-- ----------------------------
DROP TABLE IF EXISTS `jiedapingfen`;
CREATE TABLE `jiedapingfen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wentijiedaid` int(10) unsigned NOT NULL COMMENT '问题解答id',
  `bianhao` varchar(50) NOT NULL DEFAULT '' COMMENT '编号',
  `biaoti` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tiwenren` varchar(64) NOT NULL DEFAULT '' COMMENT '提问人',
  `wentijieda` varchar(255) NOT NULL DEFAULT '' COMMENT '问题解答',
  `jiedaren` varchar(64) NOT NULL DEFAULT '' COMMENT '解答人',
  `pingfen` int(11) NOT NULL DEFAULT '0' COMMENT '评分',
  PRIMARY KEY (`id`),
  KEY `jiedapingfen_wentijiedaid_index` (`wentijiedaid`),
  KEY `jiedapingfen_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='解答评分';

-- ----------------------------
-- Records of jiedapingfen
-- ----------------------------
INSERT INTO `jiedapingfen` VALUES ('1', '2', '09241403094755', 'Python这个算法怎么写', '5', '999', '<p>ddfgdfg</p>', '100', '10');
INSERT INTO `jiedapingfen` VALUES ('2', '1', '09241410441356', 'Spboot框架如何实现', '1', '999', '<p>东山风动石</p>', '100', '5');
INSERT INTO `jiedapingfen` VALUES ('3', '5', '09241410441356', 'Spboot框架如何实现', '1', '999', '<p>水电费水电费</p>', '888', '6');
INSERT INTO `jiedapingfen` VALUES ('4', '4', '09241409071250', 'C#net开发软件有哪些', '4', '999', '<p>是电饭锅电饭锅辅导</p>', '888', '10');
INSERT INTO `jiedapingfen` VALUES ('5', '3', '09241403481627', 'Python如何链接mysql', '5', '999', '<p>豆腐干豆腐</p>', '888', '3');
INSERT INTO `jiedapingfen` VALUES ('6', '7', '09241408321253', '静态页面先后顺序', '3', '999', '<p>地方鬼地方个地方</p>', '666', '10');
INSERT INTO `jiedapingfen` VALUES ('7', '6', '09241403481627', 'Python如何链接mysql', '5', '999', '<p>发的鬼地方个地方</p>', '666', '8');
INSERT INTO `jiedapingfen` VALUES ('8', '8', '09241502068900', '大股东给对方', '1', '666', '<p>法规和风格和</p>', '200', '10');

-- ----------------------------
-- Table structure for `kechengfenlei`
-- ----------------------------
DROP TABLE IF EXISTS `kechengfenlei`;
CREATE TABLE `kechengfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='课程分类';

-- ----------------------------
-- Records of kechengfenlei
-- ----------------------------
INSERT INTO `kechengfenlei` VALUES ('1', 'JAVA');
INSERT INTO `kechengfenlei` VALUES ('3', 'php');
INSERT INTO `kechengfenlei` VALUES ('4', 'C#NET');
INSERT INTO `kechengfenlei` VALUES ('5', 'Python');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '连接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '1', 'upload/1727157526528.png', '#');
INSERT INTO `lunbotu` VALUES ('2', '2', 'upload/1727157536928.png', '#');
INSERT INTO `lunbotu` VALUES ('3', '3', 'upload/1727157546854.png', '#');

-- ----------------------------
-- Table structure for `wentijieda`
-- ----------------------------
DROP TABLE IF EXISTS `wentijieda`;
CREATE TABLE `wentijieda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wentitiwenid` int(10) unsigned NOT NULL COMMENT '问题提问id',
  `bianhao` varchar(50) NOT NULL DEFAULT '' COMMENT '编号',
  `biaoti` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tiwenren` varchar(64) NOT NULL DEFAULT '' COMMENT '提问人',
  `wentijieda` longtext NOT NULL COMMENT '问题解答',
  `jiedaren` varchar(64) NOT NULL DEFAULT '' COMMENT '解答人',
  `tijiaozhepingfen` int(11) NOT NULL DEFAULT '0' COMMENT '提交者评分',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '解答时间',
  PRIMARY KEY (`id`),
  KEY `wentijieda_wentitiwenid_index` (`wentitiwenid`),
  KEY `wentijieda_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='问题解答';

-- ----------------------------
-- Records of wentijieda
-- ----------------------------
INSERT INTO `wentijieda` VALUES ('1', '8', '09241410441356', 'Spboot框架如何实现', '1', '999', '<p>东山风动石</p>', '100', '5', '2024-09-24 14:22:47');
INSERT INTO `wentijieda` VALUES ('2', '1', '09241403094755', 'Python这个算法怎么写', '5', '999', '<p>ddfgdfg</p>', '100', '10', '2024-09-24 14:28:27');
INSERT INTO `wentijieda` VALUES ('3', '2', '09241403481627', 'Python如何链接mysql', '5', '999', '<p>豆腐干豆腐</p>', '888', '3', '2024-09-24 14:37:09');
INSERT INTO `wentijieda` VALUES ('4', '5', '09241409071250', 'C#net开发软件有哪些', '4', '999', '<p>是电饭锅电饭锅辅导</p>', '888', '10', '2024-09-24 14:37:13');
INSERT INTO `wentijieda` VALUES ('5', '8', '09241410441356', 'Spboot框架如何实现', '1', '999', '<p>水电费水电费</p>', '888', '6', '2024-09-24 14:37:16');
INSERT INTO `wentijieda` VALUES ('6', '2', '09241403481627', 'Python如何链接mysql', '5', '999', '<p>发的鬼地方个地方</p>', '666', '8', '2024-09-24 15:01:08');
INSERT INTO `wentijieda` VALUES ('7', '4', '09241408321253', '静态页面先后顺序', '3', '999', '<p>地方鬼地方个地方</p>', '666', '10', '2024-09-24 15:01:14');
INSERT INTO `wentijieda` VALUES ('8', '9', '09241502068900', '大股东给对方', '1', '666', '<p>法规和风格和</p>', '200', '10', '2024-09-24 15:03:15');

-- ----------------------------
-- Table structure for `wentitiwen`
-- ----------------------------
DROP TABLE IF EXISTS `wentitiwen`;
CREATE TABLE `wentitiwen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL DEFAULT '' COMMENT '编号',
  `biaoti` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `fengmian` varchar(255) NOT NULL COMMENT '封面',
  `neirong` longtext NOT NULL COMMENT '内容',
  `jiedashu` int(11) NOT NULL DEFAULT '0' COMMENT '解答数',
  `tiwenren` varchar(64) NOT NULL DEFAULT '' COMMENT '提问人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提问时间',
  PRIMARY KEY (`id`),
  KEY `wentitiwen_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='问题提问';

-- ----------------------------
-- Records of wentitiwen
-- ----------------------------
INSERT INTO `wentitiwen` VALUES ('1', '09241403094755', 'Python这个算法怎么写', '5', 'upload/1727157825126.png', '<p>Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写Python这个算法怎么写</p>', '1', '999', '2024-09-24 14:03:48');
INSERT INTO `wentitiwen` VALUES ('2', '09241403481627', 'Python如何链接mysql', '5', 'upload/1727157857832.png', '<p>Python如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysqlPython如何链接mysql</p>', '2', '999', '2024-09-24 14:04:20');
INSERT INTO `wentitiwen` VALUES ('3', '09241407401667', 'PHPhtml5页面如何实现', '3', 'upload/1727158108496.png', '<p>PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现PHPhtml5页面如何实现</p>', '0', '999', '2024-09-24 14:08:31');
INSERT INTO `wentitiwen` VALUES ('4', '09241408321253', '静态页面先后顺序', '3', 'upload/1727158145074.png', '<p>静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序静态页面先后顺序</p>', '1', '999', '2024-09-24 14:09:07');
INSERT INTO `wentitiwen` VALUES ('5', '09241409071250', 'C#net开发软件有哪些', '4', 'upload/1727158181071.png', '<p>C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些C#net开发软件有哪些</p>', '1', '999', '2024-09-24 14:09:43');
INSERT INTO `wentitiwen` VALUES ('6', '09241409431821', 'C#如何连接SQL Server', '4', 'upload/1727158216223.png', '<p>C#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL ServerC#如何连接SQL Server</p>', '0', '999', '2024-09-24 14:10:19');
INSERT INTO `wentitiwen` VALUES ('7', '09241410194961', 'SSM框架如何实现', '1', 'upload/1727158241553.png', '<p>SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现SSM框架如何实现</p>', '0', '999', '2024-09-24 14:10:44');
INSERT INTO `wentitiwen` VALUES ('8', '09241410441356', 'Spboot框架如何实现', '1', 'upload/1727158263925.png', '<p>Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现Spboot框架如何实现</p>', '2', '999', '2024-09-24 14:11:06');
INSERT INTO `wentitiwen` VALUES ('9', '09241502068900', '大股东给对方', '1', 'upload/1727161334044.png', '<p>大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方大股东给对方</p>', '1', '666', '2024-09-24 15:02:17');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cx` varchar(50) NOT NULL COMMENT '权限',
  `yonghuming` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `mima` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `xingming` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `xingbie` varchar(10) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `pingjiafen` int(10) NOT NULL COMMENT '评价分',
  `youxiufen` int(10) NOT NULL COMMENT '优秀分',
  `jiedashu` int(10) NOT NULL COMMENT '解答数',
  `dayidengji` varchar(50) NOT NULL COMMENT '答疑等级',
  `tiwendengji` varchar(50) NOT NULL COMMENT '提问等级',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `tiwenshu` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '学生', '999', '999', '小明', '男', '12222222222', '0', '15', '0', '暂无', '一般', 'upload/1727157605611.huabanimg.com_695d8138fa69d156563736d5b2c5c97f1e2561a757749-aYd5D0_fw658&refer=http___hbimg.huabanimg.jpg', '8');
INSERT INTO `yonghu` VALUES ('2', '学生', '888', '888', '小红', '女', '12222522222', '19', '0', '3', '暂无', '暂无', 'upload/1727157617902.jpg', '0');
INSERT INTO `yonghu` VALUES ('3', '老师', '100', '100', '陈老师', '男', '12222224444', '15', '0', '2', '暂无', '暂无', 'upload/1727157633958.jpg', '0');
INSERT INTO `yonghu` VALUES ('4', '学生', '666', '666', '小美', '女', '12222522242', '18', '10', '2', '暂无', '一般', 'upload/1727161248053.jpg', '1');
INSERT INTO `yonghu` VALUES ('5', '老师', '200', '200', '陈老师', '男', '13414452572', '10', '0', '1', '暂无', '暂无', 'upload/1727161370877.jpg', '0');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL DEFAULT '' COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL DEFAULT '' COMMENT '网址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接';

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com');
INSERT INTO `youqinglianjie` VALUES ('4', 'QQ', 'http://www.qq.com');
INSERT INTO `youqinglianjie` VALUES ('5', '网易', 'http://www.163.com');

-- ----------------------------
-- Table structure for `youxiudafen`
-- ----------------------------
DROP TABLE IF EXISTS `youxiudafen`;
CREATE TABLE `youxiudafen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wentitiwenid` int(10) unsigned NOT NULL COMMENT '问题提问id',
  `bianhao` varchar(50) NOT NULL DEFAULT '' COMMENT '编号',
  `biaoti` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `tiwenren` varchar(64) NOT NULL DEFAULT '' COMMENT '提问人',
  `youxiupingfen` varchar(50) NOT NULL COMMENT '优秀评分',
  `shuoming` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `pingjialaoshi` varchar(64) NOT NULL DEFAULT '' COMMENT '评价老师',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评价时间',
  PRIMARY KEY (`id`),
  KEY `youxiudafen_wentitiwenid_index` (`wentitiwenid`),
  KEY `youxiudafen_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='优秀打分';

-- ----------------------------
-- Records of youxiudafen
-- ----------------------------
INSERT INTO `youxiudafen` VALUES ('2', '8', '09241410441356', 'Spboot框架如何实现', '1', '999', '优秀(10分)', '11', '100', '2024-09-24 14:27:26');
INSERT INTO `youxiudafen` VALUES ('3', '1', '09241403094755', 'Python这个算法怎么写', '5', '999', '一般(5分)', '11', '100', '2024-09-24 14:28:20');
INSERT INTO `youxiudafen` VALUES ('4', '9', '09241502068900', '大股东给对方', '1', '666', '优秀(10分)', '是的发生的', '200', '2024-09-24 15:03:07');
