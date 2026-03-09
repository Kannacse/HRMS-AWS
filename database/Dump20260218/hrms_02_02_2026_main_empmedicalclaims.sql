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
-- Table structure for table `main_empmedicalclaims`
--

DROP TABLE IF EXISTS `main_empmedicalclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_empmedicalclaims` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `injury_type` tinyint(1) DEFAULT NULL COMMENT '1-injury,2-maternity,3-paternity,4-disablity',
  `injury_description` text,
  `injury_indicator` tinyint(1) DEFAULT NULL COMMENT '1-yes,2-no',
  `injured_date` date DEFAULT NULL,
  `injury_name` varchar(100) DEFAULT NULL,
  `injury_severity` tinyint(1) DEFAULT NULL COMMENT '1-Major,2-Minor',
  `disability_type` varchar(100) DEFAULT NULL,
  `other_disability_type` varchar(100) DEFAULT NULL,
  `disablity_approved` tinyint(1) DEFAULT '1' COMMENT '1-yes,2-no',
  `medical_insurer_name` varchar(100) DEFAULT NULL COMMENT 'Medical insurer name',
  `expected_date_join` date DEFAULT NULL,
  `leavebyemployeer_to_date` date DEFAULT NULL,
  `leavebyemployeer_from_date` date DEFAULT NULL,
  `leavebyemployeer_days` bigint DEFAULT NULL,
  `leaveappliedbyemployee_to_date` date DEFAULT NULL,
  `leaveappliedbyemployee_from_date` date DEFAULT NULL,
  `leaveappliedbyemployee_days` bigint DEFAULT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `hospital_address` text,
  `room_number` varchar(50) DEFAULT NULL,
  `concerned_physician_name` varchar(100) DEFAULT NULL,
  `treatment_details` text,
  `total_cost` bigint DEFAULT NULL,
  `amount_claimed_for` bigint DEFAULT NULL,
  `amount_approved` bigint DEFAULT NULL,
  `createdby` bigint DEFAULT NULL,
  `modifiedby` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_empmedicalclaims`
--

LOCK TABLES `main_empmedicalclaims` WRITE;
/*!40000 ALTER TABLE `main_empmedicalclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_empmedicalclaims` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:24
