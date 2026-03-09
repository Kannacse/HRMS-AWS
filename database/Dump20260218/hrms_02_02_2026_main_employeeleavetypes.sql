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
-- Table structure for table `main_employeeleavetypes`
--

DROP TABLE IF EXISTS `main_employeeleavetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_employeeleavetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `leavetype` varchar(255) DEFAULT NULL,
  `leavecode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `maxapprovedays` int DEFAULT NULL,
  `leavepreallocated` tinyint DEFAULT NULL COMMENT '1-yes,2-No',
  `leavepredeductable` tinyint DEFAULT NULL COMMENT '1-yes,2-No',
  `sandwichleave` tinyint DEFAULT NULL COMMENT '1-yes,2-No',
  `carryforward` tinyint DEFAULT NULL COMMENT '1-yes,2-No',
  `number_of_leaves_carry_forward` varchar(250) DEFAULT NULL,
  `allocate_type` enum('1','2','3') DEFAULT NULL COMMENT '(1->Quarter)\r\n(2->Half)\r\n(3->Annual)',
  `elapse_period` tinyint DEFAULT NULL COMMENT '1-yes,2-No',
  `elapse_per_year` varchar(11) DEFAULT NULL,
  `leave_flag` tinyint DEFAULT '1' COMMENT '1-yes,2-No',
  `multiple_date_flag` tinyint DEFAULT '1' COMMENT '1-yes,2-No',
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_employeeleavetypes`
--

LOCK TABLES `main_employeeleavetypes` WRITE;
/*!40000 ALTER TABLE `main_employeeleavetypes` DISABLE KEYS */;
INSERT INTO `main_employeeleavetypes` VALUES (1,'Casual Leave','CL',NULL,NULL,1,1,2,1,'3','1',2,NULL,1,1,1,322,'2022-07-15 02:09:50','2025-12-31 11:13:49',1),(2,'Sick Leave','SL',NULL,NULL,1,1,2,2,NULL,'1',2,NULL,1,1,1,322,'2022-07-15 02:10:39','2025-12-31 11:14:25',1),(3,'Bereavement Leave','BL',NULL,NULL,1,1,2,2,NULL,'1',2,NULL,1,1,1,322,'2022-07-15 02:11:30','2025-12-31 11:16:24',1),(4,'Vacation Leave','VL',NULL,3,1,1,2,2,NULL,NULL,2,NULL,1,1,1,1,'2022-07-15 02:12:28','2022-07-15 02:12:28',1),(5,'Family Medical Leave','FML',NULL,3,1,1,2,2,NULL,NULL,2,NULL,1,1,1,1,'2022-07-15 02:13:23','2022-07-15 02:13:23',1),(6,'Paternity leave','PL',NULL,NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,322,'2024-01-29 06:06:18','2025-12-31 11:15:16',1),(7,'Wedding leave','WL',NULL,NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,322,'2024-01-29 06:15:22','2025-12-31 11:16:35',1),(8,'Overtime Request','OTR',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,NULL,NULL,NULL,NULL,1),(9,'Maternity Leave','ML','Maternity leave for female employees - 180 days',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,239,322,'2024-09-12 05:46:42','2025-12-31 11:17:43',1),(10,'Comp off','CO',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,NULL,NULL,NULL,NULL,1),(11,'Probation Leave',NULL,NULL,NULL,1,1,2,2,NULL,'1',2,NULL,1,1,322,322,'2025-08-14 09:44:16','2025-12-31 11:16:11',1),(12,'Unpaid Leave','UL',NULL,NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2025-11-18 08:18:23','2025-12-31 13:19:40',1),(13,'Functional','FunHL','Functional',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-11 07:18:55','2026-02-11 07:18:55',1),(14,'FunctionalFunctionalFunctional','FunHLFunHLFunHL','functional holidayfunctional holidayfunctional holiday',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-11 08:02:03','2026-02-11 08:02:03',1),(15,'occational','occ','occational holiday',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-11 09:19:25','2026-02-11 09:19:25',1),(16,'Normal','NOR','Normal holiday',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-11 09:35:53','2026-02-11 09:35:53',1),(17,'Abnormal Leave','ABL','AbNormal holiday',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-11 10:10:48','2026-02-11 10:10:48',1),(18,'Sick','sick','Emergency leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-11 13:05:14','2026-02-13 09:10:38',1),(19,'Emergencies','EMGC','Emergency leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 09:12:59','2026-02-13 09:16:00',1),(20,'Emergenci','EMGi','Emergency leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 09:50:04','2026-02-13 10:57:40',1),(21,'Casual','CAL','Casual leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 10:58:20','2026-02-13 11:28:21',1),(22,'Appoved','apl','Emergency leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 11:29:32','2026-02-13 11:32:57',1),(23,'Medical','Med','Emergency leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 11:34:00','2026-02-13 11:43:51',1),(24,'Emergency','EMG','Emergency leave',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 11:45:11','2026-02-13 11:45:11',1),(25,'medical emergency Leave','MEL','Earned',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 12:05:15','2026-02-13 12:08:24',1),(26,'informed Leave','INL','informed',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 12:10:52','2026-02-13 12:13:40',1),(27,'long Leave','LL','Earned',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 12:15:02','2026-02-13 12:18:04',1),(28,'Leave','LLL','Earned',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 12:19:10','2026-02-13 12:25:04',1),(29,'EL','ELL','Earned',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 12:26:35','2026-02-13 13:06:28',1),(30,'Earned Leave','EL','Earned',NULL,1,1,2,2,NULL,'1',2,NULL,1,1,187,187,'2026-02-13 13:07:23','2026-02-13 13:07:23',1);
/*!40000 ALTER TABLE `main_employeeleavetypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:00
