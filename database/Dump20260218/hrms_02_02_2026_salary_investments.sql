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
-- Table structure for table `salary_investments`
--

DROP TABLE IF EXISTS `salary_investments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_investments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `investment_type` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `max_limit` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_investments`
--

LOCK TABLES `salary_investments` WRITE;
/*!40000 ALTER TABLE `salary_investments` DISABLE KEYS */;
INSERT INTO `salary_investments` VALUES (1,'Section u/s 80C','0','150000','Life Insurance Premium, Deferred Annuity, Contributions to PF, Subscription to Certain Equity Shares or Debentures, etc.',1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(2,' Life Insurance Premium','1',NULL,'all Insurance humans',1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(3,'EPFO','1',NULL,NULL,1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(4,'Equity Shares or Debentures','1',NULL,NULL,1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(5,'Other','1',NULL,NULL,1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(6,'Tax SaverFixed Deposits.','1',NULL,NULL,1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(7,'National Pension Scheme (NPS)','1',NULL,NULL,1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(8,'Home Loan Principal Repayment','1',NULL,'If you have availed home loan from any bank or financial institution, you can avail 80C deduction up to Rs.1.5 lakh on the home loan principal repayment amount.',1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(9,'Sukanya Samriddhi Yojana','1',NULL,' Sukanya Samriddhi Yojana is a saving scheme for girl child and is eligible for 80C deduction of Income Tax Act. This account is for the girl child under 10 years of age. This account can be opened for a maximum of 2 girl childs and claim income tax deduc',1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(10,'Senior Citizens Savings Scheme','1',NULL,'Senior Citizens Saving Scheme is for senior citizens with at least 60 years of age. Senior Citizens who have opted for Voluntary Retirement Scheme (VRS) can opt for it after 55 years of age. Any investments made under this scheme is eligible for 80C deduc',1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(11,'National Savings Certificate','1',NULL,'Any investments made under the National Savings Certificate can also be claimed under Section 80C deductions. Not only the investment amount, but also the interest accrued for the first 4 years are eligible for deduction under Section 80C of Income Tax Ac',1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46'),(12,'Section u/s 80CCC','0','150000','Payment made towards pension funds',1,18,18,'2024-04-03 10:41:27','2024-04-03 10:41:27'),(13,'Section u/s 80CCD(1)','0','150000','Payments made towards Atal Pension Yojana or other pension schemes notified by government',1,18,18,'2024-04-03 10:42:41','2024-04-03 10:42:41'),(14,'Section u/s 80CCD(1B)','0','50000','Investments in NPS (outside Rs 1,50,000 limit under Section 80CCE)',1,18,18,'2024-04-03 10:43:24','2024-04-03 10:43:24'),(15,'Section u/s 80CCD(2','0','50000','Contribution to Pension Scheme of Central Government by Employer',1,18,18,'2024-04-03 10:50:50','2024-04-03 10:50:50'),(16,'Section u/s 80CCH','0','150000',' Contribution to Agnipath Scheme',1,18,18,'2024-04-03 10:46:54','2024-04-03 10:46:54'),(17,'Section u/s 80D','0','25000','Deduction in Respect of Health Insurance Premium',1,18,18,'2024-04-03 10:49:02','2024-04-03 10:49:02'),(18,'Self & Family','17',NULL,NULL,1,18,18,'2024-04-03 10:49:02','2024-04-03 10:49:02'),(19,'Parents','17',NULL,NULL,1,18,18,'2024-04-03 10:49:02','2024-04-03 10:49:02'),(20,'Section u/s 80DD ','0','75000','Maintenance including Medical Treatment of a Dependent who is a Person with Disability',1,18,18,'2024-04-03 10:50:31','2024-04-03 10:50:31'),(21,'Section u/s 80DDB','0','25000','Medical Treatment of Specified Disease',1,18,18,'2024-04-03 10:50:03','2024-04-03 10:50:03'),(22,'Section u/s 80E ','0','50000','Interest on Loan Taken for Higher Education',1,18,18,'2024-04-03 10:51:29','2024-04-03 10:51:29'),(23,'Section u/s 80EE','0','50000','Interest on Loan Taken for Residential House Property',1,18,18,'2024-04-03 10:59:55','2024-04-03 10:59:55'),(24,'Section u/s 80EEA','0','150000',' Deduction in Respect of Interest on Loan Taken for Certain House Property (First Time Home)',1,18,18,'2024-04-03 10:54:19','2024-04-03 10:54:19'),(25,'Section u/s 80G','0','100000',' Donations to Certain Funds, Charitable Institutions, etc.',1,187,187,'2024-04-17 13:06:35','2024-04-17 13:06:35'),(26,'Section u/s 80GG ','0','60000','Rent Paid (Please submit form 10BA to claim deduction)\npart of Salary \nLeast of the following shall be allowed as deduction',1,18,18,'2024-04-03 10:59:32','2024-04-03 10:59:32'),(27,'Section u/s 80GGA','0','2000','Certain Donations for Scientific Research or Rural Development',1,18,18,'2024-04-03 10:56:53','2024-04-03 10:56:53'),(28,'Section u/s 80GGC','0','0','Donation to Political party or Electoral Trust',1,18,18,'2024-04-03 10:56:46','2024-04-03 10:56:46'),(29,'Section u/s 80TTB','0','50000',' Interest on Deposits in case of Resident Senior Citizens',1,18,18,'2024-04-03 10:58:46','2024-04-03 10:58:46'),(30,'Section u/s 80TTA','0','10000','Interest on Saving Bank Accounts in case of Other than Resident Senior Citizens',1,18,18,'2024-04-03 10:57:48','2024-04-03 10:57:48'),(31,'Section u/s 80U','0','75000','In case of a Person with Disability',1,18,18,'2024-04-03 10:58:30','2024-04-03 10:58:30'),(32,'children education Allowance','0','2400',NULL,1,187,187,'2024-04-09 07:12:51','2024-04-09 07:12:51'),(33,'one child','32','1200',NULL,1,187,187,'2024-04-09 07:12:51','2024-04-09 07:12:51'),(34,'two children','32','1200',NULL,1,187,187,'2024-04-09 07:12:51','2024-04-09 07:12:51'),(35,'Medical Allowance','0','15000',NULL,1,187,187,'2024-04-09 07:15:48','2024-04-09 07:15:48'),(36,'Voluntary PF','1',NULL,NULL,1,322,322,'2025-04-23 13:06:46','2025-04-23 13:06:46');
/*!40000 ALTER TABLE `salary_investments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:58:17
