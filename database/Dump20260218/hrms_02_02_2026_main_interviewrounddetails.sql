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
-- Table structure for table `main_interviewrounddetails`
--

DROP TABLE IF EXISTS `main_interviewrounddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_interviewrounddetails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `interview_id` int unsigned DEFAULT NULL,
  `req_id` int unsigned DEFAULT NULL,
  `candidate_id` int unsigned DEFAULT NULL,
  `interviewer_id` int unsigned DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_mode` enum('In person','Phone','Video conference') DEFAULT 'Phone',
  `interview_round_number` int DEFAULT NULL,
  `interview_round` varchar(50) DEFAULT NULL,
  `interview_feedback` text,
  `interview_comments` text,
  `round_status` enum('Schedule for next round','Qualified','Selected','Disqualified','Decision pending','On hold','Incompetent','Ineligible','Candidate no show','Requisition Closed/Completed') DEFAULT NULL,
  `int_location` varchar(200) DEFAULT NULL,
  `int_city` int unsigned DEFAULT NULL,
  `int_state` int unsigned DEFAULT NULL,
  `int_country` int unsigned DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `modifiedby` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_interviewrounddetails`
--

LOCK TABLES `main_interviewrounddetails` WRITE;
/*!40000 ALTER TABLE `main_interviewrounddetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_interviewrounddetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:01
