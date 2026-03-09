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
-- Table structure for table `main_disciplinary_incident`
--

DROP TABLE IF EXISTS `main_disciplinary_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_disciplinary_incident` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `incident_raised_by` bigint unsigned DEFAULT NULL,
  `employee_bu_id` bigint unsigned DEFAULT NULL,
  `employee_dept_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `employee_rep_mang_id` bigint unsigned DEFAULT NULL,
  `date_of_occurrence` date DEFAULT NULL,
  `violation_id` bigint unsigned DEFAULT NULL,
  `violation_expiry` date DEFAULT NULL,
  `employee_job_title_id` bigint unsigned DEFAULT NULL,
  `employer_statement` text,
  `employee_appeal` tinyint(1) DEFAULT '1' COMMENT '1=Yes,2=No',
  `employee_statement` text,
  `cao_verdict` tinyint(1) DEFAULT '1' COMMENT '1=guilty,2=not guilty',
  `corrective_action` enum('Suspension With Pay','Suspension W/O Pay','Termination','Other') DEFAULT 'Suspension With Pay',
  `corrective_action_text` varchar(255) DEFAULT NULL,
  `incident_status` enum('Initiated','Appealed','Closed') DEFAULT 'Initiated',
  `createdby` bigint unsigned DEFAULT NULL,
  `modifiedby` bigint unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_disciplinary_incident`
--

LOCK TABLES `main_disciplinary_incident` WRITE;
/*!40000 ALTER TABLE `main_disciplinary_incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_disciplinary_incident` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:57
