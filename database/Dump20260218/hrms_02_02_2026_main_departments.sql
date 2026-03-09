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
-- Table structure for table `main_departments`
--

DROP TABLE IF EXISTS `main_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `deptname` varchar(150) NOT NULL,
  `deptcode` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `country` int unsigned DEFAULT NULL,
  `state` int unsigned DEFAULT NULL,
  `city` int unsigned DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text,
  `address3` text,
  `timezone` int DEFAULT NULL,
  `depthead` int unsigned DEFAULT NULL,
  `unitid` int DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_departments`
--

LOCK TABLES `main_departments` WRITE;
/*!40000 ALTER TABLE `main_departments` DISABLE KEYS */;
INSERT INTO `main_departments` VALUES (4,'Dalko','CDAL',NULL,'2017-04-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,31,1,1,1,'2019-11-25 09:06:28','2020-08-20 05:20:42',0),(5,'CRM','CCRM',NULL,'2018-01-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,31,1,1,1,'2019-11-26 12:17:22','2020-08-20 05:18:23',0),(6,'LDS','CBT2',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,12,1,1,1,'2019-11-26 12:32:51','2019-11-26 13:36:41',0),(7,'IntroAct','CINT',NULL,'2019-01-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,12,1,1,1,'2019-11-26 12:33:17','2020-08-20 04:51:37',0),(8,'APS','CAPS',NULL,'2019-01-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,12,1,1,1,'2019-11-26 12:34:38','2020-08-20 04:53:01',0),(9,'Human Resources','HR',NULL,'2018-01-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2019-11-26 12:42:19','2022-07-12 11:12:37',1),(10,'inhouse1','CBT7',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,31,1,1,1,'2019-11-27 06:13:15','2019-11-27 06:13:15',0),(11,'Human Resource','HR',NULL,'2019-08-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,12,1,1,1,'2019-12-10 08:31:16','2019-12-11 04:55:57',0),(12,'Sales','SALES',NULL,'2020-04-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2020-08-19 14:23:01','2022-07-12 11:16:27',1),(13,'PHP','KDVO',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2022-07-11 04:12:24','2022-07-11 04:12:24',0),(14,'Accounting and Finance','ACC',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2022-07-12 11:18:24','2022-07-12 11:18:24',1),(15,'Information Technology','IT',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2022-07-12 11:19:31','2022-07-12 11:19:31',1),(16,'Management','MGT',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2022-07-12 11:21:44','2022-07-12 11:21:44',1),(17,'Administration','ADMIN',NULL,NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,64,'2022-07-13 11:39:25','2022-07-26 09:22:07',1),(18,'Information Technology','ITF',NULL,'2024-02-29',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,15,4,187,187,'2024-02-29 05:17:39','2024-02-29 05:17:39',1);
/*!40000 ALTER TABLE `main_departments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:20
