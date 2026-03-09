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
-- Table structure for table `main_empcommunicationdetails_bk`
--

DROP TABLE IF EXISTS `main_empcommunicationdetails_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_empcommunicationdetails_bk` (
  `id` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint DEFAULT NULL,
  `personalemail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `perm_streetaddress` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `perm_country` bigint DEFAULT NULL,
  `perm_state` bigint DEFAULT NULL,
  `perm_city` bigint DEFAULT NULL,
  `perm_pincode` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `current_streetaddress` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `current_country` bigint DEFAULT NULL,
  `current_state` bigint DEFAULT NULL,
  `current_city` bigint DEFAULT NULL,
  `current_pincode` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `emergency_number` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `emergency_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `relationship` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `emergency_number2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `emergency_name2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `relationship2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `emergency_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdby` bigint DEFAULT NULL,
  `modifiedby` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_empcommunicationdetails_bk`
--

LOCK TABLES `main_empcommunicationdetails_bk` WRITE;
/*!40000 ALTER TABLE `main_empcommunicationdetails_bk` DISABLE KEYS */;
INSERT INTO `main_empcommunicationdetails_bk` VALUES (1,16,'Sathishkumarcv98@gmail.com','1/319 c, Aayamarathur, Thuttampatti (PO), Omalur (Tk), Salem (Dt)',100,514,1096,'636306','34A, Bharathiyar street, Periyar Nagar, Tharamani, Velacheri, 600042',100,514,1027,'600042','8667426270','Gopi',NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2022-11-24 05:19:58',1),(2,71,'ssschittu@gmail.com','Godavari Street, Bharathi Nagar',100,514,1027,'600005','Godavari Street, Bharathi Nagar',100,514,1027,'600005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,71,NULL,'2022-08-26 10:53:02',1);
/*!40000 ALTER TABLE `main_empcommunicationdetails_bk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:29
