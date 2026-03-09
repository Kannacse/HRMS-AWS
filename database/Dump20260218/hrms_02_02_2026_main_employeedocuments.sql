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
-- Table structure for table `main_employeedocuments`
--

DROP TABLE IF EXISTS `main_employeedocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_employeedocuments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attachments` text,
  `createdby` bigint DEFAULT NULL,
  `modifiedby` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_employeedocuments`
--

LOCK TABLES `main_employeedocuments` WRITE;
/*!40000 ALTER TABLE `main_employeedocuments` DISABLE KEYS */;
INSERT INTO `main_employeedocuments` VALUES (1,42,'Aadhar card','[{\"original_name\":\"Aadhar_Akila_1__1_.jpeg\",\"new_name\":\"1690538019_69_Aadhar_Akila_1__1_.jpeg\"}]',69,69,'2023-07-28 09:53:56','2023-07-28 09:58:56',0),(2,42,'Aadhar','[{\"original_name\":\"Aadhar_card_Aadhar_Akila_1__1__jpeg__1_.zip\",\"new_name\":\"1690538483_69_Aadhar_card_Aadhar_Akila_1__1__jpeg__1_.zip\"}]',69,69,'2023-07-28 10:01:30','2023-07-28 10:01:43',0),(3,42,'Aadhar','[{\"original_name\":\"Aadhar_Akila_1__1_.jpeg\",\"new_name\":\"1690538511_69_Aadhar_Akila_1__1_.jpeg\"}]',69,69,'2023-07-28 10:01:58','2023-07-28 10:02:51',0),(4,42,'Aadhar','[{\"original_name\":\"Aadhar_Akila_1__1_.jpeg\",\"new_name\":\"1690538657_69_Aadhar_Akila_1__1_.jpeg\"}]',69,69,'2023-07-28 10:04:22','2023-07-28 10:04:57',0),(5,187,'aadhar','[{\"original_name\":\"Aadhar_Akila_1__1_.jpeg\",\"new_name\":\"1690788331_69_Aadhar_Akila_1__1_.jpeg\"}]',69,69,'2023-07-31 07:25:38','2023-07-31 08:27:04',0),(6,187,'aadhar','[{\"original_name\":\"aadhar_Aadhar_Akila_1__1__jpeg__4_.zip\",\"new_name\":\"1690792037_69_aadhar_Aadhar_Akila_1__1__jpeg__4_.zip\"}]',69,69,'2023-07-31 08:27:23','2023-07-31 08:29:08',0),(7,187,'aadhar','[{\"original_name\":\"aadhar_Aadhar_Akila_1__1__jpeg_zip.zip\",\"new_name\":\"1690792157_69_aadhar_Aadhar_Akila_1__1__jpeg_zip.zip\"}]',69,69,'2023-07-31 08:29:28','2023-07-31 08:29:28',1),(8,187,'Pan','[{\"original_name\":\"AK___Team.jpg\",\"new_name\":\"1690792245_69_AK___Team.jpg\"},{\"original_name\":\"Anand___Team__1_.jpg\",\"new_name\":\"1690792245_69_Anand___Team__1_.jpg\"}]',69,69,'2023-07-31 08:30:47','2023-07-31 08:30:47',1);
/*!40000 ALTER TABLE `main_employeedocuments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:50
