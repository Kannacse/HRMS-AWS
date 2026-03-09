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
-- Table structure for table `prev_emp_educational_attachment`
--

DROP TABLE IF EXISTS `prev_emp_educational_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prev_emp_educational_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `request_id` int DEFAULT NULL,
  `prev_educational_id` int DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `si_folio_no` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PREV_EMP_EDUCATIONAL_ATTACHMENT_USER_ID_idx` (`user_id`),
  KEY `PREV_EMP_EDUCATIONAL_ATTACHMENT_PREV_EDUCATIONAL_ID_idx` (`prev_educational_id`),
  KEY `PREV_EMP_EDUCATIONAL_ATTACHMENT_ATTACHMENT_ID_idx` (`attachment_id`),
  KEY `PREV_EMP_EDUCATIONAL_ATTACHMENT_REQUEST_ID` (`request_id`),
  CONSTRAINT `PREV_EMP_EDUCATIONAL_ATTACHMENT_ATTACHMENT_ID` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`),
  CONSTRAINT `PREV_EMP_EDUCATIONAL_ATTACHMENT_PREV_EDUCATIONAL_ID` FOREIGN KEY (`prev_educational_id`) REFERENCES `prev_emp_education_details` (`id`),
  CONSTRAINT `PREV_EMP_EDUCATIONAL_ATTACHMENT_REQUEST_ID` FOREIGN KEY (`request_id`) REFERENCES `prev_emp_details_request` (`id`),
  CONSTRAINT `PREV_EMP_EDUCATIONAL_ATTACHMENT_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prev_emp_educational_attachment`
--

LOCK TABLES `prev_emp_educational_attachment` WRITE;
/*!40000 ALTER TABLE `prev_emp_educational_attachment` DISABLE KEYS */;
INSERT INTO `prev_emp_educational_attachment` VALUES (1,57,2,1,6,'fff6789234',NULL,'education_attachment_marksheet_file_57_1_072405.pdf','2024-02-05 07:24:05','2024-02-05 07:32:36',0),(2,57,2,2,7,'Sgf231',NULL,'education_attachment_degree_certificate_file_57_2_072405.pdf','2024-02-05 07:24:05','2024-02-05 07:24:05',0),(3,57,2,2,8,'Sgf916',NULL,'education_attachment_provisional_certificate_file_57_2_072405.pdf','2024-02-05 07:24:05','2024-02-05 07:24:05',0),(4,57,2,1,6,'ddcdcFRE',NULL,'education_attachment_marksheet_file_57_update_073236.pdf','2024-02-05 07:32:36','2024-02-05 07:35:26',0),(5,57,2,3,8,'F32502',NULL,'education_attachment_provisional_certificate_file_57_3_073236.pdf','2024-02-05 07:32:36','2024-02-05 07:32:36',0),(6,57,2,1,6,'asdd234',NULL,'education_attachment_marksheet_file_57_update_073526.pdf','2024-02-05 07:35:26','2024-02-05 07:35:26',1),(7,57,2,4,7,'FGH567',NULL,'education_attachment_degree_certificate_file_57_4_073526.pdf','2024-02-05 07:35:26','2024-02-05 07:35:26',0),(8,57,2,4,8,'FGHyu',NULL,'education_attachment_provisional_certificate_file_57_4_073526.pdf','2024-02-05 07:35:26','2024-02-05 07:35:26',0),(9,57,2,5,7,'asdf2345',NULL,'education_attachment_degree_certificate_file_57_5_074329.pdf','2024-02-05 07:43:29','2024-02-05 07:43:29',0),(10,57,2,5,8,'asdf7896',NULL,'education_attachment_provisional_certificate_file_57_5_074329.pdf','2024-02-05 07:43:29','2024-02-05 07:43:29',0),(11,57,2,5,9,'FGHR56789',NULL,'education_attachment_consolidate_marksheet_file_57_5_074329.pdf','2024-02-05 07:43:29','2024-02-05 07:43:29',0),(12,57,2,6,7,'1234asdf',NULL,'education_attachment_degree_certificate_file_57_6_074329.pdf','2024-02-05 07:43:29','2024-02-05 07:43:29',1),(13,57,2,6,8,'adf345',NULL,'education_attachment_provisional_certificate_file_57_6_074329.pdf','2024-02-05 07:43:29','2024-02-05 07:44:51',0),(14,57,2,6,9,'2345dfe',NULL,'education_attachment_consolidate_marksheet_file_57_6_074329.pdf','2024-02-05 07:43:29','2024-02-05 07:43:29',1),(15,57,2,6,8,'1234asf',NULL,'education_attachment_provisional_certificate_file_57_update_074451.pdf','2024-02-05 07:44:51','2024-02-05 07:44:51',1),(16,57,2,6,6,'asdf',NULL,'education_attachment_marksheet_file_57_update_074617.pdf','2024-02-05 07:46:17','2024-02-05 07:46:17',1),(17,57,2,7,7,'sadf234',NULL,'education_attachment_degree_certificate_file_57_7_074617.pdf','2024-02-05 07:46:17','2024-02-05 07:46:17',1),(18,57,2,7,8,'asdf3434',NULL,'education_attachment_provisional_certificate_file_57_7_074617.pdf','2024-02-05 07:46:17','2024-02-05 07:46:17',1),(19,57,2,7,9,'asdf345sadf',NULL,'education_attachment_consolidate_marksheet_file_57_7_074617.pdf','2024-02-05 07:46:17','2024-02-05 07:46:17',1),(20,77,265,9,8,'y','67ff3dd4292024d8575c24e7','H-9000-410843-410843.pdf','2025-04-16 05:19:16','2025-04-16 05:19:16',1),(21,242,355,10,6,'8BnNrW1cT7K+nNS0CInf/0s9G7ciY9Zu4StAj1vHuiA=','698d66a63ca74dce27543f25','H-9000-401284-401284.pdf','2026-02-12 05:35:35','2026-02-12 05:35:35',1),(22,242,355,11,8,'IFHUB3ff0WoUP1CkTQNtxTqnq5HnLFR48OCehANVYDk=','698d66a73ca74dce27543f27','H-9000-983485-983485.pdf','2026-02-12 05:35:35','2026-02-12 05:35:35',1);
/*!40000 ALTER TABLE `prev_emp_educational_attachment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:00:04
