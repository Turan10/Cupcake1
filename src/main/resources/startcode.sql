-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Cupcake`;

-- -----------------------------------------------------
-- Table `Cupcake`.`Bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Bottom`
(
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `details` VARCHAR(150) NOT NULL,
    `price`   INT          NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Order`
(
    `created`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `orderID`    INT       NOT NULL,
    `customerID` INT       NOT NULL,
    `cupcakeId`  INT       NOT NULL,
    `totalPrice` INT       NOT NULL,
    PRIMARY KEY (`orderID`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`Top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Top`
(
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `details` VARCHAR(150) NOT NULL,
    `price`   INT          NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 9
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`Cupcake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Cupcake`
(
    `total price` INT NOT NULL,
    `id`          INT NOT NULL,
    `topId`       INT NOT NULL,
    `buttomId`    INT NOT NULL,
    `orderId`     INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_Cupcake_Order1_idx` (`orderId` ASC) VISIBLE,
    INDEX `fk_Cupcake_Top1_idx` (`topId` ASC) VISIBLE,
    INDEX `fk_Cupcake_Buttom1_idx` (`buttomId` ASC) VISIBLE,
    CONSTRAINT `fk_Cupcake_Buttom1`
        FOREIGN KEY (`buttomId`)
            REFERENCES `Cupcake`.`Bottom` (`id`),
    CONSTRAINT `fk_Cupcake_Order1`
        FOREIGN KEY (`orderId`)
            REFERENCES `Cupcake`.`Order` (`orderID`),
    CONSTRAINT `fk_Cupcake_Top1`
        FOREIGN KEY (`topId`)
            REFERENCES `Cupcake`.`Top` (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Customer`
(
    `firstName` VARCHAR(45) NOT NULL,
    `lastName`  VARCHAR(45) NOT NULL,
    `phone`     INT         NOT NULL,
    `email`     VARCHAR(45) NOT NULL,
    `orderID`   INT         NOT NULL,
    PRIMARY KEY (`phone`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    INDEX `fk_Customer_Order1_idx` (`orderID` ASC) VISIBLE,
    CONSTRAINT `fk_Customer_Order1`
        FOREIGN KEY (`orderID`)
            REFERENCES `Cupcake`.`Order` (`orderID`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`Olsker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Olsker`
(
    `cvr`          INT         NOT NULL,
    `name`         VARCHAR(45) NOT NULL,
    `adress`       VARCHAR(45) NOT NULL,
    `phone number` INT         NOT NULL,
    `zip`          INT         NOT NULL,
    `email`        VARCHAR(45) NOT NULL,
    PRIMARY KEY (`cvr`),
    UNIQUE INDEX `phone number_UNIQUE` (`phone number` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`employee`
(
    `firstName` VARCHAR(45) NULL     DEFAULT NULL,
    `cpr`       INT         NOT NULL,
    `status`    VARCHAR(45) NOT NULL,
    `cvr`       INT         NOT NULL DEFAULT '123456',
    `lastName`  VARCHAR(45) NOT NULL,
    PRIMARY KEY (`cpr`),
    UNIQUE INDEX `name_UNIQUE` (`firstName` ASC) VISIBLE,
    INDEX `fk_employee_Olsker_idx` (`cvr` ASC) VISIBLE,
    CONSTRAINT `fk_employee_Olsker`
        FOREIGN KEY (`cvr`)
            REFERENCES `Cupcake`.`Olsker` (`cvr`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cupcake`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`user`
(
    `iduser`         INT         NOT NULL AUTO_INCREMENT,
    `userName`       VARCHAR(45) NOT NULL,
    `Password`       VARCHAR(45) NOT NULL,
    `role`           VARCHAR(45) NULL DEFAULT NULL,
    `employee_cpr`   INT         NULL,
    `Customer_phone` INT         NULL,
    PRIMARY KEY (`iduser`),
    INDEX `fk_user_employee1_idx` (`employee_cpr` ASC) VISIBLE,
    INDEX `fk_user_Customer1_idx` (`Customer_phone` ASC) VISIBLE,
    CONSTRAINT `fk_user_employee1`
        FOREIGN KEY (`employee_cpr`)
            REFERENCES `Cupcake`.`employee` (`cpr`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_user_Customer1`
        FOREIGN KEY (`Customer_phone`)
            REFERENCES `Cupcake`.`Customer` (`phone`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 2
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
