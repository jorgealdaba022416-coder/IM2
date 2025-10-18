CREATE DATABASE  IF NOT EXISTS `aldaba_fmarketdirect` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aldaba_fmarketdirect`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: aldaba_fmarketdirect
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `beef`
--

DROP TABLE IF EXISTS `beef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `purchasecount` int DEFAULT '0',
  `totalsales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beef`
--

LOCK TABLES `beef` WRITE;
/*!40000 ALTER TABLE `beef` DISABLE KEYS */;
INSERT INTO `beef` VALUES (495,'Beef- Arm Roast',10.00,'USD','Avg. 3 lb.',1,2,20.00),(496,'Beef- Bone in Ribeye',22.50,'USD','Avg. 1.25 lb.',1,0,0.00),(497,'Beef- Chuck Roast',10.00,'USD','Avg. 2.8 lb.',0,0,0.00),(498,'Beef- Ground',10.00,'USD','Avg. 1 lb.',1,0,0.00),(499,'Beef- Ground Patties',10.50,'USD','N/A',1,0,0.00),(500,'Beef- Half Brisket',8.00,'USD','Avg. 7.5 lb.',0,0,0.00),(501,'Beef- Jalapeno Cheese Sausage Links',14.00,'USD','N/A',1,0,0.00),(502,'Beef- NY Strip',18.00,'USD','Avg. 1 lb.',1,0,0.00),(503,'Beef- Sirloin Tips',10.00,'USD','Avg. 1.2 lb.',1,0,0.00),(504,'Beef- Top Sirloin',18.00,'USD','Avg. 2 lb.',1,0,0.00),(505,'Insulated Grocery Bag',5.00,'USD','N/A',1,0,0.00),(506,'Italian Sausage (Smoked) with Caciocavera',9.50,'USD','N/A',1,0,0.00),(507,'Meatballs With Cheese',9.50,'USD','N/A',0,0,0.00);
/*!40000 ALTER TABLE `beef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beverages`
--

DROP TABLE IF EXISTS `beverages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beverages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `purchasecount` int DEFAULT '0',
  `totalsales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverages`
--

LOCK TABLES `beverages` WRITE;
/*!40000 ALTER TABLE `beverages` DISABLE KEYS */;
INSERT INTO `beverages` VALUES (441,'Beverage Syrup-  Blueberry',10.00,'USD','N/A',0,0,0.00),(442,'Beverage Syrup- Caramel',13.00,'USD','N/A',1,1,13.00),(443,'Beverage Syrup- Chocolate',10.00,'USD','N/A',0,0,0.00),(444,'Beverage Syrup- Coconut',10.00,'USD','N/A',1,0,0.00),(445,'Beverage Syrup- Hazelnut',10.00,'USD','N/A',1,0,0.00),(446,'Beverage Syrup- Lavender',10.00,'USD','N/A',1,0,0.00),(447,'Beverage Syrup- Mint',10.00,'USD','N/A',0,0,0.00),(448,'Beverage Syrup- Raspberry',10.00,'USD','N/A',0,0,0.00),(449,'Beverage Syrup- Sugar Free Vanilla',10.00,'USD','N/A',0,0,0.00),(450,'Beverage Syrup- Vanilla Bean',13.00,'USD','N/A',1,0,0.00),(451,'Beverage Syrup- White Chocolate',10.00,'USD','N/A',0,0,0.00),(452,'Kombucha- Hibiscus Cherry NSBC',4.00,'USD','12 fl oz',1,0,0.00),(453,'Kombucha- Mango Pineapple Kombucha NSBC',4.00,'USD','12 fl oz',1,0,0.00),(454,'Kombucha- Mojito NSBC',4.00,'USD','12 fl oz',1,0,0.00),(455,'Soda- Black Elderberry NSBC',4.00,'USD','12 fl oz',0,0,0.00),(456,'Soda- Dark Cherry NSBC',2.50,'USD','12 fl oz',0,0,0.00),(457,'Soda- Ginger NSBC',2.50,'USD','12 fl oz',1,0,0.00),(458,'Soda- Root Beer NSBC',2.50,'USD','12 fl oz',0,0,0.00),(459,'Sparkling Blackberry Pomegranate- 33 mL',3.00,'USD','33 mL',1,0,0.00),(460,'Sparkling Water- 1 Liter',5.00,'USD','1 Liter',1,0,0.00),(461,'Spring Water- 1 Liter',4.00,'USD','1 Liter',1,0,0.00),(462,'Spring Water- 33 mL',2.50,'USD','33 mL',1,0,0.00);
/*!40000 ALTER TABLE `beverages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chicken`
--

DROP TABLE IF EXISTS `chicken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chicken` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `purchasecount` int DEFAULT '0',
  `totalsales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chicken`
--

LOCK TABLES `chicken` WRITE;
/*!40000 ALTER TABLE `chicken` DISABLE KEYS */;
INSERT INTO `chicken` VALUES (204,'Chicken Breast',14.50,'USD','Avg. 1 lb.',0,0,0.00),(205,'Chicken Breast- Bulk',12.00,'USD','Avg. 5 lb.',1,1,12.00),(206,'Chicken Thigh',11.50,'USD','Avg. 1 lb.',1,0,0.00),(207,'Chicken Thigh- Bulk',9.00,'USD','Avg. 1 lb.',1,0,0.00),(208,'Chicken Wing- Bulk',6.00,'USD','Avg. 1 lb.',1,0,0.00),(209,'Chicken-Wings',11.50,'USD','Avg. 1 lb.',1,0,0.00),(210,'Insulated Grocery Bag',5.00,'USD','N/A',1,0,0.00);
/*!40000 ALTER TABLE `chicken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coffee`
--

DROP TABLE IF EXISTS `coffee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coffee` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `purchasecount` int DEFAULT '0',
  `totalsales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coffee`
--

LOCK TABLES `coffee` WRITE;
/*!40000 ALTER TABLE `coffee` DISABLE KEYS */;
INSERT INTO `coffee` VALUES (385,'Beverage Syrup-  Blueberry',10.00,'USD','N/A',0,0,0.00),(386,'Beverage Syrup- Caramel',13.00,'USD','N/A',1,1,13.00),(387,'Beverage Syrup- Chocolate',10.00,'USD','N/A',0,0,0.00),(388,'Beverage Syrup- Coconut',10.00,'USD','N/A',1,0,0.00),(389,'Beverage Syrup- Hazelnut',10.00,'USD','N/A',1,0,0.00),(390,'Beverage Syrup- Lavender',10.00,'USD','N/A',1,0,0.00),(391,'Beverage Syrup- Mint',10.00,'USD','N/A',0,0,0.00),(392,'Beverage Syrup- Raspberry',10.00,'USD','N/A',0,0,0.00),(393,'Beverage Syrup- Sugar Free Vanilla',10.00,'USD','N/A',0,0,0.00),(394,'Beverage Syrup- Vanilla Bean',13.00,'USD','N/A',1,0,0.00),(395,'Beverage Syrup- White Chocolate',10.00,'USD','N/A',0,0,0.00),(396,'Coffee (Whole Bean)- Day Hiker&#039;s Blend',16.50,'USD','12 oz. bag',0,0,0.00),(397,'Coffee (Whole Bean)- Mexico Chiapas',16.50,'USD','12 oz. bag',0,0,0.00),(398,'Coffee (Whole Bean)- Sumatra Gayo',16.50,'USD','12 oz. bag',0,0,0.00),(399,'Coffee- Buffalo Blend Ground',16.00,'USD','N/A',0,0,0.00),(400,'Coffee- Buffalo Blend Whole Bean',16.00,'USD','N/A',0,0,0.00),(401,'Coffee- Canyon Blend Ground',16.00,'USD','N/A',0,0,0.00),(402,'Coffee- Canyon Blend Whole Bean',16.00,'USD','N/A',0,0,0.00),(403,'Coffee- Colombia Whole Bean',16.00,'USD','2/3 lb (340g)',0,0,0.00),(404,'Coffee- Ethiopia Whole Bean',16.00,'USD','2/3 lb (340g)',1,0,0.00),(405,'Coffee- Guatemala Whole Bean',16.00,'USD','2/3 lb (340g)',1,0,0.00),(406,'Coffee- Honduras Whole Bean',16.00,'USD','2/3 lb (340g)',1,0,0.00),(407,'Coffee- Sunrise Blend Ground',16.00,'USD','N/A',1,0,0.00),(408,'Coffee- Sunrise Blend Whole Bean',16.00,'USD','N/A',1,0,0.00);
/*!40000 ALTER TABLE `coffee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftcards`
--

DROP TABLE IF EXISTS `giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giftcards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `purchasecount` int DEFAULT '0',
  `totalsales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftcards`
--

LOCK TABLES `giftcards` WRITE;
/*!40000 ALTER TABLE `giftcards` DISABLE KEYS */;
INSERT INTO `giftcards` VALUES (196,'Digital Gift Card $200.00',200.00,'USD',0,0.00),(197,'Digital Gift Card- $100.00',100.00,'USD',1,100.00),(198,'Digital Gift Card- $50.00',50.00,'USD',0,0.00),(199,'Gift Basket- 12\" Oval Tub Galvanized',8.00,'USD',0,0.00),(200,'Gift Basket- 14\" Oval Tub Galvanized',10.00,'USD',0,0.00),(201,'Gift Basket- 8\" Oval Tub Galvanized',8.00,'USD',0,0.00);
/*!40000 ALTER TABLE `giftcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pork`
--

DROP TABLE IF EXISTS `pork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pork` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `purchasecount` int DEFAULT '0',
  `totalsales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pork`
--

LOCK TABLES `pork` WRITE;
/*!40000 ALTER TABLE `pork` DISABLE KEYS */;
INSERT INTO `pork` VALUES (451,'Bratwurst',14.00,'USD','Avg. 2.7 lb.',1,1,14.00),(452,'Bratwurst- Cheddar',14.00,'USD','Avg. 2.7 lb.',1,0,0.00),(453,'Insulated Grocery Bag',5.00,'USD','N/A',1,0,0.00),(454,'Italian Sausage (Smoked) with Caciocavera',9.50,'USD','N/A',1,1,9.50),(455,'Italian Sausage- Original',7.50,'USD','N/A',0,0,0.00),(456,'Italian Sausage- Smoked',9.50,'USD','N/A',1,0,0.00),(457,'Italian Sausage- Tomato Basil',7.50,'USD','N/A',1,0,0.00),(458,'Meatballs With Cheese',9.50,'USD','N/A',0,0,0.00),(459,'Pork Chops',16.00,'USD','Avg. 1 lb.',1,0,0.00),(460,'Pork- Bacon',16.00,'USD','Avg. 1 lb.',1,0,0.00),(461,'Pork- Breakfast Sausage',11.00,'USD','Avg. 2.7 lb.',1,0,0.00),(462,'Pork- Butt (Shoulder)',11.00,'USD','Avg. 1.5 lb.',1,0,0.00),(463,'Pork- Tenderloin',16.00,'USD','Avg. 2 lb.',1,0,0.00),(464,'Sicilian Sausage',7.50,'USD','N/A',1,0,0.00),(465,'Summer Sausage',6.50,'USD','N/A',1,0,0.00);
/*!40000 ALTER TABLE `pork` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-18 21:54:18
