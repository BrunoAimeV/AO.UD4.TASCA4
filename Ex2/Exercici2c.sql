-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2C` ;
USE `Exercici2C` ;

-- -----------------------------------------------------
-- Table `Exercici2C`.`Alumnat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Alumnat` (
  `idAlumnat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Correu` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlumnat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`matrícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`matrícula` (
  `idmatrícula` INT NOT NULL,
  `Cursacademic` VARCHAR(45) NULL,
  `preu` VARCHAR(45) NULL,
  `Alumnat_idAlumnat` INT NOT NULL,
  PRIMARY KEY (`idmatrícula`),
  INDEX `fk_matrícula_Alumnat_idx` (`Alumnat_idAlumnat` ASC) VISIBLE,
  CONSTRAINT `fk_matrícula_Alumnat`
    FOREIGN KEY (`Alumnat_idAlumnat`)
    REFERENCES `Exercici2C`.`Alumnat` (`idAlumnat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Assignatura` (
  `idAssignatura` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idAssignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Departament` (
  `idDepartament` INT NOT NULL,
  PRIMARY KEY (`idDepartament`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`Professor` (
  `idProfessor` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Departament_idDepartament` INT NOT NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_idDepartament` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_idDepartament`)
    REFERENCES `Exercici2C`.`Departament` (`idDepartament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2C`.`LineaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2C`.`LineaMatricula` (
  `idLinea de matricula` INT NOT NULL,
  `NumHores` VARCHAR(45) NULL,
  `matrícula_idmatrícula` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  `Assignatura_idAssignatura` INT NOT NULL,
  PRIMARY KEY (`idLinea de matricula`),
  INDEX `fk_LineaMatricula_matrícula1_idx` (`matrícula_idmatrícula` ASC) VISIBLE,
  INDEX `fk_LineaMatricula_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  INDEX `fk_LineaMatricula_Assignatura1_idx` (`Assignatura_idAssignatura` ASC) VISIBLE,
  CONSTRAINT `fk_LineaMatricula_matrícula1`
    FOREIGN KEY (`matrícula_idmatrícula`)
    REFERENCES `Exercici2C`.`matrícula` (`idmatrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LineaMatricula_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `Exercici2C`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LineaMatricula_Assignatura1`
    FOREIGN KEY (`Assignatura_idAssignatura`)
    REFERENCES `Exercici2C`.`Assignatura` (`idAssignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
