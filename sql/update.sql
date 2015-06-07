INSERT INTO `vmv2`.`role` (`role_id`, `name`) VALUES (NULL, 'supervisor');
ALTER TABLE `orders` CHANGE `12_vat` `vat_12` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0';
INSERT INTO `vmv2`.`action` (`name`, `module`, `function`, `show_on_menu`, `parent`) VALUES ('Near Expire', 'inventory', 'near_expire', 1, 2);