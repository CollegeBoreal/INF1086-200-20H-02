-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema etudiants
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema etudiants
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `etudiants` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `etudiants` ;

-- -----------------------------------------------------
-- Table `etudiants`.`DEVOIRS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etudiants`.`DEVOIRS` (
  `devoir` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(30) NOT NULL,
  `evaluation` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`devoir`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etudiants`.`PROGRAMMES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etudiants`.`PROGRAMMES` (
  `programme` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(30) NOT NULL,
  `nombre_annee` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`programme`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etudiants`.`ETUDIANTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etudiants`.`ETUDIANTS` (
  `etudiant` INT(11) NOT NULL AUTO_INCREMENT,
  `initiale` VARCHAR(30) NOT NULL,
  `nom` VARCHAR(30) NOT NULL,
  `programme` INT(11) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`etudiant`),
  INDEX `programme` (`programme` ASC) VISIBLE,
  CONSTRAINT `ETUDIANTS_ibfk_1`
    FOREIGN KEY (`programme`)
    REFERENCES `etudiants`.`PROGRAMMES` (`programme`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etudiants`.`NOTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etudiants`.`NOTES` (
  `etudiant` INT(11) NOT NULL,
  `devoir` INT(11) NOT NULL,
  `note` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`etudiant`, `devoir`),
  INDEX `devoir` (`devoir` ASC) VISIBLE,
  CONSTRAINT `NOTES_ibfk_1`
    FOREIGN KEY (`etudiant`)
    REFERENCES `etudiants`.`ETUDIANTS` (`etudiant`),
  CONSTRAINT `NOTES_ibfk_2`
    FOREIGN KEY (`devoir`)
    REFERENCES `etudiants`.`DEVOIRS` (`devoir`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `etudiants`.`import_students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `etudiants`.`import_students` (
  `doc` JSON NULL DEFAULT NULL,
  `_id` VARBINARY(32) GENERATED ALWAYS AS (json_unquote(json_extract(`doc`,_utf8mb4'$._id'))) STORED,
  PRIMARY KEY (`_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
