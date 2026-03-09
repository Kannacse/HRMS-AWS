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
-- Table structure for table `main_dateformat`
--

DROP TABLE IF EXISTS `main_dateformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_dateformat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mysql_dateformat` varchar(50) DEFAULT NULL COMMENT 'format for mysql',
  `js_dateformat` varchar(50) DEFAULT NULL COMMENT 'format for javascript',
  `dateformat` varchar(50) NOT NULL COMMENT 'for php',
  `example` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_dateformat`
--

LOCK TABLES `main_dateformat` WRITE;
/*!40000 ALTER TABLE `main_dateformat` DISABLE KEYS */;
INSERT INTO `main_dateformat` VALUES (1,'%m/%d/%y','mm/dd/y','m/d/y','10/01/13','American month, day and year(2 digits)',1,1,'2013-10-04 13:18:25','2013-10-05 11:29:37',0),(2,'%m/%d/%Y','mm/dd/yy','m/d/Y','01/01/2013','American month, day and year',1,1,'2013-10-04 13:22:25','2013-10-04 13:22:25',1),(3,'%Y/%m/%d','yy/mm/dd','Y/m/d','2013/10/01','Four digit year, month and day with slashes',1,1,'2013-10-04 13:23:46','2013-10-04 13:23:46',1),(4,'%Y-%m-%d','yy-mm-dd','Y-m-d','2013-03-31','Year, month and day with dashes',1,1,'2013-10-04 13:26:34','2013-10-04 13:26:34',1),(5,'%d.%m.%Y','dd.mm.yy','d.m.Y','10.01.2013','Day, month and four digit year with dots',1,1,'2013-10-04 13:30:29','2013-10-04 13:30:29',1),(6,'%d-%m-%Y','dd-mm-yy','d-m-Y','10-01-2013','Day, month and four digit year with dashes',1,1,'2013-10-04 13:30:55','2013-10-04 13:30:55',1),(9,'%d %M %Y','dd MM yy','d F Y','04 October 2013','Day, textual month and year',1,1,'2013-10-04 13:36:40','2013-10-04 13:37:35',1),(10,'%M %D, %Y','MM dd, yy','F jS, Y','July 1st, 2008','Textual month, day and year',1,1,'2013-10-04 13:41:36','2013-10-04 13:41:36',1),(11,'%b-%d-%Y','M-dd-yy','M-d-Y','Apr-17-2012','Month abbreviation, day and year',1,1,'2013-10-04 13:43:16','2013-10-04 13:43:16',1),(12,'%Y-%b-%d','yy-M-dd','Y-M-d','2013-Dec-22','Year, month abbreviation and day',1,1,'2013-10-04 13:44:27','2013-10-04 13:44:27',1);
/*!40000 ALTER TABLE `main_dateformat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:20
