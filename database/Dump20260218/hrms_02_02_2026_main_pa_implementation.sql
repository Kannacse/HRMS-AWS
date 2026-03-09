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
-- Table structure for table `main_pa_implementation`
--

DROP TABLE IF EXISTS `main_pa_implementation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_pa_implementation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `businessunit_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `performance_app_flag` tinyint unsigned DEFAULT NULL COMMENT '1=bu wise,0=dept wise',
  `appraisal_mode` enum('Quarterly','Half-yearly','Yearly') DEFAULT NULL,
  `approval_selection` tinyint unsigned DEFAULT NULL COMMENT '1=HR,2=Manager',
  `appraisal_ratings` tinyint unsigned DEFAULT NULL COMMENT '1=1-5,2=1-10',
  `module_flag` tinyint unsigned DEFAULT NULL COMMENT '1=Performance appraisals,2=Feedforward',
  `isactive` tinyint unsigned DEFAULT NULL COMMENT '0=inactive,1=active,2=delete',
  `createdby` bigint unsigned DEFAULT NULL,
  `modifiedby` bigint unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='stores configuration of appraisal process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_pa_implementation`
--

LOCK TABLES `main_pa_implementation` WRITE;
/*!40000 ALTER TABLE `main_pa_implementation` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_pa_implementation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:36
