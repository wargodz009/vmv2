-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 16, 2015 at 08:24 AM
-- Server version: 5.5.42-37.1
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jabee123_vme2`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `action_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `function` varchar(50) DEFAULT 'index',
  `show_on_menu` tinyint(4) DEFAULT '0' COMMENT '0-false;1-true;2-no to all',
  `parent` int(11) DEFAULT NULL,
  `sort` int(10) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `action`
--

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
(57, 'collection ajax get msr dr', 'collection', 'get_dr', 2, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batch_id` int(10) NOT NULL,
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
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_readable_id`, `item_id`, `user_id`, `supplier_id`, `count`, `access_type`, `sold_count`, `expire_count`, `return_count`, `buy`, `sell`, `lot_number`, `on_cavite_warehouse`, `recieve_date`, `expire_date`, `status`) VALUES
(1, 'b-a00001', 4, 1, 3, 10000, 'recieved', 0, 0, 0, 10000, 2, 'r1-c1', 'N', '2015-01-31', '2018-01-31', 'enabled'),
(2, 'b-b00001', 2, 1, 4, 100000, 'recieved', 1000, 0, 0, 2, 3, 'r2-c2', 'N', '2015-01-31', '2019-01-30', 'enabled'),
(3, 'b-c0001', 3, 1, 1, 10000, 'recieved', 0, 0, 0, 100, 120, 'r9-c1', 'N', '2015-01-31', '2018-01-31', 'enabled'),
(4, 'b-n0001', 1, 1, 2, 1000000, 'recieved', 150, 0, 1000, 3, 4, 'r99-c11', 'N', '2015-01-31', '2020-01-22', 'enabled'),
(5, 'b-w0001', 5, 1, 1, 100, 'recieved', 0, 0, 0, 10, 15, 'r7-c3', 'N', '2015-01-31', '2024-01-25', 'enabled'),
(6, 'V33124', 6, 1, 5, 490, 'ordered', 150, 0, 0, 0, 0, 'V33124', 'N', '2014-03-06', '2016-10-31', 'enabled'),
(7, 'V34077', 6, 1, 5, 8960, 'ordered', 0, 0, 0, 0, 0, 'V34077', 'N', '2014-10-09', '2017-06-30', 'enabled'),
(9, 'CFA20', 7, 1, 11, 2, 'recieved', 0, 0, 0, 0, 0, 'CFA20', 'N', '2014-04-28', '2015-08-01', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE IF NOT EXISTS `crud` (
  `crud_id` int(10) NOT NULL,
  `value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `district_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`district_id`, `name`) VALUES
(1, 'south'),
(2, 'central'),
(3, 'north');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `item_type_id` int(10) DEFAULT NULL,
  `generic_name` varchar(150) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `name`, `item_type_id`, `generic_name`, `description`, `status`, `datetime`) VALUES
(1, 'neozep', 2, 'paracetamol', '50mg', 'enabled', '2015-01-31 08:50:16'),
(2, 'biogesic', 2, 'antisakit ulosis', '50ml', 'enabled', '2015-01-31 08:50:47'),
(3, 'ceelin', 1, 'antisipon gamotsis', '250ml', 'enabled', '2015-01-31 08:51:25'),
(4, 'alaxan', 2, 'antisakit katwanasis', '25ml', 'enabled', '2015-01-31 08:52:02'),
(5, 'whiskey wine', 3, 'alaksis lasingosis', '1liter', 'enabled', '2015-01-31 08:52:30'),
(6, 'ZERONE', 1, 'CEFTRIAXONE SODIUM', '1G', 'enabled', '2015-03-27 05:36:41'),
(7, 'Zyndes', 5, 'Citicoline', '1g, (250mg/ml)- 4ml', 'enabled', '2015-06-05 07:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`item_type_id`, `name`) VALUES
(1, 'vial'),
(2, 'oral'),
(3, 'bottle'),
(4, 'tablet'),
(5, 'ampoule'),
(6, 'suppository');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `log_id` int(250) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `useragent` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `url` varchar(50) NOT NULL,
  `sql` varchar(50) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `ip_address`, `useragent`, `user_id`, `role_id`, `action`, `result`, `target`, `url`, `sql`, `datetime`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2015-01-31 08:41:12'),
(2, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-01-31 08:41:16'),
(3, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2015-01-31 08:41:18'),
(4, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '14', 3, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''3''', '2015-01-31 08:41:22'),
(5, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-01-31 08:41:26'),
(6, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '1', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''gobris tr', '2015-01-31 08:48:47'),
(7, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '2', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''mundalas ', '2015-01-31 08:49:02'),
(8, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '3', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''all gamot', '2015-01-31 08:49:20'),
(9, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '4', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''gamot buy', '2015-01-31 08:49:34'),
(10, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '1', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 08:50:16'),
(11, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '2', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 08:50:47'),
(12, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '3', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 08:51:25'),
(13, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '4', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 08:52:02'),
(14, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '5', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-01-31 08:52:30'),
(15, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '24', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 08:54:11'),
(16, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '25', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 08:54:44'),
(17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '26', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 08:55:23'),
(18, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '27', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 08:56:10'),
(19, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '28', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 08:56:41'),
(20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '29', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 08:57:09'),
(21, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '30', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 09:00:18'),
(22, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '31', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 09:01:54'),
(23, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '32', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 09:03:33'),
(24, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '33', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 09:04:23'),
(25, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '34', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 09:07:52'),
(26, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '35', 'http://localhost/vmv2/index.php/user/client/insert', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-01-31 09:09:05'),
(27, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '25', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 09:09:30'),
(28, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '29', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 09:09:37'),
(29, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 09:09:45'),
(30, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '27', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 09:09:50'),
(31, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '26', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 09:10:01'),
(32, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '28', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-01-31 09:10:06'),
(33, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '1', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 09:12:08'),
(34, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '2', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 09:13:02'),
(35, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '3', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 09:13:44'),
(36, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '4', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 09:14:24'),
(37, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '5', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-01-31 09:15:09'),
(38, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-10 14:50:07'),
(39, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-10 16:50:03'),
(40, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-10 17:21:33'),
(41, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-10 17:21:47'),
(42, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-10 17:22:39'),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-11 15:05:10'),
(44, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-24 14:25:38'),
(45, '180.191.92.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vmv2/index.php/signout', '0', '2015-03-24 14:26:23'),
(46, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-24 14:31:55'),
(47, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-24 14:32:00'),
(48, '180.191.92.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-24 14:33:38'),
(49, '180.191.92.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-24 14:52:21'),
(50, '180.191.92.1', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-24 18:04:28'),
(51, '180.191.92.1', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-25 00:22:54'),
(52, '112.209.179.78', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-25 01:13:54'),
(53, '180.191.92.1', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-25 04:30:24'),
(54, '180.191.92.1', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '0', 0, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-25 04:48:41'),
(55, '180.191.92.1', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-25 04:49:50'),
(56, '121.97.142.204', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-25 07:03:03'),
(57, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 04:34:41'),
(58, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 04:35:17'),
(59, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 04:46:32'),
(60, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 05:08:19'),
(61, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 05:13:37'),
(62, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 05:13:54'),
(63, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 05:21:07'),
(64, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 05:28:37'),
(65, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 05:29:32'),
(66, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 05:33:37'),
(67, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-03-26 06:07:16'),
(68, '180.191.90.15', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 06:16:00'),
(69, '180.191.90.15', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 06:16:29'),
(70, '180.191.90.15', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 06:57:05'),
(71, '180.191.90.15', 'Mozilla/5.0 (iPad; CPU OS 8_2 like Mac OS X) Apple', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 06:58:38'),
(72, '112.209.179.78', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 09:45:36'),
(73, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-26 10:56:23'),
(74, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''erika'', `middle_', '2015-03-26 10:59:31'),
(75, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''erika'', `middle_', '2015-03-26 10:59:51'),
(76, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-27 02:13:30'),
(77, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '6', 'http://vmephilmedica.com/vme/index.php/item/index/', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-03-27 05:36:41'),
(78, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '5', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Suhitas P', '2015-03-27 05:38:57'),
(79, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '6', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-03-27 05:42:55'),
(80, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '6', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Planetari', '2015-03-27 05:44:18'),
(81, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '7', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Beracah P', '2015-03-27 05:44:58'),
(82, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '8', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Jollymed ', '2015-03-27 05:45:19'),
(83, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '9', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Pharma Jo', '2015-03-27 05:45:44'),
(84, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '10', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Kairos Dy', '2015-03-27 05:46:13'),
(85, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '11', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Zuneca In', '2015-03-27 05:46:21'),
(86, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '12', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Greencore', '2015-03-27 05:46:44'),
(87, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '13', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Triple Ta', '2015-03-27 05:47:20'),
(88, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '14', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Ferj\\''s P', '2015-03-27 05:47:30'),
(89, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '15', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Better Op', '2015-03-27 05:47:44'),
(90, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '15', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'UPDATE `supplier` SET `name` = ''Better Option Phar', '2015-03-27 05:48:21'),
(91, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '16', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''D & G Pha', '2015-03-27 05:49:45'),
(92, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '17', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Qualityme', '2015-03-27 05:50:09'),
(93, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '18', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Marzan Ph', '2015-03-27 05:50:23'),
(94, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '19', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Vhermann ', '2015-03-27 05:50:49'),
(95, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '20', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Endure Me', '2015-03-27 05:50:59'),
(96, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '21', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Ellebasy ', '2015-03-27 05:51:58'),
(97, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '22', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Two World', '2015-03-27 05:52:17'),
(98, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '23', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Ambica In', '2015-03-27 05:52:43'),
(99, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '24', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Sheryl Ma', '2015-03-27 05:53:14'),
(100, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '25', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Savermed ', '2015-03-27 05:53:40'),
(101, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '26', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''New Myrex', '2015-03-27 05:54:23'),
(102, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '27', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Checktrad', '2015-03-27 05:54:38'),
(103, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '28', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''SKPD Jen ', '2015-03-27 05:54:58'),
(104, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '29', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Eurohealt', '2015-03-27 05:55:52'),
(105, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '30', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Vitalife ', '2015-03-27 05:56:24'),
(106, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '31', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Al-Ry Pha', '2015-03-27 05:56:47'),
(107, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '32', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''St. Marti', '2015-03-27 05:57:22'),
(108, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '33', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Nutriphar', '2015-03-27 05:57:43'),
(109, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '34', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Interlink', '2015-03-27 05:58:10'),
(110, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '35', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Genpharma', '2015-03-27 05:58:31'),
(111, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '36', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Medethix ', '2015-03-27 05:58:57'),
(112, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '36', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'UPDATE `supplier` SET `name` = ''Medethix Inc.'', `s', '2015-03-27 05:59:10'),
(113, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '29', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'UPDATE `supplier` SET `name` = ''Eurohealthcare Exp', '2015-03-27 05:59:52'),
(114, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '37', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Growrich''', '2015-03-27 06:00:16'),
(115, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '38', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Sel-J Pha', '2015-03-27 06:01:23'),
(116, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '39', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Steinbach', '2015-03-27 06:01:56'),
(117, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '40', 'http://vmephilmedica.com/vme/index.php/supplier/in', 'INSERT INTO `supplier` (`name`) VALUES (''Ryan Batu', '2015-03-27 06:02:20'),
(118, '112.209.179.78', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '7', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-03-27 06:07:39'),
(119, '180.191.92.3', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-27 11:32:10'),
(120, '112.209.179.78', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-27 13:59:53'),
(121, '112.209.178.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-03-31 10:11:13'),
(122, '112.209.178.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-04-01 07:49:46'),
(123, '112.209.139.136', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-04-15 08:42:44'),
(124, '112.209.139.136', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-04-16 08:24:48'),
(125, '112.209.139.136', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-04-16 08:26:24'),
(126, '180.191.89.4', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-04-16 17:59:16'),
(127, '180.191.89.4', 'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9505 Build/', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-04-16 18:10:04'),
(128, '112.209.222.86', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-05-13 09:43:15'),
(129, '112.209.222.86', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-05-20 00:16:26'),
(130, '110.55.3.219', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-05-31 16:36:09'),
(131, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 01:40:32'),
(132, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 01:40:47'),
(133, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 01:41:56'),
(134, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 05:02:13'),
(135, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 05:02:45'),
(136, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '36', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:07:16'),
(137, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '37', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:10:03'),
(138, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '38', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:11:09'),
(139, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '39', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:13:06'),
(140, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '40', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:14:15'),
(141, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '41', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:26:17'),
(142, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '42', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:29:07'),
(143, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '30', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''VALERIANA'', `mid', '2015-06-05 05:33:08'),
(144, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '31', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''MARY IMMACULATE ', '2015-06-05 05:36:05'),
(145, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '31', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''MARY IMMACULATE ', '2015-06-05 05:36:33'),
(146, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '31', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''MARY IMMACULATE ', '2015-06-05 05:37:48'),
(147, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '32', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. LANI'', `mid', '2015-06-05 05:39:21'),
(148, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '32', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. LANI'', `mid', '2015-06-05 05:39:30'),
(149, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '33', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. JAMAINE'', `', '2015-06-05 05:42:39'),
(150, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '41', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. NERISA'', `m', '2015-06-05 05:43:05'),
(151, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '41', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. NERISSA'', `', '2015-06-05 05:43:21'),
(152, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '34', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. MA. ELENA'',', '2015-06-05 05:46:20'),
(153, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '40', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''DRA. DOLORES GO''', '2015-06-05 05:46:56'),
(154, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '35', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''RUGAY MATERNITY ', '2015-06-05 05:49:21'),
(155, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '35', 'http://vmephilmedica.com/vme/index.php/user/client', 'UPDATE `user` SET `first_name` = ''RUGAY MATERNITY ', '2015-06-05 05:51:26'),
(156, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '43', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:53:34'),
(157, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '44', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:55:25'),
(158, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '45', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 05:58:58'),
(159, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '46', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 06:00:25'),
(160, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  ''24''', '2015-06-05 06:02:21'),
(161, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '15', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''accountant'', `mi', '2015-06-05 06:03:37'),
(162, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '24', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''DEXTER'', `middle', '2015-06-05 06:09:44'),
(163, '121.97.142.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  ''admin@gma', '2015-06-05 06:19:32'),
(164, '121.97.142.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  ''admin@gma', '2015-06-05 06:19:46'),
(165, '121.97.142.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  ''admin@ema', '2015-06-05 06:20:15'),
(166, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '25', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''MARY ANN'', `midd', '2015-06-05 06:32:10'),
(167, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (K', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-06-05 06:32:34'),
(168, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''erika'', `middle_', '2015-06-05 06:32:47'),
(169, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '26', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''MILLISCENT'', `mi', '2015-06-05 06:34:05'),
(170, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '27', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''CHERRYL ANNE'', `', '2015-06-05 06:50:50'),
(171, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '27', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''CHERRYL ANNE'', `', '2015-06-05 06:50:53'),
(172, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 06:59:09'),
(173, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 07:10:07'),
(174, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-06-05 07:19:40'),
(175, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 07:21:01'),
(176, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '7', 'http://vmephilmedica.com/vme/index.php/item/index/', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2015-06-05 07:23:54'),
(177, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '8', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-06-05 07:26:01'),
(178, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '28', 'http://vmephilmedica.com/vme/index.php/user/employ', 'UPDATE `user` SET `first_name` = ''KIRK VERNON'', `m', '2015-06-05 07:32:44'),
(179, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '24', 'http://vmephilmedica.com/vme/index.php/msr_client/', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2015-06-05 07:39:02'),
(180, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 07:40:15'),
(181, '180.190.94.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 07:41:37'),
(182, '121.97.142.151', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 07:43:05'),
(183, '121.97.142.151', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 07:43:19'),
(184, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'add_batch', 'success', '9', 'http://vmephilmedica.com/vme/index.php/batch/index', 'INSERT INTO `batch` (`item_id`, `batch_readable_id', '2015-06-05 07:44:41'),
(185, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'logout', 'success', 'logout_form', 'http://vmephilmedica.com/vme/index.php/signout', '0', '2015-06-05 07:45:21'),
(186, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '47', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 07:46:52'),
(187, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '48', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 07:48:05'),
(188, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '49', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 07:50:06'),
(189, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '50', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 07:53:54'),
(190, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '51', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 08:15:56'),
(191, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '52', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 08:18:45'),
(192, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '53', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 08:26:16'),
(193, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '54', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 08:27:52'),
(194, '121.97.142.151', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-05 09:55:00'),
(195, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '55', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 09:57:41'),
(196, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '56', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 10:00:39'),
(197, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '57', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 10:02:29'),
(198, '112.209.187.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '58', 'http://vmephilmedica.com/vme/index.php/user/client', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2015-06-05 10:05:20'),
(199, '110.55.3.222', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '0', 0, 'login', 'fail', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`user`)\nWHERE `email` =  ''admin@ema', '2015-06-07 01:05:19'),
(200, '110.55.3.222', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-07 01:05:34'),
(201, '110.55.3.222', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-07 03:51:04'),
(202, '110.55.3.222', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-07 08:42:27'),
(203, '112.198.77.228', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (K', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-07 12:47:52'),
(204, '180.191.142.85', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-08 16:17:42'),
(205, '112.209.155.155', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-09 05:44:29'),
(206, '112.209.155.155', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-10 07:51:30'),
(207, '112.209.212.209', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko', '1', 1, 'login', 'success', 'login_form', 'http://vmephilmedica.com/vme/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2015-06-16 00:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `msr_client`
--

CREATE TABLE IF NOT EXISTS `msr_client` (
  `msr_client_id` int(10) NOT NULL,
  `msr_client_custom_id` varchar(50) DEFAULT NULL,
  `msr_id` int(10) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msr_client`
--

INSERT INTO `msr_client` (`msr_client_id`, `msr_client_custom_id`, `msr_id`, `client_id`) VALUES
(1, NULL, 25, 30),
(2, NULL, 29, 31),
(4, NULL, 27, 33),
(5, NULL, 26, 34),
(6, NULL, 28, 35),
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

-- --------------------------------------------------------

--
-- Stand-in structure for view `msr_view`
--
CREATE TABLE IF NOT EXISTS `msr_view` (
`user_id` int(10)
,`first_name` varchar(50)
,`middle_name` varchar(50)
,`last_name` varchar(50)
,`password` varchar(50)
,`email` varchar(50)
,`area` varchar(50)
,`quota` int(11)
,`role_id` int(11)
,`district_id` int(11)
,`status` enum('active','inactive')
,`civil_status` enum('single','married')
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(10) NOT NULL,
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
  `total_amount` varchar(50) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `sales_type`, `msr_client_id`, `order_date`, `discount`, `discount_type`, `form_number`, `transaction_type`, `si_no`, `dr_date`, `payment_type`, `return_id`, `cancel_date`, `approved_pre`, `approved_post`, `client_name`, `client_address`, `product_id`, `generic_name`, `product_batch`, `quantity`, `price`, `expire_date`, `discount_amount`, `subtotal`, `vat_sales`, `vat_12`, `total_amount`) VALUES
(1, '1', 1, '2015-01-31 09:16:53', 0, 'percentage', 'so-00001', 'DR', '', '', '30_days', 1, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '1000', '4', '0', '0', '4000', '3520', '480', '4000'),
(2, '2', 2, '2015-01-31 09:59:23', 10, 'percentage', 'so-0002', 'DR', '', '', '30_days', 0, NULL, 1, 1, 'north fairview general hospital', 'north fairview quezon city', '2', 'antisakit ulosis', '2', '1000', '3', '0', '0', '3000', '2640', '360', '2700'),
(3, '1', 1, '2015-03-10 17:21:01', 10, '', 'so001', 'DR', 'sdsd011', '10201020', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '100', '4', '2020-01-22', '10', '400', '352', '48', '390'),
(4, '1', 1, '2015-03-27 06:09:59', 0, 'percentage', '456', 'DR', '456', '03/27/2015', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '6', 'CEFTRIAXONE SODIUM', '6', '40', '480', '2017-06-30', '0', '19200', '16896', '2304', '19200'),
(5, '1', 1, '2015-04-16 08:35:30', 0, 'percentage', '12345', 'DR', '25606', '04/01/2015', '30_days', 0, NULL, 1, 1, 'east avenue medical center', 'east avenue quezon city', '1', 'paracetamol', '4', '50', '4', '2020-01-22', '0', '200', '176', '24', '200'),
(6, '1', 2, '2015-04-16 08:38:06', 30, '', '12346', 'DR', '25404', '04/02/2015', '30_days', 0, NULL, 1, 1, 'north fairview general hospital', 'north fairview quezon city', '6', 'CEFTRIAXONE SODIUM', '6', '100', '693', '2017-06-30', '30', '69300', '60984', '8316', '69270'),
(7, '1', 13, '2015-06-07 13:10:10', 0, 'percentage', '12345', 'DR', '4286', '06/04/2015', '30_days', 0, NULL, 1, 1, 'CASTRO MATERNITY HOSP. & MED. CENTER INC.', 'M. Ponce St., Tibag, Baliuag, Bulacan', '6', 'CEFTRIAXONE SODIUM', '6', '10', '693', '2017-06-30', '0', '6930', '6098.4', '831.6', '6930');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `order_item_id` int(250) NOT NULL,
  `batch_id` int(250) NOT NULL,
  `order_id` int(250) NOT NULL,
  `quantity` int(250) NOT NULL DEFAULT '0',
  `custom_price` int(10) DEFAULT NULL,
  `add_type` enum('paid','free') NOT NULL DEFAULT 'paid'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `batch_id`, `order_id`, `quantity`, `custom_price`, `add_type`) VALUES
(1, 4, 1, 1000, 4, 'paid'),
(2, 2, 2, 1000, 3, 'free'),
(3, 4, 3, 100, 4, 'paid'),
(4, 6, 4, 40, 480, 'paid'),
(5, 4, 5, 50, 4, 'paid'),
(6, 6, 6, 100, 693, 'paid'),
(7, 6, 7, 10, 693, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `order_return`
--

CREATE TABLE IF NOT EXISTS `order_return` (
  `return_id` int(10) NOT NULL,
  `order_item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `reason` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_return`
--

INSERT INTO `order_return` (`return_id`, `order_item_id`, `quantity`, `reason`, `datetime`, `status`) VALUES
(1, 1, 1000, 'near expiry', '2015-01-31 09:51:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(10) NOT NULL,
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
  `dr_applied` varchar(150) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `amount`, `payment_type`, `bank`, `check_number`, `check_full_amount`, `datetime`, `datetime_collected`, `date_of_cheque`, `status`, `msr_client_id`, `pr_or_number`, `date_of_pr_or`, `dr_applied`) VALUES
(1, 5000, 'cheque', 'MBTC', '8679065', '', '2015-06-07 13:12:32', '0000-00-00', '06/30/2015', 'Unpaid', 13, 14567, '06/05/2015', '12345'),
(2, 500, 'cash', '', '', '', '2015-06-07 13:26:48', '0000-00-00', '', 'Unpaid', 13, 15678, '06/08/2015', '12345'),
(3, 1430, 'cash', '', '', '', '2015-06-07 13:35:28', '0000-00-00', '', 'Unpaid', 13, 16789, '06/10/2015', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `payment_item`
--

CREATE TABLE IF NOT EXISTS `payment_item` (
  `payment_item_id` int(250) NOT NULL,
  `payment_id` int(250) NOT NULL,
  `order_item_id` int(250) NOT NULL,
  `amount` int(250) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_orders`
--

CREATE TABLE IF NOT EXISTS `payment_orders` (
  `payment_order_id` int(11) NOT NULL,
  `paymentid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(10) NOT NULL,
  `role_id` int(10) DEFAULT NULL,
  `action_id` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

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
(116, 2, 57);

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE IF NOT EXISTS `report_type` (
  `report_type_id` int(250) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_type`
--

INSERT INTO `report_type` (`report_type_id`, `name`) VALUES
(1, 'Inventory Report'),
(2, 'Items Report'),
(3, 'Supplier List'),
(4, 'Item List'),
(5, 'Inventory Items'),
(6, 'Order Report'),
(7, 'Collection Updates'),
(8, 'sales update');

-- --------------------------------------------------------

--
-- Table structure for table `report_user`
--

CREATE TABLE IF NOT EXISTS `report_user` (
  `report_role_id` int(250) NOT NULL,
  `role_id` int(250) DEFAULT '0',
  `report_type_id` int(250) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_user`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'admin'),
(2, 'accountant'),
(3, 'warehouseman'),
(4, 'human resource'),
(5, 'client'),
(6, 'medical representative'),
(7, 'supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `readable_name` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `default_value` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT 'default',
  `order` varchar(50) DEFAULT NULL,
  `type` enum('radio','text','select','hidden','checkbox') DEFAULT NULL,
  `options` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(10) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `status`, `datetime`) VALUES
(1, 'gobris trading company and corp', 'enabled', '2015-01-31 08:48:47'),
(2, 'mundalas gamotry', 'enabled', '2015-01-31 08:49:02'),
(3, 'all gamots seller', 'enabled', '2015-01-31 08:49:20'),
(4, 'gamot buy and seller', 'enabled', '2015-01-31 08:49:34'),
(5, 'Suhitas Pharmaceuticals Incorporated', 'enabled', '2015-03-27 05:38:57'),
(6, 'Planetarium Enterprise Inc.', 'enabled', '2015-03-27 05:44:18'),
(7, 'Beracah Pharma Philippines Inc.', 'enabled', '2015-03-27 05:44:58'),
(8, 'Jollymed Enterprise', 'enabled', '2015-03-27 05:45:19'),
(9, 'Pharma Joy Drug Trading Inc.', 'enabled', '2015-03-27 05:45:44'),
(10, 'Kairos Dynamedics Phils., Inc.', 'enabled', '2015-03-27 05:46:13'),
(11, 'Zuneca Incorporated', 'enabled', '2015-03-27 05:46:21'),
(12, 'Greencore Pharma Incorporated', 'enabled', '2015-03-27 05:46:44'),
(13, 'Triple Tact Import & Export Corporation', 'enabled', '2015-03-27 05:47:20'),
(14, 'Ferj''s Pharmacy', 'enabled', '2015-03-27 05:47:30'),
(15, 'Better Option Pharmaceuticals Inc.', 'enabled', '2015-03-27 05:48:21'),
(16, 'D & G Pharma', 'enabled', '2015-03-27 05:49:45'),
(17, 'Qualitymed Pharma Corporation', 'enabled', '2015-03-27 05:50:09'),
(18, 'Marzan Pharma Corporation', 'enabled', '2015-03-27 05:50:23'),
(19, 'Vhermann Pharmaceuticals Inc.', 'enabled', '2015-03-27 05:50:49'),
(20, 'Endure Medical Inc.', 'enabled', '2015-03-27 05:50:59'),
(21, 'Ellebasy Medicale Trading', 'enabled', '2015-03-27 05:51:58'),
(22, 'Two World traders', 'enabled', '2015-03-27 05:52:17'),
(23, 'Ambica International Trading Corporation', 'enabled', '2015-03-27 05:52:43'),
(24, 'Sheryl Marketing', 'enabled', '2015-03-27 05:53:14'),
(25, 'Savermed Marketing Corporation', 'enabled', '2015-03-27 05:53:40'),
(26, 'New Myrex Laboratories Incorporated', 'enabled', '2015-03-27 05:54:23'),
(27, 'Checktrade Trading', 'enabled', '2015-03-27 05:54:38'),
(28, 'SKPD Jen Inc.', 'enabled', '2015-03-27 05:54:58'),
(29, 'Eurohealthcare Exponents Inc./ Foramen Products Corporation', 'enabled', '2015-03-27 05:59:52'),
(30, 'Vitalife Pharma & Medical Supply Inc.', 'enabled', '2015-03-27 05:56:24'),
(31, 'Al-Ry Pharma Distribution', 'enabled', '2015-03-27 05:56:47'),
(32, 'St. Martin Pharmaceutical Lab., Inc.', 'enabled', '2015-03-27 05:57:22'),
(33, 'Nutripharm', 'enabled', '2015-03-27 05:57:43'),
(34, 'Interlink Pharma Marketing Corporation', 'enabled', '2015-03-27 05:58:10'),
(35, 'Genpharma Inc.', 'enabled', '2015-03-27 05:58:31'),
(36, 'Medethix Inc.', 'enabled', '2015-03-27 05:58:57'),
(37, 'Growrich', 'enabled', '2015-03-27 06:00:16'),
(38, 'Sel-J Pharma Corp.', 'enabled', '2015-03-27 06:01:23'),
(39, 'Steinbach', 'enabled', '2015-03-27 06:01:56'),
(40, 'Ryan Batugal', 'enabled', '2015-03-27 06:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `area` varchar(50) NOT NULL,
  `quota` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL DEFAULT '2',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `civil_status` enum('single','married') NOT NULL DEFAULT 'single',
  `note` varchar(450) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `password`, `email`, `address`, `contact_person`, `contact_number`, `area`, `quota`, `role_id`, `district_id`, `status`, `civil_status`, `note`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com', 'dsadasd', NULL, NULL, 'area 1', 100000, 1, 1, 'active', 'single', NULL),
(14, 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman@email.com', 'fdggdfgdf', NULL, NULL, 'area 1', 0, 3, 2, 'active', 'single', NULL),
(15, 'accountant', 'accountant', 'accountant', 'accountant', 'accountant@email.com', 'cxvxvxcvx', NULL, NULL, 'sample area', 0, 2, 2, 'active', 'single', NULL),
(20, 'hrname', 'hrmnmae', 'hrlname', 'hr', 'hr@email.com', 'uiyyuiuyi', NULL, NULL, 'taguig', 0, 4, 2, 'active', 'single', NULL),
(24, 'DEXTER', '', 'BALLESTER', 'dexter', 'magdalo_56@yahoo.com', NULL, NULL, NULL, 'Bulacan', 800000, 6, 2, 'active', 'single', NULL),
(25, 'MARY ANN', '', 'DOMINGO', 'meann', 'mgmdomingo@yahoo.com', NULL, NULL, NULL, 'Tarlac', 550000, 6, 2, 'active', 'single', NULL),
(26, 'MILLISCENT', 'DALUSONG', 'BITANGCOL', 'milly', 'milliscent.bitangcol@yahoo.com', NULL, NULL, NULL, 'Nueva Ecija', 550000, 6, 2, 'active', 'single', NULL),
(27, 'CHERRYL ANNE', 'GAZA', 'ALBERTO', 'anne', 'annalberto04@gmail.com', NULL, NULL, NULL, 'Central', 0, 6, 2, 'active', 'single', NULL),
(28, 'KIRK VERNON', 'LIM', 'ISBERTO', 'kirk', 'kvisberto@icloud.com', NULL, NULL, NULL, 'Central', 0, 6, 2, 'active', 'single', NULL),
(29, 'rona', 'garote', 'gobris', 'rona', 'rona@gmail.com', NULL, NULL, NULL, 'martan', 10000000, 6, 1, 'active', 'single', NULL),
(30, 'VALERIANA', '', 'DE VERA', '', 'valeriana@yahoo.com', '#97 BF Aquino Ave., Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(31, 'MARY IMMACULATE & GENERAL HOSPITAL', '', '', '', 'maryimmgenhosp@yahoo.com', 'Malolos Bulacan (near Santos General Hospital)', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(32, 'DRA. LANI', '', 'MANIPULA', '', 'lanimanipula@yahoo.com', 'Cagayan Valley Rd., Tibag, Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(33, 'DRA. JAMAINE', '', 'NICOLAS', '', 'jamainenicolas@yahoo.com', 'BS Aquino Ave., Cangos, Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(34, 'DRA. MA. ELENA', '', 'SAYO', '', 'elenasayo@yahoo.com', 'Malolos, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(35, 'RUGAY MATERNITY & GENERAL HOSPITAL', '', '', '', 'rugayhospital@yahoo.com', 'Sabang Carpa, Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(36, 'CASTRO MATERNITY HOSP. & MED. CENTER INC.', '', '', '', 'castro@yahoo.com', 'M. Ponce St., Tibag, Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(37, 'SC MARCELO HOSPITAL', '', '', '', 'marcelo@yahoo.com', 'Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(38, 'STA. CRUZ HOSPITAL', '', '', '', 'stacruz@yahoo.com', 'Calumpit, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(39, 'ST. PAUL HOSPITAL', '', '', '', 'stpaulhospital@yahoo.com', 'Binang 2nd, Bocaue, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(40, 'DRA. DOLORES GO', '', 'MENDOZA', '', 'dra.go.mendoza@yahoo.com', 'Gil Carlos St., Baliuag, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(41, 'DRA. NERISSA', '', 'TAN', '', 'dranerisatan@yahoo.com', '1711 Paz Guevarra St., Carpa Vill, Sabang, Baliuag', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(42, 'NAZARENUS HOSPITAL', '', '', '', 'nazarenushospital@yahoo.com', 'Meycauayan, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(43, 'DR. JUAN GREGO', '', 'TORDESILLAS', '', 'jgtordesillas@yahoo.com', 'Meycauayan, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(44, 'MENDOZA GENERAL HOSPITAL', '', '', '', 'mendozagenhosp@yahoo.com', 'P. Santiago St., Poblacion, Sta. Maria, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(45, 'GALVEZ HOSPITAL', '', '', '', 'galvezhospital@yahoo.com', 'Maharlika Hi-way San Ildefonzo, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(46, 'SANTOS GENERAL HOSPITAL', '', '', '', 'santosgenhospital@yahoo.com', 'Malolos, Bulacan', NULL, NULL, 'Bulacan', 0, 5, 2, 'active', 'single', NULL),
(47, 'DIVINE MERCY HOSPITAL', '', '', '', 'divinemercyhosp@yahoo.com', 'McArthur Hi-way, Anupul, Bamban, Tarlac', 'Annalyn Vistan', NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(48, 'TALON GENERAL HOSPITAL', '', '', '', 'talongenhosp@yahoo.com', 'F. Tañedo St., Tarlac City', 'Irene Zabala', NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(49, 'DR. CHRISTIAN', '', 'SOLANO', '', 'chrissolano@yahoo.com', 'Gerona, Tarlac', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(50, 'RAMOS GENERAL HOSPITAL', '', '', '', 'ramosgenhosp@yahoo.com', 'Hilario St., Brgy. Ligtasan, Tarlac City', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(51, 'DRA. JESSLIN', '', 'TAYAG', '', 'jesslintayag@yahoo.com', 'Back of Capas Public Market, Capas, Tarlac', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(52, 'DR. JESUCHITO', '', 'SANTOS', '', 'jesuchitosantos@yahoo.com', 'Immaculate Concepcion Polyclinic Hospital - Concep', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(53, 'DR. OLIVER', '', 'ATANACIO', '', 'oliveratanacio@yahoo.com', 'CLDH Hospital Drive, San Vicente, Tarlac City', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(54, 'DR. JOSELITO', '', 'ESPINOSA', '', 'joselitoespinosa@yahoo.com', 'F. Tañedo St., Tarlac City - 3RD Flr.-TalonGenHosp', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(55, 'L.A. PASCUAL DRUGSTORE', '', '', '', 'lapascualds@yahoo.com', 'Moncada, Tarlac', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(56, 'LHEICARL PHARMACY', '', '', '', 'lheicarlpharmacy@yahoo.com', 'Tañedo St., Tarlac City', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(57, 'DRA. SHEILA', '', 'CARANTO', '', 'sheilacaranto@yahoo.com', 'Paniqui, Tarlac', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL),
(58, 'DR. EUTIQUIO', '', 'ATANACIO', '', 'eutiquioatanacio@yahoo.com', 'DEAMH, San Nicolas Poblacion, Concepcion, Tarlac', NULL, NULL, 'Tarlac', 0, 5, 2, 'active', 'single', NULL);

-- --------------------------------------------------------

--
-- Structure for view `msr_view`
--
DROP TABLE IF EXISTS `msr_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jabee123`@`localhost` SQL SECURITY DEFINER VIEW `msr_view` AS select `user`.`user_id` AS `user_id`,`user`.`first_name` AS `first_name`,`user`.`middle_name` AS `middle_name`,`user`.`last_name` AS `last_name`,`user`.`password` AS `password`,`user`.`email` AS `email`,`user`.`area` AS `area`,`user`.`quota` AS `quota`,`user`.`role_id` AS `role_id`,`user`.`district_id` AS `district_id`,`user`.`status` AS `status`,`user`.`civil_status` AS `civil_status` from `user` where (`user`.`role_id` = 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`), ADD KEY `FK__item` (`item_id`), ADD KEY `FK__supplier` (`supplier_id`), ADD KEY `FK__user` (`user_id`);

--
-- Indexes for table `crud`
--
ALTER TABLE `crud`
  ADD PRIMARY KEY (`crud_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`), ADD KEY `FK_item_item_type` (`item_type_id`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`item_type_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `msr_client`
--
ALTER TABLE `msr_client`
  ADD PRIMARY KEY (`msr_client_id`), ADD KEY `FK__2` (`client_id`), ADD KEY `FK__1` (`msr_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`), ADD KEY `FK_order_msr_client` (`msr_client_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`), ADD KEY `FK_order_item_batch` (`batch_id`), ADD KEY `FK_order_item_order` (`order_id`);

--
-- Indexes for table `order_return`
--
ALTER TABLE `order_return`
  ADD PRIMARY KEY (`return_id`), ADD KEY `FK_order_return_order_item` (`order_item_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_item`
--
ALTER TABLE `payment_item`
  ADD PRIMARY KEY (`payment_item_id`), ADD KEY `FK_payment_item_payment` (`payment_id`), ADD KEY `FK_payment_item_order_item` (`order_item_id`);

--
-- Indexes for table `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD PRIMARY KEY (`payment_order_id`), ADD KEY `FK_payment_orders_payment` (`paymentid`), ADD KEY `FK_payment_orders_orders` (`orderid`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`), ADD KEY `FK__role` (`role_id`), ADD KEY `FK__action` (`action_id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`report_type_id`);

--
-- Indexes for table `report_user`
--
ALTER TABLE `report_user`
  ADD PRIMARY KEY (`report_role_id`), ADD KEY `FK_report_user_role` (`role_id`), ADD KEY `FK_report_user_report_type` (`report_type_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`), ADD KEY `FK_user_role` (`role_id`), ADD KEY `FK_user_district` (`district_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `action_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batch_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
  MODIFY `crud_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `district_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `item_type_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(250) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `msr_client`
--
ALTER TABLE `msr_client`
  MODIFY `msr_client_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(250) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order_return`
--
ALTER TABLE `order_return`
  MODIFY `return_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment_item`
--
ALTER TABLE `payment_item`
  MODIFY `payment_item_id` int(250) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_orders`
--
ALTER TABLE `payment_orders`
  MODIFY `payment_order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
  MODIFY `report_type_id` int(250) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `report_user`
--
ALTER TABLE `report_user`
  MODIFY `report_role_id` int(250) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
ADD CONSTRAINT `FK__item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
ADD CONSTRAINT `FK__supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
ADD CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
ADD CONSTRAINT `FK_item_item_type` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`item_type_id`);

--
-- Constraints for table `msr_client`
--
ALTER TABLE `msr_client`
ADD CONSTRAINT `FK__1` FOREIGN KEY (`msr_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK__2` FOREIGN KEY (`client_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `FK_order_msr_client` FOREIGN KEY (`msr_client_id`) REFERENCES `msr_client` (`msr_client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
ADD CONSTRAINT `FK_order_item_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
ADD CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `order_return`
--
ALTER TABLE `order_return`
ADD CONSTRAINT `FK_order_return_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`);

--
-- Constraints for table `payment_item`
--
ALTER TABLE `payment_item`
ADD CONSTRAINT `FK_payment_item_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`),
ADD CONSTRAINT `FK_payment_item_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
ADD CONSTRAINT `FK__action` FOREIGN KEY (`action_id`) REFERENCES `action` (`action_id`),
ADD CONSTRAINT `FK__role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `report_user`
--
ALTER TABLE `report_user`
ADD CONSTRAINT `FK_report_user_report_type` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`report_type_id`),
ADD CONSTRAINT `FK_report_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `FK_user_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`),
ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
