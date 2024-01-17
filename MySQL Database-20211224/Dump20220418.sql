-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: edgeworth_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `access_devices`
--

DROP TABLE IF EXISTS `access_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `brand_id` int NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `serialnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `macaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `localipaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `localwebport` int DEFAULT NULL,
  `remoteipaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remotewebport` int DEFAULT NULL,
  `port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_servers`
--

DROP TABLE IF EXISTS `access_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `brand_id` int NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_mac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_local_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_mac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_local_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nick2_port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `web_port` int DEFAULT NULL,
  `remote_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_web_port` int DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) DEFAULT NULL,
  `link` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctv_cameras`
--

DROP TABLE IF EXISTS `cctv_cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctv_cameras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `brand_id` int NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `local_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `local_web_port` int DEFAULT NULL,
  `remote_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_web_port` int DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctv_servers`
--

DROP TABLE IF EXISTS `cctv_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctv_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `brand_id` int NOT NULL DEFAULT '0',
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_tag` varchar(100) DEFAULT NULL,
  `nic1_mac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_mac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nick2_port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `os_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `os_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `os_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `server_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `server_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `server_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL DEFAULT '0',
  `site_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `workphone` varchar(50) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) /*!80000 INVISIBLE */,
  KEY `site_id` (`site_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `street` text,
  `city` text,
  `state` text,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `sites_site_id` int NOT NULL,
  `statuses_status_id` int NOT NULL,
  `job_number` int DEFAULT NULL,
  `job_name_po` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_created` datetime DEFAULT NULL,
  `job_lastupdate` datetime DEFAULT NULL,
  `job_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `fk_jobs_sites1_idx` (`sites_site_id`),
  KEY `fk_jobs_statuses1_idx` (`statuses_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `system_id` int DEFAULT '0',
  `license` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `devices` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_devices`
--

DROP TABLE IF EXISTS `network_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `network_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `brand_id` int NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `serialnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `macaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `localipaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `localwebport` int DEFAULT NULL,
  `remoteipaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remotewebport` int DEFAULT NULL,
  `port` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ordet_id` int NOT NULL AUTO_INCREMENT,
  `jobs_job_id` int NOT NULL,
  `statuses_status_id` int NOT NULL,
  `order_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_created` datetime DEFAULT NULL,
  `order_lastupdated` datetime DEFAULT NULL,
  PRIMARY KEY (`ordet_id`),
  KEY `fk_orders_jobs1_idx` (`jobs_job_id`),
  KEY `fk_orders_statuses1_idx` (`statuses_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
  `orders_details_id` int NOT NULL AUTO_INCREMENT,
  `orders_ordet_id` int NOT NULL,
  `products_product_id` int NOT NULL,
  `orders_details_quantity` int DEFAULT '0',
  PRIMARY KEY (`orders_details_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `type_id` int NOT NULL DEFAULT '0',
  `product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `partnumber` varchar(100) DEFAULT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(2000) DEFAULT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`) /*!80000 INVISIBLE */,
  KEY `category_id` (`category_id`) /*!80000 INVISIBLE */,
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `products_view`
--

DROP TABLE IF EXISTS `products_view`;
/*!50001 DROP VIEW IF EXISTS `products_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products_view` AS SELECT 
 1 AS `id`,
 1 AS `brand_id`,
 1 AS `category_id`,
 1 AS `type_id`,
 1 AS `product`,
 1 AS `partnumber`,
 1 AS `description`,
 1 AS `link`,
 1 AS `notes`,
 1 AS `brand`,
 1 AS `category`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `remote_access`
--

DROP TABLE IF EXISTS `remote_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remote_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `remote_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_notes`
--

DROP TABLE IF EXISTS `site_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT '0',
  `system_id` int DEFAULT '0',
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`) /*!80000 INVISIBLE */,
  KEY `system_id` (`system_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_systems`
--

DROP TABLE IF EXISTS `site_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_systems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `system` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `stock_status`
--

DROP TABLE IF EXISTS `stock_status`;
/*!50001 DROP VIEW IF EXISTS `stock_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_status` AS SELECT 
 1 AS `wh_id`,
 1 AS `warehouse`,
 1 AS `product_id`,
 1 AS `brand`,
 1 AS `product`,
 1 AS `description`,
 1 AS `type`,
 1 AS `category`,
 1 AS `ordered_qty`,
 1 AS `received_qty`,
 1 AS `return_qty`,
 1 AS `transfer_qty`,
 1 AS `received_from_transfer_qty`,
 1 AS `adjusted_qty`,
 1 AS `available`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warehouse_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `total` int DEFAULT '0',
  `available` int DEFAULT '0',
  `reserved` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subs`
--

DROP TABLE IF EXISTS `subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscontacts`
--

DROP TABLE IF EXISTS `subscontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscontacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `workphone` varchar(50) NOT NULL,
  `cellphone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplierscontacts`
--

DROP TABLE IF EXISTS `supplierscontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierscontacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `workphone` varchar(50) NOT NULL,
  `cellphone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT '0',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `d` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`d`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_adjustment_details`
--

DROP TABLE IF EXISTS `wh_adjustment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_adjustment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `old_qty` int DEFAULT '0',
  `new_qty` int DEFAULT '0',
  `create_date` date NOT NULL,
  `create_by` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`w_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_orders`
--

DROP TABLE IF EXISTS `wh_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_id` int DEFAULT '0',
  `order_type_id` int DEFAULT '0',
  `order_status_id` int DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(45) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wh_id` (`wh_id`) /*!80000 INVISIBLE */,
  KEY `order_type_id` (`order_type_id`) /*!80000 INVISIBLE */,
  KEY `order_status_id` (`order_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_supplierreturn_details`
--

DROP TABLE IF EXISTS `wh_supplierreturn_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_supplierreturn_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `return_qty` int DEFAULT '0',
  `supplier_id` int DEFAULT '0',
  `supplier_order_number` varchar(45) DEFAULT NULL,
  `create_date` date NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `modify_date` date DEFAULT NULL,
  `modify_by` varchar(45) DEFAULT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`w_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `supplier_id` (`supplier_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_supplierstock_details`
--

DROP TABLE IF EXISTS `wh_supplierstock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_supplierstock_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `ordered_qty` int DEFAULT '0',
  `received_qty` int DEFAULT '0',
  `supplier_id` int DEFAULT '0',
  `supplier_order_number` varchar(45) DEFAULT NULL,
  `create_date` date NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `modify_date` date DEFAULT NULL,
  `modify_by` varchar(45) DEFAULT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`w_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `supplier_id` (`supplier_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_transfer_details`
--

DROP TABLE IF EXISTS `wh_transfer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_transfer_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `transfer_qty` int DEFAULT '0',
  `receive_qty` int DEFAULT '0',
  `new_wh_id` int DEFAULT '0',
  `transfer_date` date NOT NULL,
  `transfer_by` varchar(45) NOT NULL,
  `receive_date` date NOT NULL,
  `receive_by` varchar(45) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`w_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `warehouse_id` (`new_wh_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_vanreturn_details`
--

DROP TABLE IF EXISTS `wh_vanreturn_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_vanreturn_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `return_qty` int DEFAULT '0',
  `return_date` date NOT NULL,
  `return_by` varchar(45) NOT NULL,
  `van` varchar(45) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`w_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wh_vanstock_details`
--

DROP TABLE IF EXISTS `wh_vanstock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_vanstock_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `w_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `issue_qty` int DEFAULT '0',
  `create_date` date NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`w_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'edgeworth_db'
--
/*!50003 DROP FUNCTION IF EXISTS `orderstatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `orderstatus`(
	total_ordered_qty FLOAT,
    total_received FLOAT
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(20);    
    
    IF (total_received < total_ordered_qty AND total_received = 0) THEN
	set returnStatus = 'Ordered';
    END IF;
    IF (total_received < total_ordered_qty AND total_received <> 0) THEN 
    SET returnStatus = 'In Progress';
    END IF;
	IF (total_ordered_qty = 0) THEN 
    SET returnStatus = 'Created';
    END IF;
    IF (total_ordered_qty = total_received) THEN 
    SET returnStatus = 'Complete';
    END IF;
    IF (total_received > total_ordered_qty) THEN 
    SET returnStatus = 'Wrong Entries';
    END IF;
    RETURN (returnStatus);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `orderstatus_main` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `orderstatus_main`(
	var_wh_order_id INTEGER
) RETURNS varchar(20) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(20);
    DECLARE ordertypeid INTEGER;
    DECLARE total_ordered_qty  FLOAT;
    DECLARE total_received  FLOAT;
          
    DECLARE total_not_returned float;
    
    DECLARE total_transfered float;
    
    DECLARE total_vanstock float;
    DECLARE zero_vanstock float;
    
    DECLARE total_vanreturn float;
	DECLARE total_zerovanreturn float;
    
    DECLARE total_adjustment_old_qty float;
    DECLARE total_adjustment_new_qty float;
    DECLARE unadjusted_items float;
    
    
    SELECT order_type_id INTO ordertypeid FROM wh_orders WHERE id = var_wh_order_id;
    
    IF (ordertypeid = 1) THEN 
		SELECT SUM(received_qty) INTO total_received FROM `wh_supplierstock_details` WHERE w_order_id = var_wh_order_id;
		SELECT SUM(ordered_qty) INTO total_ordered_qty FROM `wh_supplierstock_details` WHERE w_order_id = var_wh_order_id;
		IF (total_ordered_qty =  0) THEN
			SET returnStatus = 'Ordered';
		ELSEIF (total_received < total_ordered_qty AND total_received <> 0) THEN 
			SET returnStatus = 'In Progress';
		ELSEIF (total_ordered_qty = total_received AND total_ordered_qty <> 0) THEN 
			SET returnStatus = 'Completed';
		ELSEIF (total_ordered_qty = 0) THEN 
			SET returnStatus = 'Created'; 
		ELSEIF (total_received > total_ordered_qty) THEN 
			SET returnStatus = 'Wrong Entries';
		ELSE 
			SET returnStatus = 'Created';
		END IF;
	ELSEIF (ordertypeid = 2) THEN 
		SELECT COUNT(id) INTO total_not_returned FROM `wh_supplierreturn_details` WHERE w_order_id = var_wh_order_id and return_qty = 0;
        IF(total_not_returned <> 0 ) THEN 
			set returnStatus = concat(total_not_returned,' In Progress');
		ELSEIF (total_not_returned = 0 ) THEN 
			set returnStatus = 'Completed';
		ELSE 
			SET returnStatus = 'Created';
		END IF;
	ELSEIF (ordertypeid = 3) THEN 
		select sum(`transfer_qty`) INTO total_transfered from `wh_transfer_details` where w_order_id = var_wh_order_id;
		select sum(`receive_qty`) INTO total_received from `wh_transfer_details` where w_order_id = var_wh_order_id;
        IF(total_transfered = 0 AND total_received = 0 ) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(total_transfered <> total_received ) THEN 
			SET returnStatus = 'In Progress';
		ELSEIF(total_transfered = total_received ) THEN 
			SET returnStatus = 'Completed';
        END IF;		
	ELSEIF (ordertypeid = 4) THEN 
		select sum(`issue_qty`) INTO total_vanstock from `wh_vanstock_details` where w_order_id = var_wh_order_id;
        select count(`issue_qty`) INTO zero_vanstock from `wh_vanstock_details` where w_order_id = var_wh_order_id AND `issue_qty` = 0;        
        IF(total_vanstock = 0 AND zero_vanstock = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(zero_vanstock <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(total_vanstock <> 0 AND zero_vanstock = 0) THEN
			SET returnStatus = 'Completed';
        END IF;        
	ELSEIF (ordertypeid = 5) THEN 
		select sum(`return_qty`) INTO total_vanreturn from `wh_vanreturn_details` where w_order_id = var_wh_order_id;
        select count(`return_qty`) INTO total_zerovanreturn from `wh_vanreturn_details` where w_order_id = var_wh_order_id AND `return_qty` = 0;        
        IF(total_vanreturn = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(total_zerovanreturn <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(total_vanreturn <> 0 AND total_zerovanreturn = 0) THEN
			SET returnStatus = 'Completed';
		ELSE 
			SET returnStatus = 'Created';
        END IF;        
	ELSEIF (ordertypeid = 6) THEN 
		select sum(`old_qty`) INTO total_adjustment_old_qty from `wh_adjustment_details` where w_order_id = var_wh_order_id;
        select sum(`new_qty`) INTO total_adjustment_new_qty from `wh_adjustment_details` where w_order_id = var_wh_order_id;
        select count(`id`) INTO unadjusted_items from `wh_adjustment_details` where w_order_id = var_wh_order_id and (old_qty = new_qty);
        IF(total_adjustment_old_qty = 0 and total_adjustment_new_qty = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(unadjusted_items <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(unadjusted_items = 0) THEN
			SET returnStatus = 'Completed';
		ELSE 
			SET returnStatus = 'Created';
        END IF;
    END IF;
    RETURN (returnStatus);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `products_view`
--

/*!50001 DROP VIEW IF EXISTS `products_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_view` AS select `products`.`id` AS `id`,`products`.`brand_id` AS `brand_id`,`products`.`category_id` AS `category_id`,`products`.`type_id` AS `type_id`,`products`.`product` AS `product`,`products`.`partnumber` AS `partnumber`,`products`.`description` AS `description`,`products`.`link` AS `link`,`products`.`notes` AS `notes`,`brands`.`brand` AS `brand`,`categories`.`category` AS `category`,`types`.`type` AS `type` from (((`products` left join `brands` on((`brands`.`id` = `products`.`brand_id`))) left join `categories` on((`categories`.`id` = `products`.`category_id`))) left join `types` on((`types`.`id` = `products`.`type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_status`
--

/*!50001 DROP VIEW IF EXISTS `stock_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_status` AS select `stockstatus`.`wh_id` AS `wh_id`,`branches`.`name` AS `warehouse`,`stockstatus`.`product_id` AS `product_id`,`brands`.`brand` AS `brand`,`products`.`product` AS `product`,`products`.`description` AS `description`,`types`.`type` AS `type`,`categories`.`category` AS `category`,sum(`stockstatus`.`ordered_qty`) AS `ordered_qty`,sum(`stockstatus`.`received_qty`) AS `received_qty`,sum(`stockstatus`.`return_qty`) AS `return_qty`,sum(`stockstatus`.`transfer_qty`) AS `transfer_qty`,sum(`stockstatus`.`receive_qty`) AS `received_from_transfer_qty`,sum(`stockstatus`.`adjusted_qty`) AS `adjusted_qty`,((((sum(`stockstatus`.`received_qty`) - sum(`stockstatus`.`return_qty`)) - sum(`stockstatus`.`transfer_qty`)) + sum(`stockstatus`.`receive_qty`)) + sum(`stockstatus`.`adjusted_qty`)) AS `available` from ((((((select `wh_orders`.`wh_id` AS `wh_id`,`wh_supplierstock_details`.`w_order_id` AS `w_order_id`,`wh_supplierstock_details`.`product_id` AS `product_id`,`wh_supplierstock_details`.`ordered_qty` AS `ordered_qty`,`wh_supplierstock_details`.`received_qty` AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,0 AS `receive_qty`,0 AS `adjusted_qty` from (`wh_supplierstock_details` join `wh_orders` on((`wh_orders`.`id` = `wh_supplierstock_details`.`w_order_id`))) union select `wh_orders`.`wh_id` AS `wh_id`,`wh_supplierreturn_details`.`w_order_id` AS `w_order_id`,`wh_supplierreturn_details`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,`wh_supplierreturn_details`.`return_qty` AS `return_qty`,0 AS `transfer_qty`,0 AS `receive_qty`,0 AS `adjusted_qty` from (`wh_supplierreturn_details` join `wh_orders` on((`wh_orders`.`id` = `wh_supplierreturn_details`.`w_order_id`))) union select `wh_orders`.`wh_id` AS `wh_id`,`wh_transfer_details`.`w_order_id` AS `w_order_id`,`wh_transfer_details`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,`wh_transfer_details`.`transfer_qty` AS `transfer_qty`,0 AS `receive_qty`,0 AS `adjusted_qty` from (`wh_transfer_details` join `wh_orders` on((`wh_orders`.`id` = `wh_transfer_details`.`w_order_id`))) union select `wh_transfer_details`.`new_wh_id` AS `new_wh_id`,`wh_transfer_details`.`w_order_id` AS `w_order_id`,`wh_transfer_details`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,`wh_transfer_details`.`receive_qty` AS `receive_qty`,0 AS `adjusted_qty` from `wh_transfer_details` union select `wh_transfer_details`.`new_wh_id` AS `new_wh_id`,`wh_transfer_details`.`w_order_id` AS `w_order_id`,`wh_transfer_details`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,`wh_transfer_details`.`receive_qty` AS `receive_qty`,0 AS `adjusted_qty` from `wh_transfer_details` union select `wh_orders`.`wh_id` AS `wh_id`,`wh_adjustment_details`.`w_order_id` AS `w_order_id`,`wh_adjustment_details`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,0 AS `receive_qty`,(`wh_adjustment_details`.`new_qty` - `wh_adjustment_details`.`old_qty`) AS `adjusted_qty` from (`wh_adjustment_details` join `wh_orders` on((`wh_orders`.`id` = `wh_adjustment_details`.`w_order_id`)))) `stockstatus` left join `branches` on((`branches`.`id` = `stockstatus`.`wh_id`))) left join `products` on((`stockstatus`.`product_id` = `products`.`id`))) left join `brands` on((`brands`.`id` = `products`.`brand_id`))) left join `categories` on((`products`.`category_id` = `categories`.`id`))) left join `types` on((`types`.`id` = `products`.`type_id`))) group by `stockstatus`.`wh_id`,`stockstatus`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18 20:08:17
