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
-- Table structure for table `main_sd_depts`
--

DROP TABLE IF EXISTS `main_sd_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_sd_depts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_desk_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` bigint unsigned DEFAULT NULL,
  `modifiedby` bigint unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_sd_depts`
--

LOCK TABLES `main_sd_depts` WRITE;
/*!40000 ALTER TABLE `main_sd_depts` DISABLE KEYS */;
INSERT INTO `main_sd_depts` VALUES (1,'HR',NULL,187,187,'2024-03-14 12:50:26','2024-03-14 12:50:26',1),(2,'Stationary',NULL,187,187,'2024-03-14 12:52:21','2024-03-14 12:52:21',1),(3,'Electrical Issues',NULL,187,187,'2024-03-14 12:54:18','2024-03-14 12:54:18',1),(4,'Hardware requirement',NULL,187,187,'2024-03-14 12:58:09','2024-03-14 13:04:05',1),(5,'Login credentials',NULL,187,187,'2024-03-14 12:58:41','2024-03-14 12:58:41',1),(6,'Maintenance request',NULL,187,187,'2024-03-14 13:01:19','2024-03-14 13:01:19',1),(7,'Medical request',NULL,187,187,'2024-03-14 13:01:52','2024-03-14 13:01:52',1),(8,'Purchase request',NULL,187,239,'2024-03-14 13:02:35','2024-06-11 06:56:22',1),(9,'Installation requirements',NULL,187,187,'2024-03-14 13:03:35','2024-03-14 13:03:35',1),(10,'Hardware maintenance',NULL,187,187,'2024-03-14 13:03:54','2024-03-14 13:03:54',1),(11,'Finance',NULL,187,239,'2024-03-14 13:04:50','2024-06-11 06:56:11',1),(14,'Hygiene',NULL,187,187,'2024-06-20 04:56:10','2024-06-20 04:56:10',1),(15,'Admin',NULL,187,187,'2024-06-28 06:46:28','2024-06-28 06:46:28',1),(16,'Other Requests',NULL,239,239,'2024-08-05 05:13:50','2024-08-05 05:14:19',1);
/*!40000 ALTER TABLE `main_sd_depts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:56
