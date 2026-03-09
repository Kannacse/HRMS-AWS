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
-- Table structure for table `main_exit_hr_question`
--

DROP TABLE IF EXISTS `main_exit_hr_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_exit_hr_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_exit_hr_question`
--

LOCK TABLES `main_exit_hr_question` WRITE;
/*!40000 ALTER TABLE `main_exit_hr_question` DISABLE KEYS */;
INSERT INTO `main_exit_hr_question` VALUES (1,'How long have you been with the company, and what made you join initially.','2025-08-22 12:16:34',NULL,1),(2,'What aspects of your role did you enjoy the most.','2025-08-22 12:16:34',NULL,1),(3,'What was the best part of working here.','2025-08-22 12:16:34',NULL,1),(4,'What prompted you to start looking for another opportunity.','2025-08-22 12:16:34',NULL,1),(5,'What was the primary reason for your decision to leave.','2025-08-22 12:16:34',NULL,1),(6,'Could anything have been done to prevent you from leaving.','2025-08-22 12:16:34',NULL,1),(7,'How would you describe the company culture.','2025-08-22 12:16:34',NULL,1),(8,'Did you feel valued and recognized for your contributions.','2025-08-22 12:16:34',NULL,1),(9,'How was your relationship with your manager and team.','2025-08-22 12:16:34',NULL,1),(10,'Did you feel comfortable sharing feedback or concerns at work.','2025-08-22 12:16:34',NULL,1),(11,'What are some things the company should continue doing.','2025-08-22 12:16:34',NULL,1),(12,'What are some things the company should stop or change.','2025-08-22 12:16:34',NULL,1),(13,'Were there enough opportunities for learning and advancement.','2025-08-22 12:16:34',NULL,1);
/*!40000 ALTER TABLE `main_exit_hr_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:52
