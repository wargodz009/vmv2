CREATE TABLE `rgs` (
	`rgs_id` INT NULL,
	`dr_si_num` VARCHAR(50) NULL,
	`amount` VARCHAR(50) NULL,
	`date` DATE NULL,
	`status` TINYINT NULL
);

INSERT INTO `action` (`name`, `module`, `parent`) VALUES ('rgs', 'rgs', 29);

ALTER TABLE `order_return`
	ADD COLUMN `msr_id` INT(11) NULL AFTER `status`,
	ADD CONSTRAINT `FK_ar_old_user_2` FOREIGN KEY (`msr_id`) REFERENCES `user` (`user_id`),
	ADD COLUMN `credit_memo` VARCHAR(50) NULL DEFAULT NULL AFTER `msr_id`,
	ADD COLUMN `replacement` VARCHAR(50) NULL DEFAULT NULL AFTER `credit_memo`,
	ADD COLUMN `remarks` VARCHAR(50) NULL DEFAULT NULL AFTER `replacement`;