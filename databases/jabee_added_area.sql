-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.16 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for jabee123_vme
DROP DATABASE IF EXISTS `jabee123_vme`;
CREATE DATABASE IF NOT EXISTS `jabee123_vme` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jabee123_vme`;


-- Dumping structure for table jabee123_vme.acknowledgement_reciept
DROP TABLE IF EXISTS `acknowledgement_reciept`;
CREATE TABLE IF NOT EXISTS `acknowledgement_reciept` (
  `reciept_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `remarks` tinyblob NOT NULL,
  PRIMARY KEY (`reciept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jabee123_vme.acknowledgement_reciept: 1 rows
/*!40000 ALTER TABLE `acknowledgement_reciept` DISABLE KEYS */;
INSERT INTO `acknowledgement_reciept` (`reciept_id`, `name`, `address`, `date`, `remarks`) VALUES
	(1, 'dsadas', 'dasd', '2015-08-06', _binary 0x64736164);
/*!40000 ALTER TABLE `acknowledgement_reciept` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.action
DROP TABLE IF EXISTS `action`;
CREATE TABLE IF NOT EXISTS `action` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `function` varchar(50) DEFAULT 'index',
  `show_on_menu` tinyint(4) DEFAULT '0' COMMENT '0-false;1-true;2-no to all',
  `parent` int(11) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.action: ~57 rows (approximately)
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` (`action_id`, `name`, `module`, `function`, `show_on_menu`, `parent`, `sort`) VALUES
	(1, 'home', 'site', 'index', 2, NULL, 0),
	(2, 'inventory', 'inventory', 'index', 1, NULL, 2),
	(3, 'client', 'client', 'index', 2, NULL, 0),
	(4, 'employee', 'employee', 'index', 1, NULL, 3),
	(5, 'report', 'report', 'index', 1, NULL, 5),
	(6, 'setting', 'setting', 'index', 1, NULL, 6),
	(7, 'signin', 'site', 'signin', 2, NULL, 0),
	(8, 'signout', 'site', 'signout', 2, NULL, 0),
	(9, 'signin', 'signin', 'index', 2, NULL, 0),
	(10, 'signout', 'signout', 'index', 2, NULL, 0),
	(11, 'batch', 'batch', 'index', 0, 2, 3),
	(12, 'item', 'item', 'index', 0, 2, 1),
	(13, 'supplier', 'supplier', 'index', 0, 2, 2),
	(14, 'msr_client', 'msr_client', 'index', 0, 4, 2),
	(15, 'district', 'district', 'index', 0, 4, 1),
	(16, 'permission', 'permission', 'index', 0, 6, 2),
	(17, 'role', 'role', 'index', 0, 6, 1),
	(18, 'not_found', 'site', 'not_found', 2, NULL, 0),
	(19, 'employees', 'user', 'employee', 0, 4, 0),
	(20, 'clients', 'user', 'client', 1, NULL, 4),
	(21, 'sales', 'sales', 'index', 1, NULL, 0),
	(22, 'All', 'sales', 'all', 0, 21, 0),
	(27, 'district info', 'district', 'info', 2, 4, 0),
	(28, 'order_item', 'sales', 'item', 0, 21, 1),
	(29, 'collection', 'collection', 'index', 1, NULL, 1),
	(30, 'all payments', 'collection', 'all', 0, 29, 0),
	(32, 'maintenance', 'setting', 'maintenance', 0, 6, 4),
	(34, 'manage payment', 'collection', 'manage', 2, 29, 0),
	(35, 'reset database', 'setting', 'reset', 2, 6, 0),
	(36, 'logs', 'setting', 'logs', 0, 6, 3),
	(37, 'report type', 'report', 'type', 0, 5, 0),
	(38, 'view report', 'report', 'view', 0, 5, 2),
	(39, 'generate report', 'report', 'generate', 0, 5, 1),
	(40, 'set approved', 'sales', 'set_approved', 2, 21, 0),
	(41, 'set returned', 'sales', 'set_returned', 2, 21, 0),
	(42, 'set cancelled', 'sales', 'set_cancelled', 2, 21, 0),
	(43, 'set completed', 'sales', 'set_complete', 2, 21, 0),
	(44, 'print so', 'collection', 'reciept', 2, 29, 0),
	(45, 'test', 'site', 'test', 2, NULL, 0),
	(46, 'to_pdf', 'site', 'to_pdf', 2, NULL, 0),
	(47, 'history', 'item', 'history', 2, 2, 0),
	(48, 'all sales', 'sales', 'all_sales', 2, 21, 0),
	(49, 'sales_area', 'sales', 'area', 2, 21, 0),
	(50, 'collection_per_msr', 'collection', 'per_msr', 2, 29, 0),
	(51, 'add sales', 'sales', 'create', 0, 21, 0),
	(52, 'save sales', 'sales', 'save', 2, NULL, 0),
	(53, 'add Collection', 'collection', 'add_new', 0, 29, 0),
	(54, 'for_approval', 'sales', 'for_approval', 2, NULL, 0),
	(55, 'for_completion', 'sales', 'for_completion', 2, NULL, 0),
	(56, 'Near Expire', 'inventory', 'near_expire', 2, 2, 0),
	(57, 'collection ajax get msr dr', 'collection', 'get_dr', 2, NULL, 0),
	(58, 'AR', 'ar', 'index', 0, 29, 0),
	(59, 'inventory all', 'inventory', 'all', 2, NULL, 0),
	(60, 'migrate', 'setting', 'migrate', 2, NULL, 0),
	(61, 'rgs', 'rgs', 'index', 0, 29, 0),
	(62, 'acknowlegement reciept', 'acknowledge', 'index', 0, 5, 0),
	(63, 'get_rgs', 'rgs', 'get_rgs', 2, NULL, 0),
	(64, 'area', 'area', 'index', 0, 6, 0);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.area
DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) DEFAULT '0',
  `area_code` varchar(50) DEFAULT '0',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.area: ~0 rows (approximately)
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`area_id`, `area_name`, `area_code`) VALUES
	(1, 'manila', 'mnl1'),
	(2, 'cebu', 'ceb1');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.ar_old
DROP TABLE IF EXISTS `ar_old`;
CREATE TABLE IF NOT EXISTS `ar_old` (
  `ar_old_id` int(11) NOT NULL AUTO_INCREMENT,
  `dr_date` date NOT NULL DEFAULT '0000-00-00',
  `dr_num` varchar(50) NOT NULL DEFAULT '0',
  `amount` varchar(50) NOT NULL DEFAULT '0',
  `msr_client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ar_old_id`),
  KEY `FK_ar_old_user` (`msr_client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.ar_old: ~4 rows (approximately)
/*!40000 ALTER TABLE `ar_old` DISABLE KEYS */;
INSERT INTO `ar_old` (`ar_old_id`, `dr_date`, `dr_num`, `amount`, `msr_client_id`) VALUES
	(8, '2012-03-26', '18382', '249.60', 22),
	(9, '2012-03-26', '18383', '1740', 21),
	(10, '2012-04-19', '18672', '7900', 18),
	(11, '2011-05-04', '14943', '3642.40', 17);
/*!40000 ALTER TABLE `ar_old` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.batch
DROP TABLE IF EXISTS `batch`;
CREATE TABLE IF NOT EXISTS `batch` (
  `batch_id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_readable_id` varchar(50) NOT NULL,
  `item_id` int(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `count` int(10) NOT NULL DEFAULT '0',
  `access_type` enum('ordered','recieved','transfered') NOT NULL DEFAULT 'ordered',
  `sold_count` int(10) NOT NULL DEFAULT '0',
  `expire_count` int(10) NOT NULL DEFAULT '0',
  `return_count` int(10) NOT NULL DEFAULT '0',
  `buy` int(10) NOT NULL DEFAULT '0',
  `sell` int(10) NOT NULL DEFAULT '0',
  `lot_number` varchar(50) NOT NULL,
  `on_cavite_warehouse` enum('Y','N') NOT NULL DEFAULT 'N',
  `recieve_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  PRIMARY KEY (`batch_id`),
  KEY `FK__item` (`item_id`),
  KEY `FK__supplier` (`supplier_id`),
  KEY `FK__user` (`user_id`),
  CONSTRAINT `FK__item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `FK__supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.batch: ~8 rows (approximately)
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` (`batch_id`, `batch_readable_id`, `item_id`, `user_id`, `supplier_id`, `count`, `access_type`, `sold_count`, `expire_count`, `return_count`, `buy`, `sell`, `lot_number`, `on_cavite_warehouse`, `recieve_date`, `expire_date`, `status`) VALUES
	(1, 'b-a00001', 4, 1, 3, 10000, 'recieved', 0, 0, 0, 10000, 2, 'r1-c1', 'N', '2015-01-31', '2018-01-31', 'enabled'),
	(2, 'b-b00001', 2, 1, 4, 100000, 'recieved', 1000, 0, 0, 2, 3, 'r2-c2', 'N', '2015-01-31', '2019-01-30', 'enabled'),
	(3, 'b-c0001', 3, 1, 1, 10000, 'recieved', 0, 0, 0, 100, 120, 'r9-c1', 'N', '2015-01-31', '2018-01-31', 'enabled'),
	(4, 'b-n0001', 1, 1, 2, 1000000, 'recieved', 250, 0, 1000, 3, 4, 'r99-c11', 'N', '2015-01-31', '2020-01-22', 'enabled'),
	(5, 'b-w0001', 5, 1, 1, 100, 'recieved', 0, 0, 0, 10, 15, 'r7-c3', 'N', '2015-01-31', '2024-01-25', 'enabled'),
	(6, 'V33124', 6, 1, 5, 490, 'ordered', 150, 0, 0, 0, 0, 'V33124', 'N', '2014-03-06', '2016-10-31', 'enabled'),
	(7, 'V34077', 6, 1, 5, 8960, 'ordered', 0, 0, 0, 0, 0, 'V34077', 'N', '2014-10-09', '2017-06-30', 'enabled'),
	(9, 'CFA20', 7, 1, 11, 2, 'recieved', 0, 0, 0, 0, 0, 'CFA20', 'N', '2014-04-28', '2015-08-01', 'enabled');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.crud
DROP TABLE IF EXISTS `crud`;
CREATE TABLE IF NOT EXISTS `crud` (
  `crud_id` int(10) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`crud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.crud: ~0 rows (approximately)
/*!40000 ALTER TABLE `crud` DISABLE KEYS */;
/*!40000 ALTER TABLE `crud` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.district
DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `district_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.district: ~4 rows (approximately)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`district_id`, `name`) VALUES
	(1, 'south'),
	(2, 'central'),
	(3, 'north'),
	(4, 'VACANT DISTRICT');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `item_type_id` int(10) DEFAULT NULL,
  `generic_name` varchar(150) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `FK_item_item_type` (`item_type_id`),
  CONSTRAINT `FK_item_item_type` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.item: ~7 rows (approximately)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`item_id`, `name`, `item_type_id`, `generic_name`, `description`, `status`, `datetime`) VALUES
	(1, 'neozep', 2, 'paracetamol', '50mg', 'enabled', '2015-01-31 16:50:16'),
	(2, 'biogesic', 2, 'antisakit ulosis', '50ml', 'enabled', '2015-01-31 16:50:47'),
	(3, 'ceelin', 1, 'antisipon gamotsis', '250ml', 'enabled', '2015-01-31 16:51:25'),
	(4, 'alaxan', 2, 'antisakit katwanasis', '25ml', 'enabled', '2015-01-31 16:52:02'),
	(5, 'whiskey wine', 3, 'alaksis lasingosis', '1liter', 'enabled', '2015-01-31 16:52:30'),
	(6, 'ZERONE', 1, 'CEFTRIAXONE SODIUM', '1G', 'enabled', '2015-03-27 13:36:41'),
	(7, 'Zyndes', 5, 'Citicoline', '1g, (250mg/ml)- 4ml', 'enabled', '2015-06-05 15:23:54');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.item_type
DROP TABLE IF EXISTS `item_type`;
CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.item_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` (`item_type_id`, `name`) VALUES
	(1, 'vial'),
	(2, 'oral'),
	(3, 'bottle'),
	(4, 'tablet'),
	(5, 'ampoule'),
	(6, 'suppository');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `log_id` int(250) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(50) NOT NULL,
  `useragent` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `url` varchar(50) NOT NULL,
  `sql` varchar(50) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.logs: ~340 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`log_id`, `ip_address`, `useragent`, `user_id`, `role_id`, `action`, `result`, `target`, `url`, `sql`, `datetime`) VALUES
	(1, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2015-01-31 16:41:12'),
	(2, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-01-31 16:41:16'),
	(3, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2015-01-31 16:41:18'),
	(4, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '14', 3, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'3\'', '2015-01-31 16:41:22'),
	(5, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-01-31 16:41:26'),
	(6, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '1', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'gobris tr', '2015-01-31 16:48:47'),
	(7, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '2', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'mundalas ', '2015-01-31 16:49:02'),
	(8, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '3', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'all gamot', '2015-01-31 16:49:20'),
	(9, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '4', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'gamot buy', '2015-01-31 16:49:34'),
	(10, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '1', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 16:50:16'),
	(11, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '2', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 16:50:47'),
	(12, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '3', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 16:51:25'),
	(13, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '4', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 16:52:02'),
	(14, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '5', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 16:52:30'),
	(15, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '24', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 16:54:11'),
	(16, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '25', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 16:54:44'),
	(17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '26', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 16:55:23'),
	(18, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '27', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 16:56:10'),
	(19, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '28', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 16:56:41'),
	(20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '29', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 16:57:09'),
	(21, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '30', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 17:00:18'),
	(22, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '31', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 17:01:54'),
	(23, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '32', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 17:03:33'),
	(24, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '33', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 17:04:23'),
	(25, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '34', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 17:07:52'),
	(26, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '35', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 17:09:05'),
	(27, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '25', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 17:09:30'),
	(28, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '29', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 17:09:37'),
	(29, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 17:09:45'),
	(30, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '27', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 17:09:50'),
	(31, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '26', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 17:10:01'),
	(32, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '28', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 17:10:06'),
	(33, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '1', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 17:12:08'),
	(34, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '2', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 17:13:02'),
	(35, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '3', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 17:13:44'),
	(36, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '4', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 17:14:24'),
	(37, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '5', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 17:15:09'),
	(38, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-10 22:50:07'),
	(39, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-11 00:50:03'),
	(40, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-11 01:21:33'),
	(41, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-11 01:21:47'),
	(42, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-11 01:22:39'),
	(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-11 23:05:10'),
	(44, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-24 22:25:38'),
	(45, '180.191.92.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vmv2/index.php/signout', '0', '2015-03-24 22:26:23'),
	(46, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-24 22:31:55'),
	(47, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-24 22:32:00'),
	(48, '180.191.92.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-24 22:33:38'),
	(49, '180.191.92.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-24 22:52:21'),
	(50, '180.191.92.1', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-25 02:04:28'),
	(51, '180.191.92.1', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-25 08:22:54'),
	(52, '112.209.179.78', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-25 09:13:54'),
	(53, '180.191.92.1', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-25 12:30:24'),
	(54, '180.191.92.1', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '0', 0, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-25 12:48:41'),
	(55, '180.191.92.1', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-25 12:49:50'),
	(56, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-25 15:03:03'),
	(57, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 12:34:41'),
	(58, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 12:35:17'),
	(59, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 12:46:32'),
	(60, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 13:08:19'),
	(61, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 13:13:37'),
	(62, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 13:13:54'),
	(63, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 13:21:07'),
	(64, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 13:28:37'),
	(65, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 13:29:32'),
	(66, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 13:33:37'),
	(67, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 14:07:16'),
	(68, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 14:16:00'),
	(69, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 14:16:29'),
	(70, '180.191.90.15', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 14:57:05'),
	(71, '180.191.90.15', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 14:58:38'),
	(72, '112.209.179.78', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 17:45:36'),
	(73, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-26 18:56:23'),
	(74, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'erika\', `middle_', '2015-03-26 18:59:31'),
	(75, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'erika\', `middle_', '2015-03-26 18:59:51'),
	(76, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-27 10:13:30'),
	(77, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '6', 'http://vmephilmedica.com/vme/index.php/item/index/', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-03-27 13:36:41'),
	(78, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '5', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Suhitas P', '2015-03-27 13:38:57'),
	(79, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '6', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-03-27 13:42:55'),
	(80, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '6', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Planetari', '2015-03-27 13:44:18'),
	(81, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '7', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Beracah P', '2015-03-27 13:44:58'),
	(82, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '8', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Jollymed ', '2015-03-27 13:45:19'),
	(83, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '9', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Pharma Jo', '2015-03-27 13:45:44'),
	(84, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '10', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Kairos Dy', '2015-03-27 13:46:13'),
	(85, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '11', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Zuneca In', '2015-03-27 13:46:21'),
	(86, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '12', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Greencore', '2015-03-27 13:46:44'),
	(87, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '13', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Triple Ta', '2015-03-27 13:47:20'),
	(88, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '14', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Ferj\\\'s P', '2015-03-27 13:47:30'),
	(89, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '15', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Better Op', '2015-03-27 13:47:44'),
	(90, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '15', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'UPDATE `supplier` SET `name` = \'Better Option Phar', '2015-03-27 13:48:21'),
	(91, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '16', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'D & G Pha', '2015-03-27 13:49:45'),
	(92, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '17', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Qualityme', '2015-03-27 13:50:09'),
	(93, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '18', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Marzan Ph', '2015-03-27 13:50:23'),
	(94, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '19', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Vhermann ', '2015-03-27 13:50:49'),
	(95, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '20', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Endure Me', '2015-03-27 13:50:59'),
	(96, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '21', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Ellebasy ', '2015-03-27 13:51:58'),
	(97, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '22', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Two World', '2015-03-27 13:52:17'),
	(98, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '23', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Ambica In', '2015-03-27 13:52:43'),
	(99, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '24', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Sheryl Ma', '2015-03-27 13:53:14'),
	(100, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '25', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Savermed ', '2015-03-27 13:53:40'),
	(101, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '26', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'New Myrex', '2015-03-27 13:54:23'),
	(102, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '27', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Checktrad', '2015-03-27 13:54:38'),
	(103, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '28', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'SKPD Jen ', '2015-03-27 13:54:58'),
	(104, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '29', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Eurohealt', '2015-03-27 13:55:52'),
	(105, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '30', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Vitalife ', '2015-03-27 13:56:24'),
	(106, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '31', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Al-Ry Pha', '2015-03-27 13:56:47'),
	(107, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '32', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'St. Marti', '2015-03-27 13:57:22'),
	(108, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '33', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Nutriphar', '2015-03-27 13:57:43'),
	(109, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '34', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Interlink', '2015-03-27 13:58:10'),
	(110, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '35', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Genpharma', '2015-03-27 13:58:31'),
	(111, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '36', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Medethix ', '2015-03-27 13:58:57'),
	(112, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '36', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'UPDATE `supplier` SET `name` = \'Medethix Inc.\', `s', '2015-03-27 13:59:10'),
	(113, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '29', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'UPDATE `supplier` SET `name` = \'Eurohealthcare Exp', '2015-03-27 13:59:52'),
	(114, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '37', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Growrich\'', '2015-03-27 14:00:16'),
	(115, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '38', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Sel-J Pha', '2015-03-27 14:01:23'),
	(116, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '39', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Steinbach', '2015-03-27 14:01:56'),
	(117, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '40', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (\'Ryan Batu', '2015-03-27 14:02:20'),
	(118, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '7', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-03-27 14:07:39'),
	(119, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-27 19:32:10'),
	(120, '112.209.179.78', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-27 21:59:53'),
	(121, '112.209.178.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-31 18:11:13'),
	(122, '112.209.178.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-04-01 15:49:46'),
	(123, '112.209.139.136', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-04-15 16:42:44'),
	(124, '112.209.139.136', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-04-16 16:24:48'),
	(125, '112.209.139.136', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-04-16 16:26:24'),
	(126, '180.191.89.4', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-04-17 01:59:16'),
	(127, '180.191.89.4', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-04-17 02:10:04'),
	(128, '112.209.222.86', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-05-13 17:43:15'),
	(129, '112.209.222.86', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-05-20 08:16:26'),
	(130, '110.55.3.219', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-01 00:36:09'),
	(131, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 09:40:32'),
	(132, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 09:40:47'),
	(133, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 09:41:56'),
	(134, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 13:02:13'),
	(135, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 13:02:45'),
	(136, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '36', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:07:16'),
	(137, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '37', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:10:03'),
	(138, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '38', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:11:09'),
	(139, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '39', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:13:06'),
	(140, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '40', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:14:15'),
	(141, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '41', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:26:17'),
	(142, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '42', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:29:07'),
	(143, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '30', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'VALERIANA\', `mid', '2015-06-05 13:33:08'),
	(144, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '31', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'MARY IMMACULATE ', '2015-06-05 13:36:05'),
	(145, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '31', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'MARY IMMACULATE ', '2015-06-05 13:36:33'),
	(146, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '31', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'MARY IMMACULATE ', '2015-06-05 13:37:48'),
	(147, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '32', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. LANI\', `mid', '2015-06-05 13:39:21'),
	(148, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '32', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. LANI\', `mid', '2015-06-05 13:39:30'),
	(149, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '33', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. JAMAINE\', `', '2015-06-05 13:42:39'),
	(150, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '41', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. NERISA\', `m', '2015-06-05 13:43:05'),
	(151, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '41', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. NERISSA\', `', '2015-06-05 13:43:21'),
	(152, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '34', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. MA. ELENA\',', '2015-06-05 13:46:20'),
	(153, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '40', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. DOLORES GO\'', '2015-06-05 13:46:56'),
	(154, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '35', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'RUGAY MATERNITY ', '2015-06-05 13:49:21'),
	(155, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '35', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'RUGAY MATERNITY ', '2015-06-05 13:51:26'),
	(156, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '43', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:53:34'),
	(157, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '44', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:55:25'),
	(158, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '45', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 13:58:58'),
	(159, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '46', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 14:00:25'),
	(160, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  \'24\'', '2015-06-05 14:02:21'),
	(161, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '15', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'accountant\', `mi', '2015-06-05 14:03:37'),
	(162, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '24', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'DEXTER\', `middle', '2015-06-05 14:09:44'),
	(163, '121.97.142.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'admin@gma', '2015-06-05 14:19:32'),
	(164, '121.97.142.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'admin@gma', '2015-06-05 14:19:46'),
	(165, '121.97.142.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'admin@ema', '2015-06-05 14:20:15'),
	(166, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '25', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'MARY ANN\', `midd', '2015-06-05 14:32:10'),
	(167, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (K', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-06-05 14:32:34'),
	(168, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'erika\', `middle_', '2015-06-05 14:32:47'),
	(169, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'MILLISCENT\', `mi', '2015-06-05 14:34:05'),
	(170, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '27', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'CHERRYL ANNE\', `', '2015-06-05 14:50:50'),
	(171, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '27', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'CHERRYL ANNE\', `', '2015-06-05 14:50:53'),
	(172, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 14:59:09'),
	(173, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 15:10:07'),
	(174, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-06-05 15:19:40'),
	(175, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 15:21:01'),
	(176, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '7', 'http://vmephilmedica.com/vme/index.php/item/index/', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-06-05 15:23:54'),
	(177, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '8', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-06-05 15:26:01'),
	(178, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '28', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'KIRK VERNON\', `m', '2015-06-05 15:32:44'),
	(179, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-06-05 15:39:02'),
	(180, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 15:40:15'),
	(181, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 15:41:37'),
	(182, '121.97.142.151', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 15:43:05'),
	(183, '121.97.142.151', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 15:43:19'),
	(184, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'add_batch', 'success', '9', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-06-05 15:44:41'),
	(185, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-06-05 15:45:21'),
	(186, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '47', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 15:46:52'),
	(187, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '48', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 15:48:05'),
	(188, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '49', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 15:50:06'),
	(189, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '50', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 15:53:54'),
	(190, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '51', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 16:15:56'),
	(191, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '52', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 16:18:45'),
	(192, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '53', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 16:26:16'),
	(193, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '54', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 16:27:52'),
	(194, '121.97.142.151', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-05 17:55:00'),
	(195, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '55', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 17:57:41'),
	(196, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '56', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 18:00:39'),
	(197, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '57', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 18:02:29'),
	(198, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '58', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 18:05:20'),
	(199, '110.55.3.222', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'admin@ema', '2015-06-07 09:05:19'),
	(200, '110.55.3.222', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-07 09:05:34'),
	(201, '110.55.3.222', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-07 11:51:04'),
	(202, '110.55.3.222', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-07 16:42:27'),
	(203, '112.198.77.228', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-07 20:47:52'),
	(204, '180.191.142.85', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-09 00:17:42'),
	(205, '112.209.155.155', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-09 13:44:29'),
	(206, '112.209.155.155', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-10 15:51:30'),
	(207, '112.209.212.209', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-16 08:06:04'),
	(208, '180.191.143.120', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-19 10:21:28'),
	(209, '110.55.3.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-19 10:40:16'),
	(210, '180.191.143.120', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-19 10:43:21'),
	(211, '180.191.142.246', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-19 23:41:54'),
	(212, '103.14.63.166', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-20 11:55:06'),
	(213, '103.14.63.166', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-21 17:54:42'),
	(214, '103.14.63.166', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-21 20:21:34'),
	(215, '119.95.239.144', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-06-25 19:01:45'),
	(216, '112.209.172.247', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-01 12:18:41'),
	(217, '112.209.172.247', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-01 15:54:45'),
	(218, '112.209.172.247', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'ADMIN@EMa', '2015-07-07 15:50:18'),
	(219, '112.209.172.247', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-07 15:50:32'),
	(220, '112.209.172.247', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-10 16:22:27'),
	(221, '112.209.172.247', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-13 16:10:45'),
	(222, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-21 11:47:49'),
	(223, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '59', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 11:58:05'),
	(224, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '60', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 12:06:12'),
	(225, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '61', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:09:08'),
	(226, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'ADMIN@EMA', '2015-07-21 13:09:50'),
	(227, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-21 13:10:02'),
	(228, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '62', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:14:21'),
	(229, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '63', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:16:50'),
	(230, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '64', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:22:59'),
	(231, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '65', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:25:40'),
	(232, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '66', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:29:07'),
	(233, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '67', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:32:52'),
	(234, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-21 13:36:29'),
	(235, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '68', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:39:54'),
	(236, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '69', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:44:13'),
	(237, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '70', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:45:47'),
	(238, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '71', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:46:54'),
	(239, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '71', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'MARIE\', `middle_', '2015-07-21 13:47:07'),
	(240, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '65', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'IRMA\', `middle_n', '2015-07-21 13:47:51'),
	(241, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '66', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'JUN\', `middle_na', '2015-07-21 13:48:25'),
	(242, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '68', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'KAREN\', `middle_', '2015-07-21 13:49:05'),
	(243, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '72', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:51:23'),
	(244, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '73', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:58:00'),
	(245, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '74', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 13:59:56'),
	(246, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '75', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:02:30'),
	(247, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '76', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:04:01'),
	(248, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '77', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:06:05'),
	(249, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '78', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:09:44'),
	(250, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '79', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:14:08'),
	(251, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '80', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:18:35'),
	(252, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '81', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:23:02'),
	(253, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '82', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:24:59'),
	(254, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '83', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:27:19'),
	(255, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '84', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:31:28'),
	(256, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '85', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:34:02'),
	(257, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '85', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DR. EDMUNDO\', `m', '2015-07-21 14:36:24'),
	(258, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '86', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:37:37'),
	(259, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '87', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:38:39'),
	(260, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '88', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:40:29'),
	(261, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '89', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:42:11'),
	(262, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '88', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DR. LYNMAN\', `mi', '2015-07-21 14:43:51'),
	(263, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '90', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:48:37'),
	(264, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '91', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:50:06'),
	(265, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '92', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:51:36'),
	(266, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '93', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:53:49'),
	(267, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '94', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 14:58:55'),
	(268, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '95', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:00:44'),
	(269, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '96', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:05:56'),
	(270, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '97', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:07:03'),
	(271, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '98', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:21:00'),
	(272, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '99', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:22:36'),
	(273, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '100', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:24:16'),
	(274, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '100', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = \'DRA. VIVIAN\', `m', '2015-07-21 15:28:16'),
	(275, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '101', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:31:24'),
	(276, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '102', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:34:23'),
	(277, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '103', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:36:49'),
	(278, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '104', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:38:44'),
	(279, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '105', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:41:08'),
	(280, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '106', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:44:14'),
	(281, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '107', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:45:23'),
	(282, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '108', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-07-21 15:46:53'),
	(283, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '28', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  \'28\'', '2015-07-21 15:49:00'),
	(284, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '28', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  \'28\'', '2015-07-21 15:49:04'),
	(285, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '26', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  \'26\'', '2015-07-21 15:51:22'),
	(286, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '27', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  \'27\'', '2015-07-21 15:51:34'),
	(287, '112.209.234.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '25', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'MARY ANN\', `midd', '2015-07-21 16:16:54'),
	(288, '122.3.254.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) Ap', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-21 17:51:44'),
	(289, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-27 08:39:52'),
	(290, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-27 13:12:08'),
	(291, '103.14.63.210', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-27 16:07:03'),
	(292, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-28 08:28:35'),
	(293, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-28 17:08:34'),
	(294, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-29 10:16:22'),
	(295, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '27', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'CHERRYL ANNE\', `', '2015-07-29 11:23:43'),
	(296, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'MILLISCENT\', `mi', '2015-07-29 11:24:56'),
	(297, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-07-29 13:42:23'),
	(298, '112.209.222.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-03 16:40:31'),
	(299, '125.212.123.71', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-06 18:09:23'),
	(300, '119.95.177.73', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-07 12:28:07'),
	(301, '119.95.177.73', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-07 18:49:36'),
	(302, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-25 08:36:16'),
	(303, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'delete_user', 'success', NULL, 'http://vmephilmedica.com/vme/index.php/user/employ', 'DELETE FROM `user`\nWHERE `user_id` =  \'28\' LIMIT 1', '2015-08-25 08:40:45'),
	(304, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '109', 'http://vmephilmedica.com/vme/index.php/user/employ', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-08-25 08:42:23'),
	(305, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '110', 'http://vmephilmedica.com/vme/index.php/user/employ', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-08-25 08:42:23'),
	(306, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '111', 'http://vmephilmedica.com/vme/index.php/user/employ', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-08-25 08:43:27'),
	(307, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'delete_user', 'success', NULL, 'http://vmephilmedica.com/vme/index.php/user/employ', 'DELETE FROM `user`\nWHERE `user_id` =  \'110\' LIMIT ', '2015-08-25 08:43:47'),
	(308, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '111', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'JANE\', `middle_n', '2015-08-25 08:44:05'),
	(309, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '25', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'JEROME\', `middle', '2015-08-25 08:45:32'),
	(310, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '109', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'KRISTIAN PAUL\', ', '2015-08-25 08:45:46'),
	(311, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '29', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'DONDEE\', `middle', '2015-08-25 08:47:48'),
	(312, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '27', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = \'CHERRYL ANNE\', `', '2015-08-25 08:49:10'),
	(313, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-25 16:28:15'),
	(314, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-26 08:35:28'),
	(315, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-26 13:33:45'),
	(316, '112.198.77.53', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  \'admin@ema', '2015-08-27 21:18:56'),
	(317, '112.198.77.53', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-08-27 21:19:14'),
	(318, '112.198.83.118', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-08-27 22:08:18'),
	(319, '112.209.255.239', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-03 09:18:06'),
	(320, '121.97.142.4', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-08 06:58:16'),
	(321, '180.191.138.246', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-10 13:38:31'),
	(322, '180.191.143.213', 'Mozilla/5.0 (iPad; CPU OS 8_4 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-14 12:17:33'),
	(323, '180.191.143.213', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-14 12:43:27'),
	(324, '180.191.143.213', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-14 16:04:24'),
	(325, '180.191.143.213', 'Mozilla/5.0 (iPad; CPU OS 8_4 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-14 16:05:26'),
	(326, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-09-21 09:28:30'),
	(327, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '109', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'KRISTIAN PAUL\', ', '2015-09-21 09:36:39'),
	(328, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '111', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'JANE\', `middle_n', '2015-09-21 09:36:50'),
	(329, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '15', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'accountant\', `mi', '2015-09-21 09:37:06'),
	(330, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '14', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'warehouseman\', `', '2015-09-21 09:37:17'),
	(331, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '20', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'hrname\', `middle', '2015-09-21 09:37:27'),
	(332, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '24', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'DEXTER\', `middle', '2015-09-21 09:37:43'),
	(333, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '26', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'MILLISCENT\', `mi', '2015-09-21 09:38:05'),
	(334, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '14', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'warehouseman\', `', '2015-09-21 09:38:24'),
	(335, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '20', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'hrname\', `middle', '2015-09-21 09:38:36'),
	(336, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '15', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'accountant\', `mi', '2015-09-21 09:38:48'),
	(337, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '27', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'CHERRYL ANNE\', `', '2015-09-21 09:38:58'),
	(338, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '25', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'JEROME\', `middle', '2015-09-21 09:39:11'),
	(339, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'edit_user', 'success', '26', 'http://localhost/vmv2/index.php/user/employee/upda', 'UPDATE `user` SET `first_name` = \'MILLISCENT\', `mi', '2015-09-21 09:39:52'),
	(340, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-12-09 15:30:35');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.msr_client
DROP TABLE IF EXISTS `msr_client`;
CREATE TABLE IF NOT EXISTS `msr_client` (
  `msr_client_id` int(10) NOT NULL AUTO_INCREMENT,
  `msr_client_custom_id` varchar(50) DEFAULT NULL,
  `msr_id` int(10) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`msr_client_id`),
  KEY `FK__2` (`client_id`),
  KEY `FK__1` (`msr_id`),
  CONSTRAINT `FK__1` FOREIGN KEY (`msr_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__2` FOREIGN KEY (`client_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.msr_client: ~19 rows (approximately)
/*!40000 ALTER TABLE `msr_client` DISABLE KEYS */;
INSERT INTO `msr_client` (`msr_client_id`, `msr_client_custom_id`, `msr_id`, `client_id`) VALUES
	(1, NULL, 25, 30),
	(2, NULL, 29, 31),
	(7, NULL, 24, 30),
	(8, NULL, 24, 31),
	(9, NULL, 24, 32),
	(10, NULL, 24, 33),
	(11, NULL, 24, 34),
	(12, NULL, 24, 35),
	(13, NULL, 24, 36),
	(14, NULL, 24, 37),
	(15, NULL, 24, 38),
	(16, NULL, 24, 39),
	(17, NULL, 24, 40),
	(18, NULL, 24, 41),
	(19, NULL, 24, 42),
	(20, NULL, 24, 43),
	(21, NULL, 24, 44),
	(22, NULL, 24, 45),
	(23, NULL, 24, 46);
/*!40000 ALTER TABLE `msr_client` ENABLE KEYS */;


-- Dumping structure for view jabee123_vme.msr_view
DROP VIEW IF EXISTS `msr_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `msr_view` 
) ENGINE=MyISAM;


-- Dumping structure for table jabee123_vme.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `sales_type` varchar(50) NOT NULL DEFAULT '0',
  `msr_client_id` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` int(10) DEFAULT NULL,
  `discount_type` enum('percentage','php') DEFAULT 'percentage',
  `form_number` varchar(50) NOT NULL COMMENT 'so number',
  `transaction_type` varchar(50) NOT NULL DEFAULT 'DR',
  `si_no` varchar(50) NOT NULL COMMENT 'dr or si no',
  `dr_date` varchar(50) NOT NULL,
  `payment_type` varchar(50) DEFAULT '30_days',
  `return_id` tinyint(10) DEFAULT '0',
  `cancel_date` date DEFAULT NULL,
  `approved_pre` int(10) DEFAULT '0',
  `approved_post` int(10) DEFAULT '0',
  `client_name` varchar(50) DEFAULT '0',
  `client_address` varchar(50) DEFAULT '0',
  `product_id` varchar(50) DEFAULT '0',
  `generic_name` varchar(50) DEFAULT '0',
  `product_batch` varchar(50) DEFAULT '0',
  `quantity` varchar(50) DEFAULT '0',
  `price` varchar(50) DEFAULT '0',
  `expire_date` varchar(50) DEFAULT '0',
  `discount_amount` varchar(50) DEFAULT '0',
  `subtotal` varchar(50) DEFAULT '0',
  `vat_sales` varchar(50) DEFAULT '0',
  `vat_12` varchar(50) DEFAULT NULL,
  `total_amount` varchar(50) DEFAULT '0',
  `free_goods` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_order_msr_client` (`msr_client_id`),
  CONSTRAINT `FK_order_msr_client` FOREIGN KEY (`msr_client_id`) REFERENCES `msr_client` (`msr_client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.orders: ~8 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `sales_type`, `msr_client_id`, `order_date`, `discount`, `discount_type`, `form_number`, `transaction_type`, `si_no`, `dr_date`, `payment_type`, `return_id`, `cancel_date`, `approved_pre`, `approved_post`, `client_name`, `client_address`, `product_id`, `generic_name`, `product_batch`, `quantity`, `price`, `expire_date`, `discount_amount`, `subtotal`, `vat_sales`, `vat_12`, `total_amount`, `free_goods`) VALUES
	(1, '1', 1, '2015-01-31 17:16:53', 0, 'percentage', 'so-00001', 'DR', '', '', '30_days', 1, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '1000', '4', '0', '0', '4000', '3520', '480', '4000', 0),
	(2, '2', 2, '2015-01-31 17:59:23', 10, 'percentage', 'so-0002', 'DR', '', '', '30_days', 0, NULL, 1, 1, 'north fairview general hospital', 'north fairview quezon city', '2', 'antisakit ulosis', '2', '1000', '3', '0', '0', '3000', '2640', '360', '2700', 0),
	(3, '1', 1, '2015-03-11 01:21:01', 10, '', 'so001', 'DR', 'sdsd011', '10201020', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '100', '4', '2020-01-22', '10', '400', '352', '48', '390', 0),
	(4, '1', 1, '2015-03-27 14:09:59', 0, 'percentage', '456', 'DR', '456', '03/27/2015', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '6', 'CEFTRIAXONE SODIUM', '6', '40', '480', '2017-06-30', '0', '19200', '16896', '2304', '19200', 0),
	(5, '1', 1, '2015-04-16 16:35:30', 0, 'percentage', '12345', 'DR', '25606', '04/01/2015', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '50', '4', '2020-01-22', '0', '200', '176', '24', '200', 0),
	(6, '1', 2, '2015-04-16 16:38:06', 30, '', '12346', 'DR', '25404', '04/02/2015', '30_days', 0, NULL, 1, 1, 'north fairview general hospital', 'north fairview quezon city', '6', 'CEFTRIAXONE SODIUM', '6', '100', '693', '2017-06-30', '30', '69300', '60984', '8316', '69270', 0),
	(7, '1', 13, '2015-06-07 21:10:10', 0, 'percentage', '12345', 'DR', '4286', '06/04/2015', '30_days', 0, NULL, 1, 1, 'CASTRO MATERNITY HOSP. & MED. CENTER INC.', 'M. Ponce St., Tibag, Baliuag, Bulacan', '6', 'CEFTRIAXONE SODIUM', '6', '10', '693', '2017-06-30', '0', '6930', '6098.4', '831.6', '6930', 0),
	(9, '1', 8, '2015-09-21 11:49:11', 0, 'percentage', 'sada2', 'DR', '1w3', '09/21/2015', '30_days', 0, NULL, 1, 1, '0', '0', '1', 'paracetamol', '4', '100', '4', '2020-01-22', '0', '400', '357.14', '42.86', '400', 1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.order_item
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `order_item_id` int(250) NOT NULL AUTO_INCREMENT,
  `batch_id` int(250) NOT NULL,
  `order_id` int(250) NOT NULL,
  `quantity` int(250) NOT NULL DEFAULT '0',
  `custom_price` int(10) DEFAULT NULL,
  `add_type` enum('paid','free') NOT NULL DEFAULT 'paid',
  PRIMARY KEY (`order_item_id`),
  KEY `FK_order_item_batch` (`batch_id`),
  KEY `FK_order_item_order` (`order_id`),
  CONSTRAINT `FK_order_item_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.order_item: ~8 rows (approximately)
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` (`order_item_id`, `batch_id`, `order_id`, `quantity`, `custom_price`, `add_type`) VALUES
	(1, 4, 1, 1000, 4, 'paid'),
	(2, 2, 2, 1000, 3, 'free'),
	(3, 4, 3, 100, 4, 'paid'),
	(4, 6, 4, 40, 480, 'paid'),
	(5, 4, 5, 50, 4, 'paid'),
	(6, 6, 6, 100, 693, 'paid'),
	(7, 6, 7, 10, 693, 'paid'),
	(8, 4, 9, 100, 4, 'paid');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.order_return
DROP TABLE IF EXISTS `order_return`;
CREATE TABLE IF NOT EXISTS `order_return` (
  `return_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(10) NOT NULL,
  `item_id` int(255) DEFAULT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `reason` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '0',
  `msr_id` int(11) DEFAULT NULL,
  `credit_memo` varchar(50) DEFAULT NULL,
  `replacement` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`return_id`),
  KEY `FK_order_return_order_item` (`order_item_id`),
  CONSTRAINT `FK_order_return_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.order_return: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_return` DISABLE KEYS */;
INSERT INTO `order_return` (`return_id`, `order_item_id`, `item_id`, `quantity`, `reason`, `datetime`, `status`, `msr_id`, `credit_memo`, `replacement`, `remarks`) VALUES
	(1, 1, NULL, 1000, 'near expiry', '2015-01-31 17:51:06', 0, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_return` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.payment
DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(10) NOT NULL DEFAULT '0',
  `payment_type` enum('cash','cheque') NOT NULL DEFAULT 'cheque',
  `bank` varchar(50) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `check_full_amount` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_collected` date NOT NULL DEFAULT '0000-00-00',
  `date_of_cheque` varchar(50) NOT NULL DEFAULT '0000-00-00',
  `status` enum('Full','Partial','Unpaid') NOT NULL DEFAULT 'Unpaid' COMMENT '0-not collected yet; 1 - collected; 2 - not paid',
  `msr_client_id` int(50) DEFAULT NULL,
  `pr_or_number` int(50) DEFAULT NULL,
  `date_of_pr_or` varchar(50) DEFAULT NULL,
  `dr_applied` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.payment: ~4 rows (approximately)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`payment_id`, `amount`, `payment_type`, `bank`, `check_number`, `check_full_amount`, `datetime`, `datetime_collected`, `date_of_cheque`, `status`, `msr_client_id`, `pr_or_number`, `date_of_pr_or`, `dr_applied`) VALUES
	(4, 2000, 'cheque', 'BDO', '00014264689', '', '2015-08-07 18:58:41', '0000-00-00', '08/13/2015', 'Unpaid', 1, 56789, '08/05/2015', '12345'),
	(5, 10000, 'cash', '', '', '', '2015-08-26 09:02:16', '0000-00-00', '', 'Unpaid', 1, 98256, '08/27/2015', 'so-00001'),
	(6, 4500, 'cash', '', '', '', '2015-08-27 21:21:18', '0000-00-00', '', 'Unpaid', 1, 24690, '08/14/2015', NULL),
	(7, 1000, 'cash', '', '', '', '2015-09-21 12:49:30', '0000-00-00', '', 'Unpaid', NULL, 323232, '09/21/2015', 'sada2');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.payment_item
DROP TABLE IF EXISTS `payment_item`;
CREATE TABLE IF NOT EXISTS `payment_item` (
  `payment_item_id` int(250) NOT NULL AUTO_INCREMENT,
  `payment_id` int(250) NOT NULL,
  `order_item_id` int(250) NOT NULL,
  `amount` int(250) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_item_id`),
  KEY `FK_payment_item_payment` (`payment_id`),
  KEY `FK_payment_item_order_item` (`order_item_id`),
  CONSTRAINT `FK_payment_item_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`),
  CONSTRAINT `FK_payment_item_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.payment_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `payment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_item` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.payment_orders
DROP TABLE IF EXISTS `payment_orders`;
CREATE TABLE IF NOT EXISTS `payment_orders` (
  `payment_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_order_id`),
  KEY `FK_payment_orders_payment` (`paymentid`),
  KEY `FK_payment_orders_orders` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.payment_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `payment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_orders` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.permission
DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `action_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `FK__role` (`role_id`),
  KEY `FK__action` (`action_id`),
  CONSTRAINT `FK__action` FOREIGN KEY (`action_id`) REFERENCES `action` (`action_id`),
  CONSTRAINT `FK__role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.permission: ~109 rows (approximately)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`permission_id`, `role_id`, `action_id`) VALUES
	(1, 1, 3),
	(2, 1, 4),
	(3, 1, 1),
	(4, 1, 8),
	(5, 1, 5),
	(6, 1, 6),
	(7, 2, 3),
	(8, 2, 4),
	(9, 2, 1),
	(10, 2, 5),
	(11, 3, 1),
	(12, 3, 2),
	(13, 3, 5),
	(16, 4, 1),
	(18, 5, 1),
	(19, 6, 1),
	(20, 1, 7),
	(21, 1, 9),
	(22, 1, 10),
	(23, 1, 2),
	(24, 1, 11),
	(25, 1, 12),
	(26, 1, 13),
	(27, 1, 18),
	(28, 2, 18),
	(29, 3, 18),
	(30, 4, 18),
	(31, 5, 18),
	(32, 6, 18),
	(33, 1, 19),
	(34, 1, 20),
	(35, 3, 11),
	(36, 3, 12),
	(37, 3, 13),
	(39, 2, 15),
	(40, 2, 19),
	(42, 1, 15),
	(43, 1, 14),
	(44, 2, 14),
	(45, 1, 21),
	(46, 2, 21),
	(47, 1, 16),
	(48, 1, 22),
	(52, 1, 17),
	(53, 2, 22),
	(57, 4, 3),
	(58, 4, 4),
	(59, 4, 16),
	(60, 4, 6),
	(63, 1, 27),
	(64, 2, 27),
	(66, 2, 28),
	(67, 1, 29),
	(68, 2, 29),
	(73, 1, 32),
	(75, 1, 34),
	(76, 2, 34),
	(77, 1, 35),
	(78, 1, 36),
	(79, 1, 39),
	(80, 1, 37),
	(81, 1, 38),
	(82, 2, 39),
	(83, 2, 38),
	(84, 4, 39),
	(85, 4, 38),
	(86, 1, 40),
	(87, 1, 41),
	(88, 1, 42),
	(89, 2, 42),
	(90, 1, 43),
	(91, 1, 44),
	(92, 1, 45),
	(93, 1, 46),
	(94, 1, 47),
	(95, 2, 47),
	(96, 3, 47),
	(97, 1, 48),
	(98, 2, 48),
	(99, 1, 49),
	(100, 2, 49),
	(101, 1, 50),
	(102, 2, 50),
	(103, 1, 51),
	(104, 2, 51),
	(105, 1, 52),
	(106, 2, 52),
	(107, 1, 53),
	(108, 2, 53),
	(109, 1, 54),
	(110, 1, 55),
	(111, 1, 30),
	(112, 2, 30),
	(113, 1, 56),
	(114, 3, 56),
	(115, 1, 57),
	(116, 2, 57),
	(117, 1, 58),
	(118, 1, 28),
	(119, 1, 59),
	(120, 1, 60),
	(121, 3, 59),
	(122, 1, 61),
	(123, 2, 58),
	(124, 2, 61),
	(125, 1, 62),
	(126, 2, 62),
	(127, 1, 63),
	(128, 2, 63),
	(129, 1, 64),
	(130, 2, 64);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.report_type
DROP TABLE IF EXISTS `report_type`;
CREATE TABLE IF NOT EXISTS `report_type` (
  `report_type_id` int(250) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`report_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.report_type: ~8 rows (approximately)
/*!40000 ALTER TABLE `report_type` DISABLE KEYS */;
INSERT INTO `report_type` (`report_type_id`, `name`) VALUES
	(1, 'Inventory Report'),
	(2, 'Items Report'),
	(3, 'Supplier List'),
	(4, 'Item List'),
	(5, 'Inventory Items'),
	(6, 'Order Report'),
	(7, 'Collection Updates'),
	(8, 'sales update');
/*!40000 ALTER TABLE `report_type` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.report_user
DROP TABLE IF EXISTS `report_user`;
CREATE TABLE IF NOT EXISTS `report_user` (
  `report_role_id` int(250) NOT NULL AUTO_INCREMENT,
  `role_id` int(250) DEFAULT '0',
  `report_type_id` int(250) DEFAULT '0',
  PRIMARY KEY (`report_role_id`),
  KEY `FK_report_user_role` (`role_id`),
  KEY `FK_report_user_report_type` (`report_type_id`),
  CONSTRAINT `FK_report_user_report_type` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`report_type_id`),
  CONSTRAINT `FK_report_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.report_user: ~16 rows (approximately)
/*!40000 ALTER TABLE `report_user` DISABLE KEYS */;
INSERT INTO `report_user` (`report_role_id`, `role_id`, `report_type_id`) VALUES
	(1, 1, 1),
	(2, 3, 1),
	(3, 1, 2),
	(4, 3, 2),
	(5, 1, 3),
	(6, 3, 3),
	(7, 1, 4),
	(8, 3, 4),
	(9, 1, 5),
	(10, 3, 5),
	(11, 2, 6),
	(12, 1, 6),
	(13, 2, 7),
	(14, 1, 7),
	(15, 2, 8),
	(16, 1, 8);
/*!40000 ALTER TABLE `report_user` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.rgs
DROP TABLE IF EXISTS `rgs`;
CREATE TABLE IF NOT EXISTS `rgs` (
  `rgs_id` int(11) DEFAULT NULL,
  `dr_si_num` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jabee123_vme.rgs: 0 rows
/*!40000 ALTER TABLE `rgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `rgs` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.role: ~8 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `name`) VALUES
	(1, 'admin'),
	(2, 'accountant'),
	(3, 'warehouseman'),
	(4, 'human resource'),
	(5, 'client'),
	(6, 'medical representative'),
	(7, 'supervisor'),
	(8, 'VACANT');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.setting
DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `readable_name` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `default_value` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT 'default',
  `order` varchar(50) DEFAULT NULL,
  `type` enum('radio','text','select','hidden','checkbox') DEFAULT NULL,
  `options` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.setting: ~10 rows (approximately)
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` (`setting_id`, `name`, `readable_name`, `value`, `default_value`, `group`, `order`, `type`, `options`) VALUES
	(1, 'site_name', 'website name', 'sample site', NULL, 'default', NULL, 'text', NULL),
	(2, 'theme_path', 'theme', 'default', 'default', 'default', NULL, NULL, NULL),
	(3, 'site_header', 'Site Title', '.:: Vintelmed Enterprise::.', NULL, NULL, NULL, 'text', NULL),
	(4, 'footer_copyright', 'Footer Text', '&copy; All rights Reserved 2014', NULL, NULL, NULL, NULL, NULL),
	(5, 'site_title', 'Site Title', '.::VintelMed::.', NULL, 'default', NULL, NULL, NULL),
	(6, 'site_open_time', 'open_time', '6:00', '6:00', NULL, NULL, 'text', NULL),
	(7, 'site_close_time', 'close_time', '11:59 PM', '11:59 PM', NULL, NULL, 'text', NULL),
	(8, 'site_open_day', 'Operation days', 'mon,tue,wed,thu,fri,sat,sun', NULL, NULL, NULL, 'select', 'mon,tue,wed,thu,fri,sat,sun'),
	(9, 'critical_limit', 'Critical limit (%)', '50', '50', NULL, NULL, 'text', NULL),
	(10, 'critical_expire', 'Near Expire', '36', '6', 'default', NULL, 'text', NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.supplier
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.supplier: ~40 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplier_id`, `name`, `status`, `datetime`) VALUES
	(1, 'gobris trading company and corp', 'enabled', '2015-01-31 16:48:47'),
	(2, 'mundalas gamotry', 'enabled', '2015-01-31 16:49:02'),
	(3, 'all gamots seller', 'enabled', '2015-01-31 16:49:20'),
	(4, 'gamot buy and seller', 'enabled', '2015-01-31 16:49:34'),
	(5, 'Suhitas Pharmaceuticals Incorporated', 'enabled', '2015-03-27 13:38:57'),
	(6, 'Planetarium Enterprise Inc.', 'enabled', '2015-03-27 13:44:18'),
	(7, 'Beracah Pharma Philippines Inc.', 'enabled', '2015-03-27 13:44:58'),
	(8, 'Jollymed Enterprise', 'enabled', '2015-03-27 13:45:19'),
	(9, 'Pharma Joy Drug Trading Inc.', 'enabled', '2015-03-27 13:45:44'),
	(10, 'Kairos Dynamedics Phils., Inc.', 'enabled', '2015-03-27 13:46:13'),
	(11, 'Zuneca Incorporated', 'enabled', '2015-03-27 13:46:21'),
	(12, 'Greencore Pharma Incorporated', 'enabled', '2015-03-27 13:46:44'),
	(13, 'Triple Tact Import & Export Corporation', 'enabled', '2015-03-27 13:47:20'),
	(14, 'Ferj\'s Pharmacy', 'enabled', '2015-03-27 13:47:30'),
	(15, 'Better Option Pharmaceuticals Inc.', 'enabled', '2015-03-27 13:48:21'),
	(16, 'D & G Pharma', 'enabled', '2015-03-27 13:49:45'),
	(17, 'Qualitymed Pharma Corporation', 'enabled', '2015-03-27 13:50:09'),
	(18, 'Marzan Pharma Corporation', 'enabled', '2015-03-27 13:50:23'),
	(19, 'Vhermann Pharmaceuticals Inc.', 'enabled', '2015-03-27 13:50:49'),
	(20, 'Endure Medical Inc.', 'enabled', '2015-03-27 13:50:59'),
	(21, 'Ellebasy Medicale Trading', 'enabled', '2015-03-27 13:51:58'),
	(22, 'Two World traders', 'enabled', '2015-03-27 13:52:17'),
	(23, 'Ambica International Trading Corporation', 'enabled', '2015-03-27 13:52:43'),
	(24, 'Sheryl Marketing', 'enabled', '2015-03-27 13:53:14'),
	(25, 'Savermed Marketing Corporation', 'enabled', '2015-03-27 13:53:40'),
	(26, 'New Myrex Laboratories Incorporated', 'enabled', '2015-03-27 13:54:23'),
	(27, 'Checktrade Trading', 'enabled', '2015-03-27 13:54:38'),
	(28, 'SKPD Jen Inc.', 'enabled', '2015-03-27 13:54:58'),
	(29, 'Eurohealthcare Exponents Inc./ Foramen Products Corporation', 'enabled', '2015-03-27 13:59:52'),
	(30, 'Vitalife Pharma & Medical Supply Inc.', 'enabled', '2015-03-27 13:56:24'),
	(31, 'Al-Ry Pharma Distribution', 'enabled', '2015-03-27 13:56:47'),
	(32, 'St. Martin Pharmaceutical Lab., Inc.', 'enabled', '2015-03-27 13:57:22'),
	(33, 'Nutripharm', 'enabled', '2015-03-27 13:57:43'),
	(34, 'Interlink Pharma Marketing Corporation', 'enabled', '2015-03-27 13:58:10'),
	(35, 'Genpharma Inc.', 'enabled', '2015-03-27 13:58:31'),
	(36, 'Medethix Inc.', 'enabled', '2015-03-27 13:58:57'),
	(37, 'Growrich', 'enabled', '2015-03-27 14:00:16'),
	(38, 'Sel-J Pharma Corp.', 'enabled', '2015-03-27 14:01:23'),
	(39, 'Steinbach', 'enabled', '2015-03-27 14:01:56'),
	(40, 'Ryan Batugal', 'enabled', '2015-03-27 14:02:20');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;


-- Dumping structure for table jabee123_vme.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `quota` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL DEFAULT '2',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `civil_status` enum('single','married') NOT NULL DEFAULT 'single',
  `note` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`role_id`),
  KEY `FK_user_district` (`district_id`),
  KEY `FK_user_area` (`area_id`),
  CONSTRAINT `FK_user_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_user_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

-- Dumping data for table jabee123_vme.user: ~7 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `password`, `email`, `address`, `contact_person`, `contact_number`, `area_id`, `quota`, `role_id`, `district_id`, `status`, `civil_status`, `note`) VALUES
	(1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com', 'dsadasd', NULL, NULL, 1, 100000, 1, 1, 'active', 'single', NULL),
	(14, 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman@email.com', 'fdggdfgdf', NULL, NULL, 1, 0, 3, 2, 'active', 'single', NULL),
	(15, 'accountant', 'accountant', 'accountant', 'accountant', 'accountant@email.com', 'cxvxvxcvx', NULL, NULL, 1, 0, 2, 2, 'active', 'single', NULL),
	(20, 'hrname', 'hrmnmae', 'hrlname', 'hr', 'hr@email.com', 'uiyyuiuyi', NULL, NULL, 1, 0, 4, 2, 'active', 'single', NULL),
	(24, 'DEXTER', '', 'BALLESTER', 'dexter', 'magdalo_56@yahoo.com', NULL, NULL, NULL, 1, 800000, 6, 2, 'active', 'single', NULL),
	(25, 'JEROME', '', 'VALERIO', 'jeromevalerio', 'jeromevalerio@email.com', NULL, NULL, NULL, 1, 0, 6, 3, 'active', 'single', NULL),
	(26, 'MILLISCENT', 'BITANGCOL', 'DALUSONG', 'milly', 'milliscent.bitangcol@yahoo.com', NULL, NULL, NULL, 1, 550000, 6, 2, 'active', 'single', NULL),
	(27, 'CHERRYL ANNE', 'GAZA', 'ALBERTO', 'anne', 'annalberto04@gmail.com', NULL, NULL, NULL, 1, 550000, 6, 2, 'active', 'single', NULL),
	(29, 'DONDEE', '', 'EUSEBIO', 'dondeeeusebio', 'dondeeeeusebio@email.com', NULL, NULL, NULL, 1, 0, 6, 1, 'active', 'single', NULL),
	(30, 'VALERIANA', '', 'DE VERA', '', 'valeriana@yahoo.com', '#97 BF Aquino Ave., Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(31, 'MARY IMMACULATE & GENERAL HOSPITAL', '', '', '', 'maryimmgenhosp@yahoo.com', 'Malolos Bulacan (near Santos General Hospital)', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(32, 'DRA. LANI', '', 'MANIPULA', '', 'lanimanipula@yahoo.com', 'Cagayan Valley Rd., Tibag, Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(33, 'DRA. JAMAINE', '', 'NICOLAS', '', 'jamainenicolas@yahoo.com', 'BS Aquino Ave., Cangos, Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(34, 'DRA. MA. ELENA', '', 'SAYO', '', 'elenasayo@yahoo.com', 'Malolos, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(35, 'RUGAY MATERNITY & GENERAL HOSPITAL', '', '', '', 'rugayhospital@yahoo.com', 'Sabang Carpa, Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(36, 'CASTRO MATERNITY HOSP. & MED. CENTER INC.', '', '', '', 'castro@yahoo.com', 'M. Ponce St., Tibag, Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(37, 'SC MARCELO HOSPITAL', '', '', '', 'marcelo@yahoo.com', 'Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(38, 'STA. CRUZ HOSPITAL', '', '', '', 'stacruz@yahoo.com', 'Calumpit, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(39, 'ST. PAUL HOSPITAL', '', '', '', 'stpaulhospital@yahoo.com', 'Binang 2nd, Bocaue, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(40, 'DRA. DOLORES GO', '', 'MENDOZA', '', 'dra.go.mendoza@yahoo.com', 'Gil Carlos St., Baliuag, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(41, 'DRA. NERISSA', '', 'TAN', '', 'dranerisatan@yahoo.com', '1711 Paz Guevarra St., Carpa Vill, Sabang, Baliuag', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(42, 'NAZARENUS HOSPITAL', '', '', '', 'nazarenushospital@yahoo.com', 'Meycauayan, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(43, 'DR. JUAN GREGO', '', 'TORDESILLAS', '', 'jgtordesillas@yahoo.com', 'Meycauayan, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(44, 'MENDOZA GENERAL HOSPITAL', '', '', '', 'mendozagenhosp@yahoo.com', 'P. Santiago St., Poblacion, Sta. Maria, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(45, 'GALVEZ HOSPITAL', '', '', '', 'galvezhospital@yahoo.com', 'Maharlika Hi-way San Ildefonzo, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(46, 'SANTOS GENERAL HOSPITAL', '', '', '', 'santosgenhospital@yahoo.com', 'Malolos, Bulacan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(47, 'DIVINE MERCY HOSPITAL', '', '', '', 'divinemercyhosp@yahoo.com', 'McArthur Hi-way, Anupul, Bamban, Tarlac', 'Annalyn Vistan', NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(48, 'TALON GENERAL HOSPITAL', '', '', '', 'talongenhosp@yahoo.com', 'F. Tañedo St., Tarlac City', 'Irene Zabala', NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(49, 'DR. CHRISTIAN', '', 'SOLANO', '', 'chrissolano@yahoo.com', 'Gerona, Tarlac', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(50, 'RAMOS GENERAL HOSPITAL', '', '', '', 'ramosgenhosp@yahoo.com', 'Hilario St., Brgy. Ligtasan, Tarlac City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(51, 'DRA. JESSLIN', '', 'TAYAG', '', 'jesslintayag@yahoo.com', 'Back of Capas Public Market, Capas, Tarlac', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(52, 'DR. JESUCHITO', '', 'SANTOS', '', 'jesuchitosantos@yahoo.com', 'Immaculate Concepcion Polyclinic Hospital - Concep', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(53, 'DR. OLIVER', '', 'ATANACIO', '', 'oliveratanacio@yahoo.com', 'CLDH Hospital Drive, San Vicente, Tarlac City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(54, 'DR. JOSELITO', '', 'ESPINOSA', '', 'joselitoespinosa@yahoo.com', 'F. Tañedo St., Tarlac City - 3RD Flr.-TalonGenHosp', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(55, 'L.A. PASCUAL DRUGSTORE', '', '', '', 'lapascualds@yahoo.com', 'Moncada, Tarlac', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(56, 'LHEICARL PHARMACY', '', '', '', 'lheicarlpharmacy@yahoo.com', 'Tañedo St., Tarlac City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(57, 'DRA. SHEILA', '', 'CARANTO', '', 'sheilacaranto@yahoo.com', 'Paniqui, Tarlac', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(58, 'DR. EUTIQUIO', '', 'ATANACIO', '', 'eutiquioatanacio@yahoo.com', 'DEAMH, San Nicolas Poblacion, Concepcion, Tarlac', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(59, 'ALDION DRUGSTORE', '', '', '', 'aldionds@yahoo.com', '288 Gen. Luna St., Concepcion, Malabon City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(60, 'BOTIKA NG BARANGAY c/o Remy Suaco', '', '', '', 'botikangbrgy@yahoo.com', 'Lithanco Health Center - HBPN Lithanco St., Navotas City', 'Remy Suaco', NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(61, 'BERMUDEZ POLYMEDIC HOSPITAL', '', '', '', 'bermudezplymdc@yahoo.com', 'Malaria, Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(62, 'CATEQUISTA CLINIC', '', '', '', 'catequista@yahoo.com', 'B28 L24 Phase 1 Bagong Silang, Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(63, 'DITON PHARMACY', '', '', '', 'diton@yahoo.com', '405 Cor. Apahap St., NBBS, Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(64, 'HJS-GMMCC c/o Dra. Sonia Silonga', '', '', '', 'hjsgmmcc@yahoo.com', 'Blk 26 Lot 1 Phase 1-A Kapitbahayanan, Navotas City', 'Dra. Sonia Silonga', NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(65, 'IRMA', '', 'CAPATI', '', 'irmacapati@yahoo.com', 'Karuhatan, Valenzuela City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(66, 'JUN', '', 'GIONSON', '', 'jungionson@yahoo.com', 'Helic Navotas, Naval St., Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(67, 'JUVAN PHARMACY', '', '', '', 'juvanpharmacy@yahoo.com', '43 M.H Del Pilar, Tugatog, Malabon', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(68, 'KAREN', '', 'LOPEZ', '', 'karenlopez@yahoo.com', 'Marulas, Valenzuela City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(69, 'KL DRUGSTORE', '', '', '', 'kldrugstore@yahoo.com', '2010 Italiana Commercial Complex, Dalandanan, Valenzuela City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(70, 'MALABON POLYCLINIC I', '', '', '', 'malabonplyclnc@yahoo.com', '166 Gov. Pascual St., Tugatog, Malabon', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(71, 'MARIE', '', 'VILLARUIZ', '', 'marievillaruiz@yahoo.com', '10th Ave., Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(72, 'MARVAL PHARMACY', '', '', '', 'marvalpharmacy@yahoo.com', '419 A. Mabini Cor. Haduratan, Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(73, 'NEW MABINI DRUGSTORE', '', '', '', 'newmabinids@yahoo.com', '409 A. Mabini St., Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(74, 'NODADO GENERAL HOSPITAL', '', '', '', 'nodadogenhosp@yahoo.com', 'Area-A Camarin North Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(75, 'NORTH CALOOCAN DOCTOR\'S HOSPITAL', '', '', '', 'ncdh@yahoo.com', 'Bankers\'s Village II - Quirino Hi-way Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(76, 'PAGAMUTAN BAYAN NG MALABON', '', '', '', 'pagamutanngmalabon@yahoo.com', 'Dagat-dagatan Ave., Malabon Ciy', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(77, 'POLYCARE CLINIC c/o Dra. Lourdes Redulla', '', '', '', 'polycareclinic@yahoo.com', 'Dagat-dagatan Ave., Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(78, 'QUEEN FAITH MEDICAL CLINIC', '', '', '', 'queenfaith@yahoo.com', 'Gen. Luna St., Concepcion, Malabon', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(79, 'REMY', '', 'SUACO', '', 'remysuaco@yahoo.com', 'Lithanco Health Center - HBPN Lithanco St., Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(80, 'RITCHIE', '', 'OBLEPIAS', '', 'ritchieoblepias@yahoo.com', '373 Lapu-lapu St., NBPN, Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(81, 'ST. JUDE MEDICAL CLINIC', '', '', '', 'stjudemedclinic@yahoo.com', 'Dagat-dagatan Ave., Caloocan City', 'Maria Fe Cruz', '381-9534', 1, 0, 5, 2, 'active', 'single', NULL),
	(82, 'ST. VIANNCY DRUGSTORE', '', '', '', 'stvianncyds@yahoo.com', '400 Edsa Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(83, 'V. TONG MEDICAL CLINIC', '', '', '', 'vtongmedicalclinic@yahoo.com', '267 C. Arellano Cor. Borja St., Baritan Malabon', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(84, 'DR. RAMON MARTIN', '', 'ALLEJE', '', 'ramonmartinalleje@yahoo.com', 'Island Doctors Clinic - Felicidad St., Brgy. 1 Coron Palawan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(85, 'DR. EDMUNDO', '', 'ARALAR', '', 'edmundoaralar@yahoo.com', 'KMIA Medical & Dental Supplies, #219 Malvar St., PTO. Pricesa Palawan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(86, 'DR. ROMULO', '', 'ARANJUEZ', '', 'romuloaranjuez@yahoo.com', '612 Governor Pascual, San Roque, Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(87, 'DR. TITO', '', 'BABIERA', '', 'titobabiera@yahoo.com', 'Phase 4 Blk 78 Lot 2 Bagong Silang, North Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(88, 'DR. LYNMAN', '', 'BACOLOR', '', 'lynmanbacolor@yahoo.com', '14 Kingswood St., Brixtonville Subd., Camarin North Caloocan', 'Shermaine Madriaga', '09484667527', 1, 0, 5, 2, 'active', 'single', NULL),
	(89, 'DRA. GERLYN', '', 'BONDOC', '', 'gerlynbondoc@yahoo.com', 'Mc Arthur Hi-way Mountain Heighs Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(90, 'DRA. MARISOL', '', 'CRUZ', '', 'marisolcruz@yahoo.com', '270 Mc Arhur Hi-way, Karuhatan, Valenzuela City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(91, 'DRA. MA. THERESA', '', 'CRUZ', '', 'matheresacruz@yahoo.com', 'Km. 14 Mc Arthur Hi-way, Valenzuela City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(92, 'DRA. DIONETTE FRANCIS', '', 'DARIO', '', 'dionettefrancisdario@yahoo.com', '335 Alfonso Clinic, Malvar St., Puerto Princesa City Palawan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(93, 'DR. ERIC', '', 'DAVID', '', 'ericdavid@yahoo.com', 'Bangus St., North Bay Blvd. NBPN Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(94, 'DR. DANIEL', '', 'DE LEON', '', 'danieldeleon@yahoo.com', 'Moreno Subd. Poblacion, Brookes PTO Princesa Palawan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(95, 'ANALIZA', '', 'ESGUERRA', '', 'analizaesguerra@yahoo.com', '563 A. Mabini Sangandaan, Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(96, 'DR. VINCE', '', 'IGNACIO', '', 'vinceignacio@yahoo.com', '184 Gen. Luna Cor., Herrera St., Ibaba, Malabon City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(97, 'DR. ANTHONY', '', 'LINTAG', '', 'anthonylintag@yahoo.com', 'Medicare Hospital, Roxas, Palawan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(98, 'DR. POLY', '', 'MANJARES', '', 'polymanjares@yahoo.com', 'Novaliches, Quezon City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(99, 'DR. WILFREDO', '', 'MARQUEZ', '', 'wilfredomarquez@yahoo.com', 'Dagat-dagatan Ave., Malabon', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(100, 'DRA. VIVIAN', '', 'MATIAS (Good Place Pharmacy)', '', 'vivianmatias@yahoo.com', 'Phase 9 Brgy Bagong Silang Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(101, 'DRA. VIVIAN ', '', 'MATIAS (Matias Polyclinic)', '', 'vivianmatias@yahoo.com', 'Phase 9 Brgy Bagong Silang Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(102, 'DRA. IDA', '', 'MEDEL', '', 'idamedel@yahoo.com', 'Phase 4, Blk 34, Lot 27 Bagong Silang, North Caloocan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(103, 'DRA. JOCELYN', '', 'PARK', '', 'jocelynpark@yahoo.com', '2nd Flr Bonifacio Market Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(104, 'DRA. EVANGELINE', '', 'REGERO', '', 'evangelineregero@yahoo.com', 'Bagong Silang Phase 5 Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(105, 'DRA. ELENITA', '', 'SANTOS c/o Sir Joven Aloquin', '', 'elenitasantos@yahoo.com', 'Palawan Medical City Brgy. San Pedro, Puerto Princesa City Palawan', 'Joven Aloquin', NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(106, 'DRA. HERMINIA', '', 'STA. ANA', '', 'herminiastaana@yahoo.com', '66 Pilar Morning Breeze, Caloocan City', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(107, 'DR. PANFILO', '', 'SOLANO', '', 'panfilosolano@yahoo.com', '42 Fili St., Sangandaan, Caloocan', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(108, 'DRA. TERESA', '', 'TOREJA', '', 'teresatoreja@yahoo.com', 'P-01 Bangus St., North Bay Blvd. NBPN, Navotas', NULL, NULL, 1, 0, 5, 2, 'active', 'single', NULL),
	(109, 'KRISTIAN PAUL', '', 'ATIENZA', 'paulatienza', 'paulatienza@email.com', NULL, NULL, NULL, 1, 0, 6, 1, 'active', 'single', NULL),
	(111, 'JANE', '', 'MORILLO', 'janemorillo', 'janemorillo@email.com', NULL, NULL, NULL, 1, 0, 6, 1, 'active', 'single', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for view jabee123_vme.msr_view
DROP VIEW IF EXISTS `msr_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `msr_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`jabee123`@`localhost` VIEW `msr_view` AS select `user`.`user_id` AS `user_id`,`user`.`first_name` AS `first_name`,`user`.`middle_name` AS `middle_name`,`user`.`last_name` AS `last_name`,`user`.`password` AS `password`,`user`.`email` AS `email`,`user`.`area` AS `area`,`user`.`quota` AS `quota`,`user`.`role_id` AS `role_id`,`user`.`district_id` AS `district_id`,`user`.`status` AS `status`,`user`.`civil_status` AS `civil_status` from `user` where (`user`.`role_id` = 6) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
