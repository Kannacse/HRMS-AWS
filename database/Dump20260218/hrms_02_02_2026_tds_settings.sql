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
-- Table structure for table `tds_settings`
--

DROP TABLE IF EXISTS `tds_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tds_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `max_limit` int NOT NULL,
  `percentage` int NOT NULL,
  `is_add` int NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privilege` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tds_settings`
--

LOCK TABLES `tds_settings` WRITE;
/*!40000 ALTER TABLE `tds_settings` DISABLE KEYS */;
INSERT INTO `tds_settings` VALUES (1,'basic_salary',0,30,0,'2019-06-13 08:57:08',''),(2,'rent_paid',0,10,0,'2019-06-13 08:57:08',''),(5,'conveyance_allowance',19200,0,0,'2019-06-13 08:57:08',''),(6,'sec24_house_property',200000,0,0,'2019-06-13 08:57:08',''),(7,'sec24_first_home_buyer',50000,0,0,'2019-06-13 08:57:08',''),(8,'sec24_home_loan',30000,0,0,'2019-06-13 08:57:08',''),(9,'sec_80c',150000,0,0,'2019-06-13 08:57:08',''),(10,'sec_80ccd',50000,0,0,'2019-06-13 08:57:08',''),(11,'sec_80ccg',50000,0,0,'2019-06-13 08:57:08',''),(12,'sec80d_medical_self',30000,0,0,'2019-06-13 08:57:08',''),(13,'sec80d_medical_parents',30000,0,0,'2019-06-13 08:57:08',''),(14,'sec80dd',125000,0,0,'2019-06-13 08:57:08',''),(15,'sec80ddb',80000,0,0,'2019-06-13 08:57:08',''),(16,'sec80gg',60000,0,0,'2019-06-13 08:57:08',''),(17,'sec80u',125000,0,0,'2019-06-13 08:57:08',''),(18,'privilege',0,0,0,'2019-06-13 08:57:08','view'),(19,'standard_deduction',50000,0,1,'2019-06-13 08:57:08',''),(20,'standard_deduction',75000,0,2,'2019-06-13 08:57:08','');
/*!40000 ALTER TABLE `tds_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:11
