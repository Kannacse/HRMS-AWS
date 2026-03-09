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
-- Table structure for table `tds_form_report_history`
--

DROP TABLE IF EXISTS `tds_form_report_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tds_form_report_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `year` int NOT NULL,
  `ctc_inp` int NOT NULL DEFAULT '0',
  `other_salary` int NOT NULL DEFAULT '0',
  `ctc_total` int NOT NULL DEFAULT '0',
  `tot_allowance_total` int NOT NULL DEFAULT '0',
  `hra_exemption_gtotal` int NOT NULL DEFAULT '0',
  `residence` int NOT NULL DEFAULT '1',
  `basic_salary_inp` int NOT NULL DEFAULT '0',
  `basic_salary_gtotal` int NOT NULL DEFAULT '0',
  `rent_paid_inp` int NOT NULL DEFAULT '0',
  `rent_paid_gtotal` int NOT NULL DEFAULT '0',
  `hra_received_inp` int NOT NULL DEFAULT '0',
  `hra_received_gtotal` int NOT NULL DEFAULT '0',
  `conveyance_allowance_inp` int NOT NULL DEFAULT '0',
  `conveyance_allowance_gtotal` int NOT NULL DEFAULT '0',
  `other_allowance_inp` int NOT NULL DEFAULT '0',
  `other_allowance_gtotal` int NOT NULL DEFAULT '0',
  `prof_tax_inp` int NOT NULL DEFAULT '0',
  `prof_tax_gtotal` int NOT NULL DEFAULT '0',
  `incm_under_hd_salaries_total` int NOT NULL DEFAULT '0',
  `other_incm_total` int NOT NULL DEFAULT '0',
  `bank_fd_inp` int NOT NULL DEFAULT '0',
  `nsc_inp` int NOT NULL DEFAULT '0',
  `post_office_6y_inp` int NOT NULL DEFAULT '0',
  `post_office_5y_inp` int NOT NULL DEFAULT '0',
  `other_incm1_inp` int NOT NULL DEFAULT '0',
  `other_incm2_inp` int NOT NULL DEFAULT '0',
  `home_loan_total` int NOT NULL DEFAULT '0',
  `house_pro_inp` int NOT NULL DEFAULT '0',
  `house_pro_gtotal` int DEFAULT '0',
  `first_time_home_buyer_inp` int NOT NULL DEFAULT '0',
  `first_time_home_buyer_gtotal` int NOT NULL DEFAULT '0',
  `home_improvement_inp` int NOT NULL DEFAULT '0',
  `home_improvement_gtotal` int NOT NULL DEFAULT '0',
  `gross_tot_incm_total` int DEFAULT '0',
  `sec_80c_total` int NOT NULL DEFAULT '0',
  `epf_vpf_inp` int NOT NULL DEFAULT '0',
  `ppf_inp` int NOT NULL DEFAULT '0',
  `scss_inp` int NOT NULL DEFAULT '0',
  `nsc_investment_inp` int NOT NULL DEFAULT '0',
  `tax_fd_inp` int NOT NULL DEFAULT '0',
  `tax_saving_inp` int NOT NULL DEFAULT '0',
  `tax_saving_mutualfund_inp` int NOT NULL DEFAULT '0',
  `life_insur_inp` int NOT NULL DEFAULT '0',
  `nps_inp` int NOT NULL DEFAULT '0',
  `pension_plans_inp` int NOT NULL DEFAULT '0',
  `sec_80ccd_inp` int NOT NULL DEFAULT '0',
  `housing_loan_80c_inp` int NOT NULL DEFAULT '0',
  `ss_account_inp` int NOT NULL DEFAULT '0',
  `regi_charge_inp` int NOT NULL DEFAULT '0',
  `tuition_fees_inp` int NOT NULL DEFAULT '0',
  `sec_80ccd_nps_inp` int NOT NULL DEFAULT '0',
  `sec_80ccd_nps_total` int NOT NULL DEFAULT '0',
  `sec_80ccg_inp` int NOT NULL DEFAULT '0',
  `sec_80ccg_total` int NOT NULL DEFAULT '0',
  `deduc_chap_vi_a_total` int NOT NULL DEFAULT '0',
  `sec_80d_self_inp` int NOT NULL DEFAULT '0',
  `sec_80d_self_gtotal` int NOT NULL DEFAULT '0',
  `sec_80d_parent_inp` int NOT NULL DEFAULT '0',
  `sec_80d_parent_gtotal` int NOT NULL DEFAULT '0',
  `sec_80e_edu_loan_inp` int NOT NULL DEFAULT '0',
  `sec_80e_edu_loan_gtotal` int NOT NULL DEFAULT '0',
  `sec_80dd_inp` int NOT NULL DEFAULT '0',
  `sec_80dd_gtotal` int NOT NULL DEFAULT '0',
  `sec_80ddb_inp` int NOT NULL DEFAULT '0',
  `sec_80ddb_gtotal` int NOT NULL DEFAULT '0',
  `donation_fund_inp` int NOT NULL DEFAULT '0',
  `donation_fund_gtotal` int NOT NULL DEFAULT '0',
  `no_hra_inp` int NOT NULL DEFAULT '0',
  `no_hra_gtotal` int NOT NULL DEFAULT '0',
  `sec_80u_inp` int NOT NULL DEFAULT '0',
  `sec_80u_gtotal` int NOT NULL DEFAULT '0',
  `other_chap_vi_a_inp` int NOT NULL DEFAULT '0',
  `other_chap_vi_a_gtotal` int NOT NULL DEFAULT '0',
  `extra_earning_deduction` int NOT NULL DEFAULT '0',
  `tot_incm_total` int NOT NULL DEFAULT '0',
  `tax_rebate_total` int NOT NULL DEFAULT '0',
  `tot_tax_payable_total` int NOT NULL DEFAULT '0',
  `tax_surcharge_total` int NOT NULL DEFAULT '0',
  `add_cess_total` int NOT NULL DEFAULT '0',
  `net_tax_payable_total` int NOT NULL DEFAULT '0',
  `adv_tax_paid_total` int NOT NULL DEFAULT '0',
  `tax_remianing_total` int NOT NULL DEFAULT '0',
  `tax_tot_ratio_total` float NOT NULL DEFAULT '0',
  `possession` varchar(11) DEFAULT NULL,
  `possession_date` date DEFAULT NULL,
  `live_status` varchar(11) DEFAULT NULL,
  `rent_received` int DEFAULT NULL,
  `medical_insurance_option` int NOT NULL,
  `medical_expense_option` int NOT NULL,
  `health_checkup_option` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int DEFAULT NULL,
  `monthly_tds` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tds_form_report_history`
--

LOCK TABLES `tds_form_report_history` WRITE;
/*!40000 ALTER TABLE `tds_form_report_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tds_form_report_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 14:59:25
