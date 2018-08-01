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

CREATE TABLE `football_ratings`.`c_round` (
  `id` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `football_ratings`.`c_round` (`id`, `name`)
VALUES  (1,'Round 1'), (2,'Round 2'), (3,'Round 3'), (4,'Round 4'), (5,'Round 5'), (6,'Round 6'), (7,'Round 7'), (8,'Round 8'),
        (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'),
        (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'),
        (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'),
        (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'),
        (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'),
        (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1'), (1,'Round 1');

CREATE TABLE `football_ratings`.`c_round` (
  `id` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;