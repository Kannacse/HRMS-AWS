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
-- Table structure for table `main_weekdays`
--

DROP TABLE IF EXISTS `main_weekdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_weekdays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `day_name` bigint DEFAULT NULL,
  `dayshortcode` varchar(255) DEFAULT NULL,
  `daylongcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_weekdays`
--

LOCK TABLES `main_weekdays` WRITE;
/*!40000 ALTER TABLE `main_weekdays` DISABLE KEYS */;
INSERT INTO `main_weekdays` VALUES (1,0,'Su','Sun','Sunday',1,1,'2014-01-21 11:53:58','2014-01-21 11:53:58',1),(2,1,'Mo','Mon','Monday',1,1,'2014-01-21 11:54:22','2014-01-21 11:54:22',1),(3,2,'Tu','Tue','Tueday',1,1,'2014-01-21 11:54:39','2014-01-21 11:54:39',1),(4,3,'We','Wed','Wednesday',1,1,'2014-01-21 11:54:52','2014-01-21 11:54:52',1),(5,4,'Th','Thu','Thursday',1,1,'2014-01-21 11:55:24','2014-01-21 11:55:24',1),(6,5,'F','Fri','Friday',1,1,'2014-01-21 11:55:45','2014-01-21 11:55:45',1),(7,6,'Sa','Sat','Saturday',1,1,'2014-01-21 11:56:13','2014-01-21 11:56:13',1);
/*!40000 ALTER TABLE `main_weekdays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:27
