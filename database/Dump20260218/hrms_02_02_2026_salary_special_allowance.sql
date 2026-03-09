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
-- Table structure for table `salary_special_allowance`
--

DROP TABLE IF EXISTS `salary_special_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_special_allowance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `allowance_name` varchar(255) NOT NULL,
  `calculation_type` varchar(255) NOT NULL,
  `calculate_from` int DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `taxable` int DEFAULT NULL,
  `pro_rata_basis` int NOT NULL,
  `is_default` int NOT NULL,
  `payslip_view` int DEFAULT NULL COMMENT '(1-Yes,0-No)',
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_special_allowance`
--

LOCK TABLES `salary_special_allowance` WRITE;
/*!40000 ALTER TABLE `salary_special_allowance` DISABLE KEYS */;
INSERT INTO `salary_special_allowance` VALUES (1,'Conveyance Allowance','flat',NULL,'1600',1,2,2,NULL,322,322,'2025-04-22 07:09:32','2025-04-22 07:09:32',1),(2,'Medical Reimbursement','flat',NULL,'1250',1,2,2,NULL,322,322,'2025-04-22 07:09:56','2025-04-22 07:09:56',1),(3,'Remote Area Allowance','flat',NULL,'200',1,2,2,NULL,322,322,'2025-04-22 07:10:11','2025-04-22 07:10:11',1),(4,'Children Education Allowance','flat',NULL,'100',1,2,2,NULL,322,322,'2025-04-22 07:10:48','2025-04-23 13:12:32',0),(5,'Hostel Expenditure Allowance','flat',NULL,'300',1,2,2,NULL,322,322,'2025-04-22 07:11:14','2025-04-22 07:11:14',1),(6,'Leave Travel Allowance (LTA)  ','flat',NULL,'1200',1,2,2,NULL,322,322,'2025-04-22 07:12:29','2025-04-22 07:12:29',1);
/*!40000 ALTER TABLE `salary_special_allowance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:14
