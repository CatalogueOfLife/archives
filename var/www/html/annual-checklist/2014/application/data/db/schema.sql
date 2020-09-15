-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: col2010ac
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5-log

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
-- Table structure for table `common_names`
--

DROP TABLE IF EXISTS `common_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_names` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_code` varchar(50) NOT NULL DEFAULT '',
  `common_name` varchar(700) NOT NULL,
  `language` varchar(25) NOT NULL,
  `country` varchar(44) NOT NULL DEFAULT '',
  `reference_id` int(10) DEFAULT '0',
  `database_id` int(10) NOT NULL DEFAULT '0',
  `is_infraspecies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `common_name` (`common_name`),
  KEY `language` (`language`,`common_name`,`name_code`),
  KEY `common_name_2` (`common_name`,`name_code`,`database_id`),
  KEY `name_code` (`name_code`),
  KEY `common_name_3` (`common_name`,`database_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2419021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `databases`
--

DROP TABLE IF EXISTS `databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databases` (
  `database_name_displayed` varchar(100) DEFAULT NULL,
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `database_name` varchar(150) DEFAULT NULL,
  `database_full_name` varchar(100) NOT NULL DEFAULT '',
  `web_site` longtext,
  `organization` longtext,
  `contact_person` varchar(255) DEFAULT NULL,
  `taxa` varchar(255) DEFAULT NULL,
  `taxonomic_coverage` longtext,
  `abstract` longtext,
  `version` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT '0000-00-00',
  `SpeciesCount` int(11) DEFAULT '0',
  `SpeciesEst` int(11) DEFAULT '0',
  `authors_editors` longtext,
  `accepted_species_names` int(10) DEFAULT '0',
  `accepted_infraspecies_names` int(10) DEFAULT '0',
  `species_synonyms` int(10) DEFAULT '0',
  `infraspecies_synonyms` int(10) DEFAULT '0',
  `common_names` int(10) DEFAULT '0',
  `total_names` int(10) DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `database_name` (`database_name`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_code` varchar(50) NOT NULL DEFAULT '',
  `distribution` longtext,
  PRIMARY KEY (`record_id`),
  KEY `name_code` (`name_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3132850 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `families` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hierarchy_code` varchar(250) NOT NULL,
  `kingdom` varchar(50) NOT NULL DEFAULT '',
  `phylum` varchar(50) NOT NULL DEFAULT '',
  `class` varchar(50) NOT NULL DEFAULT '',
  `order` varchar(50) NOT NULL DEFAULT '',
  `family` varchar(50) NOT NULL DEFAULT '',
  `superfamily` varchar(50) DEFAULT NULL,
  `family_common_name` varchar(255) DEFAULT NULL,
  `database_name` varchar(50) NOT NULL DEFAULT '',
  `is_accepted_name` int(1) DEFAULT '0',
  `database_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `kingdom` (`kingdom`),
  KEY `phylum` (`phylum`),
  KEY `class` (`class`),
  KEY `order` (`order`),
  KEY `family` (`family`),
  KEY `superfamily` (`superfamily`),
  KEY `is_accepted_name` (`is_accepted_name`)
) ENGINE=MyISAM AUTO_INCREMENT=24898 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hard_coded_species_totals`
--

DROP TABLE IF EXISTS `hard_coded_species_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hard_coded_species_totals` (
  `taxon` varchar(50) NOT NULL DEFAULT '',
  `species_count` int(20) NOT NULL DEFAULT '0',
  KEY `taxon` (`taxon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hard_coded_taxon_lists`
--

DROP TABLE IF EXISTS `hard_coded_taxon_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hard_coded_taxon_lists` (
  `rank` varchar(12) NOT NULL DEFAULT '',
  `accepted_names_only` int(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  KEY `accepted_names_only` (`accepted_names_only`),
  KEY `rank` (`rank`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(200) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `title` longtext,
  `source` longtext,
  `database_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2542372 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scientific_name_references`
--

DROP TABLE IF EXISTS `scientific_name_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_name_references` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_code` varchar(42) NOT NULL DEFAULT '',
  `reference_type` varchar(10) DEFAULT NULL,
  `reference_id` int(10) DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `name_code` (`name_code`,`reference_id`,`reference_type`),
  KEY `name_code_2` (`name_code`,`reference_type`)
) ENGINE=MyISAM AUTO_INCREMENT=9459545 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scientific_names`
--

DROP TABLE IF EXISTS `scientific_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_names` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_code` varchar(42) NOT NULL DEFAULT '',
  `web_site` longtext,
  `genus` varchar(50) NOT NULL DEFAULT '',
  `species` varchar(50) DEFAULT '',
  `infraspecies` varchar(50) DEFAULT '',
  `infraspecies_marker` varchar(50) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `accepted_name_code` varchar(36) DEFAULT NULL,
  `comment` longtext,
  `scrutiny_date` text,
  `sp2000_status_id` int(1) DEFAULT NULL,
  `database_id` int(10) NOT NULL DEFAULT '0',
  `specialist_id` int(10) DEFAULT NULL,
  `family_id` int(10) DEFAULT NULL,
  `is_accepted_name` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `family_id` (`family_id`),
  KEY `species` (`species`),
  KEY `infraspecies` (`infraspecies`),
  KEY `accepted_name_code` (`accepted_name_code`),
  KEY `name_code` (`name_code`,`family_id`),
  KEY `record_id` (`record_id`,`family_id`),
  KEY `genus` (`genus`,`species`,`infraspecies`),
  KEY `sp2000_status_id` (`sp2000_status_id`),
  KEY `sp2000_status_id_2` (`sp2000_status_id`,`database_id`,`infraspecies`)
) ENGINE=MyISAM AUTO_INCREMENT=7632294 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simple_search`
--

DROP TABLE IF EXISTS `simple_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_search` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxa_id` int(10) NOT NULL DEFAULT '0',
  `words` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`record_id`),
  KEY `words` (`words`)
) ENGINE=MyISAM AUTO_INCREMENT=8259609 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sp2000_statuses`
--

DROP TABLE IF EXISTS `sp2000_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp2000_statuses` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sp2000_status` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`record_id`),
  KEY `sp2000_status` (`sp2000_status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialists`
--

DROP TABLE IF EXISTS `specialists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialists` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specialist_name` varchar(255) NOT NULL DEFAULT '',
  `database_id` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1381 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxa`
--

DROP TABLE IF EXISTS `taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxa` (
  `record_id` int(10) unsigned NOT NULL,
  `lsid` varchar(78) DEFAULT NULL,
  `name` varchar(137) NOT NULL DEFAULT '',
  `name_with_italics` varchar(151) NOT NULL DEFAULT '',
  `taxon` varchar(12) NOT NULL DEFAULT '',
  `name_code` varchar(42) DEFAULT NULL,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `sp2000_status_id` int(1) NOT NULL DEFAULT '0',
  `database_id` int(2) NOT NULL DEFAULT '0',
  `is_accepted_name` int(1) NOT NULL DEFAULT '0',
  `is_species_or_nonsynonymic_higher_taxon` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `name` (`name`,`is_species_or_nonsynonymic_higher_taxon`,`database_id`,`sp2000_status_id`),
  KEY `sp2000_status_id` (`sp2000_status_id`),
  KEY `parent_id` (`parent_id`),
  KEY `database_id` (`database_id`),
  KEY `taxon` (`taxon`),
  KEY `is_accepted_name` (`is_accepted_name`),
  KEY `name_code` (`name_code`),
  KEY `is_species_or_nonsynonymic_higher_taxon` (`is_species_or_nonsynonymic_higher_taxon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-02-02 13:28:23
