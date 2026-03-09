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
-- Table structure for table `main_hremployee_request`
--

DROP TABLE IF EXISTS `main_hremployee_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_hremployee_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `emp_status` enum('emp_ini','emp_rej') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hr_status` enum('hr_app','hr_rej') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `management_status` enum('man_app','man_rej') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `emp_app_com` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `emp_rej_com` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `hr_app_com` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `hr_rej_com` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `man_app_com` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `man_rej_com` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_hremployee_request`
--

LOCK TABLES `main_hremployee_request` WRITE;
/*!40000 ALTER TABLE `main_hremployee_request` DISABLE KEYS */;
INSERT INTO `main_hremployee_request` VALUES (1,187,1,'emp_ini','hr_app',NULL,'Address:\r\nFlat No. S1, Second Floor, Door No. 17/3, Plot No. 19, 1st Cross Street, Anna Nagar 4th Main Road,\r\nVelachery East, Velachery,\r\nChennai – 600 042.',NULL,'Approved ',NULL,NULL,NULL,1,187,322,'2025-09-29 06:09:28','2025-09-29 06:12:50'),(2,128,1,'emp_rej',NULL,NULL,'testing',NULL,NULL,NULL,NULL,NULL,1,128,128,'2025-09-29 06:11:13','2025-10-01 04:25:21');
/*!40000 ALTER TABLE `main_hremployee_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:35
