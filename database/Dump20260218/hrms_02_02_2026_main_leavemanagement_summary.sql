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
-- Table structure for table `main_leavemanagement_summary`
--

DROP TABLE IF EXISTS `main_leavemanagement_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_leavemanagement_summary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `leavemgmt_id` bigint unsigned DEFAULT NULL,
  `cal_startmonth` int unsigned DEFAULT NULL,
  `cal_startmonthname` varchar(100) DEFAULT NULL,
  `weekend_startday` int unsigned DEFAULT NULL,
  `weekend_startdayname` varchar(100) DEFAULT NULL,
  `weekend_endday` int unsigned DEFAULT NULL,
  `weekend_enddayname` varchar(100) DEFAULT NULL,
  `businessunit_id` int unsigned DEFAULT NULL,
  `businessunit_name` varchar(100) DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `hours_day` int DEFAULT NULL,
  `is_satholiday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_halfday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_leavetransfer` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_skipholidays` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `description` varchar(255) DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_leavemanagement_summary`
--

LOCK TABLES `main_leavemanagement_summary` WRITE;
/*!40000 ALTER TABLE `main_leavemanagement_summary` DISABLE KEYS */;
INSERT INTO `main_leavemanagement_summary` VALUES (1,1,1,'January',6,'Saturday',0,'Sunday',1,'CBT ODC-',14,'Accounting and Finance (ACC)',8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:15:56','2024-08-05 05:17:21',1),(2,2,1,'January',6,'Saturday',0,'Sunday',1,'CBT ODC-',17,'Administration (ADMIN)',8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:16:20','2024-08-05 05:17:21',1),(3,3,1,'January',6,'Saturday',0,'Sunday',1,'CBT ODC-',9,'Human Resources (HR)',8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:16:41','2024-08-05 05:17:21',1),(4,4,1,'January',6,'Saturday',0,'Sunday',1,'CBT ODC-',15,'Information Technology (IT)',8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:17:11','2024-08-05 05:17:21',1),(5,5,1,'January',6,'Saturday',0,'Sunday',1,'CBT ODC-',16,'Management (MGT)',8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:17:27','2024-08-05 05:17:21',1),(6,6,1,'January',6,'Saturday',0,'Sunday',1,'CBT ODC-',12,'Sales (SALES)',8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:17:42','2024-08-05 05:17:21',1);
/*!40000 ALTER TABLE `main_leavemanagement_summary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:31
