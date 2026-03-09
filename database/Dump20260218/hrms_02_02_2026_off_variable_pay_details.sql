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
-- Table structure for table `off_variable_pay_details`
--

DROP TABLE IF EXISTS `off_variable_pay_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `off_variable_pay_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_candidate_id` int NOT NULL,
  `amount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `month` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `year` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `off_variable_pay_details`
--

LOCK TABLES `off_variable_pay_details` WRITE;
/*!40000 ALTER TABLE `off_variable_pay_details` DISABLE KEYS */;
INSERT INTO `off_variable_pay_details` VALUES (1,188,'','01','2020',379,379,'2025-10-22 05:36:57','2025-10-22 05:36:57',1),(2,189,'','01','2020',300,300,'2025-10-23 07:33:57','2025-10-23 07:33:57',1),(3,190,'','01','2020',300,300,'2025-10-30 12:09:22','2025-10-30 12:09:22',1),(4,191,'','01','2020',300,300,'2025-11-03 11:38:26','2025-11-03 11:38:26',1),(5,192,'','01','2020',411,4,'2025-11-13 09:16:08','2025-11-13 11:59:20',1),(6,193,'','01','2020',411,411,'2025-11-14 10:46:39','2025-11-18 10:45:41',1),(7,194,'','01','2020',388,388,'2025-11-20 09:49:42','2025-11-20 09:49:42',0),(8,195,'50000','10','2027',300,4,'2025-11-21 05:19:42','2025-11-21 10:51:39',0),(9,196,'','01','2020',300,4,'2025-11-21 05:20:17','2025-11-21 10:51:15',1),(10,197,'50000','10','2026',379,4,'2025-11-21 11:25:06','2025-11-24 07:26:44',0);
/*!40000 ALTER TABLE `off_variable_pay_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:09
