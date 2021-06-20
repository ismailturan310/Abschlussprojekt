-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: flug_tickets
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bucht`
--

DROP TABLE IF EXISTS `bucht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bucht` (
  `t_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`t_id`,`p_id`),
  KEY `fk_person_bucht` (`p_id`),
  CONSTRAINT `fk_buchen_ticket` FOREIGN KEY (`t_id`) REFERENCES `info_tickets` (`tickets_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_person_bucht` FOREIGN KEY (`p_id`) REFERENCES `personen` (`personen_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bucht`
--

LOCK TABLES `bucht` WRITE;
/*!40000 ALTER TABLE `bucht` DISABLE KEYS */;
/*!40000 ALTER TABLE `bucht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fluggesellschaft`
--

DROP TABLE IF EXISTS `fluggesellschaft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fluggesellschaft` (
  `flug_name` varchar(255) DEFAULT NULL,
  `nam_kuerzel` varchar(255) NOT NULL,
  `fluge_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fluge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fluggesellschaft`
--

LOCK TABLES `fluggesellschaft` WRITE;
/*!40000 ALTER TABLE `fluggesellschaft` DISABLE KEYS */;
INSERT INTO `fluggesellschaft` VALUES ('Turkish Airlines','THY',1),('Austrian Airlines','OS',2),('Pegasus Airline','PGT',3),('Sun Express','XG',4),('United Airlines','UA',5);
/*!40000 ALTER TABLE `fluggesellschaft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_tickets`
--

DROP TABLE IF EXISTS `info_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_tickets` (
  `tickets_id` int(11) NOT NULL AUTO_INCREMENT,
  `Reiseziel` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `abfahrt` date DEFAULT NULL,
  `flug_id` int(11) NOT NULL,
  PRIMARY KEY (`tickets_id`),
  KEY `fk_von_flug` (`flug_id`),
  CONSTRAINT `fk_von_flug` FOREIGN KEY (`flug_id`) REFERENCES `fluggesellschaft` (`fluge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_tickets`
--

LOCK TABLES `info_tickets` WRITE;
/*!40000 ALTER TABLE `info_tickets` DISABLE KEYS */;
INSERT INTO `info_tickets` VALUES (1,'Istanbul','Economy CLass',250,'2021-07-21',1),(2,'Istanbul','First Class',650,'2021-07-02',1),(3,'Antalya','Bussiness Class',450,'2021-07-25',1),(4,'Madrid','Economy Class',230,'2021-07-15',1),(5,'Athen','Economy Class',260,'2021-07-08',1),(6,'London','Economy Class',350,'2021-07-13',1),(7,'Tokyo','Bussiness Class',950,'2021-08-16',1),(8,'Tokyo','Economy Class',650,'2021-08-02',1),(9,'Madrid','Bussiness Class',450,'2021-08-12',2),(10,'Istanbul','Economy Class',230,'2021-08-22',2),(11,'Madrid','Economy Class',240,'2021-08-24',2),(12,'Antalya','Bussiness Class',210,'2021-08-25',2),(13,'London','Economy Class',299,'2021-08-27',2),(14,'Tokyo','Economy Class',599,'2021-08-28',2),(15,'New York City','Economy Class',899,'2021-08-14',2),(16,'New York City','First Class',1499,'2021-08-16',2),(17,'Istanbul','Economy Class',269,'2021-07-18',3),(18,'Antalya','Bussiness Class',250,'2021-07-05',3),(19,'Madrid','First Class',799,'2021-08-01',3),(20,'Madrid','First Class',739,'2021-08-21',3),(21,'Athen','Economy Class',229,'2021-07-16',3),(22,'Athen','Bussiness Class',529,'2021-08-16',3),(23,'London','Bussiness Class',649,'2021-08-02',3),(24,'Tokyo','Bussiness Class',639,'2021-08-12',3),(25,'Istanbul','First Class',649,'2021-08-14',4),(26,'Istanbul','First Class',739,'2021-08-28',4),(27,'Antalya','First Class',839,'2021-08-30',4),(28,'Madrid','First Class',819,'2021-08-04',4),(29,'Athen','Economy Class',279,'2021-08-08',4),(30,'London','First Class',890,'2021-08-09',4),(31,'London','First Class',919,'2021-08-11',4),(32,'Tokyo','Economy Class',650,'2021-07-29',4),(33,'Antalya','First Class',749,'2021-07-30',5),(34,'London','Economy Class',239,'2021-07-19',5),(35,'Tokyo','Economy Class',630,'2021-07-17',5),(36,'Tokyo','First Class',1099,'2021-07-15',5),(37,'New York City','Economy Class',650,'2021-07-13',5),(38,'Madrid','Economy Class',230,'2021-07-07',5),(39,'Istanbul','Economy Class',279,'2021-07-08',5),(40,'Istanbul','First Class',799,'2021-07-15',5);
/*!40000 ALTER TABLE `info_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personen`
--

DROP TABLE IF EXISTS `personen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personen` (
  `vorname` varchar(255) DEFAULT NULL,
  `nachname` varchar(255) DEFAULT NULL,
  `alter_` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personen_id` int(11) NOT NULL AUTO_INCREMENT,
  `telefonnummer` int(11) DEFAULT NULL,
  PRIMARY KEY (`personen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personen`
--

LOCK TABLES `personen` WRITE;
/*!40000 ALTER TABLE `personen` DISABLE KEYS */;
INSERT INTO `personen` VALUES ('ismail','turan',12,'asd',11,13232),('ismail','turan',19,'lsaöd',12,1233);
/*!40000 ALTER TABLE `personen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19 23:56:06
