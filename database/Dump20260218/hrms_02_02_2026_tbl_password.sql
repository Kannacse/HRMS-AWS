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
-- Table structure for table `tbl_password`
--

DROP TABLE IF EXISTS `tbl_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_password` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `passwordtype` varchar(255) DEFAULT NULL,
  `description` text,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_password`
--

LOCK TABLES `tbl_password` WRITE;
/*!40000 ALTER TABLE `tbl_password` DISABLE KEYS */;
INSERT INTO `tbl_password` VALUES (1,'Alphanumeric','The password should contain atleast one alphabet and one number.\r\nThe minimum length should be 6 characters and maximum length should be 15 characters.\r\nEg: myname123',4,4,'2013-08-16 17:21:32','2013-08-16 17:21:32',1),(2,'Alphanumeric and Special Characters','The password should contain atleast one alphabet, one number and one special character. \r\nThe minimum length should be 6 characters and maximum length should be 15 characters.\r\nAllowed special characters are .-#$@&_*\r\nExample: myname123@#\r\n',4,4,'2013-08-16 17:22:34','2013-08-16 17:22:34',1),(3,'Only Numbers','The password should contain only numbers.\r\nThe minimum length should be 6 characters and maximum length should be 15 characters.\r\nEg: 123456',4,4,'2013-08-16 17:23:18','2013-08-16 17:23:18',1),(4,'Numbers and Special Characters','The password should contain atleast one number and one special character.\r\nThe minimum length should be 6 characters and maximum length should be 15 characters. \r\nAllowed special characters are .-#$@&_*\r\n\r\nExample: 1234@#$',4,4,'2013-08-16 17:23:56','2013-08-16 17:23:56',1);
/*!40000 ALTER TABLE `tbl_password` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:38
