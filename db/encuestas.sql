-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: encuestas
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

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
-- Table structure for table `t_alumnos`
--

DROP TABLE IF EXISTS `t_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alumnos`
--

LOCK TABLES `t_alumnos` WRITE;
/*!40000 ALTER TABLE `t_alumnos` DISABLE KEYS */;
INSERT INTO `t_alumnos` VALUES (76,'docente.prueba','DOCENTE PRUEBA','PRUEBA'),(77,'alumno.prueba23','ALUMNO 1','PRUEBA'),(78,'alumno.prueba2','ALUMNO','PRUEBA2'),(79,'alumno.prueba3','ALUMNO','PRUEBA3'),(80,'alumno.prueba4','ALUMNO','PRUEBA4');
/*!40000 ALTER TABLE `t_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_aspirantes`
--

DROP TABLE IF EXISTS `t_aspirantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_aspirantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `no_accesos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_aspirantes`
--

LOCK TABLES `t_aspirantes` WRITE;
/*!40000 ALTER TABLE `t_aspirantes` DISABLE KEYS */;
INSERT INTO `t_aspirantes` VALUES (1,'08034',1,5),(2,'08013',1,0),(3,'08036',1,0),(4,'08017',1,0),(5,'08355',1,0),(6,'08037',1,0),(7,'08023',1,0),(8,'08025',1,0),(9,'08028',1,0),(10,'08029',1,0),(11,'08030',1,0),(12,'08031',1,0),(13,'08032',1,0),(14,'08033',1,0),(15,'08153',1,0),(16,'08156',1,0),(17,'08158',1,0),(18,'08160',1,0),(19,'08159',1,0),(20,'08345',1,0),(21,'08346',1,0),(22,'08168',1,0),(23,'08170',1,0),(24,'08265',1,0),(25,'08269',1,0),(26,'08271',1,0),(27,'08174',1,0),(28,'08179',1,0),(29,'08180',1,0),(30,'08182',1,0),(31,'08274',1,0),(32,'08223',1,0),(33,'08190',1,0),(34,'08225',1,0),(35,'08228',1,0),(36,'08233',1,0),(37,'08235',1,0),(38,'08197',1,0),(39,'08238',1,0),(40,'08198',1,0),(41,'08199',1,0),(42,'08239',1,0),(43,'08253',1,0),(44,'08201',1,0),(45,'08207',1,0),(46,'08253',1,0),(47,'08210',1,0),(48,'08211',1,0),(49,'08252',1,0),(50,'09359',1,0),(51,'09503',1,0),(52,'09505',1,0),(53,'09506',1,0),(54,'09509',1,0),(55,'09511',1,0),(56,'09512',1,0),(57,'09513',1,0),(58,'09515',1,0),(59,'09520',1,0),(60,'09521',1,0),(61,'09523',1,0),(62,'09524',1,0),(63,'09526',1,0),(64,'09531',1,0),(65,'09532',1,0),(66,'09535',1,0),(67,'09538',1,0),(68,'09542',1,0),(69,'09543',1,0),(70,'09546',1,0),(71,'09726',1,0),(72,'09549',1,0),(73,'09550',1,0),(74,'09551',1,0),(75,'09553',1,0),(76,'09555',1,0),(77,'10031',1,0),(78,'10032',1,0),(79,'10033',1,0),(80,'10034',1,0),(81,'10036',1,0),(82,'10041',1,0),(83,'10042',1,0),(84,'09513',1,0),(85,'10048',1,0),(86,'10049',1,0),(87,'10050',1,0),(88,'10051',1,0),(89,'10052',1,0),(90,'10055',1,0),(91,'10056',1,0),(92,'10040',1,0),(93,'10058',1,0),(94,'10060',1,0),(95,'10061',1,0),(96,'10063',1,0),(97,'10069',1,0),(98,'10070',1,0),(99,'10072',1,0),(100,'10073',1,0),(101,'10074',1,0),(102,'10075',1,0),(103,'10076',1,0),(104,'10078',1,0),(105,'10079',1,0),(106,'10080',1,0),(107,'10082',1,0),(108,'10083',1,0),(109,'10084',1,0),(110,'10079',1,0),(111,'10064',1,0),(112,'10183',1,0),(113,'10184',1,0),(114,'10186',1,0),(115,'10189',1,0),(116,'10199',1,0),(117,'10202',1,0),(118,'10207',1,0),(119,'10209',1,0),(120,'10133',1,0),(121,'10136',1,0),(122,'10344',1,0),(123,'10138',1,0),(124,'10338',1,0),(125,'10346',1,0),(126,'10219',1,0),(127,'10143',1,0),(128,'10221',1,0),(129,'10306',1,0),(130,'10146',1,0),(131,'11018',1,0),(132,'11019',1,0),(133,'11021',1,0),(134,'11022',1,0),(135,'11023',1,0),(136,'10037',1,0),(137,'11027',1,0),(138,'11029',1,0),(139,'11030',1,0),(140,'11031',1,0),(141,'11032',1,0),(142,'11034',1,0),(143,'11035',1,0),(144,'11040',1,0),(145,'11042',1,0),(146,'11043',1,0),(147,'11045',1,0),(148,'11049',1,0),(149,'11054',1,0),(150,'11056',1,0),(151,'11057',1,0),(152,'11058',1,0),(153,'11062',1,0),(154,'11063',1,0),(155,'11065',1,0),(156,'11079',1,0),(157,'11089',1,0),(158,'11377',1,0),(159,'11095',1,0),(160,'11097',1,0),(161,'11099',1,0),(162,'11100',1,0),(163,'11112',1,0),(164,'11113',1,0),(165,'11114',1,0),(166,'12277',1,0),(167,'12299',1,0),(168,'12301',1,0),(169,'12281',1,0),(170,'12307',1,0),(171,'12308',1,0),(172,'12282',1,0),(173,'12309',1,0),(174,'12283',1,0),(175,'12286',1,0),(176,'1042',1,0),(177,'12324',1,0),(178,'12289',1,0),(179,'12292',1,0),(180,'1041',1,0),(181,'12318',1,0),(182,'12319',1,0),(183,'12320',1,0),(184,'12293',1,0),(185,'12278',1,0),(186,'12282',1,0),(187,'12349',1,0),(188,'12290',1,0),(189,'12294',1,0),(190,'12295',1,0),(191,'12298',1,0),(192,'12301',1,0),(193,'12302',1,0),(194,'12307',1,0),(195,'12309',1,0),(196,'12311',1,0),(197,'12283',1,0),(198,'12319',1,0),(199,'12321',1,0),(200,'12322',1,0),(201,'12326',1,0),(202,'12332',1,0),(203,'12354',1,0),(204,'12333',1,0),(205,'12356',1,0),(206,'12335',1,0),(207,'12338',1,0),(208,'13175',1,0),(209,'13176',1,0),(210,'13177',1,0),(211,'13248',1,0),(212,'13179',1,0),(213,'13187',1,0),(214,'13188',1,0),(215,'13191',1,0),(216,'13192',1,0),(217,'13193',1,0),(218,'13197',1,0),(219,'13200',1,0),(220,'13201',1,0),(221,'13202',1,0),(222,'16179',1,0),(223,'12277',1,0),(224,'11092',1,0),(225,'13208',1,0),(226,'13211',1,0),(227,'13212',1,0),(228,'13216',1,0),(229,'13217',1,0),(230,'13240',1,0),(231,'13242',1,0),(232,'13269',1,0),(233,'13178',1,0),(234,'12315',1,0),(235,'13273',1,0),(236,'13275',1,0),(237,'13278',1,0),(238,'12344',1,0),(239,'13267',1,0),(240,'13279',1,0),(241,'14173',1,0),(242,'14175',1,0),(243,'14176',1,0),(244,'14180',1,0),(245,'14157',1,0),(246,'14160',1,0),(247,'14181',1,0),(248,'14161',1,0),(249,'14182',1,0),(250,'14183',1,0),(251,'14185',1,0),(252,'14164',1,0),(253,'14186',1,0),(254,'14187',1,0),(255,'14188',1,0),(256,'14166',1,0),(257,'14189',1,0),(258,'14170',1,0),(259,'14171',1,0),(260,'14172',1,0),(261,'14191',1,0),(262,'14194',1,0),(263,'14198',1,0),(264,'14151',1,0),(265,'14200',1,0),(266,'14202',1,0),(267,'14203',1,0),(268,'14158',1,0),(269,'14159',1,0),(270,'14205',1,0),(271,'14207',1,0),(272,'14212',1,0),(273,'14215',1,0),(274,'14219',1,0),(275,'13244',1,0),(276,'14222',1,0),(277,'14226',1,0),(278,'12316',1,0),(279,'14233',1,0),(280,'14213',1,0),(281,'14237',1,0),(282,'14238',1,0),(283,'15037',1,0),(284,'15038',1,0),(285,'15041',1,0),(286,'15042',1,0),(287,'15043',1,0),(288,'15044',1,0),(289,'15048',1,0),(290,'15051',1,0),(291,'15052',1,0),(292,'14156',1,0),(293,'15054',1,0),(294,'15057',1,0),(295,'15058',1,0),(296,'15059',1,0),(297,'15060',1,0),(298,'15061',1,0),(299,'15062',1,0),(300,'15063',1,0),(301,'15065',1,0),(302,'15067',1,0),(303,'15068',1,0),(304,'14179',1,0),(305,'15069',1,0),(306,'15070',1,0),(307,'15071',1,0),(308,'15072',1,0),(309,'15073',1,0),(310,'15074',1,0),(311,'15078',1,0),(312,'15081',1,0),(313,'15082',1,0),(314,'15083',1,0),(315,'15085',1,0),(316,'15087',1,0),(317,'15091',1,0),(318,'15092',1,0),(319,'15097',1,0),(320,'15098',1,0),(321,'15301',1,0),(322,'14197',1,0),(323,'15066',1,0),(324,'15307',1,0),(325,'15311',1,0),(326,'15320',1,0),(327,'15331',1,0),(328,'15339',1,0),(329,'15349',1,0),(330,'16079',1,0),(331,'16081',1,0),(332,'16086',1,0),(333,'16087',1,0),(334,'16088',1,0),(335,'16089',1,0),(336,'16093',1,0),(337,'16094',1,0),(338,'16102',1,0),(339,'13380',1,4),(340,'13383',1,0),(341,'13384',1,0),(342,'13385',1,0),(343,'13386',1,0),(344,'13387',1,0),(345,'13389',1,0),(346,'13391',1,0),(347,'13396',1,0),(348,'14243',1,0),(349,'14245',1,0),(350,'14247',1,0),(351,'14248',1,0),(352,'14250',1,0),(353,'14251',1,0),(354,'15483',1,0),(355,'15484',1,0),(356,'15485',1,0),(357,'15486',1,0),(358,'15488',1,0),(359,'15490',1,0),(360,'15491',1,0),(361,'15500',1,0),(362,'15501',1,0),(363,'15503',1,0),(364,'15504',1,0),(365,'15506',1,0),(366,'15507',1,0),(367,'15508',1,0),(368,'15509',1,0),(369,'15510',1,0),(370,'15511',1,0),(371,'15512',1,0),(372,'15513',1,0),(373,'15520',1,0),(374,'15521',1,0),(375,'15522',1,0),(376,'15524',1,0),(377,'15525',1,0),(378,'15526',1,0),(379,'16047',1,0),(380,'16048',1,0),(381,'16049',1,0),(382,'16050',1,0),(383,'16054',1,0),(384,'16057',1,0),(385,'16058',1,0),(386,'16060',1,0),(387,'16061',1,0),(388,'16065',1,0),(389,'16066',1,0),(390,'16073',1,0),(391,'16074',1,0),(392,'16076',1,0),(393,'16078',1,0),(394,'17081',1,0),(395,'17083',1,0),(396,'16068',1,0),(397,'17086',1,0),(398,'17093',1,0),(399,'16068',1,0),(400,'80291',1,0),(401,'80292',1,0),(402,'80290',1,0),(403,'80299',1,0),(404,'80302',1,0),(405,'80303',1,0),(406,'80304',1,0),(407,'80307',1,0),(408,'80309',1,0),(409,'80310',1,0),(410,'80311',1,0),(411,'80312',1,0),(412,'80320',1,0),(413,'80321',1,0),(414,'80313',1,0),(415,'80319',1,0),(416,'80315',1,0),(417,'80316',1,0),(418,'80318',1,0),(419,'80328',1,0),(420,'80329',1,0),(421,'80339',1,0),(422,'09563',1,0),(423,'09564',1,0),(424,'09565',1,0),(425,'09566',1,0),(426,'09568',1,0),(427,'09569',1,0),(428,'09571',1,0),(429,'09572',1,0),(430,'08343',1,0),(431,'08344',1,0),(432,'09574',1,0),(433,'09575',1,0),(434,'09576',1,0),(435,'09577',1,0),(436,'09579',1,0),(437,'09580',1,0),(438,'09581',1,0),(439,'09582',1,0),(440,'09601',1,0),(441,'09584',1,0),(442,'09603',1,0),(443,'09606',1,0),(444,'09585',1,0),(445,'09587',1,0),(446,'09607',1,0),(447,'09589',1,0),(448,'09600',1,0),(449,'09608',1,0),(450,'09606',1,0),(451,'09608',1,0),(452,'10087',1,0),(453,'10090',1,0),(454,'10092',1,0),(455,'10099',1,0),(456,'10100',1,0),(457,'10103',1,0),(458,'10105',1,0),(459,'10107',1,0),(460,'10110',1,0),(461,'10114',1,0),(462,'10115',1,0),(463,'10116',1,0),(464,'10117',1,0),(465,'10119',1,0),(466,'10122',1,0),(467,'10123',1,0),(468,'10124',1,0),(469,'11121',1,0),(470,'11123',1,0),(471,'11124',1,0),(472,'11125',1,0),(473,'11126',1,0),(474,'11129',1,0),(475,'11130',1,0),(476,'11132',1,0),(477,'11133',1,0),(478,'11134',1,0),(479,'11135',1,0),(480,'11137',1,0),(481,'11138',1,0),(482,'11139',1,0),(483,'11140',1,0),(484,'11141',1,0),(485,'11143',1,0),(486,'11144',1,0),(487,'11147',1,0),(488,'11148',1,0),(489,'11149',1,0),(490,'11150',1,0),(491,'11152',1,0),(492,'11153',1,0),(493,'11155',1,0),(494,'11156',1,0),(495,'11162',1,0),(496,'11163',1,0),(497,'11164',1,0),(498,'11165',1,0),(499,'11167',1,0),(500,'11168',1,0),(501,'11169',1,0),(502,'11171',1,0),(503,'11172',1,0),(504,'11174',1,0),(505,'10112',1,0),(506,'11176',1,0),(507,'11177',1,0),(508,'11178',1,0),(509,'11181',1,0),(510,'11182',1,0),(511,'12404',1,0),(512,'12410',1,0),(513,'12411',1,0),(514,'12413',1,0),(515,'12416',1,0),(516,'12419',1,0),(517,'12420',1,0),(518,'12421',1,0),(519,'12426',1,0),(520,'12427',1,0),(521,'12428',1,0),(522,'12441',1,0),(523,'12442',1,0),(524,'12443',1,0),(525,'12444',1,0),(526,'12445',1,0),(527,'12446',1,0),(528,'12451',1,0),(529,'12453',1,0),(530,'12454',1,0),(531,'12457',1,0),(532,'12458',1,0),(533,'12459',1,0),(534,'12460',1,0),(535,'12462',1,0),(536,'12429',1,0),(537,'12463',1,0),(538,'12464',1,0),(539,'12465',1,0),(540,'12466',1,0),(541,'12479',1,0),(542,'12469',1,0),(543,'12470',1,0),(544,'12471',1,0),(545,'12472',1,0),(546,'12473',1,0),(547,'11151',1,0),(548,'10094',1,0),(549,'13286',1,0),(550,'13287',1,0),(551,'13288',1,0),(552,'13289',1,0),(553,'13290',1,0),(554,'13292',1,0),(555,'13293',1,0),(556,'13295',1,0),(557,'13296',1,0),(558,'13298',1,0),(559,'13299',1,0),(560,'13301',1,0),(561,'13303',1,0),(562,'13305',1,0),(563,'13306',1,0),(564,'13307',1,0),(565,'13308',1,0),(566,'13310',1,0),(567,'13311',1,0),(568,'13312',1,0),(569,'13314',1,0),(570,'13315',1,0),(571,'13316',1,0),(572,'13317',1,0),(573,'13318',1,0),(574,'13320',1,0),(575,'13322',1,0),(576,'12407',1,0),(577,'13323',1,0),(578,'13324',1,0),(579,'12425',1,0),(580,'13328',1,0),(581,'13329',1,0),(582,'13331',1,0),(583,'13332',1,0),(584,'13334',1,0),(585,'13337',1,0),(586,'13339',1,0),(587,'13340',1,0),(588,'13346',1,0),(589,'13348',1,0),(590,'13349',1,0),(591,'13351',1,0),(592,'13353',1,0),(593,'13355',1,0),(594,'13356',1,0),(595,'13357',1,0),(596,'13358',1,0),(597,'13361',1,0),(598,'13362',1,0),(599,'11183',1,0),(600,'13364',1,0),(601,'14365',1,0),(602,'14367',1,0),(603,'14370',1,0),(604,'14371',1,0),(605,'14372',1,0),(606,'14373',1,0),(607,'14374',1,0),(608,'14375',1,0),(609,'14377',1,0),(610,'14380',1,0),(611,'14382',1,0),(612,'14383',1,0),(613,'14384',1,0),(614,'14385',1,0),(615,'14388',1,0),(616,'14389',1,0),(617,'14393',1,0),(618,'14394',1,0),(619,'14396',1,0),(620,'14397',1,0),(621,'14399',1,0),(622,'14400',1,0),(623,'14401',1,0),(624,'14402',1,0),(625,'14366',1,0),(626,'14405',1,0),(627,'14406',1,0),(628,'14408',1,0),(629,'14410',1,0),(630,'14413',1,0),(631,'14414',1,0),(632,'14419',1,0),(633,'14421',1,0),(634,'14423',1,0),(635,'14426',1,0),(636,'14427',1,0),(637,'14428',1,0),(638,'14429',1,0),(639,'13310',1,0),(640,'15101',1,0),(641,'15102',1,0),(642,'15108',1,0),(643,'15109',1,0),(644,'15111',1,0),(645,'15113',1,0),(646,'15114',1,0),(647,'15116',1,0),(648,'15118',1,0),(649,'15119',1,0),(650,'15120',1,0),(651,'15123',1,0),(652,'15124',1,0),(653,'15127',1,0),(654,'15128',1,0),(655,'15129',1,0),(656,'15131',1,0),(657,'15134',1,0),(658,'15135',1,0),(659,'15136',1,0),(660,'15141',1,0),(661,'15142',1,0),(662,'15143',1,0),(663,'15145',1,0),(664,'15147',1,0),(665,'15148',1,0),(666,'15151',1,0),(667,'15154',1,0),(668,'15155',1,0),(669,'15157',1,0),(670,'15158',1,0),(671,'15159',1,0),(672,'15160',1,0),(673,'15161',1,0),(674,'15162',1,0),(675,'15164',1,0),(676,'15165',1,0),(677,'15167',1,0),(678,'14368',1,0),(679,'14381',1,0),(680,'15171',1,0),(681,'15172',1,0),(682,'15175',1,0),(683,'15177',1,0),(684,'15179',1,0),(685,'15183',1,0),(686,'15184',1,0),(687,'15187',1,0),(688,'15190',1,0),(689,'15192',1,0),(690,'15193',1,0),(691,'15199',1,0),(692,'15203',1,0),(693,'15212',1,0),(694,'15103',1,0),(695,'16185',1,0),(696,'16187',1,0),(697,'16188',1,0),(698,'16189',1,0),(699,'16190',1,0),(700,'16191',1,0),(701,'16195',1,0),(702,'16196',1,0),(703,'16197',1,0),(704,'16200',1,0),(705,'16201',1,0),(706,'16202',1,0),(707,'16204',1,0),(708,'16205',1,0),(709,'16206',1,0),(710,'16207',1,0),(711,'16208',1,0),(712,'16210',1,0),(713,'16211',1,0),(714,'16212',1,0),(715,'16213',1,0),(716,'16214',1,0),(717,'16215',1,0),(718,'16225',1,0),(719,'16228',1,0),(720,'16229',1,0),(721,'16233',1,0),(722,'16235',1,0),(723,'16236',1,0),(724,'16239',1,0),(725,'15167',1,0),(726,'17107',1,0),(727,'17112',1,0);
/*!40000 ALTER TABLE `t_aspirantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_categoria_persona`
--

DROP TABLE IF EXISTS `t_categoria_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_categoria_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria_persona` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_categoria_persona`
--

LOCK TABLES `t_categoria_persona` WRITE;
/*!40000 ALTER TABLE `t_categoria_persona` DISABLE KEYS */;
INSERT INTO `t_categoria_persona` VALUES (1,'Prospecto'),(2,'Alumno'),(3,'Docente'),(4,'Egresado'),(5,'Administrativo');
/*!40000 ALTER TABLE `t_categoria_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_categorias_preguntas`
--

DROP TABLE IF EXISTS `t_categorias_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_categorias_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_categorias_preguntas`
--

LOCK TABLES `t_categorias_preguntas` WRITE;
/*!40000 ALTER TABLE `t_categorias_preguntas` DISABLE KEYS */;
INSERT INTO `t_categorias_preguntas` VALUES (1,'IDENTIDAD INSTITUCIONAL'),(2,'DOCENCIA'),(3,'PROFESIONAL'),(4,'PERSONAL'),(5,'TUTORÍAS'),(6,'PAPEL DEL INSTRUCTOR'),(7,'MATERIAL DE APOYO DOCUMENTAL(BIBLIOGRAFIA)'),(8,'MATERIAL DE APOYO DIGITAL'),(9,'ASPECTOS SOBRE EL CURSO IMPARTIDO'),(10,'EVALUACION MODELO EDUACTIVO'),(11,'COMO CONSIDERA...'),(12,'TU OPINION NOS INTERESA');
/*!40000 ALTER TABLE `t_categorias_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_curso`
--

DROP TABLE IF EXISTS `t_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ponente` int(11) DEFAULT NULL,
  `nombre_curso` varchar(100) DEFAULT NULL,
  `sede` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_curso_FK` (`id_ponente`),
  CONSTRAINT `t_curso_FK` FOREIGN KEY (`id_ponente`) REFERENCES `t_ponente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_curso`
--

LOCK TABLES `t_curso` WRITE;
/*!40000 ALTER TABLE `t_curso` DISABLE KEYS */;
INSERT INTO `t_curso` VALUES (1,1,'DIDACTICA DE LA LECTURA COMPRENSIVA','CAMPECHE');
/*!40000 ALTER TABLE `t_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_docente`
--

DROP TABLE IF EXISTS `t_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_plataforma` int(11) DEFAULT NULL,
  `usuario_docente` varchar(100) DEFAULT NULL,
  `nombre_docente` varchar(100) DEFAULT NULL,
  `apellidos_docente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_docente`
--

LOCK TABLES `t_docente` WRITE;
/*!40000 ALTER TABLE `t_docente` DISABLE KEYS */;
INSERT INTO `t_docente` VALUES (129,228,'docente.virtual','JOSE','SANTIZ RUIZ'),(130,909,'docente.prueba','DOCENTE PRUEBA','PRUEBA'),(131,246,'jesus.jimenez','JESUS ALEJANDRO','JIMENEZ MORALES'),(132,811,'lubeydi.lopez','LUBEYDI','LOPEZ RAMIREZ');
/*!40000 ALTER TABLE `t_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_enc_egresados`
--

DROP TABLE IF EXISTS `t_enc_egresados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_enc_egresados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `generacion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(90) COLLATE utf8_spanish_ci DEFAULT NULL,
  `carrera` varchar(95) COLLATE utf8_spanish_ci NOT NULL,
  `condicion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `justifique` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `empleo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `jerarquia` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `salario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sector` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `relacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comentarios` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_enc_egresados`
--

LOCK TABLES `t_enc_egresados` WRITE;
/*!40000 ALTER TABLE `t_enc_egresados` DISABLE KEYS */;
INSERT INTO `t_enc_egresados` VALUES (1,'ASDASD','G-2015','ADASDDSAD','9612699924','correo@correo.com','TecnicoEnfermeria','Falta de experiencia profesional','','menos3meses','tecnico','entre3000a5000','propio','0','asdasdadsadasdadsd'),(2,'','Elije la generación...','','','','Elije tu carrera...','Elije una opción...','',NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `t_enc_egresados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_encuesta`
--

DROP TABLE IF EXISTS `t_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_encuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_encuesta` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_categoria_persona` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_encuesta_t_periodo` (`id_periodo`),
  KEY `t_encuesta_t_categoria_persona_FK` (`id_categoria_persona`),
  CONSTRAINT `FK_t_encuesta_t_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `t_periodo` (`id`),
  CONSTRAINT `t_encuesta_t_categoria_persona_FK` FOREIGN KEY (`id_categoria_persona`) REFERENCES `t_categoria_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_encuesta`
--

LOCK TABLES `t_encuesta` WRITE;
/*!40000 ALTER TABLE `t_encuesta` DISABLE KEYS */;
INSERT INTO `t_encuesta` VALUES (1,'AUTOEVALUACION','DETECCIÓN DE NECESIDADES DE CAPACITACIÓN',3,2,1),(2,'HETEROEVALUACION','EVALUACIÓN DEL DESEMPEÑO DOCENTE',2,2,1),(5,'HETEROEVALUACION CURSO','DESEMPEÑO DEL CURSO DE CAPACITACION',3,2,0),(6,'EVALUACIÓN MODELO EDUCATIVO','EVALUACIÓN MODELO EDUCATIVO',3,2,1),(7,'HETEROEVALUACION','EVALUACIÓN AL CURSO DE INDUCCIÓN',2,2,1);
/*!40000 ALTER TABLE `t_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_materias`
--

DROP TABLE IF EXISTS `t_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso_plataforma` varchar(100) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `plataforma` varchar(50) DEFAULT NULL,
  `nombre_materia` varchar(200) DEFAULT NULL,
  `nombre_carrera` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_materias_t_docente_FK` (`id_docente`),
  CONSTRAINT `t_materias_t_docente_FK` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_materias`
--

LOCK TABLES `t_materias` WRITE;
/*!40000 ALTER TABLE `t_materias` DISABLE KEYS */;
INSERT INTO `t_materias` VALUES (672,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(673,'813',131,'tuxtla.sm','FUNDAMENTOS DE FÍSICA','Licenciatura en T.S.U. en Imagenología'),(674,'831',132,'tuxtla.sm','MANEJO DE APARATOS ELECTROMEDICOS','Licenciatura en Enfermería'),(675,'850',129,'tuxtla.sm','QUIMICA I','Semestrales'),(676,'851',129,'tuxtla.sm','MATEMATICAS I','Semestrales'),(677,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(678,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(679,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(680,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(681,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(682,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(683,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(684,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(685,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(686,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(687,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(688,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(689,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(690,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(691,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(692,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(693,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(694,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(695,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(696,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(697,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(698,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(699,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(700,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(701,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(702,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(703,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(704,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(705,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(706,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(707,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(708,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(709,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(710,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(711,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(712,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(713,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(714,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(715,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(716,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(717,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(718,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(719,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(720,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(721,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(722,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(723,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(724,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(725,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(726,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(727,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(728,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(729,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(730,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(731,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(732,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(733,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(734,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(735,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(736,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(737,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(738,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(739,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(740,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(741,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(742,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(743,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(744,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(745,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(746,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(747,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(748,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(749,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(750,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(751,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(752,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(753,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(754,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(755,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(756,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(757,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(758,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(759,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(760,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(761,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(762,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(763,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(764,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(765,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(766,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(767,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(768,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(769,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(770,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(771,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(772,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(773,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(774,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(775,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(776,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(777,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(778,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(779,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(780,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(781,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(782,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(783,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(784,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(785,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(786,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(787,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(788,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(789,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(790,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(791,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(792,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(793,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(794,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(795,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(796,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(797,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(798,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(799,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(800,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(801,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(802,'511',NULL,'tuxtla.sm','Capacitacion',NULL),(803,'511',NULL,'tuxtla.sm','Capacitacion',NULL);
/*!40000 ALTER TABLE `t_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_opciones_respuestas`
--

DROP TABLE IF EXISTS `t_opciones_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_opciones_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_respuesta` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `identificador_numerico` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_opciones_respuestas`
--

LOCK TABLES `t_opciones_respuestas` WRITE;
/*!40000 ALTER TABLE `t_opciones_respuestas` DISABLE KEYS */;
INSERT INTO `t_opciones_respuestas` VALUES (1,'S',0,3),(2,'CS',1,2),(3,'AV',2,1),(4,'N',3,0),(5,'PR',4,1),(6,'AL',5,1),(7,'ME',6,1),(8,'BA',7,1),(9,'NM',8,1),(10,'EX',9,4),(11,'MB',10,3),(12,'AC',11,2),(13,'NM1',12,1),(14,'SI',13,1),(15,'NO',14,0),(16,'Garantiza una fuente de empleo',15,1),(17,'Favorece el desarrollo personal',16,1),(18,'Tengo talento o habilidades',17,1),(19,'Su reconocimiento social',18,1),(20,'Asegura buenos ingresos',19,1),(21,'Tradición familiar',20,1),(22,'Contribuir con el desarrollo de mi país',21,1),(23,'Es novedosa',22,1),(24,'Corresponde a mis gustos e intereses',23,1);
/*!40000 ALTER TABLE `t_opciones_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_opciones_respuestas_opcion_multiple`
--

DROP TABLE IF EXISTS `t_opciones_respuestas_opcion_multiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_opciones_respuestas_opcion_multiple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_inciso` varchar(100) DEFAULT NULL,
  `nombre_respuesta` varchar(500) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_opciones_respuestas_opcion_multiple_t_preguntas_FK` (`id_pregunta`),
  CONSTRAINT `t_opciones_respuestas_opcion_multiple_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_opciones_respuestas_opcion_multiple`
--

LOCK TABLES `t_opciones_respuestas_opcion_multiple` WRITE;
/*!40000 ALTER TABLE `t_opciones_respuestas_opcion_multiple` DISABLE KEYS */;
INSERT INTO `t_opciones_respuestas_opcion_multiple` VALUES (83,'a','Una elección inteligente',0,209),(84,'b','Una Educación humanista por competencias y desarrollo social',0,209),(85,'c','Una educación humanista con enfoque en competencias de sentido social',1,209),(86,'a','Mundial, Nacional y Estatal',0,210),(87,'b','Internacional, Nacional y Regional',1,210),(88,'c','Nacional, Estatal y Municipal',0,210),(89,'a','Art. 3° y art. 5° Constitucional, Reforma educativa 2019 y DOF',0,211),(90,'b','Plan de desarrollo Nacional y estatal 2019 – 2024 y art. 5° Constitucional.',0,211),(91,'c','Art. 3° Constitucional, Reforma educativa 2019 y Plan de desarrollo Nacional y estatal 2019 – 2024.',1,211),(92,'a','Epistemológico, filosófico y social.',0,212),(93,'b','Filosófico, pedagógico y social.',1,212),(94,'c','Pedagógico, epistemológico y filosófico.',0,212),(95,'a','La filosofía humanista',1,213),(96,'b','Pedagogía constructivista',0,213),(97,'c','Un sentido social',0,213),(98,'a','Conductista',0,214),(99,'b','Tradicional',0,214),(100,'c','Constructivista',1,214),(101,'a','Creación de ambientes de aprendizajes, un docente facilitador y motivador.',1,215),(102,'b','Estructuras mentales, apoyo creativo y docencia magistral.',0,215),(103,'c','Estructuras metales, experiencias y autoridad.',0,215),(104,'a','Saber: conocer, hacer, convivir y ser.',1,216),(105,'b','Saber: conocer, saber, querer y sentir',0,216),(106,'c','Saber: sentir, convivir, hacer y conocer',0,216),(107,'a','La filosofía humanista',0,217),(108,'b','Pedagogía constructivista',0,217),(109,'c','Un sentido social.',1,217),(110,'a','Formar profesionales con sentido de una educación integral humanista, basada en el enfoque de desarrollo de competencias del Siglo XXI y responsabilidad social, a fin de que construyan propuestas y alternativas de solución a problemas sociales, políticos, culturales y económicos del estado, de la región y del país.',1,218),(111,'a','Ser un Sistema Educativo reconocido  nacional e internacionalmente por la calidad de sus programas de formación , la consolidación de su Modelo Educativo Institucional respecto de los componentes de equidad de género, sustentabilidad, interculturalidad, inclusión social y desarrollo de la Investigación',0,219),(112,'a','Autonomía, Templanza, Honestidad, Respeto, Inclusión y Disciplina',1,220),(113,'b','Autonomía, Templanza, Cooperación, Dignidad, Paz y Tolerancia.',0,220),(114,'c','Amor, Justicia, Respeto, Libertad, Inclusión y Amistad.',0,220),(115,'a','Inclusión social, igualdad, sostenibilidad y profesional.',0,221),(116,'b','Inclusión social, Interculturalidad, sustentabilidad y equidad de género.',1,221),(117,'c','Inclusión social, cultural, económico y emprendimiento',0,221),(118,'a','Seminario de tesis',0,222),(119,'b','Programas de apoyo al estudiante.',1,222),(120,'c','Proyecto integrados',0,222),(121,'a','Seminario de tesis',0,223),(122,'b','Programas de apoyo al estudiante.',0,223),(123,'c','Proyecto integrador',1,223),(124,'b','Formar profesionales con sentido de una educación integral y social , basada en el enfoque de desarrollo de competencias del Siglo XXI y responsabilidad social, a fin de que construyan propuestas y alternativas de solución a problemas religiosos, culturales y económicos del estado.',0,218),(125,'c','Formar profesionales con sentido de una educación integral humanista, basada en el enfoque de desarrollo de competencias del Siglo XXI y responsabilidad social, a fin de que construyan propuestas y alternativas de solución a problemas políticos, culturales y económicos del país.\r\n',0,218),(126,'b','Ser un Sistema Educativo reconocido regional, nacional e internacionalmente por la calidad de sus programas de formación y servicios, la consolidación de su Modelo Educativo Institucional respecto de los componentes de equidad de género, sustentabilidad, interculturalidad, inclusión social y desarrollo de la Investigación Científica.',1,219),(127,'c','Ser un Sistema Educativo reconocido regional, nacional por la calidad de sus programas de formación y servicios, la consolidación de su Modelo Educativo Institucional respecto de los componentes de equidad de género, inclusión social y desarrollo de la Investigación Científica.',0,219);
/*!40000 ALTER TABLE `t_opciones_respuestas_opcion_multiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_periodo`
--

DROP TABLE IF EXISTS `t_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_periodo`
--

LOCK TABLES `t_periodo` WRITE;
/*!40000 ALTER TABLE `t_periodo` DISABLE KEYS */;
INSERT INTO `t_periodo` VALUES (1,'ENERO-ABRIL 2021'),(2,'SEPTIEMBRE-DICIEMBRE 2021'),(3,'ENERO-JUNIO 2021'),(4,'JULIO-DICIEMBRE 2021'),(5,'MAYO-AGOSTO 2021');
/*!40000 ALTER TABLE `t_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ponente`
--

DROP TABLE IF EXISTS `t_ponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ponente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ponente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ponente`
--

LOCK TABLES `t_ponente` WRITE;
/*!40000 ALTER TABLE `t_ponente` DISABLE KEYS */;
INSERT INTO `t_ponente` VALUES (1,'JORGE ELIESER GOMEZ LOPEZ');
/*!40000 ALTER TABLE `t_ponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_preguntas`
--

DROP TABLE IF EXISTS `t_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pregunta` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_subcategoria` int(11) DEFAULT NULL,
  `id_opciones_respuestas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_preguntas_t_subcategoria_preguntas` (`id_subcategoria`),
  KEY `FK_t_preguntas_t_encuesta` (`id_encuesta`),
  KEY `FK_t_preguntas_t_respuestas` (`id_opciones_respuestas`) USING BTREE,
  CONSTRAINT `FK_t_preguntas_t_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  CONSTRAINT `FK_t_preguntas_t_opciones_respuestas` FOREIGN KEY (`id_opciones_respuestas`) REFERENCES `t_opciones_respuestas` (`id`),
  CONSTRAINT `FK_t_preguntas_t_subcategoria_preguntas` FOREIGN KEY (`id_subcategoria`) REFERENCES `t_subcategoria_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_preguntas`
--

LOCK TABLES `t_preguntas` WRITE;
/*!40000 ALTER TABLE `t_preguntas` DISABLE KEYS */;
INSERT INTO `t_preguntas` VALUES (2,'¿El docente te dió a conocer los objetivos de la institución? ',2,2,NULL),(3,'¿El docente te dio a conocer la misión, visión y valores de la institución?',2,2,NULL),(4,'¿El docente te informa de los servicios que presta la Universidad?',2,2,NULL),(5,'¿El docente se expresa correctamente de la Univeridad?',2,2,NULL),(6,'¿El docente realizó la presentación de la asigatura al inicio del curso?',2,3,NULL),(7,'¿El docente presentó y proporcionó copia  al inicio del curso de  la secuencia didáctica?',2,3,NULL),(8,'¿El docente explicó claramente los criterios de evaluación de la asignatura? ',2,3,NULL),(9,'¿El docente expresó los objetivos y la importancia de su asigantura en la carrera profesional?',2,3,NULL),(10,'¿El docente concluyó satisfactoriamente el curso?',2,3,NULL),(11,'¿El docente asistió puntualmente a sus clases?',2,5,NULL),(12,'¿El docente aprovechó el tiempo de clases para desarrollar los contenidos del programa?',2,5,NULL),(13,'¿El docente respetó la programación de los examenes parciales?',2,5,NULL),(14,'¿El docente te ha brindado asesorías extra-clases o has observado que ha asesorado a alguno de tus compañeros?',2,5,NULL),(15,'¿El docente fue puntual en la entrega de las evaulaciones',2,5,NULL),(16,'¿El docente se comunica de forma clara y fácil de entender?',2,6,NULL),(17,'¿El docente se muestra abierto al diálogo?',2,6,NULL),(18,'¿El docente te estímula a que participes durante la clase?',2,6,NULL),(19,'¿El docente estímula la interacción entre los estudiantes para el aprendizaje y desarrollo de los temas?',2,6,NULL),(20,'¿El docente fomenta un ambiente de confianza, respeto mutuo y buen trato con y entre los estudiantes?',2,6,NULL),(21,'¿El docente organiza actividades y/o tareas en equipo para el aprendizaje de los temas?',2,6,NULL),(22,'¿El docente logra mantener tu atención durante la clase con las actividades realizadas?',2,9,NULL),(23,'¿El docente despierta tu interés y motivación por aprender?',2,9,NULL),(24,'¿El docente solicita que investiguen o lean previamente a la clase sobre la temática a desarrollar? ',2,9,NULL),(25,'¿El docente les pide que elaboren mapas mentales o conceptuales, cuadros sinópticos, comparativos u otra forma de organizar la información? ',2,9,NULL),(26,'¿El docente establece relación entre la teoría y la práctica?',2,9,NULL),(27,'¿El docente solicita tareas que impliquen tu acercamiento a la práctica?',2,9,NULL),(28,'¿El docente utiliza las tecnologias de la información(Internet, Caño, Software, paquetería, etc)?.',2,11,NULL),(29,'Muestra dominio al utilizar las tecnologias de la información en su clase?',2,11,NULL),(30,'¿El docente solicita tareas que requieran el uso de internet y otras tecnologías?',2,11,NULL),(31,'¿El docente realizó evaluación diagnostica al inicio del curso?',2,13,NULL),(32,'¿El docente realizón evaluaciones en diferentes momentos del curso?',2,13,NULL),(33,'¿El docente utilizó diferentes instrumentos para la evaluación de los trabajos, exposiciones y investigaciones (rúbricas, Listas de cotejo, Reportes de prácticas?',2,13,NULL),(34,'¿El docente domina los temas de la asignatura?',2,15,NULL),(35,'¿El docente está actualizado en los temas de la asignatura?',2,15,NULL),(36,'¿El docente aclara dudas sobre los temas de la clase?',2,15,NULL),(37,'¿El docente demuestra vocación profesional a su disciplina?',2,15,NULL),(38,'¿El docente acerca al estudiante al conocimiento de la disciplina a través de situaciones concretas o ejemplos?',2,15,NULL),(39,'¿El docente demuestra compromiso con el desarrollo del aprendizaje de los estudiantes?',2,16,NULL),(40,'¿El docente logra un trato equitativo y respetuoso en su relación con los estudiantes?',2,16,NULL),(41,'¿El docente inició y terminó puntualmente su clase?',2,16,NULL),(42,'¿El docente demuestra amor a lo que hace?',2,16,NULL),(43,'¿El docente demuestra equilibrio emocional?',2,16,NULL),(44,'¿El docente cumplió con las horas asignadas de tus  tutorias?',2,17,NULL),(45,'¿El docente realizó actividades ',2,17,NULL),(46,'¿El docente desarrolló e instrumentó estrategias de aprendizaje y técnicas de estudio para favorecer el aprendizaje significativo de los estudiantes.',2,17,NULL),(47,'El docente Involucró a los estudiantes en actividades para desarrollar su sentido de responsabilidad individual y colectiva, de autoestima, autocontrol y sociabilidad.',2,17,NULL),(48,'¿El docente Impulsó la participación en actividades artísticas y culturales como complemento de su formación integral.',2,17,NULL),(49,'El docente realizó actividades para el desarrolló de la creatividad, toma de decisiones y solución de problemas',2,17,NULL),(50,'El docente brindó apoyar para la preparación del exámenes y trabajos.',2,17,NULL),(51,'Promoción de la filosofía institucional.',1,2,NULL),(52,'Conocimiento del módelo educativo de la Universidad.',1,2,NULL),(53,'Fomento y difundo los rasgos de la cultura instiucional.',1,2,NULL),(54,'Asumno la realización de acciones para la transformación del contexto, la investigación y las actividades académicas',1,2,NULL),(55,'Desarrollo y aplicación de las estrategías de enseñanza aprendizaje',1,22,NULL),(56,'Empleo de la TIC`s en los procesos de enseñanza y aprendizaje',1,22,NULL),(57,'Fomento del uso de la plataforma educativa seuatvirtual para facilitar el aprendizaje',1,22,NULL),(58,'Empleo de la secuencia didática para el desarrollo de la asignatura',1,22,NULL),(59,'Evaluó con evidencias y criterios de desempeño las competencias',1,22,NULL),(60,'Desarrollo y apliación de las competencias en el aula',1,22,NULL),(61,'Desarrollo y aplicación de estrategias para la motivación en el aula',1,22,NULL),(62,'Detección de los estilos de aprendizaje que existen en el aula',1,22,NULL),(63,'Diseño de la secuencia didáctica para facilitar la experiencia del aprendizaje en el aula',1,22,NULL),(64,'Fomento de habilidades para un aprendizaje autónomo',1,22,NULL),(65,'Desarrollo y aplicación de técnicas para el aprendizaje en el aula',1,22,NULL),(66,'Desarrollo u aplicación del material audiovisual para el aprendizaje en el aula',1,22,NULL),(67,'Empleo de una comunicación asertiva en el aula',1,22,NULL),(68,'Generación de ambientes de aprendizaje',1,22,NULL),(69,'Desarrolla y aplica estrategias de evaluación adecuadas para un aprendizaje significativo',1,22,NULL),(70,'Fomenta el trabajo colaborativo en el aula',1,22,NULL),(71,'Desarrollo de metodología y técnicas específicas en la construcción de los aprendizajes',1,22,NULL),(72,'Fortalecer el aprendizaje del estudiante mejorando continuamente sus prácticas, métodos y estrategias implementados en el aula',1,22,NULL),(73,'Formación de habilidades de investigación en el aula',1,22,NULL),(74,'Diseño y evaluación de planes de estudio',1,22,NULL),(75,'Diseño y evaluación de programas de estudio',1,22,NULL),(76,'Diseño de propuestas académicas',1,22,NULL),(77,'Empleo de la planeación estratégica en la administración de la Institución',1,22,NULL),(78,'Propicia relaciones con los diferentes sectores para fortalecer la formación de los estudiantes',1,22,NULL),(79,'Fomenta y dirige el uso de las nuevas tecnologías como complemento del aprendizaje en el aula',1,22,NULL),(80,'Orienta la investigación de sus estudiantes hacia proyectos de investigación que satisfagan necesidades reales de los diferentes sectores económicos y sociales',1,22,NULL),(81,'Detección de problemas educativos para su investigación',1,22,NULL),(82,'Elaboración de proyectos de investigación educativa',1,22,NULL),(83,'Conocimiento y desarrollo de técnicas para la difusión de los resultados de una investigación; Publicaciones, congresos, simposios, foros, etc.',1,22,NULL),(84,'Participación en asociaciones académicas especializadas',1,22,NULL),(85,'Se mantiene actualizado en las tendencias y avances de su disciplina y área de especialidad',1,15,NULL),(86,'Promoción de la cultura y los valores nacionales',1,15,NULL),(87,'Emprende continuamente acciones que lo mantiene actualizado tanto disciplinar como pedagógicamente, con la intención de mejorar su práctia docente',1,15,NULL),(88,'Desarrollo y aplicación de las técnicas disciplinares en el aula',1,15,NULL),(89,'Motivación al compartir conocimientos en el aula.',1,16,NULL),(90,'Concentración al desarrollo del labor docente',1,16,NULL),(91,'Logro de objetivos y metas propuestos',1,16,NULL),(92,'Estado emocional actualente',1,16,NULL),(93,'Estado de salud actualmente',1,16,NULL),(94,'Detección de las necesidades para las tutorias',1,17,NULL),(95,'Solución de problemas de los tutorados',1,17,NULL),(96,'Conocimiento del programa institucional de tutorias',1,17,NULL),(97,'Diseño y aplicación del plan de acción de tutorias',1,17,NULL),(98,'Desarrollo y aplicación de estrategias para las tutorías',1,17,NULL),(99,'Informa al inicio del curso sobre el aprendizaje esperado, el tiempo de trabajo y la evidencia final',5,18,NULL),(100,'Expresa los conceptos claramente y con pertinencia',5,18,NULL),(101,'Apoya sus explicaciones en estadisticas o ejemplos',5,18,NULL),(102,'Vincula sus argumentos a la idea principal',5,18,NULL),(103,'Enfoca la sesion en el tema objeto de estudio',5,18,NULL),(104,'Facilita la participacion y reflexion de los asistentes',5,18,NULL),(105,'Responde con precision a preguntas sobre el tema',5,18,NULL),(106,'Favorece el trabajo colaborativo y en equipo',5,18,NULL),(107,'Fomenta la resolucion de problemas',5,18,NULL),(108,'Mantiene la atencion del grupo',5,18,NULL),(109,'Utiliza todo el tiempo disponible',5,18,NULL),(110,'Desarrolla los temas de acuerdo a la agenda',5,18,NULL),(111,'Utiliza recursos tecnologicos para apoyar su participacion',5,18,NULL),(112,'Favorece el desarrollo de competencias',5,19,NULL),(113,'Son pertinentes al tema y se basan en fuentes confiables',5,19,NULL),(114,'Se estructura de acuerdo al enfoque de competencias',5,19,NULL),(115,'Presenta estructura sencilla, clara y uniforme',5,19,NULL),(116,'Apoya en la comprension del tema',5,20,NULL),(117,'Incluye texto, imagen, audio, videos, son multisensorailes',5,20,NULL),(118,'Permite la manipulacion directa en situaciones de simulacion o experimentacion, son interactivos',5,20,NULL),(119,'Admite su uso en locales que no cuentan con conexion a',5,20,NULL),(120,'Internet, son portables',5,20,NULL),(121,'Es accesible desde cualquier sistema de software y equipo',5,20,NULL),(122,'Mantiene pertinencia entre el contenido y su nombre',5,21,NULL),(123,'Se organiza e imparte en una secuencia logica',5,21,NULL),(124,'Es teorico y practico',5,21,NULL),(125,'Tiene aplicacion en tu practica docente',5,21,NULL),(126,'Es adecuado el tiempo de trabajo para alcanzar el aprendizaje esperado',5,21,NULL),(127,'Se organiza oportunamente y en tiempo con la agenda',5,21,NULL),(128,'Cuenta con el apoyo humano, material y de equipo requerido',5,21,NULL),(129,'Evaluacion general del curso',5,21,NULL),(209,'¿Cuál es la filosofía del modelo educativo SEUAT?',6,25,NULL),(210,'¿Cuáles son los tres contextos estadísticos que toma como marco referencial el Modelo Educativo SEUAT?',6,25,NULL),(211,'Son el fundamento legal del Modelo Educativo:',6,25,NULL),(212,'¿Cuáles son los fundamentos epistemológicos del Modelo Educativo SEUAT?',6,25,NULL),(213,'Nuestro sistema se centra en educar e instrumentar los procesos de convivencia en el surgimiento y desarrollo del SENTIDO COMÚN de su personal académico, administrativo y estudiantes … son tendencias de:',6,25,NULL),(214,'Pedagogía que adopta SEUAT para su modelo educativo:',6,25,NULL),(215,'Son componentes de una pedagogía constructivista:',6,25,NULL),(216,'¿Cuáles son los cuatro pilares de la educación por competencias?',6,25,NULL),(217,'En este proceso formativo es consigna actuante de los programas educativos y atmósfera envolvente entorno a la dignidad e igualdad de las personas, la solidaridad y la estima del bien común, el respeto a los demás y la participación colectiva; son indicios de:',6,25,NULL),(218,' Escribe la Misión del SEUAT según el Modelo educativo:',6,25,NULL),(219,'Escribe la Visión del SEUAT según el Modelo Educativo:',6,25,NULL),(220,'Son valores que se deben de ejercer en SEUAT según el Modelo Educativo:',6,25,NULL),(221,'Son ejes de la formación profesional del estudiante desde la perspectiva del modelo educativo.',6,25,NULL),(222,'Está diseñado para la atención del estudiante en el trayecto de toda su formación profesional, vista de diferentes perspectivas como son formación integral, movilidad de estudiante, asesoría académica, tutorías, etc.',6,25,NULL),(223,'Es una herramienta formativa diseñada en tres sentidos, didáctica, epistémica y metodológica. Desde la didáctica, establece las condiciones para aprender a aprender a investigar. Desde la herramienta epistémica, el mismo proceso didáctico genera conocimiento de la realidad. A su vez, se traduce en una herramienta metodológica en la medida que el estudiante construye un método acompañado de técnicas de investigación…',6,25,NULL),(224,'La información proporcionada durante la inducción a la universidad',7,26,NULL),(225,'La cantidad y calidad de la información proporcionada durante la inducción',7,26,NULL),(226,'Las actividades que se llevaron a cabo en la inducción a la universidad',7,26,NULL),(227,'Las dinámicas realizadas en las actividades de inducción a la universidad',7,26,NULL),(228,'La utilidad de la información proporcionada en la inducción a la universidad',7,26,NULL),(229,'El apoyo brindado por el personal encargado de la inducción a la universidad',7,26,NULL),(230,'El dominio de los temas del personal encargado de la inducción',7,26,NULL),(235,'Señale las razones más importantes por las que eligió su carrera: (marque tres)',7,27,NULL),(237,'Había visto o escuchado antes algún anuncio de la Universidad SEUAT',7,27,NULL),(241,'Por qué medio se enteró de la universidad',7,27,NULL),(242,'El medio por el cuál se enteró lo motivó a acercarse a la Universidad SEUAT',7,27,NULL),(243,'La información presentada en los medios le fue de utilidad',7,27,NULL),(244,'La información proporcionada durante el curso de inducción le fue de utilidad',7,27,NULL);
/*!40000 ALTER TABLE `t_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_preguntas_x_opc_respuestas`
--

DROP TABLE IF EXISTS `t_preguntas_x_opc_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_preguntas_x_opc_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_preguntas` int(11) DEFAULT NULL,
  `id_opc_respuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_preguntas` (`id_preguntas`),
  KEY `id_opc_respuesta` (`id_opc_respuesta`),
  CONSTRAINT `t_preguntas_x_opc_respuestas_ibfk_1` FOREIGN KEY (`id_preguntas`) REFERENCES `t_preguntas` (`id`),
  CONSTRAINT `t_preguntas_x_opc_respuestas_ibfk_2` FOREIGN KEY (`id_opc_respuesta`) REFERENCES `t_opciones_respuestas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_preguntas_x_opc_respuestas`
--

LOCK TABLES `t_preguntas_x_opc_respuestas` WRITE;
/*!40000 ALTER TABLE `t_preguntas_x_opc_respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_preguntas_x_opc_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_respuestas`
--

DROP TABLE IF EXISTS `t_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_opcion_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `tiempo_dedicado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_respuestas_t_encuesta` (`id_encuesta`),
  KEY `FK_t_respuestas_t_materias` (`id_materia`),
  KEY `FK_t_respuestas_t_docente` (`id_docente`),
  KEY `FK_t_respuestas_t_alumnos` (`id_alumno`),
  KEY `FK_t_respuestas_t_opciones_respuestas` (`id_opcion_respuesta`),
  KEY `t_respuestas_t_preguntas_FK` (`id_pregunta`),
  CONSTRAINT `FK_t_respuestas_t_alumnos` FOREIGN KEY (`id_alumno`) REFERENCES `t_alumnos` (`id`),
  CONSTRAINT `FK_t_respuestas_t_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  CONSTRAINT `FK_t_respuestas_t_materias` FOREIGN KEY (`id_materia`) REFERENCES `t_materias` (`id`),
  CONSTRAINT `FK_t_respuestas_t_opciones_respuestas` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  CONSTRAINT `t_respuestas_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2079 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_respuestas`
--

LOCK TABLES `t_respuestas` WRITE;
/*!40000 ALTER TABLE `t_respuestas` DISABLE KEYS */;
INSERT INTO `t_respuestas` VALUES (1785,2,2,673,131,77,1,1,100),(1786,2,3,673,131,77,2,1,100),(1787,2,4,673,131,77,1,1,100),(1788,2,5,673,131,77,3,1,100),(1789,2,6,673,131,77,1,1,100),(1790,2,7,673,131,77,1,1,100),(1791,2,8,673,131,77,3,1,100),(1792,2,9,673,131,77,2,1,100),(1793,2,10,673,131,77,2,1,100),(1794,2,11,673,131,77,1,1,100),(1795,2,12,673,131,77,1,1,100),(1796,2,13,673,131,77,3,1,100),(1797,2,14,673,131,77,1,1,100),(1798,2,15,673,131,77,2,1,100),(1799,2,16,673,131,77,1,1,100),(1800,2,17,673,131,77,3,1,100),(1801,2,18,673,131,77,1,1,100),(1802,2,19,673,131,77,2,1,100),(1803,2,20,673,131,77,1,1,100),(1804,2,21,673,131,77,2,1,100),(1805,2,22,673,131,77,1,1,100),(1806,2,23,673,131,77,2,1,100),(1807,2,24,673,131,77,1,1,100),(1808,2,25,673,131,77,2,1,100),(1809,2,26,673,131,77,1,1,100),(1810,2,27,673,131,77,2,1,100),(1811,2,28,673,131,77,1,1,100),(1812,2,29,673,131,77,2,1,100),(1813,2,30,673,131,77,1,1,100),(1814,2,31,673,131,77,2,1,100),(1815,2,32,673,131,77,1,1,100),(1816,2,33,673,131,77,2,1,100),(1817,2,34,673,131,77,1,1,100),(1818,2,36,673,131,77,2,1,100),(1819,2,37,673,131,77,1,1,100),(1820,2,38,673,131,77,1,1,100),(1821,2,40,673,131,77,1,1,100),(1822,2,41,673,131,77,2,1,100),(1823,2,42,673,131,77,2,1,100),(1824,2,43,673,131,77,1,1,100),(1825,2,44,673,131,77,2,1,100),(1826,2,45,673,131,77,1,1,100),(1827,2,46,673,131,77,1,1,100),(1828,2,47,673,131,77,1,1,100),(1829,2,48,673,131,77,2,1,100),(1830,2,49,673,131,77,1,1,100),(1831,2,50,673,131,77,1,1,100),(1832,2,39,673,131,77,2,1,100),(1833,2,35,673,131,77,1,1,100),(1834,2,2,675,129,77,2,1,100),(1835,2,3,675,129,77,2,1,100),(1836,2,4,675,129,77,1,1,100),(1837,2,5,675,129,77,2,1,100),(1838,2,6,675,129,77,1,1,100),(1839,2,7,675,129,77,1,1,100),(1840,2,8,675,129,77,3,1,100),(1841,2,9,675,129,77,1,1,100),(1842,2,10,675,129,77,3,1,100),(1843,2,11,675,129,77,2,1,100),(1844,2,12,675,129,77,1,1,100),(1845,2,13,675,129,77,3,1,100),(1846,2,14,675,129,77,1,1,100),(1847,2,15,675,129,77,3,1,100),(1848,2,16,675,129,77,4,1,100),(1849,2,17,675,129,77,1,1,100),(1850,2,18,675,129,77,2,1,100),(1851,2,19,675,129,77,1,1,100),(1852,2,20,675,129,77,2,1,100),(1853,2,21,675,129,77,1,1,100),(1854,2,22,675,129,77,2,1,100),(1855,2,23,675,129,77,1,1,100),(1856,2,24,675,129,77,1,1,100),(1857,2,25,675,129,77,3,1,100),(1858,2,26,675,129,77,1,1,100),(1859,2,27,675,129,77,3,1,100),(1860,2,28,675,129,77,1,1,100),(1861,2,29,675,129,77,2,1,100),(1862,2,30,675,129,77,1,1,100),(1863,2,31,675,129,77,3,1,100),(1864,2,32,675,129,77,1,1,100),(1865,2,33,675,129,77,1,1,100),(1866,2,34,675,129,77,3,1,100),(1867,2,35,675,129,77,1,1,100),(1868,2,36,675,129,77,1,1,100),(1869,2,37,675,129,77,1,1,100),(1870,2,38,675,129,77,1,1,100),(1871,2,39,675,129,77,1,1,100),(1872,2,40,675,129,77,1,1,100),(1873,2,41,675,129,77,2,1,100),(1874,2,42,675,129,77,1,1,100),(1875,2,43,675,129,77,2,1,100),(1876,2,45,675,129,77,1,1,100),(1877,2,46,675,129,77,2,1,100),(1878,2,47,675,129,77,1,1,100),(1879,2,48,675,129,77,2,1,100),(1880,2,49,675,129,77,1,1,100),(1881,2,50,675,129,77,1,1,100),(1882,2,44,675,129,77,1,1,100),(1883,2,2,676,129,77,1,1,100),(1884,2,3,676,129,77,2,1,100),(1885,2,5,676,129,77,1,1,100),(1886,2,7,676,129,77,1,1,100),(1887,2,8,676,129,77,1,1,100),(1888,2,9,676,129,77,1,1,100),(1889,2,10,676,129,77,2,1,100),(1890,2,11,676,129,77,1,1,100),(1891,2,12,676,129,77,1,1,100),(1892,2,13,676,129,77,2,1,100),(1893,2,14,676,129,77,1,1,100),(1894,2,15,676,129,77,2,1,100),(1895,2,16,676,129,77,1,1,100),(1896,2,18,676,129,77,1,1,100),(1897,2,19,676,129,77,2,1,100),(1898,2,20,676,129,77,2,1,100),(1899,2,21,676,129,77,1,1,100),(1900,2,22,676,129,77,2,1,100),(1901,2,23,676,129,77,1,1,100),(1902,2,24,676,129,77,1,1,100),(1903,2,25,676,129,77,1,1,100),(1904,2,26,676,129,77,1,1,100),(1905,2,27,676,129,77,2,1,100),(1906,2,28,676,129,77,1,1,100),(1907,2,29,676,129,77,2,1,100),(1908,2,30,676,129,77,1,1,100),(1909,2,31,676,129,77,2,1,100),(1910,2,32,676,129,77,1,1,100),(1911,2,33,676,129,77,2,1,100),(1912,2,34,676,129,77,1,1,100),(1913,2,35,676,129,77,2,1,100),(1914,2,36,676,129,77,1,1,100),(1915,2,37,676,129,77,2,1,100),(1916,2,38,676,129,77,1,1,100),(1917,2,39,676,129,77,2,1,100),(1918,2,40,676,129,77,1,1,100),(1919,2,41,676,129,77,2,1,100),(1920,2,42,676,129,77,1,1,100),(1921,2,43,676,129,77,2,1,100),(1922,2,44,676,129,77,1,1,100),(1923,2,45,676,129,77,2,1,100),(1924,2,46,676,129,77,1,1,100),(1925,2,47,676,129,77,1,1,100),(1926,2,48,676,129,77,2,1,100),(1927,2,49,676,129,77,1,1,100),(1928,2,50,676,129,77,2,1,100),(1929,2,6,676,129,77,1,1,100),(1930,2,17,676,129,77,1,1,100),(1931,2,4,676,129,77,4,1,100),(1932,2,2,675,129,78,1,1,100),(1933,2,3,675,129,78,1,1,100),(1934,2,4,675,129,78,2,1,100),(1935,2,5,675,129,78,1,1,100),(1936,2,6,675,129,78,2,1,100),(1937,2,7,675,129,78,1,1,100),(1938,2,8,675,129,78,2,1,100),(1939,2,9,675,129,78,1,1,100),(1940,2,10,675,129,78,1,1,100),(1941,2,11,675,129,78,2,1,100),(1942,2,12,675,129,78,1,1,100),(1943,2,13,675,129,78,3,1,100),(1944,2,14,675,129,78,1,1,100),(1945,2,15,675,129,78,2,1,100),(1946,2,16,675,129,78,1,1,100),(1947,2,17,675,129,78,3,1,100),(1948,2,18,675,129,78,1,1,100),(1949,2,19,675,129,78,2,1,100),(1950,2,20,675,129,78,1,1,100),(1951,2,21,675,129,78,2,1,100),(1952,2,22,675,129,78,2,1,100),(1953,2,23,675,129,78,1,1,100),(1954,2,24,675,129,78,1,1,100),(1955,2,25,675,129,78,2,1,100),(1956,2,26,675,129,78,1,1,100),(1957,2,27,675,129,78,2,1,100),(1958,2,28,675,129,78,1,1,100),(1959,2,29,675,129,78,2,1,100),(1960,2,30,675,129,78,1,1,100),(1961,2,31,675,129,78,3,1,100),(1962,2,32,675,129,78,1,1,100),(1963,2,33,675,129,78,1,1,100),(1964,2,34,675,129,78,2,1,100),(1965,2,35,675,129,78,1,1,100),(1966,2,36,675,129,78,2,1,100),(1967,2,37,675,129,78,1,1,100),(1968,2,38,675,129,78,2,1,100),(1969,2,39,675,129,78,1,1,100),(1970,2,40,675,129,78,2,1,100),(1971,2,41,675,129,78,1,1,100),(1972,2,42,675,129,78,2,1,100),(1973,2,43,675,129,78,1,1,100),(1974,2,44,675,129,78,2,1,100),(1975,2,45,675,129,78,1,1,100),(1976,2,46,675,129,78,2,1,100),(1977,2,47,675,129,78,1,1,100),(1978,2,48,675,129,78,1,1,100),(1979,2,49,675,129,78,4,1,100),(1980,2,50,675,129,78,4,1,100),(1981,2,2,675,129,79,4,1,100),(1982,2,3,675,129,79,3,1,100),(1983,2,4,675,129,79,4,1,100),(1984,2,5,675,129,79,3,1,100),(1985,2,6,675,129,79,4,1,100),(1986,2,7,675,129,79,3,1,100),(1987,2,8,675,129,79,4,1,100),(1988,2,9,675,129,79,3,1,100),(1989,2,10,675,129,79,4,1,100),(1990,2,11,675,129,79,3,1,100),(1991,2,12,675,129,79,4,1,100),(1992,2,13,675,129,79,3,1,100),(1993,2,14,675,129,79,4,1,100),(1994,2,15,675,129,79,3,1,100),(1995,2,16,675,129,79,4,1,100),(1996,2,17,675,129,79,3,1,100),(1997,2,18,675,129,79,2,1,100),(1998,2,19,675,129,79,2,1,100),(1999,2,20,675,129,79,2,1,100),(2000,2,21,675,129,79,3,1,100),(2001,2,22,675,129,79,2,1,100),(2002,2,23,675,129,79,2,1,100),(2003,2,24,675,129,79,2,1,100),(2004,2,25,675,129,79,2,1,100),(2005,2,26,675,129,79,3,1,100),(2006,2,27,675,129,79,3,1,100),(2007,2,28,675,129,79,3,1,100),(2008,2,29,675,129,79,3,1,100),(2009,2,30,675,129,79,3,1,100),(2010,2,31,675,129,79,2,1,100),(2011,2,32,675,129,79,3,1,100),(2012,2,33,675,129,79,3,1,100),(2013,2,34,675,129,79,3,1,100),(2014,2,35,675,129,79,2,1,100),(2015,2,36,675,129,79,3,1,100),(2016,2,37,675,129,79,2,1,100),(2017,2,38,675,129,79,4,1,100),(2018,2,39,675,129,79,2,1,100),(2019,2,40,675,129,79,3,1,100),(2020,2,41,675,129,79,3,1,100),(2021,2,42,675,129,79,4,1,100),(2022,2,43,675,129,79,3,1,100),(2023,2,44,675,129,79,2,1,100),(2024,2,45,675,129,79,3,1,100),(2025,2,46,675,129,79,2,1,100),(2026,2,47,675,129,79,3,1,100),(2027,2,48,675,129,79,1,1,100),(2028,2,49,675,129,79,1,1,100),(2029,2,50,675,129,79,2,1,100),(2030,2,2,675,129,80,2,1,100),(2031,2,3,675,129,80,3,1,100),(2032,2,4,675,129,80,4,1,100),(2033,2,5,675,129,80,4,1,100),(2034,2,6,675,129,80,4,1,100),(2035,2,7,675,129,80,1,1,100),(2036,2,8,675,129,80,4,1,100),(2037,2,9,675,129,80,1,1,100),(2038,2,10,675,129,80,4,1,100),(2039,2,11,675,129,80,1,1,100),(2040,2,12,675,129,80,4,1,100),(2041,2,13,675,129,80,1,1,100),(2042,2,14,675,129,80,4,1,100),(2043,2,15,675,129,80,2,1,100),(2044,2,16,675,129,80,3,1,100),(2045,2,17,675,129,80,4,1,100),(2046,2,18,675,129,80,1,1,100),(2047,2,19,675,129,80,2,1,100),(2048,2,20,675,129,80,3,1,100),(2049,2,21,675,129,80,4,1,100),(2050,2,22,675,129,80,1,1,100),(2051,2,23,675,129,80,3,1,100),(2052,2,24,675,129,80,4,1,100),(2053,2,25,675,129,80,1,1,100),(2054,2,26,675,129,80,2,1,100),(2055,2,27,675,129,80,3,1,100),(2056,2,28,675,129,80,4,1,100),(2057,2,29,675,129,80,2,1,100),(2058,2,30,675,129,80,4,1,100),(2059,2,31,675,129,80,4,1,100),(2060,2,32,675,129,80,4,1,100),(2061,2,33,675,129,80,3,1,100),(2062,2,34,675,129,80,4,1,100),(2063,2,35,675,129,80,3,1,100),(2064,2,36,675,129,80,4,1,100),(2065,2,37,675,129,80,2,1,100),(2066,2,38,675,129,80,3,1,100),(2067,2,39,675,129,80,4,1,100),(2068,2,40,675,129,80,2,1,100),(2069,2,41,675,129,80,4,1,100),(2070,2,42,675,129,80,3,1,100),(2071,2,43,675,129,80,2,1,100),(2072,2,44,675,129,80,4,1,100),(2073,2,45,675,129,80,3,1,100),(2074,2,46,675,129,80,1,1,100),(2075,2,47,675,129,80,4,1,100),(2076,2,48,675,129,80,2,1,100),(2077,2,49,675,129,80,4,1,100),(2078,2,50,675,129,80,3,1,100);
/*!40000 ALTER TABLE `t_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_respuestas_autoevaluacion_docente`
--

DROP TABLE IF EXISTS `t_respuestas_autoevaluacion_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_respuestas_autoevaluacion_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_respuestas_autoevaluacion_docente_t_encuesta_FK` (`id_encuesta`),
  KEY `t_respuestas_autoevaluacion_docente_t_preguntas_FK` (`id_pregunta`),
  KEY `t_respuestas_autoevaluacion_docente_t_docente_FK` (`id_docente`),
  KEY `t_respuestas_autoevaluacion_docente_t_opciones_respuestas_FK` (`id_respuesta`),
  CONSTRAINT `t_respuestas_autoevaluacion_docente_t_docente_FK` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  CONSTRAINT `t_respuestas_autoevaluacion_docente_t_encuesta_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  CONSTRAINT `t_respuestas_autoevaluacion_docente_t_opciones_respuestas_FK` FOREIGN KEY (`id_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  CONSTRAINT `t_respuestas_autoevaluacion_docente_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_respuestas_autoevaluacion_docente`
--

LOCK TABLES `t_respuestas_autoevaluacion_docente` WRITE;
/*!40000 ALTER TABLE `t_respuestas_autoevaluacion_docente` DISABLE KEYS */;
INSERT INTO `t_respuestas_autoevaluacion_docente` VALUES (225,1,51,129,5,1,100),(226,1,52,129,7,1,100),(227,1,53,129,7,1,100),(228,1,54,129,7,1,100),(229,1,55,129,6,1,100),(230,1,56,129,8,1,100),(231,1,57,129,9,1,100),(232,1,58,129,8,1,100),(233,1,59,129,9,1,100),(234,1,60,129,6,1,100),(235,1,61,129,8,1,100),(236,1,62,129,5,1,100),(237,1,63,129,7,1,100),(238,1,64,129,7,1,100),(239,1,65,129,6,1,100),(240,1,66,129,7,1,100),(241,1,67,129,8,1,100),(242,1,68,129,6,1,100),(243,1,69,129,7,1,100),(244,1,70,129,9,1,100),(245,1,71,129,6,1,100),(246,1,72,129,7,1,100),(247,1,73,129,8,1,100),(248,1,74,129,7,1,100),(249,1,75,129,5,1,100),(250,1,76,129,8,1,100),(251,1,77,129,8,1,100),(252,1,78,129,7,1,100),(253,1,79,129,7,1,100),(254,1,80,129,8,1,100),(255,1,81,129,7,1,100),(256,1,82,129,7,1,100),(257,1,83,129,8,1,100),(258,1,84,129,7,1,100),(259,1,85,129,7,1,100),(260,1,86,129,8,1,100),(261,1,87,129,5,1,100),(262,1,88,129,8,1,100),(263,1,89,129,7,1,100),(264,1,90,129,6,1,100),(265,1,91,129,5,1,100),(266,1,92,129,7,1,100),(267,1,93,129,6,1,100),(268,1,94,129,6,1,100),(269,1,95,129,6,1,100),(270,1,96,129,6,1,100),(271,1,97,129,6,1,100),(272,1,98,129,6,1,100),(273,1,51,130,7,1,100),(274,1,52,130,6,1,100),(275,1,53,130,5,1,100),(276,1,54,130,7,1,100),(277,1,55,130,8,1,100),(278,1,56,130,6,1,100),(279,1,57,130,5,1,100),(280,1,58,130,7,1,100),(281,1,59,130,6,1,100),(282,1,60,130,5,1,100),(283,1,61,130,7,1,100),(284,1,62,130,6,1,100),(285,1,63,130,5,1,100),(286,1,64,130,8,1,100),(287,1,65,130,9,1,100),(288,1,66,130,5,1,100),(289,1,67,130,6,1,100),(290,1,68,130,8,1,100),(291,1,69,130,5,1,100),(292,1,70,130,5,1,100),(293,1,71,130,8,1,100),(294,1,72,130,7,1,100),(295,1,73,130,6,1,100),(296,1,74,130,9,1,100),(297,1,75,130,5,1,100),(298,1,76,130,6,1,100),(299,1,77,130,7,1,100),(300,1,78,130,7,1,100),(301,1,79,130,9,1,100),(302,1,80,130,5,1,100),(303,1,81,130,8,1,100),(304,1,82,130,7,1,100),(305,1,83,130,6,1,100),(306,1,84,130,8,1,100),(307,1,85,130,5,1,100),(308,1,86,130,9,1,100),(309,1,87,130,6,1,100),(310,1,88,130,8,1,100),(311,1,89,130,6,1,100),(312,1,90,130,5,1,100),(313,1,91,130,7,1,100),(314,1,92,130,8,1,100),(315,1,93,130,9,1,100),(316,1,94,130,6,1,100),(317,1,95,130,8,1,100),(318,1,96,130,5,1,100),(319,1,97,130,6,1,100),(320,1,98,130,9,1,100);
/*!40000 ALTER TABLE `t_respuestas_autoevaluacion_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_respuestas_evaluacion_modelo_educativo`
--

DROP TABLE IF EXISTS `t_respuestas_evaluacion_modelo_educativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_respuestas_evaluacion_modelo_educativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_opcion_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `tiempo_dedicado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_respuestas_evaluacion_modelo_educativo_t_encuesta_FK` (`id_encuesta`),
  KEY `t_respuestas_evaluacion_modelo_educativo_t_preguntas_FK` (`id_pregunta`),
  KEY `t_respuestas_evaluacion_modelo_educativo_t_docente_FK` (`id_docente`),
  KEY `ion_modelo_educativo_t_opciones_respiple_FK` (`id_opcion_respuesta`),
  CONSTRAINT `ion_modelo_educativo_t_opciones_respiple_FK` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `t_opciones_respuestas_opcion_multiple` (`id`),
  CONSTRAINT `t_respuestas_evaluacion_modelo_educativo_t_docente_FK` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  CONSTRAINT `t_respuestas_evaluacion_modelo_educativo_t_encuesta_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  CONSTRAINT `t_respuestas_evaluacion_modelo_educativo_t_preguntas_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_respuestas_evaluacion_modelo_educativo`
--

LOCK TABLES `t_respuestas_evaluacion_modelo_educativo` WRITE;
/*!40000 ALTER TABLE `t_respuestas_evaluacion_modelo_educativo` DISABLE KEYS */;
INSERT INTO `t_respuestas_evaluacion_modelo_educativo` VALUES (122,6,209,129,83,1,100),(123,6,210,129,87,1,100),(124,6,211,129,89,1,100),(125,6,212,129,93,1,100),(126,6,213,129,96,1,100),(127,6,214,129,100,1,100),(128,6,215,129,102,1,100),(129,6,216,129,104,1,100),(130,6,217,129,108,1,100),(131,6,218,129,124,1,100),(132,6,219,129,127,1,100),(133,6,220,129,113,1,100),(134,6,221,129,115,1,100),(135,6,222,129,119,1,100),(136,6,223,129,122,1,100),(152,6,209,130,84,1,100),(153,6,210,130,87,1,100),(154,6,211,130,89,1,100),(155,6,212,130,94,1,100),(156,6,213,130,96,1,100),(157,6,214,130,98,1,100),(158,6,215,130,103,1,100),(159,6,216,130,105,1,100),(160,6,217,130,107,1,100),(161,6,218,130,125,1,100),(162,6,219,130,126,1,100),(163,6,220,130,113,1,100),(164,6,221,130,115,1,100),(165,6,222,130,119,1,100),(166,6,223,130,121,1,100);
/*!40000 ALTER TABLE `t_respuestas_evaluacion_modelo_educativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_respuestas_heteroevaluacion_docente`
--

DROP TABLE IF EXISTS `t_respuestas_heteroevaluacion_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_respuestas_heteroevaluacion_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) DEFAULT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_respuesta` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_respuestas_heteroevaluacion_docente_FK` (`id_encuesta`),
  KEY `t_respuestas_heteroevaluacion_docente_FK_1` (`id_pregunta`),
  KEY `t_respuestas_heteroevaluacion_docente_FK_2` (`id_docente`),
  KEY `t_respuestas_heteroevaluacion_docente_FK_4` (`id_curso`),
  KEY `t_respuestas_heteroevaluacion_docente_FK_3` (`id_respuesta`),
  CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK` FOREIGN KEY (`id_encuesta`) REFERENCES `t_encuesta` (`id`),
  CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_1` FOREIGN KEY (`id_pregunta`) REFERENCES `t_preguntas` (`id`),
  CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_2` FOREIGN KEY (`id_docente`) REFERENCES `t_docente` (`id`),
  CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_3` FOREIGN KEY (`id_respuesta`) REFERENCES `t_opciones_respuestas` (`id`),
  CONSTRAINT `t_respuestas_heteroevaluacion_docente_FK_4` FOREIGN KEY (`id_curso`) REFERENCES `t_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_respuestas_heteroevaluacion_docente`
--

LOCK TABLES `t_respuestas_heteroevaluacion_docente` WRITE;
/*!40000 ALTER TABLE `t_respuestas_heteroevaluacion_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_respuestas_heteroevaluacion_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_subcategoria_preguntas`
--

DROP TABLE IF EXISTS `t_subcategoria_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_subcategoria_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_subcategoria_preguntas_t_categorias_preguntas` (`id_categoria`),
  CONSTRAINT `FK_t_subcategoria_preguntas_t_categorias_preguntas` FOREIGN KEY (`id_categoria`) REFERENCES `t_categorias_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_subcategoria_preguntas`
--

LOCK TABLES `t_subcategoria_preguntas` WRITE;
/*!40000 ALTER TABLE `t_subcategoria_preguntas` DISABLE KEYS */;
INSERT INTO `t_subcategoria_preguntas` VALUES (2,'IDENTIDAD INSTITUCIONAL',1),(3,'PLANEACION DEL PROCESO DE APRENDIZAJE',2),(5,'USO DEL TIEMPO',2),(6,'FACILITACIÓN DE LAS INTERACCIONES',2),(9,'ESTRATEGIAS PARA EL APRENDIZAJE',2),(11,'USO DE LAS TECNOLOGIAS DE LA INFORMACION Y COMUNICACION',2),(13,'EVALUACION DEL APRENDIZAJE',2),(15,'PROFESIONAL',3),(16,'PERSONAL',4),(17,'TUTORIAS',5),(18,'PAPEL DEL INSTRUCTOR',6),(19,'MATERIAL DE APOYO DOCUMENTAL (BIBLIOGRAFIA)',7),(20,'MATERIAL DE APOYO DIGITAL',8),(21,'ASPECTOS SOBRE EL CURSO IMPARTIDO',9),(22,'DOCENCIA',2),(25,'EVALUACION MODELO EDUCATIVO',10),(26,'COMO CONSIDERA...',11),(27,'TU OPINIÓN NOS INTERESA',12);
/*!40000 ALTER TABLE `t_subcategoria_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vacantes`
--

DROP TABLE IF EXISTS `t_vacantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_vacantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_carrera` tinyint(1) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vacantes`
--

LOCK TABLES `t_vacantes` WRITE;
/*!40000 ALTER TABLE `t_vacantes` DISABLE KEYS */;
INSERT INTO `t_vacantes` VALUES (1,'TÉCNICO RADIÓLOGO','tecnicoradiologo.jpg',1,1),(2,'TÉCNICO RADIÓLOGO','tecnicoradiologo2.jpg',1,1);
/*!40000 ALTER TABLE `t_vacantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'encuestas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-23 16:05:49
