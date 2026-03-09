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
-- Table structure for table `main_request_tracker`
--

DROP TABLE IF EXISTS `main_request_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_request_tracker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `request_type` enum('leave','timesheet') DEFAULT NULL,
  `tracker` enum('laptop','mobile') DEFAULT NULL,
  `status` enum('pending','approve','cancel','reject') DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_request_tracker`
--

LOCK TABLES `main_request_tracker` WRITE;
/*!40000 ALTER TABLE `main_request_tracker` DISABLE KEYS */;
INSERT INTO `main_request_tracker` VALUES (1,242,'2026-02-06','2026-02-10','leave','mobile','pending','2026-02-05 10:30:25','2026-02-05 10:30:25',242,242,1),(2,4,'2026-02-06','2026-02-10','leave','mobile','reject','2026-02-05 10:31:42','2026-02-05 10:31:42',4,4,1),(3,242,'2026-02-05','2026-02-12','leave','mobile','pending','2026-02-05 10:34:01','2026-02-05 10:34:01',242,242,1),(4,4,'2026-02-05','2026-02-12','leave','mobile','cancel','2026-02-05 10:34:17','2026-02-05 10:34:17',4,4,1),(5,242,'2026-02-05','2026-02-11','leave','mobile','pending','2026-02-05 10:34:56','2026-02-05 10:34:56',242,242,1),(6,4,'2026-02-05','2026-02-11','leave','mobile','approve','2026-02-05 10:35:30','2026-02-05 10:35:30',4,4,1),(7,242,'2026-02-12','2026-02-13','leave','mobile','pending','2026-02-05 10:38:12','2026-02-05 10:38:12',242,242,1),(8,4,'2026-02-12','2026-02-13','leave','mobile','approve','2026-02-05 10:38:27','2026-02-05 10:38:27',4,4,1);
/*!40000 ALTER TABLE `main_request_tracker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:06
