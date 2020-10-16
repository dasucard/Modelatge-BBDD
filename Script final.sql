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
  `Nom` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Contrasenya` VARCHAR(45) NULL,
  `Procedencia` TINYTEXT NULL,
  `Fotografies_idCodi` INT NOT NULL,
  PRIMARY KEY (`idUsuari`),
  INDEX `fk_Usuari_Fotografies1_idx` (`Fotografies_idCodi` ASC) VISIBLE,
  UNIQUE INDEX `idUsuari_UNIQUE` (`idUsuari` ASC) VISIBLE,
  CONSTRAINT `fk_Usuari_Fotografies1`
    FOREIGN KEY (`Fotografies_idCodi`)
    REFERENCES `Vols`.`Fotografies` (`idCodi`)
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


-- -----------------------------------------------------
-- Table `Vols`.`Fotografies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Fotografies` (
  `idCodi` INT NOT NULL,
  `URL` VARCHAR(45) NULL,
  `Lloc` VARCHAR(45) NULL,
  PRIMARY KEY (`idCodi`),
  UNIQUE INDEX `idCodi_UNIQUE` (`idCodi` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Usuari` (
  `idUsuari` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Contrasenya` VARCHAR(45) NULL,
  `Procedencia` TINYTEXT NULL,
  `Fotografies_idCodi` INT NOT NULL,
  PRIMARY KEY (`idUsuari`),
  INDEX `fk_Usuari_Fotografies1_idx` (`Fotografies_idCodi` ASC) VISIBLE,
  UNIQUE INDEX `idUsuari_UNIQUE` (`idUsuari` ASC) VISIBLE,
  CONSTRAINT `fk_Usuari_Fotografies1`
    FOREIGN KEY (`Fotografies_idCodi`)
    REFERENCES `Vols`.`Fotografies` (`idCodi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Suplier_has_adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Suplier_has_adress` (
  `idSuplier_has_adress` INT NOT NULL,
  PRIMARY KEY (`idSuplier_has_adress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `Telefon` INT NULL,
  `Fax` VARCHAR(45) NULL,
  `NIF` INT NULL,
  `Suplier_has_adress_idSuplier_has_adress` INT NOT NULL,
  PRIMARY KEY (`idProveedor`, `Suplier_has_adress_idSuplier_has_adress`),
  INDEX `fk_Proveedor_Suplier_has_adress1_idx` (`Suplier_has_adress_idSuplier_has_adress` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_Suplier_has_adress1`
    FOREIGN KEY (`Suplier_has_adress_idSuplier_has_adress`)
    REFERENCES `Vols`.`Suplier_has_adress` (`idSuplier_has_adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Clients` (
  `Nom` INT NOT NULL,
  `Adreça_postal` VARCHAR(45) NULL,
  `Teléfon` INT NULL,
  `Correu` VARCHAR(45) NULL,
  `Data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Ulleres` (
  `Marca` VARCHAR(45) NOT NULL,
  `Graduació` INT NULL,
  `Tipus_Montura` SET("flotant", "pasta", "metal-lica") NULL,
  `Color_Montura` VARCHAR(45) NULL,
  `Color_Vidre` VARCHAR(45) NULL,
  `Preu` FLOAT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `Clients_Nom` INT NOT NULL,
  PRIMARY KEY (`Marca`, `Clients_Nom`),
  INDEX `fk_Ulleres_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_Ulleres_Clients1_idx` (`Clients_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `Vols`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ulleres_Clients1`
    FOREIGN KEY (`Clients_Nom`)
    REFERENCES `Vols`.`Clients` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vols`.`Adreça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vols`.`Adreça` (
  `idAdreça` INT NOT NULL AUTO_INCREMENT,
  `Carrer` VARCHAR(45) NULL,
  `Num` INT NULL,
  `Pis` INT NULL,
  `Porta` INT NULL,
  `Ciutat` VARCHAR(45) NULL,
  `Codipostal` INT NULL,
  `Pais` VARCHAR(45) NULL,
  `Suplier_has_adress_idSuplier_has_adress` INT NOT NULL,
  PRIMARY KEY (`idAdreça`, `Suplier_has_adress_idSuplier_has_adress`),
  UNIQUE INDEX `idAdreça_UNIQUE` (`idAdreça` ASC) VISIBLE,
  INDEX `fk_Adreça_Suplier_has_adress1_idx` (`Suplier_has_adress_idSuplier_has_adress` ASC) VISIBLE,
  CONSTRAINT `fk_Adreça_Suplier_has_adress1`
    FOREIGN KEY (`Suplier_has_adress_idSuplier_has_adress`)
    REFERENCES `Vols`.`Suplier_has_adress` (`idSuplier_has_adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
