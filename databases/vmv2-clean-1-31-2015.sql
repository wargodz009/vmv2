-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2015 at 07:39 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

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
(52, 'save sales', 'sales', 'save', 2, NULL, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `status` enum('enabled','disabled') DEFAULT 'enabled',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `FK_item_item_type` (`item_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `sales_type` varchar(50) NOT NULL DEFAULT '0',
  `msr_client_id` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` int(10) DEFAULT NULL,
  `discount_type` enum('percentage','php') DEFAULT 'percentage',
  `form_number` varchar(50) NOT NULL COMMENT 'so number',
  `si_no` varchar(50) NOT NULL COMMENT 'dr or si no',
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
  `subtotal` varchar(50) DEFAULT '0',
  `vat_sales` varchar(50) DEFAULT '0',
  `12_vat` varchar(50) DEFAULT '0',
  `total_amount` varchar(50) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `FK_order_msr_client` (`msr_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(10) NOT NULL DEFAULT '0',
  `payment_type` enum('cash','check') NOT NULL DEFAULT 'check',
  `bank` varchar(50) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `check_full_amount` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_collected` date NOT NULL DEFAULT '0000-00-00',
  `status` enum('Collected','Not Collected yet','Not Paid') NOT NULL DEFAULT 'Not Paid' COMMENT '0-not collected yet; 1 - collected; 2 - not paid',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_orders`
--

CREATE TABLE IF NOT EXISTS `payment_orders` (
  `payment_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_order_id`),
  KEY `FK_payment_orders_payment` (`paymentid`),
  KEY `FK_payment_orders_orders` (`orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `payment_orders`
--

INSERT INTO `payment_orders` (`payment_order_id`, `paymentid`, `orderid`) VALUES
(20, 1, 3),
(21, 1, 1),
(22, 1, 2),
(23, 2, 4),
(25, 3, 6),
(26, 4, 7),
(27, 5, 3),
(28, 5, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

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
(106, 2, 52);

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
(8, 'site_open_day', 'Operation days', 'mon,tue,wed,thu,fri,sat,sun', NULL, NULL, NULL, 'select', 'mon,tue,wed,thu,fri,sat,sun'),
(9, 'critical_limit', 'Critical limit (%)', '50', '50', NULL, NULL, 'text', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `FK_user_district` (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `password`, `email`, `address`, `contact_person`, `contact_number`, `area`, `quota`, `role_id`, `district_id`, `status`, `civil_status`, `note`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com', 'dsadasd', NULL, NULL, 'area 1', 100000, 1, 1, 'active', 'single', NULL),
(14, 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman@email.com', 'fdggdfgdf', NULL, NULL, 'area 1', 0, 3, 2, 'active', 'single', NULL),
(15, 'accountant', 'accountant', 'accountant', 'accountant', 'accountant@email.com', 'cxvxvxcvx', NULL, NULL, 'sample area', 100000, 2, 2, 'active', 'single', NULL),
(20, 'hrname', 'hrmnmae', 'hrlname', 'hr', 'hr@email.com', 'uiyyuiuyi', NULL, NULL, 'taguig', 0, 4, 2, 'active', 'single', NULL);

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
-- Constraints for table `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD CONSTRAINT `FK_payment_orders_orders` FOREIGN KEY (`orderid`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_payment_orders_payment` FOREIGN KEY (`paymentid`) REFERENCES `payment` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
