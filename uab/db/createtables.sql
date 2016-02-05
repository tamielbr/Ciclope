-- MySQL Script generated by MySQL Workbench
-- Qui 04 Fev 2016 10:57:28 BRST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
-- Schema ciclope
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ciclope
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ciclope` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ciclope` ;

-- -----------------------------------------------------
-- Table `ciclope`.`ipes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ciclope`.`ipes` ;

CREATE TABLE IF NOT EXISTS `ciclope`.`ipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` VARCHAR(10) NOT NULL,
  `lat` DECIMAL(11,8) NOT NULL,
  `lng` DECIMAL(11,8) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ciclope`.`polos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ciclope`.`polos` ;

CREATE TABLE IF NOT EXISTS `ciclope`.`polos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cidade` VARCHAR(100) NULL,
  `estado` VARCHAR(45) NULL,
  `lat` DECIMAL(11,8) NULL,
  `lng` DECIMAL(11,8) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ciclope`.`cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ciclope`.`cursos` ;

CREATE TABLE IF NOT EXISTS `ciclope`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ciclope`.`ipes_has_polos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ciclope`.`ipes_has_polos` ;

CREATE TABLE IF NOT EXISTS `ciclope`.`ipes_has_polos` (
  `ipes_id` INT NOT NULL,
  `polos_id` INT NOT NULL,
  PRIMARY KEY (`ipes_id`, `polos_id`),
  INDEX `fk_ipes_has_polos_polos1_idx` (`polos_id` ASC),
  INDEX `fk_ipes_has_polos_ipes_idx` (`ipes_id` ASC),
  CONSTRAINT `fk_ipes_has_polos_ipes`
    FOREIGN KEY (`ipes_id`)
    REFERENCES `ciclope`.`ipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ipes_has_polos_polos1`
    FOREIGN KEY (`polos_id`)
    REFERENCES `ciclope`.`polos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ciclope`.`ipes_has_polos_has_cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ciclope`.`ipes_has_polos_has_cursos` ;

CREATE TABLE IF NOT EXISTS `ciclope`.`ipes_has_polos_has_cursos` (
  `ipes_has_polos_ipes_id` INT NOT NULL,
  `ipes_has_polos_polos_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`ipes_has_polos_ipes_id`, `ipes_has_polos_polos_id`, `cursos_id`),
  INDEX `fk_ipes_has_polos_has_cursos_cursos1_idx` (`cursos_id` ASC),
  INDEX `fk_ipes_has_polos_has_cursos_ipes_has_polos1_idx` (`ipes_has_polos_ipes_id` ASC, `ipes_has_polos_polos_id` ASC),
  CONSTRAINT `fk_ipes_has_polos_has_cursos_ipes_has_polos1`
    FOREIGN KEY (`ipes_has_polos_ipes_id` , `ipes_has_polos_polos_id`)
    REFERENCES `ciclope`.`ipes_has_polos` (`ipes_id` , `polos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ipes_has_polos_has_cursos_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `ciclope`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


