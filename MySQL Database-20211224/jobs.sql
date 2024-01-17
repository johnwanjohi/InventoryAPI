/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.6.5-MariaDB : Database - edgeworth_db_old
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `edgeworth_db_old`;

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `sites_site_id` int(11) NOT NULL,
  `statuses_status_id` int(11) NOT NULL,
  `job_number` int(11) DEFAULT NULL,
  `job_name_po` varchar(45) DEFAULT NULL,
  `job_created` datetime DEFAULT NULL,
  `job_lastupdate` datetime DEFAULT NULL,
  `job_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `fk_jobs_sites1_idx` (`sites_site_id`),
  KEY `fk_jobs_statuses1_idx` (`statuses_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

/*Data for the table `jobs` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
