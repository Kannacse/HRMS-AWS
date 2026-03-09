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
-- Table structure for table `main_racecode`
--

DROP TABLE IF EXISTS `main_racecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_racecode` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `racecode` varchar(255) NOT NULL,
  `racename` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_racecode`
--

LOCK TABLES `main_racecode` WRITE;
/*!40000 ALTER TABLE `main_racecode` DISABLE KEYS */;
INSERT INTO `main_racecode` VALUES (1,'','Australoid','Australoid peoples ranged throughout Indonesia, Malaysia, Australia, New Guinea, Melanesia, the Andaman Islands and the Indian subcontinent,as well as parts of the Middle East.',1,1,'2016-11-02 11:14:16','2016-11-02 11:14:16',1),(2,'','Caucasoid','Caucasian race has been used to describe the physical or biological type of some or all of the populations of Europe, North Africa, the Horn of Africa, Western Asia, Central Asia, and South Asia.',1,1,'2016-11-02 11:14:16','2016-11-02 11:14:16',1),(3,'','Mongoloid','Mongoloid are the populations of East Asia, Central Asia, Southeast Asia, Eastern Russia, the Arctic, the Americas, parts of the Pacific Islands, and some northeastern parts of South Asia.',1,1,'2016-11-02 11:14:16','2016-11-02 11:14:16',1),(4,'','Negroid','Negroids are traditionally distinguished by physical characteristics such as brown to black skin and often tightly curled hairand including peoples indigenous to sub-Saharan Africa.',1,1,'2016-11-02 11:14:16','2016-11-02 11:14:16',1);
/*!40000 ALTER TABLE `main_racecode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:48
