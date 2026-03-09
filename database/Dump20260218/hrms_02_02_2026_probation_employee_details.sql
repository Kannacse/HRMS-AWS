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
-- Table structure for table `probation_employee_details`
--

DROP TABLE IF EXISTS `probation_employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `probation_employee_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reporting_manager` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `job_title_id` int DEFAULT NULL,
  `status` enum('probation_extend','confirm_permanent') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `prob_extend_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `probation_employee_details`
--

LOCK TABLES `probation_employee_details` WRITE;
/*!40000 ALTER TABLE `probation_employee_details` DISABLE KEYS */;
INSERT INTO `probation_employee_details` VALUES (1,326,145,2,14,'confirm_permanent','2025-07-10',NULL,145,145,'2025-07-10 08:08:43','2025-07-10 08:19:28',0),(2,326,145,2,14,'confirm_permanent','2025-07-10',NULL,145,145,'2025-07-10 12:21:27','2025-07-10 12:21:27',1),(3,327,145,11,14,'confirm_permanent','2025-07-16',NULL,145,145,'2025-07-16 09:17:24','2025-07-16 09:17:24',1),(4,328,145,11,13,'confirm_permanent','2025-07-16',NULL,145,145,'2025-07-16 09:17:27','2025-07-16 09:17:27',1),(5,330,145,2,20,'confirm_permanent','2025-08-08',NULL,145,145,'2025-08-08 08:46:37','2025-08-08 08:46:37',1),(6,331,145,NULL,13,'confirm_permanent','2025-08-08',NULL,145,145,'2025-08-08 08:46:41','2025-08-08 08:46:41',1),(7,341,7,NULL,36,'confirm_permanent','2025-09-03',NULL,7,7,'2025-09-03 06:57:58','2025-09-03 06:57:58',1),(8,329,24,NULL,13,'confirm_permanent','2025-09-08',NULL,24,24,'2025-09-08 05:48:00','2025-09-08 05:48:00',1),(9,339,7,NULL,36,'confirm_permanent','2025-09-16',NULL,7,7,'2025-09-16 05:52:57','2025-09-16 05:52:57',1),(10,338,7,NULL,36,'confirm_permanent','2025-09-16',NULL,7,7,'2025-09-16 05:53:02','2025-09-16 05:53:02',1),(11,342,7,NULL,36,'confirm_permanent','2025-09-22',NULL,7,7,'2025-09-22 09:41:20','2025-09-22 09:41:20',1),(12,340,24,3,36,'confirm_permanent','2025-09-30',NULL,24,24,'2025-09-30 04:35:23','2025-09-30 04:35:23',1),(13,345,24,NULL,14,'confirm_permanent','2025-09-30',NULL,24,24,'2025-09-30 04:35:30','2025-09-30 04:35:30',1),(14,347,145,11,14,'confirm_permanent','2025-10-24',NULL,145,145,'2025-10-24 04:37:04','2025-10-24 04:37:04',1),(15,348,325,NULL,18,'probation_extend','2026-01-05','Needs improvement and providing time to prove the BA capabilities',325,325,'2025-10-24 13:20:56','2025-10-24 13:20:56',1),(16,349,325,NULL,18,'probation_extend','2026-01-05','Needs improvement and providing time to prove the BA capabilities',325,325,'2025-10-24 13:21:30','2025-10-24 13:21:30',1),(17,346,325,NULL,15,'confirm_permanent','2025-10-24',NULL,325,325,'2025-10-24 13:21:56','2025-10-24 13:21:56',1),(18,352,240,NULL,36,'confirm_permanent','2025-11-24',NULL,240,240,'2025-11-24 10:44:03','2025-11-24 10:44:03',1),(19,373,325,NULL,14,'confirm_permanent','2025-12-15',NULL,325,325,'2025-12-15 05:48:51','2025-12-15 05:48:51',1),(20,389,325,NULL,13,'confirm_permanent','2026-01-05',NULL,325,325,'2026-01-05 06:57:26','2026-01-05 06:57:26',1);
/*!40000 ALTER TABLE `probation_employee_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:46
