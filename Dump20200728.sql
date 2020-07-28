CREATE DATABASE  IF NOT EXISTS `canil` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `canil`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: canil
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `adestramento`
--

DROP TABLE IF EXISTS `adestramento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adestramento` (
  `MENCAO` varchar(30) DEFAULT NULL,
  `PERIODO_ADES` varchar(30) DEFAULT NULL,
  `COD_TREINADOR` int DEFAULT NULL,
  `PEDIGREE` int DEFAULT NULL,
  KEY `FK_TREINADOR` (`COD_TREINADOR`),
  KEY `FK_CAO4` (`PEDIGREE`),
  CONSTRAINT `FK_CAO4` FOREIGN KEY (`PEDIGREE`) REFERENCES `cao` (`PEDIGREE`),
  CONSTRAINT `FK_TREINADOR` FOREIGN KEY (`COD_TREINADOR`) REFERENCES `treinador` (`COD_TREINADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adestramento`
--

LOCK TABLES `adestramento` WRITE;
/*!40000 ALTER TABLE `adestramento` DISABLE KEYS */;
INSERT INTO `adestramento` VALUES ('A','6 MESES',1,1),('B','10 MESES',2,2);
/*!40000 ALTER TABLE `adestramento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cao`
--

DROP TABLE IF EXISTS `cao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cao` (
  `PEDIGREE` int NOT NULL,
  `NOME` varchar(30) DEFAULT NULL,
  `SOBRENOME` varchar(30) DEFAULT NULL,
  `COR` varchar(20) DEFAULT NULL,
  `DATANASC` date DEFAULT NULL,
  `COD_RACA` int DEFAULT NULL,
  `PAIS` int DEFAULT NULL,
  PRIMARY KEY (`PEDIGREE`),
  KEY `FK_RACA` (`COD_RACA`),
  KEY `FK_PAIS` (`PAIS`),
  CONSTRAINT `FK_PAIS` FOREIGN KEY (`PAIS`) REFERENCES `cao` (`PEDIGREE`),
  CONSTRAINT `FK_RACA` FOREIGN KEY (`COD_RACA`) REFERENCES `raca` (`COD_RACA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cao`
--

LOCK TABLES `cao` WRITE;
/*!40000 ALTER TABLE `cao` DISABLE KEYS */;
INSERT INTO `cao` VALUES (1,'MAX','FRETIAS','BRANCO','2015-10-13',1,NULL),(2,'FRED','MORAIS','PRETO','2010-08-20',3,NULL),(3,'NINA','SILVA','BEGE','2017-06-03',2,NULL),(4,'SNOOP','GOMES','BRANCO','2014-07-11',1,NULL),(5,'TINO','SOUZA','PRETO','2018-11-07',3,NULL),(6,'BLUE','ABREU','BEGE','2013-03-18',2,NULL);
/*!40000 ALTER TABLE `cao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cao_competicao`
--

DROP TABLE IF EXISTS `cao_competicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cao_competicao` (
  `COLOCACAO` int DEFAULT NULL,
  `PEDIGREE` int DEFAULT NULL,
  `COD_COMPETICAO` int DEFAULT NULL,
  KEY `FK_cao2` (`PEDIGREE`),
  KEY `FK_COMPETICAO` (`COD_COMPETICAO`),
  CONSTRAINT `FK_cao2` FOREIGN KEY (`PEDIGREE`) REFERENCES `cao` (`PEDIGREE`),
  CONSTRAINT `FK_COMPETICAO` FOREIGN KEY (`COD_COMPETICAO`) REFERENCES `competicao` (`COD_COMPETICAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cao_competicao`
--

LOCK TABLES `cao_competicao` WRITE;
/*!40000 ALTER TABLE `cao_competicao` DISABLE KEYS */;
INSERT INTO `cao_competicao` VALUES (1,1,10),(2,3,10),(3,4,10),(1,6,20),(2,2,20),(3,5,20),(1,1,30),(2,6,30),(3,2,30);
/*!40000 ALTER TABLE `cao_competicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `NOME` varchar(30) DEFAULT NULL,
  `ENDERECO` varchar(50) DEFAULT NULL,
  `TELEFONE` int DEFAULT NULL,
  `IDEN_CLIENTE` int NOT NULL,
  PRIMARY KEY (`IDEN_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('RICARDO','CASA FORTE',998704050,1),('JOAO','ENCRUZILHADA',988704560,2),('MARCIO','PIEDADE',987654433,3),('FRANCISCO','CASA FORTE',988447788,4);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competicao`
--

DROP TABLE IF EXISTS `competicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competicao` (
  `COD_COMPETICAO` int NOT NULL,
  `DATA_DE_REALIZACAO` date DEFAULT NULL,
  `DESCRICAO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_COMPETICAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competicao`
--

LOCK TABLES `competicao` WRITE;
/*!40000 ALTER TABLE `competicao` DISABLE KEYS */;
INSERT INTO `competicao` VALUES (10,'2020-02-10','CORRIDA '),(20,'2019-03-11','SALTOS '),(30,'2018-11-03','ADESTRAMENTO');
/*!40000 ALTER TABLE `competicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_venda`
--

DROP TABLE IF EXISTS `compra_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_venda` (
  `VALOR_DA_COMPRA` double DEFAULT NULL,
  `PEDIGREE` int DEFAULT NULL,
  `IDEN_CLIENTE` int DEFAULT NULL,
  KEY `FK_cao` (`PEDIGREE`),
  KEY `FK_CLIENTE` (`IDEN_CLIENTE`),
  CONSTRAINT `FK_cao` FOREIGN KEY (`PEDIGREE`) REFERENCES `cao` (`PEDIGREE`),
  CONSTRAINT `FK_CLIENTE` FOREIGN KEY (`IDEN_CLIENTE`) REFERENCES `cliente` (`IDEN_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_venda`
--

LOCK TABLES `compra_venda` WRITE;
/*!40000 ALTER TABLE `compra_venda` DISABLE KEYS */;
INSERT INTO `compra_venda` VALUES (100,1,1),(500,2,2),(300,3,3);
/*!40000 ALTER TABLE `compra_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raca`
--

DROP TABLE IF EXISTS `raca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raca` (
  `COD_RACA` int NOT NULL,
  `VALOR` double DEFAULT NULL,
  `PESO` double DEFAULT NULL,
  `TAMANHO` double DEFAULT NULL,
  `NOME` varchar(30) DEFAULT NULL,
  `CARAC_GERAIS` mediumtext,
  PRIMARY KEY (`COD_RACA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raca`
--

LOCK TABLES `raca` WRITE;
/*!40000 ALTER TABLE `raca` DISABLE KEYS */;
INSERT INTO `raca` VALUES (1,100,25,25,'WORKSHIRE','CAES MUITO DOCEIS'),(2,300,40,45,'MALTES','SEU PELO NORMALMENTE É BRANCO'),(3,500,50,60,'PASTOR ALEMAO','BONS CAES DE GUARDA');
/*!40000 ALTER TABLE `raca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinador`
--

DROP TABLE IF EXISTS `treinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treinador` (
  `COD_TREINADOR` int NOT NULL,
  `NOME` varchar(30) DEFAULT NULL,
  `ENDERECO` varchar(50) DEFAULT NULL,
  `TELEFONE` int DEFAULT NULL,
  PRIMARY KEY (`COD_TREINADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinador`
--

LOCK TABLES `treinador` WRITE;
/*!40000 ALTER TABLE `treinador` DISABLE KEYS */;
INSERT INTO `treinador` VALUES (1,'FELIPE','TORRE',980901122),(2,'PAULO','BOA VIAGEM',997654434);
/*!40000 ALTER TABLE `treinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacina`
--

DROP TABLE IF EXISTS `vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacina` (
  `COD_VACINA` int NOT NULL,
  `TIPO_VACINA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`COD_VACINA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacina`
--

LOCK TABLES `vacina` WRITE;
/*!40000 ALTER TABLE `vacina` DISABLE KEYS */;
INSERT INTO `vacina` VALUES (1,'V8'),(2,'V10');
/*!40000 ALTER TABLE `vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacinacao`
--

DROP TABLE IF EXISTS `vacinacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacinacao` (
  `DATA_APLICACAO` date DEFAULT NULL,
  `PEDIGREE` int DEFAULT NULL,
  `COD_VACINA` int DEFAULT NULL,
  KEY `FK_CAO3` (`PEDIGREE`),
  KEY `FK_VACINA` (`COD_VACINA`),
  CONSTRAINT `FK_CAO3` FOREIGN KEY (`PEDIGREE`) REFERENCES `cao` (`PEDIGREE`),
  CONSTRAINT `FK_VACINA` FOREIGN KEY (`COD_VACINA`) REFERENCES `vacina` (`COD_VACINA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacinacao`
--

LOCK TABLES `vacinacao` WRITE;
/*!40000 ALTER TABLE `vacinacao` DISABLE KEYS */;
INSERT INTO `vacinacao` VALUES ('2020-01-10',4,1),('2019-10-23',5,2);
/*!40000 ALTER TABLE `vacinacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-28 12:31:05
