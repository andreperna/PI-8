-- MySQL Script generated by MySQL Workbench
-- Mon May 16 00:16:30 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cod_ibge` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  UNIQUE INDEX `uf_UNIQUE` (`uf` ASC) VISIBLE,
  UNIQUE INDEX `cod_ibge_UNIQUE` (`cod_ibge` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cod_ibge` VARCHAR(7) NOT NULL,
  `estado_id` INT NOT NULL,
  PRIMARY KEY (`id`, `estado_id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  INDEX `fk_cidade_estado_idx` (`estado_id` ASC) VISIBLE,
  UNIQUE INDEX `cod_ibge_UNIQUE` (`cod_ibge` ASC) VISIBLE,
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`estado_id`)
    REFERENCES `mydb`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rua` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bairro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cep` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NOT NULL,
  `cidade_id` INT NOT NULL,
  `bairro_id` INT NOT NULL,
  `rua_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cidade_id`, `bairro_id`, `rua_id`),
  UNIQUE INDEX `cep_UNIQUE` (`cep` ASC) VISIBLE,
  INDEX `fk_cep_cidade1_idx` (`cidade_id` ASC) VISIBLE,
  INDEX `fk_cep_bairro1_idx` (`bairro_id` ASC) VISIBLE,
  INDEX `fk_cep_rua1_idx` (`rua_id` ASC) VISIBLE,
  CONSTRAINT `fk_cep_cidade1`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `mydb`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cep_bairro1`
    FOREIGN KEY (`bairro_id`)
    REFERENCES `mydb`.`bairro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cep_rua1`
    FOREIGN KEY (`rua_id`)
    REFERENCES `mydb`.`rua` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `cep_id` INT NOT NULL,
  `end_numero` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`, `cep_id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_pessoa_cep1_idx` (`cep_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_cep1`
    FOREIGN KEY (`cep_id`)
    REFERENCES `mydb`.`cep` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ocorrencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_id` INT NOT NULL,
  `data_ocorrencia` DATE NULL,
  PRIMARY KEY (`id`, `pessoa_id`),
  INDEX `fk_ocorrencia_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_ocorrencia_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `mydb`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
