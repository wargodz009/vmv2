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

-- Dumping database structure for vmv2
CREATE DATABASE IF NOT EXISTS `vmv2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vmv2`;


-- Dumping structure for table vmv2.action
CREATE TABLE IF NOT EXISTS `action` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `function` varchar(50) DEFAULT 'index',
  `show_on_menu` tinyint(4) DEFAULT '0' COMMENT '0-false;1-true;2-no to all',
  `parent` int(11) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.action: ~42 rows (approximately)
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
	(55, 'for_completion', 'sales', 'for_completion', 2, NULL, 0);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;


-- Dumping structure for table vmv2.batch
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.batch: ~4 rows (approximately)
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` (`batch_id`, `batch_readable_id`, `item_id`, `user_id`, `supplier_id`, `count`, `access_type`, `sold_count`, `expire_count`, `return_count`, `buy`, `sell`, `lot_number`, `on_cavite_warehouse`, `recieve_date`, `expire_date`, `status`) VALUES
	(1, 'b-a00001', 4, 1, 3, 10000, 'recieved', 0, 0, 0, 10000, 2, 'r1-c1', 'N', '2015-01-31', '2018-01-31', 'enabled'),
	(2, 'b-b00001', 2, 1, 4, 100000, 'recieved', 1000, 0, 0, 2, 3, 'r2-c2', 'N', '2015-01-31', '2019-01-30', 'enabled'),
	(3, 'b-c0001', 3, 1, 1, 10000, 'recieved', 0, 0, 0, 100, 120, 'r9-c1', 'N', '2015-01-31', '2018-01-31', 'enabled'),
	(4, 'b-n0001', 1, 1, 2, 1000000, 'recieved', 100, 0, 1000, 3, 4, 'r99-c11', 'N', '2015-01-31', '2020-01-22', 'enabled'),
	(5, 'b-w0001', 5, 1, 1, 100, 'recieved', 0, 0, 0, 10, 15, 'r7-c3', 'N', '2015-01-31', '2024-01-25', 'enabled');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;


-- Dumping structure for table vmv2.crud
CREATE TABLE IF NOT EXISTS `crud` (
  `crud_id` int(10) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`crud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.crud: ~0 rows (approximately)
/*!40000 ALTER TABLE `crud` DISABLE KEYS */;
/*!40000 ALTER TABLE `crud` ENABLE KEYS */;


-- Dumping structure for table vmv2.district
CREATE TABLE IF NOT EXISTS `district` (
  `district_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.district: ~3 rows (approximately)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`district_id`, `name`) VALUES
	(1, 'south'),
	(2, 'central'),
	(3, 'north');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


-- Dumping structure for table vmv2.item
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.item: ~4 rows (approximately)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`item_id`, `name`, `item_type_id`, `generic_name`, `description`, `status`, `datetime`) VALUES
	(1, 'neozep', 2, 'paracetamol', '50mg', 'enabled', '2015-01-31 02:50:16'),
	(2, 'biogesic', 2, 'antisakit ulosis', '50ml', 'enabled', '2015-01-31 02:50:47'),
	(3, 'ceelin', 1, 'antisipon gamotsis', '250ml', 'enabled', '2015-01-31 02:51:25'),
	(4, 'alaxan', 2, 'antisakit katwanasis', '25ml', 'enabled', '2015-01-31 02:52:02'),
	(5, 'whiskey wine', 3, 'alaksis lasingosis', '1liter', 'enabled', '2015-01-31 02:52:30');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table vmv2.item_type
CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.item_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` (`item_type_id`, `name`) VALUES
	(1, 'vial'),
	(2, 'oral'),
	(3, 'bottle'),
	(4, 'tablet'),
	(5, 'ampoule'),
	(6, 'suppository');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;


-- Dumping structure for table vmv2.logs
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.logs: ~37 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`log_id`, `ip_address`, `useragent`, `user_id`, `role_id`, `action`, `result`, `target`, `url`, `sql`, `datetime`) VALUES
	(1, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2015-01-31 02:41:12'),
	(2, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-01-31 02:41:16'),
	(3, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2015-01-31 02:41:18'),
	(4, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '14', 3, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'3\'', '2015-01-31 02:41:22'),
	(5, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-01-31 02:41:26'),
	(6, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '1', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'gobris tr', '2015-01-31 02:48:47'),
	(7, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '2', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'mundalas ', '2015-01-31 02:49:02'),
	(8, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '3', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'all gamot', '2015-01-31 02:49:20'),
	(9, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '4', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (\'gamot buy', '2015-01-31 02:49:34'),
	(10, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '1', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 02:50:16'),
	(11, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '2', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 02:50:47'),
	(12, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '3', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 02:51:25'),
	(13, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '4', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 02:52:02'),
	(14, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '5', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 02:52:30'),
	(15, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '24', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 02:54:11'),
	(16, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '25', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 02:54:44'),
	(17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '26', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 02:55:23'),
	(18, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '27', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 02:56:10'),
	(19, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '28', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 02:56:41'),
	(20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '29', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 02:57:09'),
	(21, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '30', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 03:00:18'),
	(22, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '31', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 03:01:54'),
	(23, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '32', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 03:03:33'),
	(24, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '33', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 03:04:23'),
	(25, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '34', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 03:07:52'),
	(26, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '35', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 03:09:05'),
	(27, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '25', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 03:09:30'),
	(28, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '29', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 03:09:37'),
	(29, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 03:09:45'),
	(30, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '27', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 03:09:50'),
	(31, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '26', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 03:10:01'),
	(32, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '28', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 03:10:06'),
	(33, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '1', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 03:12:08'),
	(34, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '2', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 03:13:02'),
	(35, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '3', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 03:13:44'),
	(36, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '4', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 03:14:24'),
	(37, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '5', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 03:15:09'),
	(38, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-10 09:50:07'),
	(39, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-10 11:50:03'),
	(40, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-10 12:21:33'),
	(41, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-10 12:21:47'),
	(42, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-10 12:22:39'),
	(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  \'1\'', '2015-03-11 10:05:10');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table vmv2.msr_client
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.msr_client: ~6 rows (approximately)
/*!40000 ALTER TABLE `msr_client` DISABLE KEYS */;
INSERT INTO `msr_client` (`msr_client_id`, `msr_client_custom_id`, `msr_id`, `client_id`) VALUES
	(1, NULL, 25, 30),
	(2, NULL, 29, 31),
	(3, NULL, 24, 32),
	(4, NULL, 27, 33),
	(5, NULL, 26, 34),
	(6, NULL, 28, 35);
/*!40000 ALTER TABLE `msr_client` ENABLE KEYS */;


-- Dumping structure for view vmv2.msr_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `msr_view` (
	`user_id` INT(10) NOT NULL,
	`first_name` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`middle_name` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`last_name` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`password` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`email` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`area` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`quota` INT(11) NOT NULL,
	`role_id` INT(11) NOT NULL,
	`district_id` INT(11) NOT NULL,
	`status` ENUM('active','inactive') NOT NULL COLLATE 'latin1_swedish_ci',
	`civil_status` ENUM('single','married') NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for table vmv2.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `sales_type` varchar(50) NOT NULL DEFAULT '0',
  `msr_client_id` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` int(10) DEFAULT NULL,
  `discount_type` enum('percentage','php') DEFAULT 'percentage',
  `form_number` varchar(50) NOT NULL COMMENT 'so number',
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
  `12_vat` varchar(50) DEFAULT '0',
  `total_amount` varchar(50) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `FK_order_msr_client` (`msr_client_id`),
  CONSTRAINT `FK_order_msr_client` FOREIGN KEY (`msr_client_id`) REFERENCES `msr_client` (`msr_client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.orders: ~2 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `sales_type`, `msr_client_id`, `order_date`, `discount`, `discount_type`, `form_number`, `si_no`, `dr_date`, `payment_type`, `return_id`, `cancel_date`, `approved_pre`, `approved_post`, `client_name`, `client_address`, `product_id`, `generic_name`, `product_batch`, `quantity`, `price`, `expire_date`, `discount_amount`, `subtotal`, `vat_sales`, `12_vat`, `total_amount`) VALUES
	(1, '1', 1, '2015-01-31 03:16:53', 0, 'percentage', 'so-00001', '', '', '30_days', 1, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '1000', '4', '0', '0', '4000', '3520', '480', '4000'),
	(2, '2', 2, '2015-01-31 03:59:23', 10, 'percentage', 'so-0002', '', '', '30_days', 0, NULL, 1, 1, 'north fairview general hospital', 'north fairview quezon city', '2', 'antisakit ulosis', '2', '1000', '3', '0', '0', '3000', '2640', '360', '2700'),
	(3, '1', 1, '2015-03-10 12:21:01', 10, '', 'so001', 'sdsd011', '10201020', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '100', '4', '2020-01-22', '10', '400', '352', '48', '390');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table vmv2.order_item
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.order_item: ~2 rows (approximately)
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` (`order_item_id`, `batch_id`, `order_id`, `quantity`, `custom_price`, `add_type`) VALUES
	(1, 4, 1, 1000, 4, 'paid'),
	(2, 2, 2, 1000, 3, 'free'),
	(3, 4, 3, 100, 4, 'paid');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;


-- Dumping structure for table vmv2.order_return
CREATE TABLE IF NOT EXISTS `order_return` (
  `return_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `reason` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`return_id`),
  KEY `FK_order_return_order_item` (`order_item_id`),
  CONSTRAINT `FK_order_return_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.order_return: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_return` DISABLE KEYS */;
INSERT INTO `order_return` (`return_id`, `order_item_id`, `quantity`, `reason`, `datetime`, `status`) VALUES
	(1, 1, 1000, 'near expiry', '2015-01-31 03:51:06', 0);
/*!40000 ALTER TABLE `order_return` ENABLE KEYS */;


-- Dumping structure for table vmv2.payment
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.payment: ~1 rows (approximately)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


-- Dumping structure for table vmv2.payment_item
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

-- Dumping data for table vmv2.payment_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `payment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_item` ENABLE KEYS */;


-- Dumping structure for table vmv2.payment_orders
CREATE TABLE IF NOT EXISTS `payment_orders` (
  `payment_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_order_id`),
  KEY `FK_payment_orders_payment` (`paymentid`),
  KEY `FK_payment_orders_orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.payment_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `payment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_orders` ENABLE KEYS */;


-- Dumping structure for table vmv2.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `action_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `FK__role` (`role_id`),
  KEY `FK__action` (`action_id`),
  CONSTRAINT `FK__action` FOREIGN KEY (`action_id`) REFERENCES `action` (`action_id`),
  CONSTRAINT `FK__role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.permission: ~80 rows (approximately)
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
	(110, 1, 55);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


-- Dumping structure for table vmv2.report_type
CREATE TABLE IF NOT EXISTS `report_type` (
  `report_type_id` int(250) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`report_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.report_type: ~8 rows (approximately)
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


-- Dumping structure for table vmv2.report_user
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

-- Dumping data for table vmv2.report_user: ~16 rows (approximately)
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


-- Dumping structure for table vmv2.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.role: ~6 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `name`) VALUES
	(1, 'admin'),
	(2, 'accountant'),
	(3, 'warehouseman'),
	(4, 'human resource'),
	(5, 'client'),
	(6, 'medical representative');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table vmv2.setting
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.setting: ~9 rows (approximately)
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
	(9, 'critical_limit', 'Critical limit (%)', '50', '50', NULL, NULL, 'text', NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;


-- Dumping structure for table vmv2.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.supplier: ~4 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplier_id`, `name`, `status`, `datetime`) VALUES
	(1, 'gobris trading company and corp', 'enabled', '2015-01-31 02:48:47'),
	(2, 'mundalas gamotry', 'enabled', '2015-01-31 02:49:02'),
	(3, 'all gamots seller', 'enabled', '2015-01-31 02:49:20'),
	(4, 'gamot buy and seller', 'enabled', '2015-01-31 02:49:34');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;


-- Dumping structure for table vmv2.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `area` varchar(50) NOT NULL,
  `quota` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL DEFAULT '2',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `civil_status` enum('single','married') NOT NULL DEFAULT 'single',
  `note` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`role_id`),
  KEY `FK_user_district` (`district_id`),
  CONSTRAINT `FK_user_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table vmv2.user: ~14 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `password`, `email`, `address`, `contact_person`, `contact_number`, `area`, `quota`, `role_id`, `district_id`, `status`, `civil_status`, `note`) VALUES
	(1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com', 'dsadasd', NULL, NULL, 'area 1', 100000, 1, 1, 'active', 'single', NULL),
	(14, 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman@email.com', 'fdggdfgdf', NULL, NULL, 'area 1', 0, 3, 2, 'active', 'single', NULL),
	(15, 'accountant', 'accountant', 'accountant', 'accountant', 'accountant@email.com', 'cxvxvxcvx', NULL, NULL, 'sample area', 100000, 2, 2, 'active', 'single', NULL),
	(20, 'hrname', 'hrmnmae', 'hrlname', 'hr', 'hr@email.com', 'uiyyuiuyi', NULL, NULL, 'taguig', 0, 4, 2, 'active', 'single', NULL),
	(24, 'jenny', 'landrito', 'mundala', 'jenny', 'jenny_ann@yahoo.com', NULL, NULL, NULL, 'manila', 1000000, 6, 2, 'active', 'single', NULL),
	(25, 'jessa', 'landrito', 'mundala', 'jessa', 'jessa@gmail.com', NULL, NULL, NULL, 'caloocan', 1000000, 6, 1, 'active', 'single', NULL),
	(26, 'erika', 'ewan', 'panis', 'erika', 'erika@yahoo.com', NULL, NULL, NULL, 'montalban', 1000000, 6, 3, 'active', 'single', NULL),
	(27, 'roseann', 'gobris', 'mundala', 'roseann', 'geeann@gmail.com', NULL, NULL, NULL, 'martan', 1000000, 6, 2, 'active', 'single', NULL),
	(28, 'rowena', 'garote', 'gobris', 'rowena', 'rowena@gmail.com', NULL, NULL, NULL, 'martan', 1000000, 6, 3, 'active', 'single', NULL),
	(29, 'rona', 'garote', 'gobris', 'rona', 'rona@gmail.com', NULL, NULL, NULL, 'martan', 10000000, 6, 1, 'active', 'single', NULL),
	(30, 'east avenue medical center', '', '', '', 'eastave@yahoo.com', 'east avenue quezon city', 'Dr. earl ignacio', '0922-1233333', 'north', 0, 5, 2, 'active', 'single', NULL),
	(31, 'north fairview general hospital', '', '', '', 'nfgh@gmail.com', 'north fairview quezon city', 'jonfer mallari', '0921-1223567', 'north fairview', 1000000, 5, 3, 'active', 'single', NULL),
	(32, 'south triangle medical center', '', '', '', 'stmc@gmail.com', 'south triangle project pie quezon city', 'cassandra tarman', '0912-2223345', 'calookan', 0, 5, 1, 'active', 'single', NULL),
	(33, 'michael', '', 'icao', '', 'micao', 'litex quezon city', 'michael icao', '0917-222-4421', 'litex', 0, 5, 2, 'active', 'single', NULL),
	(34, 'ariel', '', 'dimaano', '', 'admaano@yahoo.com', 'north edsa quezon city', 'ariel dimaano', '0915-1123456', 'project 1', 0, 5, 3, 'active', 'single', NULL),
	(35, 'jessica', '', 'pamintuan', '', 'jpinto@gmail.com', 'mindanao avenue quezon city', 'jessica pamintuan', '0909-2223411', 'mindanao ave', 0, 5, 1, 'active', 'single', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for view vmv2.msr_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `msr_view`;
CREATE VIEW `msr_view` AS select `user`.`user_id` AS `user_id`,`user`.`first_name` AS `first_name`,`user`.`middle_name` AS `middle_name`,`user`.`last_name` AS `last_name`,`user`.`password` AS `password`,`user`.`email` AS `email`,`user`.`area` AS `area`,`user`.`quota` AS `quota`,`user`.`role_id` AS `role_id`,`user`.`district_id` AS `district_id`,`user`.`status` AS `status`,`user`.`civil_status` AS `civil_status` from `user` where (`user`.`role_id` = 6) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
