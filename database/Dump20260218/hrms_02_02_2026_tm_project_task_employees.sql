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
-- Table structure for table `tm_project_task_employees`
--

DROP TABLE IF EXISTS `tm_project_task_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_project_task_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `project_task_id` bigint unsigned NOT NULL,
  `emp_id` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int unsigned DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_project_task_employees_project` (`project_id`),
  KEY `FK_tm_project_task_employees_task` (`task_id`),
  KEY `FK_tm_project_task_employees_proj_task` (`project_task_id`),
  KEY `FK_tm_project_task_employees_employee` (`emp_id`),
  CONSTRAINT `FK_tm_project_task_employees_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_project_task_employees_proj_task` FOREIGN KEY (`project_task_id`) REFERENCES `tm_project_tasks` (`id`),
  CONSTRAINT `FK_tm_project_task_employees_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`),
  CONSTRAINT `FK_tm_project_task_employees_task` FOREIGN KEY (`task_id`) REFERENCES `tm_tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_project_task_employees`
--

LOCK TABLES `tm_project_task_employees` WRITE;
/*!40000 ALTER TABLE `tm_project_task_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_project_task_employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:30
