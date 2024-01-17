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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
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
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `workphone` varchar(50) NOT NULL,
  `cellphone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) /*!80000 INVISIBLE */,
  KEY `site_id` (`site_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
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
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;
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
  `create_date` date NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `modify_date` date NOT NULL,
  `modify_by` varchar(45) NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wh_id` (`wh_id`) /*!80000 INVISIBLE */,
  KEY `order_type_id` (`order_type_id`) /*!80000 INVISIBLE */,
  KEY `order_status_id` (`order_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-06 15:38:22
