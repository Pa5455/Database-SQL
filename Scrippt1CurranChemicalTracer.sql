CREATE DATABASE  IF NOT EXISTS `Spray_Traceability` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Spray_Traceability`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Spray_Traceability
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
-- Table structure for table `APPRENTICE_AUDIT`
--

DROP TABLE IF EXISTS `APPRENTICE_AUDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPRENTICE_AUDIT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `trainingLevel` enum('low','mid','high') NOT NULL,
  `changedate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPRENTICE_AUDIT`
--

LOCK TABLES `APPRENTICE_AUDIT` WRITE;
/*!40000 ALTER TABLE `APPRENTICE_AUDIT` DISABLE KEYS */;
INSERT INTO `APPRENTICE_AUDIT` VALUES (1,'Phil','Jones','mid','2020-11-29 14:45:24','update');
/*!40000 ALTER TABLE `APPRENTICE_AUDIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apprenticeOperator`
--

DROP TABLE IF EXISTS `apprenticeOperator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apprenticeOperator` (
  `operatorID` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `trainingLevel` enum('low','mid','high') NOT NULL,
  PRIMARY KEY (`operatorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apprenticeOperator`
--

LOCK TABLES `apprenticeOperator` WRITE;
/*!40000 ALTER TABLE `apprenticeOperator` DISABLE KEYS */;
INSERT INTO `apprenticeOperator` VALUES (1,'Tommy','Walsh','high'),(2,'Phil','Jones','high');
/*!40000 ALTER TABLE `apprenticeOperator` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_apprentice_update` BEFORE UPDATE ON `apprenticeoperator` FOR EACH ROW BEGIN 
	INSERT INTO APPRENTICE_AUDIT
	SET action = 'update',
    fName = OLD.fName,
    lName = OLD.lName,
    trainingLevel = OLD.trainingLevel,
    changeDate = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `brand_usage_by_farmer`
--

DROP TABLE IF EXISTS `brand_usage_by_farmer`;
/*!50001 DROP VIEW IF EXISTS `brand_usage_by_farmer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `brand_usage_by_farmer` AS SELECT 
 1 AS `orderNo`,
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `orderDate`,
 1 AS `nameChem`,
 1 AS `orderVol`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CHEMICAL`
--

DROP TABLE IF EXISTS `CHEMICAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHEMICAL` (
  `nameChem` varchar(45) NOT NULL,
  `costLitre` decimal(5,2) DEFAULT NULL,
  `supplierID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nameChem`),
  KEY `chemical_fk` (`supplierID`),
  KEY `CHEMICAL_INDEX` (`nameChem`),
  CONSTRAINT `chemical_fk` FOREIGN KEY (`supplierID`) REFERENCES `Supplier` (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHEMICAL`
--

LOCK TABLES `CHEMICAL` WRITE;
/*!40000 ALTER TABLE `CHEMICAL` DISABLE KEYS */;
INSERT INTO `CHEMICAL` VALUES ('Nettleban',35.45,1),('Roundup',18.00,1),('WeedBlaster',40.50,1);
/*!40000 ALTER TABLE `CHEMICAL` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_chemical_update` BEFORE UPDATE ON `chemical` FOR EACH ROW BEGIN 
	INSERT INTO CHEMICAL_AUDIT
    SET action = 'update',
    nameChem = OLD.nameChem,
    costLitre = OLD.costLitre,
    changeDate = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CHEMICAL_AUDIT`
--

DROP TABLE IF EXISTS `CHEMICAL_AUDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHEMICAL_AUDIT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nameChem` varchar(45) NOT NULL,
  `costLitre` decimal(5,2) DEFAULT NULL,
  `changedate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHEMICAL_AUDIT`
--

LOCK TABLES `CHEMICAL_AUDIT` WRITE;
/*!40000 ALTER TABLE `CHEMICAL_AUDIT` DISABLE KEYS */;
INSERT INTO `CHEMICAL_AUDIT` VALUES (1,'Roundup',15.00,'2020-11-29 14:45:24','update');
/*!40000 ALTER TABLE `CHEMICAL_AUDIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `countyusagecork`
--

DROP TABLE IF EXISTS `countyusagecork`;
/*!50001 DROP VIEW IF EXISTS `countyusagecork`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `countyusagecork` AS SELECT 
 1 AS `Name`,
 1 AS `farmerID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `countyusagewat`
--

DROP TABLE IF EXISTS `countyusagewat`;
/*!50001 DROP VIEW IF EXISTS `countyusagewat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `countyusagewat` AS SELECT 
 1 AS `Name`,
 1 AS `farmerID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `FARMER`
--

DROP TABLE IF EXISTS `FARMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FARMER` (
  `farmerID` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `county` varchar(10) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`farmerID`),
  KEY `FARMER_INDEX` (`fName`,`lName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FARMER`
--

LOCK TABLES `FARMER` WRITE;
/*!40000 ALTER TABLE `FARMER` DISABLE KEYS */;
INSERT INTO `FARMER` VALUES (1,'Patrick','Curran','patirck@hotmail.com','Cork','0871234567'),(2,'John','McCarthy','john@hotmail.com','Waterford','0871234567'),(3,'Patrick','Smith','pasmith@hotmail.com','Cork','0863434567');
/*!40000 ALTER TABLE `FARMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPERATOR`
--

DROP TABLE IF EXISTS `OPERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OPERATOR` (
  `operatorID` int NOT NULL AUTO_INCREMENT,
  `fNAME` varchar(45) NOT NULL,
  `lNAME` varchar(45) NOT NULL,
  `rateAcre` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`operatorID`),
  KEY `OPERATOR_INDEX` (`fNAME`,`lNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPERATOR`
--

LOCK TABLES `OPERATOR` WRITE;
/*!40000 ALTER TABLE `OPERATOR` DISABLE KEYS */;
INSERT INTO `OPERATOR` VALUES (1,'Ken','McGrath',10.20),(2,'Declan','Prendergast',8.50);
/*!40000 ALTER TABLE `OPERATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFORMS`
--

DROP TABLE IF EXISTS `PERFORMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERFORMS` (
  `operatorID` int NOT NULL AUTO_INCREMENT,
  `orderNo` int NOT NULL,
  `acres` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`operatorID`,`orderNo`),
  KEY `performs_fk2` (`orderNo`),
  CONSTRAINT `performs_fk1` FOREIGN KEY (`operatorID`) REFERENCES `Operator` (`operatorID`),
  CONSTRAINT `performs_fk2` FOREIGN KEY (`orderNo`) REFERENCES `SPRAYORDER` (`orderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFORMS`
--

LOCK TABLES `PERFORMS` WRITE;
/*!40000 ALTER TABLE `PERFORMS` DISABLE KEYS */;
INSERT INTO `PERFORMS` VALUES (1,1,40.00);
/*!40000 ALTER TABLE `PERFORMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `premiumprice`
--

DROP TABLE IF EXISTS `premiumprice`;
/*!50001 DROP VIEW IF EXISTS `premiumprice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `premiumprice` AS SELECT 
 1 AS `nameChem`,
 1 AS `costLitre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SPRAYORDER`
--

DROP TABLE IF EXISTS `SPRAYORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPRAYORDER` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `orderDATE` date NOT NULL,
  `orderVol` decimal(5,2) DEFAULT NULL,
  `nameChem` varchar(45) NOT NULL,
  `farmerID` int DEFAULT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `sprayorder_fk1` (`farmerID`),
  KEY `sprayorder_fk2` (`nameChem`),
  KEY `SPRAYORDER_INDEX` (`orderVol`),
  CONSTRAINT `sprayorder_fk1` FOREIGN KEY (`farmerID`) REFERENCES `FARMER` (`farmerID`),
  CONSTRAINT `sprayorder_fk2` FOREIGN KEY (`nameChem`) REFERENCES `CHEMICAL` (`nameChem`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRAYORDER`
--

LOCK TABLES `SPRAYORDER` WRITE;
/*!40000 ALTER TABLE `SPRAYORDER` DISABLE KEYS */;
INSERT INTO `SPRAYORDER` VALUES (1,'2020-08-15',15.50,'Roundup',1),(2,'2020-07-01',40.25,'Roundup',1),(3,'2019-04-01',50.00,'WeedBlaster',3);
/*!40000 ALTER TABLE `SPRAYORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUPPLIER` (
  `supplierID` int NOT NULL AUTO_INCREMENT,
  `supName` varchar(45) NOT NULL,
  `address` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `vatNo` varchar(8) NOT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (1,'Denn Feeds','Capaquinn Dungarvan Waterford','patdenn@dennfedds.ie','05815432','85463217'),(2,'Redmills','Grange Freshford Kilkenny','info@redmills.ie','05656432','85463217');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USES`
--

DROP TABLE IF EXISTS `USES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USES` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `orderVol` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `uses_fk2` (`orderVol`),
  CONSTRAINT `uses_fk1` FOREIGN KEY (`orderNo`) REFERENCES `SPRAYORDER` (`orderNo`),
  CONSTRAINT `uses_fk2` FOREIGN KEY (`orderVol`) REFERENCES `SPRAYORDER` (`orderVol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USES`
--

LOCK TABLES `USES` WRITE;
/*!40000 ALTER TABLE `USES` DISABLE KEYS */;
INSERT INTO `USES` VALUES (1,15.50),(2,40.25),(3,50.00);
/*!40000 ALTER TABLE `USES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `brand_usage_by_farmer`
--

/*!50001 DROP VIEW IF EXISTS `brand_usage_by_farmer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `brand_usage_by_farmer` AS select `sprayorder`.`orderNo` AS `orderNo`,`farmer`.`fName` AS `First_Name`,`farmer`.`lName` AS `Last_Name`,`sprayorder`.`orderDATE` AS `orderDate`,`chemical`.`nameChem` AS `nameChem`,`uses`.`orderVol` AS `orderVol` from (((`sprayorder` join `farmer` on((`sprayorder`.`farmerID` = `farmer`.`farmerID`))) join `chemical` on((`sprayorder`.`nameChem` = `chemical`.`nameChem`))) join `uses` on((`sprayorder`.`orderVol` = `uses`.`orderVol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `countyusagecork`
--

/*!50001 DROP VIEW IF EXISTS `countyusagecork`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `countyusagecork` AS select concat(`farmer`.`fName`,' ',`farmer`.`lName`) AS `Name`,`farmer`.`farmerID` AS `farmerID` from `farmer` where (`farmer`.`county` = 'Cork') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `countyusagewat`
--

/*!50001 DROP VIEW IF EXISTS `countyusagewat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `countyusagewat` AS select concat(`farmer`.`fName`,' ',`farmer`.`lName`) AS `Name`,`farmer`.`farmerID` AS `farmerID` from `farmer` where (`farmer`.`county` = 'Waterford') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `premiumprice`
--

/*!50001 DROP VIEW IF EXISTS `premiumprice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `premiumprice` AS select `chemical`.`nameChem` AS `nameChem`,`chemical`.`costLitre` AS `costLitre` from `chemical` */;
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

-- Dump completed on 2020-11-29 16:17:43
