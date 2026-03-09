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
-- Table structure for table `main_organisationinfo`
--

DROP TABLE IF EXISTS `main_organisationinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_organisationinfo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organisationname` varchar(255) DEFAULT NULL,
  `org_image` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `orgdescription` text,
  `totalemployees` int unsigned DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `org_startdate` date DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `secondaryphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `secondaryemail` varchar(255) DEFAULT NULL,
  `faxnumber` varchar(255) DEFAULT NULL,
  `country` int unsigned DEFAULT NULL,
  `state` int unsigned DEFAULT NULL,
  `city` int unsigned DEFAULT NULL,
  `address1` text,
  `address2` text,
  `address3` text,
  `description` text,
  `orghead` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_organisationinfo`
--

LOCK TABLES `main_organisationinfo` WRITE;
/*!40000 ALTER TABLE `main_organisationinfo` DISABLE KEYS */;
INSERT INTO `main_organisationinfo` VALUES (1,'Codeboard Technology Private Limited','organisation_image_1675951337.png','28','www.codeboardtech.com',NULL,3,NULL,'2015-01-01',NULL,NULL,NULL,NULL,NULL,100,514,1027,'NO:48A, 3rd floor, Tharamani, Main Rd, Velachery, Chennai, Tamil Nadu 600042',NULL,NULL,NULL,NULL,NULL,1,187,'2022-07-11 04:11:36','2024-06-06 07:21:07',1);
/*!40000 ALTER TABLE `main_organisationinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:05
