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
-- Table structure for table `main_timeformat`
--

DROP TABLE IF EXISTS `main_timeformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_timeformat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timeformat` varchar(60) NOT NULL,
  `mysql_timeformat` varchar(60) DEFAULT NULL,
  `js_timeformat` varchar(60) DEFAULT NULL,
  `example` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_timeformat`
--

LOCK TABLES `main_timeformat` WRITE;
/*!40000 ALTER TABLE `main_timeformat` DISABLE KEYS */;
INSERT INTO `main_timeformat` VALUES (1,'h A',NULL,NULL,'9 AM','Hour only, with meridian',1,1,'2013-10-04 17:51:17','2013-10-04 17:51:17',1),(2,'h:i A',NULL,NULL,'9:10 AM','Hour and minutes, with meridian',1,1,'2013-10-04 17:51:17','2013-10-04 17:51:17',1),(3,'h:i:s A',NULL,NULL,'9:10:10 AM','Hour, minutes and seconds, with meridian',1,1,'2013-10-04 17:51:17','2013-10-04 17:51:17',1),(5,'H:i',NULL,NULL,'22:10','Hour and minutes, 24 Hours Notation',1,1,'2013-10-04 17:51:17','2013-10-04 17:51:17',1),(6,'H:i:s',NULL,NULL,'15:10:55','Hour, minutes and seconds, 24 Hours Notation',1,1,'2013-10-04 17:51:17','2013-10-04 17:51:17',1);
/*!40000 ALTER TABLE `main_timeformat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:17
