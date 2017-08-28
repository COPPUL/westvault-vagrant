-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: symfony
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Dumping data for table `term_of_use`
--

LOCK TABLES `term_of_use` WRITE;
/*!40000 ALTER TABLE `term_of_use` DISABLE KEYS */;
INSERT INTO `term_of_use` VALUES (1,0,'2017-02-23 23:36:08','2017-02-23 23:36:08','plugins.generic.pln.terms_of_use.jm_has_authority','en-US','I have the authority to include this journal\'s content in a secure preservation network and, if and when necessary, to make the content accessible in the PKP-PLN and its successors.'),(2,1,'2017-02-23 23:36:42','2017-02-23 23:36:42','plugins.generic.pln.terms_of_use.licensing_is_current','en-US','I confirm that licensing information pertaining to articles in this journal is accurate at the time of publication.'),(3,2,'2017-02-23 23:37:15','2017-02-23 23:37:15','plugins.generic.pln.terms_of_use.trigger_events','en-US','I agree to make every reasonable effort to inform the PKP-PLN in the event this journal ceases publication. I acknowledge that PKP-PLN will also employ automated techniques to detect a potential trigger event and contact the journal to confirm their publication status.');
/*!40000 ALTER TABLE `term_of_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `term_of_use_history`
--

LOCK TABLES `term_of_use_history` WRITE;
/*!40000 ALTER TABLE `term_of_use_history` DISABLE KEYS */;
INSERT INTO `term_of_use_history` VALUES (1,1,'create','admin@example.com','2017-02-23 23:36:08','a:7:{s:2:\"id\";a:2:{i:0;N;i:1;i:1;}s:6:\"weight\";a:2:{i:0;N;i:1;i:0;}s:7:\"keyCode\";a:2:{i:0;N;i:1;s:49:\"plugins.generic.pln.terms_of_use.jm_has_authority\";}s:8:\"langCode\";a:2:{i:0;N;i:1;s:5:\"en-US\";}s:7:\"content\";a:2:{i:0;N;i:1;s:181:\"I have the authority to include this journal\'s content in a secure preservation network and, if and when necessary, to make the content accessible in the PKP-PLN and its successors.\";}s:7:\"created\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:08\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}s:7:\"updated\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:08\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}}'),(2,2,'create','admin@example.com','2017-02-23 23:36:42','a:7:{s:2:\"id\";a:2:{i:0;N;i:1;i:2;}s:6:\"weight\";a:2:{i:0;N;i:1;i:1;}s:7:\"keyCode\";a:2:{i:0;N;i:1;s:53:\"plugins.generic.pln.terms_of_use.licensing_is_current\";}s:8:\"langCode\";a:2:{i:0;N;i:1;s:5:\"en-US\";}s:7:\"content\";a:2:{i:0;N;i:1;s:115:\"I confirm that licensing information pertaining to articles in this journal is accurate at the time of publication.\";}s:7:\"created\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:42\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}s:7:\"updated\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:36:42\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}}'),(3,3,'create','admin@example.com','2017-02-23 23:37:15','a:7:{s:2:\"id\";a:2:{i:0;N;i:1;i:3;}s:6:\"weight\";a:2:{i:0;N;i:1;i:2;}s:7:\"keyCode\";a:2:{i:0;N;i:1;s:47:\"plugins.generic.pln.terms_of_use.trigger_events\";}s:8:\"langCode\";a:2:{i:0;N;i:1;s:5:\"en-US\";}s:7:\"content\";a:2:{i:0;N;i:1;s:269:\"I agree to make every reasonable effort to inform the PKP-PLN in the event this journal ceases publication. I acknowledge that PKP-PLN will also employ automated techniques to detect a potential trigger event and contact the journal to confirm their publication status.\";}s:7:\"created\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:37:15\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}s:7:\"updated\";a:2:{i:0;N;i:1;O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2017-02-23 23:37:15\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}}');
/*!40000 ALTER TABLE `term_of_use_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-23 23:41:53
