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
-- Table structure for table `main_leavemanagement`
--

DROP TABLE IF EXISTS `main_leavemanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_leavemanagement` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cal_startmonth` int unsigned DEFAULT NULL,
  `weekend_startday` int unsigned DEFAULT NULL,
  `weekend_endday` int unsigned DEFAULT NULL,
  `businessunit_id` int unsigned DEFAULT NULL,
  `department_id` int unsigned DEFAULT '0',
  `hr_id` int DEFAULT NULL,
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
-- Dumping data for table `main_leavemanagement`
--

LOCK TABLES `main_leavemanagement` WRITE;
/*!40000 ALTER TABLE `main_leavemanagement` DISABLE KEYS */;
INSERT INTO `main_leavemanagement` VALUES (1,1,6,0,1,14,64,8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:15:56','2022-07-13 14:15:56',1),(2,1,6,0,1,17,64,8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:16:20','2022-07-13 14:16:20',1),(3,1,6,0,1,9,64,8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:16:41','2022-07-13 14:16:41',1),(4,1,6,0,1,15,64,8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:17:11','2022-07-13 14:17:11',1),(5,1,6,0,1,16,64,8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:17:27','2022-07-13 14:17:27',1),(6,1,6,0,1,12,64,8,NULL,1,1,1,NULL,1,1,'2022-07-13 14:17:42','2022-07-13 14:17:42',1);
/*!40000 ALTER TABLE `main_leavemanagement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:39
