CREATE DATABASE  IF NOT EXISTS `Vetrina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Vetrina`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: Vetrina
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Conoscenza dei linguaggi di programmazione.','Programmazione'),(2,'Conoscenza di linguaggi di programmazione orientata agli oggetti.','Programmazione ad Oggetti'),(3,'Conoscenza del linguaggio Web.','Programmazione Web'),(4,'Capacità di realizzare un Database e strutturarlo nel modo appropriato.','Creazione e strutturazione dei Database');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_skills`
--

DROP TABLE IF EXISTS `categoria_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_skills` (
  `categoria_id` bigint NOT NULL,
  `skills_id` bigint NOT NULL,
  UNIQUE KEY `UK_fwlg4xect7v6b604fqbl9cw89` (`skills_id`),
  KEY `FKb71fkct8prbdsn4xifvwf1x43` (`categoria_id`),
  CONSTRAINT `FKb71fkct8prbdsn4xifvwf1x43` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FKgja5lvv51c0xf2xturce91cv7` FOREIGN KEY (`skills_id`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_skills`
--

LOCK TABLES `categoria_skills` WRITE;
/*!40000 ALTER TABLE `categoria_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Un primo progetto utilizzando SpringBoot.','SpringBoot','https://github.com/ChrisBafax/EsercitazioneSpringBoot'),(2,'Un progetto in cui introduciamo i RestController, sempre usando SpringBoot.','SpringBootRest','https://github.com/ChrisBafax/EsercitazioneSpringBootRest'),(3,'Un progetto dove lavoriamo con le DAO.','Esercitazione DAO','https://github.com/ChrisBafax/EsercitazioneBE'),(4,'Un progetto completo tramite REST riguardo un ambiente scolastico, utilizzando l\'autenticazione crittografata.','Scuola','https://github.com/ChrisBafax/Esercitazione1'),(5,'Un progetto base usando SpringJSP rigurado a delle info su un sito web con relativa modifica, creazione ed eliminazione.','SpringJsp','https://github.com/ChrisBafax/SpringJsp');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Linguaggio di programmazion C.','Linguaggio C'),(2,'Linguaggio orientato agli oggetti C++','Linguaggio C++'),(3,'Linguaggio orientato agli oggetti Java','Linguaggio Java'),(4,'Linguaggio per la scrittura di pagine Web','HTML'),(5,'Linguaggio per la stilizzazione delle pagine Web','CSS'),(6,'Linguaggio per la creazione e l\'uso dei database.','SQL');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_categoria`
--

DROP TABLE IF EXISTS `skills_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills_categoria` (
  `categoria_id` bigint DEFAULT NULL,
  `skill_id` bigint NOT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `FKjris56cxxe5ryr7q7f4ikeumf` (`categoria_id`),
  CONSTRAINT `FK9lxq7m3v06nenl6xriyr900xv` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  CONSTRAINT `FKjris56cxxe5ryr7q7f4ikeumf` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_categoria`
--

LOCK TABLES `skills_categoria` WRITE;
/*!40000 ALTER TABLE `skills_categoria` DISABLE KEYS */;
INSERT INTO `skills_categoria` VALUES (1,1),(2,2),(2,3),(3,4),(3,5),(4,6);
/*!40000 ALTER TABLE `skills_categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-16 16:22:54
