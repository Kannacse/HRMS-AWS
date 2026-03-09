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
-- Table structure for table `offered_checklist`
--

DROP TABLE IF EXISTS `offered_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offered_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `checklist_name` varchar(255) NOT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offered_checklist`
--

LOCK TABLES `offered_checklist` WRITE;
/*!40000 ALTER TABLE `offered_checklist` DISABLE KEYS */;
INSERT INTO `offered_checklist` VALUES (1,'imprve wrk','in',239,239,'2024-08-09 05:46:01','2024-08-09 06:52:35',0),(2,'gsdf','op',239,239,'2024-08-09 05:46:01','2024-08-09 06:52:40',0),(3,'Offer letter Issuance','OI',187,187,'2024-09-10 04:44:57','2024-09-10 04:44:57',1),(4,'Biometric access','BC',187,187,'2024-09-10 04:58:57','2024-09-10 04:58:57',1),(5,'Laptop','LAP',239,239,'2024-09-18 10:44:29','2024-09-18 10:44:29',1),(6,'Employee Id Card','EIC',239,239,'2024-09-18 10:44:29','2024-09-18 10:44:29',1),(7,'Insurance Details','ID',239,239,'2024-09-18 10:44:29','2024-09-18 10:44:29',1),(8,'Official mail Id','OID',239,239,'2024-09-18 10:46:10','2024-09-18 10:46:10',1),(9,'Bank Account - Salary Account','BAS',239,239,'2024-09-18 10:46:10','2024-09-18 10:46:10',1),(10,'HR Induction','HR_I',239,239,'2024-09-18 10:46:54','2024-09-18 10:46:54',1),(11,'PF addition','PFA',187,187,'2024-12-12 01:23:19','2024-12-12 07:53:19',1);
/*!40000 ALTER TABLE `offered_checklist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:47
