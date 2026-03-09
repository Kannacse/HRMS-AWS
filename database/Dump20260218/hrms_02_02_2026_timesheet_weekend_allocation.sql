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
-- Table structure for table `timesheet_weekend_allocation`
--

DROP TABLE IF EXISTS `timesheet_weekend_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet_weekend_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet_weekend_allocation`
--

LOCK TABLES `timesheet_weekend_allocation` WRITE;
/*!40000 ALTER TABLE `timesheet_weekend_allocation` DISABLE KEYS */;
INSERT INTO `timesheet_weekend_allocation` VALUES (1,187,'2025-12-20',NULL,187,187,'2025-12-12 09:55:21','2025-12-12 09:55:21',1),(2,300,'2025-12-20',NULL,300,300,'2025-12-20 12:17:33','2025-12-20 12:17:33',1),(3,388,'2025-12-20',NULL,388,388,'2025-12-20 12:21:36','2025-12-20 12:21:36',1),(4,379,'2025-12-20',NULL,379,379,'2025-12-20 12:21:37','2025-12-20 12:21:37',1),(5,411,'2025-12-20',NULL,411,411,'2025-12-20 12:22:13','2025-12-20 12:22:13',1),(6,153,'2025-12-13','Compensate Work',153,153,'2025-12-23 09:42:22','2025-12-23 09:42:22',1),(7,298,'2025-12-13','Compensate work',298,298,'2025-12-24 08:16:00','2025-12-24 08:16:00',1),(8,153,'2026-01-31','Compensate',153,153,'2026-01-02 19:23:58','2026-01-02 19:23:58',1),(9,300,'2026-01-31',NULL,300,300,'2026-02-02 04:32:32','2026-02-02 04:32:32',1);
/*!40000 ALTER TABLE `timesheet_weekend_allocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:37
