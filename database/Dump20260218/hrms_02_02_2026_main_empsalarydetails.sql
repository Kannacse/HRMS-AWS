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
-- Table structure for table `main_empsalarydetails`
--

DROP TABLE IF EXISTS `main_empsalarydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_empsalarydetails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `currencyid` int unsigned DEFAULT NULL,
  `salarytype` int unsigned DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `accountholder_name` varchar(100) DEFAULT NULL,
  `accountholding` date DEFAULT NULL,
  `accountclasstypeid` int unsigned DEFAULT NULL,
  `bankaccountid` int unsigned DEFAULT NULL,
  `accountnumber` varchar(100) DEFAULT NULL,
  `createdby` bigint unsigned DEFAULT NULL,
  `modifiedby` bigint unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint unsigned DEFAULT NULL,
  `pannumber` varchar(45) DEFAULT NULL,
  `ifsc` varchar(45) DEFAULT NULL,
  `uan_number` varchar(255) DEFAULT NULL,
  `pf_number` varchar(255) DEFAULT NULL,
  `insurance_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MAIN_EMPSALARYDETAILS_MAIN_USERS_idx` (`user_id`),
  KEY `FK_MAIN_EMPSALARYDETAILS_MAIN_CURRENCY_idx` (`currencyid`),
  KEY `FK_MAIN_EMPSALARYDETAILS_MAIN_ACCOUNTCLASSTYPE_idx` (`accountclasstypeid`),
  KEY `FK_MAIN_EMPSALARYDETAILS_MAIN_BANKACCOUNTTYPE_idx` (`bankaccountid`),
  KEY `FK_MAIN_EMPSALARYDETAILS_MAIN_PAYFREQUENCY_idx` (`salarytype`),
  CONSTRAINT `FK_MAIN_EMPSALARYDETAILS_MAIN_ACCOUNTCLASSTYPE` FOREIGN KEY (`accountclasstypeid`) REFERENCES `main_accountclasstype` (`id`),
  CONSTRAINT `FK_MAIN_EMPSALARYDETAILS_MAIN_BANKACCOUNTTYPE` FOREIGN KEY (`bankaccountid`) REFERENCES `main_bankaccounttype` (`id`),
  CONSTRAINT `FK_MAIN_EMPSALARYDETAILS_MAIN_CURRENCY` FOREIGN KEY (`currencyid`) REFERENCES `main_currency` (`id`),
  CONSTRAINT `FK_MAIN_EMPSALARYDETAILS_MAIN_PAYFREQUENCY` FOREIGN KEY (`salarytype`) REFERENCES `main_payfrequency` (`id`),
  CONSTRAINT `FK_MAIN_EMPSALARYDETAILS_MAIN_USERS` FOREIGN KEY (`user_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_empsalarydetails`
--

LOCK TABLES `main_empsalarydetails` WRITE;
/*!40000 ALTER TABLE `main_empsalarydetails` DISABLE KEYS */;
INSERT INTO `main_empsalarydetails` VALUES (1,242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'KU2WDhq49I3Nrvu6p+X2I//YjzyRoAAxb1xvqBOAY3U=',NULL,'/K9UcVIBfC6M+wHFvpzny56qG6g3EffF/JKrZ+yPBSk=',NULL,NULL),(2,128,NULL,NULL,'ppWfoKaX',NULL,NULL,NULL,NULL,NULL,NULL,187,187,'2026-02-13 15:25:33','2026-02-13 15:25:33',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `main_empsalarydetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:09
