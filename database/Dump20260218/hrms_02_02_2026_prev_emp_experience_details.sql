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
-- Table structure for table `prev_emp_experience_details`
--

DROP TABLE IF EXISTS `prev_emp_experience_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prev_emp_experience_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `request_id` int DEFAULT NULL,
  `comp_name` varchar(255) DEFAULT NULL,
  `comp_website` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `employee_code` varchar(100) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_contact` varchar(255) DEFAULT NULL,
  `type_of_employment` varchar(255) DEFAULT NULL,
  `ctc` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `reason_for_leaving` varchar(255) DEFAULT NULL,
  `reference_name1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reference_contact1` varchar(255) DEFAULT NULL,
  `reference_email1` varchar(255) DEFAULT NULL,
  `reference_name2` varchar(255) DEFAULT NULL,
  `reference_contact2` varchar(255) DEFAULT NULL,
  `reference_email2` varchar(255) DEFAULT NULL,
  `is_bgv_initiate` tinyint(1) DEFAULT NULL COMMENT '1=yes,2=no',
  `is_bgvverified` tinyint(1) DEFAULT NULL COMMENT '1=yes,0=no',
  `is_active` tinyint DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `PREV_EMP_EXPERIENCE_DETAILS_USER_ID_idx` (`user_id`),
  KEY `PREV_EMP_EXPERIENCE_DETAILS_REQUEST_ID_idx` (`request_id`),
  CONSTRAINT `PREV_EMP_EXPERIENCE_DETAILS_REQUEST_ID` FOREIGN KEY (`request_id`) REFERENCES `prev_emp_details_request` (`id`),
  CONSTRAINT `PREV_EMP_EXPERIENCE_DETAILS_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prev_emp_experience_details`
--

LOCK TABLES `prev_emp_experience_details` WRITE;
/*!40000 ALTER TABLE `prev_emp_experience_details` DISABLE KEYS */;
INSERT INTO `prev_emp_experience_details` VALUES (1,57,13,'Flokie with codeboard','www.flokie.com','Quality Assurance engineer',NULL,NULL,NULL,'2','1300000','2021-02-10','2022-02-17','Due to inconvenience travel ','Gomathy Narayanan','9786006534','goms231@gmail.com','Akila','8765432190','Akilakm23@gmail.com',NULL,NULL,1,'2024-02-05 16:04:18','2024-02-05 16:04:18'),(2,57,13,'Codeboard technology','www.codeboardtech.com','Senior QA',NULL,NULL,NULL,'1','14000000','2021-08-18','2022-02-16','for learning the new environment for more explore.','Madhu','8654321002','madhu234@gmail.com','Akila','7244823818','madhuak234@gmail.com',NULL,NULL,1,'2024-02-05 16:04:18','2024-02-05 16:04:18'),(3,57,13,'Flokie with codeboard','www.flokie.com','Quality Assurance engineer',NULL,NULL,NULL,'2','1300000','2021-02-10','2022-02-17','Due to inconvenience travel ','Gomathy Narayanan','9786006534','goms231@gmail.com','Akila','8765432190','Akilakm23@gmail.com',NULL,NULL,1,'2024-02-05 16:04:27','2024-02-05 16:04:27'),(4,57,13,'Codeboard technology','www.codeboardtech.com','Senior QA',NULL,NULL,NULL,NULL,'14000000','2021-08-18','2022-02-16','for learning the new environment for more explore.','Madhu','8654321002','madhu234@gmail.com','Akila','7244823818','madhuak234@gmail.com',NULL,NULL,0,'2024-02-05 16:04:27','2024-02-05 16:04:27'),(5,57,13,'Flokie with codeboard','www.flokie.com','Quality Assurance engineer',NULL,NULL,NULL,'2','1300000','2021-02-10','2022-02-17','Due to inconvenience travel ','Gomathy Narayanan','9786006534','goms231@gmail.com','Akila','8765432190','Akilakm23@gmail.com',NULL,NULL,0,'2024-02-05 16:04:36','2024-02-05 16:04:36'),(6,57,13,'Codeboard technology','www.codeboardtech.com','Senior QA',NULL,NULL,NULL,NULL,'14000000','2021-08-18','2022-02-16','for learning the new environment for more explore.','Madhu','8654321002','madhu234@gmail.com','Akila','7244823818','madhuak234@gmail.com',NULL,NULL,0,'2024-02-05 16:04:36','2024-02-05 16:04:36'),(7,57,13,'Flokie with codeboard','www.flokie.com','Quality Assurance engineer',NULL,NULL,NULL,'2','1300000','2021-02-10','2022-02-17','Due to inconvenience travel ','Gomathy Narayanan','9786006534','goms231@gmail.com','Akila','8765432190','Akilakm23@gmail.com',NULL,NULL,0,'2024-02-05 16:04:45','2024-02-05 16:04:45'),(8,57,13,'Codeboard technology','www.codeboardtech.com','Senior QA',NULL,NULL,NULL,NULL,'14000000','2021-08-18','2022-02-16','for learning the new environment for more explore.','Madhu','8654321002','madhu234@gmail.com','Akila','7244823818','madhuak234@gmail.com',NULL,NULL,0,'2024-02-05 16:04:45','2024-02-05 16:04:45'),(9,57,13,'Flokie with codeboard','www.flokie.com','Quality Assurance engineer',NULL,NULL,NULL,'2','1300000','2021-02-10','2022-02-17','Due to inconvenience travel ','Gomathy Narayanan','9786006534','goms231@gmail.com','Akila','8765432190','Akilakm23@gmail.com',NULL,NULL,0,'2024-02-05 16:04:54','2024-02-05 16:04:54'),(10,57,13,'Codeboard technology','www.codeboardtech.com','Senior QA',NULL,NULL,NULL,NULL,'14000000','2021-08-18','2022-02-16','for learning the new environment for more explore.','Madhu','8654321002','madhu234@gmail.com','Akila','7244823818','madhuak234@gmail.com',NULL,NULL,0,'2024-02-05 16:04:54','2024-02-05 16:04:54'),(11,57,13,'Flokie with codeboard','www.flokie.com','Quality Assurance engineer',NULL,NULL,NULL,'2','1300000','2021-02-10','2022-02-17','Due to inconvenience travel ','Gomathy Narayanan','9786006534','goms231@gmail.com','Akila','8765432190','Akilakm23@gmail.com',NULL,NULL,0,'2024-02-05 16:05:04','2024-02-05 16:05:04'),(12,57,13,'Codeboard technology','www.codeboardtech.com','Senior QA',NULL,NULL,NULL,NULL,'14000000','2021-08-18','2022-02-16','for learning the new environment for more explore.','Madhu','8654321002','madhu234@gmail.com','Akila','7244823818','madhuak234@gmail.com',NULL,NULL,0,'2024-02-05 16:05:04','2024-02-05 16:05:04');
/*!40000 ALTER TABLE `prev_emp_experience_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:44
