-- MySQL Script generated by MySQL Workbench
-- Sat Jan 15 03:22:15 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wsb_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wsb_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wsb_schema` DEFAULT CHARACTER SET utf8 ;
USE `wsb_schema` ;

-- -----------------------------------------------------
-- Table `wsb_schema`.`product_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`product_table` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`product_table` (
  `product_id` INT NOT NULL,
  `product_description` VARCHAR(300) NULL,
  `price` FLOAT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`warehouse_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`warehouse_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`warehouse_tab` (
  `warehouse_id` INT NOT NULL,
  `warehouse_desc` VARCHAR(300) NULL,
  PRIMARY KEY (`warehouse_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`stock_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`stock_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`stock_tab` (
  `warehouse_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `qty` INT NULL,
  PRIMARY KEY (`product_id`, `warehouse_id`),
  INDEX `fk_stock_tab_warehouse_tab1_idx` (`warehouse_id` ASC) VISIBLE,
  INDEX `fk_stock_tab_product_table1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_stock_tab_warehouse_tab1`
    FOREIGN KEY (`warehouse_id`)
    REFERENCES `wsb_schema`.`warehouse_tab` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_tab_product_table1`
    FOREIGN KEY (`product_id`)
    REFERENCES `wsb_schema`.`product_table` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`country_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`country_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`country_tab` (
  `iso_country` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`iso_country`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`address_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`address_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`address_tab` (
  `iso_country` VARCHAR(2) NOT NULL,
  `address_id` INT NOT NULL,
  `street` VARCHAR(300) NULL,
  `city` VARCHAR(300) NULL,
  `addr_1` VARCHAR(300) NULL,
  `addr_2` VARCHAR(300) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_address_country_tab1_idx` (`iso_country` ASC) VISIBLE,
  CONSTRAINT `fk_address_country_tab1`
    FOREIGN KEY (`iso_country`)
    REFERENCES `wsb_schema`.`country_tab` (`iso_country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`customer_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`customer_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`customer_tab` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(400) NULL,
  `customer_desc` VARCHAR(4000) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_tab_address_tab1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_tab_address_tab1`
    FOREIGN KEY (`address_id`)
    REFERENCES `wsb_schema`.`address_tab` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`order_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`order_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`order_tab` (
  `order_id` INT NOT NULL,
  `order_desc` VARCHAR(300) NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order__tab_customer_tab1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order__tab_customer_tab1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `wsb_schema`.`customer_tab` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`order_line_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`order_line_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`order_line_tab` (
  `order_line_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `qty` INT NULL,
  `line_desc` VARCHAR(300) NULL,
  PRIMARY KEY (`order_line_id`, `order_id`, `product_id`),
  INDEX `fk_order_line_tab_order__tab1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_line_tab_product_table1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_line_tab_order__tab1`
    FOREIGN KEY (`order_id`)
    REFERENCES `wsb_schema`.`order_tab` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_line_tab_product_table1`
    FOREIGN KEY (`product_id`)
    REFERENCES `wsb_schema`.`product_table` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`invoice_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`invoice_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`invoice_tab` (
  `invoice_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoice_tab_order__tab1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_tab_order__tab1`
    FOREIGN KEY (`order_id`)
    REFERENCES `wsb_schema`.`order_tab` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wsb_schema`.`payment_tab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wsb_schema`.`payment_tab` ;

CREATE TABLE IF NOT EXISTS `wsb_schema`.`payment_tab` (
  `invoice_id` INT NOT NULL,
  `payment_value` DECIMAL NULL,
  `payment_date` DATE NULL,
  `payment_way` VARCHAR(45) NULL,
  PRIMARY KEY (`invoice_id`),
  CONSTRAINT `fk_payment_tab_invoice_tab1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `wsb_schema`.`invoice_tab` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
