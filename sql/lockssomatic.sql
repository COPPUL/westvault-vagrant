-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lockssomatic
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--
-- ORDER BY:  `id`

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`),
  CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--
-- ORDER BY:  `id`

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`),
  CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--
-- ORDER BY:  `id`

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_object_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`),
  CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity_ancestors`
--
-- ORDER BY:  `object_identity_id`,`ancestor_id`

LOCK TABLES `acl_object_identity_ancestors` WRITE;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--
-- ORDER BY:  `id`

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_security_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_properties`
--

DROP TABLE IF EXISTS `au_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `au_id` int(11) NOT NULL,
  `property_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_EFF7C3EE727ACA70` (`parent_id`),
  KEY `IDX_EFF7C3EEA791E56C` (`au_id`),
  CONSTRAINT `FK_EFF7C3EEA791E56C` FOREIGN KEY (`au_id`) REFERENCES `aus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EFF7C3EE727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `au_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_properties`
--
-- ORDER BY:  `id`

LOCK TABLES `au_properties` WRITE;
/*!40000 ALTER TABLE `au_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_status`
--

DROP TABLE IF EXISTS `au_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `au_id` int(11) DEFAULT NULL,
  `query_date` datetime NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `errors` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_56FE435CA791E56C` (`au_id`),
  CONSTRAINT `FK_56FE435CA791E56C` FOREIGN KEY (`au_id`) REFERENCES `aus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_status`
--
-- ORDER BY:  `id`

LOCK TABLES `au_status` WRITE;
/*!40000 ALTER TABLE `au_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aus`
--

DROP TABLE IF EXISTS `aus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pln_id` int(11) DEFAULT NULL,
  `contentprovider_id` int(11) DEFAULT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `managed` tinyint(1) NOT NULL,
  `auid` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2D10D530A4DBAA3C` (`pln_id`),
  KEY `IDX_2D10D530F021EE20` (`contentprovider_id`),
  KEY `IDX_2D10D530EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_2D10D530EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `plugins` (`id`),
  CONSTRAINT `FK_2D10D530A4DBAA3C` FOREIGN KEY (`pln_id`) REFERENCES `plns` (`id`),
  CONSTRAINT `FK_2D10D530F021EE20` FOREIGN KEY (`contentprovider_id`) REFERENCES `content_providers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aus`
--
-- ORDER BY:  `id`

LOCK TABLES `aus` WRITE;
/*!40000 ALTER TABLE `aus` DISABLE KEYS */;
/*!40000 ALTER TABLE `aus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box_status`
--

DROP TABLE IF EXISTS `box_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `box_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_id` int(11) DEFAULT NULL,
  `query_date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  `errors` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_D5A8258AD8177B3F` (`box_id`),
  CONSTRAINT `FK_D5A8258AD8177B3F` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_status`
--
-- ORDER BY:  `id`

LOCK TABLES `box_status` WRITE;
/*!40000 ALTER TABLE `box_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `box_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxes`
--

DROP TABLE IF EXISTS `boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pln_id` int(11) NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protocol` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `ws_port` int(11) NOT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_CDF1B2E9A4DBAA3C` (`pln_id`),
  CONSTRAINT `FK_CDF1B2E9A4DBAA3C` FOREIGN KEY (`pln_id`) REFERENCES `plns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxes`
--
-- ORDER BY:  `id`

LOCK TABLES `boxes` WRITE;
/*!40000 ALTER TABLE `boxes` DISABLE KEYS */;
INSERT INTO `boxes` (`id`, `pln_id`, `hostname`, `protocol`, `port`, `ws_port`, `ip_address`, `active`) VALUES (1,1,'localhost','TCP',9721,8081,'127.0.0.1',1);
INSERT INTO `boxes` (`id`, `pln_id`, `hostname`, `protocol`, `port`, `ws_port`, `ip_address`, `active`) VALUES (2,1,'localhost','TCP',9722,8082,'127.0.0.1',1);
INSERT INTO `boxes` (`id`, `pln_id`, `hostname`, `protocol`, `port`, `ws_port`, `ip_address`, `active`) VALUES (3,1,'localhost','TCP',9724,8084,'127.0.0.1',1);
INSERT INTO `boxes` (`id`, `pln_id`, `hostname`, `protocol`, `port`, `ws_port`, `ip_address`, `active`) VALUES (4,1,'localhost','TCP',9723,8083,'127.0.0.1',1);
/*!40000 ALTER TABLE `boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_status`
--

DROP TABLE IF EXISTS `cache_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boxstatus_id` int(11) DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_EF7C5E9E14F08779` (`boxstatus_id`),
  CONSTRAINT `FK_EF7C5E9E14F08779` FOREIGN KEY (`boxstatus_id`) REFERENCES `box_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_status`
--
-- ORDER BY:  `id`

LOCK TABLES `cache_status` WRITE;
/*!40000 ALTER TABLE `cache_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` int(11) DEFAULT NULL,
  `au_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `date_deposited` datetime NOT NULL,
  `checksum_type` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checksum_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recrawl` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEC530A99815E4B1` (`deposit_id`),
  KEY `IDX_FEC530A9A791E56C` (`au_id`),
  CONSTRAINT `FK_FEC530A9A791E56C` FOREIGN KEY (`au_id`) REFERENCES `aus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FEC530A99815E4B1` FOREIGN KEY (`deposit_id`) REFERENCES `deposits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--
-- ORDER BY:  `id`

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_owners`
--

DROP TABLE IF EXISTS `content_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_address` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_owners`
--
-- ORDER BY:  `id`

LOCK TABLES `content_owners` WRITE;
/*!40000 ALTER TABLE `content_owners` DISABLE KEYS */;
INSERT INTO `content_owners` (`id`, `name`, `email_address`) VALUES (1,'WestVault','wv@example.com');
/*!40000 ALTER TABLE `content_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_properties`
--

DROP TABLE IF EXISTS `content_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `property_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_value` longtext COLLATE utf8_unicode_ci,
  `is_list` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1EFA873584A0A3ED` (`content_id`),
  CONSTRAINT `FK_1EFA873584A0A3ED` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_properties`
--
-- ORDER BY:  `id`

LOCK TABLES `content_properties` WRITE;
/*!40000 ALTER TABLE `content_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_providers`
--

DROP TABLE IF EXISTS `content_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_owner_id` int(11) DEFAULT NULL,
  `pln_id` int(11) DEFAULT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `permissionUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_file_size` int(11) DEFAULT NULL,
  `max_au_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D2C29C142C8B8B16` (`content_owner_id`),
  KEY `IDX_D2C29C14A4DBAA3C` (`pln_id`),
  KEY `IDX_D2C29C14EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_D2C29C14EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `plugins` (`id`),
  CONSTRAINT `FK_D2C29C142C8B8B16` FOREIGN KEY (`content_owner_id`) REFERENCES `content_owners` (`id`),
  CONSTRAINT `FK_D2C29C14A4DBAA3C` FOREIGN KEY (`pln_id`) REFERENCES `plns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_providers`
--
-- ORDER BY:  `id`

LOCK TABLES `content_providers` WRITE;
/*!40000 ALTER TABLE `content_providers` DISABLE KEYS */;
INSERT INTO `content_providers` (`id`, `content_owner_id`, `pln_id`, `plugin_id`, `uuid`, `permissionUrl`, `name`, `max_file_size`, `max_au_size`) VALUES (1,1,1,1,'1AAB46A6-DA24-410A-9344-CBD9C1991B70','http://localhost:8181/westvaultpln/web/app_dev.php/permission','WestVault',100000,10000000);
/*!40000 ALTER TABLE `content_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_status`
--

DROP TABLE IF EXISTS `deposit_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` int(11) DEFAULT NULL,
  `agreement` double NOT NULL,
  `query_date` datetime NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_6A8B385D9815E4B1` (`deposit_id`),
  CONSTRAINT `FK_6A8B385D9815E4B1` FOREIGN KEY (`deposit_id`) REFERENCES `deposits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_status`
--
-- ORDER BY:  `id`

LOCK TABLES `deposit_status` WRITE;
/*!40000 ALTER TABLE `deposit_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_provider_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agreement` double DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_deposited` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_449E9C9ED17F50A6` (`uuid`),
  KEY `IDX_449E9C9E5979022C` (`content_provider_id`),
  KEY `IDX_449E9C9EA76ED395` (`user_id`),
  CONSTRAINT `FK_449E9C9EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `lom_user` (`id`),
  CONSTRAINT `FK_449E9C9E5979022C` FOREIGN KEY (`content_provider_id`) REFERENCES `content_providers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--
-- ORDER BY:  `id`

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keystore`
--

DROP TABLE IF EXISTS `keystore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keystore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keystore`
--
-- ORDER BY:  `id`

LOCK TABLES `keystore` WRITE;
/*!40000 ALTER TABLE `keystore` DISABLE KEYS */;
INSERT INTO `keystore` (`id`, `path`, `filename`) VALUES (1,'/var/www/lockssomatic/data/plnconfigs/1/plugins/pln_1.keystore','mjoyce.keystore');
/*!40000 ALTER TABLE `keystore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_entry`
--

DROP TABLE IF EXISTS `log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pln_id` int(11) DEFAULT NULL,
  `bundle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `user` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B5F762DA4DBAA3C` (`pln_id`),
  CONSTRAINT `FK_B5F762DA4DBAA3C` FOREIGN KEY (`pln_id`) REFERENCES `plns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_entry`
--
-- ORDER BY:  `id`

LOCK TABLES `log_entry` WRITE;
/*!40000 ALTER TABLE `log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lom_user`
--

DROP TABLE IF EXISTS `lom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lom_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `fullname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `institution` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3D661B5A92FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_3D661B5AA0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lom_user`
--
-- ORDER BY:  `id`

LOCK TABLES `lom_user` WRITE;
/*!40000 ALTER TABLE `lom_user` DISABLE KEYS */;
INSERT INTO `lom_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `fullname`, `institution`) VALUES (1,'admin@example.com','admin@example.com','admin@example.com','admin@example.com',1,'r6rkloezglc4sgoskc08c8ko4oc4os4','$2y$13$r6rkloezglc4sgoskc08cuwdRlMkmMWk/714q9rE92.ZYG8CQ5yrm','2017-10-08 16:37:27',0,0,NULL,NULL,NULL,'a:2:{i:0;s:16:\"ROLE_SUPER_ADMIN\";i:1;s:10:\"ROLE_ADMIN\";}',0,NULL,'Admin','example.com');
/*!40000 ALTER TABLE `lom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FA76ED395` (`user_id`),
  CONSTRAINT `FK_B6BD307FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `lom_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--
-- ORDER BY:  `id`

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plns`
--

DROP TABLE IF EXISTS `plns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keystore_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39C42B6BA60C6D52` (`keystore_id`),
  CONSTRAINT `FK_39C42B6BA60C6D52` FOREIGN KEY (`keystore_id`) REFERENCES `keystore` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plns`
--
-- ORDER BY:  `id`

LOCK TABLES `plns` WRITE;
/*!40000 ALTER TABLE `plns` DISABLE KEYS */;
INSERT INTO `plns` (`id`, `keystore_id`, `name`, `description`, `username`, `password`, `property`) VALUES (1,1,'WestVault','WestVault digital preservation service from COPPUL.','westvaultpln','ttmhwde','a:0:{}');
/*!40000 ALTER TABLE `plns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_properties`
--

DROP TABLE IF EXISTS `plugin_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `property_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_value` longtext COLLATE utf8_unicode_ci,
  `is_list` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_28F93FBC727ACA70` (`parent_id`),
  KEY `IDX_28F93FBCEC942BCF` (`plugin_id`),
  CONSTRAINT `FK_28F93FBCEC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_28F93FBC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `plugin_properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_properties`
--
-- ORDER BY:  `id`

LOCK TABLES `plugin_properties` WRITE;
/*!40000 ALTER TABLE `plugin_properties` DISABLE KEYS */;
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (1,NULL,1,'au_name','\"Preserved content from WestVault, part %d\", container_number',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (2,NULL,1,'au_permission_url',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (3,NULL,1,'plugin_crawl_type','HTML Links',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (4,NULL,1,'plugin_identifier','ca.sfu.lib.plugin.coppul.WestVaultPlugin',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (5,NULL,1,'plugin_name','COPPUL WestVault Plugin',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (6,NULL,1,'plugin_publishing_platform',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (7,NULL,1,'plugin_status',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (8,NULL,1,'plugin_version','1',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (9,NULL,1,'plugin_parent',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (10,NULL,1,'required_daemon_version',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (11,NULL,1,'au_crawlrules','a:3:{i:0;s:40:\"1,\"^%sfetch/[^/]+/[^/]+\\.zip$\", base_url\";i:1;s:22:\"1,\"^%s$\", manifest_url\";i:2;s:24:\"1,\"^%s$\", permission_url\";}',1);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (12,NULL,1,'au_start_url','a:2:{i:0;s:18:\"\"%s\", manifest_url\";i:1;s:20:\"\"%s\", permission_url\";}',1);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (13,NULL,1,'plugin_config_props',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (14,13,1,'configparamdescr',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (15,14,1,'key','base_url',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (16,14,1,'displayName','Base URL',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (17,14,1,'description','Usually of the form http://<journal-name>.com/',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (18,14,1,'type','3',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (19,14,1,'size','40',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (20,14,1,'definitional','true',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (21,14,1,'defaultOnly','false',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (22,13,1,'configparamdescr',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (23,22,1,'key','container_number',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (24,22,1,'displayName','Container No.',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (25,22,1,'description','WestVault content is organized in containers of a similar size',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (26,22,1,'type','6',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (27,22,1,'size','8',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (28,22,1,'definitional','true',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (29,22,1,'defaultOnly','false',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (30,13,1,'configparamdescr',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (31,30,1,'key','manifest_url',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (32,30,1,'displayName','Manifest URL',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (33,30,1,'description','URL for the manifest file (generated by LOCKSSOMatic) for this AU',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (34,30,1,'type','3',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (35,30,1,'size','200',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (36,30,1,'definitional','true',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (37,30,1,'defaultOnly','false',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (38,13,1,'configparamdescr',NULL,0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (39,38,1,'key','permission_url',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (40,38,1,'displayName','LOCKSS Permission Url',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (41,38,1,'description','URL for the LOCKSS permission statement on the server hosting the content',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (42,38,1,'type','3',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (43,38,1,'size','200',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (44,38,1,'definitional','true',0);
INSERT INTO `plugin_properties` (`id`, `parent_id`, `plugin_id`, `property_key`, `property_value`, `is_list`) VALUES (45,38,1,'defaultOnly','false',0);
/*!40000 ALTER TABLE `plugin_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--
-- ORDER BY:  `id`

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` (`id`, `name`, `path`, `filename`, `version`, `identifier`) VALUES (1,'COPPUL WestVault Plugin','/var/www/lockssomatic/data/lockss/plugins/WestVaultPlugin-v1.jar','WestVaultPlugin.jar',1,'ca.sfu.lib.plugin.coppul.WestVaultPlugin');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-08 17:22:07
