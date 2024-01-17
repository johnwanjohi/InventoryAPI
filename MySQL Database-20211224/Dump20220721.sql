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
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'NorCal Office ','1257 Quarry Ln Suite 125','Pleasanton','CA',94568),(2,'gkjgk','sgg','sfgdsg','sg',34567);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Adams Rite',''),(2,'Aiphone',''),(3,'Allegion','https://www.allegion.com'),(4,'Altronix Corp.',''),(5,'Assa Abloy',''),(6,'Avigilon','www.avigilon.com'),(7,'Axis',''),(8,'Belden',''),(9,'Bosch',''),(10,'Cisco',''),(11,'Comnet',''),(12,'Corning',''),(13,'Dahua',''),(14,'Dell',''),(15,'D-Link',''),(16,'DoorKing',''),(17,'Duracell',''),(18,'Essex',''),(19,'Exacq',''),(20,'Genesis',''),(21,'HES',''),(22,'HID Global',''),(23,'Hikvision',''),(24,'Honeywell',''),(25,'Inovonics',''),(26,'Lifesafety Power',''),(27,'Liftmaster',''),(28,'Linear',''),(29,'Luxul',''),(30,'Netgear',''),(31,'Panduit',''),(32,'Pelco',''),(33,'Russound',''),(34,'Samsung',''),(35,'Schlage',''),(36,'Seagate',''),(37,'Securitron',''),(38,'Sharp',''),(39,'Sonos',''),(40,'Sony',''),(41,'System Sensor',''),(42,'Talkaphone',''),(43,'Tp-Link',''),(44,'TrendNet',''),(45,'Tripp Lite',''),(46,'Ubiquiti',''),(47,'Vivotek',''),(48,'Von Duprin',''),(49,'W Box',''),(50,'Western Digital',''),(51,'Digital Watchdog',''),(52,'Unknown','');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Access Control'),(2,'Intrusion'),(3,'Network'),(4,'Power'),(5,'Batterries'),(6,'Audio & Video'),(7,'Structured Wiring'),(8,'Tools & Hardware'),(9,'CCTV'),(10,'Wire & Cable'),(11,'Communication'),(12,'Wireless'),(13,'Intercom'),(15,'Software'),(16,'Accessories'),(17,'Unknown');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

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
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `workphone` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) /*!80000 INVISIBLE */,
  KEY `site_id` (`site_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (13,3,10,'uoi','asdasd','sdasd','3245345345','65456456','sdfsfd@dfg.com'),(15,3,11,'eeeeeeeeeeee','eeeeee','eeeeeeee','23423423','23423434','erwe@erwr.c0m'),(43,3,11,'Dsfsdf','Dfsdf','Sdfsdf','3242342342','6464564645',''),(44,3,10,'Werwerwe','Werwerwer','Werwerwer','3453534534','3453453453','343345@werwer.vfg'),(20,3,10,'Dfsdf Sdf','Sdf Sdfsdf','Sdfsdffs F Sfsdf','3445345345','3453453453','dfsdfs@fsdfsdf.ct');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'Customer 443344','dfgdh','sfsdf','ff',22334),(5,'fdgfdgfdgh','sdfgdfg','sdfghffghj','aa',34455),(17,'rrrrrrrrrrrr111','rrrrrrrrrr','rrrrrrrrrrr','rr',33333);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `system_type` varchar(45) DEFAULT NULL,
  `brand_id` int DEFAULT '0',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `devices_qty` int DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`) /*!80000 INVISIBLE */,
  KEY `brand_id` (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (3,17,'CCTV',2,'fffffffffff','FFFFFFFFFF',2,'2022-07-07',''),(4,17,'CCTV',1,'ertert','ERTERT',2,'2022-06-26',''),(5,17,'CCTV',2,'sfsdfsdfsdf','SDFSDFSDFSDFSDF',4,'2022-07-13','');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_types`
--

LOCK TABLES `order_types` WRITE;
/*!40000 ALTER TABLE `order_types` DISABLE KEYS */;
INSERT INTO `order_types` VALUES (1,'Supplier Stock'),(2,'Supplier Return'),(3,'Transfer'),(4,'Van Stock'),(5,'Van Return'),(6,'Adjustment');
/*!40000 ALTER TABLE `order_types` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`) /*!80000 INVISIBLE */,
  KEY `category_id` (`category_id`) /*!80000 INVISIBLE */,
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,6,9,94,'1MP H4ES Box Camera with 128GB SSD and 4.7-84.6mm Lens','1.0C-H4A-12G-B1','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; 4.7-84.6mm f/1.6 lens; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(2,6,9,94,'1MP H4A Box Camera with 3-9mm Lens','1.0C-H4A-B2-B','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; 3-9mm f/1.3 P-iris lens; Self-Learning Video Analytics','',''),(3,6,9,94,'2MP H4ES Box Camera with 256GB SSD and 4.7-84.6mm Lens','2.0C-H4A-25G-B1','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; 4.7-84.6mm f/1.6 lens; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(4,6,9,94,'2MP H5A Box Camera with 4.7-84.6mm Lens','2.0C-H5A-B1','2.0 MP (1080p) WDR; LightCatcher; Day/Night; 4.7-84.6mm f/1.6 lens; Next-Generation Analytics','',''),(5,6,9,94,'2MP H5A Box Camera with 3.3-9mm Lens','2.0C-H5A-B2','2.0 MP (1080p) WDR; LightCatcher; Day/Night; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(6,6,9,94,'3MP H4ES Box Camera with 256GB SSD and 4.7-84.6mm Lens','3.0C-H4A-25G-B1','3.0 Megapixel WDR; LightCatcher; Day/Night; 4.7-84.6mm f/1.6 lens; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(7,6,9,94,'3MP H4ES Box Camera with 256GB SSD and 4.7-84.6mm Lens','3.0C-H4A-25G-B1-B','3.0 Megapixel WDR; LightCatcher; Day/Night; 4.7-84.6mm f/1.6 lens; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(8,6,9,94,'3MP H4A Box Camera with 3-9mm Lens','3.0C-H4A-B2-B','3.0 Megapixel WDR; LightCatcher; Day/Night; 3-9mm f/1.3 P-iris lens; Self-Learning Video Analytics','',''),(9,6,9,94,'3MP H4A Box Camera with 9-22mm Lens','3.0C-H4A-B3','3.0 Megapixel WDR; LightCatcher; Day/Night; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(10,6,9,94,'4MP H5A Box Camera with 3.3-9mm Lens','4.0C-H5A-B2','4.0 MP WDR; LightCatcher; Day/Night; 3.3-9mm f/1.3 lens; Next-Generation Analytics','',''),(11,6,9,94,'4MP H5A Box Camera with 9-22mm Lens','4.0C-H5A-B3','4.0 MP WDR; LightCatcher; Day/Night; 9-22mm f/1.6 lens; Next-Generation Analytics','',''),(12,6,9,94,'6MP H5A Box Camera with 4.9-8mm Lens','6.0C-H5A-B2','6.0 MP WDR; LightCatcher; Day/Night; 4.9-8mm f/1.8 lens; Next-Generation Analytics','',''),(13,6,9,94,'8MP H5A Box Camera with 4.9-8mm Lens','8.0C-H5A-B2','8.0 MP (4K) WDR; LightCatcher; Day/Night; 4.9-8mm f/1.8 lens; Next-Generation Analytics','',''),(14,6,9,94,'1MP H4ES Bullet Camera with 128GB SSD and 3-9mm Lens','1.0C-H4A-12G-BO1-IR','1.0 Megapixel (720p) WDR; LightCatcher; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(15,6,9,94,'1MP H4ES Bullet Camera with 128GB SSD and 3-9mm Lens','1.0C-H4A-12G-BO1-IR-B','1.0 Megapixel (720p) WDR; LightCatcher; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(16,6,9,94,'1MP H4ES Bullet Camera with 128GB SSD and 9-22mm Lens','1.0C-H4A-12G-BO2-IR','1.0 Megapixel (720p) WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(17,6,9,94,'1MP H4ES Bullet Camera with 128GB SSD and 9-22mm Lens','1.0C-H4A-12G-BO2-IR-B','1.0 Megapixel (720p) WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(18,6,9,94,'1MP H4A Bullet Camera with 9-22mm Lens','1.0C-H4A-BO2-IR-B','1.0 Megapixel (720p) WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Self-Learning Video Analytics','',''),(19,6,9,94,'1.3MP H5SL Bullet Camera with 3.1-8.4mm Lens','1.3C-H5SL-BO1-IR','1.3 MP; WDR; LightCatcher; Day/Night; Indoor/Outdoor Bullet Camera; 3.1-8.4mm f/1.6; Integrated IR','',''),(20,6,9,94,'2MP H4ES Bullet Camera with 256GB SSD and 3-9mm Lens','2.0C-H4A-25G-BO1-IR-B','2.0 Megapixel (1080p) WDR; LightCatcher; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(21,6,9,94,'2MP H4ES Bullet Camera with 256GB SSD and 9-22mm Lens','2.0C-H4A-25G-BO2-IR-B','2.0 Megapixel (1080p) WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(22,6,9,94,'2MP H4A Bullet Camera with 9-22mm Lens','2.0C-H4A-BO2-IR-B','2.0 Megapixel (1080p) WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Self-Learning Video Analytics','',''),(23,6,9,94,'2MP H5A Bullet Camera with 3.3-9mm Lens','2.0C-H5A-BO1-IR','2.0 MP (1080p) WDR; LightCatcher; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(24,6,9,94,'2MP H5A Bullet Camera with 9-22mm Lens','2.0C-H5A-BO2-IR','2.0 MP (1080p) WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(25,6,9,94,'2MP Explosion Protetced Bullet Camera with 4m Armored Cable; T5 and 30x Zoom','2.0C-H5EX-A0-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 4m armored cable; T5. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(26,6,9,94,'2MP Explosion Protected Bullet Camera with 4m Armored Cable; T6 and 30x Zoom','2.0C-H5EX-A2-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 4m armored cable; T6. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(27,6,9,94,'2MP Explosion Protected Bullet Camera with 10m Armored Cable; T5 and 30x Zoom','2.0C-H5EX-B0-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 10m armored cable; T5. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(28,6,9,94,'2MP Explosion Protected Bullet Camera with 10m Armored Cable; T6 and 30x Zoom','2.0C-H5EX-B2-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 10m armored cable; T6. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(29,6,9,94,'2MP Explosion Protected Bullet Camera with 4m Tail Cable; T5 and 30x Zoom','2.0C-H5EX-F1-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 4m tail cable; T5. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(30,6,9,94,'2MP Explosion Protected Bullet Camera with 4m Tail Cable; T6 and 30x Zoom','2.0C-H5EX-F3-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 4m tail cable; T6. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(31,6,9,94,'2MP Explosion Protected Bullet Camera with 10m Tail Cable; T5 and 30x Zoom','2.0C-H5EX-G1-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 10m tail cable; T5. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(32,6,9,94,'2MP Explosion Protected Bullet Camera with 10m Tail Cable; T6 and 30x Zoom','2.0C-H5EX-G3-BO1','Explosion protected bullet camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 3/4 NPT and 10m tail cable; T6. Built to order; orders are non-cancellable and non-returnable.\"\"','',''),(33,6,9,94,'2MP H5SL Bullet Camera with 3.1-8.4mm Lens','2.0C-H5SL-BO1-IR','2.0 MP; WDR; LightCatcher; Day/Night; Indoor/Outdoor Bullet Camera; 3.1-8.4mm f/1.6; Integrated IR','',''),(34,6,9,94,'3MP H4ES Bullet Camera with 256GB SSD and 3-9mm Lens','3.0C-H4A-25G-BO1-IR-B','3.0 Megapixel WDR; LightCatcher; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(35,6,9,94,'3MP H4ES Bullet Camera with 256GB SSD and 9-22mm Lens','3.0C-H4A-25G-BO2-IR-B','3.0 Megapixel WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(36,6,9,94,'3MP H5SL Bullet Camera with 3.1-8.4mm Lens','3.0C-H5SL-BO1-IR','3.0 MP; WDR; LightCatcher; Day/Night; Indoor/Outdoor Bullet Camera; 3.1-8.4mm f/1.6; Integrated IR','',''),(37,6,9,94,'3MP H5SL Bullet Camera with 9.5-31mm Lens','3.0C-H5SL-BO2-IR','3.0 MP; WDR; LightCatcher; Day/Night; Indoor/Outdoor Bullet Camera; 9.5-31mm f/1.4; Integrated IR','',''),(38,6,9,94,'4MP H5A Bullet Camera with 3.3-9mm Lens','4.0C-H5A-BO1-IR','4.0 MP WDR; LightCatcher; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(39,6,9,94,'4MP H5A Bullet Camera with 9-22mm Lens','4.0C-H5A-BO2-IR','4.0 MP WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(40,6,9,94,'5MP H5A Bullet Camera with 9-22mm Lens','5.0C-H5A-BO2-IR','5.0 MP WDR; LightCatcher; 9-22mm f/1.6 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(41,6,9,94,'5MP H5SL Bullet Camera with 3.1-8.4mm Lens','5.0C-H5SL-BO1-IR','5.0 MP; WDR; LightCatcher; Day/Night; Indoor/Outdoor Bullet Camera; 3.1-8.4mm f/1.6; Integrated IR','',''),(42,6,9,94,'5MP H5SL Bullet Camera with 9.5-31mm Lens','5.0C-H5SL-BO2-IR','5.0 MP; WDR; LightCatcher; Day/Night; Indoor/Outdoor Bullet Camera; 9.5-31mm f/1.4; Integrated IR','',''),(43,6,9,94,'6MP H5A Bullet Camera with 4.9-8mm Lens','6.0C-H5A-BO1-IR','6.0 MP WDR; LightCatcher; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(44,6,9,94,'6MP Explosion Protected Compact Bullet Camera with 4.9-8mm lens','6.0C-H5EX-A0-CO1','Explosion protected compact bullet camera; 6.0MP; 4.9-8mm f/1.8 P-iris lens; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; bracket included; no cable. Built to order; orders are non-cancellable and non-returnable.','',''),(45,6,9,94,'6MP Explosion Protected Compact Bullet Camera with 4.9-8mm lens & 4m Arm Cable','6.0C-H5EX-B0-CO1','Explosion protected compact bullet camera; 6.0MP; 4.9-8mm f/1.8 P-iris lens; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; bracket included; 4m armored cable. Built to order; orders are non-cancellable and non-returnable.','',''),(46,6,9,94,'6MP Explosion Protected Compact Bullet Camera with 4.9-8mm lens & 10m Arm Cable','6.0C-H5EX-C0-CO1','Explosion protected compact bullet camera; 6.0MP; 4.9-8mm f/1.8 P-iris lens; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; bracket included; 10m armored cable. Built to order; orders are non-cancellable and non-returnable.','',''),(47,6,9,94,'8MP H5A Bullet Camera with 4.9-8mm Lens','8.0C-H5A-BO1-IR','8.0 MP (4K) WDR; LightCatcher; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(48,6,9,94,'1MP H4ES Outdoor IR Dome Camera with 128GB SSD and 3-9mm Lens','1.0C-H4A-12G-DO1-IR','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(49,6,9,94,'1MP H4ES Outdoor IR Dome Camera with 128GB SSD and 3-9mm Lens','1.0C-H4A-12G-DO1-IR-B','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD','',''),(50,6,9,94,'1MP H4ES Outdoor IR Pendant Dome Camera with 128GB SSD and 3-9mm Lens','1.0C-H4A-12G-DP1-IR','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(51,6,9,94,'1MP H4ES Outdoor IR Pendant Dome Camera with 128GB SSD and 3-9mm Lens','1.0C-H4A-12G-DP1-IR-B','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 128GB Built-in SSD. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(52,6,9,94,'1MP H4A In-Ceiling Dome Camera with 3-9mm Lens','1.0C-H4A-DC1-B','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 3-9mm f/1.3 P-iris lens; Self-Learning Video Analytics','',''),(53,6,9,94,'1MP H4A Outdoor IR Dome Camera with 3-9mm Lens','1.0C-H4A-DO1-IR-B','1.0 Megapixel (720p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics','',''),(54,6,9,94,'1.3MP H4M Indoor Mini Dome Camera with 2.8mm Lens','1.3C-H4M-D1','1.3 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 2.8mm f/1.2','',''),(55,6,9,94,'1.3MP H4M Indoor Mini Dome IR Camera with 2.8mm Lens','1.3C-H4M-D1-IR','1.3 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 2.8mm f/1.2; IR','',''),(56,6,9,94,'1.3MP H5SL Indoor Dome Camera with 3-9mm Lens','1.3C-H5SL-D1','1.3 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3-9mm f/1.4','',''),(57,6,9,94,'1.3MP H5SL Indoor IR Dome Camera with 3-9mm Lens','1.3C-H5SL-D1-IR','1.3 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3-9mm f/1.4; Integrated IR','',''),(58,6,9,94,'1.3MP H5SL Outdoor IR Dome Camera with 3.1-8.4mm Lens','1.3C-H5SL-DO1-IR','1.3 MP; WDR; LightCatcher; Day/Night; Outdoor Dome; 3.1-8.4mm f/1.6; Integrated IR','',''),(59,6,9,94,'2MP H4ES Outdoor IR Dome Camera with 256GB SSD and 3-9mm Lens','2.0C-H4A-25G-DO1-IR-B','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(60,6,9,94,'2MP H4ES Outdoor IR Pendant Dome Camera with 256GB SSD and 3-9mm Lens','2.0C-H4A-25G-DP1-IR','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(61,6,9,94,'2MP H4ES Outdoor IR Pendant Dome Camera with 256GB SSD and 3-9mm Lens','2.0C-H4A-25G-DP1-IR-B','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(62,6,9,94,'2MP H4A Indoor Dome Camera with 9-22mmmm Lens','2.0C-H4A-D2-B','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; Indoor Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(63,6,9,94,'2MP H4A In-Ceiling Dome Camera with 9-22mm Lens','2.0C-H4A-DC2-B','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(64,6,9,94,'2MP H4A Outdoor Dome Camera with 9-22mm','2.0C-H4A-DO2','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(65,6,9,94,'2MP H4A Outdoor Dome Camera with 9-22mm','2.0C-H4A-DO2-B','2.0 Megapixel (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(66,6,9,94,'2MP H4A Outdoor Pendant Dome Camera with 9-22mm','2.0C-H4A-DP2-B','2.0 Megapixel H4 HD Dome Cameras with Self-Learning Video Analytics','',''),(67,6,9,94,'2MP H4M Indoor Mini Dome Camera with 2.8mm Lens','2.0C-H4M-D1','2.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 2.8mm f/1.2','',''),(68,6,9,94,'2MP H4M Indoor Mini Dome IR Camera with 2.8mm Lens','2.0C-H4M-D1-IR','2.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 2.8mm f/1.2; IR','',''),(69,6,9,94,'2MP H5A Indoor Dome Camera with 3.3-9mm Lens','2.0C-H5A-D1','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Indoor Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(70,6,9,94,'2MP H5A Indoor IR Dome Camera with 3.3-9mm Lens','2.0C-H5A-D1-IR','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Indoor Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(71,6,9,94,'2MP H5A Indoor Dome Camera with 9-22mm Lens','2.0C-H5A-D2','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Indoor Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(72,6,9,94,'2MP H5A In-Ceiling Dome Camera with 3.3-9mm Lens','2.0C-H5A-DC1','2.0 MP (1080p) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(73,6,9,94,'2MP H5A In-Ceiling IR Dome Camera with 3.3-9mm Lens','2.0C-H5A-DC1-IR','2.0 MP (1080p) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(74,6,9,94,'2MP H5A In-Ceiling Dome Camera with 9-22mm Lens','2.0C-H5A-DC2','2.0 MP (1080p) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(75,6,9,94,'2MP H5A Outdoor Dome Camera with 3.3-9mm Lens','2.0C-H5A-DO1','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(76,6,9,94,'2MP H5A Outdoor IR Dome Camera with 3.3-9mm Lens','2.0C-H5A-DO1-IR','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(77,6,9,94,'2MP H5A Outdoor Dome Camera with 9-22mm Lens','2.0C-H5A-DO2','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(78,6,9,94,'2MP H5A Pendant Dome Camera with 3.3-9mm Lens','2.0C-H5A-DP1','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Pendant Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(79,6,9,94,'2MP H5A Pendant IR Dome Camera with 3.3-9mm Lens','2.0C-H5A-DP1-IR','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Pendant Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(80,6,9,94,'2MP H5A Pendant Dome Camera with 9-22mm Lens','2.0C-H5A-DP2','2.0 MP (1080p) WDR; LightCatcher; Day/Night; Pendant Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(81,6,9,94,'2MP H5M Dome Camera with 2.8mm lens','2.0C-H5M-DO1-IR','2.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 2.8mm f/1.2; IR','',''),(82,6,9,94,'2MP H5SL Indoor Dome Camera with 3-9mm Lens','2.0C-H5SL-D1','2.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3-9mm f/1.4','',''),(83,6,9,94,'2MP H5SL Indoor IR Dome Camera with 3-9mm Lens','2.0C-H5SL-D1-IR','2.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3-9mm f/1.4; Integrated IR','',''),(84,6,9,94,'2MP H5SL Outdoor IR Dome Camera with 3.1-8.4mm Lens','2.0C-H5SL-DO1-IR','2.0 MP; WDR; LightCatcher; Day/Night; Outdoor Dome; 3.1-8.4mm f/1.6; Integrated IR','',''),(85,6,9,94,'3MP H4ES Outdoor IR Dome Camera with 256GB SSD and 3-9mm Lens','3.0C-H4A-25G-DO1-IR-B','3.0 Megapixel WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD','',''),(86,6,9,94,'3MP H4ES Outdoor IR Pendant Dome Camera with 256GB SSD and 3-9mm Lens','3.0C-H4A-25G-DP1-IR-B','3.0 Megapixel WDR; LightCatcher; Day/Night; Outdoor Dome; 3-9mm f/1.3 P-iris lens; Integrated IR; Self-Learning Video Analytics; 256GB Built-in SSD. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(87,6,9,94,'3MP H4A In-Ceiling Dome Camera with 9-22mm Lens','3.0C-H4A-DC2-B','3.0 Megapixel WDR; LightCatcher; Day/Night; In-Ceiling Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(88,6,9,94,'3MP H4A Outdoor IR Dome Camera with 9-22mm Lens','3.0C-H4A-DO2-B','3.0 Megapixel WDR; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(89,6,9,94,'3MP H4M Indoor Mini Dome Camera with 2.8mm Lens','3.0C-H4M-D1','3.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 2.8mm f/1.2','',''),(90,6,9,94,'3MP H4M Indoor Mini Dome IR Camera with 2.8mm Lens','3.0C-H4M-D1-IR','3.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 2.8mm f/1.2; IR','',''),(91,6,9,94,'3.0C-H5A-CR1-IR','3.0C-H5A-CR1-IR','H5A; Corner; CRS; 3.0 MP WDR; 3-9mm;IR','',''),(92,6,9,94,'3.0C-H5A-CR1-IR-SS','3.0C-H5A-CR1-IR-SS','H5A; Corner; SS; 3.0 MP WDR; 3-9mm; IR','',''),(93,6,9,94,'3MP H5SL Indoor Dome Camera with 3-9mm Lens','3.0C-H5SL-D1','3.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3-9mm f/1.4','',''),(94,6,9,94,'3MP H5SL Indoor IR Dome Camera with 3-9mm Lens','3.0C-H5SL-D1-IR','3.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3-9mm f/1.4; Integrated IR','',''),(95,6,9,94,'3MP H5SL Outdoor IR Dome Camera with 3.1-8.4mm Lens','3.0C-H5SL-DO1-IR','3.0 MP; WDR; LightCatcher; Day/Night; Outdoor Dome; 3.1-8.4mm f/1.6; Integrated IR','',''),(96,6,9,94,'4MP H5A Indoor Dome Camera with 3.3-9mm Lens','4.0C-H5A-D1','4.0 MP WDR; LightCatcher; Day/Night; Indoor Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(97,6,9,94,'4MP H5A Indoor IR Dome Camera with 3.3-9mm Lens','4.0C-H5A-D1-IR','4.0 MP WDR; LightCatcher; Day/Night; Indoor Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(98,6,9,94,'4MP H5A Indoor Dome Camera with 9-22mm Lens','4.0C-H5A-D2','4.0 MP WDR; LightCatcher; Day/Night; Indoor Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(99,6,9,94,'4MP H5A In-Ceiling Dome Camera with 3.3-9mm Lens','4.0C-H5A-DC1','4.0 MP WDR; LightCatcher; Day/Night; In-Ceiling Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(100,6,9,94,'4MP H5A In-Ceiling IR Dome Camera with 3.3-9mm Lens','4.0C-H5A-DC1-IR','4.0 MP WDR; LightCatcher; Day/Night; In-Ceiling Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(101,6,9,94,'4MP H5A In-Ceiling Dome Camera with 9-22mm Lens','4.0C-H5A-DC2','4.0 MP WDR; LightCatcher; Day/Night; In-Ceiling Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(102,6,9,94,'4MP H5A Outdoor Dome Camera with 3.3-9mm Lens','4.0C-H5A-DO1','4.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics','',''),(103,6,9,94,'4MP H5A Outdoor IR Dome Camera with 3.3-9mm Lens','4.0C-H5A-DO1-IR','4.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(104,6,9,94,'4MP H5A Outdoor Dome Camera with 9-22mm Lens','4.0C-H5A-DO2','4.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(105,6,9,94,'4MP H5A Outdoor Pendant Dome Camera with 3.3-9mm Lens','4.0C-H5A-DP1','4.0 MP WDR; LightCatcher; Day/Night; Pendant Dome; 3.3-9mm f/1.3 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(106,6,9,94,'4MP H5A Outdoor Pendant IR Dome Camera with 3.3-9mm Lens','4.0C-H5A-DP1-IR','4.0 MP WDR; LightCatcher; Day/Night; Pendant Dome; 3.3-9mm f/1.3 P-iris lens; Integrated IR; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(107,6,9,94,'4MP H5A Outdoor Pendant Dome Camera with 9-22mm Lens','4.0C-H5A-DP2','4.0 MP WDR; LightCatcher; Day/Night; Pendant Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(108,6,9,94,'5.0C-H5A-CR1-IR','5.0C-H5A-CR1-IR','H5A; Corner; CRS; 5.0 MP WDR; 3-9mm;IR','',''),(109,6,9,94,'5.0C-H5A-CR1-IR-SS','5.0C-H5A-CR1-IR-SS','H5A; Corner; SS; 5.0 MP WDR; 3-9mm; IR','',''),(110,6,9,94,'5MP H5A Outdoor Dome Camera with 9-22mm Lens','5.0C-H5A-DO2','5.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics','',''),(111,6,9,94,'5MP H5A Outdoor Pendant Dome Camera with 9-22mm Lens','5.0C-H5A-DP2','5.0 MP WDR; LightCatcher; Day/Night; Pendant Dome; 9-22mm f/1.6 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(112,6,9,94,'5MP H5M Dome Camera with 2.8mm lens','5.0C-H5M-DO1-IR','5.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 2.8mm f/1.2; IR','',''),(113,6,9,94,'5MP H5SL Indoor Dome Camera with 3.1-8.4mm Lens','5.0C-H5SL-D1','5.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3.1-8.4mm f/1.6','',''),(114,6,9,94,'5MP H5SL Indoor IR Dome Camera with 3.1-8.4mm Lens','5.0C-H5SL-D1-IR','5.0 MP; WDR; LightCatcher; Day/Night; Indoor Dome; 3.1-8.4mm f/1.6; Integrated IR','',''),(115,6,9,94,'5MP H5SL Outdoor IR Dome Camera with 3.1-8.4mm Lens','5.0C-H5SL-DO1-IR','5.0 MP; WDR; LightCatcher; Day/Night; Outdoor Dome; 3.1-8.4mm f/1.6; Integrated IR','',''),(116,6,9,94,'5MP H4A In-Ceiling Dome Camera with 4.3-8mm Lens','5.0L-H4A-DC2-B','5.0 Megapixel; LightCatcher; Day/Night; In-Ceiling Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(117,6,9,94,'5MP H4A Outdoor Dome Camera with 9-22mm Lens','5.0L-H4A-DO2-B','5.0 Megapixel; LightCatcher; Day/Night; Outdoor Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics','',''),(118,6,9,94,'5MP H4A Outdoor Pendant Dome Camera with 9-22mm Lens','5.0L-H4A-DP2-B','5.0 Megapixel; LightCatcher; Day/Night; Pendant Dome; 9-22mm f/1.6 P-iris lens; Self-Learning Video Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(119,6,9,94,'6MP H5A Indoor Dome Camera with 4.9-8mm Lens','6.0C-H5A-D1','6.0 MP WDR; LightCatcher; Day/Night; Indoor Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics','',''),(120,6,9,94,'6MP H5A Indoor IR Dome Camera with 4.9-8mm Lens','6.0C-H5A-D1-IR','6.0 MP WDR; LightCatcher; Day/Night; Indoor Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(121,6,9,94,'6MP H5A In-Ceiling Dome Camera with 4.9-8mm Lens','6.0C-H5A-DC1','6.0 MP WDR; LightCatcher; Day/Night; In-Ceiling Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics','',''),(122,6,9,94,'6MP H5A In-Ceiling IR Dome Camera with 4.9-8mm Lens','6.0C-H5A-DC1-IR','6.0 MP WDR; LightCatcher; Day/Night; In-Ceiling Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(123,6,9,94,'6MP H5A Outdoor Dome Camera with 4.9-8mm Lens','6.0C-H5A-DO1','6.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics','',''),(124,6,9,94,'6MP H5A Outdoor IR Dome Camera with 4.9-8mm Lens','6.0C-H5A-DO1-IR','6.0 MP WDR; LightCatcher; Day/Night; Outdoor Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(125,6,9,94,'6MP H5A Outdoor Pendant Dome Camera with 4.9-8mm Lens','6.0C-H5A-DP1','6.0 MP WDR; LightCatcher; Day/Night; Pendant Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(126,6,9,94,'6MP H5A Outdoor Pendant IR Dome Camera with 4.9-8mm Lens','6.0C-H5A-DP1-IR','6.0 MP WDR; LightCatcher; Day/Night; Pendant Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(127,6,9,94,'8MP H4A Indoor Dome Camera with 4.3-8mm Lens','8.0-H4A-D1-B','4K UHD (8.0 Megapixel); Day/Night; Indoor Dome; 4.3-8mm f/1.8 P-iris lens; Self-Learning Video Analytics','',''),(128,6,9,94,'8MP H4A Indoor Dome Camera with 4.3-8mm Lens','8.0-H4A-D1-IR-B','4K UHD (8.0 Megapixel); Indoor Dome; 4.3-8mm f/1.8 P-iris lens; Integrated IR Self-Learning Video Analytics','',''),(129,6,9,94,'8MP H4A In-Ceiling Dome Camera with 4.3-8mm Lens','8.0-H4A-DC1-B','4K UHD (8.0 Megapixel); Day/Night; In-Ceiling Dome; 4.3-8mm f/1.8 P-iris lens; Self-Learning Video Analytics','',''),(130,6,9,94,'8MP H4A Outdoor Dome Camera with 4.3-8mm Lens','8.0-H4A-DO1','4K UHD (8.0 Megapixel); Day/Night; Outdoor Dome; 4.3-8mm f/1.8 P-iris lens; Self-Learning Video Analytics','',''),(131,6,9,94,'8MP H4A Outdoor Dome Camera with 4.3-8mm Lens','8.0-H4A-DO1-B','4K UHD (8.0 Megapixel); Day/Night; Outdoor Dome; 4.3-8mm f/1.8 P-iris lens; Self-Learning Video Analytics','',''),(132,6,9,94,'8MP H4A Outdoor IR Dome Camera with 4.3-8mm Lens','8.0-H4A-DO1-IR-B','4K UHD (8.0 Megapixel); Day/Night; Outdoor Dome; 4.3-8mm f/1.8 P-iris lens; Integrated IR; Self-Learning Video Analytics','',''),(133,6,9,94,'8MP H4A Outdoor Pendant IR Dome Camera with 4.3-8mm Lens','8.0-H4A-DP1-B','4K UHD (8.0 Megapixel); Day/Night; Pendant Dome; 4.3-8mm f/1.8 P-iris lens; Self-Learning Video Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(134,6,9,94,'8MP H5A Indoor Dome Camera with 4.9-8mm Lens','8.0C-H5A-D1','8.0 MP (4K) WDR; LightCatcher; Day/Night; Indoor Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics','',''),(135,6,9,94,'8MP H5A Indoor IR Dome Camera with 4.9-8mm Lens','8.0C-H5A-D1-IR','8.0 MP (4K) WDR; LightCatcher; Day/Night; Indoor Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(136,6,9,94,'8MP H5A In-Ceiling Dome Camera with 4.9-8mm Lens','8.0C-H5A-DC1','8.0 MP (4K) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics','',''),(137,6,9,94,'8MP H5A In-Ceiling IR Dome Camera with 4.9-8mm Lens','8.0C-H5A-DC1-IR','8.0 MP (4K) WDR; LightCatcher; Day/Night; In-Ceiling Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(138,6,9,94,'8MP H5A Outdoor Dome Camera with 4.9-8mm Lens','8.0C-H5A-DO1','8.0 MP (4K) WDR; LightCatcher; Day/Night; Outdoor Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics','',''),(139,6,9,94,'8MP H5A Outdoor IR Dome Camera with 4.9-8mm Lens','8.0C-H5A-DO1-IR','8.0 MP (4K) WDR; LightCatcher; Day/Night; Outdoor Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics','',''),(140,6,9,94,'8MP H5A Outdoor Pendant Dome Camera with 4.9-8mm Lens','8.0C-H5A-DP1','8.0 MP (4K) WDR; LightCatcher; Day/Night; Pendant Dome; 4.9-8mm f/1.8 P-iris lens; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(141,6,9,94,'8MP H5A Outdoor Pendant IR Dome Camera with 4.9-8mm Lens','8.0C-H5A-DP1-IR','8.0 MP (4K) WDR; LightCatcher; Day/Night; Pendant Dome; 4.9-8mm f/1.8 P-iris lens; Integrated IR; Next-Generation Analytics. Must use with a H4A-MT-Wall1 or H4A-MT-NPTA1.','',''),(142,6,9,94,'H4 LPC 3MP Camera with 4.7-84.6mm Lens','3.0C-HD-LP-B1','H4 LPC Box camera; 3.0 MP; 4.7-84.6mm f/1.6 lens; with visible light blocker. Must be ordered in conjunction with ES-HD-IR-IP6 and ES-HD-LP-HS.','',''),(143,6,9,94,'H4 LPC IR Illuminator','ES-HD-IR-IP6','IR illuminator; PoE+; Outdoor; included lens option for 60Â°; 35Â°; or 10Â° horizontal coverage. Included mounting adapter to ES-HD-LP-HS.','',''),(144,6,9,94,'H4 LPC Enclosure','ES-HD-LP-HS','Standard format enclosure with heater; sunshield and PoE passthrough for a camera. PoE+ powers the camera enclosure and camera using one Ethernet connection.','',''),(145,6,9,94,'2x 5MP H5A Dual Head Camera','10.0C-H5DH-D1-IR','2x 5MP H5A Dual Head Camera.  Indoor camera with built-in IR. Next-Generation analytics.','',''),(146,6,9,94,'12MP H5A Fisheye Indoor In-Ceiling Camera','12.0W-H5A-FE-DC1','12.0 MP; Fisheye In-ceiling Camera; Day/Night; WDR; 1.6mm f/2.0; Next-Generation Analytics','',''),(147,6,9,94,'12MP H5A Fisheye Dome Camera','12.0W-H5A-FE-DO1','12.0 MP; Fisheye Dome Camera; Day/Night; WDR; 1.6mm f/2.0; Next-Generation Analytics','',''),(148,6,9,94,'12MP H5A Fisheye IR Dome Camera','12.0W-H5A-FE-DO1-IR','12.0 MP; Fisheye Dome Camera; Day/Night; WDR; 1.6mm f/2.0; Next-Generation Analytics; Integrated IR','',''),(149,6,9,94,'4x 3MP H4 Multisensor Camera Module with 2.8mm Lens','12C-H4A-4MH-360','4x 3 MP; WDR; LightCatcher; 2.8mm; Camera Only','',''),(150,6,9,94,'3x 5MP H4 Multisensor Camera Module with 4mm Lens','15C-H4A-3MH-180','3x 5 MP; WDR; LightCatcher; 4mm; Camera Only','',''),(151,6,9,94,'3x 5MP H4 Multisensor Camera Module with 2.8mm Lens','15C-H4A-3MH-270','3x 5 MP; WDR; LightCatcher; 2.8mm; Camera Only','',''),(152,6,9,94,'4x 5MP H4 Multisensor Camera Module with 2.8mm Lens','20C-H4A-4MH-360','4x 5 MP; WDR; LightCatcher; 2.8mm; Camera Only','',''),(153,6,9,94,'3x 8MP H4 Multisensor Camera Module with 5.2mm Lens','24C-H4A-3MH-180','3x 8 MP; WDR; LightCatcher; 5.2mm; Camera Only','',''),(154,6,9,94,'3x 8MP H4 Multisensor Camera Module with 4mm Lens','24C-H4A-3MH-270','3x 8 MP; WDR; LightCatcher; 4mm; Camera Only','',''),(155,6,9,94,'3MP H4 Video Intercom with IR','3.0C-H4VI-RO1-IR','3.0 MP; H4 Video Intercom; WDR; LightCatcher; Day/Night; 1.83mm f/2.4; Integrated IR; Recessed Mount','',''),(156,6,9,94,'4x 8MP H4 Multisensor Camera Module with 4mm Lens','32C-H4A-4MH-360','4x 8 MP; WDR; LightCatcher; 4mm; Camera Only','',''),(157,6,9,94,'2x 3MP H5A Dual Head Camera','6.0C-H5DH-D1-IR','2x 3MP H5A Dual Head Camera.  Indoor camera with built-in IR','',''),(158,6,9,94,'8MP H5A Fisheye Indoor In-Ceiling Camera','8.0C-H5A-FE-DC1','8.0 MP; H5A Fisheye In-ceiling Camera; LightCatcher; Day/Night; WDR; 1.41mm f/2.0; Next-Generation Analytics','',''),(159,6,9,94,'8MP H5A Fisheye Dome Camera','8.0C-H5A-FE-DO1','8.0 MP; H5A Fisheye Dome Camera; LightCatcher; Day/Night; WDR; 1.41mm f/2.0; Next-Generation Analytics','',''),(160,6,9,94,'8MP H5A Fisheye IR Dome Camera','8.0C-H5A-FE-DO1-IR','8.0 MP; H5A Fisheye Dome Camera; LightCatcher; Day/Night; WDR; 1.41mm f/2.0; Next-Generation Analytics; Integrated IR','',''),(161,6,9,94,'3x 3MP H4 Multisensor Camera Module with 4mm Lens','9C-H4A-3MH-180','3x 3 MP; WDR; LightCatcher; 4mm; Camera Only','',''),(162,6,9,94,'3x 3MP H4 Multisensor Camera Module with 2.8mm Lens','9C-H4A-3MH-270','3x 3 MP; WDR; LightCatcher; 2.8mm; Camera Only','',''),(163,6,9,94,'16 MP H5 Pro Box Camera','16C-H5PRO-B','5K (16 MP) H5 Pro Camera.  Lens and housing not included.','',''),(164,6,9,94,'26 MP H5 Pro Box Camera','26C-H5PRO-B','6.25K (26 MP) H5 Pro Camera. Lens and housing not included.','',''),(165,6,9,94,'40 MP H5 Pro Box Camera','40C-H5PRO-B','8K (40 MP) H5 Pro Camera. Lens and housing not included.','',''),(166,6,9,94,'61 MP H5 Pro Box Camera','61C-H5PRO-B','10K (61 MP) H5 Pro Camera. Lens and housing not included.','',''),(167,6,9,94,'8 MP H5 Pro Box Camera','8C-H5PRO-B','4K (8 MP) H5 Pro Camera.  Lens and housing not included.','',''),(168,6,9,94,'1MP H4 IRPTZ with 45x Optical Zoom and Wiper','1.0C-H4IRPTZ-DP45-WP','1MP H4 IR PTZ with Wiper 45X; Self-learning analytics; IK10; IP66; 250m IR','',''),(169,6,9,94,'2MP H4 IRPTZ with 30x Optical Zoom and Wiper','2.0C-H4IRPTZ-DP30-WP','2MP H4 IR PTZ; with Wiper 30X; Self-learning analytics; IK10; IP66; 250m IR','',''),(170,6,9,94,'2.0C-H5A-PTZ-DC36','2.0C-H5A-PTZ-DC36','H5A; 2MP 36x In-Ceiling PTZ Dome','',''),(171,6,9,94,'2.0C-H5A-PTZ-DP36','2.0C-H5A-PTZ-DP36','H5A; 2MP 36x Pendant PTZ Dome','',''),(172,6,9,94,'2MP Explosion Protected PTZ Camera with 30x Zoom and Wiper; Requires 230VAC','2.0C-H5EXPTZ-A0-BO30','Explosion protected PTZ camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 230VAC power input. Built to order; orders are non-cancellable and non-returnable.','',''),(173,6,9,94,'2MP Explosion Protected PTZ Camera with 30x Zoom and Wiper; Requires 24VAC','2.0C-H5EXPTZ-B0-BO30','Explosion protected PTZ camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 24VAC power input. Built to order; orders are non-cancellable and non-returnable.','',''),(174,6,9,94,'2MP Explosion Protected PTZ Camera with 30x Zoom and Wiper; Requires 120VAC','2.0C-H5EXPTZ-C0-BO30','Explosion protected PTZ camera; 2.0MP (1080p); 30x; WDR; Next Generation Analytics; LightCatcher; AISI 316L stainless steel; wiper; 120VAC power input. Built to order; orders are non-cancellable and non-returnable.','',''),(175,6,9,94,'4.0C-H5A-PTZ-DC36','4.0C-H5A-PTZ-DC36','H5A; 4MP 36x In-Ceiling PTZ Dome','',''),(176,6,9,94,'4.0C-H5A-PTZ-DP36','4.0C-H5A-PTZ-DP36','H5A; 4MP 36x Pendant PTZ Dome','',''),(177,6,9,94,'8.0C-H5A-PTZ-DC36','8.0C-H5A-PTZ-DC36','H5A; 8MP 36x In-Ceiling PTZ Dome','',''),(178,6,9,94,'8.0C-H5A-PTZ-DP36','8.0C-H5A-PTZ-DP36','H5A; 8MP 36x Pendant PTZ Dome','',''),(179,6,9,94,'QVGA H4 Bullet Camera with 18mm Lens','320S-H4A-THC-BO12','320x256; Thermal Outdoor Bullet; 18.0mm f/1.0; 9Hz; NETD<60mK; Self-Learning Video Analytics','',''),(180,6,9,94,'QVGA H4 Bullet Camera with 9.1mm Lens','320S-H4A-THC-BO24','320x256; Thermal Outdoor Bullet; 9.1mm f/1.0; 9Hz; NETD<60mK; Self-Learning Video Analytics','',''),(181,6,9,94,'QVGA H4 Bullet Camera with 4.3mm Lens','320S-H4A-THC-BO50','320x256; Thermal Outdoor Bullet; 4.3mm f/1.0; 9Hz; NETD<60mK; Self-Learning Video Analytics','',''),(182,6,9,94,'VGA H4 Bullet Camera with 36mm Lens','640S-H4A-THC-BO12','640x512; Thermal Outdoor Bullet; 36.0mm f/1.0; 9Hz; NETD<60mK; Self-Learning Video Analytics','',''),(183,6,9,94,'VGA H4 Bullet Camera with 18mm Lens','640S-H4A-THC-BO24','640x512; Thermal Outdoor Bullet; 18.0mm f/1.0; 9Hz; NETD<60mK; Self-Learning Video Analytics','',''),(184,6,9,94,'VGA H4 Bullet Camera with 8.7mm Lens','640S-H4A-THC-BO50','640x512; Thermal Outdoor Bullet; 8.7mm f/1.0; 9Hz; NETD<60mK; Self-Learning Video Analytics','',''),(185,6,9,94,'Elevated Temperature Detection Solution Kit','H4A-ETD-KIT','H4 Thermal Elevated Temperature Detection Solution; 640x512 Thermal Bullet Camera; Black Body; Tripod x 2','',''),(186,6,9,102,'NVR4 Premium 157TB; Windows Server 2016','HD-NVR4-PRM-157TB','NVR4 Premium 157TB; 2U Rack Mount; Windows Server 2016','',''),(187,6,9,102,'NVR4 Premium 192TB; Windows Server 2016','HD-NVR4-PRM-192TB','NVR4 Premium 192TB; 2U Rack Mount; Windows Server 2016','',''),(188,6,9,102,'NVR4 Premium 64TB; Windows Server 2016','HD-NVR4-PRM-64TB','NVR4 Premium 64TB; 2U Rack Mount; Windows Server 2016','',''),(189,6,9,102,'NVR4 Standard 48TB; Windows Server 2016','HD-NVR4-STD-48TB-S16','NVR4 Standard 48TB; 2U Rack Mount; Windows Server 2016','',''),(190,6,9,102,'NVR4 Value 12TB; Windows 10','NVR4-VAL-12TB','NVR4 Value 12TB; 1U Rack Mount; Windows 10','',''),(191,6,9,102,'NVR4 Value 16TB; Windows 10','NVR4-VAL-16TB','NVR4 Value 16TB; 1U Rack Mount; Windows 10','',''),(192,6,9,102,'NVR4 Value 24TB; Windows 10','NVR4-VAL-24TB','NVR4 Value 24TB; 1U Rack Mount; Windows 10','',''),(193,6,9,102,'NVR4 Value 6TB; Windows 10','NVR4-VAL-6TB','NVR4 Value 6TB; 1U Rack Mount; Windows 10','',''),(194,6,9,102,'NVR4 Workstation 4TB; Windows 10','NVR4-WKS-4TB','NVR4 Workstation 4TB; Windows 10','',''),(195,6,9,102,'NVR4 Workstation 8TB; Windows 10','NVR4-WKS-8TB','NVR4 Workstation 8TB; Windows 10','',''),(196,6,9,102,'NVR4X Premium 128TB 2U Rack Mnt; Windows Server 2016','NVR4X-PRM-128TB','NVR4X Premium 128TB 2U Rack Mnt; Windows Server 2016','',''),(197,6,9,102,'NVR4X Premium 157TB 2U Rack Mnt; Windows Server 2016','NVR4X-PRM-157TB','NVR4X Premium 157TB 2U Rack Mnt; Windows Server 2016','',''),(198,6,9,102,'NVR4X Premium 192TB 2U Rack Mnt; Windows Server 2016','NVR4X-PRM-192TB','NVR4X Premium 192TB 2U Rack Mnt; Windows Server 2016','',''),(199,6,9,102,'NVR4X Premium 217TB 2U Rack Mnt; Windows Server 2016','NVR4X-PRM-217TB','NVR4X Premium 217TB 2U Rack Mnt; Windows Server 2016','',''),(200,6,9,102,'NVR4X Premium 64TB 2U Rack Mnt; Windows Server 2016','NVR4X-PRM-64TB','NVR4X Premium 64TB 2U Rack Mnt; Windows Server 2016','',''),(201,6,9,102,'NVR4X Premium 96TB 2U Rack Mnt; Windows Server 2016','NVR4X-PRM-96TB','NVR4X Premium 96TB 2U Rack Mnt; Windows Server 2016','',''),(202,6,9,102,'NVR4X Premium - FIPS Series; 128TB; Windows Server 2016','NVR4X-PRM-FIPS-128TB','NVR4X Premium - FIPS Series; 128TB; Windows Server 2016','',''),(203,6,9,102,'NVR4X Premium - FIPS Series; 157TB; Windows Server 2016','NVR4X-PRM-FIPS-157TB','NVR4X Premium - FIPS Series; 157TB; Windows Server 2016','',''),(204,6,9,102,'NVR4X Premium - FIPS Series; 64TB; Windows Server 2016','NVR4X-PRM-FIPS-64TB','NVR4X Premium - FIPS Series; 64TB; Windows Server 2016','',''),(205,6,9,102,'NVR4X Premium - FIPS Series; 96TB; Windows Server 2016','NVR4X-PRM-FIPS-96TB','NVR4X Premium - FIPS Series; 96TB; Windows Server 2016','',''),(206,6,9,102,'NVR4X Standard 16TB 2U Rack Mnt; Windows Server 2016','NVR4X-STD-16TB-S16','NVR4X Standard 16TB 2U Rack Mnt; Windows Server 2016','',''),(207,6,9,102,'NVR4X Standard 16TB 2U Rack Mnt; Windows 10','NVR4X-STD-16TB','NVR4X Standard 16TB 2U Rack Mnt; Windows 10','',''),(208,6,9,102,'NVR4X Standard 24TB 2U Rack Mnt; Windows Server 2016','NVR4X-STD-24TB-S16','NVR4X Standard 24TB 2U Rack Mnt; Windows Server 2016','',''),(209,6,9,102,'NVR4X Standard 24TB 2U Rack Mnt; Windows 10','NVR4X-STD-24TB','NVR4X Standard 24TB 2U Rack Mnt; Windows 10','',''),(210,6,9,102,'NVR4X Standard 32TB 2U Rack Mnt; Windows Server 2016','NVR4X-STD-32TB-S16','NVR4X Standard 32TB 2U Rack Mnt; Windows Server 2016','',''),(211,6,9,102,'NVR4X Standard 32TB 2U Rack Mnt; Windows 10','NVR4X-STD-32TB','NVR4X Standard 32TB 2U Rack Mnt; Windows 10','',''),(212,6,9,102,'NVR4X Standard 48TB 2U Rack Mnt; Windows Server 2016','NVR4X-STD-48TB-S16','NVR4X Standard 48TB 2U Rack Mnt; Windows Server 2016','',''),(213,6,9,102,'NVR4X Standard 48TB 2U Rack Mnt; Windows 10','NVR4X-STD-48TB','NVR4X Standard 48TB 2U Rack Mnt; Windows 10','',''),(214,6,9,102,'AI NVR Standard; 24TB','AINVR-STD-24TB','AI NVR Standard; 24TB','',''),(215,6,9,102,'AI NVR Standard; 32TB','AINVR-STD-32TB','AI NVR Standard; 32TB','',''),(216,6,9,102,'AI NVR Standard; 48TB','AINVR-STD-48TB','AI NVR Standard; 48TB','',''),(217,6,9,102,'AI NVR Value; 12TB','AINVR-VAL-12TB','AI NVR Value; 12TB','',''),(218,6,9,102,'AI NVR Value; 6TB','AINVR-VAL-6TB','AI NVR Value; 6TB','',''),(219,6,9,124,'HD Video Appliance; 16-Port; 6TB','VMA-AS3-16P06','HD Video Appliance Pro 16-Port 6TB unit. ACC licenses sold separately','',''),(220,6,9,124,'HD Video Appliance; 16-Port; 9TB','VMA-AS3-16P09','HD Video Appliance Pro 16-Port 9TB unit. ACC licenses sold separately','',''),(221,6,9,124,'HD Video Appliance; 16-Port; 12TB','VMA-AS3-16P12','HD Video Appliance Pro 16-Port 12TB unit. ACC licenses sold separately','',''),(222,6,9,124,'HD Video Appliance; 24-Port; 12TB','VMA-AS3-24P12','HD Video Appliance Pro 24-Port 12TB unit. ACC licenses sold separately','',''),(223,6,9,124,'HD Video Appliance; 24-Port; 18TB','VMA-AS3-24P18','HD Video Appliance Pro 24-Port 18TB unit. ACC licenses sold separately','',''),(224,6,9,124,'HD Video Appliance; 24-Port; 24TB','VMA-AS3-24P24','HD Video Appliance Pro 24-Port 24TB unit. ACC licenses sold separately','',''),(225,6,9,124,'HD Video Appliance; 8-Port; 2TB','VMA-AS3-8P2','HD Video Appliance 8-Port 2TB unit. ACC licenses sold separately','',''),(226,6,9,124,'HD Video Appliance; 8-Port; 4TB','VMA-AS3-8P4','HD Video Appliance 8-Port 4TB unit. ACC licenses sold separately','',''),(227,6,9,124,'HD Video Appliance; 8-Port; 8TB','VMA-AS3-8P8','HD Video Appliance 8-Port 8TB unit. ACC licenses sold separately','',''),(228,6,9,124,'ES 8-Port Appliance; 4TB','VMA-ENVR1-8P4A','ES 8-Port Appliance; 4TB; ACC and Analytics licenses sold separately.','',''),(229,6,9,124,'ES 8-Port Appliance; 8TB','VMA-ENVR1-8P8A','ES 8-Port Appliance; 8TB; ACC and Analytics licenses sold separately.','',''),(230,6,9,124,'ES 8-Port Rugged Appliance; 2TB','VMA-RPA-RGD-8P2','ES 8-Port Rugged Appliance with 2TB; power supply sold separately','',''),(231,6,9,124,'ES 8-Port Rugged Appliance; 4TB','VMA-RPA-RGD-8P4','ES 8-Port Rugged Appliance with 4TB; power supply sold separately','',''),(232,6,9,124,'ES HD Recorder; 4TB','VMA-RPO-4P4-NA','ES HD Recorder with 4TB of storage; 4 ACC channel licenses; and an North American power cord','',''),(233,6,9,124,'AIA1 to AIA2 Upgrade Kit (CG1 Models)','VMA-AIA1-CG1-UPGK','Kit to upgrade VMA-AIA1-CG1-XX to VMA-AIA2-CG1-XX.','',''),(234,6,9,124,'AIA1 to AIA2 Upgrade Kit (CG2 Models)','VMA-AIA1-CG2-UPGK','Kit to upgrade VMA-AIA1-CG2-XX to VMA-AIA2-CG2-XX.','',''),(235,6,9,124,'AI Appliance 2; CG1 Model','VMA-AIA2-CG1','AI Appliance 2 CG1 model with 10 channels of video analytics included (ACC7-VAC)','',''),(236,6,9,124,'AI Appliance 2; CG2 Model','VMA-AIA2-CG2','AI Appliance 2 CG2 model with 30 channels of video analytics included (ACC7-VAC)','',''),(237,6,9,126,'Video Archive Expansion Unit; 263TB; 3YR Support','AVA-EXP1-263TB','Video Archive Expansion Unit; 263TB; 3YR Support','',''),(238,6,9,126,'Video Archive Expansion Unit; 263TB; 5YR Support','AVA-EXP1-263TB-5YR','Video Archive Expansion Unit; 263TB; 5YR Support','',''),(239,6,9,126,'Video Archive Expansion Unit; 526TB; 3YR Support','AVA-EXP1-526TB','Video Archive Expansion Unit; 526TB; 3YR Support','',''),(240,6,9,126,'Video Archive Expansion Unit; 526TB; 5YR Support','AVA-EXP1-526TB-5YR','Video Archive Expansion Unit; 526TB; 5YR Support','',''),(241,6,9,126,'Video Archive Expansion Unit; 789TB; 3YR Support','AVA-EXP1-789TB','Video Archive Expansion Unit; 789TB; 3YR Support','',''),(242,6,9,126,'Video Archive Expansion Unit; 789TB; 5YR Support','AVA-EXP1-789TB-5YR','Video Archive Expansion Unit; 789TB; 5YR Support','',''),(243,6,9,126,'Expansion Disk Pack (263TB); AVA','AVA-HDD1-263TB','263TB Expansion Disk Pack for Avigilon Video Archive','',''),(244,6,9,126,'Video Archive Head Unit; 225TB; 3YR Support','AVA-HED1-225TB','Video Archive Head Unit; 225TB; 3YR Support','',''),(245,6,9,126,'Video Archive Head Unit; 225TB; 5YR Support','AVA-HED1-225TB-5YR','Video Archive Head Unit; 225TB; 5YR Support','',''),(246,6,9,126,'Video Archive Head Unit; 488TB; 3YR Support','AVA-HED1-488TB','Video Archive Head Unit; 488TB; 3YR Support','',''),(247,6,9,126,'Video Archive Head Unit; 488TB; 5YR Support','AVA-HED1-488TB-5YR','Video Archive Head Unit; 488TB; 5YR Support','',''),(248,6,9,126,'Video Archive Head Unit; 751TB; 3YR Support','AVA-HED1-751TB','Video Archive Head Unit; 751TB; 3YR Support','',''),(249,6,9,126,'Video Archive Head Unit; 751TB; 5YR Support','AVA-HED1-751TB-5YR','Video Archive Head Unit; 751TB; 5YR Support','',''),(250,6,9,126,'Video Archive NVR4 Connectivity Kit','AVA-HED1-NVR4-CONNECT','Kit to connect an NVR4 to an Avigilon Video Archive','',''),(251,6,15,128,'SERIAL SERVER; 2-PORT; RS232 to Avigilon','ACC-POS-HW-2S','Avigilon 2 port serial Server','',''),(252,6,15,128,'ACC SDK developer','ACC-SDK-DEV','Grants access to the Avigilon SDK Developer\'s Portal; and the Avigilon Control Center SDK.','',''),(253,6,15,128,'ACC 5 COR 4TO5 UPG','ACC5-4TO5-COR-UPG','ACC 4 to 5 Core Version Upgrade','',''),(254,6,15,128,'ACC 5 ENT 4TO5 UPG','ACC5-4TO5-ENT-UPG','ACC 4 to 5 Enterprise Version Upgrade','',''),(255,6,15,128,'ACC 5 STD 4TO5 UPG','ACC5-4TO5-STD-UPG','ACC 4 to 5 Standard Version Upgrade','',''),(256,6,15,128,'ACC6 Amag Symmetry Integ.','ACC6-AMAG-SMTRY','ACC6 Amag Symmetry Integ.','',''),(257,6,15,128,'ACC6 Amag Symmetry Integ. +media','ACC6-AMAG-SMTRY-M','ACC6 Amag Symmetry Integ. +media','',''),(258,6,15,128,'ACC6 Gallagher CmdC Integ.','ACC6-GLGR-CMNDC','ACC6 Gallagher CmdC Integ.','',''),(259,6,15,128,'ACC6 Gallagher CmdC Integ. +media','ACC6-GLGR-CMNDC-M','ACC6 Gallagher CmdC Integ. +media','',''),(260,6,15,128,'ACC6 Hirsch Velocity Integ.','ACC6-HRSH-VLCTY','ACC6 Hirsch Velocity Integ.','',''),(261,6,15,128,'ACC6 Hirsch Velocity Integ. +media','ACC6-HRSH-VLCTY-M','ACC6 Hirsch Velocity Integ. +media','',''),(262,6,15,128,'ACC6 Interlogix Forcefield Integ.','ACC6-INTX-FORCE','ACC6 Interlogix Forcefield Integ.','',''),(263,6,15,128,'ACC6 Interlogix Forcefield Integ. +media','ACC6-INTX-FORCE-M','ACC6 Interlogix Forcefield Integ. +media','',''),(264,6,15,128,'ACC6 Jacques Intercom Integ.','ACC6-JAQS-INTCM','ACC6 Jacques Intercom Integ.','',''),(265,6,15,128,'ACC6 Jacques Intercom Integ. +media','ACC6-JAQS-INTCM-M','ACC6 Jacques Intercom Integ. +media','',''),(266,6,15,128,'ACC6 Lenel OnGuard Integ.','ACC6-LENL-ONGRD','ACC6 Lenel OnGuard Integ.','',''),(267,6,15,128,'ACC6 Lenel OnGuard Integ. +media','ACC6-LENL-ONGRD-M','ACC6 Lenel OnGuard Integ. +media','',''),(268,6,15,128,'ACC6 Paxton Net2 Integ.','ACC6-PXTN-NET2','ACC6 Paxton Net2 Integ.','',''),(269,6,15,128,'ACC6 Paxton Net2 Integ. +media','ACC6-PXTN-NET2-M','ACC6 Paxton Net2 Integ. +media','',''),(270,6,15,128,'ACC6 S2 Netbox Integ.','ACC6-S2-NETBX','ACC6 S2 Netbox Integ.','',''),(271,6,15,128,'ACC6 S2 Netbox Integ. +media','ACC6-S2-NETBX-M','ACC6 S2 Netbox Integ. +media','',''),(272,6,15,128,'ACC6 Stentofon Intercom Integ.','ACC6-STFN-ALPHA','ACC6 Stentofon Intercom Integ.','',''),(273,6,15,128,'ACC6 Stentofon Intercom Integ. +media','ACC6-STFN-ALPHA-M','ACC6 Stentofon Intercom Integ. +media','',''),(274,6,15,128,'ACC6 SWHS CCure 9000 Integ.','ACC6-SWHS-CCURE','ACC6 SWHS CCure 9000 Integ.','',''),(275,6,15,128,'ACC6 SWHS CCure 9000 Integ. +media','ACC6-SWHS-CCURE-M','ACC6 SWHS CCure 9000 Integ. +media','',''),(276,6,15,128,'ACC 7 Core camera channel','ACC7-COR','ACC 7 Core camera channel','',''),(277,6,15,128,'ACC 7 Core camera channel; printed','ACC7-COR-P','ACC 7 Core camera channel; printed','',''),(278,6,15,128,'ACC 7 CORE to ENT Edition UPG','ACC7-COR-TO-ENT-UPG','ACC 7 CORE to ENT Edition UPG','',''),(279,6,15,128,'ACC 7 CORE to ENT Edition UPG; printed','ACC7-COR-TO-ENT-UPG-P','ACC 7 CORE to ENT Edition UPG; printed','',''),(280,6,15,128,'ACC 7 CORE to STD Edition UPG','ACC7-COR-TO-STD-UPG','ACC 7 CORE to STD Edition UPG','',''),(281,6,15,128,'ACC 7 CORE to STD Edition UPG; printed','ACC7-COR-TO-STD-UPG-P','ACC 7 CORE to STD Edition UPG; printed','',''),(282,6,15,128,'ACC 7 Enterprise camera channel','ACC7-ENT','ACC 7 Enterprise camera channel','',''),(283,6,15,128,'ACC 7 ENT failover channel','ACC7-ENT-FO','ACC 7 ENT failover channel','',''),(284,6,15,128,'ACC 7 ENT failover channel; printed','ACC7-ENT-FO-P','ACC 7 ENT failover channel; printed','',''),(285,6,15,128,'ACC 7 Enterprise camera channel; printed','ACC7-ENT-P','ACC 7 Enterprise camera channel; printed','',''),(286,6,15,128,'ACC 5 or 6 to ACC 7 ENT VER UPG','ACC7-ENT-VER-UPG','ACC 5 or 6 to ACC 7 ENT VER UPG','',''),(287,6,15,128,'ACC 5 or 6 to ACC 7 ENT VER UPG; printed','ACC7-ENT-VER-UPG-P','ACC 5 or 6 to ACC 7 ENT VER UPG; printed','',''),(288,6,15,128,'ACC7 Face channel','ACC7-FACE','ACC7 Face channel','',''),(289,6,15,128,'ACC7 Face channel 10 pack','ACC7-FACE-10C','ACC7 Face channel 10 pack','',''),(290,6,15,128,'ACC7 Face channel 10 pack; printed','ACC7-FACE-10C-P','ACC7 Face channel 10 pack; printed','',''),(291,6,15,128,'ACC7 Face channel; printed','ACC7-FACE-P','ACC7 Face channel; printed','',''),(292,6,15,128,'ACC 7 LPR lane','ACC7-LPR','ACC 7 LPR lane','',''),(293,6,15,128,'ACC 7 LPR lane; printed','ACC7-LPR-P','ACC 7 LPR lane; printed','',''),(294,6,15,128,'ACC 7 Media','ACC7-MEDIA','ACC 7 Media','',''),(295,6,15,128,'ACC 7 Point of Sale stream','ACC7-POS-STR','ACC 7 Point of Sale stream','',''),(296,6,15,128,'ACC 7 Point of Sale stream; printed','ACC7-POS-STR-P','ACC 7 Point of Sale stream; printed','',''),(297,6,15,128,'ACC7 Radio Alert','ACC7-RADIO-ALERT','ACC7 Radio Alert','',''),(298,6,15,128,'ACC7 Radio Alert; printed','ACC7-RADIO-ALERT-P','ACC7 Radio Alert; printed','',''),(299,6,15,128,'ACC 7 Standard camera channel','ACC7-STD','ACC 7 Standard camera channel','',''),(300,6,15,128,'ACC 7 Standard camera channel; printed','ACC7-STD-P','ACC 7 Standard camera channel; printed','',''),(301,6,15,128,'ACC 7 STD to ENT Edition UPG','ACC7-STD-TO-ENT-UPG','ACC 7 STD to ENT Edition UPG','',''),(302,6,15,128,'ACC 7 STD to ENT Edition UPG; printed','ACC7-STD-TO-ENT-UPG-P','ACC 7 STD to ENT Edition UPG; printed','',''),(303,6,15,128,'ACC 5 or 6 to ACC 7 STD VER UPG','ACC7-STD-VER-UPG','ACC 5 or 6 to ACC 7 STD VER UPG','',''),(304,6,15,128,'ACC 5 or 6 to ACC 7 STD VER UPG; printed','ACC7-STD-VER-UPG-P','ACC 5 or 6 to ACC 7 STD VER UPG; printed','',''),(305,6,15,128,'ACC7 Video Analytics channel','ACC7-VAC','ACC7 Video Analytics channel','',''),(306,6,15,128,'ACC7 Video Analytics channel; printed','ACC7-VAC-P','ACC7 Video Analytics channel; printed','',''),(307,6,15,128,'FIPS Camera license','CAM-FIPS','FIPS Camera license','',''),(308,6,3,36,'PoE Extender','EX1','Single port 100Mbps POE Extender for extending Cat 5 beyond the 100m cable limit.\n','',''),(309,6,3,37,'POE-INJ-BT-60W','POE++ Injector; 802.3bt; 60W','Indoor single port Gigabit PoE++ 60W; 802.3bt compliant.  Compatible only with cameras requiring the 802.3bt PoE ++ standard.','',''),(310,6,3,37,'POE-INJ2-60W-NA','POE++ Injector; 60W','Indoor single port Gigabit PoE++ 60W. ','',''),(311,6,3,37,'POE-INJ2-95W','POE Injector; 95W','Indoor single Port PoE Injector Gigabit; 95W; NA power cord; for use with H4IR PTZ - indoor installation rated. Temperature range of the PoE injector is -10C to +45C. ','',''),(312,6,3,37,'POE+ Injector','POE-INJ2-PLUS','Indoor single port POE+ injector; for use with H4 PTZ in-ceiling or pendant variants.','',''),(313,6,3,37,'POE Injector','POE-INJ2-STD','Indoor single port Gigabit 802.3af PoE injector; Class 3.','',''),(314,6,3,32,'28-port Gigabit Managed Switch','CBS350-24FP-4G','28-port Gigabit Managed Switch (24 PoE+ budget 370W; 4 Gigabit SFP)\n','',''),(315,6,3,32,'10-port Gigabit Managed Switch','CBS350-8FP-E-2G','10-port Gigabit Managed Switch (8 PoE+ budget 120W; 2 copper/SFP combo)','',''),(316,6,3,32,'Pole mount bracket for ES-PS-S4 switch.','ES-PS-MNT-POLE','Pole mount bracket for ES-PS-S4 switch.','',''),(317,6,3,32,'5-port Managed switch ','ES-PS-S4','Managed switch; 5 port; Outdoor IP66. 1x SFP uplink and 4 port RJ45. Maximum PoE power allocation: Up to 4 ports of PoE+ each; or 2 ports of 60W PoE each.  In 60W PoE mode; compatible with all H4 PTZ and H4 IR PTZ.\n','',''),(318,6,3,32,'10-port Gigabit (8 PoE) Managed Switch.','S8P-124W','10-port Gigabit (8 PoE) Managed Switch; 124W ','',''),(319,6,9,125,'2 Monitor Workstation','RM5-WKS-2MN','Remote Monitoring Workstation; 2 monitors','',''),(320,6,9,125,'4 Monitor Workstation','RM5-WKS-4MN','Remote Monitoring Workstation; 4 monitors','',''),(321,6,9,129,'Joystick','ACC-USB-JOY','Programmable USB Surveillance Joystick for controlling digital and conventional PTZ within Avigilon Control Center','',''),(322,6,9,129,'Joystick Professional Version','ACC-USB-JOY-PRO','Fully configured Professional USB Surveillance joystick for full control of Avigilon Control Center including shuttle playback control and digital and conventional PTZ.','',''),(323,6,9,101,'Monitor 19\"\"','M1300','Monitor 19\" LCD HD SXGA\"','',''),(324,6,9,101,'Monitor 24\"\"','MHD24-G2','Monitor 24\" LCD HD WUXGA\"','',''),(325,6,9,101,'Monitor 32\"\"','M4K32','Monitor 32\" LCD 4K UHD 16:9 Widescreen Aspect Ratio\"','',''),(326,6,9,101,'Monitor 43\"\"','M4K43-G2','Monitor 43\" LCD 4K UHD 16:9 Widescreen Aspect Ratio\"','',''),(327,6,9,97,'Analog Video Encoder','ENC-4P-H264','4-Port H.264 Analog Video Encoder with 4 audio support','',''),(328,6,9,97,'1U Mounting Bracket for Encoders','ENC-BRK1U','1U Rack Mount Shelf for three Avigilon Analog Video Encoders\n','',''),(329,6,16,106,'H4 QVGA Thermal Camera 1 Year Extended Warranty','320SH4ATHC-WARR-EXTEND-1YR','Extended Warranty for QVGA H4 Thermal cameras; 1 year extension','',''),(330,6,16,106,'H4 QVGA Thermal Camera 2 Years Extended Warranty','320SH4ATHC-WARR-EXTEND-2YR','Extended Warranty for QVGA H4 Thermal cameras; 2 years extension','',''),(331,6,16,106,'H4 VGA Thermal Camera 1 Year Extended Warranty','640SH4ATHC-WARR-EXTEND-1YR','Extended Warranty for VGA H4 Thermal cameras; 1 year extension','',''),(332,6,16,106,'H4 VGA Thermal Camera 2 Years Extended Warranty','640SH4ATHC-WARR-EXTEND-2YR','Extended Warranty for VGA H4 Thermal cameras; 2 years extension','',''),(333,6,16,106,'H4 Thermal ETD cameras 1 Year Extended Warranty','640SH4ATHD-WARR-EXTEND-1YR','Extended Warranty for H4 Thermal ETD cameras; 1 year extension','',''),(334,6,16,106,'H4 Thermal ETD cameras 2 Year Extended Warranty','640SH4ATHD-WARR-EXTEND-2YR','Extended Warranty for H4 Thermal ETD cameras; 2 year extension','',''),(335,6,16,106,'Microphone','ACC-MIC','Omni-directional; low impedance; electret condenser microphone with built-in preamp for producing line level output','',''),(336,6,16,106,'PoE Splitter','ACC-SPLIT','POE Splitter for Camera Installation','',''),(337,6,16,106,'APD 1 Year Extended Warranty','APD-WARR-EXTEND-1YR','Extended Warranty for Avigilon Presence Detector; 1 year extension','',''),(338,6,16,106,'APD 2 Years Extended Warranty','APD-WARR-EXTEND-2YR','Extended Warranty for Avigilon Presence Detector; 2 year extension','',''),(339,6,16,106,'Armored Cable for Explosion Protected Camera (per m)','AVGEX-CMAN0401','Armored cable available by metre (min. 10m): 1 Ethernet cable; 3 power supply wires.','',''),(340,6,16,106,'Armored Cable for Explosion Protected Camera (per m)','AVGEX-CMAN1200','Armored cable available by metre (min. 10m): 1 ethernet cable; 3 power supply wires; 1 coaxial cable; 7 wires for alarms; relays and telemetry','',''),(341,6,16,106,'Unarmored Cable for Explosion Protected Camera (per m)','AVGEX-CMSN0400','Unrmored cable available by metre (min. 10m): 1 Ethernet cable; 3 power supply wires. ','',''),(342,6,16,106,'Unarmored Cable for Explosion Protected Camera (per m)','AVGEX-CMSN2200','Unarmored cable available by metre (min. 10m): 2 ethernet cable; 3 power supply wires; 2 coaxial cable; 15 wires for alarms; relays and telemetry.','',''),(349,6,16,106,'Adapter Plate for MBX Communication Box','AVGEX-MBXMP','Adapter plate for communication box to AVGEX-MPXCOL or AVGEX-MPXCW mounts. AISI 316L stainless steel','',''),(350,6,16,106,'Opening Wrench for MBX Communication Box','AVGEX-MBXWRE','Wrench for opening communication boxes; AVGEX-MBX.','',''),(351,6,16,106,'Parapet Mounting Bracket for H5EX Bullet Camera','AVGEX-MHXWFWCA','Parapet mounting bracket for H5EX-BO; AISI 316L stainless steel.','',''),(352,6,16,106,'Replacement 10m Armored Cable for H5EX Compact Bullet','AVGEX-MMXCABLARM10','Replacement 10m armored cable for H5EX Compact Bullet. ','',''),(353,6,16,106,'Replacement 4m Armored Cable for H5EX Compact Bullet','AVGEX-MMXCABLARM4','Replacement 4m armored cable for H5EX Compact Bullet. ','',''),(354,6,16,106,'Stainless Steel Corner and Pole Mount for H5EX Compact Bullet','AVGEX-MMXCWCOL','Stainless steel AISI 316L Corner and pole mount adaptor for H5EX compact bullet.','',''),(355,6,16,106,'10m Cable for H5 Explosion Protected PTZ','AVGEX-MPX2CABL10','Cabling for H5EXPTZ 10m; prewired and barrier cable gland.','',''),(356,6,16,106,'4m Cable for H5 Explosion Protected PTZ','AVGEX-MPX2CABL4','Cabling for H5EXPTZ 4m; prewired and barrier cable gland. ','',''),(357,6,16,106,'10m Armored Cable for H5 Explosion Protected PTZ','AVGEX-MPX2CABLARM10','Armored Cabling for H5EXPTZ 10m; prewired and barrier cable gland. ','',''),(358,6,16,106,'4m Armoed Cable for H5 Explosion Protected PTZ','AVGEX-MPX2CABLARM4','Armored Cabling for H5EXPTZ 4m; prewired and barrier cable gland.','',''),(359,6,16,106,'Stainless Steel Pole Mount for MBX Comm Box or H5EX PTZ Cameras','AVGEX-MPXCOL','Pole mount for use with AVGEX-MBXMP or H5EX PTZ cameras. For pole diameter from 110mm (4.3”) to 150mm (5.9”). Max load 50kg (110 lb). AISI 316L stainless steel.','',''),(360,6,16,106,'Stainless Steel Corner Mount for MBX Comm Box or H5EX PTZ Cameras','AVGEX-MPXCW','Corner mount for use with AVGEX-MBXMP or H5EX PTZ cameras. Max load 50 kg (110lb). AISI 316L stainless steel. ','',''),(361,6,16,106,'Stainless Steel Wall Bracket for H5EX PTZ','AVGEX-MPXWBA','Wall bracket; for H5EX PTZ; AISI 316L stainless steel.','',''),(362,6,16,106,'Stainless Steel Parapet or Ceiling Mount Bracket for H5EX PTZ','AVGEX-MPXWBTA','Parapet or ceiling mount bracket for H5EX PTZ; AISI 316L stainless steel.','',''),(363,6,16,106,'Stainless Steel Pole Mount Adapter for H5EX Bullet Cameras or Washers','AVGEX-NXCOL','Pole mount adaptor; for H5EX bullet cameras or explosion proof washers; for pole diameters from 110mm (4.3”) to 150mm (5.9”); max load 50kg (110lbs); AISI 316L stainless steel.','',''),(364,6,16,106,'Stainless Steel Corner Mount Adapter for H5EX Bullet Cameras or Washers','AVGEX-NXCW','Corner mount adaptor; for H5EX bullet cameras or explosion proof washers; max load 50kg (110lbs); AISI 316L stainless steel','',''),(365,6,16,106,'Stainless Steel Parapet Extension for H5EX Bullet Camera','AVGEX-NXFWBT','Parapet extension for H5EX-BO; 124mm (4.9\"); AISI 316L stainless steel.\"','',''),(366,6,16,106,'Stainless Steel Wall Bracket for H5EX Bullet Camera','AVGEX-NXWBS1','Wall bracket for H5EX-BO; AISI 316L stainless steel.','',''),(367,6,16,106,'Stainless Steel Wall Adapter for AVGEX-NXWBS1','AVGEX-NXWTU','Wall adapter module; for use with AVGEX-NXWBS1. AISI 316L stainless steel.','',''),(368,6,16,106,'AVGEX-OCTEX1/2-3/4P','AVGEX-OCTEX1/2-3/4P','Cable gland reduction in nickel-plated brass 3/4\" - 1/2\"\" NPT -100°C/+400°C\"','',''),(369,6,16,106,'AVGEX-OCTEXB1/2P','AVGEX-OCTEXB1/2P','Barrier cable gland 1/2\" NPT unarmoured cable IECEX-ATEX -60/+135°C\"','',''),(370,6,16,106,'AVGEX-OCTEXB3/4P','AVGEX-OCTEXB3/4P','Barrier cable gland 3/4\" NPT unarmoured cable IECEX-ATEX -60/+135°C\"','',''),(371,6,16,106,'AVGEX-OCTEXBA1/2P','AVGEX-OCTEXBA1/2P','Barrier cable gland 1/2\" NPT armoured cable -60/+135°C\"','',''),(372,6,16,106,'AVGEX-OCTEXBA3/4P','AVGEX-OCTEXBA3/4P','Barrier cable gland 3/4\" NPT armoured cable -60/+135°C\"','',''),(373,6,16,106,'AVGEX-OEXPLUG1/2P','AVGEX-OEXPLUG1/2P','EX 1/2\" NPT IECEX-ATEX plug -100/+400°C\"','',''),(374,6,16,106,'AVGEX-OEXPLUG3/4P','AVGEX-OEXPLUG3/4P','EX 3/4\" NPT IECEX-ATEX plug -100/+400°C\"','',''),(375,6,16,106,'10L Water Tank and Pump with Explosion Protected Solenoid; ATEX Rated','AVGEX-WASEX2T4AT','Stainless steel enclosure; 10L water tank and pump with explosion proof solenoid valve; 20m delivery; 24VAC/VDC; ATEX IIC-IIIC T6-T5-T4; EAC Ex. ','',''),(376,6,16,106,'10L Water Tank and Pump with Explosion Protected Solenoid; EAC Ex Rated','AVGEX-WASEX2T4GOR','Stainless steel enclosure; 10L water tank and pump with explosion proof electrovalve; 20m delivery; 24VAC/VDC; EAC Ex. ','',''),(377,6,16,106,'10L Water Tank and Pump with Explosion Protected Solenoid; INMETRO Rated','AVGEX-WASEX2T4IN','Stainless steel enclosure; 10L water tank and pump with explosion proof solenoid valve; 20m delivery; 24VAC/VDC; INMETRO. ','',''),(378,6,16,106,'10L Water Tank and Pump with Explosion Protected Solenoid; KCs Rated','AVGEX-WASEX2T4KC','Stainless steel enclosure; 10L water tank and pump with explosion proof solenoid valve; 20m delivery; 24VAC/VDC; KCs. ','',''),(379,6,16,106,'Replacement Dome NPT Plugs for H3 or H3A Dome Cameras; Pack of 6','CAM-ACCS-H3-D-PLUG','Replacement H3 Dome NPT Plugs; pack of 6','',''),(380,6,16,106,'3.5mm audio and video I/O jack with 1.8m fly wire','CM-AC-AVIO1','3.5mm audio and video I/O jack with 1.8m fly wire','',''),(381,6,16,106,'Ferrite Clamp for H4 Multisensor (Pack of 5)','CM-AC-FERR1','Ferrite clamp; for use with H4 Multisensor aux power cable to meet EN-50121-4 compliance. Pack of 5.','',''),(382,6,16,106,'3/4\" Cable Sealing Grommet (Pack of 10)\"','CM-AC-GROM1','Cable sealing grommet for use with 3/4\" conduit entry; pack of 10\"','',''),(383,6,16,106,'Pendant Wall Arm','CM-MT-WALL1','Pendant wVideo arm for H4 Fisheye (needs H4F-MT-NPTA1); H4SL (needs H4SL-MT-NPTA1); H4 PTZ or H3-xMH-DP-B cameras.','',''),(384,6,16,106,'Replacement Clear Dome for JPEG2000 Dome or Panoramic Domes; No Trim Ring','DOME-CLEAR','Replacement dome bubble for JPEG2000 Dome and JPEG2000 Panoramic cameras.','',''),(385,6,16,106,'Replacement Clear Dome for JPEG2000 Dome or Panoramic Domes; With Trim Ring','DOME-CVR-CLEAR','Replacement clear dome bubble and trim for JPEG2000 Panoramic and JPEG2000 dome cameras.','',''),(386,6,16,106,'In-Ceiling Mounting Adapter for JPEG2000 Dome or Panoramic Domes','DOME-IND-CEL','Indoor in-ceiling mount add-on adapter Videoows the camera to be ceiling mounted with only the external clear bubble showing.','',''),(387,6,16,106,'Electrical Box Mounting Plate for JPEG2000 Dome or Panoramic Dome','DOME-INDE-PLT','Indoor electrical box mounting plate add-on; Videoows mounting with side cable access and mounting to a 4S electrical box.','',''),(388,6,16,106,'Outdoor Mounting Base for JPEG2000 Dome or JPEG2000 Panoramic Dome','DOME-OD-BASE','Outdoor mounting base add-on; creates an IP66 seal and Videoows conduit connection and pipe mounting.','',''),(389,6,16,106,'Pendant Mount for JPEG2000 Dome or Panoramic Dome','DOME-OD-PEND','Indoor/Outdoor pendant mount; creates an IP66 sealed enclosure for connection to industry standard pendant wVideo brackets.','',''),(390,6,16,106,'Replacement Smoke Dome for JPEG2000 Dome or Panoramic Domes; No Trim Ring','DOME-SMOKE','Replacement smoked transparent dome and trim for JPEG2000 Panoramic and JPEG2000 dome cameras.','',''),(391,6,16,106,'Medium Camera Enclosure for Box Style Cameras with Cooler','ES-HD-CWS','Standard Format Enclosure for cameras with 12VDC/24VDC Vented Cooler; Wall Bracket and Sunshield. Maximum combined camera and lens length is 9.8\" (25 cm).\"','',''),(392,6,16,106,'Large Camera Enclosure for Box Style Cameras with Cooler','ES-HD-CWS-LG','Large Format Enclosure for Avigilon HD IP Professional Cameras with 12VDC/24VDC Vented Cooler; Wall Bracket and Sunshield. Maximum combined camera and lens length is 12.8\" (32.5 cm).\"','',''),(393,6,16,106,'Extra Large Camer Enclosure for Pro Cameras','ES-HD-HS-XL','Extra Large Format Enclosure for Avigilon HD IP Professional Cameras with 24 VAC Triple fan assisted heater. Maximum combined camera and lens length is 20\" (51.9 cm).\"','',''),(394,6,16,106,'Medium Camera Enclosure for Box Style Cameras with Heater','ES-HD-HWS','Standard Format Enclosure for cameras with 12VDC/24VAC Heater; Wall Bracket and Sunshield. Maximum combined camera and lens length is 9.8\" (25 cm).\"','',''),(395,6,16,106,'Large Camera Enclosure for Box Style Cameras with Heater','ES-HD-HWS-LG','Large Format Enclosure for Avigilon HD IP Professional Cameras with 12VDC/24VAC Heater; Wall Bracket and Sunshield. Maximum combined camera and lens length is 12.8\" (32.5 cm).\"','',''),(396,6,16,106,'SmVideo Camera Enclosure for Box Style Cameras with Heater','ES-HD-HWS-SM','Standard Format Enclosure for Avigilon HD H.264 IP Cameras with 12VDC/24VAC Heater; Wall Bracket and Sunshield. Maximum combined camera and lens length is 9.8\" (25 cm).\"','',''),(397,6,16,106,'PoE+ Module for Camera Enclosures','ES-HD-IPM','Optional PoE+ power module. Powers full camera enclosure features and supplies PoE power to camera with a single Ethernet connection. Compatible with ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG & ES-HD-CWS-LG.  Not compatible with H5 Pro cameras.','',''),(398,6,16,106,'Ceiling Arm for Camera Enclosures','ES-HD-MNT-ARM','Ceiling arm mount for ES-HD-HWS-SM; ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG & ES-HD-CWS-LG.','',''),(399,6,16,106,'Corner Mount Adapter for Camera Enclosures','ES-HD-MNT-CORNER','Corner mount adapter. Compatible with wVideo arm included with for ES-HD-HWS-SM; ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG; ES-HD-CWS-LG or ES-HD-LP-HS enclosures.','',''),(400,6,16,106,'Pedestal Mount Adatper for Camera Enclosures','ES-HD-MNT-PAR','Pedestal and ceiling mount for ES-HD-HWS-SM; ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG; ES-HD-CWS-LG or ES-HD-LP-HS enclosure.','',''),(401,6,16,106,'Wall Reinforcing Plate for Camera Enclosures','ES-HD-MNT-PLATE','Wall reinforcing wVideo plate; compatible with wVideo arm included with for ES-HD-HWS-SM; ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG; ES-HD-CWS-LG or ES-HD-LP-HS enclosures.','',''),(402,6,16,106,'Large Pole Mount Adapter for Camera Enclosures','ES-HD-MNT-POLE-LG','Large pole mount for pole diameter 210mm (8.2 in) to 225mm (8.85 in). Compatible with wVideo arm included with for ES-HD-HWS-SM; ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG; ES-HD-CWS-LG or ES-HD-LP-HS enclosures when used in conjunction with ES-HD-MNT-PLATE.','',''),(404,6,16,106,'SmVideo Pole Mount Adapter for Camera Enclosure','ES-HD-MNT-POLE-SM','SmVideo pole mount for pole diameter 60mm (2.5 in) to 110mm (4.3 in). Compatible with wVideo arm included with for ES-HD-HWS-SM; ES-HD-HWS; ES-HD-CWS; ES-HD-HWS-LG; ES-HD-CWS-LG or ES-HD-LP-HS enclosures Up to two mounting positions.','',''),(405,6,16,106,'BVideo Joint Wall Arm for ES-HD-HS-XL','ES-HD-MNT-WBLA','BVideo joint mount for ES-HD-HS-XL','',''),(406,6,16,106,'H.264 Encoder 1 Year Extended Warranty','H264ENC-WARR-EXTEND-1YR','Extended Warranty for Analog Video Encoder; 1 year extension','',''),(407,6,16,106,'H.264 Encoder 2 Years Extended Warranty','H264ENC-WARR-EXTEND-2YR','Extended Warranty for Analog Video Encoder; 2 years extension','',''),(408,6,16,106,'Bullet Junction Box for H3 or H3A Bullet Cameras','H3-BO-JB','Junction box for the H3-BO-IR HD Bullet Cameras','',''),(409,6,16,106,'Replacement Sunshield for H3 or H3A Bullet Cameras','H3-BO-SHLD1','Replacement sun shield for H3 bullet cameras','',''),(410,6,16,106,'Replacement Clear Dome Cover for Indoor H3 or H3A Dome Cameras','H3-D-CLEAR','Replacement clear transparent cover; includes dome bubble and camera cover for indoor domes.','',''),(411,6,16,106,'Replacement Smoke Dome Cover for Indoor H3 or H3A Dome Cameras','H3-D-SMOKE','Replacement smoked transparent cover; includes dome bubble and camera cover for indoor domes. Reduces light transmission by 50% compared to the standard clear cover. Not recommended for low light applications or with the integrated IR illuminator.','',''),(412,6,16,106,'Replacement Clear Dome Cover for In-Ceiling H3 or H3A Dome Cameras','H3-DC-CLEAR','Replacement clear transparent cover; includes dome bubble and camera cover for in-ceiling domes.','',''),(413,6,16,106,'Metal In-Ceiling Metal Panel for H3 or H3A In-Ceiling Dome Cameras','H3-DC-PNL','Metal ceiling panel for use with H3-DC in-ceiling dome cameras to replace or reinforce the existing ceiling tile in suspended ceiling installations.','',''),(414,6,16,106,'Replacement Smoke Dome Cover for In-Ceiling H3 or H3A Dome Cameras','H3-DC-SMOKE','Replacement smoked transparent cover; includes dome bubble and camera cover for in-ceiling domes. Reduces light transmission by 50% compared to the standard clear cover. Not recommended for low light applications.','',''),(415,6,16,106,'Replacement Clear Dome Cover for Outdoor or Pendant H3 or H3A Dome Cameras','H3-DOP-CLEAR','Replacement clear transparent cover; includes dome bubble and camera cover for outdoor and pendant domes.','',''),(417,6,16,106,'Replacement Clear Dome Cover for H3 In-Ceiling Microdome; Grey Trim','H3-MC-CLER1','Replacement clear transparent cover; includes dome bubble and gray trim for in-ceiling microdomes.','',''),(418,6,16,106,'Replacement Clear Dome Cover for H3 In-Ceiling Microdome; Black Trim','H3-MC-CLER1-BL','Replacement clear transparent cover; includes dome bubble and black trim for in-ceiling microdomes.','',''),(419,6,16,106,'Replacement NPT Adapter','H3-MH-NPTA1','Replacement female NPT adapter for use with H3 PTZ H4 PTZ and H3 Multisensor cameras.','',''),(421,6,16,106,'Demo Port Cover for H5A / H4A Bullet Cameras','H4-BO-DEMO1','Replacement H5A; H4 HD Bullet or H4 Thermal configuration port cover with a female 1/4-20 screw mount for use with tripod head for demo purposes only. Do not use for actual installation.','',''),(422,6,16,106,'Bullet Junction Box for H5A / H4A Bullet Cameras','H4-BO-JBOX1','Junction box for the H5A Bullet; H4A HD Bullet; H4SL HD Bullet; or H4 Thermal cameras.','',''),(423,6,16,106,'Metal Ceiling Panel for H5A; H4A; H4SL Dome','H4-DC-CPNL1','Metal ceiling panel for use with H5A; H4A or H4SL-MT-DCIL1 in-ceiling dome cameras to replace or reinforce the existing ceiling tile in suspended ceiling installations.','',''),(424,6,16,106,'Avigilon Corner Mount Adapter','H4-MT-CRNR1','Corner mount adapter for use with H4A-MT-Wall1; H4-BO-JBOX1; H4SL; H4F; H4 PTZ; H4 IR PTZ and H4 Multisensor cameras.','',''),(425,6,16,106,'Avigilon Pole Mount Adapter','H4-MT-POLE1','Pole mount adapter for use with H4A-MT-Wall1; H4-BO-JBOX1; H4SL; H4F; H4 PTZ; H4 IR PTZ and H4 Multisensor cameras.','',''),(426,6,16,106,'Cable Sealing Grommet (pack of 10)','H4A-AC-GROM1','Cable sealing grommet for use with H5A/H4A dome cameras; pack of 10','',''),(427,6,16,106,'Replacement Sunshield for H5A/H4A Bullet Cameras','H4A-BO-SHLD1','Replacement sun shield for H5A bullet cameras; H4A bullet cameras and H4 Thermal Cameras.','',''),(428,6,16,106,'Replacement H5A/H4A Clear In-Ceiling Dome Cover','H4A-DC-CLER1','Replacement clear transparent cover for H5A/H4A in-ceiling dome camera. Includes dome bubble and grey camera cover.','',''),(429,6,16,106,'Replacement H5A/H4A Clear In-Ceiling Dome Cover (Black)','H4A-DC-CLER1-BL','Replacement clear transparent cover for H5A/H4A in-ceiling dome camera. Includes dome bubble and black camera cover.','',''),(430,6,16,106,'Replacement H5A/H4A Smoke In-Ceiling Dome Cover','H4A-DC-SMOK1','Replacement smoked transparent cover for H5A/H4A in-ceiling dome camera. Reduces light transmission by 50%. Not recommended for low light applications or with the integrated IR illuminator. Includes dome bubble and grey camera cover.','',''),(431,6,16,106,'Replacement H5A/H4A Smoke In-Ceiling Dome Cover (Black)','H4A-DC-SMOK1-BL','Replacement smoked transparent cover for H5A/H4A in-ceiling dome camera. Reduces light transmission by 50%. Not recommended for low light applications or with the integrated IR illuminator. Includes dome bubble and black camera cover.','',''),(432,6,16,106,'Replacement H5A/H4A Clear Indoor Dome Cover','H4A-DD-CLER1','Replacement clear transparent cover for H5A/H4A indoor dome camera. Includes dome bubble and grey camera cover.','',''),(433,6,16,106,'Replacement H5A/H4A Clear Indoor Dome Cover (Black)','H4A-DD-CLER1-BL','Replacement clear transparent cover for H5A/H4A indoor dome camera. Includes dome bubble and black camera cover.','',''),(434,6,16,106,'SidewVideo Knockout Plug H5A/H4A Indoor Dome (pack of 5)','H4A-DD-SDWL1','Replacement sidewVideo knockout plug for H5A/H4A indoor dome cameras; pack of 5','',''),(435,6,16,106,'Black SidewVideo Knockout Plug H5A/H4A Indoor Dome (pack of 5)','H4A-DD-SDWL1-BL','Replacement sidewVideo knockout plug for H5A/H4A indoor dome cameras; black; pack of 5','',''),(436,6,16,106,'Replacement H5A/H4A Smoke Indoor Dome Cover','H4A-DD-SMOK1','Replacement smoked transparent cover for H5A/H4A indoor dome camera. Reduces light transmission by 50%. Not recommended for low light applications or with the integrated IR illuminator. Includes dome bubble and grey camera cover.','',''),(437,6,16,106,'Replacement H5A/H4A Smoke Indoor Dome Cover (Black)','H4A-DD-SMOK1-BL','Replacement smoked transparent cover for H5A/H4A indoor dome camera. Reduces light transmission by 50%. Not recommended for low light applications or with the integrated IR illuminator. Includes dome bubble and black camera cover.','',''),(438,6,16,106,'Replacement H5A/H4A Clear Outdoor Dome Cover','H4A-DO-CLER1','Replacement clear transparent cover for H5A/H4A outdoor dome camera. Includes dome bubble and grey camera cover.','',''),(439,6,16,106,'Replacement H5A/H4A Smoke Outdoor Dome Cover','H4A-DO-SMOK1','Replacement smoked transparent cover for H5A/H4A outdoor dome camera. Reduces light transmission by 50%. Not recommended for low light applications or with the integrated IR illuminator. Includes dome bubble and grey camera cover.','',''),(440,6,16,106,'Replacement H5A/H4A Clear Pendant Dome Cover','H4A-DP-CLER1','Replacement clear transparent cover for H5A/H4A pendant dome camera. Includes dome bubble and grey camera cover.','',''),(441,6,16,106,'Replacement H5A/H4A Smoke Pendant Dome Cover','H4A-DP-SMOK1','Replacement smoked transparent cover for H5A/H4A pendant dome camera. Reduces light transmission by 50%. Not recommended for low light applications or with the integrated IR illuminator. Includes dome bubble and grey camera cover.','',''),(442,6,16,106,'NPT Adapter H5A/H4A Pendant Dome Cameras','H4A-MT-NPTA1','NPT adapter for use with H5A/H4A pendant dome cameras','',''),(443,6,16,106,'Wall Mount for H5A/H4A Pendant Dome Cameras','H4A-MT-WALL1','Wall mount bracket for use with H5A/H4A pendant dome cameras','',''),(444,6,16,106,'H4A Camera 1 Year Extended Warranty','H4A-WARR-EXTEND-1YR','Extended Warranty for H4A box; dome and bullet cameras; 1 year extension','',''),(445,6,16,106,'H4A Camera 2 Years Extended Warranty','H4A-WARR-EXTEND-2YR','Extended Warranty for H4A box; dome and bullet cameras; 2 years extension','',''),(446,6,16,106,'H4A ES Camera 1 Year Extended Warranty','H4AES-WARR-EXTEND-1YR','Extended Warranty for H4A ES box; dome and bullet cameras; 1 year extension','',''),(447,6,16,106,'H4A ES Camera 2 Years Extended Warranty','H4AES-WARR-EXTEND-2YR','Extended Warranty for H4A ES box; dome and bullet cameras; 2 years extension','',''),(448,6,16,106,'Replacement Cabling Accessories for H4 Multisensor','H4AMH-ACCS-CABL1','Replacement cabling accessory kit for H4 Multisensor with audio; external power and I/O pigtail cable connector; RJ45 CAT5E plugs and RJ45 connector water proof gland.','',''),(449,6,16,106,'In-Ceiling Adapter for H4 Multisensor','H4AMH-AD-CEIL1','In-ceiling adapter; must order either a H4AMH-DC-COVR1 or H4AMH-DC-COVR1-SMOKE.','',''),(450,6,16,106,'Outdoor Surface Mount Adapter for H4 Multisensor','H4AMH-AD-DOME1','Outdoor surface mount adapter; must order either a H4AMH-DO-COVR1 or H4AMH-DO-COVR1-SMOKE.','',''),(451,6,16,106,'IR Illuminator Ring for H4 Multisensor','H4AMH-AD-IRIL1','Optional IR illuminator ring; up to 30m (100ft); for use with H4AMH-DO-COVR1.','',''),(452,6,16,106,'Pendant Mount Adapter for H4 Multisensor','H4AMH-AD-PEND1','Outdoor pendant mount adapter; must order one of IRPTZ-MNT-Wall1 or IRPTZ-MNT-NPTA1 and one of H4AMH-DO-COVR1 or H4AMH-DO-COVR1-SMOKE.','',''),(453,6,16,106,'In-Ceiling Dome Cover for H4 Multisensor','H4AMH-DC-COVR1','In-Ceiling Dome Cover for H4 Multisensor','',''),(454,6,16,106,'In-Ceiling Smoke Dome Cover for H4 Multisensor','H4AMH-DC-COVR1-SMOKE','In-Ceiling Smoke Dome Cover for H4 Multisensor','',''),(455,6,16,106,'Drop Ceiling Metal Panel for H4 Multisensor','H4AMH-DC-CPNL1','Drop Ceiling Metal Panel for H4 Multisensor','',''),(456,6,16,106,'Outdoor Dome Cover for H4 Multisensor','H4AMH-DO-COVR1','Outdoor Dome Cover for H4 Multisensor','',''),(457,6,16,106,'Outdoor Smoke Dome Cover for H4 Multisensor','H4AMH-DO-COVR1-SMOKE','Outdoor Smoke Dome Cover for H4 Multisensor','',''),(458,6,16,106,'H4 Multisensor 1 Year Extended Warranty','H4AMH-WARR-EXTEND-1YR','Extended Warranty for H4 Multisensor camera; 1 year extension','',''),(459,6,16,106,'H4 Multisensor 2 Years Extended Warranty','H4AMH-WARR-EXTEND-2YR','Extended Warranty for H4 Multisensor camera; 2 years extensions','',''),(460,6,16,106,'Replacement Dessiccant Packs for H4 FIsheye (Pack of 5)','H4F-AC-DESI1','Replacement Dessiccant Packs for H4 FIsheye (Pack of 5)','',''),(461,6,16,106,'Replacement Installation Accessories for H4 FIsheye Cameras','H4F-ACCS-KIT1','Replacement Installation Accessories for H4 FIsheye Cameras','',''),(462,6,16,106,'Replacement Top Cover for H4 Fisheye Cameras','H4F-DO-CVER1','Replacement Top Cover for H4 Fisheye Cameras','',''),(463,6,16,106,'NPT Adapter for H4 Fisheye Cameras','H4F-MT-NPTA1','NPT Adapter for H4 Fisheye Cameras','',''),(464,6,16,106,'H4 Fisheye Camera 1 Year Extended Warranty','H4F-WARR-EXTEND-1YR','Extended Warranty for H4 Fisheye cameras; 1 year extension','',''),(465,6,16,106,'H4 Fisheye Camera 2 Years Extended Warranty','H4F-WARR-EXTEND-2YR','Extended Warranty for H4 Fisheye cameras; 2 years extension','',''),(466,6,16,106,'H4 IR PTZ 1 Year Extended Warranty','H4IRPTZ-WARR-EXTEND-1YR','Extended Warranty for H4 IR PTZ cameras; non-moving parts only; 1 year extension','',''),(467,6,16,106,'H4 IR PTZ 2 Years Extended Warranty','H4IRPTZ-WARR-EXTEND-2YR','Extended Warranty for H4 IR PTZ cameras; non-moving parts only; 2 years extension','',''),(468,6,16,106,'H4 LPC 1 Year Extended Warranty','H4LPC-WARR-EXTEND-1YR','Extended Warranty for H4 LPC camera only; 1 year extension','',''),(469,6,16,106,'H4 LPC 2 Year Extended Warranty','H4LPC-WARR-EXTEND-2YR','Extended Warranty for H4 LPC camera only; 2 years extension','',''),(470,6,16,106,'H4M Black Replacement Bezel; pack of 5','H4M-BZL1-BL','Black surface mount bezel for H4M dome cameras; package of 5','',''),(471,6,16,106,'H4M Grey Replacement Bezel; pack of 5','H4M-BZL1-GRY','Grey surface mount bezel for H4M dome cameras; package of 5.','',''),(472,6,16,106,'H4M Grey In-Ceiling Adapter','H4M-MT-DCIL1','In-Ceiling mount for H4M dome cameras','',''),(473,6,16,106,'H4M Black In-Ceiling Adapter','H4M-MT-DCIL1-BL','In-Ceiling mount for H4M dome cameras; Black','',''),(474,6,16,106,'H4M Replacement Wall Plate; pack of 5','H4M-MT-DSPL','Package of 5 Video plates for H4M dome cameras','',''),(475,6,16,106,'H4M Grey Pendant Adapter','H4M-MT-NPTA1','Pendant mount for H4M dome cameras','',''),(476,6,16,106,'H4M Black Pendant Adapter','H4M-MT-NPTA1-BL','Pendant mount for H4M dome cameras; Black','',''),(477,6,16,106,'H4 Mini Dome 1 Year Extended Warranty','H4M-WARR-EXTEND-1YR','Extended Warranty for H4 Mini Dome cameras; 1 year extension','',''),(478,6,16,106,'H4 Mini Dome PTZ 2 Years Extended Warranty','H4M-WARR-EXTEND-2YR','Extended Warranty for H4 Mini Dome cameras; 2 years extension','',''),(479,6,16,106,'H4 Pro 1 Years Extended Warranty','H4PRO-WARR-EXTEND-1YR','Extended Warranty for H4 Pro camera; 1 year extension','',''),(480,6,16,106,'H4 Pro 2 Year Extended Warranty','H4PRO-WARR-EXTEND-2YR','Extended Warranty for H4 Pro camera; 2 years extension','',''),(481,6,16,106,'H4 PTZ 1 Year Extended Warranty','H4PTZ-WARR-EXTEND-1YR','Extended Warranty for H4 PTZ cameras; non-moving parts only; 1 year extension','',''),(482,6,16,106,'H4 PTZ 2 Years Extended Warranty','H4PTZ-WARR-EXTEND-2YR','Extended Warranty for H4 PTZ cameras; non-moving parts only; 2 years extension','',''),(483,6,16,106,'Side Conduit Cover; H5SL/H4SL Dome Camera (pack of 5)','H4SL-AC-CNID1','Conduit Opening Cover; Grey; 5 pack. For H5SL or H4SL dome cameras.','',''),(484,6,16,106,'1/2\" Conduit Plate; H5SL/H4SL Dome Camera (pack of 5)\"','H4SL-AC-CNPL1','Conduit Plate; Grey for 1/2\" 5 pack. For H5SL or H4SL dome cameras.\"','',''),(485,6,16,106,'3/4\" Conduit Plate; H5SL/H4SL Dome Cameras (pack of 5)\"','H4SL-AC-CNPL2','Conduit Plate; Grey for 3/4\" 5 pack. For H5SL or H4SL dome cameras.\"','',''),(486,6,16,106,'Conduit Cover Grey; H5SL/H4SL Dome Camera (Pack of 5)','H4SL-AC-COND1','Conduit Cover; Grey; 5 pack. For H5SL or H4SL dome cameras.','',''),(487,6,16,106,'Grommet Cable Seal; H5SL/H4SL Dome Camera (pack of 10)','H4SL-AC-GROM1','Rubber grommet cable seal; 10 pack. For H5SL or H4SL dome cameras.','',''),(488,6,16,106,'Replacement Sunshield of H5SL/H4SL Bullet Cameras','H4SL-BO-SHLD1','Replacement Sunshield of H5SL/H4SL Bullet Cameras','',''),(489,6,16,106,'Replacement H5SL/H4SL Indoor Mount Adapter','H4SL-D1-BASE','Replacement H5SL or H4SL indoor dome surface mount adapter','',''),(490,6,16,106,'Replacement Clear Dome Cover for H5SL/H4SL Outdoor Dome Camera','H4SL-DD-CLER1','Replacement clear transparent cover for H5SL or H4SL outdoor dome camera. Includes dome bubble and grey camera cover.','',''),(491,6,16,106,'Replacement Clear Smoke Cover for H5SL/H4SL Outdoor Dome Camera','H4SL-DD-SMOK1','Replacement smoked transparent cover for H5SL or H4SL outdor dome camera. Reduces light transmission by 50%. Not recommended for low light applications where the integrated IR illuminator is used. Includes dome bubble and grey camera cover.','',''),(492,6,16,106,'Replacement Clear Dome Cover for H5SL/H4SL Indoor Dome Camera','H4SL-DI-CLER1','Replacement clear transparent cover for H5SL or H4SL indoor dome camera. Includes dome bubble and grey camera cover.','',''),(493,6,16,106,'Replacement Clear Smoke Cover for H5SL/H4SL Indoor Dome Camera','H4SL-DI-SMOK1','Replacement smoked transparent cover for H5SL or H4SL indoor dome camera. Reduces light transmission by 50%. Not recommended for low light applications where the integrated IR illuminator is used. Includes dome bubble and grey camera cover.','',''),(494,6,16,106,'Replacement H5SL/H4SL Dome Mounting Plate','H4SL-DO1-BASE','Replacement mounting plate for H5SL or H4SL surface mount dome cameras.','',''),(495,6,16,106,'In-Ceiling Adapter for H5SL/H4SL Dome Cameras','H4SL-MT-DCIL1','In-Ceiling Adapter for H5SL/H4SL Dome Cameras','',''),(496,6,16,106,'NPT Adapter for H5SL/H4SL Dome Cameras','H4SL-MT-NPTA1','NPT Adapter for H5SL/H4SL Dome Cameras','',''),(497,6,16,106,'H4SL Camera 1 Year Extended Warranty','H4SL-WARR-EXTEND-1YR','Extended Warranty for H4SL dome and bullet cameras; 1 year extension','',''),(498,6,16,106,'H4SL Camera 2 Years Extended Warranty','H4SL-WARR-EXTEND-2YR','Extended Warranty for H4SL dome and bullet cameras; 2 years extension','',''),(499,6,16,106,'Safety Relay for H4 Video Intercom','H4VI-AC-RELY1','Safety Relay for H4 Video Intercom','',''),(500,6,16,106,'Replacement installation accessories for H4 Video Intercom','H4VI-ACCS-KIT1','Replacement installation accessories for H4VI. Includes terminal block plugs and screws.','',''),(501,6,16,106,'Surface mount adapter for H4 Video Intercom','H4VI-MT-SURF1','Surface mount adapter for H4 Video Intercom','',''),(502,6,16,106,'Replacement dome cover for H4VI camera; package of 5','H4VI-RO-CVER1','Replacement dome cover for H4VI camera; package of 5','',''),(503,6,16,106,'H4 Video Intercom 1 Year Extended Warranty','H4VI-WARR-EXTEND-1YR','Extended Warranty for H4 Video Intercom; 1 year extension','',''),(504,6,16,106,'H4 Video Intercom 2 Years Extended Warranty','H4VI-WARR-EXTEND-2YR','Extended Warranty for H4 Video Intercom; 2 years extension','',''),(505,6,16,106,'Replacement Accessory Kit for H5A Fisheye In-ceiling Camera','H5A-FE-ACC-DC-KIT1','Replacement installation accessories for H5A Fisheye In-ceiling Camera. Includes star-shaped screwdriver; power terminal block; rubber grommets and RJ45 grommet piercing cap.','',''),(506,6,16,106,'Replacement Accessory Kit for H5A Fisheye Dome Camera','H5A-FE-ACC-KIT1','Replacement installation accessories for H5A Fisheye Dome Camera. Includes star-shaped screwdriver; power terminal block; rubber grommets; RJ45 grommet piercing cap; conduit shroud and screws','',''),(507,6,16,106,'Metal Ceiling Panel for H5A Fisheye In-Ceiling Camera','H5A-FE-DC-CPNL1','Metal ceiling panel for use with H5A Fisheye in-ceiling cameras to replace or reinforce the existing ceiling tile in suspended ceiling installations.','',''),(508,6,16,106,'Replacement Dome Bubble for H5A Fisheye Dome Camera','H5A-FE-DD-CLER1','Package of 3 replacement dome bubble for H5A Fisheye Dome Camera.','',''),(509,6,16,106,'NPT Adapter For H5A Fisheye Dome Camera','H5A-FE-MT-NPTA1','NPT Adapter For H5A Fisheye Dome Camera (H5A-FE-DO)','',''),(510,6,16,106,'2 year extended warranty for H5 Explosion Protected Bullet Camera','H5AEX-BO-WARR-EXTEND-2YR','2 year extended warranty for H5 Explosion Protected Bullet camera. Must be purchased at the same time as the camera.','',''),(511,6,16,106,'2 year extended warranty for H5 Explosion Protected Compact Bullet Camera','H5AEX-CO-WARR-EXTEND-2YR','2 year extended warranty for H5 Explosion Protected Compact Bullet camera. Must be purchased at the same time as the camera.','',''),(512,6,16,106,'2 year extended warranty for H5 Explosion Protected PTZ Camera','H5AEX-PTZ-WARR-EXTEND-2YR','2 year extended warranty for H5 Explosion Protected PTZ camera. Must be purchased at the same time as the camera.','',''),(513,6,16,106,'Replacement Dome Cover for H5A Dual Head Camera','H5DH-DI-CLER1','Replacement Dome Cover for H5A Dual Head Camera','',''),(514,6,16,106,'Junction Box for H5A Dual Head Camera','H5DH-DO-JBOX1','Junction box with side cable entry for H5A Dual Head camera.','',''),(515,6,16,106,'Pendant Adapter for H5A Dual Head Camera','H5DH-MT-NPTA1','Pendant adapter for the H5A Dual Head camera.  Also compatible with an optional wall arm; CM-MT-WALL1.','',''),(516,6,16,106,'Package of 4 shroud replacement parts for H5M dome cameras','H5M-DO-BZL1','Package of 4 shroud replacement parts for H5M dome cameras','',''),(517,6,16,106,'In-ceiling mount adapter for H5M dome cameras','H5M-MT-DCIL1','In-ceiling mount adapter for H5M dome cameras','',''),(518,6,16,106,'H5A PTZ Cable Gland Nut Kit; Pack of 10','H5PTZ-ACCS-CABL1','H5A PTZ cable gland nut kit. Pack of 10.','',''),(519,6,16,106,'HALO-SMADAPT','HALO-SMADAPT','Surface Mount Adapter for HALO IoT Smart Sensor','',''),(520,6,16,106,'HALO-V2.00','HALO-V2.00','HALO IoT Smart Sensor','',''),(521,6,16,106,'Replacement Power Supply for JPEG2000 LPR Kits','HD-LP-PS-A','Replacement Power Supply for JPEG2000 LPR Kits','',''),(522,6,16,106,'Metal In-Ceiling Metal Panel for Use With DOME-IND-CEL','IND-CEL-PNL','Metal ceiling panel for use with the DOME-IND-CEL to replace or reinforce the existing ceiling tile in suspended ceiling installations.','',''),(523,6,16,106,'H4 IRPTZ Replacement Power and I/O Cables','IRPTZ-ACCS-CABL1','H4 IRPTZ Replacement Power and I/O Cables','',''),(524,6,16,106,'Replacement NPT Pendant Cap for H4 IRPTZ or H4 Multisensor','IRPTZ-MNT-NPTA1','Pedant NPT adapter. For use with H4 IR PTZ or H4A-MH-AD-PEND1 on H4 Multisensor.','',''),(525,6,16,106,'Wall Arm for H4 IRPTZ or H4 Multisensor','IRPTZ-MNT-WALL1','Pedant wVideo mount adapter. For use with H4 IR PTZ or H4A-MH-AD-PEND1 on H4 Multisensor.','',''),(526,6,16,106,'Canon 100-400mm f/4.5-f/5.6 for Video H4 Pro Cameras','LEF10040045CA2','Canon 100-400mm f/4.5-f/5.6 Lens. Compatible with Video H4 Pro Cameras.','',''),(527,6,16,106,'Tamron 150-600mm f/5-6.3 VC G2 Lens for Pro Cameras','LEF1506005TA','Tamron 150-600mm f/5-6.3 VC G2 Lens for Pro Camera','',''),(528,6,16,106,'Canon 16-35mm f/2.8 Lens for Pro Cameras','LEF163528CA2','Canon 16-35mm f/2.8 Lens for Pro Cameras','',''),(529,6,16,106,'Canon 200mm f/2.8 Lens for H4 Pro Cameras','LEF20028CA','Canon 200mm f/2.8 lens. Compatible with Video H4 Pro cameras.','',''),(530,6,16,106,'Canon 24mm f/1.4 Lens for H4 Pro Cameras','LEF2414CA','Canon 24mm f/1.4 lens. Compatible with Video H4 Pro cameras.','',''),(531,6,16,106,'Tamron 24-70mm f/2.8 VC Lens for Pro Cameras','LEF247028TA2','Tamron 24-70mm f/2.8 VC Lens for Pro Cameras','',''),(532,6,16,106,'Sigma 28mm f/1.4 Lens for Pro Cameras','LEF2814SI','Sigma 28mm f/1.4 Lens for Pro Cameras','',''),(533,6,16,106,'Sigma 35mm f/1.4 Lens for H4 Pro Cameras','LEF3514SI','Sigma 35mm f/1.4 lens. Compatible with Video H4 Pro cameras.','',''),(534,6,16,106,'Tamron 35mm f/1.4 Lens for Pro Cameras','LEF3514TA','Tamron 35mm f/1.4 Lens for Pro Cameras','',''),(535,6,16,106,'Canon 40mm f/2.8 Lens for Pro Cameras','LEF4028CA','Canon 40mm f/2.8 Lens for Pro Cameras','',''),(536,6,16,106,'Canon 50mm f/1.2 Lens for H4 Pro Cameras','LEF5012CA','Canon 50mm f/1.2 lens. Compatible with Video H4 Pro cameras.','',''),(537,6,16,106,'Canon 50mm f/1.4 Lens for H4 Pro Cameras','LEF5014CA','Canon 50mm f/1.4 lens. Compatible with Video H4 Pro cameras.','',''),(538,6,16,106,'Sigma 50mm f/1.4 Lens for Pro Cameras','LEF5014SI','Sigma 50mm f/1.4 Lens for Pro Cameras','',''),(539,6,16,106,'Canon 50mm f/1.8 Lens for H4 Pro Cameras','LEF5018CA2','Canon 50mm f/1.8 lens. Compatible with Video H4 Pro cameras.','',''),(540,6,16,106,'Canon 70-200mm f/2.8 Lens for Video H4 Pro Cameras','LEF7020028CA','Canon 70-200mm f/2.8 Lens. Compatible with Video H4 Pro Cameras.','',''),(541,6,16,106,'Tamron 70-200mm f/2.8 VC G2 Lens for Pro Cameras','LEF7020028TA','Tamron 70-200mm f/2.8 VC G2 Lens for Pro Cameras','',''),(542,6,16,106,'Canon 70-300mm f/4-f/5.6 Lens for Video H4 Pro Cameras','LEF7030040CA','Canon 70-300mm f/4-f/5.6 Lens. Compatible with Video H4 Pro Cameras.','',''),(543,6,16,106,'Canon 85mm f/1.2 Lens for H4 Pro Cameras','LEF8512CA','Canon 50mm f/1.8 lens. Compatible with Video H4 Pro cameras.','',''),(544,6,16,106,'Canon 85mm f/1.8 Lens for H4 Pro Cameras','LEF8518CA','Canon 85mm f/1.8 lens. Compatible with Video H4 Pro cameras.','',''),(545,6,16,106,'Tamron 90mm f/2.8 VC Lens for Pro Cameras','LEF9028TA','Tamron 90mm f/2.8 VC Lens for Pro Cameras','',''),(546,6,16,106,'Sigma 18-35mm f/1.8 Lens for Pro Cameras','LEFS183518SI','Sigma 18-35mm f/1.8 Lens for Pro Cameras. The lens is only compatible with 8-16MP H4 Pro cameras or 8-26MP H5 Pro cameras.','',''),(547,6,16,106,'Sigma 30mm f/1.4 Lens for Pro Cameras','LEFS3014SI','Sigma 30mm f/1.4 Lens for Pro Cameras. The lens is only compatible with 8-16MP H4 Pro cameras or 8-26MP H5 Pro cameras.','',''),(548,6,16,106,'Corner Mount Adapter for MNT-PEND-Wall or H3 Bullet Cameras','MNT-AD-CORNER','Corner mount adapter for use with MNT-PEND-Wall; H3-BO-JB or HD Bullet Camera','',''),(549,6,16,106,'Pole Mount Adapter for MNT-PEND-Wall or H3 Bullet Cameras','MNT-AD-POLE-B','Pole mount adapter for use with MNT-PEND-Wall; H3-BO-JB or HD Bullet Camera','',''),(550,6,16,106,'Wall Bracket for H3 PTZ or H3 Pendant Dome Cameras','MNT-PEND-WALL','Compact wVideo bracket for use with H3PTZ-DP and H3-DP Pendant Dome Cameras','',''),(551,6,16,106,'H5A PTZ Replacement Clear Bubble Assembly','PTZH5A-CLER1','H5A PTZ Replacement Clear Bubble Assembly','',''),(552,6,16,106,'H5A PTZ Replacement Smoked Bubble Assembly','PTZH5A-SMOK1','H5A PTZ Replacement Smoked Bubble Assembly','',''),(553,6,16,106,'Replacement Cable Accessories and Adapter for H4 PTZ','PTZMH-ACCS-CABL1','Replacement cable accessory and adapter kit for H4 PTZ and HD Multisensor (H3-xMH) pendant mount cameras. Includes waterproof RJ45 connector; M8 2-pin male cable and M12 12-pin female cable.','',''),(554,6,16,106,'Clear In-Ceiling Dome Cover for H4 PTZ','PTZMH-DC-CLER1','In-ceiling replacement clear transparent cover; includes dome bubble and camera cover for H4 PTZ and HD Multisensor (H3-xMH) pendant cameras.','',''),(555,6,16,106,'Metal Ceiling Panel for H4 PTZ','PTZMH-DC-CPNL1','Metal Ceiling panel for H4 PTZ and HD Multisensor cameras.','',''),(556,6,16,106,'Dome In-Ceiling Dome Cover for H4 PTZ','PTZMH-DC-SMOK1','Replacement smoked transparent cover; includes dome bubble and camera cover H4 PTZ and HD Multisensor (H3-xMH) In-Ceiling cameras. Reduces light transmission by 50% compared to the standard clear cover. Not recommended for low light applications.','',''),(557,6,16,106,'Clear Pendant Dome Cover for H4 PTZ','PTZMH-DP-CLER1','IK10 replacement clear transparent cover; includes dome bubble and camera cover for H4 PTZ and HD Multisensor (H3-xMH) pendant cameras.','',''),(559,6,16,106,'Replacement Male NPT Adapter for H4 PTZ','PTZMH-MT-NPTA1','Replacement male NPT adapter for use with H4 PTZ or HD Multisensor (H3-xMH) cameras.','',''),(560,6,16,106,'Refurbished; Canon 200mm f/2.8L Lens','RLEF20028CA','Refurbished Canon 200mm f/2.8 L lens. Lens may be missing original packaging and documentation.  Lens may also contain cosmetic scratches which will not impair its functionality.  Available in limited quantities.','',''),(561,6,16,106,'Refurbished; Canon 70-200mm f/2.8L Lens','RLEF7020028CA','Refurbished Canon 70-200mm f/2.8 L lens. Lens may be missing original packaging and documentation.  Lens may also contain cosmetic scratches which will not impair its functionality.  Available in limited quantities.','',''),(562,6,16,131,'Spare Hard Drive; 2TB','AINVR-HDDS-HOT-2TB','Spare Hard Drive for AINVR-VAL-6TB','',''),(563,6,16,131,'Spare Hard Drive; 4TB','AINVR-HDDS-HOT-4TB','Spare Hard Drive for AINVR-VAL-12TB; AINVR-STD-24TB','',''),(564,6,16,131,'Spare Hard Drive; 8TB','AINVR-HDDS-HOT-8TB','Spare Hard Drive for AINVR-STD-32TB; AINVR-STD-48TB','',''),(565,6,16,131,'Power Supply for AI NVR Standard; AU','AINVR-STD-2NDPS-AU','Secondary Power Supply for AI NVR Standard; AU','',''),(566,6,16,131,'Power Supply for AI NVR Standard; EU','AINVR-STD-2NDPS-EU','Secondary Power Supply for AI NVR Standard; EU','',''),(567,6,16,131,'Power Supply for AI NVR Standard; NA','AINVR-STD-2NDPS-NA','Secondary Power Supply for AI NVR Standard; NA','',''),(568,6,16,131,'Power Supply for AI NVR Standard; UK','AINVR-STD-2NDPS-UK','Secondary Power Supply for AI NVR Standard; UK','',''),(569,6,16,131,'AI NVR Standard Performance Kit','AINVR-STD-PRK','With the performance kit installed AI NVR Standard can support up to 25 Classified Object Detection channels.','',''),(570,6,16,131,'Power Supply for AI NVR Value; AU','AINVR-VAL-2NDPS-AU','Secondary Power Supply for AI NVR Value; AU','',''),(571,6,16,131,'Power Supply for AI NVR Value; EU','AINVR-VAL-2NDPS-EU','Secondary Power Supply for AI NVR Value; EU','',''),(572,6,16,131,'Power Supply for AI NVR Value; NA','AINVR-VAL-2NDPS-NA','Secondary Power Supply for AI NVR Value; NA','',''),(573,6,16,131,'Power Supply for AI NVR Value; UK','AINVR-VAL-2NDPS-UK','Secondary Power Supply for AI NVR Value; UK','',''),(574,6,16,131,'AVA Connectivity Kit; 64/96/128/157TB PRM Models','AVA-HED1-NVR4X-PRM1-CONNECT','AVA Connectivity Kit; 64/96/128/157TB PRM Models','',''),(575,6,16,131,'AVA Connectivity Kit 192TB and 217TB PRM Models','AVA-HED1-NVR4X-PRM2-CONNECT','AVA Connectivity Kit 192TB and 217TB PRM Models','',''),(576,6,16,131,'AVA Connectivity Kit for STD Models','AVA-HED1-NVR4X-STD-CONNECT','AVA Connectivity Kit for STD Models','',''),(577,6,16,131,'Din Mount Power Supply for ES 8-Port Rugged Appliance','DINPS-240W-RPA-RGD-8P','Din Mount Power Supply for ES 8-Port Rugged Appliance; 24VDC; 240W','',''),(578,6,16,131,'Anlytics Kit for NVR4 Value or any NVR3 models','HD-NVR-ANK2-1','Analytics Kit for Appearance Search and Face Recognition; NVR4 Value or any NVR3 models','',''),(579,6,16,131,'Windows 10 Upgrade for NVR2','HD-NVR2-W10UPG','Windows 7 to Windows 10 Upgrade for NVR2','',''),(580,6,16,131,'2nd CPU Kit for NVR3 Premium','HD-NVR3-PRM-2NDCPU','2nd CPU + Heatsink + 2x 8GB RAM; NVR3 Premium','',''),(581,6,16,131,'Power Supply for NVR3 Premium; AU','HD-NVR3-PRM-2NDPS-AU','Power Supply for NVR3 Premium with an Australian power cord; 750W','',''),(582,6,16,131,'Power Supply for NVR3 Premium; NA','HD-NVR3-PRM-2NDPS-NA','Power Supply for NVR3 Premium with an North American power cord; 750W','',''),(583,6,16,131,'Power Supply for NVR3 Premium; UK','HD-NVR3-PRM-2NDPS-UK','Power Supply for NVR3 Premium with an United Kingdom power cord; 750W','',''),(584,6,16,131,'SFP+ 10GbE Transceiver at each end of Twinax Direct Attach Copper Cable; 3m','HD-NVR3-SFPPLUS-DA','SFP+ 10GbE Transceiver at each end of Twinax Direct Attach Copper Cable; 3m','',''),(585,6,16,131,'SFP+ 10GBASE-SR Optical Transceiver (single)','HD-NVR3-SFPPLUS-SR','SFP+ 10GBASE-SR Optical Transceiver (single)','',''),(586,6,16,131,'10GbE Network Card for NVR3 Standard','HD-NVR3-STD-10GBE','NETWORK CARD; DP 10G-SFP+; NVR3 Standard','',''),(587,6,16,131,'2nd CPU Kit for NVR3 Standard','HD-NVR3-STD-2NDCPU','2nd CPU + Heatsink + 2x 8GB RAM; NVR3 Standard','',''),(588,6,16,131,'Power Supply for NVR3 Standard; AU','HD-NVR3-STD-2NDPS-AU','Power Supply for NVR3 Standard with an Australian power cord; 750W','',''),(589,6,16,131,'Power Supply for NVR3 Standard; NA','HD-NVR3-STD-2NDPS-NA','Power Supply for NVR3 Standard with an North American power cord; 750W','',''),(590,6,16,131,'Power Supply for NVR3 Standard; UK','HD-NVR3-STD-2NDPS-UK','Power Supply for NVR3 Standard with an United Kingdom power cord; 750W','',''),(591,6,16,131,'Power Supply for NVR3 Value; AU','HD-NVR3-VAL-2NDPS-AU','Power Supply for NVR3 Value with an Australian power cord; 350W','',''),(592,6,16,131,'Power Supply for NVR3 Value; NA','HD-NVR3-VAL-2NDPS-NA','Power Supply for NVR3 Value with an North American power cord; 350W','',''),(593,6,16,131,'Power Supply for NVR3 Value; UK','HD-NVR3-VAL-2NDPS-UK','Power Supply for NVR3 Value with an United Kingdom power cord; 350W','',''),(594,6,16,131,'Windows 10 Upgrade for NVR3/RMWS3/NVRWS3','HD-NVR3-W10UPG','USB Windows 10 Upgrade for NVR3-STD; NVR3-VAL; RMWS3; and NVRWS3','',''),(595,6,16,131,'Network Card; DP 10G-SFP+; NVR4 Premium','HD-NVR4-PRM-10GBE','Network Card; DP 10G-SFP+; NVR4 Premium','',''),(596,6,16,131,'2nd CPU Kit for NVR4 Premium','HD-NVR4-PRM-2NDCPU','2nd CPU + Heatsink + 2x 16GB RAM; NVR4 Premium','',''),(597,6,16,131,'Power Supply for NVR4 Premium; AU','HD-NVR4-PRM-2NDPS-AU','Power Supply for NVR4 Premium with an Australian power cord; 1100W','',''),(598,6,16,131,'Power Supply for NVR4 Premium; NA','HD-NVR4-PRM-2NDPS-NA','Power Supply for NVR4 Premium with an North American power cord; 1100W','',''),(599,6,16,131,'Power Supply for NVR4 Premium; UK','HD-NVR4-PRM-2NDPS-UK','Power Supply for NVR4 Premium with an United Kingdom power cord; 1100W','',''),(600,6,16,131,'SFP+ 10GbE Transceiver at each end of Twinax Direct Attach Copper Cable; 3m','HD-NVR4-SFPPLUS-DA','SFP+ 10GbE Transceiver at each end of Twinax Direct Attach Copper Cable; 3m','',''),(601,6,16,131,'SFP+ 10GBASE-SR Optical Transceiver (single)','HD-NVR4-SFPPLUS-SR','SFP+ 10GBASE-SR Optical Transceiver (single)','',''),(602,6,16,131,'10GbE Network Card for NVR4 Standard','HD-NVR4-STD-10GBE','Network Card; DP 10G-SFP+; NVR4 Standard','',''),(603,6,16,131,'2nd CPU Kit for NVR4 Standard','HD-NVR4-STD-2NDCPU','2nd CPU + Heatsink + 2x 8GB RAM; NVR4 Standard','',''),(604,6,16,131,'Power Supply for NVR4 Standard; AU','HD-NVR4-STD-2NDPS-AU','Power Supply for NVR4 Standard with an Australian power cord; 750W','',''),(605,6,16,131,'Power Supply for NVR4 Standard; NA','HD-NVR4-STD-2NDPS-NA','Power Supply for NVR4 Standard with an North American power cord; 750W','',''),(606,6,16,131,'Power Supply for NVR4 Standard; UK','HD-NVR4-STD-2NDPS-UK','Power Supply for NVR4 Standard with an United Kingdom power cord; 750W','',''),(607,6,16,131,'IDRAC 8 Enterprise Upgrade for NVR3 Models','IDRAC8-ENT-UPG','IDRAC 8 Enterprise Upgrade for NVR3 Models','',''),(608,6,16,131,'IDRAC 9 Enterprise Upgrade for AI NVR; NVR4X; or AIA','IDRAC9-ENT-UPG','IDRAC 9 Enterprise Upgrade for AI NVR; NVR4X; or AIA','',''),(609,6,16,131,'Spare Hard Drive; 10TB; Front/Rear Bay; NLSAS','NVR3-HDDN-HOT-10TB','Spare Hard Drive; 10TB; Front/Rear Bay; NLSAS compatible with NVR3-PRM-137TB','',''),(610,6,16,131,'Spare Hard Drive; 4TB; Front/Rear Bay; NLSAS','NVR3-HDDN-HOT-4TB','Spare Hard Drive; 4TB; Front/Rear Bay; NLSAS compatible with NVR3-STD-24TB','',''),(611,6,16,131,'Spare Hard Drive; 10TB; Internal Bay; NLSAS','NVR3-HDDN-INT-10TB','Spare Hard Drive; 10TB; Internal Bay; NLSAS compatible with NVR3-PRM-137TB','',''),(612,6,16,131,'Spare Hard Drive; 2TB; Front/Rear Bay; SATA','NVR3-HDDS-HOT-2TB','Spare Hard Drive; 2TB; Front/Rear Bay; SATA compatible with NVR3-VAL-6TB; Gen 2','',''),(613,6,16,131,'Spare Hard Drive; 4TB; Front/Rear Bay; NLSAS','NVR4-HDDN-HOT-4TB','Spare Hard Drive; 4TB; Front/Rear Bay; NLSAS compatible with NVR4-PRM-64TB','',''),(614,6,16,131,'Spare Hard Drive; 10TB; Internal Bay; NLSAS','NVR4-HDDN-INT-10TB','Spare Hard Drive; 10TB; Internal Bay; NLSAS compatible with NVR4-PRM-157TB','',''),(615,6,16,131,'Spare Hard Drive; 4TB; Internal Bay; NLSAS','NVR4-HDDN-INT-4TB','Spare Hard Drive; 4TB; Internal Bay; NLSAS compatible with NVR4-PRM-64TB','',''),(616,6,16,131,'Spare Hard Drive; 8TB; Internal Bay; NLSAS','NVR4-HDDN-INT-8TB','Spare Hard Drive; 8TB; Internal Bay; NLSAS compatible with NVR4-PRM-128TB; NVR4-PRM-96TB','',''),(617,6,16,131,'HARD DRIVE; 12TB; front or rear bay; Ext; Caddy','NVR4-HDDS-HOT-12TB','HARD DRIVE; 12TB; Ext; Caddy','',''),(618,6,16,131,'HARD DRIVE; 16TB; front or rear bay; Ext; Caddy','NVR4-HDDS-HOT-16TB','HARD DRIVE; 16TB; Ext; Caddy','',''),(619,6,16,131,'Spare Hard Drive; 2TB; Front/Rear Bay; SATA','NVR4-HDDS-HOT-2TB','Spare Hard Drive; 2TB; Front/Rear Bay; SATA compatible with NVR4-VAL-6TB','',''),(620,6,16,131,'Spare Hard Drive; 4TB; Front/Rear Bay; SATA','NVR4-HDDS-HOT-4TB','Spare Hard Drive; 4TB; Front/Rear Bay; SATA compatible with NVR4-STD-24TB; NVR4-STD-16TB; NVR4-VAL-12TB','',''),(621,6,16,131,'Spare Hard Drive; 8TB; Front/Rear Bay; SATA','NVR4-HDDS-HOT-8TB','Spare Hard Drive; 8TB; Front/Rear Bay; SATA compatible with NVR4-STD-48TB; NVR4-STD-32TB; NVR4-VAL-24TB; NVR4-VAL-16TB','',''),(622,6,16,131,'HARD DRIVE; 16TB; Internal Bay','NVR4-HDDS-INT-16TB','HARD DRIVE; 16TB; Int','',''),(623,6,16,131,'Storage Expansion Pack; 16TB','NVR4-HDDS-PACK-16TB','Storage Expansion Pack to add 16TB of effective storage to NVR4-STD-32TB or NVR4-STD-16TB','',''),(624,6,16,131,'Storage Expansion Pack; 32TB','NVR4-HDDS-PACK-32TB','Storage Expansion Pack to add 32TB of effective storage to NVR4-STD-32TB or NVR4-STD-16TB','',''),(625,6,16,131,'Windows Server 2016 COA for NVR4-STD/NVR4X-STD','NVR4-S16-COA','Windows Server 2016 license for NVR4-STD/NVR4X-STD. Required to upgrade from Windows 10 LTSB to Windows Server 2016. Package includes the Windows 2016 COA license and activation key. The OS installation files are obtained via direct download.','',''),(627,6,16,131,'Network Card; DP 10G-SFP+; NVR4 Value','NVR4-VAL-10GBE','Network Card; DP 10G-SFP+; NVR4 Value','',''),(628,6,16,131,'Power Supply for NVR4 Value; AU','NVR4-VAL-2NDPS-AU','Power Supply for NVR4 Value with an Australian power cord; 350W','',''),(629,6,16,131,'Power Supply for NVR4 Value; EU','NVR4-VAL-2NDPS-EU','Power Supply for NVR4 Value with an European power cord; 350W','',''),(630,6,16,131,'Power Supply for NVR4 Value; NA','NVR4-VAL-2NDPS-NA','Power Supply for NVR4 Value with an North American power cord; 350W','',''),(631,6,16,131,'Power Supply for NVR4 Value; UK','NVR4-VAL-2NDPS-UK','Power Supply for NVR4 Value with an United Kingdom power cord; 350W','',''),(632,6,16,131,'PSU; Second HS; 1100W; w/ POWERCORD Australia','NVR4X-1100W-2NDPS-AU','PSU; Second HS; 1100W; w/ POWERCORD Australia','',''),(633,6,16,131,'PSU; Second HS; 1100W; w/ POWERCORD EU','NVR4X-1100W-2NDPS-EU','PSU; Second HS; 1100W; w/ POWERCORD EU','',''),(634,6,16,131,'PSU; Second HS; 1100W; w/ POWERCORD NA','NVR4X-1100W-2NDPS-NA','PSU; Second HS; 1100W; w/ POWERCORD NA','',''),(635,6,16,131,'PSU; Second HS; 1100W; w/ POWERCORD UK','NVR4X-1100W-2NDPS-UK','PSU; Second HS; 1100W; w/ POWERCORD UK','',''),(636,6,16,131,'PSU; Second HS; 750W; w/ POWERCORD Australia','NVR4X-750W-2NDPS-AU','PSU; Second HS; 750W; w/ POWERCORD Australia','',''),(637,6,16,131,'PSU; Second HS; 750W; w/ POWERCORD EU','NVR4X-750W-2NDPS-EU','PSU; Second HS; 750W; w/ POWERCORD EU','',''),(638,6,16,131,'PSU; Second HS; 750W; w/ POWERCORD NA','NVR4X-750W-2NDPS-NA','PSU; Second HS; 750W; w/ POWERCORD NA','',''),(639,6,16,131,'PSU; Second HS; 750W; w/ POWERCORD UK','NVR4X-750W-2NDPS-UK','PSU; Second HS; 750W; w/ POWERCORD UK','',''),(640,6,16,131,'2nd CPU for NVR4X PRM -- includes 2x memory modules','NVR4X-PRM-2NDCPU','2nd CPU for NVR4X PRM -- includes 2x memory modules','',''),(641,6,16,131,'SFP+ 10GBASE-SR Optical Transceiver (single) for NVR4X','NVR4X-SFPPLUS-SR','SFP+ 10GBASE-SR Optical Transceiver (single) for NVR4X','',''),(642,6,16,131,'Low Profile Network Card; DP 10G-SFP+; NVR4X STD','NVR4X-STD-10GBE','Low Profile Network Card; DP 10G-SFP+; NVR4X STD','',''),(643,6,16,131,'ACC Professional Services; on-site training','PRO-ACC-ONSITE-TRN','','',''),(644,6,16,131,'Power Supply for ES 8-Port Appliance','PS-180W-ENVR1-8P','Power Supply for ES 8-Port Appliance; 180W','',''),(645,6,16,131,'Power Supply for ES 8-Port Rugged Appliance; AU','PS-220W-RPA-RGD-8P-AU','Power Supply for ES 8-Port Rugged Appliance with an Australian power cord; 220W','',''),(646,6,16,131,'Power Supply for ES 8-Port Rugged Appliance; EU','PS-220W-RPA-RGD-8P-EU','Power Supply for ES 8-Port Rugged Appliance with an European power cord; 220W','',''),(647,6,16,131,'Power Supply for ES 8-Port Rugged Appliance; NA','PS-220W-RPA-RGD-8P-NA','Power Supply for ES 8-Port Rugged Appliance with an North American power cord; 220W','',''),(648,6,16,131,'Power Supply for ES 8-Port Rugged Appliance; UK','PS-220W-RPA-RGD-8P-UK','Power Supply for ES 8-Port Rugged Appliance with an United Kingdom power cord; 220W','',''),(649,6,16,131,'Power Supply for HDVA3 8-Port','PS-270W-AS3-8P','Power Supply for HDVA3 8-Port; 270W','',''),(650,6,16,131,'Power Supply for HDVA3 16/24-Port','PS-920W-AS3-16/24P','Power Supply for HDVA3 16/24-Port; 920W','',''),(651,6,16,131,'Mounting Rails for HDVA3 16/24-Port','RAILS-B-AS3-16/24P','Mounting Rails for HDVA3 16/24-Port','',''),(652,6,16,131,'Rack Mount Shelf for ES 8-Port Appliance','RMS1U-A-ENVR1-8P','1U Rack Mount Shelf for up to two ES 8-Port Appliance','',''),(653,6,16,131,'1U Rack mount shelf for HDVA3 8-port','RMS1U-B-AS3-8P','1U Rack mount shelf for HDVA3 8-port. Adjustable to fit 641mm to 910mm rack depth.','',''),(654,6,16,131,'Power Supply for AIA; AU','VMA-AIA-2NDPS-AU','2nd Power Supply for AI Appliance with an Australian power cord','',''),(655,6,16,131,'Power Supply for AIA; NA','VMA-AIA-2NDPS-NA','2nd Power Supply for AI Appliance with an North American power cord','',''),(656,6,16,131,'Power Supply for AIA; UK','VMA-AIA-2NDPS-UK','2nd Power Supply for AI Appliance with an United Kingdom power cord','',''),(657,6,16,131,'Power Supply for AI Appliance 2; AU','VMA-AIA2-2NDPS-AU','Secondary Power Supply for AI Appliance 2; AU','',''),(658,6,16,131,'Power Supply for AI Appliance 2; EU','VMA-AIA2-2NDPS-EU','Secondary Power Supply for AI Appliance 2; EU','',''),(659,6,16,131,'Power Supply for AI Appliance 2; NA','VMA-AIA2-2NDPS-NA','Secondary Power Supply for AI Appliance 2; NA','',''),(660,6,16,131,'Power Supply for AI Appliance 2; UK','VMA-AIA2-2NDPS-UK','Secondary Power Supply for AI Appliance 2; UK','',''),(661,6,16,131,'2 Year Warranty Extension for AIA2','VMA-AIA2-WARR-EXTEND-2YR','2 Year Warranty Extension for AI Appliance 2','',''),(662,6,16,131,'Windows 10 Upgrade for AS1','VMA-AS1-W10UPG','USB Windows 10 upgrade kit for AS1 models','',''),(663,6,16,131,'Analytics Kit for HDVA 16/24-Port','VMA-AS3-ANK','Analytics Kit for Appearance Search and Face Recognition; HDVA3 16/24-port','',''),(664,6,16,131,'Hard Drive for HDVA3; 2TB','VMA-AS3-HDD02','HDVA3 2TB Hard Drive for VMA-AS3-8P2; VMA-AS3-16P06','',''),(665,6,16,131,'Hard Drive for HDVA3; 3TB','VMA-AS3-HDD03','HDVA3 3TB Hard Drive for VMA-AS3-16P09','',''),(666,6,16,131,'Hard Drive for HDVA3; 4TB','VMA-AS3-HDD04','HDVA3 4TB Hard Drive for VMA-AS3-8P4; VMA-AS3-16P12','',''),(667,6,16,131,'Hard Drive for HDVA3; 6TB','VMA-AS3-HDD06','HDVA3 6TB Hard Drive for VMA-AS3-24P18','',''),(668,6,16,131,'Hard Drive for HDVA3; 8TB','VMA-AS3-HDD08','HDVA3 8TB Hard Drive for VMA-AS3-8P8; VMA-AS3-24P24','',''),(669,6,16,131,'Power Supply for ES HD Recorder or ES Analytics Appliance','VMA-RPX-4PPS-90','Power Supply for ES HD Recorder or ES Analytics Appliance; 90W','',''),(670,6,16,131,'Rack Mount Shelf for for ES HD Recorder or ES Analytics Appliance','VMA-RPX-4PRMS1U','1U Rack Mount Shelf for ES HD Recorder or ES Analytics Appliance','',''),(671,6,16,131,'Rack Shelf for NVR4-WKS or RM5-WKS','WKS-RACK','Rack Shelf for three NVR4-WKS or RM5-WKS; 7U','','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

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
  `site_id` int NOT NULL DEFAULT '0',
  `system_type` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `remote_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_login` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `remote_password` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_access`
--

LOCK TABLES `remote_access` WRITE;
/*!40000 ALTER TABLE `remote_access` DISABLE KEYS */;
INSERT INTO `remote_access` VALUES (2,17,'CCTV','Any Desk','asdasdad','ASDASDAD','asdasd','asdasdasd','');
/*!40000 ALTER TABLE `remote_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_notes`
--

DROP TABLE IF EXISTS `site_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT '0',
  `system_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) COLLATE utf8_bin NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`) /*!80000 INVISIBLE */,
  KEY `system_id` (`system_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_notes`
--

LOCK TABLES `site_notes` WRITE;
/*!40000 ALTER TABLE `site_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_notes` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `site_systems`
--

LOCK TABLES `site_systems` WRITE;
/*!40000 ALTER TABLE `site_systems` DISABLE KEYS */;
INSERT INTO `site_systems` VALUES (1,'CCTV'),(2,'Access'),(3,'Burglary'),(4,'Intercom'),(5,'Network'),(6,'General'),(7,'AV'),(8,'Other');
/*!40000 ALTER TABLE `site_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,5,'asdasd weweww','Sasdasd Sadad','Asd Sdasd ','QW',12345),(2,5,'rteterte','sdfgdfgsdg','sdfgdfg','rr',55555),(17,17,'dfsdff','Sdfsdf','Sdfsdf Dfsdf','DF',34456),(10,3,'eeeeeeee','wqeqwe','rtetrer','qq',32324),(11,3,'yyyyy','yyyyy','yyyyy','yy',65657),(12,17,'sdas11rewr erer','asdasd','asdasd','QQ',34343);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Created'),(2,'In Progress'),(3,'Completed');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stock_status`
--

DROP TABLE IF EXISTS `stock_status`;
/*!50001 DROP VIEW IF EXISTS `stock_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_status` AS SELECT 
 1 AS `warehouse_id`,
 1 AS `warehouse`,
 1 AS `product_id`,
 1 AS `brand`,
 1 AS `partnumber`,
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
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subs`
--

DROP TABLE IF EXISTS `subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subs`
--

LOCK TABLES `subs` WRITE;
/*!40000 ALTER TABLE `subs` DISABLE KEYS */;
INSERT INTO `subs` VALUES (6,'sdfsd','dfsdfg','sdfsd','xx',45678),(7,'sdfsdf','sdfsd','sdfsdf','aa',34567),(8,'wwwwwwww','wwwwwww','qqqqqqqqq','ss',12345),(9,'qqqqq','rrrrrrr','rrrrrrrrr','rr',44444),(16,'asddddddddd','asdasd','asdasdsadasd','sd',33333),(14,'fhjfjh','ghiygiuy','iyuoyu','yi',45668),(17,'sdasd','asdasd','asdasd','as',45457),(18,'dddddd','dddddddd','dddddddd','dd',12345),(19,'llllllll','llllllll','llllllll','ll',22222),(20,'xxxxxxxxx','xxxxxxxx','xxxxxxx','xx',12121),(22,'fffffff','ffffff','fffffff','ff',34345),(24,'qwqwqwqsdf','Dsfdf Dfs','Qwqwdsf Sdfsd','QD',43434);
/*!40000 ALTER TABLE `subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscontacts`
--

DROP TABLE IF EXISTS `subscontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscontacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `workphone` varchar(20) NOT NULL,
  `cellphone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscontacts`
--

LOCK TABLES `subscontacts` WRITE;
/*!40000 ALTER TABLE `subscontacts` DISABLE KEYS */;
INSERT INTO `subscontacts` VALUES (10,7,'wqwqwqwqw','eeeeeeeeeeeee','ertert','3345345','435345345','sdffsdf@fdgdfg.com'),(16,24,'Sdfsdfsd','Sdfsdfsd','Sdfsdf','2342342453','2345235523','gdfg@dfgd.nb'),(18,24,'Sdfsdf','Hhhhhhhhh','Ggjhgjh Dtfd','3454565465','4546465474','ghjkg@hjkhk.bk');
/*!40000 ALTER TABLE `subscontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (15,'sdfgdfg','sdfgdfgsdg','sdfgdfg','fa',99999),(14,'asdasd','asdasd','sdfgdfg','ff',55555),(11,'sdsads','asdsad','asdsad','sd',23343),(17,'dddddddd','ddddddddd','aaaaaaaaa','aa',11111),(16,'sdasd','asdasd','sadsad','as',78789);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierscontacts`
--

DROP TABLE IF EXISTS `supplierscontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierscontacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `workphone` varchar(20) NOT NULL,
  `cellphone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierscontacts`
--

LOCK TABLES `supplierscontacts` WRITE;
/*!40000 ALTER TABLE `supplierscontacts` DISABLE KEYS */;
INSERT INTO `supplierscontacts` VALUES (4,15,'Dfgd Sdfgsd ','Sdfgs Sdf Dsfg ','Dfgsdf Sd Df ','4534534535','6456456745','tetwte@edtgdg.bvc');
/*!40000 ALTER TABLE `supplierscontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_devices`
--

DROP TABLE IF EXISTS `system_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `system_type` varchar(45) DEFAULT NULL,
  `brand_id` int NOT NULL DEFAULT '0',
  `device_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic_mac` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic_subnet` varchar(30) DEFAULT NULL,
  `nic_gateway` varchar(30) DEFAULT NULL,
  `nic_port` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `local_web_port` int DEFAULT NULL,
  `remote_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_web_port` int DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `firmware_version` varchar(45) DEFAULT 'N/A',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `link_name` varchar(45) DEFAULT 'N/A',
  `link_password` varchar(50) DEFAULT 'N/A',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_devices`
--

LOCK TABLES `system_devices` WRITE;
/*!40000 ALTER TABLE `system_devices` DISABLE KEYS */;
INSERT INTO `system_devices` VALUES (2,17,'CCTV',7,'Camera','asdasd',608,'SDFSDF','','','','','',0,'',0,'dfsdfsd','fsdfsdfsd','SDFSDF','','','N/A','N/A'),(3,17,'ACCESS',6,'Panel','fsdfsd',555,'','','','','','',0,'',0,'','','','','','N/A','N/A'),(4,17,'CCTV',6,'Speaker','zxczczc fdgdg dfg',599,'','','','','','',0,'',0,'','','','','','N/A','N/A');
/*!40000 ALTER TABLE `system_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_servers`
--

DROP TABLE IF EXISTS `system_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL DEFAULT '0',
  `system_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `brand_id` int NOT NULL DEFAULT '0',
  `server_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `serial_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nic0_mac` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic0_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic0_subnet` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nic0_gateway` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nic0_port` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_mac` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic1_subnet` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nic1_gateway` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nic1_port` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_mac` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nic2_subnet` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nic2_gateway` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nic2_port` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `os_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `os_login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `os_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `server_version` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `server_login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `server_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `site_id` (`site_id`),
  KEY `system_id` (`system_type`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_servers`
--

LOCK TABLES `system_servers` WRITE;
/*!40000 ALTER TABLE `system_servers` DISABLE KEYS */;
INSERT INTO `system_servers` VALUES (1,17,'CCTV',6,'Appliance','dfgdfgdfnhkh fdg',670,'ASDAKJHE344KJHSDFH','SDFHKDHFS234JLK','DD:DD:DD:DD:DD:DD','192.168.154.154','255.255.255.252 (/30)','192.168.1.254','22','12:12:12:12:12:12','10.10.10.10','255.255.255.252 (/30)','192.168.1.254','33','DD:DD:DD:DD:DD:DD','192.168.123.244','255.255.255.252 (/30)','DD:DD:DD:DD:DD:DD','45','212.215.253.102','asdasd sadd','administrator','djfsdlkfjskfdsflkjflksdfjf','asd  sads','administrator','kdjfsldfjsldkfjsldkfjlsdf','dasdasd asds dasdad ',''),(2,17,'CCTV',1,'NVR','dfgdfgdf',671,'','N/A','','','','','','','','','','','','','','','','','','','','','','','',''),(3,17,'CCTV',1,'Server','dfgdfgdf',671,'','N/A','','','','','','','','','','','','','','','','','','','','','','','',''),(4,17,'CCTV',1,NULL,'dfgdfgdf',671,'','N/A','','','','','','','','','','','','','','','','','','','','','','','',''),(6,17,'CCTV',6,'NVR','asdas',617,'','N/A','','','255.255.255.0 (/24)','','','','','255.255.255.0 (/24)','','','','','255.255.255.252 (/30)','','','','','','','','','','',''),(7,17,'ACCESS',6,'Workstation','assasad',671,'','N/A','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `system_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_types`
--

DROP TABLE IF EXISTS `system_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_types`
--

LOCK TABLES `system_types` WRITE;
/*!40000 ALTER TABLE `system_types` DISABLE KEYS */;
INSERT INTO `system_types` VALUES (1,'CCTV'),(2,'Access'),(3,'Burglary'),(4,'Networking'),(5,'Intercom'),(6,'Audio / Video'),(7,'Other');
/*!40000 ALTER TABLE `system_types` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,1,'Panel / Board'),(2,1,'Credentials'),(3,1,'Reader'),(4,1,'Request to Exit'),(5,1,'Keypad'),(6,1,'Electrical Strike'),(7,1,'Magnetic Lock'),(8,1,'Electrical Strike'),(9,1,'Electrified Hardware'),(10,1,'Exit Device'),(11,1,'Push Button'),(12,16,'Access Accessory'),(13,2,'Panel'),(14,2,'Zone Expender'),(15,2,'Keypad'),(16,2,'Siren'),(17,2,'Motion Detector'),(18,2,'Smoke Detector'),(19,2,'Glassbreak Detector'),(20,2,'Door Sensor'),(21,1,'Door Sensor'),(22,2,'Intrusion Accessory'),(23,2,'V-Plex'),(24,2,'Repeater'),(25,2,'Receiver'),(26,2,'Wireless Keyfob'),(27,2,'Panic Button'),(28,2,'CO Detector'),(29,2,'Fire Alarm Device'),(30,2,'Relay Board'),(31,3,'Router'),(32,3,'Switch'),(33,3,'KVM'),(34,3,'Networking Tool'),(35,3,'Media Converter'),(36,3,'PoE Extender'),(37,3,'PoE Injector'),(38,3,'Repeater'),(39,3,'Ethernet Adapter'),(40,3,'Access Point'),(41,3,'Wireless Router'),(42,4,'Transformer'),(43,4,'Power Supply'),(44,4,'UPS'),(45,4,'Surge Protector'),(46,4,'PDU'),(47,4,'Power Converter'),(48,16,'Power Supply Accessory'),(49,4,'Voltage Regulator'),(50,4,'Relay Module'),(51,5,'Battery Charger'),(52,5,'Battery'),(53,6,'AV Audio Amplifier'),(54,6,'AV Receiver'),(55,6,'AVRecorder'),(56,6,'Home Theater System'),(57,6,'AV Media Server'),(58,6,'AV Stereo Receiver'),(59,6,'AV Antenna'),(60,6,'AV Connector'),(61,6,'AV Interconnect Cable'),(62,6,'AV IR Control'),(63,6,'AV RF Control'),(64,6,'AV Wireless System'),(65,6,'HDML Cables'),(66,6,'I-Docks'),(67,16,'Sound Accessories'),(68,6,'AV Rack'),(69,6,'AV Rackmount'),(70,6,'Soundbar'),(71,6,'Speaker'),(72,6,'Video Mount'),(73,6,'Volume Control'),(74,6,'TV'),(75,6,'Display'),(76,6,'Projector'),(77,16,'AV Accessory'),(78,7,'Modular Connector'),(79,7,'Insert'),(80,7,'Patch Cable'),(81,7,'Enclosure'),(82,7,'Patch Panel'),(83,7,'Module'),(84,16,'Wiring Accessory'),(85,8,'General Hardware'),(86,8,'General Tool'),(87,8,'Hand Tool'),(88,8,'Labeling Equipment'),(89,8,'Cable Management'),(90,8,'Test Equipment'),(91,8,'Wire Installation'),(92,8,'Wire Termination Tool'),(93,9,'Analog Camera'),(94,9,'Camera'),(95,9,'Camera Lenses'),(96,9,'Decoder'),(97,9,'Encoder'),(98,9,'Fiber Product'),(99,9,'Housing'),(100,9,'Mount'),(101,9,'Monitor'),(102,9,'NVR'),(103,9,'DVR'),(104,9,'Server'),(105,9,'Multiplexer'),(106,16,'Camera Accessories'),(107,10,'Category Wire'),(108,10,'Coax Wire'),(109,10,'Fire Alarm Wire'),(110,10,'Solid Wire'),(111,10,'Sound Wire'),(112,10,'Stranded Wire'),(113,10,'Data Wire'),(114,11,'Cellular'),(115,11,'Modem'),(116,11,'Fiber'),(117,13,'Analog Audio Intercom'),(118,13,'Analog Video Intercom'),(119,13,'Door Entry'),(120,13,'IP Intercom'),(121,13,'Telephone Entry'),(122,16,'Intercom Accessory'),(124,9,'Appliance'),(125,9,'Workstation'),(126,9,'Archive'),(127,1,'Server'),(128,15,'License'),(129,9,'Joystick'),(130,3,'PoE Splitter'),(131,16,'Storage Accessories'),(132,17,'Unknown'),(135,9,'Speaker');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Yury','Kotov','ykotov','Admin1234','Admin','Active'),(2,'Chris','Johnson','cjohnson','User1234','Manager','Active'),(14,'test1','test','test','Test1234','User','Active'),(15,'test2','testing','testing','Test1234','User','Inactive');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `postal` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (3,'NorCal','1257 Quarry Lane','Pleasanton','CA',94566),(14,'fgdfg','Dfgdfg','Dfgdfg','DF',43453);
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_adjustment`
--

DROP TABLE IF EXISTS `wh_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_adjustment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `old_qty` int DEFAULT '0',
  `new_qty` int DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`wh_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_adjustment`
--

LOCK TABLES `wh_adjustment` WRITE;
/*!40000 ALTER TABLE `wh_adjustment` DISABLE KEYS */;
INSERT INTO `wh_adjustment` VALUES (4,32,0,5,0,12,'2022-07-09 15:46:29','ykotov','2022-07-09 15:50:12','ykotov','');
/*!40000 ALTER TABLE `wh_adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_orders`
--

DROP TABLE IF EXISTS `wh_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warehouse_id` int DEFAULT '0',
  `order_type_id` int DEFAULT '0',
  `order_status_id` int DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`) /*!80000 INVISIBLE */,
  KEY `order_type_id` (`order_type_id`) /*!80000 INVISIBLE */,
  KEY `order_status_id` (`order_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_orders`
--

LOCK TABLES `wh_orders` WRITE;
/*!40000 ALTER TABLE `wh_orders` DISABLE KEYS */;
INSERT INTO `wh_orders` VALUES (1,3,1,1,'2022-02-26 00:00:00','ykotov','2022-06-15 17:06:05','ykotov',''),(2,8,1,1,'2022-03-15 19:56:31','ykotov','2022-06-03 23:07:47','ykotov',''),(4,3,1,1,'2022-03-30 20:09:01','ykotov','2022-04-24 20:05:02','ykotov',''),(29,14,2,0,'2022-06-23 21:44:42','ykotov','2022-06-23 21:44:42','ykotov',''),(15,14,1,0,'2022-06-12 19:36:30','ykotov','2022-06-13 20:13:28','ykotov','fsdsfs f sdf dsf dfcxcvz zcvz zxcv zxv zxcvz zcx vzd z dzx fds sd szf sdf  fdgdf sdf  gsdf gdf gsdf sfd gs sdf gdsfg dfsg sdfg dfg'),(11,3,6,1,'2022-04-24 17:05:24','ykotov','2022-04-24 20:06:12','ykotov',''),(14,3,1,0,'2022-06-12 17:35:46','ykotov','2022-06-12 17:35:46','ykotov',''),(23,14,1,0,'2022-06-16 21:50:06','ykotov','2022-06-17 22:44:45','ykotov',''),(24,14,1,0,'2022-06-17 22:51:55','ykotov','2022-06-17 23:26:13','ykotov',''),(30,3,2,0,'2022-07-02 17:16:56','ykotov','2022-07-02 17:16:56','ykotov',''),(32,3,6,0,'2022-07-09 14:09:45','ykotov','2022-07-09 14:09:45','ykotov',''),(34,3,2,0,'2022-07-17 11:26:13','ykotov','2022-07-17 11:26:13','ykotov','');
/*!40000 ALTER TABLE `wh_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_supplierreturn`
--

DROP TABLE IF EXISTS `wh_supplierreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_supplierreturn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `return_qty` int DEFAULT '0',
  `supplier_id` int DEFAULT '0',
  `supplier_order_number` varchar(45) DEFAULT 'N/A',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`wh_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `supplier_id` (`supplier_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_supplierreturn`
--

LOCK TABLES `wh_supplierreturn` WRITE;
/*!40000 ALTER TABLE `wh_supplierreturn` DISABLE KEYS */;
INSERT INTO `wh_supplierreturn` VALUES (3,29,0,667,1,16,'N/A','2022-06-25 13:59:44','ykotov','2022-07-17 11:20:17','ykotov',''),(4,0,0,0,3,16,'N/A','2022-06-25 15:18:31','ykotov','2022-07-09 15:47:26','ykotov',''),(5,29,0,669,0,16,'N/A','2022-06-25 16:06:24','ykotov','2022-07-17 11:19:49','ykotov',''),(6,29,0,669,1,17,'N/A','2022-06-26 16:41:31','ykotov','2022-07-17 11:25:11','ykotov',''),(7,29,0,667,1,16,'N/A','2022-07-01 21:05:05','ykotov','2022-07-01 21:05:05','ykotov',''),(8,30,0,2,0,14,'N/A','2022-07-02 17:17:16','ykotov','2022-07-17 11:31:06','ykotov',''),(9,30,0,669,2,16,'N/A','2022-07-17 11:24:03','ykotov','2022-07-17 11:24:03','ykotov','');
/*!40000 ALTER TABLE `wh_supplierreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_supplierstock`
--

DROP TABLE IF EXISTS `wh_supplierstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_supplierstock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `ordered_qty` int DEFAULT '0',
  `received_qty` int DEFAULT '0',
  `supplier_id` int DEFAULT '0',
  `supplier_order_number` varchar(45) DEFAULT 'N/A',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`wh_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_supplierstock`
--

LOCK TABLES `wh_supplierstock` WRITE;
/*!40000 ALTER TABLE `wh_supplierstock` DISABLE KEYS */;
INSERT INTO `wh_supplierstock` VALUES (1,1,2,5,10,10,16,'5345345','2022-06-15 00:00:00','ykotov','2022-07-09 15:42:00','ykotov',''),(2,1,2,2,13,11,0,NULL,'2022-06-01 00:00:00','ykotov','2022-06-01 00:00:00','ykotov',''),(3,1,2,3,15,1,0,NULL,'2022-04-03 00:00:00','ykotov','2022-04-03 00:00:00','ykotov',''),(4,1,2,2,10,10,0,NULL,'2022-04-03 00:00:00','ykotov','2022-04-03 00:00:00','ykotov',''),(5,1,2,669,5,2,18,'ssssssssssssss','2022-06-04 00:00:00','ykotov','2022-06-04 00:00:00','ykotov',''),(6,1,2,668,1,1,20,'ddd','2022-06-04 00:00:00','ykotov','2022-06-04 00:00:00','ykotov',''),(7,14,2,669,2,1,11,'4234','2022-06-12 00:00:00','ykotov','2022-07-17 13:27:38','ykotov',''),(8,15,2,667,5,3,16,'vxcvxcv','2022-06-12 00:00:00','ykotov','2022-06-27 18:22:37','ykotov',''),(9,NULL,2,562,2,2,17,'ssdasas','2022-06-15 00:00:00','ykotov','2022-06-15 00:00:00','ykotov',''),(24,23,0,671,4,2,17,'N/A','2022-06-16 21:55:16','ykotov','2022-06-16 21:58:31','ykotov',''),(23,22,0,644,3,1,11,'N/A','2022-06-16 21:52:03','ykotov','2022-06-16 21:52:03','ykotov',''),(22,22,0,671,2,1,17,'N/A','2022-06-16 21:51:21','ykotov','2022-06-16 21:51:21','ykotov',''),(25,23,0,625,3,2,11,'N/A','2022-06-16 21:56:03','ykotov','2022-06-16 21:58:05','ykotov',''),(26,1,0,669,2,1,17,'N/A','2022-06-20 12:19:07','ykotov','2022-06-20 12:23:25','ykotov',''),(27,1,0,671,2,2,16,'N/A','2022-06-20 12:24:41','ykotov','2022-06-28 20:16:39','ykotov',''),(29,15,0,669,4,3,16,'N/A','2022-06-23 20:32:53','ykotov','2022-06-23 20:32:53','ykotov',''),(30,23,0,642,2,1,16,'N/A','2022-06-25 14:05:21','ykotov','2022-06-25 14:05:21','ykotov',''),(31,14,0,514,6,4,16,'N/A','2022-07-17 13:26:57','ykotov','2022-07-17 13:27:42','ykotov','');
/*!40000 ALTER TABLE `wh_supplierstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_transfer`
--

DROP TABLE IF EXISTS `wh_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `transfer_qty` int DEFAULT '0',
  `receive_qty` int DEFAULT '0',
  `new_wh_id` int DEFAULT '0',
  `transfer_date` date NOT NULL,
  `transfer_by` varchar(45) NOT NULL,
  `receive_date` date NOT NULL,
  `receive_by` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`wh_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */,
  KEY `warehouse_id` (`new_wh_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_transfer`
--

LOCK TABLES `wh_transfer` WRITE;
/*!40000 ALTER TABLE `wh_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `wh_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_vanreturn`
--

DROP TABLE IF EXISTS `wh_vanreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_vanreturn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `return_qty` int DEFAULT '0',
  `return_date` date NOT NULL,
  `return_by` varchar(45) NOT NULL,
  `van` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`wh_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_vanreturn`
--

LOCK TABLES `wh_vanreturn` WRITE;
/*!40000 ALTER TABLE `wh_vanreturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `wh_vanreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wh_vanstock`
--

DROP TABLE IF EXISTS `wh_vanstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wh_vanstock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wh_order_id` int DEFAULT '0',
  `status_id` int DEFAULT '0',
  `product_id` int DEFAULT '0',
  `issue_qty` int DEFAULT '0',
  `create_date` date NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_order_id` (`wh_order_id`) /*!80000 INVISIBLE */,
  KEY `status_id` (`status_id`) /*!80000 INVISIBLE */,
  KEY `product_id` (`product_id`) /*!80000 INVISIBLE */
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wh_vanstock`
--

LOCK TABLES `wh_vanstock` WRITE;
/*!40000 ALTER TABLE `wh_vanstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wh_vanstock` ENABLE KEYS */;
UNLOCK TABLES;

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
    total_received FLOAT,
    ordertype VARCHAR(20)
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(20);    
    IF(ordertype = 'supplierreturn' OR ordertype = 'adjustment'  OR ordertype = 'transfer' OR ordertype = 'vanstock' OR ordertype = 'vanreturn') THEN 
		IF(total_ordered_qty = 0 ) THEN
			set returnstatus = 'Created';
		ELSE
			set returnstatus = 'Complete';
		END IF;
	END IF;
    IF(ordertype = 'supplierstock') THEN
		IF (total_received < total_ordered_qty AND total_received = 0) THEN
			set returnStatus = 'Ordered';
		END IF;
		IF (total_received < total_ordered_qty AND total_received <> 0) THEN 
			SET returnStatus = 'In Progress';
		END IF;
		IF (total_ordered_qty = 0) THEN 
			SET returnStatus = 'Created';
		END IF;
		IF (total_ordered_qty = total_received AND total_ordered_qty > 0) THEN 
			SET returnStatus = 'Complete';
		END IF;
		IF (total_received > total_ordered_qty) THEN 
			SET returnStatus = 'Wrong Entries';
		END IF;
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
		SELECT SUM(received_qty) INTO total_received FROM `wh_supplierstock` WHERE wh_order_id = var_wh_order_id;
		SELECT SUM(ordered_qty) INTO total_ordered_qty FROM `wh_supplierstock` WHERE wh_order_id = var_wh_order_id;
		IF (total_ordered_qty =  0) THEN
			SET returnStatus = 'Ordered';
		ELSEIF (total_received < total_ordered_qty AND total_received <> 0) THEN 
			SET returnStatus = 'In Progress';
		ELSEIF (total_ordered_qty = total_received AND total_ordered_qty <> 0) THEN 
			SET returnStatus = 'Complete';
		ELSEIF (total_ordered_qty = 0) THEN 
			SET returnStatus = 'Created'; 
		ELSEIF (total_received > total_ordered_qty) THEN 
			SET returnStatus = 'Wrong Entries';
		ELSE 
			SET returnStatus = 'Created';
		END IF;
	ELSEIF (ordertypeid = 2) THEN 
		SELECT COUNT(id) INTO total_not_returned FROM `wh_supplierreturn` WHERE wh_order_id = var_wh_order_id and return_qty = 0;
        IF(total_not_returned <> 0 ) THEN 
			set returnStatus = concat(total_not_returned,' In Progress');
		ELSEIF (total_not_returned = 0 ) THEN 
			set returnStatus = 'Complete';
		ELSE 
			SET returnStatus = 'Created';
		END IF;
	ELSEIF (ordertypeid = 3) THEN 
		select sum(`transfer_qty`) INTO total_transfered from `wh_transfer` where wh_order_id = var_wh_order_id;
		select sum(`receive_qty`) INTO total_received from `wh_transfer` where wh_order_id = var_wh_order_id;
        IF(total_transfered = 0 AND total_received = 0 ) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(total_transfered <> total_received ) THEN 
			SET returnStatus = 'In Progress';
		ELSEIF(total_transfered = total_received ) THEN 
			SET returnStatus = 'Complete';
        END IF;		
	ELSEIF (ordertypeid = 4) THEN 
		select sum(`issue_qty`) INTO total_vanstock from `wh_vanstock` where wh_order_id = var_wh_order_id;
        select count(`issue_qty`) INTO zero_vanstock from `wh_vanstock` where wh_order_id = var_wh_order_id AND `issue_qty` = 0;        
        IF(total_vanstock = 0 AND zero_vanstock = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(zero_vanstock <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(total_vanstock <> 0 AND zero_vanstock = 0) THEN
			SET returnStatus = 'Complete';
        END IF;        
	ELSEIF (ordertypeid = 5) THEN 
		select sum(`return_qty`) INTO total_vanreturn from `wh_vanreturn` where wh_order_id = var_wh_order_id;
        select count(`return_qty`) INTO total_zerovanreturn from `wh_vanreturn` where wh_order_id = var_wh_order_id AND `return_qty` = 0;        
        IF(total_vanreturn = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(total_zerovanreturn <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(total_vanreturn <> 0 AND total_zerovanreturn = 0) THEN
			SET returnStatus = 'Complete';
		ELSE 
			SET returnStatus = 'Created';
        END IF;        
	ELSEIF (ordertypeid = 6) THEN 
		select sum(`old_qty`) INTO total_adjustment_old_qty from `wh_adjustment` where wh_order_id = var_wh_order_id;
        select sum(`new_qty`) INTO total_adjustment_new_qty from `wh_adjustment` where wh_order_id = var_wh_order_id;
        select count(`id`) INTO unadjusted_items from `wh_adjustment` where wh_order_id = var_wh_order_id and (old_qty = new_qty);
        IF(total_adjustment_old_qty = 0 and total_adjustment_new_qty = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(unadjusted_items <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(unadjusted_items = 0) THEN
			SET returnStatus = 'Complete';
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
/*!50001 VIEW `stock_status` AS select `stockstatus`.`warehouse_id` AS `warehouse_id`,`warehouses`.`name` AS `warehouse`,`stockstatus`.`product_id` AS `product_id`,`brands`.`brand` AS `brand`,`products`.`partnumber` AS `partnumber`,`products`.`description` AS `description`,`types`.`type` AS `type`,`categories`.`category` AS `category`,sum(`stockstatus`.`ordered_qty`) AS `ordered_qty`,sum(`stockstatus`.`received_qty`) AS `received_qty`,sum(`stockstatus`.`return_qty`) AS `return_qty`,sum(`stockstatus`.`transfer_qty`) AS `transfer_qty`,sum(`stockstatus`.`receive_qty`) AS `received_from_transfer_qty`,sum(`stockstatus`.`adjusted_qty`) AS `adjusted_qty`,((((sum(`stockstatus`.`received_qty`) - sum(`stockstatus`.`return_qty`)) - sum(`stockstatus`.`transfer_qty`)) + sum(`stockstatus`.`receive_qty`)) + sum(`stockstatus`.`adjusted_qty`)) AS `available` from ((((((select `wh_orders`.`warehouse_id` AS `warehouse_id`,`wh_supplierstock`.`wh_order_id` AS `wh_order_id`,`wh_supplierstock`.`product_id` AS `product_id`,`wh_supplierstock`.`ordered_qty` AS `ordered_qty`,`wh_supplierstock`.`received_qty` AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,0 AS `receive_qty`,0 AS `adjusted_qty` from (`wh_supplierstock` join `wh_orders` on((`wh_orders`.`id` = `wh_supplierstock`.`wh_order_id`))) union select `wh_orders`.`warehouse_id` AS `warehouse_id`,`wh_supplierreturn`.`wh_order_id` AS `wh_order_id`,`wh_supplierreturn`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,`wh_supplierreturn`.`return_qty` AS `return_qty`,0 AS `transfer_qty`,0 AS `receive_qty`,0 AS `adjusted_qty` from (`wh_supplierreturn` join `wh_orders` on((`wh_orders`.`id` = `wh_supplierreturn`.`wh_order_id`))) union select `wh_orders`.`warehouse_id` AS `warehouse_id`,`wh_transfer`.`wh_order_id` AS `wh_order_id`,`wh_transfer`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,`wh_transfer`.`transfer_qty` AS `transfer_qty`,0 AS `receive_qty`,0 AS `adjusted_qty` from (`wh_transfer` join `wh_orders` on((`wh_orders`.`id` = `wh_transfer`.`wh_order_id`))) union select `wh_transfer`.`new_wh_id` AS `new_wh_id`,`wh_transfer`.`wh_order_id` AS `wh_order_id`,`wh_transfer`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,`wh_transfer`.`receive_qty` AS `receive_qty`,0 AS `adjusted_qty` from `wh_transfer` union select `wh_transfer`.`new_wh_id` AS `new_wh_id`,`wh_transfer`.`wh_order_id` AS `wh_order_id`,`wh_transfer`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,`wh_transfer`.`receive_qty` AS `receive_qty`,0 AS `adjusted_qty` from `wh_transfer` union select `wh_orders`.`warehouse_id` AS `warehouse_id`,`wh_adjustment`.`wh_order_id` AS `wh_order_id`,`wh_adjustment`.`product_id` AS `product_id`,0 AS `ordered_qty`,0 AS `received_qty`,0 AS `return_qty`,0 AS `transfer_qty`,0 AS `receive_qty`,(`wh_adjustment`.`new_qty` - `wh_adjustment`.`old_qty`) AS `adjusted_qty` from (`wh_adjustment` join `wh_orders` on((`wh_orders`.`id` = `wh_adjustment`.`wh_order_id`)))) `stockstatus` left join `warehouses` on((`warehouses`.`id` = `stockstatus`.`warehouse_id`))) left join `products` on((`stockstatus`.`product_id` = `products`.`id`))) left join `brands` on((`brands`.`id` = `products`.`brand_id`))) left join `categories` on((`products`.`category_id` = `categories`.`id`))) left join `types` on((`types`.`id` = `products`.`type_id`))) group by `stockstatus`.`warehouse_id`,`stockstatus`.`product_id` */;
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

-- Dump completed on 2022-07-21 18:26:59
