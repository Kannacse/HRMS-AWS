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
-- Table structure for table `main_exit_questions`
--

DROP TABLE IF EXISTS `main_exit_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_exit_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` int DEFAULT NULL COMMENT '1-HR,2-Reporting Manager, 3-Accounts Manager, 4-Admin Manager',
  `createdby` int NOT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isactive` tinyint NOT NULL DEFAULT '1' COMMENT '0-No,1-Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_exit_questions`
--

LOCK TABLES `main_exit_questions` WRITE;
/*!40000 ALTER TABLE `main_exit_questions` DISABLE KEYS */;
INSERT INTO `main_exit_questions` VALUES (1,'Petty Cash',NULL,3,322,322,'2025-05-13 05:05:42','2025-05-12 23:35:42',1),(2,'Loan/Advance',NULL,3,322,322,'2025-05-13 05:05:42','2025-05-12 23:35:42',1),(3,'Any other Liabilities',NULL,3,322,322,'2025-05-13 05:09:09','2025-05-12 23:39:09',1),(4,'Knowledge Transfer Status',NULL,2,322,322,'2025-05-13 05:09:09','2025-05-12 23:39:09',1),(5,'KT',NULL,2,322,322,'2025-05-13 05:09:09','2025-07-01 07:38:22',0),(6,'Code Board Credentials (Revoke Status)',NULL,2,322,322,'2025-05-13 05:10:24','2025-05-12 23:40:24',1),(7,'Client Credentials if any (Revoke Status)',NULL,2,322,322,'2025-05-13 05:10:24','2025-05-12 23:40:24',1),(8,'Laptop Submission',NULL,4,322,322,'2025-05-13 05:12:18','2025-05-12 23:42:18',1),(9,'Laptop Condition',NULL,4,322,322,'2025-05-13 05:12:18','2025-05-12 23:42:18',1),(10,'Laptop ID and password',NULL,4,322,322,'2025-05-13 05:12:18','2025-05-12 23:42:18',1),(11,'Other Assets',NULL,4,322,322,'2025-05-13 05:12:18','2025-05-12 23:42:18',1),(12,'Identity Card',NULL,4,322,322,'2025-05-13 05:12:18','2025-05-12 23:42:18',1),(13,'Resignation Letter',NULL,1,322,322,'2025-05-13 05:13:16','2025-05-12 23:43:16',1),(14,'Clearance form',NULL,1,322,322,'2025-05-13 05:13:16','2025-05-12 23:43:16',1),(15,'Code of Conduct',NULL,1,322,322,'2025-05-13 05:13:16','2025-05-12 23:43:16',1),(16,'Exit Interview',NULL,1,322,322,'2025-05-13 05:13:16','2025-05-12 23:43:16',1),(17,'Resignation Letter',NULL,1,322,322,'2025-06-18 12:44:37','2025-06-18 07:14:46',0);
/*!40000 ALTER TABLE `main_exit_questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:49
