# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.16
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2014-06-20 00:19:17
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for vmv2
CREATE DATABASE IF NOT EXISTS `vmv2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vmv2`;

# Dumping data for table vmv2.action: ~20 rows (approximately)
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
REPLACE INTO `action` (`action_id`, `name`, `module`, `function`, `show_on_menu`, `parent`, `sort`) VALUES
	(1, 'home', 'site', 'index', 2, NULL, 0),
	(2, 'inventory', 'inventory', 'index', 1, NULL, 1),
	(3, 'client', 'client', 'index', 1, NULL, 3),
	(4, 'employee', 'employee', 'index', 1, NULL, 2),
	(5, 'report', 'report', 'index', 1, NULL, 4),
	(6, 'setting', 'setting', 'index', 1, NULL, 5),
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
	(20, 'clients', 'user', 'client', 0, 3, 0);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;

# Dumping data for table vmv2.batch: ~1 rows (approximately)
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
REPLACE INTO `batch` (`batch_id`, `batch_readable_id`, `item_id`, `user_id`, `supplier_id`, `count`, `access_type`, `sold`, `expire`, `return`, `buy`, `sell`, `lot_number`, `on_cavite_warehouse`, `recieve_date`, `expire_date`, `status`) VALUES
	(12, 'sdasdas1', 1, 1, 1, 111, 'ordered', 0, 0, 0, 0, 0, '111', 'Y', '2014-06-02', '2014-06-30', 'enabled');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;

# Dumping data for table vmv2.crud: ~4 rows (approximately)
/*!40000 ALTER TABLE `crud` DISABLE KEYS */;
REPLACE INTO `crud` (`crud_id`, `value`) VALUES
	(1, 'first'),
	(2, 'second'),
	(3, 'third'),
	(4, 'fourth');
/*!40000 ALTER TABLE `crud` ENABLE KEYS */;

# Dumping data for table vmv2.district: ~3 rows (approximately)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
REPLACE INTO `district` (`district_id`, `name`) VALUES
	(1, 'south'),
	(2, 'central'),
	(3, 'north');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;

# Dumping data for table vmv2.item: ~2 rows (approximately)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
REPLACE INTO `item` (`item_id`, `name`, `item_type_id`, `generic_name`, `description`, `price_standard`, `status`, `datetime`) VALUES
	(1, 'biogesic', 2, 'paracetamol', '200mg', 3, 'enabled', '2014-06-13 03:25:17'),
	(2, 'neozep', 2, 'blahblah', 'blahblah blahblah', 2, 'enabled', '2014-06-13 03:27:05');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

# Dumping data for table vmv2.item_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
REPLACE INTO `item_type` (`item_type_id`, `name`) VALUES
	(1, 'vial'),
	(2, 'oral');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;

# Dumping data for table vmv2.msr_client: ~1 rows (approximately)
/*!40000 ALTER TABLE `msr_client` DISABLE KEYS */;
REPLACE INTO `msr_client` (`msr_client_id`, `msr_client_custom_id`, `msr_id`, `client_id`) VALUES
	(9, NULL, 10, 7);
/*!40000 ALTER TABLE `msr_client` ENABLE KEYS */;

# Dumping data for table vmv2.permission: ~39 rows (approximately)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
REPLACE INTO `permission` (`permission_id`, `role_id`, `action_id`) VALUES
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
	(44, 2, 14);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

# Dumping data for table vmv2.role: ~6 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
REPLACE INTO `role` (`role_id`, `name`) VALUES
	(1, 'admin'),
	(2, 'accountant'),
	(3, 'warehouseman'),
	(4, 'human resource'),
	(5, 'client'),
	(6, 'medical representative');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

# Dumping data for table vmv2.setting: ~8 rows (approximately)
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
REPLACE INTO `setting` (`setting_id`, `name`, `readable_name`, `value`, `default_value`, `group`, `order`, `type`, `options`) VALUES
	(1, 'site_name', 'website name', 'sample site', NULL, 'default', NULL, 'text', NULL),
	(2, 'theme_path', 'theme', 'default', 'default', 'default', NULL, NULL, NULL),
	(3, 'site_header', 'Site Title', '.:: Vintelmed Enterprise::.', NULL, NULL, NULL, 'text', NULL),
	(4, 'footer_copyright', 'Footer Text', '&copy; All rights Reserved 2014', NULL, NULL, NULL, NULL, NULL),
	(5, 'site_title', 'Site Title', '.::VintelMed::.', NULL, 'default', NULL, NULL, NULL),
	(6, 'site_open_time', 'open_time', '6:00', '6:00', NULL, NULL, 'text', NULL),
	(7, 'site_close_time', 'close_time', '9:30 PM', '9:00 PM', NULL, NULL, 'text', NULL),
	(8, 'site_open_day', 'Operation days', 'mon,tue,wed,thu,fri', NULL, NULL, NULL, 'select', 'mon,tue,wed,thu,fri,sat,sun');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;

# Dumping data for table vmv2.supplier: ~3 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
REPLACE INTO `supplier` (`supplier_id`, `name`, `status`, `datetime`) VALUES
	(1, 'ambica intl corp', 'enabled', '2014-06-13 03:32:00'),
	(2, 'phil med corp', 'enabled', '2014-06-13 03:32:08'),
	(3, 'generica', 'enabled', '2014-06-13 03:32:12');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

# Dumping data for table vmv2.user: ~7 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `password`, `email`, `area`, `quota`, `role_id`, `district_id`, `status`, `civil_status`) VALUES
	(1, 'admin', 'admin', 'admin', 'admin', 'admin@email.com', 'area 1', 100000, 1, 1, 'active', 'single'),
	(7, 'client1', 'client1', 'client1', 'client1', 'client1@email.com', 'area 2', 1000000, 5, 2, 'active', 'single'),
	(8, 'client2', 'client2', 'client2', 'client2', 'client2@email.com', 'area 2', 0, 5, 2, 'active', 'single'),
	(9, 'msr1', 'msr1', 'msr1', 'msr1', 'msr1@email.com', 'area 3', 0, 6, 3, 'active', 'single'),
	(10, 'msr2', 'msr2', 'msr2', 'msr2', 'msr2@email.com', 'area 2', 0, 6, 3, 'active', 'single'),
	(14, 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman', 'warehouseman@email.com', 'area 1', 0, 3, 2, 'active', 'single'),
	(15, 'accountant', 'accountant', 'accountant', 'accountant', 'accountant@email.com', 'sample area', 100000, 2, 2, 'active', 'single');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
