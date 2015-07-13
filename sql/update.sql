CREATE TABLE `rgs` (
	`rgs_id` INT NULL,
	`dr_si_num` VARCHAR(50) NULL,
	`amount` VARCHAR(50) NULL,
	`date` DATE NULL,
	`status` TINYINT NULL
);
INSERT INTO `vmv2`.`action` (`name`, `module`, `parent`) VALUES ('rgs', 'rgs', 29);
