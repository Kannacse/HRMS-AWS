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
-- Table structure for table `prev_emp_experience_attachments`
--

DROP TABLE IF EXISTS `prev_emp_experience_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prev_emp_experience_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` int DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `prev_professional_id` int DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PREV_EMP_EXPERIENCE_ATTACHMENTS_USER_ID_idx` (`user_id`),
  KEY `PREV_EMP_EXPERIENCE_ATTACHMENTS_PREV_PROFESSIONAL_ID_idx` (`prev_professional_id`),
  KEY `PREV_EMP_EXPERIENCE_ATTACHMENTS_ATTACHMENT_ID_idx` (`attachment_id`),
  KEY `PREV_EMP_EXPERIENCE_ATTACHMENTS_REQUEST_ID` (`request_id`),
  CONSTRAINT `PREV_EMP_EXPERIENCE_ATTACHMENTS_ATTACHMENT_ID` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`),
  CONSTRAINT `PREV_EMP_EXPERIENCE_ATTACHMENTS_PREV_PROFESSIONAL_ID` FOREIGN KEY (`prev_professional_id`) REFERENCES `prev_emp_experience_details` (`id`),
  CONSTRAINT `PREV_EMP_EXPERIENCE_ATTACHMENTS_REQUEST_ID` FOREIGN KEY (`request_id`) REFERENCES `prev_emp_details_request` (`id`),
  CONSTRAINT `PREV_EMP_EXPERIENCE_ATTACHMENTS_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prev_emp_experience_attachments`
--

LOCK TABLES `prev_emp_experience_attachments` WRITE;
/*!40000 ALTER TABLE `prev_emp_experience_attachments` DISABLE KEYS */;
INSERT INTO `prev_emp_experience_attachments` VALUES (1,13,57,1,10,'professional_attachment_offer_letter_57_1_0_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',1),(2,13,57,1,11,'professional_attachment_relieving_letter_57_1_0_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',1),(3,13,57,1,13,'professional_attachment_payslips_57_1_0_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',0),(4,13,57,1,14,'professional_attachment_bank_statement_57_1_0_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',1),(5,13,57,2,10,'professional_attachment_offer_letter_57_2_1_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',1),(6,13,57,2,11,'professional_attachment_relieving_letter_57_2_1_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',1),(7,13,57,2,12,'professional_attachment_appraisel_letter_57_2_1_103418.pdf',NULL,'2024-02-05 10:34:18','2024-02-05 10:34:18',1),(8,13,57,3,10,'professional_attachment_offer_letter_57_3_0_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',1),(9,13,57,3,11,'professional_attachment_relieving_letter_57_3_0_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',1),(10,13,57,3,13,'professional_attachment_payslips_57_3_0_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',1),(11,13,57,3,14,'professional_attachment_bank_statement_57_3_0_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',1),(12,13,57,4,10,'professional_attachment_offer_letter_57_4_1_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',0),(13,13,57,4,11,'professional_attachment_relieving_letter_57_4_1_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',0),(14,13,57,4,12,'professional_attachment_appraisel_letter_57_4_1_103427.pdf',NULL,'2024-02-05 10:34:27','2024-02-05 10:34:27',0),(15,13,57,5,10,'professional_attachment_offer_letter_57_5_0_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(16,13,57,5,11,'professional_attachment_relieving_letter_57_5_0_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(17,13,57,5,13,'professional_attachment_payslips_57_5_0_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(18,13,57,5,14,'professional_attachment_bank_statement_57_5_0_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(19,13,57,6,10,'professional_attachment_offer_letter_57_6_1_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(20,13,57,6,11,'professional_attachment_relieving_letter_57_6_1_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(21,13,57,6,12,'professional_attachment_appraisel_letter_57_6_1_103436.pdf',NULL,'2024-02-05 10:34:36','2024-02-05 10:34:36',0),(22,13,57,7,10,'professional_attachment_offer_letter_57_7_0_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(23,13,57,7,11,'professional_attachment_relieving_letter_57_7_0_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(24,13,57,7,13,'professional_attachment_payslips_57_7_0_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(25,13,57,7,14,'professional_attachment_bank_statement_57_7_0_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(26,13,57,8,10,'professional_attachment_offer_letter_57_8_1_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(27,13,57,8,11,'professional_attachment_relieving_letter_57_8_1_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(28,13,57,8,12,'professional_attachment_appraisel_letter_57_8_1_103445.pdf',NULL,'2024-02-05 10:34:45','2024-02-05 10:34:45',0),(29,13,57,9,10,'professional_attachment_offer_letter_57_9_0_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(30,13,57,9,11,'professional_attachment_relieving_letter_57_9_0_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(31,13,57,9,13,'professional_attachment_payslips_57_9_0_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(32,13,57,9,14,'professional_attachment_bank_statement_57_9_0_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(33,13,57,10,10,'professional_attachment_offer_letter_57_10_1_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(34,13,57,10,11,'professional_attachment_relieving_letter_57_10_1_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(35,13,57,10,12,'professional_attachment_appraisel_letter_57_10_1_103454.pdf',NULL,'2024-02-05 10:34:54','2024-02-05 10:34:54',0),(36,13,57,11,10,'professional_attachment_offer_letter_57_11_0_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(37,13,57,11,11,'professional_attachment_relieving_letter_57_11_0_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(38,13,57,11,13,'professional_attachment_payslips_57_11_0_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(39,13,57,11,14,'professional_attachment_bank_statement_57_11_0_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(40,13,57,12,10,'professional_attachment_offer_letter_57_12_1_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(41,13,57,12,11,'professional_attachment_relieving_letter_57_12_1_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(42,13,57,12,12,'professional_attachment_appraisel_letter_57_12_1_103504.pdf',NULL,'2024-02-05 10:35:04','2024-02-05 10:35:04',0),(43,13,57,1,13,'professional_attachment_payslips_57_1_0_104815.pdf',NULL,'2024-02-05 10:48:15','2024-02-05 10:48:15',1),(44,13,57,1,13,'professional_attachment_payslips_57_1_1_104815.pdf',NULL,'2024-02-05 10:48:15','2024-02-05 10:48:15',1),(45,13,57,1,13,'professional_attachment_payslips_57_1_2_104815.pdf',NULL,'2024-02-05 10:48:15','2024-02-05 10:48:15',1);
/*!40000 ALTER TABLE `prev_emp_experience_attachments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:27
