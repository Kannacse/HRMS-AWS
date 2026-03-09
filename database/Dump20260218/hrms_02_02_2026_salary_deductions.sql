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
-- Table structure for table `salary_deductions`
--

DROP TABLE IF EXISTS `salary_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_deductions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary_type_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deduction_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'post-tax -1,pre-tax -2',
  `frequency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '(recursive -1, onetime -2)',
  `pre_tax_deduction_id` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SALARY_DEDUCTIONS_SALARY_COMPONENTS_idx` (`salary_type_id`),
  CONSTRAINT `FK_SALARY_DEDUCTIONS_SALARY_COMPONENTS` FOREIGN KEY (`salary_type_id`) REFERENCES `salary_components` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_deductions`
--

LOCK TABLES `salary_deductions` WRITE;
/*!40000 ALTER TABLE `salary_deductions` DISABLE KEYS */;
INSERT INTO `salary_deductions` VALUES (1,2,'TDS','2','1',NULL,NULL,1,1,'2023-03-30 17:09:13','2023-03-30 17:09:13',1),(2,2,'Insurance','1','1',NULL,'1003',1,1,'2023-03-31 05:08:30','2023-03-31 05:08:30',1),(3,2,'LOP','1','1',NULL,NULL,1,1,'2024-03-28 13:03:53','2024-03-28 13:03:53',1),(4,2,'Salary Advance ','1','1',NULL,NULL,187,187,'2024-05-08 07:11:10','2024-05-16 11:09:54',1),(5,2,'PF','1','1',NULL,'3600',187,187,'2024-12-16 05:02:47','2024-12-16 05:02:47',1),(6,2,'Professional Tax','1','1',NULL,'208',187,187,'2024-12-16 09:05:05','2024-12-16 09:05:05',1),(7,2,'Laptop Recovery','1','1',NULL,'0',322,322,'2025-02-07 04:55:23','2025-02-07 04:55:23',1),(8,2,'Deduction ','1','2',NULL,'0',322,322,'2025-11-11 05:46:15','2025-11-11 05:46:15',1),(9,2,'Recovery ','1','1',NULL,'0',322,322,'2025-11-24 15:19:30','2025-11-24 15:20:00',0);
/*!40000 ALTER TABLE `salary_deductions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:50
