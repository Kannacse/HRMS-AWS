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
-- Table structure for table `main_businessunits`
--

DROP TABLE IF EXISTS `main_businessunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_businessunits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unitname` varchar(255) NOT NULL,
  `unitcode` varchar(50) DEFAULT NULL,
  `description` text,
  `startdate` date DEFAULT NULL,
  `country` int unsigned DEFAULT NULL,
  `state` int unsigned DEFAULT NULL,
  `city` int unsigned DEFAULT NULL,
  `address1` text,
  `address2` text,
  `address3` text,
  `timezone` int DEFAULT NULL,
  `unithead` varchar(255) DEFAULT NULL,
  `service_desk_flag` tinyint unsigned DEFAULT '1' COMMENT '1=buwise,0=deptwise',
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_businessunits`
--

LOCK TABLES `main_businessunits` WRITE;
/*!40000 ALTER TABLE `main_businessunits` DISABLE KEYS */;
INSERT INTO `main_businessunits` VALUES (1,'Codeboard Technology Private Limited','CBT ODC','Codeboard Offshore Development Center',NULL,100,514,1027,'Velachery',NULL,NULL,1,NULL,0,1,239,'2019-06-14 07:26:19','2024-08-05 05:17:21',1),(2,'New business unit','NBU','test','2019-09-02',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,','test','etest',1,NULL,1,1,1,'2019-09-23 06:33:43','2019-11-26 11:01:38',0),(3,'Business Development','BD',NULL,'2020-04-01',100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,1,NULL,1,1,1,'2020-08-19 14:21:00','2020-08-19 14:22:21',0),(4,'Floki Labs','FLOKI','Floki Labs',NULL,100,514,1027,'No.48A (3rd Floor), Taramani 100 feet road, Ramagiri Nagar, Velachery - 600042,',NULL,NULL,2,NULL,1,1,1,'2022-07-04 08:16:21','2022-07-12 08:18:23',1);
/*!40000 ALTER TABLE `main_businessunits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:00
