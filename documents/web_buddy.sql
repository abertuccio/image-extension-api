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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `web_buddy` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='Relacion de clientes y portales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerPortals`
--

LOCK TABLES `customerPortals` WRITE;
/*!40000 ALTER TABLE `customerPortals` DISABLE KEYS */;
INSERT INTO `customerPortals` VALUES (1,18,1),(2,17,2),(3,18,2),(4,1,2),(5,21,2),(6,17,3),(7,1,11),(8,1,12),(9,1,13),(10,1,17),(11,1,18),(12,1,19),(13,1,20),(14,1,22),(15,7,24),(16,1,24);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Relacion de clientes y usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerUsers`
--

LOCK TABLES `customerUsers` WRITE;
/*!40000 ALTER TABLE `customerUsers` DISABLE KEYS */;
INSERT INTO `customerUsers` VALUES (1,1,1),(2,2,2),(3,3,1),(4,12,2),(5,13,5),(6,14,24);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='tabla de clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'JOICO','MARIANO JOICO','JOICO@JOICO.com','BRASIL',1,'2019-08-26',NULL),(2,'NIKE','MARIANO NIKE','NIKE@NIKE.com','NIKE',1,'2019-08-26',NULL),(4,'ADIDAS','PEDRO ADIDAS','ADIDAS@ADIDAS.com','US',1,'2019-08-27',NULL),(5,'SEDAL','MARCOS SEDAL','SEDAL@SEDAL.com','ARGENTINA',1,'2019-08-27',NULL),(19,'TOPER','TOTO TOPER','TOPER@TOPER.com','ARGENTINA',1,'2019-08-27',NULL),(22,'PUMA','EL NEGRO PUMA','PUMA@PUMA.com','ARGENTINA',1,'2019-08-27',NULL),(23,'rosamonte','marta rosamonte','rosamonte@rosamonte.com','Argentina',1,'2019-08-28',NULL),(24,'PULPOU','gabriel Pascualini','magalu@magazineluiza.com.br','Brasil',1,'2019-09-03',NULL);
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
  `portal_name` varchar(100) NOT NULL COMMENT 'nombre ',
  `domain` varchar(1000) NOT NULL COMMENT 'dominio del sitio',
  `country` varchar(100) DEFAULT NULL COMMENT 'Pais',
  `portal_folder_name` varchar(100) NOT NULL,
  `script_name` varchar(45) NOT NULL,
  `general_styles` varchar(45) DEFAULT NULL,
  `regex` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_portal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='tabla de portales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portals`
--

LOCK TABLES `portals` WRITE;
/*!40000 ALTER TABLE `portals` DISABLE KEYS */;
INSERT INTO `portals` VALUES (1,'Instagram','instagram.com',NULL,'instagram','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?instagram.com(([/]{1}).*)?)$'),(2,'Mercado Libre','mercadolibre.com',NULL,'mercadolibre','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?mercadoli[b|v]re.([a-z]{2,4})(([.]{1}[a-z]{0,4})?)(([/]{1}).*)?)$'),(3,'Aliexpress','aliexpress.com',NULL,'aliexpress','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?magazineluiza.com.br(([/]{1}).*)?)$'),(4,'Amazon','amazon.com',NULL,'amazon','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?amazon.com(([/]{1}).*)?)$'),(5,'Alibaba','alibaba.com',NULL,'alibaba','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?dx.com(([/]{1}).*)?)$'),(6,'Deal extreme','dx.com',NULL,'dealextreme','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?alibaba.com(([/]{1}).*)?)$'),(7,'Magalu','magazineluiza.com.br',NULL,'magalu','generalActions','generalStyles','^(http([s]?)://([w]{3}[.]]?)?aliexpress.com(([/]{1}).*)?)$');
/*!40000 ALTER TABLE `portals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexDomains`
--

DROP TABLE IF EXISTS `regexDomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexDomains` (
  `id_regexDomain` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `script_name` varchar(100) NOT NULL,
  `regex` varchar(500) DEFAULT NULL COMMENT 'Expresiones Regulares para validar el dominio',
  `id_portal` int(11) NOT NULL,
  `country` varchar(500) DEFAULT NULL COMMENT 'Pais',
  `language` varchar(500) DEFAULT NULL COMMENT 'Lenguaje',
  `category` varchar(45) NOT NULL DEFAULT 'PORTAL',
  `folder_name` varchar(45) NOT NULL DEFAULT 'portal',
  `category_styles` varchar(45) DEFAULT NULL,
  `styles_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_regexDomain`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexDomains`
--

LOCK TABLES `regexDomains` WRITE;
/*!40000 ALTER TABLE `regexDomains` DISABLE KEYS */;
INSERT INTO `regexDomains` VALUES (8,'list','^(http([s]?)://([w]{3}[.]]?)?instagram.com/explore(([/]{1}).*)?)$',1,'united states','multi','LIST','list','',NULL),(9,'product','^(http([s]?)://([w]{3}[.]]?)?instagram.com/p(([/]{1}).*)?)$',1,'united states','multi','PRODUCT','product','',NULL),(10,'list','^(http([s]?)://([w]{3}[.]]?)?magazineluiza.com.br/.*(/l/)(.*)?)$',7,'Brasil','pt','LIST','list','',NULL),(11,'product','^(http([s]?)://([w]{3}[.]]?)?magazineluiza.com.br/.*(/p/)(.*)?)$',7,'Brasil','pt','PRODUCT','product','',NULL),(12,'search','^(http([s]?)://([w]{3}[.]]?)?magazineluiza.com.br/.*(/.*/s/)(.*)?)$',7,'Brasil','pt','LIST','list','',NULL),(13,'search','^(http([s]?)://(busca.{1})magazineluiza.com.br/(.*)?)$',7,'Brasil','pt','LIST','list','',NULL),(14,'list','^(http([s]?)://([w]{3}[.]]?)?magazineluiza.com.br/(selecao/)(.*)?)$',7,'Brasil','pt','LIST','list','',NULL);
/*!40000 ALTER TABLE `regexDomains` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='tabla de users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'JLOBASSO','2f16cbe3b8371cf87e5524f8848a0a66492091ac705cd67e43d1ec54b5b7cfd1','0663120444656','Jorge','Lobasso','1d064be5ecbf6d485fa33265be4aa0077ac3e1a2010559756f74db306fe6c7ad6e6b47a70797af5277dd8167b4702a0726d8e2d8c6ee12e66a9139ab78e2a2bd','1566911091311',1,0,'2019-08-27',NULL,'jlobasso@gmail.com','2019-08-26',1),(2,'DLOBASSO','0096da3e446c399184cc680cf86ce8dd151b6a077b234d35dedeb9aec58f4d0b','154226301242','Danna','Lobasso','c01d546d5a76946a30b3e57147037b813ff061d5fef0a9cdf25762fd1a5de0e647af793cfbf159e4ee878b253ad4d682711d08ce4607160194d04c5fe92782ac','1567525547142',1,0,'2019-09-03','2019-08-26','danna@gmail.com','2019-08-26',1),(3,'ABERTUCCIO','591374d1da6594f8e0bf3478d75780e0998c8f1a09b929df38973c9780a3c69c','22555621361603','ANDRES','BERTUCCIO','97bb7be061b16552345ab55d4f758646e829653ebf4c0e97b202f78a76bcaab8c2dfecb685ed4f5d34236f7dbc1aab92aad09b0cf06d19a62af99a79ab686d2e','1566911259290',1,0,'2019-08-27',NULL,'ANDRESBERTUCCIO@gmail.com','2019-08-26',1),(4,'JORGE','976bf58a3ec9bffb5725997b7c65166b1fa408f7424bd33809dcdc25a96e3dd8','2335240524301','JORGE','JORGE',NULL,NULL,0,0,NULL,NULL,'jorge@gmail.com','2019-08-27',1),(5,'ANDRES','9a0723db150eff0070fbc66819073b5655721361c644ab03248fb180fd564862','155240624031','ANDRES','ANDRES',NULL,NULL,0,0,NULL,NULL,'andres@gmail.com','2019-08-27',1),(6,'PEDRO','64537fb442eb6d5042498a2197787ef30296aca2af37d5516f14c2bf6f0c9b7d','23646142015144','PEDRO','PEDRO',NULL,NULL,0,0,NULL,NULL,'pedro@gmail.com','2019-08-27',1),(7,'DANTE','5c68ec8d290fbdffdd208df5e99c07989c4cc6b443fae68a94e908a2426bb569','0421041031433','DANTE','DANTE',NULL,NULL,0,0,NULL,NULL,'dante@gmail.com','2019-08-27',1),(12,'DANNA','a552e956f6b640215a713e5f9ee49d5b19929a8b3c147f9f2252411d13049558','4150141363205','DANNA','DANNA',NULL,NULL,0,0,NULL,NULL,'dannal@gmail.com','2019-08-27',1),(13,'LUCI','a0bd832b51b365bceda55f919a22608071f2d02ea259824a6bb16febd3895d92','1305521241644','LUCI','LUCI',NULL,NULL,0,0,NULL,NULL,'luci@gmail.com','2019-08-28',1),(14,'GABY','e77bda05d8e2b454f1edd8df1d750020c9de185dc0ab669f2ee74d0dcb59524d','6465522463013','Gabriel','Pascualini','ab0a69ec274ce642cb4eb884052db53867ebcb6b35de20be9cbfb0782eb02d2803f4253d2008da7564fe366ad7dd088cee6a1bbe39dd94eaa3e6fa669c44df36','1569858080193',1,0,'2019-09-30',NULL,'gabriel@pulpou.com','2019-09-03',1);
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

-- Dump completed on 2019-09-30 10:45:31
