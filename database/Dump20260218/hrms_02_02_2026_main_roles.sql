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
-- Table structure for table `main_roles`
--

DROP TABLE IF EXISTS `main_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) NOT NULL,
  `roletype` varchar(100) DEFAULT NULL,
  `roledescription` varchar(100) DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `levelid` int DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_roles`
--

LOCK TABLES `main_roles` WRITE;
/*!40000 ALTER TABLE `main_roles` DISABLE KEYS */;
INSERT INTO `main_roles` VALUES (1,'Super Admin','admin',NULL,NULL,0,0,0,'2015-07-29 08:45:49','2015-07-29 08:45:49',1),(2,'Management','management','',1,1,1,1,'2015-07-29 08:45:01','2015-07-29 08:45:01',1),(3,'Manager','manager','',2,2,1,1,'2015-07-29 08:45:49','2015-07-29 08:45:49',1),(4,'HR Manager','hrmanager','',3,3,1,1,'2015-07-29 08:46:36','2015-07-29 08:46:36',1),(5,'Employee','employee','',4,4,1,1,'2015-07-29 08:47:54','2015-07-29 08:47:54',1),(6,'User','user','',5,5,1,1,'2015-07-29 09:02:21','2019-11-25 09:31:23',0),(7,'Agency user','agency','',5,5,1,1,'2015-07-29 09:03:19','2019-11-25 09:31:39',0),(8,'System Admin','sysadmin','',6,6,1,1,'2015-07-29 09:04:08','2019-11-25 09:31:56',0),(9,'Team Lead','lead','',4,4,1,1,'2015-07-29 09:05:02','2019-11-25 09:31:47',0),(10,'Finance','finance',NULL,4,4,1,1,'2024-05-15 10:34:52','2024-05-15 10:34:52',1),(11,'HR Recruiter','hrrecruiter',NULL,4,4,1,1,'2025-01-06 11:15:13','2025-01-06 11:15:13',1),(12,'HR Recruitment Manager','hrrecruitmentmanager',NULL,4,4,1,1,'2025-11-17 15:10:00','2025-11-17 15:10:00',1);
/*!40000 ALTER TABLE `main_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:01
