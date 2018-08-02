--
-- Author : Sargis Sulyan
-- Description : Create schema
--

CREATE DATABASE IF NOT EXISTS football_ratings;

--
-- Author : Sargis Sulyan
-- Description : Create user table
--
DROP TABLE IF EXISTS `football_ratings`.`user`;

CREATE TABLE `football_ratings`.`user` (
  `id`            INT         NOT NULL AUTO_INCREMENT,
  `first_name`    VARCHAR(30) NOT NULL,
  `last_name`     VARCHAR(30) NOT NULL,
  `nickname`      VARCHAR(15) NULL,
  `rating`        INT(11)     NOT NULL,
  `password_hash` VARCHAR(64) NOT NULL,
  `username`      VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `football_ratings`.`user` (`id`, `first_name`, `last_name`, `nickname`, `rating`, `password_hash`, `username`)
VALUES (1, 'Admin', 'User', 'admin', '1900', 'admin', 'admin');


DROP TABLE IF EXISTS `football_ratings`.`c_round`;
CREATE TABLE `football_ratings`.`c_round` (
  `id`   INT         NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `football_ratings`.`c_round` (`id`, `name`)
VALUES (1, 'Round 1'), (2, 'Round 2'), (3, 'Round 3'), (4, 'Round 4'), (5, 'Round 5'), (6, 'Round 6'), (7, 'Round 7'),
  (8, 'Round 8'),
  (9, 'Round 9'), (10, 'Round 10'), (11, 'Round 11'), (12, 'Round 12'), (13, 'Round 13'), (14, 'Round 14'),
  (15, 'Round 15'), (16, 'Round 16'),
  (17, 'Round 17'), (18, 'Round 18'), (19, 'Round 19'), (20, 'Round 20'), (21, 'Round 21'), (22, 'Round 22'),
  (23, 'Round 23'), (24, 'Round 24'),
  (25, 'Round 25'), (26, 'Round 26'), (27, 'Round 27'), (28, 'Round 28'), (29, 'Round 29'), (30, 'Round 30'),
  (31, 'Round 31'), (32, 'Round 32'),
  (33, 'Round 33'), (34, 'Round 34'), (35, 'Round 35'), (36, 'Round 36'), (37, 'Round 37'), (38, 'Round 38'),
  (39, 'Round 39'), (40, 'Round 40'), (41, 'Round 41'),
  (42, 'Round 42'), (43, 'Round 43'), (44, 'Round 44'), (45, 'Round 45'), (46, 'Round 46'), (47, 'Round 47'),
  (48, 'Round 48'), (49, 'Round 49'),
  (50, 'Round 50'), (51, 'Round 51'), (52, 'Round 52'), (53, 'Round 53'), (54, 'Round 54'), (55, 'Round 55'),
  (56, 'Round 56'), (57, 'Round 57'),
  (58, 'Round 58'), (59, 'Round 59'), (60, 'Round 60');

DROP TABLE IF EXISTS `football_ratings`.`c_tournament_type`;
CREATE TABLE `football_ratings`.`c_tournament_type` (
  `id`   INT         NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `football_ratings`.`c_tournament_type` (`id`, `name`)
VALUES (1, 'Round-Robbin'), (2, 'Eliminated'), (3, 'Mixed');

DROP TABLE IF EXISTS `football_ratings`.`main_tournament`;
CREATE TABLE `football_ratings`.`main_tournament` (
  `id`              INT         NOT NULL AUTO_INCREMENT,
  `name`            VARCHAR(45) NOT NULL,
  `tournament_type` INT(11)     NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_main_tournament_type_idx` (`tournament_type` ASC),
  CONSTRAINT `fk_main_tournament_type`
  FOREIGN KEY (`tournament_type`)
  REFERENCES `football_ratings`.`c_tournament_type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `football_ratings`.`tournament`;
CREATE TABLE `football_ratings`.`tournament` (
  `id`                 INT         NOT NULL AUTO_INCREMENT,
  `name`               VARCHAR(45) NOT NULL,
  `main_tournament_id` INT(11)     NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tournament_main_tournament_idx` (`main_tournament_id` ASC),
  CONSTRAINT `fk_tournament_main_tournament`
  FOREIGN KEY (`main_tournament_id`)
  REFERENCES `football_ratings`.`main_tournament` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `football_ratings`.`match`;
CREATE TABLE `football_ratings`.`match` (
  `id`            INT         NOT NULL AUTO_INCREMENT,
  `player1`       INT(11)     NOT NULL,
  `player2`       INT(11)     NOT NULL,
  `tournament_id` INT(11)     NOT NULL,
  `round`         INT(11)     NOT NULL,
  `player1_goals` INT(11)     NOT NULL,
  `player2_goals` INT(11)     NOT NULL,
  `penalties1`    VARCHAR(45) NULL,
  `penalties2`    VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_match_user1_idx` (`player1` ASC),
  INDEX `fk_match_user2_idx` (`player2` ASC),
  INDEX `fk_match_tournament_idx` (`tournament_id` ASC),
  INDEX `fk_match_round_idx` (`round` ASC),
  CONSTRAINT `fk_match_user1`
  FOREIGN KEY (`player1`)
  REFERENCES `football_ratings`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_user2`
  FOREIGN KEY (`player2`)
  REFERENCES `football_ratings`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_tournament`
  FOREIGN KEY (`tournament_id`)
  REFERENCES `football_ratings`.`tournament` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_round`
  FOREIGN KEY (`round`)
  REFERENCES `football_ratings`.`c_round` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

