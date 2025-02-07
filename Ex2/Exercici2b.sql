-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Exercici2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2B` ;
USE `Exercici2B` ;

-- -----------------------------------------------------
-- Table `Exercici2B`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`actor` (
  `actor_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`),
  INDEX `idx_actor_last_name` (`last_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`country` (
  `country_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(50) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`city` (
  `city_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NOT NULL,
  `country_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  INDEX `idx_fk_country_id` (`country_id` ASC),
  CONSTRAINT `fk_city_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `Exercici2B`.`country` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`address` (
  `address_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `district` VARCHAR(20) NOT NULL,
  `city_id` SMALLINT UNSIGNED NOT NULL,
  `postal_code` VARCHAR(10) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  INDEX `idx_fk_city_id` (`city_id` ASC),
  CONSTRAINT `fk_address_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `Exercici2B`.`city` (`city_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`category` (
  `category_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`staff` (
  `staff_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `picture` BLOB NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `store_id` TINYINT UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT TRUE,
  `username` VARCHAR(16) NOT NULL,
  `password` VARCHAR(40) BINARY NULL DEFAULT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`),
  INDEX `idx_fk_store_id` (`store_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  CONSTRAINT `fk_staff_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `Exercici2B`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `Exercici2B`.`address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`store` (
  `store_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `manager_staff_id` TINYINT UNSIGNED NOT NULL,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `idx_unique_manager` (`manager_staff_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  CONSTRAINT `fk_store_staff`
    FOREIGN KEY (`manager_staff_id`)
    REFERENCES `Exercici2B`.`staff` (`staff_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_store_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `Exercici2B`.`address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`customer` (
  `customer_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` TINYINT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT TRUE,
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  INDEX `idx_fk_store_id` (`store_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  INDEX `idx_last_name` (`last_name` ASC),
  CONSTRAINT `fk_customer_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `Exercici2B`.`address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `Exercici2B`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table storing all customers. Holds foreign keys to the address table and the store table where this customer is registered.\n\nBasic information about the customer like first and last name are stored in the table itself. Same for the date the record was created and when the information was last updated.';


-- -----------------------------------------------------
-- Table `Exercici2B`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`language` (
  `language_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` CHAR(20) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`film` (
  `film_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `release_year` YEAR NULL,
  `language_id` TINYINT UNSIGNED NOT NULL,
  `original_language_id` TINYINT UNSIGNED NULL DEFAULT NULL,
  `rental_duration` TINYINT UNSIGNED NOT NULL DEFAULT 3,
  `rental_rate` DECIMAL(4,2) NOT NULL DEFAULT 4.99,
  `length` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `replacement_cost` DECIMAL(5,2) NOT NULL DEFAULT 19.99,
  `rating` ENUM('G','PG','PG-13','R','NC-17') NULL DEFAULT 'G',
  `special_features` SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `idx_title` (`title` ASC),
  INDEX `idx_fk_language_id` (`language_id` ASC),
  INDEX `idx_fk_original_language_id` (`original_language_id` ASC),
  PRIMARY KEY (`film_id`),
  CONSTRAINT `fk_film_language`
    FOREIGN KEY (`language_id`)
    REFERENCES `Exercici2B`.`language` (`language_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original`
    FOREIGN KEY (`original_language_id`)
    REFERENCES `Exercici2B`.`language` (`language_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`film_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`film_actor` (
  `actor_id` SMALLINT UNSIGNED NOT NULL,
  `film_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `idx_fk_film_id` (`film_id` ASC),
  INDEX `fk_film_actor_actor_idx` (`actor_id` ASC),
  CONSTRAINT `fk_film_actor_actor`
    FOREIGN KEY (`actor_id`)
    REFERENCES `Exercici2B`.`actor` (`actor_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `Exercici2B`.`film` (`film_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`film_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`film_category` (
  `film_id` SMALLINT UNSIGNED NOT NULL,
  `category_id` TINYINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`, `category_id`),
  INDEX `fk_film_category_category_idx` (`category_id` ASC),
  INDEX `fk_film_category_film_idx` (`film_id` ASC),
  CONSTRAINT `fk_film_category_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `Exercici2B`.`film` (`film_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `Exercici2B`.`category` (`category_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`film_text`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`film_text` (
  `film_id` SMALLINT UNSIGNED NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`film_id`),
  FULLTEXT INDEX `idx_title_description` (`title`, `description`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2B`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`inventory` (
  `inventory_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` SMALLINT UNSIGNED NOT NULL,
  `store_id` TINYINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  INDEX `idx_fk_film_id` (`film_id` ASC),
  INDEX `idx_store_id_film_id` (`store_id` ASC, `film_id` ASC),
  INDEX `fk_inventory_store_idx` (`store_id` ASC),
  CONSTRAINT `fk_inventory_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `Exercici2B`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `Exercici2B`.`film` (`film_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`rental` (
  `rental_id` INT NOT NULL AUTO_INCREMENT,
  `rental_date` DATETIME NOT NULL,
  `inventory_id` MEDIUMINT UNSIGNED NOT NULL,
  `customer_id` SMALLINT UNSIGNED NOT NULL,
  `return_date` DATETIME NULL,
  `staff_id` TINYINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`),
  UNIQUE INDEX `idx_rental` (`rental_date` ASC, `inventory_id` ASC, `customer_id` ASC),
  INDEX `idx_fk_inventory_id` (`inventory_id` ASC),
  INDEX `idx_fk_customer_id` (`customer_id` ASC),
  INDEX `idx_fk_staff_id` (`staff_id` ASC),
  CONSTRAINT `fk_rental_staff`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Exercici2B`.`staff` (`staff_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_inventory`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `Exercici2B`.`inventory` (`inventory_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Exercici2B`.`customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`payment` (
  `payment_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` SMALLINT UNSIGNED NOT NULL,
  `staff_id` TINYINT UNSIGNED NOT NULL,
  `rental_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  INDEX `idx_fk_staff_id` (`staff_id` ASC),
  INDEX `idx_fk_customer_id` (`customer_id` ASC),
  INDEX `fk_payment_rental_idx` (`rental_id` ASC),
  CONSTRAINT `fk_payment_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `Exercici2B`.`rental` (`rental_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Exercici2B`.`customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_staff`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Exercici2B`.`staff` (`staff_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Exercici2B`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`Cine` (
  `idCine` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Projecció_Cine` INT NOT NULL,
  PRIMARY KEY (`idCine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2B`.`Película`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`Película` (
  `idPelícula` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Clasificació` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Durada` VARCHAR(45) NULL,
  `Projecció_Cine` INT NOT NULL,
  PRIMARY KEY (`idPelícula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2B`.`Tipus entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`Tipus entrada` (
  `idTarifa` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `Projecció_Cine` INT NOT NULL,
  PRIMARY KEY (`idTarifa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2B`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2B`.`Projecció` (
  `Cine` INT NOT NULL,
  `Hora` VARCHAR(45) NULL,
  `Sala` VARCHAR(45) NULL,
  `Cine_idCine` INT NOT NULL,
  `Película_idPelícula` INT NOT NULL,
  `Tipus entrada_idTarifa` INT NOT NULL,
  PRIMARY KEY (`Cine`),
  INDEX `fk_Projecció_Cine1_idx` (`Cine_idCine` ASC),
  INDEX `fk_Projecció_Película1_idx` (`Película_idPelícula` ASC),
  INDEX `fk_Projecció_Tipus entrada1_idx` (`Tipus entrada_idTarifa` ASC),
  CONSTRAINT `fk_Projecció_Cine1`
    FOREIGN KEY (`Cine_idCine`)
    REFERENCES `Exercici2B`.`Cine` (`idCine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Película1`
    FOREIGN KEY (`Película_idPelícula`)
    REFERENCES `Exercici2B`.`Película` (`idPelícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Tipus entrada1`
    FOREIGN KEY (`Tipus entrada_idTarifa`)
    REFERENCES `Exercici2B`.`Tipus entrada` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
