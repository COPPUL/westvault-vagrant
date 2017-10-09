-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: westvaultpln
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
-- Table structure for table `appuser`
--

DROP TABLE IF EXISTS `appuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `institution` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notify` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EE8A7C7492FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_EE8A7C74A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_EE8A7C74C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appuser`
--
-- ORDER BY:  `id`

LOCK TABLES `appuser` WRITE;
/*!40000 ALTER TABLE `appuser` DISABLE KEYS */;
INSERT INTO `appuser` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `fullname`, `institution`, `notify`) VALUES (1,'admin@example.com','admin@example.com','admin@example.com','admin@example.com',1,NULL,'$2y$13$yZu/OQv5WcQycdZtIcZaqe3MuvU490RbeI1ajO5j79NddfsY3C2aS','2017-10-08 16:36:21',NULL,NULL,'a:2:{i:0;s:16:\"ROLE_SUPER_ADMIN\";i:1;s:10:\"ROLE_ADMIN\";}','Admin','example.com',0);
/*!40000 ALTER TABLE `appuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_container`
--

DROP TABLE IF EXISTS `au_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_container`
--
-- ORDER BY:  `id`

LOCK TABLES `au_container` WRITE;
/*!40000 ALTER TABLE `au_container` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--
-- ORDER BY:  `id`

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) DEFAULT NULL,
  `au_container_id` int(11) DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deposit_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `received` datetime NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `checksum_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `checksum_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `error_log` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `error_count` int(11) NOT NULL,
  `pln_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `deposit_receipt` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `processing_log` longtext COLLATE utf8_unicode_ci NOT NULL,
  `harvest_attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_95DB9D39E2AB67BD` (`deposit_uuid`),
  KEY `IDX_95DB9D39A53A8AA` (`provider_id`),
  KEY `IDX_95DB9D39ABD493AD` (`au_container_id`),
  CONSTRAINT `FK_95DB9D39ABD493AD` FOREIGN KEY (`au_container_id`) REFERENCES `au_container` (`id`),
  CONSTRAINT `FK_95DB9D39A53A8AA` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--
-- ORDER BY:  `id`

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--
-- ORDER BY:  `id`

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--
-- ORDER BY:  `id`

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` (`id`, `uuid`, `name`, `email`) VALUES (1,'E1361745-C2B2-4EE5-9F7E-4CB34CE66594','corey',NULL);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_of_use`
--

DROP TABLE IF EXISTS `term_of_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_of_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `key_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_of_use`
--
-- ORDER BY:  `id`

LOCK TABLES `term_of_use` WRITE;
/*!40000 ALTER TABLE `term_of_use` DISABLE KEYS */;
INSERT INTO `term_of_use` (`id`, `weight`, `created`, `updated`, `key_code`, `lang_code`, `content`) VALUES (1,0,'2017-02-23 23:36:08','2017-02-23 23:36:08','plugins.generic.pln.terms_of_use.jm_has_authority','en-US','I have the authority to include this journal\'s content in a secure preservation network and, if and when necessary, to make the content accessible in the PKP-PLN and its successors.');
INSERT INTO `term_of_use` (`id`, `weight`, `created`, `updated`, `key_code`, `lang_code`, `content`) VALUES (2,1,'2017-02-23 23:36:42','2017-02-23 23:36:42','plugins.generic.pln.terms_of_use.licensing_is_current','en-US','I confirm that licensing information pertaining to articles in this journal is accurate at the time of publication.');
INSERT INTO `term_of_use` (`id`, `weight`, `created`, `updated`, `key_code`, `lang_code`, `content`) VALUES (3,2,'2017-02-23 23:37:15','2017-02-23 23:37:15','plugins.generic.pln.terms_of_use.trigger_events','en-US','I agree to make every reasonable effort to inform the PKP-PLN in the event this journal ceases publication. I acknowledge that PKP-PLN will also employ automated techniques to detect a potential trigger event and contact the journal to confirm their publication status.');
/*!40000 ALTER TABLE `term_of_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_of_use_history`
--

DROP TABLE IF EXISTS `term_of_use_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_of_use_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `change_set` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_of_use_history`
--
-- ORDER BY:  `id`

LOCK TABLES `term_of_use_history` WRITE;
/*!40000 ALTER TABLE `term_of_use_history` DISABLE KEYS */;
INSERT INTO `term_of_use_history` (`id`, `term_id`, `action`, `user`, `created`, `change_set`) VALUES (1,1,'create','admin@example.com','2017-02-23 23:36:08','a:7:{s:2:\"id\";a:2:{i:0;N;i:1;i:1;}s:6:\"weight\";a:2:{i:0;N;i:1;i:0;}s:7:\"keyCode\";a:2:{i:0;N;i:1;s:49:\"plugins.generic.pln.terms_of_use.jm_has_authority\";}s:8:\"langCode\";a:2:{i:0;N;i:1;s:5:\"en-US\";}s:7:\"content\";a:2:{i:0;N;i:1;s:181:\"I have the authority to include this journal\'s content in a secure preservation network and, if and when necessary, to make the content accessible in the PKP-PLN and its successors.\";}s:7:\"created\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:08\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}s:7:\"updated\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:08\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}}');
INSERT INTO `term_of_use_history` (`id`, `term_id`, `action`, `user`, `created`, `change_set`) VALUES (2,2,'create','admin@example.com','2017-02-23 23:36:42','a:7:{s:2:\"id\";a:2:{i:0;N;i:1;i:2;}s:6:\"weight\";a:2:{i:0;N;i:1;i:1;}s:7:\"keyCode\";a:2:{i:0;N;i:1;s:53:\"plugins.generic.pln.terms_of_use.licensing_is_current\";}s:8:\"langCode\";a:2:{i:0;N;i:1;s:5:\"en-US\";}s:7:\"content\";a:2:{i:0;N;i:1;s:115:\"I confirm that licensing information pertaining to articles in this journal is accurate at the time of publication.\";}s:7:\"created\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:42\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}s:7:\"updated\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:42\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}}');
INSERT INTO `term_of_use_history` (`id`, `term_id`, `action`, `user`, `created`, `change_set`) VALUES (3,3,'create','admin@example.com','2017-02-23 23:37:15','a:7:{s:2:\"id\";a:2:{i:0;N;i:1;i:3;}s:6:\"weight\";a:2:{i:0;N;i:1;i:2;}s:7:\"keyCode\";a:2:{i:0;N;i:1;s:47:\"plugins.generic.pln.terms_of_use.trigger_events\";}s:8:\"langCode\";a:2:{i:0;N;i:1;s:5:\"en-US\";}s:7:\"content\";a:2:{i:0;N;i:1;s:269:\"I agree to make every reasonable effort to inform the PKP-PLN in the event this journal ceases publication. I acknowledge that PKP-PLN will also employ automated techniques to detect a potential trigger event and contact the journal to confirm their publication status.\";}s:7:\"created\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:37:15\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}s:7:\"updated\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:37:15\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}}');
/*!40000 ALTER TABLE `term_of_use_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--
-- ORDER BY:  `id`

LOCK TABLES `whitelist` WRITE;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
INSERT INTO `whitelist` (`id`, `uuid`, `comment`, `created`) VALUES (1,'E1361745-C2B2-4EE5-9F7E-4CB34CE66594','a','2017-10-08 16:36:45');
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-08 17:21:56
