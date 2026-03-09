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
-- Table structure for table `tm_projects`
--

DROP TABLE IF EXISTS `tm_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `project_status` enum('initiated','draft','in-progress','hold','completed') NOT NULL,
  `base_project` bigint DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  `project_type` enum('billable','non_billable','revenue') NOT NULL,
  `lead_approve_ts` tinyint DEFAULT NULL,
  `estimated_hrs` mediumint DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `initiated_date` timestamp NULL DEFAULT NULL,
  `hold_date` timestamp NULL DEFAULT NULL,
  `completed_date` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int unsigned DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_projects_client` (`client_id`),
  KEY `FK_tm_projects_currency` (`currency_id`),
  CONSTRAINT `FK_tm_projects_client` FOREIGN KEY (`client_id`) REFERENCES `tm_clients` (`id`),
  CONSTRAINT `FK_tm_projects_currency` FOREIGN KEY (`currency_id`) REFERENCES `main_currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_projects`
--

LOCK TABLES `tm_projects` WRITE;
/*!40000 ALTER TABLE `tm_projects` DISABLE KEYS */;
INSERT INTO `tm_projects` VALUES (1,'AD Finance','in-progress',NULL,NULL,1,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 13:16:51','2022-07-14 13:16:51'),(2,'Dalko','in-progress',NULL,NULL,3,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 13:19:08','2022-07-14 13:19:08'),(3,'Recruitment','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 13:44:49','2022-07-14 13:46:51'),(4,'Lowcode','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 13:47:13','2022-07-14 13:47:13'),(5,'Beyontec','in-progress',NULL,NULL,5,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 13:53:33','2022-07-15 02:09:55'),(6,'CBG','in-progress',NULL,NULL,6,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:05:32','2022-07-15 02:09:22'),(7,'Charge Back Guru\'s','in-progress',NULL,NULL,6,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:12:53','2022-07-15 02:07:39'),(8,'CRM','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:22:15','2022-07-15 02:06:41'),(9,'Website Design','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:26:07','2022-07-15 02:06:25'),(10,'Fresher','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:29:01','2022-07-15 02:05:39'),(11,'HRMS/APS','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:34:51','2022-07-15 02:05:25'),(12,'ICON','in-progress',NULL,NULL,13,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:38:01','2022-07-14 14:38:01'),(13,'IFF','in-progress',NULL,NULL,14,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:41:08','2022-07-14 14:41:08'),(14,'Neptune','completed',NULL,NULL,15,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,'2024-08-12 06:38:35',1,7,1,'2022-07-14 14:44:03','2024-08-12 06:38:35'),(15,'Recuirtment','in-progress',NULL,NULL,16,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,'2022-07-14 14:46:40','2022-07-15 02:01:56'),(16,'RMO','in-progress',NULL,NULL,4,4,'non_billable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'2022-07-14 14:52:06','2022-07-15 02:01:18');
/*!40000 ALTER TABLE `tm_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:08
