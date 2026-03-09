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
-- Table structure for table `main_pa_questions_privileges_temp`
--

DROP TABLE IF EXISTS `main_pa_questions_privileges_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_pa_questions_privileges_temp` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint unsigned DEFAULT NULL COMMENT 'Appraisal initialization id for appraisal else feedforward initialization id for feedforward',
  `group_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL COMMENT 'id of the employee',
  `hr_qs` text COMMENT 'Comma separated question ids created by hr',
  `hr_group_qs_privileges` text COMMENT '{''groupid:''{''Q1'':{''Manager Comments'':1,''Employee Comments'':1,''Manager Ratings'':1,''Employee Ratings'':1}}}',
  `line_manager_1` bigint DEFAULT NULL COMMENT 'Line 1 reporting manager',
  `line_manager_2` bigint DEFAULT NULL COMMENT 'Line 2 reporting manager',
  `line_manager_3` bigint DEFAULT NULL COMMENT 'Line 3 reporting manager',
  `line_manager_4` bigint DEFAULT NULL COMMENT 'Line 4 reporting manager',
  `line_manager_5` bigint DEFAULT NULL COMMENT 'Line 5 reporting manager',
  `manager_levels` tinyint unsigned DEFAULT NULL COMMENT 'no.of levels of appraisal',
  `module_flag` tinyint unsigned DEFAULT NULL COMMENT '1=performance appraisal,2=feedforward',
  `createdby` bigint unsigned DEFAULT NULL,
  `createdby_role` bigint unsigned DEFAULT NULL,
  `createdby_group` bigint unsigned DEFAULT NULL,
  `modifiedby` bigint unsigned DEFAULT NULL,
  `modifiedby_role` bigint unsigned DEFAULT NULL,
  `modifiedby_group` bigint unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Stores the questions, privileges and groups when initialized';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_pa_questions_privileges_temp`
--

LOCK TABLES `main_pa_questions_privileges_temp` WRITE;
/*!40000 ALTER TABLE `main_pa_questions_privileges_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_pa_questions_privileges_temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:53
