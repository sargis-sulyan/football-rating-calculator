--
-- Author : Sargis Sulyan
-- Description : Create user table
--
DROP TABLE IF EXISTS `football_ratings`.`user`;

CREATE TABLE `football_ratings`.`user` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `nickname` VARCHAR(15) NULL,
  `rating` INT(11) NOT NULL,
  `password_hash` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `football_ratings`.`user` (`id`,`first_name`, `last_name`, `nickname`, `rating`, `password_hash`, `username`)
VALUES  (1,'Admin', 'User', 'admin', '1900', 'admin', 'admin');