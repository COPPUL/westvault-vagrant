-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: owncloud
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
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `affecteduser` varchar(64) COLLATE utf8_bin NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `subjectparams` varchar(4000) COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `messageparams` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `file` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  KEY `activity_time` (`timestamp`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter_app` (`affecteduser`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--
-- ORDER BY:  `activity_id`

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (1,1507505724,30,'file_created','corey','corey','files','created_self','[{\"14\":false}]','','[]','','http://localhost:8181/owncloud/index.php/apps/files/?dir=','files',14);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (2,1507505724,30,'file_created','corey','corey','files','created_self','[{\"15\":\"\\/Documents\"}]','','[]','/Documents','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',15);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (3,1507505724,30,'file_created','corey','corey','files','created_self','[{\"16\":\"\\/Documents\\/Example.odt\"}]','','[]','/Documents/Example.odt','http://localhost:8181/owncloud/index.php/apps/files/?dir=/Documents','files',16);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (4,1507505724,30,'file_created','corey','corey','files','created_self','[{\"17\":\"\\/ownCloud Manual.pdf\"}]','','[]','/ownCloud Manual.pdf','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',17);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (5,1507505724,30,'file_created','corey','corey','files','created_self','[{\"18\":\"\\/Photos\"}]','','[]','/Photos','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',18);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (6,1507505725,30,'file_created','corey','corey','files','created_self','[{\"19\":\"\\/Photos\\/Paris.jpg\"}]','','[]','/Photos/Paris.jpg','http://localhost:8181/owncloud/index.php/apps/files/?dir=/Photos','files',19);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (7,1507505725,30,'file_created','corey','corey','files','created_self','[{\"20\":\"\\/Photos\\/Squirrel.jpg\"}]','','[]','/Photos/Squirrel.jpg','http://localhost:8181/owncloud/index.php/apps/files/?dir=/Photos','files',20);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (8,1507505725,30,'file_created','corey','corey','files','created_self','[{\"21\":\"\\/Photos\\/San Francisco.jpg\"}]','','[]','/Photos/San Francisco.jpg','http://localhost:8181/owncloud/index.php/apps/files/?dir=/Photos','files',21);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (9,1507505759,30,'file_created','corey','corey','files','created_self','[{\"22\":\"\\/lockss-preserved\"}]','','[]','/lockss-preserved','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',22);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (10,1507505759,30,'file_created','corey','corey','files','created_self','[{\"23\":\"\\/lockss-restored\"}]','','[]','/lockss-restored','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',23);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (11,1507507473,30,'file_deleted','corey','corey','files','deleted_self','[{\"17\":\"\\/ownCloud Manual.pdf\"}]','','[]','/ownCloud Manual.pdf','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',17);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (12,1507507473,30,'file_deleted','corey','corey','files','deleted_self','[{\"18\":\"\\/Photos\"}]','','[]','/Photos','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',18);
INSERT INTO `oc_activity` (`activity_id`, `timestamp`, `priority`, `type`, `user`, `affecteduser`, `app`, `subject`, `subjectparams`, `message`, `messageparams`, `file`, `link`, `object_type`, `object_id`) VALUES (13,1507507475,30,'file_deleted','corey','corey','files','deleted_self','[{\"15\":\"\\/Documents\"}]','','[]','/Documents','http://localhost:8181/owncloud/index.php/apps/files/?dir=/','files',15);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT '0',
  `amq_latest_send` int(11) NOT NULL DEFAULT '0',
  `amq_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8_bin NOT NULL,
  `amq_appid` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_subjectparams` varchar(4000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--
-- ORDER BY:  `mail_id`

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `addressbookid` int(11) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
INSERT INTO `oc_addressbookchanges` (`id`, `uri`, `synctoken`, `addressbookid`, `operation`) VALUES (1,'Database:corey.vcf',1,1,1);
INSERT INTO `oc_addressbookchanges` (`id`, `uri`, `synctoken`, `addressbookid`, `operation`) VALUES (2,'Database:mark.vcf',2,1,1);
INSERT INTO `oc_addressbookchanges` (`id`, `uri`, `synctoken`, `addressbookid`, `operation`) VALUES (3,'Database:janice.vcf',3,1,1);
INSERT INTO `oc_addressbookchanges` (`id`, `uri`, `synctoken`, `addressbookid`, `operation`) VALUES (4,'Database:admin.vcf',4,1,1);
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` (`id`, `principaluri`, `displayname`, `uri`, `description`, `synctoken`) VALUES (1,'principals/system/system','system','system','System addressbook which holds all users of this instance',5);
INSERT INTO `oc_addressbooks` (`id`, `principaluri`, `displayname`, `uri`, `description`, `synctoken`) VALUES (2,'principals/users/corey','Contacts','contacts',NULL,1);
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`),
  KEY `appconfig_appid_key` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--
-- ORDER BY:  `appid`,`configkey`

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('activity','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('activity','installed_version','2.3.2');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('activity','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('backgroundjob','lastjob','5');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('comments','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('comments','installed_version','0.3.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('comments','types','logging');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('configreport','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('configreport','installed_version','0.1.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('configreport','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('core','installedat','1507505011.1731');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('core','lastcron','1507507450');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('core','lastupdatedat','1507505011.1828');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('core','public_files','files_sharing/public.php');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('core','public_webdav','dav/appinfo/v1/publicwebdav.php');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('dav','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('dav','installed_version','0.2.7');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('dav','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('federatedfilesharing','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('federatedfilesharing','installed_version','0.3.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('federatedfilesharing','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('federation','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('federation','installed_version','0.1.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('federation','types','authentication');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files','installed_version','1.5.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_pdfviewer','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_pdfviewer','installed_version','0.8.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_pdfviewer','ocsid','166049');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_pdfviewer','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_sharing','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_sharing','installed_version','0.10.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_sharing','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_texteditor','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_texteditor','installed_version','2.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_texteditor','ocsid','166051');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_texteditor','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_trashbin','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_trashbin','installed_version','0.9.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_trashbin','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_versions','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_versions','installed_version','1.3.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_versions','types','filesystem');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_videoplayer','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_videoplayer','installed_version','0.9.8');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('files_videoplayer','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('firstrunwizard','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('firstrunwizard','installed_version','1.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('firstrunwizard','ocsid','166055');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('firstrunwizard','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('gallery','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('gallery','installed_version','15.0.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('gallery','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('notifications','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('notifications','installed_version','0.3.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('notifications','types','logging');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('provisioning_api','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('provisioning_api','installed_version','0.5.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('provisioning_api','types','prevent_group_restriction');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('systemtags','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('systemtags','installed_version','0.3.0');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('systemtags','types','logging');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('templateeditor','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('templateeditor','installed_version','0.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('templateeditor','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('updatenotification','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('updatenotification','installed_version','0.2.1');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('updatenotification','types','');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('westvault','enabled','yes');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('westvault','installed_version','0.0.5');
INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES ('westvault','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `login_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` longtext COLLATE utf8_bin,
  `name` longtext COLLATE utf8_bin NOT NULL,
  `token` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `last_check` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_index` (`last_activity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` (`id`, `uid`, `login_name`, `password`, `name`, `token`, `type`, `last_activity`, `last_check`) VALUES (1,'corey','corey','b29dcc58d5578bb31ec60e11826915b9|xi1Qq/tjr0uWK6S5|72d335dacecf5f45e4d17db43d2d88745db881931c7ddc58b1f869ff9cd6a56a03161c3e7754862b00f5b6f63d54f49417969462de8cf65127c55ba479bf57cd','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36','8168fc33744d1ab21bdd7f33fbe4f5394b773ba4999b257b49adaaf22d61fa2ca9efd69ec53279835343ff5e4ad8fe315cd98738142a96a4f0bca4f11c883ec2',0,1507508440,1507508230);
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `calendarid` int(11) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendarid_synctoken` (`calendarid`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `calendarid` int(10) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `classification` int(11) DEFAULT '0' COMMENT '0 - public, 1 - private, 2 - confidential',
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `timezone` longtext COLLATE utf8_bin,
  `components` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` (`id`, `principaluri`, `displayname`, `uri`, `synctoken`, `description`, `calendarorder`, `calendarcolor`, `timezone`, `components`, `transparent`) VALUES (1,'principals/system/system','Contact birthdays','contact_birthdays',1,NULL,0,'#FFFFCA',NULL,'VEVENT,VTODO',0);
INSERT INTO `oc_calendars` (`id`, `principaluri`, `displayname`, `uri`, `synctoken`, `description`, `calendarorder`, `calendarcolor`, `timezone`, `components`, `transparent`) VALUES (2,'principals/users/corey','Personal','personal',1,NULL,0,NULL,NULL,'VEVENT,VTODO',0);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `principaluri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `refreshrate` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT '0',
  `calendarcolor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` int(11) NOT NULL DEFAULT '0',
  `carddata` longblob,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
INSERT INTO `oc_cards` (`id`, `addressbookid`, `carddata`, `uri`, `lastmodified`, `etag`, `size`) VALUES (1,1,'BEGIN:VCARD\r\nVERSION:3.0\r\nPRODID:-//Sabre//Sabre VObject 3.5.0//EN\r\nUID:corey\r\nFN:corey\r\nN:corey;;;;\r\nCLOUD:corey@localhost:8181/owncloud\r\nEND:VCARD\r\n','Database:corey.vcf',1507505022,'68b838b3ca6db2b8cc11a198ea7e342a',150);
INSERT INTO `oc_cards` (`id`, `addressbookid`, `carddata`, `uri`, `lastmodified`, `etag`, `size`) VALUES (2,1,'BEGIN:VCARD\r\nVERSION:3.0\r\nPRODID:-//Sabre//Sabre VObject 3.5.0//EN\r\nUID:mark\r\nFN:mark\r\nN:mark;;;;\r\nCLOUD:mark@localhost:8181/owncloud\r\nEND:VCARD\r\n','Database:mark.vcf',1507505022,'9faeedef3e6cfe9e45f97f71723c7918',146);
INSERT INTO `oc_cards` (`id`, `addressbookid`, `carddata`, `uri`, `lastmodified`, `etag`, `size`) VALUES (3,1,'BEGIN:VCARD\r\nVERSION:3.0\r\nPRODID:-//Sabre//Sabre VObject 3.5.0//EN\r\nUID:janice\r\nFN:janice\r\nN:janice;;;;\r\nCLOUD:janice@localhost:8181/owncloud\r\nEND:VCARD\r\n','Database:janice.vcf',1507505023,'d08967dec4163fca501194d4170bb732',154);
INSERT INTO `oc_cards` (`id`, `addressbookid`, `carddata`, `uri`, `lastmodified`, `etag`, `size`) VALUES (4,1,'BEGIN:VCARD\r\nVERSION:3.0\r\nPRODID:-//Sabre//Sabre VObject 3.5.0//EN\r\nUID:admin\r\nFN:admin\r\nN:admin;;;;\r\nCLOUD:admin@localhost:8181/owncloud\r\nEND:VCARD\r\n','Database:admin.vcf',1507505715,'561bfd0b50718b7cc5879477fd8cd3f9',150);
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT '0',
  `cardid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (1,1,1,'UID','corey',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (2,1,1,'FN','corey',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (3,1,1,'N','corey;;;;',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (4,1,1,'CLOUD','corey@localhost:8181/owncloud',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (5,1,2,'UID','mark',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (6,1,2,'FN','mark',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (7,1,2,'N','mark;;;;',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (8,1,2,'CLOUD','mark@localhost:8181/owncloud',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (9,1,3,'UID','janice',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (10,1,3,'FN','janice',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (11,1,3,'N','janice;;;;',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (12,1,3,'CLOUD','janice@localhost:8181/owncloud',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (13,1,4,'UID','admin',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (14,1,4,'FN','admin',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (15,1,4,'N','admin;;;;',0);
INSERT INTO `oc_cards_properties` (`id`, `addressbookid`, `cardid`, `name`, `value`, `preferred`) VALUES (16,1,4,'CLOUD','admin@localhost:8181/owncloud',0);
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topmost_parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `children_count` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `actor_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_bin,
  `verb` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `comments_marker_index` (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--
-- ORDER BY:  `user_id`,`object_type`,`object_id`

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_credentials`
--

DROP TABLE IF EXISTS `oc_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_credentials` (
  `user` varchar(64) COLLATE utf8_bin NOT NULL,
  `identifier` varchar(64) COLLATE utf8_bin NOT NULL,
  `credentials` longtext COLLATE utf8_bin,
  PRIMARY KEY (`user`,`identifier`),
  KEY `credentials_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_credentials`
--
-- ORDER BY:  `user`,`identifier`

LOCK TABLES `oc_credentials` WRITE;
/*!40000 ALTER TABLE `oc_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` int(11) NOT NULL,
  `remote_id` int(11) NOT NULL COMMENT 'share ID at the remote server',
  UNIQUE KEY `share_id_index` (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--
-- ORDER BY:  `share_id`

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT '0',
  `key` varchar(64) COLLATE utf8_bin NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (1,0,'files/cb6b4c11e5e5642185bd52f5896a8bf8',1507508620);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (2,0,'files/c31e581b3c2ec56f9b7b1dca2421b72e',1507511051);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (3,0,'files/4e2153d5793e48ebfc9e604164f1bc22',1507511051);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (4,0,'files/75c34fc1dabe919787e074a5e071feda',1507509315);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (5,0,'files/05ccda512dc3c5a6aa82076b9bb9ed16',1507509315);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (6,0,'files/897d043ba5f794fef1c29680c3119f28',1507509325);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (7,0,'files/f84a1b21741c779b4a31da35553d80d1',1507509324);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (8,0,'files/92ff375cdff5b38347d55c60853166e3',1507511076);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (9,0,'files/e2969f81c7916c0218d0a2b06d743aac',1507509325);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (10,0,'files/2b976d1a5370825d447d9f30d04d9130',1507511073);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (11,0,'files/dc3743e6da381d0e33a11a5cf7bc8fc1',1507511074);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (12,0,'files/2cdcebf2d23f9125cc0e88100159a790',1507509325);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (13,0,'files/7e28e09a9cf6fcc2222640b68bedf846',1507509325);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (14,0,'files/233678f61f772cd6a0b8643d679652b5',1507509325);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (15,0,'files/2632fd372754fcabf5accf875cb88965',1507509325);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (16,0,'files/d95552abace78874ad807e4668d5a3a3',1507509359);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (17,0,'files/3fbcdb4333e8191218d257c1e9155969',1507509359);
INSERT INTO `oc_file_locks` (`id`, `lock`, `key`, `ttl`) VALUES (18,0,'files/2302bcbbeceee0035fe5814632045aa7',1507511051);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `storage` int(11) NOT NULL DEFAULT '0',
  `path` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mimetype` int(11) NOT NULL DEFAULT '0',
  `mimepart` int(11) NOT NULL DEFAULT '0',
  `size` bigint(20) NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `storage_mtime` int(11) NOT NULL DEFAULT '0',
  `encrypted` int(11) NOT NULL DEFAULT '0',
  `unencrypted_size` bigint(20) NOT NULL DEFAULT '0',
  `etag` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT '0',
  `checksum` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--
-- ORDER BY:  `fileid`

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,4770198,1507505011,1507505011,0,0,'59dab373abd29',23,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,4770198,1507505011,1507505011,0,0,'59dab373aadc3',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (3,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,36227,1507505011,1507505011,0,0,'59dab37386efc',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (4,1,'files/Documents/Example.odt','c89c560541b952a435783a7d51a27d50',3,'Example.odt',4,3,36227,1507505011,1507505011,0,0,'ea247fd0dfefecc44d275086331bc07e',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (5,1,'files/ownCloud Manual.pdf','a73aa0f95f162297bbb7ffa3fb5ad709',2,'ownCloud Manual.pdf',5,3,4055415,1507505011,1507505011,0,0,'3da331646c54491504318bbf40d6b5af',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (6,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,678556,1507505011,1507505011,0,0,'59dab373aadc3',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (7,1,'files/Photos/Paris.jpg','a208ddedf08367bbc56963107248dda5',6,'Paris.jpg',7,6,228761,1507505011,1507505011,0,0,'9222f1abe4580fdd0a6072cbd1672d6e',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (8,1,'files/Photos/Squirrel.jpg','de85d1da71bcd6232ad893f959063b8c',6,'Squirrel.jpg',7,6,233724,1507505011,1507505011,0,0,'5d68e5d6d447b97283c47e7201d480a0',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (9,1,'files/Photos/San Francisco.jpg','9fc714efbeaafee22f7058e73d2b1c3b',6,'San Francisco.jpg',7,6,216071,1507505011,1507505011,0,0,'08afb584b60c92f71dd86600f7dccd27',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (10,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,-1,1507505020,1507505020,0,0,'59dab37c89ad0',23,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (11,2,'files_external','c270928b685e7946199afdfb898d27ea',10,'files_external',2,1,0,1507505020,1507505020,0,0,'59dab37c87c82',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (12,3,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,4770198,1507507477,1507507473,0,0,'59dabd150a1c3',23,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (13,3,'cache','0fea6a13c52b4d4725368f24b045ca84',12,'cache',2,1,0,1507505724,1507505724,0,0,'59dab63c04dc8',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (14,3,'files','45b963397aa40d4a0063e0d85e4fe7a1',12,'files',2,1,0,1507507475,1507507475,0,0,'59dabd13f3842',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (15,3,'files_trashbin/files/Documents.d1507507475','babff3e2f96a037711db7972d9aa377a',25,'Documents.d1507507475',2,1,36227,1507505724,1507505724,0,0,'59dab63c9cd41',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (16,3,'files_trashbin/files/Documents.d1507507475/Example.odt','563e025f4762b1fde3cbc4b13f4f3470',15,'Example.odt',4,3,36227,1507505724,1507505724,0,0,'d0e0d8f5c92f30bd5d5c531f9d66b5a3',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (17,3,'files_trashbin/files/ownCloud Manual.pdf.d1507507473','78f8ad2a3c47f948a4f02073446eb53c',25,'ownCloud Manual.pdf.d1507507473',8,3,4055415,1507505724,1507505724,0,0,'9b8447530a336a6fd44fc8877b253dbb',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (18,3,'files_trashbin/files/Photos.d1507507474','39e70ef7a3deeaea8d51ff18b6559a99',25,'Photos.d1507507474',2,1,678556,1507505725,1507505725,0,0,'59dab63d2309f',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (19,3,'files_trashbin/files/Photos.d1507507474/Paris.jpg','e709305b27471b9fa55c579876074a3b',18,'Paris.jpg',7,6,228761,1507505725,1507505725,0,0,'8b670a283c6da21a52b0049279d5f2ff',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (20,3,'files_trashbin/files/Photos.d1507507474/Squirrel.jpg','323ee97a4a1e77252383419afb64aa8b',18,'Squirrel.jpg',7,6,233724,1507505725,1507505725,0,0,'251c922faf8e4f5f3edf3d296e9d149a',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (21,3,'files_trashbin/files/Photos.d1507507474/San Francisco.jpg','42eda0229dee7a41347971597adc6cc4',18,'San Francisco.jpg',7,6,216071,1507505725,1507505725,0,0,'253a1e4a2cba13e2b2e211cd9c8f93e2',27,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (22,3,'files/lockss-preserved','fd213394575ceba80e5a777f22f24b82',14,'lockss-preserved',2,1,0,1507505759,1507505759,0,0,'59dab65f6db41',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (23,3,'files/lockss-restored','7cc7a3f129f4620c7fa098ca970a6d4e',14,'lockss-restored',2,1,0,1507505759,1507505759,0,0,'59dab65fb5ea4',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (24,3,'files_trashbin','fb66dca5f27af6f15c1d1d81e6f8d28b',12,'files_trashbin',2,1,4770198,1507507475,1507507473,0,0,'59dabd13ea5ec',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (25,3,'files_trashbin/files','3014a771cbe30761f2e9ff3272110dbf',24,'files',2,1,4770198,1507507475,1507507475,0,0,'59dabd13ea5ec',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (26,3,'files_trashbin/versions','c639d144d3f1014051e14a98beac5705',24,'versions',2,1,0,1507507473,1507507473,0,0,'59dabd11357bf',31,'');
INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`, `checksum`) VALUES (27,3,'files_trashbin/keys','9195c7cfc1b867f229ac78cc1b6a0be3',24,'keys',2,1,0,1507507473,1507507473,0,0,'59dabd113e604',31,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--
-- ORDER BY:  `auto_id`

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
INSERT INTO `oc_files_trash` (`auto_id`, `id`, `user`, `timestamp`, `location`, `type`, `mime`) VALUES (1,'ownCloud Manual.pdf','corey','1507507473','.',NULL,NULL);
INSERT INTO `oc_files_trash` (`auto_id`, `id`, `user`, `timestamp`, `location`, `type`, `mime`) VALUES (2,'Photos','corey','1507507474','.',NULL,NULL);
INSERT INTO `oc_files_trash` (`auto_id`, `id`, `user`, `timestamp`, `location`, `type`, `mime`) VALUES (3,'Documents','corey','1507507475','.',NULL,NULL);
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--
-- ORDER BY:  `gid`,`uid`

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--
-- ORDER BY:  `gid`,`uid`

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES ('admin','admin');
INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES ('sfu','janice');
INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES ('sfu','mark');
INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES ('uvic','corey');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--
-- ORDER BY:  `gid`

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` (`gid`) VALUES ('admin');
INSERT INTO `oc_groups` (`gid`) VALUES ('sfu');
INSERT INTO `oc_groups` (`gid`) VALUES ('uvic');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `argument` varchar(4000) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT '0',
  `last_checked` int(11) DEFAULT '0',
  `reserved_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (1,'OCA\\DAV\\CardDAV\\SyncJob','null',1507505715,1507505715,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (2,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',1507505726,1507505726,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (3,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1507505733,1507505733,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (4,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1507505739,1507505739,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (5,'OCA\\Files_Sharing\\ExpireSharesJob','null',1507507450,1507507450,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (6,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (7,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (8,'OCA\\Federation\\SyncJob','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (9,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (10,'OCA\\Files\\BackgroundJob\\ScanFiles','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (11,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (12,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (13,'\\OC\\Authentication\\Token\\DefaultTokenCleanupJob','null',0,1507505011,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (14,'OC\\BackgroundJob\\Legacy\\RegularJob','[\"OCA\\\\WestVault\\\\Task\\\\DepositorTask\",\"run\"]',0,1507505021,0);
INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`, `last_checked`, `reserved_at`) VALUES (15,'OC\\Command\\CommandJob','\"O:33:\\\"OCA\\\\Files_Trashbin\\\\Command\\\\Expire\\\":1:{s:39:\\\"\\u0000OCA\\\\Files_Trashbin\\\\Command\\\\Expire\\u0000user\\\";s:5:\\\"corey\\\";}\"',0,1507507473,0);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (1,'httpd');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (2,'httpd/unix-directory');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (3,'application');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (4,'application/vnd.oasis.opendocument.text');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (5,'application/pdf');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (6,'image');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (7,'image/jpeg');
INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES (8,'application/octet-stream');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) NOT NULL,
  `root_id` int(11) NOT NULL,
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `mount_point` varchar(4000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_user_root_index` (`user_id`,`root_id`),
  KEY `mounts_user_index` (`user_id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` (`id`, `storage_id`, `root_id`, `user_id`, `mount_point`) VALUES (1,1,1,'admin','/admin/');
INSERT INTO `oc_mounts` (`id`, `storage_id`, `root_id`, `user_id`, `mount_point`) VALUES (2,3,12,'corey','/corey/');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) COLLATE utf8_bin NOT NULL,
  `user` varchar(64) COLLATE utf8_bin NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `object_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `object_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `subject` varchar(64) COLLATE utf8_bin NOT NULL,
  `subject_parameters` longtext COLLATE utf8_bin,
  `message` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `message_parameters` longtext COLLATE utf8_bin,
  `link` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `actions` longtext COLLATE utf8_bin,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--
-- ORDER BY:  `notification_id`

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--
-- ORDER BY:  `userid`,`appid`,`configkey`

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('admin','login','lastLogin','1507505011');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','core','lang','en');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','firstrunwizard','show','0');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','login','lastLogin','1507505723');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_terms_of_use','a:3:{i:0;a:3:{s:4:\"text\";s:211:\"\n                I have the authority to include this journal\'s content in a secure preservation network and, if and when necessary, to make the content accessible in the PKP-PLN and its successors.\n            \";s:2:\"id\";s:49:\"plugins.generic.pln.terms_of_use.jm_has_authority\";s:7:\"updated\";s:25:\"2017-02-24 07:36:08+00:00\";}i:1;a:3:{s:4:\"text\";s:145:\"\n                I confirm that licensing information pertaining to articles in this journal is accurate at the time of publication.\n            \";s:2:\"id\";s:53:\"plugins.generic.pln.terms_of_use.licensing_is_current\";s:7:\"updated\";s:25:\"2017-02-24 07:36:42+00:00\";}i:2;a:3:{s:4:\"text\";s:299:\"\n                I agree to make every reasonable effort to inform the PKP-PLN in the event this journal ceases publication. I acknowledge that PKP-PLN will also employ automated techniques to detect a potential trigger event and contact the journal to confirm their publication status.\n            \";s:2:\"id\";s:47:\"plugins.generic.pln.terms_of_use.trigger_events\";s:7:\"updated\";s:25:\"2017-02-24 07:37:15+00:00\";}}');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_terms_of_use_updated','2017-02-23 23:37:15');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_agreed','O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-10-08 23:35:52\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_cleanup','b:0;');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_email','');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_ignore','');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_preserved_folder','lockss-preserved');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_restored_folder','lockss-restored');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('corey','westvault','pln_user_uuid','e1361745-c2b2-4ee5-9f7e-4cb34ce66594');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('janice','westvault','pln_user_uuid','57c6b43c-dc3d-4fe8-a1a9-02bd6e8db2c3');
INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES ('mark','westvault','pln_user_uuid','f5374104-45fe-4133-a948-fb8b0edbb053');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privatedata`
--

DROP TABLE IF EXISTS `oc_privatedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privatedata` (
  `keyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `app` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privatedata`
--
-- ORDER BY:  `keyid`

LOCK TABLES `oc_privatedata` WRITE;
/*!40000 ALTER TABLE `oc_privatedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privatedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertyvalue` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `calendardata` longblob,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT '0',
  `share_with` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_source` int(11) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT '0',
  `stime` bigint(20) NOT NULL DEFAULT '0',
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remote` varchar(512) COLLATE utf8_bin NOT NULL COMMENT 'Url of the remove owncloud instance',
  `remote_id` int(11) NOT NULL DEFAULT '-1',
  `share_token` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Public share token',
  `password` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'Optional password for the public share',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Original name on the remote server',
  `owner` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'User that owns the public share on the remote server',
  `user` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Local user which added the external share',
  `mountpoint` varchar(4000) COLLATE utf8_bin NOT NULL COMMENT 'Full path where the share is mounted',
  `mountpoint_hash` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'md5 hash of the mountpoint',
  `accepted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`),
  KEY `sh_external_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `numeric_id` int(11) NOT NULL AUTO_INCREMENT,
  `available` int(11) NOT NULL DEFAULT '1',
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--
-- ORDER BY:  `numeric_id`

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` (`id`, `numeric_id`, `available`, `last_checked`) VALUES ('home::admin',1,1,NULL);
INSERT INTO `oc_storages` (`id`, `numeric_id`, `available`, `last_checked`) VALUES ('local::/var/www/owncloud/data/',2,1,NULL);
INSERT INTO `oc_storages` (`id`, `numeric_id`, `available`, `last_checked`) VALUES ('home::corey',3,1,NULL);
INSERT INTO `oc_storages` (`id`, `numeric_id`, `available`, `last_checked`) VALUES ('home::mark',4,1,NULL);
INSERT INTO `oc_storages` (`id`, `numeric_id`, `available`, `last_checked`) VALUES ('home::janice',5,1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT '1',
  `editable` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--
-- ORDER BY:  `gid`,`systemtagid`

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `objecttype` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `systemtagid` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `mapping` (`objecttype`,`objectid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--
-- ORDER BY:  `objecttype`,`objectid`,`systemtagid`

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) COLLATE utf8_bin NOT NULL COMMENT 'Url of trusted server',
  `url_hash` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'sha1 hash of the url without the protocol',
  `token` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'token used to exchange the shared secret',
  `shared_secret` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'shared secret used to authenticate',
  `status` int(11) NOT NULL DEFAULT '2' COMMENT 'current status of the connection',
  `sync_token` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'cardDav sync token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--
-- ORDER BY:  `uid`

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES ('admin',NULL,'1|$2y$10$ZEhHzsCxBzr/fgWxfJruMOKQKvrfaf1EUpesSo.7BE8GDRCylcm9i');
INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES ('corey',NULL,'1|$2y$10$ZbBCOLJWC0kcHPFELwQsuua6EBNMOUcrpCqR4ZKp9sY8sUoeNDUOK');
INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES ('janice',NULL,'1|$2y$10$AMV0qnLB34FKcu3LcLlfHOWfCMBWtRyApaPudWUcuI9IRY9oWQKoG');
INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES ('mark',NULL,'1|$2y$10$krEVJZDsIImzVP6JQvj4A.6Yty1qvG/r8waXYg3HN.Uya5X2gF4ze');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--
-- ORDER BY:  `categoryid`,`objid`,`type`

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_westvault_depositfiles`
--

DROP TABLE IF EXISTS `oc_westvault_depositfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_westvault_depositfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `uuid` varchar(36) COLLATE utf8_bin NOT NULL,
  `path` varchar(400) COLLATE utf8_bin NOT NULL,
  `checksum_type` varchar(24) COLLATE utf8_bin NOT NULL,
  `checksum_value` varchar(96) COLLATE utf8_bin NOT NULL,
  `pln_status` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `pln_url` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `lockss_status` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `agreement` double DEFAULT '0',
  `date_sent` bigint(20) DEFAULT NULL,
  `date_checked` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_westvault_depositfiles`
--
-- ORDER BY:  `id`

LOCK TABLES `oc_westvault_depositfiles` WRITE;
/*!40000 ALTER TABLE `oc_westvault_depositfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_westvault_depositfiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-08 17:21:45
