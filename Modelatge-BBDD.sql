-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Vols
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Vols
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vols` DEFAULT CHARACTER SET utf8 ;
USE `Vols` ;

-- -----------------------------------------------------
-- Table `Vols`.`Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Plane` (
  `idPlane` INT NOT NULL,
  `Capacitat` INT NULL,
  `model` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlane`),
  UNIQUE INDEX `idPlane_UNIQUE` (`idPlane` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Seat` (
  `idSeat` INT NOT NULL,
  `Plane_idPlane` INT NOT NULL,
  PRIMARY KEY (`idSeat`, `Plane_idPlane`),
  UNIQUE INDEX `idSeat_UNIQUE` (`idSeat` ASC) VISIBLE,
  INDEX `fk_Seat_Plane_idx` (`Plane_idPlane` ASC) VISIBLE,
  CONSTRAINT `fk_Seat_Plane`
    FOREIGN KEY (`Plane_idPlane`)
    REFERENCES `Vols`.`Plane` (`idPlane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Quadres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Quadres` (
  `idQuadres` INT NOT NULL,
  `Preu` INT NULL,
  `Autor` VARCHAR(45) NULL,
  PRIMARY KEY (`idQuadres`),
  UNIQUE INDEX `idQuadres_UNIQUE` (`idQuadres` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Comprador` (
  `idComprador` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Stock quadres_idQuadres` INT NOT NULL,
  PRIMARY KEY (`idComprador`),
  UNIQUE INDEX `idComprador_UNIQUE` (`idComprador` ASC) VISIBLE,
  INDEX `fk_Comprador_Stock quadres1_idx` (`Stock quadres_idQuadres` ASC) VISIBLE,
  CONSTRAINT `fk_Comprador_Stock quadres1`
    FOREIGN KEY (`Stock quadres_idQuadres`)
    REFERENCES `Vols`.`Quadres` (`idQuadres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Videos` (
  `idVideos` INT NOT NULL,
  `Descripció` MEDIUMTEXT NULL,
  `Titol` VARCHAR(45) NULL,
  `URL` VARCHAR(45) NULL,
  PRIMARY KEY (`idVideos`),
  UNIQUE INDEX `idVideos_UNIQUE` (`idVideos` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Usuari` (
  `idUsuari` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Contraseña` VARCHAR(45) NULL,
  `Videos_idVideos` INT NOT NULL,
  PRIMARY KEY (`idUsuari`),
  INDEX `fk_Usuari_Videos1_idx` (`Videos_idVideos` ASC) VISIBLE,
  CONSTRAINT `fk_Usuari_Videos1`
    FOREIGN KEY (`Videos_idVideos`)
    REFERENCES `Vols`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Autor` (
  `Direcció` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Direcció`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`usuari` (
  `idfactura` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `Cotrasenya` VARCHAR(45) NULL,
  PRIMARY KEY (`idfactura`),
  UNIQUE INDEX `idusuari_UNIQUE` (`idfactura` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Llibres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Llibres` (
  `idLlibres` VARCHAR(45) NOT NULL,
  `Venta` INT NULL,
  `Disponibles` INT NULL,
  `preu` FLOAT NULL,
  `Autor_Direcció` VARCHAR(45) NOT NULL,
  `usuari_idfactura` INT NOT NULL,
  PRIMARY KEY (`idLlibres`),
  UNIQUE INDEX `idLlibres_UNIQUE` (`idLlibres` ASC) VISIBLE,
  INDEX `fk_Llibres_Autor1_idx` (`Autor_Direcció` ASC) VISIBLE,
  INDEX `fk_Llibres_usuari1_idx` (`usuari_idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_Llibres_Autor1`
    FOREIGN KEY (`Autor_Direcció`)
    REFERENCES `Vols`.`Autor` (`Direcció`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Llibres_usuari1`
    FOREIGN KEY (`usuari_idfactura`)
    REFERENCES `Vols`.`usuari` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
