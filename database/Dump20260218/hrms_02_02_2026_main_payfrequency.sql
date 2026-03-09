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
-- Table structure for table `main_payfrequency`
--

DROP TABLE IF EXISTS `main_payfrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_payfrequency` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `freqtype` varchar(255) NOT NULL,
  `freqcode` varchar(100) DEFAULT NULL,
  `freqdescription` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_payfrequency`
--

LOCK TABLES `main_payfrequency` WRITE;
/*!40000 ALTER TABLE `main_payfrequency` DISABLE KEYS */;
INSERT INTO `main_payfrequency` VALUES (1,'Month','MH','Monthly',1,1,'2019-06-14 05:31:29','2022-07-12 09:25:51',1),(2,'week','WK','Weekly',1,1,'2019-09-23 05:55:04','2022-07-12 09:26:03',1),(3,'year','year',NULL,187,187,'2026-02-11 06:25:49','2026-02-11 06:25:49',1),(4,'kdyny','zLRI','Pay Frequency added',187,187,'2026-02-11 06:26:29','2026-02-11 06:26:29',1),(5,'OmIEG','whHO','Pay Frequency added',187,187,'2026-02-12 06:49:19','2026-02-12 06:49:19',1),(6,'hEsiS','vJHf','Pay Frequency added',187,187,'2026-02-13 07:07:32','2026-02-13 07:07:32',1);
/*!40000 ALTER TABLE `main_payfrequency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:15
