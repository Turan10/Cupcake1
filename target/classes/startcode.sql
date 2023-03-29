CREATE DATABASE IF NOT EXISTS `cupcake` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cupcake`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: cupcake
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `bottom`
--

DROP TABLE IF EXISTS `bottom`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bottom`
(
    `id`      int          NOT NULL AUTO_INCREMENT,
    `details` varchar(150) NOT NULL,
    `price`   int          NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottom`
--

LOCK TABLES `bottom` WRITE;
/*!40000 ALTER TABLE `bottom`
    DISABLE KEYS */;
INSERT INTO `bottom`
VALUES (6, 'Chocolate', 5),
       (15, 'Vanilla', 5),
       (16, 'Nutmeg', 5),
       (17, 'Pistacio', 6),
       (18, 'Almond', 7);
/*!40000 ALTER TABLE `bottom`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupcake`
--

DROP TABLE IF EXISTS `cupcake`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupcake`
(
    `id`       int NOT NULL AUTO_INCREMENT,
    `topId`    int NOT NULL,
    `bottomId` int NOT NULL,
    `orderId`  int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_Cupcake_Top1_idx` (`topId`),
    KEY `fk_Cupcake_Buttom1_idx` (`bottomId`),
    KEY `fk_cupcake_order1_idx` (`orderId`),
    CONSTRAINT `fk_Cupcake_Buttom1` FOREIGN KEY (`bottomId`) REFERENCES `bottom` (`id`),
    CONSTRAINT `fk_cupcake_order1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderID`),
    CONSTRAINT `fk_Cupcake_Top1` FOREIGN KEY (`topId`) REFERENCES `top` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupcake`
--

LOCK TABLES `cupcake` WRITE;
/*!40000 ALTER TABLE `cupcake`
    DISABLE KEYS */;
INSERT INTO `cupcake`
VALUES (1, 10, 15, 2),
       (2, 10, 6, 3),
       (3, 10, 6, 4),
       (4, 10, 16, 4),
       (5, 10, 18, 4),
       (6, 10, 6, 5),
       (7, 10, 16, 5),
       (8, 9, 6, 6),
       (9, 10, 16, 6),
       (10, 10, 6, 7),
       (11, 10, 15, 8),
       (12, 11, 15, 9),
       (13, 11, 15, 10),
       (14, 10, 15, 11),
       (15, 10, 15, 12),
       (16, 13, 15, 13),
       (17, 17, 18, 14),
       (18, 10, 17, 15),
       (19, 10, 15, 16),
       (20, 11, 15, 17),
       (21, 10, 15, 18),
       (22, 17, 15, 19),
       (23, 11, 15, 20),
       (24, 10, 6, 21),
       (25, 10, 16, 21),
       (26, 10, 18, 21),
       (27, 13, 18, 22),
       (28, 13, 17, 22),
       (29, 10, 18, 23),
       (30, 10, 17, 23),
       (31, 14, 18, 23),
       (32, 17, 17, 23),
       (33, 9, 17, 24),
       (34, 10, 18, 24),
       (35, 10, 18, 25),
       (36, 13, 17, 25),
       (37, 17, 18, 25),
       (38, 10, 6, 26),
       (39, 11, 15, 27),
       (40, 14, 16, 27);
/*!40000 ALTER TABLE `cupcake`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olsker`
--

DROP TABLE IF EXISTS `olsker`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olsker`
(
    `cvr`          int         NOT NULL,
    `name`         varchar(45) NOT NULL,
    `adress`       varchar(45) NOT NULL,
    `phone number` int         NOT NULL,
    `zip`          int         NOT NULL,
    `email`        varchar(45) NOT NULL,
    PRIMARY KEY (`cvr`),
    UNIQUE KEY `phone number_UNIQUE` (`phone number`),
    UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olsker`
--

LOCK TABLES `olsker` WRITE;
/*!40000 ALTER TABLE `olsker`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `olsker`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order`
(
    `created`    varchar(25) NOT NULL,
    `orderID`    int         NOT NULL AUTO_INCREMENT,
    `totalPrice` int         NOT NULL,
    `username`   varchar(45) DEFAULT NULL,
    PRIMARY KEY (`orderID`),
    KEY `fk_order_user1_idx` (`username`),
    CONSTRAINT `fk_order_user1` FOREIGN KEY (`username`) REFERENCES `user` (`userName`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order`
    DISABLE KEYS */;
INSERT INTO `order`
VALUES ('2023-03-28 00:23:15', 1, 10, NULL),
       ('2023-03-28 00:29:04', 2, 10, NULL),
       ('2023-03-28 00:30:11', 3, 10, NULL),
       ('2023-03-28 00:33:41', 4, 32, NULL),
       ('2023-03-28 01:00:59', 5, 20, NULL),
       ('2023-03-28 01:03:46', 6, 20, NULL),
       ('2023-03-28 01:04:39', 7, 10, NULL),
       ('2023-03-28 01:09:34', 8, 10, NULL),
       ('2023-03-28 01:11:00', 9, 10, NULL),
       ('2023-03-28 01:13:02', 10, 10, NULL),
       ('2023-03-28 01:14:55', 11, 10, NULL),
       ('2023-03-28 01:15:35', 12, 10, NULL),
       ('2023-03-28 02:12:05', 13, 11, NULL),
       ('2023-03-28 02:14:25', 14, 16, NULL),
       ('2023-03-28 02:17:21', 15, 11, NULL),
       ('2023-03-28 11:49:56', 16, 10, NULL),
       ('2023-03-28 12:07:54', 17, 10, NULL),
       ('2023-03-28 12:50:22', 18, 10, NULL),
       ('2023-03-28 13:28:13', 19, 14, NULL),
       ('2023-03-28 18:02:19', 20, 10, NULL),
       ('2023-03-28 22:38:33', 21, 32, NULL),
       ('2023-03-28 22:51:07', 22, 25, NULL),
       ('2023-03-28 22:59:40', 23, 52, NULL),
       ('2023-03-28 23:04:29', 24, 23, NULL),
       ('2023-03-28 23:05:34', 25, 40, NULL),
       ('2023-03-29 02:03:43', 26, 10, 'os'),
       ('2023-03-29 02:16:30', 27, 22, 'admin');
/*!40000 ALTER TABLE `order`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top`
--

DROP TABLE IF EXISTS `top`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top`
(
    `id`      int          NOT NULL AUTO_INCREMENT,
    `details` varchar(150) NOT NULL,
    `price`   int          NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top`
--

LOCK TABLES `top` WRITE;
/*!40000 ALTER TABLE `top`
    DISABLE KEYS */;
INSERT INTO `top`
VALUES (9, 'Chocolate', 5),
       (10, 'Blueberry', 5),
       (11, 'Rasberry', 5),
       (12, 'Crispy', 6),
       (13, 'Strawberry', 6),
       (14, 'Rum/Raisin', 7),
       (15, 'Orange', 8),
       (16, 'Lemon', 8),
       (17, 'Blue cheese', 9);
/*!40000 ALTER TABLE `top`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user`
(
    `iduser`   int         NOT NULL AUTO_INCREMENT,
    `userName` varchar(45) NOT NULL,
    `Password` varchar(45) NOT NULL,
    `role`     varchar(45) DEFAULT NULL,
    `balance`  int         DEFAULT '100',
    PRIMARY KEY (`iduser`),
    UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (7, 'os', '123', 'Customer', 305),
       (9, 'os123', '123', 'Customer', 100),
       (10, 'admin', 'admin', 'admin', 78);
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29  2:19:05
