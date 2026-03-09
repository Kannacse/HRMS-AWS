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
-- Table structure for table `ts_projects`
--

DROP TABLE IF EXISTS `ts_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `project_status` enum('initiated','draft','in-progress','hold','completed') DEFAULT NULL,
  `base_project` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `TS_PROJECTS_CLIENT_ID_TS_CLIENTS_idx` (`client_id`),
  KEY `TS_PROJECTS_BASE_PROJECT_idx` (`base_project`),
  CONSTRAINT `TS_PROJECTS_BASE_PROJECT` FOREIGN KEY (`base_project`) REFERENCES `ts_projects` (`id`),
  CONSTRAINT `TS_PROJECTS_CLIENT_ID_TS_CLIENTS` FOREIGN KEY (`client_id`) REFERENCES `ts_clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_projects`
--

LOCK TABLES `ts_projects` WRITE;
/*!40000 ALTER TABLE `ts_projects` DISABLE KEYS */;
INSERT INTO `ts_projects` VALUES (1,2,'FPR ONE project','in-progress',NULL,NULL,'2024-02-06','2024-04-30',145,145,1,'2024-03-21 07:05:18','2024-03-21 07:05:18'),(2,1,'Automation Testing project -Clinical Trail Management System','in-progress',NULL,NULL,'2024-01-02','2024-06-28',145,145,1,'2024-03-21 07:01:26','2024-03-21 07:01:26'),(3,3,'HRMS','in-progress',1,'knbud jl','2024-02-08','2024-02-22',187,187,0,'2024-02-05 12:27:14','2024-03-21 06:52:24'),(4,1,'Automation Testing project -ICO Master ','in-progress',NULL,NULL,'2024-02-27','2024-08-27',145,145,1,'2024-03-21 07:01:06','2024-03-21 07:01:06'),(5,1,'RPA Project - Data and applied analytics Clinical operations','in-progress',NULL,NULL,'2024-01-02','2024-06-28',145,145,1,'2024-03-21 07:00:51','2024-03-21 07:00:51'),(6,1,'BA projects','in-progress',NULL,NULL,'2024-01-02','2024-06-28',178,178,1,'2024-04-30 06:17:33','2024-04-30 06:17:33'),(7,1,'ODI projects','in-progress',NULL,NULL,'2024-01-02','2024-06-28',145,145,1,'2024-03-21 07:06:30','2024-03-21 07:06:30'),(8,1,'Angular Project - Accelacare','in-progress',NULL,NULL,'2024-01-02','2024-06-28',145,145,1,'2024-03-21 11:42:53','2024-03-21 11:42:53'),(9,4,'QA','in-progress',NULL,NULL,'2024-01-01','2024-12-31',178,178,1,'2024-03-27 07:13:23','2024-03-27 07:13:23'),(10,4,'Developer','in-progress',NULL,NULL,'2024-01-01','2024-12-31',178,178,1,'2024-03-27 07:14:02','2024-03-27 07:14:02'),(11,1,'Labs Project','in-progress',NULL,NULL,'2024-05-27','2024-12-31',145,145,1,'2024-05-28 11:25:31','2024-05-28 11:25:31'),(12,6,'Hitachi','in-progress',NULL,NULL,'2024-07-01','2024-12-31',145,145,1,'2024-08-29 12:30:14','2024-08-29 12:30:14'),(13,1,'Junior ODI','in-progress',NULL,NULL,'2024-08-12','2024-12-31',145,145,1,'2024-08-29 12:32:26','2024-08-29 12:32:26'),(14,1,'Java project','in-progress',NULL,NULL,'2024-09-02','2024-12-31',145,145,1,'2024-09-27 04:44:04','2024-09-27 04:44:04'),(15,7,'IFF-Swaas','in-progress',NULL,NULL,'2024-11-01','2025-04-30',145,145,1,'2024-11-26 12:14:06','2024-11-26 12:14:06'),(16,1,'UI Development Project','in-progress',NULL,NULL,'2024-12-16','2025-05-31',145,145,1,'2024-12-30 05:12:04','2024-12-30 05:12:04'),(17,10,'SecureTraces','in-progress',NULL,NULL,'2025-04-01','2026-03-31',325,325,1,'2025-04-29 09:27:11','2025-04-29 09:27:11'),(18,16,'TA','in-progress',NULL,NULL,'2025-01-01','2026-05-31',325,325,1,'2025-11-28 06:18:26','2025-11-28 06:18:26'),(19,16,'E-Med','in-progress',NULL,NULL,'2025-08-01','2026-05-31',325,325,1,'2025-11-28 06:21:08','2025-11-28 06:21:08'),(20,16,'Life','in-progress',NULL,NULL,'2025-08-01','2026-05-31',325,325,1,'2025-11-28 06:20:58','2025-11-28 06:20:58'),(21,17,'SIMSCO','in-progress',NULL,NULL,'2025-07-21','2025-12-31',325,325,1,'2025-11-28 06:22:45','2025-11-28 06:22:45'),(22,18,'Hornet Platform','hold',NULL,NULL,'2025-08-01','2025-12-31',325,325,1,'2025-11-28 06:27:45','2025-11-28 06:27:45'),(23,1,'AWS Project','in-progress',NULL,NULL,'2025-11-03','2026-01-30',145,145,1,'2025-11-28 07:11:43','2025-11-28 07:11:43'),(24,2,'Agentic AI Order Extraction','in-progress',NULL,NULL,'2025-12-18','2026-02-06',325,325,1,'2025-12-22 10:25:18','2025-12-22 10:25:18');
/*!40000 ALTER TABLE `ts_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:29
