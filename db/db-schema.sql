-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: terzotempo
-- ------------------------------------------------------
-- Server version	5.6.16-1+sury.org~precise+1

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
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match` (
  `match_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_match` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `matchcode_id` bigint(20) unsigned NOT NULL,
  `pitch_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`match_id`),
  UNIQUE KEY `matchunique_id` (`user_id`,`date_match`,`pitch_id`),
  KEY `user_id` (`user_id`),
  KEY `added` (`added`),
  KEY `date_match` (`date_match`),
  KEY `matchcode_id` (`matchcode_id`),
  CONSTRAINT `match_ibfk_1` FOREIGN KEY (`matchcode_id`) REFERENCES `matchcode` (`matchcode_id`) ON DELETE CASCADE,
  CONSTRAINT `match_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchcode`
--

DROP TABLE IF EXISTS `matchcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchcode` (
  `matchcode_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` bigint(20) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('CREATED','USED','BLOCKED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'CREATED',
  PRIMARY KEY (`matchcode_id`),
  UNIQUE KEY `code_key` (`code`),
  KEY `added` (`added`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchcode`
--

LOCK TABLES `matchcode` WRITE;
/*!40000 ALTER TABLE `matchcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchuser`
--

DROP TABLE IF EXISTS `matchuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchuser` (
  `matchuser_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`matchuser_id`),
  UNIQUE KEY `matchuserunique_id` (`match_id`,`user_id`),
  KEY `match_id` (`match_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `matchuser_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`) ON DELETE CASCADE,
  CONSTRAINT `matchuser_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchuser`
--

LOCK TABLES `matchuser` WRITE;
/*!40000 ALTER TABLE `matchuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('CONSUMER','SPORTSCENTER') COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('admin','consumer','sportscenter','guest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'guest',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sportscentername` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sportscentercountry_code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sportscentercity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sportscenteraddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sportscenterzip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sportscenteremail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginattempts` tinyint(3) unsigned DEFAULT NULL,
  `passreminded` tinyint(1) NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `status` enum('INACTIVE','ACTIVE','BLOCKED','DELETED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `newsletter` tinyint(1) NOT NULL DEFAULT '1',
  `facebook_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmail_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `windows_live_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yahoo_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `myspace_extid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Deleted date time',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_key` (`email`),
  KEY `type` (`type`),
  KEY `country_code` (`country_code`),
  KEY `verified` (`verified`),
  KEY `role` (`role`),
  KEY `status` (`status`),
  KEY `added` (`added`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `video_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` bigint(20) unsigned NOT NULL,
  `match_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `user_id` (`user_id`),
  KEY `match_id` (`match_id`),
  KEY `added` (`added`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matchcode` (`matchcode_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-24 18:19:38
