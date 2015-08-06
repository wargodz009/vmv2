ALTER TABLE `ar_old` ADD COLUMN `msr_client_id`;
ALTER TABLE `ar_old` DROP COLUMN `client_id`, DROP FOREIGN KEY `FK_ar_old_user`, DROP FOREIGN KEY `FK_ar_old_msr_client`;
ALTER TABLE `order_return` DROP FOREIGN KEY `FK_ar_old_user_2`;
ALTER TABLE `order_return` DROP INDEX `FK_ar_old_user_2`;

CREATE TABLE `acknowledgement_reciept` (
	`reciept_id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`date` DATE NOT NULL,
	`remarks` TINYBLOB NOT NULL,
	PRIMARY KEY (`reciept_id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;

INSERT INTO `action` (`name`, `module`, `show_on_menu`, `parent`) VALUES ('acknowlegement reciept', 'acknowledge', 0, 29);
	
