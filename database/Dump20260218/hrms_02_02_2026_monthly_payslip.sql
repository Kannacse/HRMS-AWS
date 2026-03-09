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
-- Table structure for table `monthly_payslip`
--

DROP TABLE IF EXISTS `monthly_payslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_payslip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` int NOT NULL,
  `ctc` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_days` int NOT NULL,
  `tot_wrkd_days` int NOT NULL,
  `leave` float NOT NULL,
  `alloted_leave` int DEFAULT NULL,
  `lop_leave` float NOT NULL,
  `basic_percentage` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `basic_salary` int NOT NULL,
  `house_allowance` int NOT NULL,
  `medical_allowance` int NOT NULL,
  `transport_allowance` int NOT NULL,
  `conveyance` int NOT NULL,
  `performance_bonus` int NOT NULL,
  `leave_encashment` int DEFAULT NULL,
  `other_allowance` int NOT NULL,
  `loss_of_pay` int NOT NULL,
  `medical_insurance` int NOT NULL,
  `tax` int NOT NULL,
  `tds` int NOT NULL,
  `pf` int NOT NULL,
  `insurance` int DEFAULT NULL,
  `esi` int DEFAULT NULL,
  `other_deductions` int NOT NULL DEFAULT '0',
  `gross_earning` int NOT NULL,
  `gross_deduction` int NOT NULL,
  `extra_earning` int NOT NULL DEFAULT '0',
  `extra_deduction` int NOT NULL DEFAULT '0',
  `net_salary` int NOT NULL,
  `acc_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `monthly_payslip` (`user_id`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_payslip`
--

LOCK TABLES `monthly_payslip` WRITE;
/*!40000 ALTER TABLE `monthly_payslip` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_payslip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:37
