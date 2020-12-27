# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.28-log)
# Database: db_shop
# Generation Time: 2020-12-27 10:18:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_after_sale
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_after_sale`;

CREATE TABLE `t_after_sale` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `date` datetime NOT NULL COMMENT '退换时间',
  `type` varchar(32) NOT NULL DEFAULT '0' COMMENT '退换类别（退、换）',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退换货记录表';



# Dump of table t_order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_order_detail`;

CREATE TABLE `t_order_detail` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `detail_id` varchar(32) NOT NULL COMMENT '订单详情id',
  `order_id` varchar(32) NOT NULL COMMENT '主订单id',
  `product_id` varchar(32) NOT NULL COMMENT '商品id',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `detail_id` (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';



# Dump of table t_order_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_order_master`;

CREATE TABLE `t_order_master` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `time` datetime NOT NULL COMMENT '下单时间',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `order_type` varchar(32) NOT NULL DEFAULT '' COMMENT '订单类型',
  `vip_no` varchar(32) DEFAULT '' COMMENT '会员卡号',
  `pay_by` varchar(32) NOT NULL DEFAULT '' COMMENT '支付方式',
  `pay_status` varchar(32) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `order_status` varchar(32) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表';



# Dump of table t_product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_product_category`;

CREATE TABLE `t_product_category` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `category_id` varchar(32) NOT NULL COMMENT '类别id',
  `category_name` varchar(255) NOT NULL COMMENT '类别名称',
  `category_level` varchar(2) NOT NULL DEFAULT '' COMMENT 'L or M or S',
  `parent_category` varchar(64) NOT NULL COMMENT '父级分类',
  `category_desc` varchar(255) NOT NULL COMMENT '类别描述',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别表';

LOCK TABLES `t_product_category` WRITE;
/*!40000 ALTER TABLE `t_product_category` DISABLE KEYS */;

INSERT INTO `t_product_category` (`id`, `category_id`, `category_name`, `category_level`, `parent_category`, `category_desc`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	('ff2bac463c3111eb860d20e7270cc9cd','T2020121200001','食品','L','','食品',0,'unknown','2020-12-12 12:24:59','unknown','2020-12-27 16:45:50'),
	('ff2bac463c3111eb860d20e7270cc9ce','T2020122700001','肉类','M','T2020121200001','肉类',0,'unknown','2020-12-27 16:46:46','unknown','2020-12-27 16:46:46'),
	('ff2bac463c3111eb860d20e7270cc9cf','T2020122700002','猪肉','S','T2020122700001','猪肉',0,'unknown','2020-12-27 16:48:21','unknown','2020-12-27 17:06:21');

/*!40000 ALTER TABLE `t_product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_product_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_product_info`;

CREATE TABLE `t_product_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `product_id` varchar(32) NOT NULL COMMENT '商品id',
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '商品描述',
  `category` varchar(64) NOT NULL DEFAULT '''''' COMMENT '商品分类',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `on_sale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在售',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

LOCK TABLES `t_product_info` WRITE;
/*!40000 ALTER TABLE `t_product_info` DISABLE KEYS */;

INSERT INTO `t_product_info` (`id`, `product_id`, `product_name`, `product_desc`, `category`, `price`, `on_sale`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	('d393b8903c3511eb860d20e7270cc9cd','P2020121200001','美国进口冻猪肉','美国进口冻猪肉','T2020122700002',10.00,0,0,'unknown','2020-12-12 12:52:24','unknown','2020-12-27 16:49:24');

/*!40000 ALTER TABLE `t_product_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_product_inventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_product_inventory`;

CREATE TABLE `t_product_inventory` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `product_id` varchar(32) NOT NULL COMMENT '商品id',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `validation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '有效标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存表';

LOCK TABLES `t_product_inventory` WRITE;
/*!40000 ALTER TABLE `t_product_inventory` DISABLE KEYS */;

INSERT INTO `t_product_inventory` (`id`, `product_id`, `product_name`, `count`, `remark`, `validation`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	('65d7b29c3c3611eb860d20e7270cc9cd','P2020121200001','商品名称1',998,'畅销产品1',0,'unknown','2020-12-12 12:56:29','unknown','2020-12-12 16:36:18');

/*!40000 ALTER TABLE `t_product_inventory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_product_purchase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_product_purchase`;

CREATE TABLE `t_product_purchase` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `purchase_id` varchar(32) NOT NULL COMMENT '采购记录id',
  `product_id` varchar(32) NOT NULL COMMENT '商品id',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '采购数量',
  `date` date NOT NULL COMMENT '采购日期',
  `producer` varchar(255) NOT NULL DEFAULT '' COMMENT '生产厂商',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '采购单价',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '采购总价',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_id` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购记录表';



# Dump of table t_surplus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_surplus`;

CREATE TABLE `t_surplus` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键id',
  `surplus` decimal(10,2) NOT NULL COMMENT '系统余额',
  `create_by` varchar(32) NOT NULL DEFAULT 'unkonwn' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table t_surplus_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_surplus_detail`;

CREATE TABLE `t_surplus_detail` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键id',
  `time` datetime NOT NULL COMMENT '日期',
  `type` varchar(32) NOT NULL DEFAULT '商品销售' COMMENT '收支类型',
  `related_info` varchar(64) NOT NULL COMMENT '关联信息',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `create_by` varchar(32) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table t_system_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_system_user`;

CREATE TABLE `t_system_user` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `user_id` varchar(32) NOT NULL COMMENT '系统用户',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `role` varchar(32) NOT NULL COMMENT '用户角色',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';

LOCK TABLES `t_system_user` WRITE;
/*!40000 ALTER TABLE `t_system_user` DISABLE KEYS */;

INSERT INTO `t_system_user` (`id`, `user_id`, `password`, `role`, `remark`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	('U0001','系统管理员1','P12345','ROLE_ADMIN','系统管理员',0,'system','2020-12-13 13:36:49','system','2020-12-13 14:22:15'),
	('U0002','数据分析员1','P12345','ROLE_MANAGER','数据分析员',0,'system','2020-12-13 13:47:34','system','2020-12-13 14:22:18'),
	('U0003','收银员1','P12345','ROLE_CASHIER','收银员',0,'system','2020-12-13 13:48:04','system','2020-12-13 14:22:21');

/*!40000 ALTER TABLE `t_system_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_vip_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_vip_info`;

CREATE TABLE `t_vip_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `vip_no` varchar(32) NOT NULL COMMENT 'vip号码',
  `register_date` date NOT NULL COMMENT '注册日期',
  `level` varchar(32) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT 'unknown' COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vip_no` (`vip_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
