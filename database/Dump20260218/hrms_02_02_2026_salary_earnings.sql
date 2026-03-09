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
-- Table structure for table `salary_earnings`
--

DROP TABLE IF EXISTS `salary_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_earnings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary_type_id` varchar(255) DEFAULT NULL,
  `component_name` varchar(255) DEFAULT NULL,
  `calculation_type` varchar(255) DEFAULT NULL,
  `calculation_from` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `taxable` int NOT NULL,
  `pro_rata_basis` int NOT NULL,
  `is_default` int NOT NULL,
  `payslip_view` int NOT NULL DEFAULT '1' COMMENT '(1-Yes,0-No)',
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_earnings`
--

LOCK TABLES `salary_earnings` WRITE;
/*!40000 ALTER TABLE `salary_earnings` DISABLE KEYS */;
INSERT INTO `salary_earnings` VALUES (1,'1','CTC','flat',NULL,NULL,0,0,1,0,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49',1),(2,'1','Basic Pay','percent','1','50',1,2,1,1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49',1),(3,'1','Other Allowance','flat',NULL,NULL,1,2,1,1,1,1,'2024-03-28 18:33:49','2024-03-28 18:33:49',1),(4,'1','HRA','percent','2','50',1,2,1,1,187,187,'2024-04-23 06:37:45','2024-04-23 06:46:06',1),(5,'1','Medical Allowance','flat','1','1666',1,2,1,1,187,187,'2024-04-23 06:41:24','2024-04-23 06:46:18',0),(6,'1','Conveyance','flat','1','1600',1,2,1,1,187,187,'2024-04-23 06:42:57','2024-04-23 06:46:33',0),(7,'1','LTA','percent','2','5',1,2,1,1,187,187,'2024-04-23 06:43:41','2024-04-23 06:46:43',0),(8,'1','Performance Bonus','percent','1','5',1,2,1,1,187,187,'2024-04-23 06:45:25','2024-04-23 06:46:58',0),(9,'1','Reimbursement','flat','9','10000',2,2,2,1,187,187,'2024-04-30 11:29:19','2024-04-30 11:49:20',0),(10,'1','Test','flat','1','0',1,2,2,1,187,187,'2024-04-30 12:28:28','2024-04-30 12:32:14',0),(11,'1','Salary Bonus','flat','1','100000',2,2,1,1,187,187,'2024-05-29 11:31:10','2024-05-29 11:34:42',0),(12,'1','Salary Bonus','flat','12','100000',1,2,2,1,187,187,'2024-05-29 11:35:52','2024-08-21 05:57:34',0),(13,'1','Arrear','percent','1','0',1,2,2,1,322,322,'2025-06-03 10:32:51','2025-06-03 10:36:37',0);
/*!40000 ALTER TABLE `salary_earnings` ENABLE KEYS */;
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
