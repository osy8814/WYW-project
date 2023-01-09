-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: wyw
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `product_count` int NOT NULL,
  `price` int unsigned NOT NULL DEFAULT '1',
  `save_point` int unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `product_id_fk_idx` (`product_id`),
  KEY `oder_id_fk_idx` (`order_id`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (120,'admin_202211291147',309,1,125000,0),(121,'admin_202211291147',314,1,49000,0),(122,'admin_202211291147',312,1,2000000,0),(123,'admin_202211303517',313,1,2500000,0),(124,'admin_202211303517',312,1,2000000,0),(125,'admin_202211305525',118,1,39500,0),(126,'admin_202211305525',47,1,39000,0),(127,'admin_202211305525',308,1,490000,0),(128,'admin_202211303819',314,1,49000,0),(129,'edcosy11_202211302532',312,1,2000000,0),(130,'anhj91_202211305818',310,1,540000,0),(131,'anhj91_202211305818',122,2,80000,0),(132,'anhj91_202211300051',47,6,39000,0),(133,'admin_202212025159',313,1,2500000,0),(134,'admin_202212025159',314,1,49000,0),(135,'admin_202212025159',312,1,2000000,0),(136,'admin_202212025159',47,1,39000,0),(137,'admin_202212025159',309,1,125000,0),(138,'admin_202212025159',310,1,540000,0),(139,'admin_202212025159',118,1,39500,0),(140,'admin_202212025159',116,6,35000,0),(141,'admin_202212025159',113,2,69000,0),(142,'osy8814_202212055302',313,1,2500000,0),(143,'osy8814_202212055631',313,1,2500000,0),(144,'osy8814_202212055631',312,1,2000000,0),(145,'osy8814_202212055702',118,1,39500,0),(146,'osy8814_202212055702',313,1,2500000,0),(147,'admin_202212052605',309,1,125000,0),(148,'osy8814_202212063716',313,1,2500000,0),(149,'osy8814_202212063716',312,1,2000000,0),(150,'admin_202212060916',342,2,299000,0),(151,'admin_202212060948',342,1,299000,0);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07 10:04:15