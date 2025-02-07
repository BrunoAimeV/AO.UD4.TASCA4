-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2a` ;
USE `Exercici2a` ;

-- -----------------------------------------------------
-- Table `Exercici2a`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2a`.`Pacient` (
  `idPacient` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  `Direcció` VARCHAR(45) NULL,
  `NumeroSS` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2a`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2a`.`Metge` (
  `idMetge` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Especialitat` VARCHAR(45) NULL,
  `Carrec` VARCHAR(45) NULL,
  `Numero_colegiat` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetge`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2a`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2a`.`Consulta` (
  `idConsulta` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Planta` VARCHAR(45) NULL,
  `Pacient_idPacient` INT NOT NULL,
  `Metge_idMetge` INT NOT NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_idPacient` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_idMetge` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_idPacient`)
    REFERENCES `Exercici2a`.`Pacient` (`idPacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_idMetge`)
    REFERENCES `Exercici2a`.`Metge` (`idMetge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
