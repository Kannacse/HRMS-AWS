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
-- Table structure for table `tm_emp_timesheets`
--

DROP TABLE IF EXISTS `tm_emp_timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tm_emp_timesheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int unsigned NOT NULL,
  `project_task_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `ts_year` smallint unsigned NOT NULL,
  `ts_month` tinyint unsigned DEFAULT NULL,
  `ts_week` tinyint unsigned DEFAULT NULL,
  `cal_week` tinyint DEFAULT NULL,
  `sun_date` date DEFAULT NULL,
  `sun_duration` varchar(6) DEFAULT NULL,
  `mon_date` date DEFAULT NULL,
  `mon_duration` varchar(6) DEFAULT NULL,
  `tue_date` date DEFAULT NULL,
  `tue_duration` varchar(6) DEFAULT NULL,
  `wed_date` date DEFAULT NULL,
  `wed_duration` varchar(6) DEFAULT NULL,
  `thu_date` date DEFAULT NULL,
  `thu_duration` varchar(6) DEFAULT NULL,
  `fri_date` date DEFAULT NULL,
  `fri_duration` varchar(6) DEFAULT NULL,
  `sat_date` date DEFAULT NULL,
  `sat_duration` varchar(6) DEFAULT NULL,
  `week_duration` varchar(6) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_emp_task_time` (`emp_id`,`project_task_id`,`ts_year`,`ts_month`,`ts_week`,`cal_week`),
  KEY `FK_tm_emp_timesheets_proj_task` (`project_task_id`),
  KEY `FK_tm_emp_timesheets_project` (`project_id`),
  CONSTRAINT `FK_tm_emp_timesheets_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_emp_timesheets_proj_task` FOREIGN KEY (`project_task_id`) REFERENCES `tm_project_tasks` (`id`),
  CONSTRAINT `FK_tm_emp_timesheets_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_emp_timesheets`
--

LOCK TABLES `tm_emp_timesheets` WRITE;
/*!40000 ALTER TABLE `tm_emp_timesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_emp_timesheets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:09
