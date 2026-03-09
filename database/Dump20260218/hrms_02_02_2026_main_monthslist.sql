-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 10.30.0.93    Database: hrms_02_02_2026
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `main_monthslist`
--

DROP TABLE IF EXISTS `main_monthslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_monthslist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `month_id` bigint unsigned DEFAULT NULL,
  `monthcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_monthslist`
--

LOCK TABLES `main_monthslist` WRITE;
/*!40000 ALTER TABLE `main_monthslist` DISABLE KEYS */;
INSERT INTO `main_monthslist` VALUES (1,1,'Jan','January',1,1,'2014-01-21 11:46:13','2014-01-21 11:46:13',1),(2,2,'Feb','February',1,1,'2014-01-21 11:46:44','2014-01-21 11:46:44',1),(3,3,'Mar','March',1,1,'2014-01-21 11:47:10','2014-01-21 11:47:10',1),(4,4,'April','April',1,1,'2014-01-21 11:47:24','2014-01-21 11:47:24',1),(5,5,'May','May',1,1,'2014-01-21 11:47:40','2014-01-21 11:47:40',1),(6,6,'June','June',1,1,'2014-01-21 11:47:53','2014-01-21 11:47:53',1),(7,7,'July','July',1,1,'2014-01-21 11:48:04','2014-01-21 11:48:04',1),(8,8,'Aug','August',1,1,'2014-01-21 11:48:16','2014-01-21 11:48:16',1),(9,9,'Sep','September',1,1,'2014-01-21 11:48:28','2014-01-21 11:48:28',1),(10,10,'Oct','October',1,1,'2014-01-21 11:48:43','2014-01-21 11:48:43',1),(11,11,'Nov','November',1,1,'2014-01-21 11:48:53','2014-01-21 11:48:53',1),(12,12,'Dec','December',1,1,'2014-01-21 11:49:06','2014-01-21 11:49:06',1);
/*!40000 ALTER TABLE `main_monthslist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:17
