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
-- Table structure for table `main_emailgroups`
--

DROP TABLE IF EXISTS `main_emailgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_emailgroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_code` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_emailgroups`
--

LOCK TABLES `main_emailgroups` WRITE;
/*!40000 ALTER TABLE `main_emailgroups` DISABLE KEYS */;
INSERT INTO `main_emailgroups` VALUES (1,'Requisition - HR Group','REQ_HR','Used in resource requisition for HR',1,NULL,NULL,'2013-10-05 14:22:17','2013-10-05 14:22:17'),(2,'Leave Management','LV_HR','Used in leave management',1,NULL,NULL,'2013-10-05 14:22:17','2013-10-05 14:22:17'),(3,'Performance Appraisal','PER_APPRAISAL','Used in performance appraisal',1,NULL,NULL,'2013-10-05 14:22:17','2013-10-05 14:22:17'),(4,'Background Check - HR Group','BG_CHECKS_HR','Used in background check',1,NULL,NULL,'2013-10-05 14:22:17','2013-10-05 14:22:17'),(5,'Requisition - Management Group','REQ_MGMT','Used in resource requisition for Management',1,NULL,NULL,'2013-10-08 00:00:00','2013-10-08 00:00:00'),(6,'Background Check - Management Group','BG_CHECKS_MNGMNT','Background check management',1,NULL,NULL,'2013-10-10 14:16:31','2013-10-10 14:16:31');
/*!40000 ALTER TABLE `main_emailgroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:52
