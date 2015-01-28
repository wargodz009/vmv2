-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2014 at 06:02 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vmv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `function` varchar(50) DEFAULT 'index',
  `show_on_menu` tinyint(4) DEFAULT '0' COMMENT '0-false;1-true;2-no to all',
  `parent` int(11) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`action_id`, `name`, `module`, `function`, `show_on_menu`, `parent`, `sort`) VALUES
(1, 'home', 'site', 'index', 2, NULL, 0),
(2, 'inventory', 'inventory', 'index', 1, NULL, 2),
(3, 'client', 'client', 'index', 1, NULL, 4),
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
(20, 'clients', 'user', 'client', 0, 3, 0),
(21, 'order', 'order', 'index', 1, NULL, 0),
(22, 'All', 'order', 'all', 0, 21, 0),
(27, 'district info', 'district', 'info', 2, 4, 0),
(28, 'order_item', 'order', 'item', 0, 21, 1),
(29, 'payment', 'payment', 'index', 1, NULL, 1),
(30, 'all payments', 'payment', 'all', 0, 29, 0),
(32, 'maintenance', 'setting', 'maintenance', 0, 6, 4),
(34, 'manage payment', 'payment', 'manage', 2, 29, 0),
(35, 'reset database', 'setting', 'reset', 2, 6, 0),
(36, 'logs', 'setting', 'logs', 0, 6, 3),
(37, 'report type', 'report', 'type', 0, 5, 0),
(38, 'view report', 'report', 'view', 0, 5, 2),
(39, 'generate report', 'report', 'generate', 0, 5, 1),
(40, 'set approved', 'order', 'set_approved', 2, 21, 0),
(41, 'set returned', 'order', 'set_returned', 2, 21, 0),
(42, 'set cancelled', 'order', 'set_cancelled', 2, 21, 0),
(43, 'set completed', 'order', 'set_complete', 2, 21, 0),
(44, 'print so', 'payment', 'reciept', 2, 29, 0);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

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
  KEY `FK__user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_readable_id`, `item_id`, `user_id`, `supplier_id`, `count`, `access_type`, `sold_count`, `expire_count`, `return_count`, `buy`, `sell`, `lot_number`, `on_cavite_warehouse`, `recieve_date`, `expire_date`, `status`) VALUES
(1, 'batch-001', 2, 1, 1, 100000, 'recieved', 1000, 0, 1000, 2, 3, 'lot-1-1', 'N', '2014-07-07', '2015-07-01', 'enabled'),
(2, 'batch-002', 3, 1, 2, 150000, 'recieved', 200, 0, 200, 2, 3, 'lot-02', 'Y', '2014-07-07', '2019-07-08', 'enabled'),
(3, 'batch-003', 6, 0, 4, 50000, 'recieved', 49600, 0, 100, 50, 60, 'lot-03', 'N', '2014-07-07', '2017-07-31', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE IF NOT EXISTS `crud` (
  `crud_id` int(10) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`crud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `district_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `item_type_id` int(10) DEFAULT NULL,
  `generic_name` varchar(150) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `price_standard` int(50) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `FK_item_item_type` (`item_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `name`, `item_type_id`, `generic_name`, `description`, `price_standard`, `status`, `datetime`) VALUES
(2, 'biogesic', 2, 'paracetamol', '50mg', 2, 'enabled', '2014-07-07 00:19:59'),
(3, 'neozep', 2, 'neozepo gamoto', '25mg', 3, 'enabled', '2014-07-07 00:42:30'),
(4, 'alaxan', 2, 'alaxano gamoto', '25mg', 3, 'enabled', '2014-07-07 00:42:58'),
(5, 'gardan', 2, 'gardano gamoto', '200mg', 5, 'enabled', '2014-07-07 00:43:24'),
(6, 'ceelin', 1, 'ceelino inomo', '8oz', 50, 'enabled', '2014-07-07 00:44:02'),
(7, 'tanduay', 1, 'tnaduay tagay', '12oz', 90, 'enabled', '2014-07-07 00:45:11'),
(8, 'emperador', 1, 'empegamot', '12oz', 75, 'enabled', '2014-07-07 00:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`item_type_id`, `name`) VALUES
(1, 'vial'),
(2, 'oral');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `ip_address`, `useragent`, `user_id`, `role_id`, `action`, `result`, `target`, `url`, `sql`, `datetime`) VALUES
(3, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2014-07-06 23:53:47'),
(4, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2014-07-06 23:53:50'),
(5, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '1', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:14:09'),
(6, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_item', 'success', '1', 'http://localhost/vmv2/index.php/item/index/update/', 'UPDATE `item` SET `name` = ''biogesic'', `item_type_', '2014-07-07 00:16:44'),
(7, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'delete_item', 'success', NULL, 'http://localhost/vmv2/index.php/item/index/delete/', 'DELETE FROM `item`\nWHERE `item_id` =  ''1'' LIMIT 1', '2014-07-07 00:19:25'),
(8, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '2', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:19:59'),
(9, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '2', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''geeann\\''s', '2014-07-07 00:34:07'),
(10, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '3', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''sample st', '2014-07-07 00:34:19'),
(11, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'delete_supplier', 'success', NULL, 'http://localhost/vmv2/index.php/supplier/index/del', 'DELETE FROM `supplier`\nWHERE `supplier_id` =  ''3'' ', '2014-07-07 00:34:30'),
(12, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '2', 'http://localhost/vmv2/index.php/supplier/index/upd', 'UPDATE `supplier` SET `name` = ''geeann generic sup', '2014-07-07 00:35:43'),
(13, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_supplier', 'success', '1', 'http://localhost/vmv2/index.php/supplier/index/upd', 'UPDATE `supplier` SET `name` = ''jayar pharma suppl', '2014-07-07 00:35:52'),
(14, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '1', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`batch_readable_id`, `access_', '2014-07-07 00:41:14'),
(15, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_batch', 'success', '1', 'http://localhost/vmv2/index.php/batch/index/update', 'UPDATE `batch` SET `batch_readable_id` = ''batch-00', '2014-07-07 00:41:44'),
(16, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '3', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:42:30'),
(17, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '4', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:42:58'),
(18, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '5', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:43:24'),
(19, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '6', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:44:03'),
(20, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '7', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:45:11'),
(21, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_item', 'success', '8', 'http://localhost/vmv2/index.php/item/index/insert', 'INSERT INTO `item` (`name`, `item_type_id`, `gener', '2014-07-07 00:45:42'),
(22, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '4', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''renans ph', '2014-07-07 00:46:10'),
(23, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_supplier', 'success', '5', 'http://localhost/vmv2/index.php/supplier/index/ins', 'INSERT INTO `supplier` (`name`) VALUES (''rich phra', '2014-07-07 00:46:18'),
(24, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '2', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`batch_readable_id`, `access_', '2014-07-07 00:59:19'),
(25, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_batch', 'success', '2', 'http://localhost/vmv2/index.php/batch/index/update', 'UPDATE `batch` SET `batch_readable_id` = ''batch-00', '2014-07-07 00:59:31'),
(26, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_batch', 'success', '3', 'http://localhost/vmv2/index.php/batch/index/insert', 'INSERT INTO `batch` (`batch_readable_id`, `access_', '2014-07-07 01:00:48'),
(27, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_batch', 'success', '1', 'http://localhost/vmv2/index.php/batch/index/update', 'UPDATE `batch` SET `batch_readable_id` = ''batch-00', '2014-07-07 01:01:14'),
(28, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_batch', 'success', '3', 'http://localhost/vmv2/index.php/batch/index/update', 'UPDATE `batch` SET `batch_readable_id` = ''batch-00', '2014-07-07 01:02:14'),
(29, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '17', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:14:13'),
(30, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '18', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:15:18'),
(31, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '19', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:16:01'),
(32, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '20', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:16:58'),
(33, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '21', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:18:27'),
(34, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '22', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:19:05'),
(35, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '23', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-07 01:19:42'),
(36, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '19', 'http://localhost/vmv2/index.php/msr_client/index/u', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  ''19''', '2014-07-07 01:35:54'),
(37, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '19', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2014-07-07 01:36:05'),
(38, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '19', 'http://localhost/vmv2/index.php/msr_client/index/u', 'DELETE FROM `msr_client`\nWHERE `msr_id` =  ''19''', '2014-07-07 01:36:49'),
(39, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_msrclient', 'success', '19', 'http://localhost/vmv2/index.php/msr_client/index/u', 'INSERT INTO `msr_client` (`msr_id`, `client_id`) V', '2014-07-07 01:37:22'),
(40, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_user', 'success', '23', 'http://localhost/vmv2/index.php/user/client/update', 'UPDATE `user` SET `first_name` = ''clientthreefname', '2014-07-07 01:40:42'),
(41, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2014-07-07 02:19:45'),
(42, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '15', 2, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''2''', '2014-07-07 02:19:49'),
(43, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '15', 2, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2014-07-07 02:20:08'),
(44, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '14', 3, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''3''', '2014-07-07 02:20:13'),
(45, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '14', 3, 'logout', 'success', 'logout_form', 'http://localhost/vmv2/index.php/signout', '0', '2014-07-07 02:20:21'),
(46, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2014-07-07 02:20:26'),
(47, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'edit_order', 'success', '1', 'http://localhost/vmv2/index.php/order/all/update/1', 'UPDATE `orders` SET `form_number` = ''so-001'', `msr', '2014-07-07 02:23:31'),
(48, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order', 'success', '2', 'http://localhost/vmv2/index.php/order/all/insert', 'INSERT INTO `orders` (`form_number`, `msr_client_i', '2014-07-07 02:23:51'),
(49, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '1', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-07 02:24:59'),
(50, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '2', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-07 02:25:13'),
(51, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2014-07-11 08:02:14'),
(52, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '3', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-11 08:49:30'),
(53, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2014-07-12 13:05:26'),
(54, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'login', 'success', 'login_form', 'http://localhost/vmv2/index.php/signin', 'SELECT *\nFROM (`role`)\nWHERE `role_id` =  ''1''', '2014-07-13 11:33:49'),
(55, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '4', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 12:47:26'),
(56, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '5', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 13:05:41'),
(57, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_user', 'success', '24', 'http://localhost/vmv2/index.php/user/employee/inse', 'INSERT INTO `user` (`first_name`, `middle_name`, `', '2014-07-13 14:38:27'),
(58, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'delete_user', 'success', NULL, 'http://localhost/vmv2/index.php/user/employee/dele', 'DELETE FROM `user`\nWHERE `user_id` =  ''24'' LIMIT 1', '2014-07-13 14:38:33'),
(59, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order', 'success', '3', 'http://localhost/vmv2/index.php/order/all/insert', 'INSERT INTO `orders` (`form_number`, `msr_client_i', '2014-07-13 15:04:08'),
(60, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '6', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 15:04:52'),
(61, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '7', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 15:05:17'),
(62, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '8', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 15:05:39'),
(63, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order', 'success', '4', 'http://localhost/vmv2/index.php/order/all/insert', 'INSERT INTO `orders` (`form_number`, `msr_client_i', '2014-07-13 15:07:07'),
(64, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '9', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 15:07:29'),
(65, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '10', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 15:07:44'),
(66, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53', '1', 1, 'add_order_details', 'success', '11', 'http://localhost/vmv2/index.php/order/item/insert', 'INSERT INTO `order_item` (`batch_id`, `order_id`, ', '2014-07-13 15:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `msr_client`
--

CREATE TABLE IF NOT EXISTS `msr_client` (
  `msr_client_id` int(10) NOT NULL AUTO_INCREMENT,
  `msr_client_custom_id` varchar(50) DEFAULT NULL,
  `msr_id` int(10) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`msr_client_id`),
  KEY `FK__2` (`client_id`),
  KEY `FK__1` (`msr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `msr_client`
--

INSERT INTO `msr_client` (`msr_client_id`, `msr_client_custom_id`, `msr_id`, `client_id`) VALUES
(3, NULL, 17, 8),
(4, NULL, 17, 22),
(5, NULL, 18, 16),
(6, NULL, 18, 23),
(9, NULL, 19, 7),
(10, NULL, 19, 21);

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
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `msr_client_id` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` int(10) DEFAULT NULL,
  `discount_type` enum('percentage','php') DEFAULT 'percentage',
  `form_number` varchar(50) NOT NULL,
  `payment_type` varchar(50) DEFAULT '30_days',
  `return_id` tinyint(10) DEFAULT '0',
  `cancel_date` date DEFAULT NULL,
  `approved_pre` int(10) DEFAULT '0',
  `approved_post` int(10) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `FK_order_msr_client` (`msr_client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `msr_client_id`, `order_date`, `discount`, `discount_type`, `form_number`, `payment_type`, `return_id`, `cancel_date`, `approved_pre`, `approved_post`) VALUES
(1, 4, '2014-07-07 02:20:59', 10, 'percentage', 'so-001', '30_days', NULL, '2014-07-07', 0, 0),
(2, 9, '2014-07-07 02:23:51', 25, 'percentage', 'so-002', '30_days', NULL, NULL, 1, 1),
(3, 5, '2014-07-13 15:04:08', 10, 'percentage', 'frm-004', '30_days', NULL, NULL, 1, 1),
(4, 5, '2014-07-13 15:07:07', 10, 'percentage', 'form-005', '30_days', 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `order_item_id` int(250) NOT NULL AUTO_INCREMENT,
  `batch_id` int(250) NOT NULL,
  `order_id` int(250) NOT NULL,
  `quantity` int(250) NOT NULL DEFAULT '0',
  `custom_price` int(10) DEFAULT NULL,
  `add_type` enum('paid','free') NOT NULL DEFAULT 'paid',
  PRIMARY KEY (`order_item_id`),
  KEY `FK_order_item_batch` (`batch_id`),
  KEY `FK_order_item_order` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `batch_id`, `order_id`, `quantity`, `custom_price`, `add_type`) VALUES
(1, 1, 1, 10000, 3, 'paid'),
(2, 1, 1, 2000, 2, 'free'),
(3, 2, 2, 1000, 1, 'paid'),
(4, 1, 1, 200, 2, 'paid'),
(5, 2, 2, 1000, 2, 'free'),
(6, 1, 3, 100, 2, 'paid'),
(7, 2, 3, 200, 2, 'paid'),
(8, 3, 3, 300, 3, 'paid'),
(9, 1, 4, 1000, 2, 'paid'),
(10, 2, 4, 200, 2, 'paid'),
(11, 3, 4, 100, 3, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `order_return`
--

CREATE TABLE IF NOT EXISTS `order_return` (
  `return_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `reason` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`return_id`),
  KEY `FK_order_return_order_item` (`order_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `order_return`
--

INSERT INTO `order_return` (`return_id`, `order_item_id`, `quantity`, `reason`, `datetime`, `status`) VALUES
(1, 9, 1000, 'c', '2014-07-13 15:59:14', 0),
(2, 10, 200, 'b', '2014-07-13 15:59:14', 0),
(3, 11, 100, 'a', '2014-07-13 15:59:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(10) NOT NULL DEFAULT '0',
  `order_id` int(10) NOT NULL,
  `payment_type` enum('cash','check') NOT NULL DEFAULT 'check',
  `bank` varchar(50) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `check_full_amount` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_id`),
  KEY `FK_payment_order` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `amount`, `order_id`, `payment_type`, `bank`, `check_number`, `check_full_amount`, `datetime`, `status`) VALUES
(1, 10000, 1, 'cash', 'pnb', '1121112', '10000', '2014-07-11 04:00:00', 0),
(2, 5000, 2, 'check', 'banko de oro', '11111', '5000', '2014-07-11 04:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_item`
--

CREATE TABLE IF NOT EXISTS `payment_item` (
  `payment_item_id` int(250) NOT NULL AUTO_INCREMENT,
  `payment_id` int(250) NOT NULL,
  `order_item_id` int(250) NOT NULL,
  `amount` int(250) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_item_id`),
  KEY `FK_payment_item_payment` (`payment_id`),
  KEY `FK_payment_item_order_item` (`order_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `payment_item`
--

INSERT INTO `payment_item` (`payment_item_id`, `payment_id`, `order_item_id`, `amount`, `datetime`) VALUES
(6, 1, 1, 5000, '2014-07-13 13:04:55'),
(7, 1, 2, 5000, '2014-07-13 13:04:55'),
(8, 1, 4, 50, '2014-07-13 13:04:55'),
(9, 2, 3, 5000, '2014-07-13 14:34:09'),
(10, 2, 5, 500, '2014-07-13 14:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `action_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `FK__role` (`role_id`),
  KEY `FK__action` (`action_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

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
(65, 1, 28),
(66, 2, 28),
(67, 1, 29),
(68, 2, 29),
(69, 1, 30),
(70, 2, 30),
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
(91, 1, 44);

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE IF NOT EXISTS `report_type` (
  `report_type_id` int(250) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`report_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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
  `report_role_id` int(250) NOT NULL AUTO_INCREMENT,
  `role_id` int(250) DEFAULT '0',
  `report_type_id` int(250) DEFAULT '0',
  PRIMARY KEY (`report_role_id`),
  KEY `FK_report_user_role` (`role_id`),
  KEY `FK_report_user_report_type` (`report_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

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
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'admin'),
(2, 'accountant'),
(3, 'warehouseman'),
(4, 'human resource'),
(5, 'client'),
(6, 'medical representative');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

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
(8, 'site_open_day', 'Operation days', 'mon,tue,wed,thu,fri', NULL, NULL, NULL, 'select', 'mon,tue,wed,thu,fri,sat,sun'),
(9, 'critical_count', 'Critical count', '1000', '1000', NULL, NULL, 'text', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `status`, `datetime`) VALUES
(1, 'jayar pharma supplier', 'enabled', '2014-07-07 00:35:52'),
(2, 'geeann generic supplier', 'enabled', '2014-07-07 00:35:43'),
(4, 'renans pharma', 'enabled', '2014-07-07 00:46:09'),
(5, 'rich phrama', 'enabled', '2014-07-07 00:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `area` varchar(50) NOT NULL,
  `quota` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL DEFAULT '2',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `civil_status` enum('single','married') NOT NULL DEFAULT 'single',
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`role_id`),
  KEY `FK_user_district` (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `password`, `email`, `address`, `area`, `quota`, `role_id`, `district_id`, `status`, `civil_status`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com', 'address line here', 'area 1', 100000, 1, 1, 'active', 'single'),
(7, 'client1', 'client1', 'client1', 'client1', 'client1@email.com', 'address line here', 'area 2', 1000000, 5, 2, 'active', 'single'),
(8, 'client2', 'client2', 'client2', 'client2', 'client2@email.com', 'address line here', 'area 2', 0, 5, 2, 'active', 'single'),
(14, 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman@email.com', 'address line here', 'area 1', 0, 3, 2, 'active', 'single'),
(15, 'accountant', 'accountant', 'accountant', 'accountant', 'accountant@email.com', 'address line here', 'sample area', 100000, 2, 2, 'active', 'single'),
(16, 'samaguita hospital', '', '', '', 'smapaguitahospitalname', 'address line here', 'pampangga', 0, 5, 2, 'active', ''),
(17, 'msrone', 'mdlenameone', 'lasnmeone', 'msrone', 'msr@email.com', 'address line here', 'sampaloc', 1000000, 6, 2, 'active', 'single'),
(18, 'msrtwo', 'msrtwomnme', 'msrtwolnme', 'msrtwo', 'msrtwo@email.com', 'address line here', 'manila', 1000000, 6, 3, 'active', 'single'),
(19, 'msrthree', 'msrthremnme', 'msrthrelnme', 'msrthree', 'msrthree@email.com', 'address line here', 'quezon city', 1500000, 6, 1, 'active', 'single'),
(20, 'hrname', 'hrmnmae', 'hrlname', 'hr', 'hr@email.com', 'address line here', 'taguig', 0, 4, 2, 'active', 'single'),
(21, 'clientonefnmae', 'clientonemname', 'clientonelname', 'client1', 'client1@email.com', 'address line here', 'sampaloc', 0, 5, 2, 'active', 'single'),
(22, 'clienttwofname', 'clienttwomname', 'clienttwolname', 'client2', 'client2@email.com', 'address line here', 'manila', 0, 5, 3, 'active', 'single'),
(23, 'clientthreefname', 'clientthreemname', 'clientthreelname', 'client3', 'client3@email.com', 'address line here', 'quezon city', 0, 5, 1, 'active', 'single');

-- --------------------------------------------------------

--
-- Structure for view `msr_view`
--
DROP TABLE IF EXISTS `msr_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `msr_view` AS select `user`.`user_id` AS `user_id`,`user`.`first_name` AS `first_name`,`user`.`middle_name` AS `middle_name`,`user`.`last_name` AS `last_name`,`user`.`password` AS `password`,`user`.`email` AS `email`,`user`.`area` AS `area`,`user`.`quota` AS `quota`,`user`.`role_id` AS `role_id`,`user`.`district_id` AS `district_id`,`user`.`status` AS `status`,`user`.`civil_status` AS `civil_status` from `user` where (`user`.`role_id` = 6);

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
  ADD CONSTRAINT `FK_order_msr_client` FOREIGN KEY (`msr_client_id`) REFERENCES `msr_client` (`msr_client_id`);

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
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

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
