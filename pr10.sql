CREATE TABLE `market`.`booksinfo` (
  `id_book` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `second_name` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `publish_year` SMALLINT NULL DEFAULT NULL,
  `price` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `pages_count` SMALLINT UNSIGNED NOT NULL DEFAULT '0');

ALTER TABLE `market`.`booksinfo` 
CHANGE COLUMN `id_book` `id_book` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `market`.`booksinfo` 
ADD UNIQUE INDEX `title_first_name_second_name` (`title` ASC, `second_name` ASC, `first_name` ASC) VISIBLE;

ALTER TABLE `market`.`booksinfo` 
ADD COLUMN `coming_date` DATETIME NULL AFTER `pages_count`;

ALTER TABLE `market`.`booksinfo` 
DROP COLUMN `pages_count`;
