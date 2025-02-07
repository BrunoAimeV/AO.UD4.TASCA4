-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici6` ;
USE `Exercici6` ;

-- -----------------------------------------------------
-- Table `Exercici6`.`Passatgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Passatgers` (
  `idPassatgers` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` VARCHAR(12) NULL,
  `Correu` VARCHAR(45) NULL,
  `Adreça` VARCHAR(100) NULL,
  PRIMARY KEY (`idPassatgers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Avio` (
  `idAvio` INT NOT NULL,
  `Identificador avio` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat de passatgers` VARCHAR(45) NULL,
  PRIMARY KEY (`idAvio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Vol` (
  `idVol` INT NOT NULL,
  `Numero vol` VARCHAR(45) NULL,
  `Avio` VARCHAR(45) NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `Data sortida` VARCHAR(45) NULL,
  `Data arrivada` VARCHAR(45) NULL,
  `Hora sortida` VARCHAR(45) NULL,
  `Hora arrivada` VARCHAR(45) NULL,
  `Avio_idAvio` INT NOT NULL,
  PRIMARY KEY (`idVol`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_idAvio` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_idAvio`)
    REFERENCES `Exercici6`.`Avio` (`idAvio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Passatger` VARCHAR(45) NULL,
  `data de reserva` VARCHAR(45) NULL,
  `Numero reserva` VARCHAR(45) NULL,
  `Numero de Vol` VARCHAR(45) NULL,
  `Import total` VARCHAR(45) NULL,
  `Passatgers_idPassatgers` INT NOT NULL,
  `Vol_idVol` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Passatgers_idx` (`Passatgers_idPassatgers` ASC) VISIBLE,
  INDEX `fk_Reserva_Vol1_idx` (`Vol_idVol` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Passatgers`
    FOREIGN KEY (`Passatgers_idPassatgers`)
    REFERENCES `Exercici6`.`Passatgers` (`idPassatgers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_idVol`)
    REFERENCES `Exercici6`.`Vol` (`idVol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
