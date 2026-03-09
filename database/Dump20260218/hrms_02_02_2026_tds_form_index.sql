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
-- Table structure for table `tds_form_index`
--

DROP TABLE IF EXISTS `tds_form_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tds_form_index` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexid` int NOT NULL,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tds_form_index`
--

LOCK TABLES `tds_form_index` WRITE;
/*!40000 ALTER TABLE `tds_form_index` DISABLE KEYS */;
INSERT INTO `tds_form_index` VALUES (1,1,'ctc'),(2,2,'tot_allowance'),(3,3,'hra_exemption'),(4,4,'cityresidence'),(5,5,'basic_salary'),(6,6,'rent_paid'),(7,7,'hra_received'),(8,8,'conveyance_allowance'),(9,9,'other_allowance'),(10,10,'prof_tax'),(11,11,'incm_under_hd_salaries'),(12,12,'other_incm'),(13,13,'tot_interest'),(14,14,'bank_fd'),(15,15,'nsc'),(16,16,'post_office_6y'),(17,17,'post_office_5y'),(18,18,'other_incm1'),(19,19,'other_incm2'),(20,20,'home_loan'),(21,21,'house_pro'),(22,22,'first_time_home_buyer'),(23,23,'home_improvement'),(24,24,'gross_tot_incm'),(25,25,'sec_80c'),(26,26,'epf_vpf'),(27,27,'ppf'),(28,28,'scss'),(29,29,'nsc_investment'),(30,30,'tax_fd'),(31,31,'tax_saving'),(32,32,'tax_saving_mutualfund'),(33,33,'life_insur'),(34,34,'nps'),(35,35,'pension_plans'),(36,36,'sec_80ccd'),(37,37,'housing_loan_80c'),(38,38,'ss_account'),(39,39,'regi_charge'),(40,40,'tuition_fees'),(41,41,'sec_80ccd_nps'),(42,42,'sec_80ccg'),(43,43,'deduc_chap_vi_a'),(44,44,'medical_insurance_option'),(45,45,'medical_expense_option'),(46,46,'sec_80e_edu_loan'),(47,47,'health_checkup_option'),(48,48,'sec_80ddb'),(49,49,'donation_fund'),(50,50,'no_hra'),(51,51,'sec_80u'),(52,52,'other_chap_vi_a'),(53,53,'other_extra_incm'),(54,54,'tot_incm'),(55,55,'tax_rebate'),(56,56,'tot_tax_payable'),(57,57,'tax_surcharge'),(58,58,'add_cess'),(59,59,'net_tax_payable'),(60,60,'adv_tax_paid'),(61,61,'tax_remianing'),(62,62,'tax_tot_ratio'),(63,63,'sec_80d_self'),(64,64,'sec_80d_parent'),(65,65,'sec_80dd'),(66,66,'tot_tax_norebate'),(67,67,'sec_80eea1'),(68,68,'sec_80eea2');
/*!40000 ALTER TABLE `tds_form_index` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:39
