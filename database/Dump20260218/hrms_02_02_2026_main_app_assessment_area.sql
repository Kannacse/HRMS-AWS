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
-- Table structure for table `main_app_assessment_area`
--

DROP TABLE IF EXISTS `main_app_assessment_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_app_assessment_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by` int NOT NULL,
  `modified_by` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_assessment_area`
--

LOCK TABLES `main_app_assessment_area` WRITE;
/*!40000 ALTER TABLE `main_app_assessment_area` DISABLE KEYS */;
INSERT INTO `main_app_assessment_area` VALUES (1,'Delivery',187,187,'2024-01-10 12:49:57','2024-01-10 12:49:57',1),(2,'Quality',187,187,'2024-01-10 12:50:11','2024-01-10 12:50:11',1),(3,'Team',187,187,'2024-01-10 12:50:26','2024-01-10 12:50:26',1),(4,'Learning',187,187,'2024-01-10 12:50:33','2024-01-10 12:50:33',1),(5,'Customer',187,187,'2024-01-10 12:50:44','2024-01-10 12:50:44',1),(6,'Process',187,187,'2024-01-10 12:50:52','2024-01-10 12:50:52',1),(7,'Innovation',187,187,'2024-01-10 12:51:06','2024-01-10 12:51:06',1),(8,'Organization',187,187,'2024-01-10 12:51:16','2024-01-10 12:51:16',1),(9,'Cultural',187,187,'2024-01-10 12:51:26','2024-01-10 12:51:26',1);
/*!40000 ALTER TABLE `main_app_assessment_area` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:13
