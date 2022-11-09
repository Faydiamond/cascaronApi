CREATE DATABASE  IF NOT EXISTS `ufc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ufc`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ufc
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(150) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Colombia','2022-10-03 17:02:17'),(2,'Argentina','2022-10-03 17:02:17'),(3,'Irlanda','2022-10-08 01:37:04'),(4,'Canada','2022-10-08 01:37:04'),(5,'Usa','2022-10-08 01:37:04'),(6,'Francia','2022-10-08 01:37:04'),(7,'Brasil','2022-10-08 01:37:04'),(8,'Peru','2022-10-08 02:16:40'),(9,'Mexico','2022-10-08 02:22:05'),(10,'Inglaterra','2022-10-08 02:26:33'),(11,'Australia','2022-10-08 02:29:50'),(12,'China','2022-10-08 02:34:24');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id_division` int(11) NOT NULL AUTO_INCREMENT,
  `division` varchar(85) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `weight` float NOT NULL,
  PRIMARY KEY (`id_division`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Peso paja','2022-10-08 02:03:35','2022-10-08 02:03:35',52.3),(2,'Peso mosca','2022-10-08 02:03:35','2022-10-08 02:03:35',56.7),(3,'Peso gallo','2022-10-08 02:03:35','2022-10-08 02:03:35',61.2),(4,'Peso pluma','2022-10-08 02:03:35','2022-10-08 02:03:35',65.8),(5,'Peso ligero','2022-10-08 02:03:35','2022-10-08 02:03:35',70.3),(6,'Peso wélter','2022-10-08 02:03:35','2022-10-08 02:03:35',77.1),(7,'Peso medio','2022-10-08 02:03:35','2022-10-08 02:03:35',83.9),(8,'Peso semipesado','2022-10-08 02:03:35','2022-10-08 02:03:35',93),(9,'Peso pesado','2022-10-08 02:03:35','2022-10-08 02:03:35',120.2);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fighters`
--

DROP TABLE IF EXISTS `fighters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fighters` (
  `id_fighter` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `name2` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `lastname2` varchar(50) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `age` int(11) DEFAULT NULL,
  `fk_countri` int(11) DEFAULT NULL,
  `fk_division` int(11) DEFAULT NULL,
  `fk_gender` int(11) DEFAULT NULL,
  `Nickname` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id_fighter`),
  KEY `fk_countri` (`fk_countri`),
  KEY `fk_division` (`fk_division`),
  KEY `fk_gender` (`fk_gender`),
  CONSTRAINT `fighters_ibfk_1` FOREIGN KEY (`fk_countri`) REFERENCES `countries` (`id_country`),
  CONSTRAINT `fighters_ibfk_2` FOREIGN KEY (`fk_division`) REFERENCES `divisions` (`id_division`),
  CONSTRAINT `fighters_ibfk_3` FOREIGN KEY (`fk_gender`) REFERENCES `genders` (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fighters`
--

LOCK TABLES `fighters` WRITE;
/*!40000 ALTER TABLE `fighters` DISABLE KEYS */;
INSERT INTO `fighters` VALUES (1,'CONOR ',NULL,'MCGREGOR',NULL,'2022-10-08 02:15:00',34,3,5,1,'THE NOTORIOUS'),(2,'VALENTINA ',NULL,'SHEVCHENKO',NULL,'2022-10-08 02:17:12',34,8,3,2,'BULLET'),(3,'MICHEL ',NULL,'PEREIRA',NULL,'2022-10-08 02:18:37',29,7,6,1,'DEMOLIDOR'),(4,'TONY ',NULL,'FERGUSON',NULL,'2022-10-08 02:21:29',38,5,5,1,'EL CUCUY'),(5,'YAIR ',NULL,'RODRIGUEZ',NULL,'2022-10-08 02:23:31',30,9,4,1,'EL PANTERA'),(6,'FRANKIE ',NULL,'EDGAR',NULL,'2022-10-08 02:26:43',40,5,3,1,'THE ANSWER'),(7,'LEON ',NULL,'EDWARDS',NULL,'2022-10-08 02:26:43',31,10,6,1,'ROCKY'),(8,'CORY ',NULL,'SANDHAGEN',NULL,'2022-10-08 02:28:42',30,5,3,1,NULL),(9,'ROBERT ',NULL,'WHITTAKER',NULL,'2022-10-08 02:30:16',31,11,7,1,NULL),(10,'IRENE ',NULL,'ALDANA',NULL,'2022-10-08 02:31:32',34,9,3,2,NULL),(11,'STIPE ',NULL,'MIOCIC',NULL,'2022-10-08 02:32:51',40,5,9,1,NULL),(12,'ZHANG ',NULL,'WEILI',NULL,'2022-10-08 02:34:59',33,12,1,2,'MAGNUM'),(13,'GILBERT ',NULL,'BURNS',NULL,'2022-10-08 02:36:15',36,7,6,1,'DURINHO'),(14,'CHARLES ',NULL,'OLIVEIRA',NULL,'2022-10-08 02:37:47',32,7,5,1,'DO BRONX'),(15,'JON ',NULL,'JONES',NULL,'2022-10-08 02:38:59',35,5,8,1,'BONES'),(16,'BRIAN ',NULL,'ORTEGA',NULL,'2022-10-08 02:40:08',31,5,4,1,'T-CITY'),(17,'MAX ',NULL,'HOLLOWAY',NULL,'2022-10-08 02:41:24',30,5,4,1,'BLESSED');
/*!40000 ALTER TABLE `fighters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id_gender` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(60) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'Masculino','2022-10-08 02:14:05','2022-10-08 02:14:05'),(2,'Femenino','2022-10-08 02:14:05','2022-10-08 02:14:05');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ufc'
--

--
-- Dumping routines for database 'ufc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-08 14:54:18
