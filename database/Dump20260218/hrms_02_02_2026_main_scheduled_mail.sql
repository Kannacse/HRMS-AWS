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
-- Table structure for table `main_scheduled_mail`
--

DROP TABLE IF EXISTS `main_scheduled_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_scheduled_mail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_mail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cc_mail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bcc_mail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `attachement` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_sent` tinyint NOT NULL,
  `createdby` int NOT NULL,
  `modifiedby` int NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_scheduled_mail`
--

LOCK TABLES `main_scheduled_mail` WRITE;
/*!40000 ALTER TABLE `main_scheduled_mail` DISABLE KEYS */;
INSERT INTO `main_scheduled_mail` VALUES (1,'77','karthikeyan.s@codeboardtech.com','sridhar.a@codeboardtech.com','adjaya.mk@codeboardtech.com','Test Mail','2025-05-30',NULL,NULL,NULL,1,322,322,'2025-05-29 12:16:43','2025-05-29 12:17:45',1),(2,'77','karthikeyan.s@codeboardtech.com','sridhar.a@codeboardtech.com','rajarajeswari.c@codeboardtech.com','Test Mail','2025-05-30',NULL,NULL,NULL,1,322,322,'2025-05-30 10:28:28','2025-05-30 10:28:28',1),(3,'77,322','karthikeyan.s@codeboardtech.com,rajarajeswari.c@codeboardtech.com','adjaya.mk@codeboardtech.com','sridhar.a@codeboardtech.com','Test Mail','2025-05-31',NULL,NULL,'<p><br></p>',1,322,322,'2025-05-30 17:56:50','2025-05-30 17:56:50',1),(4,'242','sridhar.a@codeboardtech.com','rajarajeswari.c@codeboardtech.com,adjaya.mk@codeboardtech.com','karthikeyan.s@codeboardtech.com','Test Mail','2025-06-10','1749536241_Dinesh Reddy S_BA (1).pdf','1749536241_Untitled design (2).jpg','<p><br></p>',1,322,322,'2025-06-10 11:47:21','2025-06-10 11:47:21',1);
/*!40000 ALTER TABLE `main_scheduled_mail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:59
