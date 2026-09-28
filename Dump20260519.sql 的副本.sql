CREATE DATABASE  IF NOT EXISTS `final_erd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final_erd`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: final_erd
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_ID` int NOT NULL,
  `Member_ID` int DEFAULT NULL,
  `Resource_ID` int DEFAULT NULL,
  `Booking_Time` datetime DEFAULT NULL,
  `OTP` varchar(10) DEFAULT NULL,
  `Progress_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `Member_ID` (`Member_ID`),
  KEY `Resource_ID` (`Resource_ID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Resource_ID`) REFERENCES `resource` (`Resource_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,'2026-03-20 10:00:00','A1B2C','已完成'),(2,2,2,'2026-03-21 14:30:00','X9Y8Z','已完成'),(3,10,8,'2026-03-24 09:00:00','QWE12','進行中'),(4,9,3,'2026-03-25 13:00:00','RTY34','已預約'),(5,5,10,'2026-03-26 15:00:00','UIO56','已預約'),(6,6,9,'2026-03-27 10:30:00','PAS78','已取消'),(7,3,4,'2026-03-28 08:30:00','DFG90','已預約'),(8,1,6,'2026-03-29 11:00:00','HJK12','已預約'),(9,2,9,'2026-03-30 16:00:00','LZX34','已預約'),(10,8,10,'2026-03-31 14:00:00','CVB56','已預約');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_center`
--

DROP TABLE IF EXISTS `community_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_center` (
  `Center_ID` int NOT NULL,
  `Center_Name` varchar(100) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `District` varchar(20) DEFAULT NULL,
  `Street_Address` varchar(150) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`Center_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_center`
--

LOCK TABLES `community_center` WRITE;
/*!40000 ALTER TABLE `community_center` DISABLE KEYS */;
INSERT INTO `community_center` VALUES (1,'歸仁區樂齡中心','台南市','歸仁區','中正南路二段100號','06-2391234',22.95660000,120.29350000),(2,'東區復興活動中心','台南市','東區','裕文路100號','06-3315678',22.98400000,120.23660000),(3,'安平區石門社區','台南市','安平區','安平路100號','06-2991122',23.00160000,120.16330000),(4,'永康區大橋據點','台南市','永康區','大橋二街10號','06-2023344',23.02320000,120.23190000),(5,'仁德區成功活動中心','台南市','仁德區','成功二街20號','06-2667788',22.97250000,120.26380000),(6,'北區大和社區','台南市','北區','和緯路三段50號','06-2512233',23.01180000,120.19500000),(7,'中西區銀髮俱樂部','台南市','中西區','府前路一段100號','06-2134455',22.98980000,120.20230000),(8,'南區金華社區','台南市','南區','金華路二段200號','06-2645566',22.97360000,120.18640000),(9,'安南區海尾據點','台南市','安南區','海佃路一段300號','06-2567788',23.03150000,120.19160000),(10,'新市區三里活動中心','台南市','新市區','中正路150號','06-5998899',23.07840000,120.29410000);
/*!40000 ALTER TABLE `community_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` int NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL,
  `District` varchar(20) DEFAULT NULL,
  `Street_Address` varchar(150) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  `Center_ID` int DEFAULT NULL,
  PRIMARY KEY (`Member_ID`),
  KEY `Center_ID` (`Center_ID`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Center_ID`) REFERENCES `community_center` (`Center_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'男','王大明','0912-345-678','台南市','歸仁區','中正南路一段1號','wang.ming@example.com',1),(2,'女','李美玲','0922-333-444','台南市','東區','林森路二段20號','lee.mei@example.com',2),(3,'男','陳建志','0933-444-555','台北市','信義區','信義路五段7號','chen_cc@example.com',7),(4,'女','林雅惠','0944-555-666','高雄市','苓雅區','四維三路2號','lin.ya@example.com',8),(5,'男','張家豪','0955-666-777','台中市','西屯區','台灣大道三段99號','chang_hao@example.com',5),(6,'女','吳淑芬','0966-777-888','台南市','安平區','永華路二段2號','wu_sf@example.com',3),(7,'男','劉冠宇','0977-888-999','新北市','板橋區','中山路一段161號','liu.kuan@example.com',6),(8,'女','蔡佳玲','0988-999-000','桃園市','桃園區','縣府路1號','tsai.jia@example.com',10),(9,'男','楊宗翰','0999-000-111','台南市','永康區','永大路二段100號','yang.ts@example.com',4),(10,'女','黃鈺婷','0900-111-222','台南市','仁德區','中正路二段11號','huang.yu@example.com',5);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `Resource_ID` int NOT NULL,
  `REsource_Name` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Center_ID` int DEFAULT NULL,
  PRIMARY KEY (`Resource_ID`),
  KEY `Center_ID` (`Center_ID`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`Center_ID`) REFERENCES `community_center` (`Center_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,'中型復康巴士 (含升降尾門)','車輛','可借用',NULL),(2,'中型復康巴士 (含升降尾門)','車輛','可借用',NULL),(3,'中型復康巴士 (含升降尾門)','車輛','可借用',NULL),(4,'中型復康巴士 (含升降尾門)','車輛','借用中',NULL),(5,'小型復康巴士 (輪椅直上)','車輛','可借用',NULL),(6,'小型復康巴士 (輪椅直上)','車輛','可借用',NULL),(7,'小型復康巴士 (輪椅直上)','車輛','借用中',NULL),(8,'日照中心接駁車 (側滑門)','車輛','可借用',NULL),(9,'日照中心接駁車 (側滑門)','車輛','可借用',NULL),(10,'日照中心接駁車 (側滑門)','車輛','可借用',NULL),(11,'日照中心接駁車 (側滑門)','車輛','借用中',NULL),(12,'日照中心接駁車 (側滑門)','車輛','借用中',NULL),(13,'無障礙計程車 (特約A車)','車輛','可借用',NULL),(14,'無障礙計程車 (特約A車)','車輛','可借用',NULL),(15,'無障礙計程車 (特約A車)','車輛','借用中',NULL),(16,'無障礙計程車 (特約A車)','車輛','借用中',NULL),(17,'長照接送專車 (一般福祉車)','車輛','可借用',NULL),(18,'長照接送專車 (一般福祉車)','車輛','借用中',NULL),(19,'長照接送專車 (一般福祉車)','車輛','借用中',NULL),(20,'折疊式助行器','器具','可借用',NULL),(21,'折疊式助行器','器具','可借用',NULL),(22,'折疊式助行器','器具','可借用',NULL),(23,'折疊式助行器','器具','可借用',NULL),(24,'折疊式助行器','器具','可借用',NULL),(25,'折疊式助行器','器具','可借用',NULL),(26,'折疊式助行器','器具','可借用',NULL),(27,'折疊式助行器','器具','可借用',NULL),(28,'折疊式助行器','器具','借用中',NULL),(29,'折疊式助行器','器具','借用中',NULL),(30,'折疊式助行器','器具','借用中',NULL),(31,'折疊式助行器','器具','借用中',NULL),(32,'標準成人輪椅','器具','可借用',NULL),(33,'標準成人輪椅','器具','可借用',NULL),(34,'標準成人輪椅','器具','可借用',NULL),(35,'標準成人輪椅','器具','可借用',NULL),(36,'標準成人輪椅','器具','可借用',NULL),(37,'標準成人輪椅','器具','可借用',NULL),(38,'標準成人輪椅','器具','可借用',NULL),(39,'標準成人輪椅','器具','可借用',NULL),(40,'標準成人輪椅','器具','可借用',NULL),(41,'標準成人輪椅','器具','可借用',NULL),(42,'標準成人輪椅','器具','借用中',NULL),(43,'標準成人輪椅','器具','借用中',NULL),(44,'標準成人輪椅','器具','借用中',NULL),(45,'標準成人輪椅','器具','借用中',NULL),(46,'標準成人輪椅','器具','借用中',NULL),(47,'腋下拐杖','器具','可借用',NULL),(48,'腋下拐杖','器具','可借用',NULL),(49,'腋下拐杖','器具','可借用',NULL),(50,'腋下拐杖','器具','可借用',NULL),(51,'腋下拐杖','器具','可借用',NULL),(52,'腋下拐杖','器具','可借用',NULL),(53,'腋下拐杖','器具','可借用',NULL),(54,'腋下拐杖','器具','借用中',NULL),(55,'腋下拐杖','器具','借用中',NULL),(56,'腋下拐杖','器具','借用中',NULL),(57,'腋下拐杖','器具','借用中',NULL),(58,'鋁合金四腳拐杖','器具','可借用',NULL),(59,'鋁合金四腳拐杖','器具','可借用',NULL),(60,'鋁合金四腳拐杖','器具','可借用',NULL),(61,'鋁合金四腳拐杖','器具','可借用',NULL),(62,'鋁合金四腳拐杖','器具','可借用',NULL),(63,'鋁合金四腳拐杖','器具','可借用',NULL),(64,'鋁合金四腳拐杖','器具','可借用',NULL),(65,'鋁合金四腳拐杖','器具','可借用',NULL),(66,'鋁合金四腳拐杖','器具','可借用',NULL),(67,'鋁合金四腳拐杖','器具','借用中',NULL),(68,'鋁合金四腳拐杖','器具','借用中',NULL),(69,'鋁合金四腳拐杖','器具','借用中',NULL),(70,'鋁合金四腳拐杖','器具','借用中',NULL),(71,'電動升降護理床','器具','可借用',NULL),(72,'電動升降護理床','器具','可借用',NULL),(73,'電動升降護理床','器具','可借用',NULL),(74,'電動升降護理床','器具','可借用',NULL),(75,'電動升降護理床','器具','可借用',NULL),(76,'電動升降護理床','器具','可借用',NULL),(77,'電動升降護理床','器具','可借用',NULL),(78,'電動升降護理床','器具','可借用',NULL),(79,'電動升降護理床','器具','可借用',NULL),(80,'電動升降護理床','器具','可借用',NULL),(81,'電動升降護理床','器具','可借用',NULL),(82,'電動升降護理床','器具','借用中',NULL),(83,'電動升降護理床','器具','借用中',NULL),(84,'電動升降護理床','器具','借用中',NULL);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-19 11:17:53
