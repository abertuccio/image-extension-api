-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: web_buddy
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

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
-- Current Database: `web_buddy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `web_buddy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `web_buddy`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `title` varchar(50) DEFAULT NULL COMMENT 'Titulo del articulo',
  `descriptions` varchar(500) DEFAULT NULL COMMENT 'descriptions del articulo',
  `quantity` int(9) DEFAULT NULL COMMENT 'Catidad de articulos',
  `url_article` int(11) NOT NULL COMMENT 'Clave primaria tabla articulos',
  `id_seller` int(11) NOT NULL COMMENT 'Clave primaria tabla Vendedores',
  `id_case` int(11) NOT NULL COMMENT 'Clave primaria tabla casos',
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de articulos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id_case` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `case_date` date NOT NULL COMMENT 'Fecha Inicio del Caso',
  `id_state` int(11) NOT NULL COMMENT 'Clave primaria tabla estados',
  PRIMARY KEY (`id_case`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=latin1 COMMENT='tabla de casos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,'2019-08-08',1111),(2,'2019-08-08',346),(3,'2019-08-08',346),(6,'2019-08-12',847389),(11,'2019-08-08',1111),(18,'2019-08-08',1111),(34,'2019-08-12',2),(35,'2019-08-12',2),(36,'2019-08-12',2),(37,'2019-08-12',2),(38,'2019-08-12',2),(39,'2019-08-12',2),(40,'2019-08-12',2),(41,'2019-08-12',2),(42,'2019-08-12',2),(43,'2019-08-12',2),(44,'2019-08-12',2),(48,'2019-08-13',2),(51,'2019-08-13',222222),(55,'2019-08-08',88888),(62,'2019-08-08',3456),(326,'2019-08-08',983),(333,'2019-08-12',847389),(348,'2019-08-12',2),(545,'2019-08-08',88888);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerPortals`
--

DROP TABLE IF EXISTS `customerPortals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerPortals` (
  `id_customer_portals` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `id_portal` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  PRIMARY KEY (`id_customer_portals`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Relacion de clientes y portales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerPortals`
--

LOCK TABLES `customerPortals` WRITE;
/*!40000 ALTER TABLE `customerPortals` DISABLE KEYS */;
INSERT INTO `customerPortals` VALUES (1,18,1),(2,17,2),(3,18,2),(4,1,2),(5,21,2);
/*!40000 ALTER TABLE `customerPortals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerUsers`
--

DROP TABLE IF EXISTS `customerUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerUsers` (
  `id_customer_users` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `id_user` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  PRIMARY KEY (`id_customer_users`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Relacion de clientes y usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerUsers`
--

LOCK TABLES `customerUsers` WRITE;
/*!40000 ALTER TABLE `customerUsers` DISABLE KEYS */;
INSERT INTO `customerUsers` VALUES (1,1,1),(2,2,2),(3,3,1);
/*!40000 ALTER TABLE `customerUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `company_name` varchar(50) DEFAULT NULL COMMENT 'nombre comercial',
  `Legal_contact_name` varchar(100) NOT NULL COMMENT 'nombre de usuario',
  `email` varchar(500) DEFAULT NULL COMMENT 'Correo electronico',
  `country` varchar(500) DEFAULT NULL COMMENT 'Pais',
  `active` int(2) DEFAULT '1' COMMENT 'cliente activo',
  `start_date` date DEFAULT NULL COMMENT 'Fecha alta de cliente',
  `lock_date` date DEFAULT NULL COMMENT 'Fecha bloque de cliente',
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='tabla de clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'JOICO','MARIANO JOICO','JOICO@JOICO.com','BRASIL',1,'2019-08-26',NULL),(2,'NIKE','MARIANO NIKE','NIKE@NIKE.com','NIKE',1,'2019-08-26',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portals`
--

DROP TABLE IF EXISTS `portals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portals` (
  `id_portal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `name` varchar(100) DEFAULT NULL COMMENT 'nombre ',
  `initials` varchar(10) DEFAULT NULL COMMENT 'Iniciales del portal',
  `url` varchar(1000) NOT NULL COMMENT 'nombre ',
  `country` varchar(500) DEFAULT NULL COMMENT 'Pais ',
  `script` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_portal`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='tabla de portales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portals`
--

LOCK TABLES `portals` WRITE;
/*!40000 ALTER TABLE `portals` DISABLE KEYS */;
INSERT INTO `portals` VALUES (1,'Instagram','','https://www.instagram.com','united states','instagram'),(2,'Mercado Libre','MLC','https://www.mercadolibre.cl','Chile','mercadolibre'),(3,'Mercado Libre','MCR','https://www.mercadolibre.co.cr','Costa Rica','mercadolibre'),(4,'Mercado Libre','MSV','https://www.mercadolibre.com.sv','Salvador','mercadolibre'),(5,'Mercado Libre','MPE','https://www.mercadolibre.com.pe','Perú','mercadolibre'),(6,'Mercado Libre','MBO','https://www.mercadolibre.com.bo','Bolivia','mercadolibre'),(7,'Mercado Libre','MPA','https://www.mercadolibre.com.pa','Panamá','mercadolibre'),(8,'Mercado Libre','MEC','https://www.mercadolibre.com.ec','Ecuador','mercadolibre'),(9,'Mercado Libre','MLV','https://www.mercadolibre.com.ve','Venezuela','mercadolibre'),(10,'Mercado Libre','MCO','https://www.mercadolibre.com.co','Colombia','mercadolibre'),(11,'Mercado Libre','MLU','https://www.mercadolibre.com.uy','Uruguay','mercadolibre'),(12,'Mercado Libre','MLB','https://www.mercadolivre.com.br','Brasil','mercadolibre'),(13,'Mercado Libre','MRD','https://www.mercadolibre.com.do','Dominicana','mercadolibre'),(14,'Mercado Libre','MGT','https://www.mercadolibre.com.gt','Guatemala','mercadolibre'),(15,'Mercado Libre','MNI','https://www.mercadolibre.com.ni','Nicaragua','mercadolibre'),(16,'Mercado Libre','MHN','https://www.mercadolibre.com.hn','Honduras','mercadolibre'),(17,'Mercado Libre','MLA','https://www.mercadolibre.com.ar','Argentina','mercadolibre'),(18,'Mercado Libre','MLM','https://www.mercadolibre.com.mx','México','mercadolibre'),(19,'Mercado Libre','MPY','https://www.mercadolibre.com.py','Paraguay','mercadolibre'),(20,'Aliexpress','','https://es.aliexpress.com','united states','aliexpress'),(21,'Alibaba','','https://www.alibaba.com','united states','alibaba');
/*!40000 ALTER TABLE `portals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id_search` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `search_name` varchar(50) DEFAULT NULL COMMENT 'nombre ',
  `active_search` int(11) DEFAULT '1' COMMENT 'busqueda activa',
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_search`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de Busquedas de casos o posibles casos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `name` varchar(50) DEFAULT NULL COMMENT 'nombre ',
  `descriptions` varchar(500) DEFAULT NULL COMMENT 'descriptions del articulo',
  PRIMARY KEY (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de estados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `username` varchar(100) NOT NULL COMMENT 'nombre de usuario',
  `password` varchar(1000) DEFAULT NULL,
  `random` varchar(1000) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL COMMENT 'nombre de usuario',
  `last_name` varchar(100) NOT NULL COMMENT 'nombre de usuario',
  `token` varchar(1000) DEFAULT NULL,
  `token_time` varchar(500) DEFAULT NULL,
  `token_active` int(11) DEFAULT '0' COMMENT 'token ativos = 1, desactivo = 0',
  `session_failed_attempts` int(11) DEFAULT '0',
  `last_login` date DEFAULT NULL COMMENT 'Fecha ultimo login',
  `last_login_failed` date DEFAULT NULL COMMENT 'Fecha ultimo intento fallido de login',
  `email` varchar(500) DEFAULT NULL COMMENT 'Correo electronico',
  `start_date` date NOT NULL COMMENT 'Fecha alta',
  `active` int(2) DEFAULT '1' COMMENT 'usuarios ativos = 1 desactivos, temporalmente = 2, eliminados = 0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='tabla de users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'JLOBASSO','2f16cbe3b8371cf87e5524f8848a0a66492091ac705cd67e43d1ec54b5b7cfd1','0663120444656','Jorge','Lobasso','8df64ccdef4bb09d574112e6902e8537229fd390bfbf7b3e80dd3f86325bf5bfb310352145bf71db928f0bad8a9b9af5bc6b7de71b129c27e2bddc8513a3c3e1','1566837916537',1,0,'2019-08-26',NULL,'jlobasso@gmail.com','2019-08-26',1),(2,'DLOBASSO','0096da3e446c399184cc680cf86ce8dd151b6a077b234d35dedeb9aec58f4d0b','154226301242','Danna','Lobasso','','',0,0,'2019-08-26','2019-08-26','danna@gmail.com','2019-08-26',1),(3,'ABERTUCCIO','591374d1da6594f8e0bf3478d75780e0998c8f1a09b929df38973c9780a3c69c','22555621361603','ANDRES','BERTUCCIO',NULL,NULL,0,0,NULL,NULL,'ANDRESBERTUCCIO@gmail.com','2019-08-26',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 15:39:16
