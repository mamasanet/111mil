-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: agrosrl
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campo`
--

DROP TABLE IF EXISTS `campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campo` (
  `idCampo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `superficie` float NOT NULL,
  `idestadoCampo` int(11) NOT NULL,
  PRIMARY KEY (`idCampo`,`idestadoCampo`),
  KEY `fk_Campo_EstadoCampo1_idx` (`idestadoCampo`),
  CONSTRAINT `fk_Campo_EstadoCampo1` FOREIGN KEY (`idestadoCampo`) REFERENCES `estadocampo` (`idestadoCampo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campo`
--

LOCK TABLES `campo` WRITE;
/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` VALUES (1,'Paula',20,1),(2,'Lucia',12,1),(3,'Juana',10,1),(4,'La Posta',5,1);
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivo`
--

DROP TABLE IF EXISTS `cultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultivo` (
  `idCultivo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCultivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivo`
--

LOCK TABLES `cultivo` WRITE;
/*!40000 ALTER TABLE `cultivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocampo`
--

DROP TABLE IF EXISTS `estadocampo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocampo` (
  `idestadoCampo` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestadoCampo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocampo`
--

LOCK TABLES `estadocampo` WRITE;
/*!40000 ALTER TABLE `estadocampo` DISABLE KEYS */;
INSERT INTO `estadocampo` VALUES (1,'Creado'),(2,'Parcialmente trabajado'),(3,'Completamente trabajado'),(4,'Desuso'),(5,'Final');
/*!40000 ALTER TABLE `estadocampo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoproyecto`
--

DROP TABLE IF EXISTS `estadoproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoproyecto` (
  `idEstadoProyecto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadoProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoproyecto`
--

LOCK TABLES `estadoproyecto` WRITE;
/*!40000 ALTER TABLE `estadoproyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboreocultivo`
--

DROP TABLE IF EXISTS `laboreocultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboreocultivo` (
  `idLaboreoCultiivo` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `idMomentoLaboreo` int(11) NOT NULL,
  `idTipoLaboreo` int(11) NOT NULL,
  `idCultivo` int(11) NOT NULL,
  `idMomento` int(11) NOT NULL,
  PRIMARY KEY (`idLaboreoCultiivo`,`idCultivo`,`idTipoLaboreo`,`idMomento`),
  KEY `fk_LaboreoCultiivo_Cultivo1_idx` (`idCultivo`),
  KEY `fk_LaboreoCultiivo_TipoLaboreo1_idx` (`idTipoLaboreo`),
  KEY `fk_LaboreoCultiivo_Momento1_idx` (`idMomento`),
  CONSTRAINT `fk_LaboreoCultiivo_Cultivo1` FOREIGN KEY (`idCultivo`) REFERENCES `cultivo` (`idCultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LaboreoCultiivo_Momento1` FOREIGN KEY (`idMomento`) REFERENCES `momento` (`idMomento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LaboreoCultiivo_TipoLaboreo1` FOREIGN KEY (`idTipoLaboreo`) REFERENCES `tipolaboreo` (`idTipoLaboreo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboreocultivo`
--

LOCK TABLES `laboreocultivo` WRITE;
/*!40000 ALTER TABLE `laboreocultivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboreocultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `superficie` float unsigned NOT NULL,
  `idCampo` int(11) NOT NULL,
  `idTipoSuelo` int(11) NOT NULL,
  PRIMARY KEY (`idLote`,`idCampo`,`idTipoSuelo`),
  KEY `fk_Lote_Campo_idx` (`idCampo`),
  KEY `fk_Lote_TipoSuelo1_idx` (`idTipoSuelo`),
  CONSTRAINT `fk_Lote_Campo` FOREIGN KEY (`idCampo`) REFERENCES `campo` (`idCampo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lote_TipoSuelo1` FOREIGN KEY (`idTipoSuelo`) REFERENCES `tiposuelo` (`id_tipo_suelo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,1,20,1,2),(2,1,12,2,2),(3,1,5,3,2),(4,2,5,3,3),(5,1,5,4,2);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `momento`
--

DROP TABLE IF EXISTS `momento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `momento` (
  `idMomento` int(11) NOT NULL,
  `momento` varchar(45) NOT NULL,
  PRIMARY KEY (`idMomento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `momento`
--

LOCK TABLES `momento` WRITE;
/*!40000 ALTER TABLE `momento` DISABLE KEYS */;
/*!40000 ALTER TABLE `momento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `idLote` int(11) NOT NULL,
  `idCultivo` int(11) NOT NULL,
  `idEstadoProyecto` int(11) NOT NULL,
  PRIMARY KEY (`idProyecto`,`idLote`,`idCultivo`,`idEstadoProyecto`),
  KEY `fk_Proyecto_Lote1_idx` (`idLote`),
  KEY `fk_Proyecto_Cultivo1_idx` (`idCultivo`),
  KEY `fk_Proyecto_EstadoProyecto1_idx` (`idEstadoProyecto`),
  CONSTRAINT `fk_Proyecto_Cultivo1` FOREIGN KEY (`idCultivo`) REFERENCES `cultivo` (`idCultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_EstadoProyecto1` FOREIGN KEY (`idEstadoProyecto`) REFERENCES `estadoproyecto` (`idEstadoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Lote1` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipolaboreo`
--

DROP TABLE IF EXISTS `tipolaboreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipolaboreo` (
  `idTipoLaboreo` int(11) NOT NULL,
  `labor` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoLaboreo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipolaboreo`
--

LOCK TABLES `tipolaboreo` WRITE;
/*!40000 ALTER TABLE `tipolaboreo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipolaboreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipolaboreo_has_proyecto`
--

DROP TABLE IF EXISTS `tipolaboreo_has_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipolaboreo_has_proyecto` (
  `id_TipoLaboreo` int(11) NOT NULL,
  `id_Proyecto` int(11) NOT NULL,
  PRIMARY KEY (`id_TipoLaboreo`,`id_Proyecto`),
  KEY `fk_TipoLaboreo_has_Proyecto_Proyecto1_idx` (`id_Proyecto`),
  KEY `fk_TipoLaboreo_has_Proyecto_TipoLaboreo1_idx` (`id_TipoLaboreo`),
  CONSTRAINT `fk_TipoLaboreo_has_Proyecto_Proyecto1` FOREIGN KEY (`id_Proyecto`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoLaboreo_has_Proyecto_TipoLaboreo1` FOREIGN KEY (`id_TipoLaboreo`) REFERENCES `tipolaboreo` (`idTipoLaboreo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipolaboreo_has_proyecto`
--

LOCK TABLES `tipolaboreo_has_proyecto` WRITE;
/*!40000 ALTER TABLE `tipolaboreo_has_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipolaboreo_has_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposuelo`
--

DROP TABLE IF EXISTS `tiposuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposuelo` (
  `id_tipo_suelo` int(11) NOT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_suelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposuelo`
--

LOCK TABLES `tiposuelo` WRITE;
/*!40000 ALTER TABLE `tiposuelo` DISABLE KEYS */;
INSERT INTO `tiposuelo` VALUES (1,'I','Húmífero'),(2,'II','Limoso'),(3,'III','De turba'),(4,'IV','Salino'),(5,'V','Arenoso');
/*!40000 ALTER TABLE `tiposuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposuelo_has_cultivo`
--

DROP TABLE IF EXISTS `tiposuelo_has_cultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposuelo_has_cultivo` (
  `idTipoSuelo` int(11) NOT NULL,
  `idCultivo` int(11) NOT NULL,
  PRIMARY KEY (`idTipoSuelo`,`idCultivo`),
  KEY `fk_TipoSuelo_has_Cultivo_Cultivo1_idx` (`idCultivo`),
  KEY `fk_TipoSuelo_has_Cultivo_TipoSuelo1_idx` (`idTipoSuelo`),
  CONSTRAINT `fk_TipoSuelo_has_Cultivo_Cultivo1` FOREIGN KEY (`idCultivo`) REFERENCES `cultivo` (`idCultivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoSuelo_has_Cultivo_TipoSuelo1` FOREIGN KEY (`idTipoSuelo`) REFERENCES `tiposuelo` (`id_tipo_suelo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposuelo_has_cultivo`
--

LOCK TABLES `tiposuelo_has_cultivo` WRITE;
/*!40000 ALTER TABLE `tiposuelo_has_cultivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposuelo_has_cultivo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-17  9:59:48
