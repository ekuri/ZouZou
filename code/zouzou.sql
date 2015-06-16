-- MySQL dump 10.13  Distrib 5.6.14, for Win32 (x86)
--
-- Host: localhost    Database: zouzou_debug
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `account_collection`
--

DROP TABLE IF EXISTS `account_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `travelItem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_collectio_travelItem_id_340cb3d7_fk_travel_travelitem_id` (`travelItem_id`),
  KEY `account_collection_user_id_c226361_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_collection_user_id_c226361_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `account_collectio_travelItem_id_340cb3d7_fk_travel_travelitem_id` FOREIGN KEY (`travelItem_id`) REFERENCES `travel_travelitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_collection`
--

LOCK TABLES `account_collection` WRITE;
/*!40000 ALTER TABLE `account_collection` DISABLE KEYS */;
INSERT INTO `account_collection` VALUES (1,'2015-06-12 09:07:26',10,1),(2,'2015-06-12 09:07:32',7,1);
/*!40000 ALTER TABLE `account_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_relation`
--

DROP TABLE IF EXISTS `account_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `fans_id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_relation_fans_id_2798e364_fk_auth_user_id` (`fans_id`),
  KEY `account_relation_follow_id_57171aa9_fk_auth_user_id` (`follow_id`),
  CONSTRAINT `account_relation_fans_id_2798e364_fk_auth_user_id` FOREIGN KEY (`fans_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `account_relation_follow_id_57171aa9_fk_auth_user_id` FOREIGN KEY (`follow_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_relation`
--

LOCK TABLES `account_relation` WRITE;
/*!40000 ALTER TABLE `account_relation` DISABLE KEYS */;
INSERT INTO `account_relation` VALUES (1,'2015-06-11 10:09:23',3,1);
/*!40000 ALTER TABLE `account_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userprofile`
--

DROP TABLE IF EXISTS `account_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_userprofile` (
  `user_id` int(11) NOT NULL,
  `qq` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8_bin,
  `nickname` varchar(64) COLLATE utf8_bin,
  `remark` varchar(256) COLLATE utf8_bin,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `account_userprofile_user_id_546764a0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userprofile`
--

LOCK TABLES `account_userprofile` WRITE;
/*!40000 ALTER TABLE `account_userprofile` DISABLE KEYS */;
INSERT INTO `account_userprofile` VALUES (1,NULL,NULL,NULL,'',NULL,NULL),(2,NULL,NULL,NULL,'',NULL,NULL),(3,NULL,NULL,NULL,'',NULL,NULL),(4,NULL,NULL,NULL,'',NULL,NULL),(5,NULL,NULL,NULL,'',NULL,NULL),(6,NULL,NULL,NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `account_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user profile',7,'add_userprofile'),(20,'Can change user profile',7,'change_userprofile'),(21,'Can delete user profile',7,'delete_userprofile'),(22,'Can add relation',8,'add_relation'),(23,'Can change relation',8,'change_relation'),(24,'Can delete relation',8,'delete_relation'),(25,'Can add Comment',9,'add_comment'),(26,'Can change Comment',9,'change_comment'),(27,'Can delete Comment',9,'delete_comment'),(28,'Can add Travel',10,'add_travel'),(29,'Can change Travel',10,'change_travel'),(30,'Can delete Travel',10,'delete_travel'),(31,'Can add Travel Item',11,'add_travelitem'),(32,'Can change Travel Item',11,'change_travelitem'),(33,'Can delete Travel Item',11,'delete_travelitem'),(34,'Can add collection',12,'add_collection'),(35,'Can change collection',12,'change_collection'),(36,'Can delete collection',12,'delete_collection');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$qhyZDApYT0Lq$e9Fd1q291QEJIUQX9lpKFoME4GFLOoh8E1SLXDTSQ8w=','2015-06-13 05:35:41',1,'dengyh','','','',1,1,'2015-06-03 13:04:37'),(2,'pbkdf2_sha256$20000$fl3TSYMHRztT$NOJvBIyuu7e7g+UZz6vyzT5iqgafAQnY/d/tQJfPm2s=','2015-06-03 13:08:16',0,'12330071','','','',0,1,'2015-06-03 13:08:14'),(3,'pbkdf2_sha256$20000$cQzhiQZLbaUY$HQ2VSCwM6ur1kRS9k/fTt+KBncR9wQQmJarzkw1l1Po=','2015-06-13 05:32:54',0,'dengyh7','','','',0,1,'2015-06-03 13:09:49'),(4,'pbkdf2_sha256$20000$rmyEL1E6XN1s$RSLq+kXA8ZyLdjirB+ur72KPOBxf9fuC95CqV7jShQU=','2015-06-10 09:11:06',0,'ddsdf','','','',0,1,'2015-06-10 09:11:04'),(5,'pbkdf2_sha256$20000$GJguoCPzzkgl$ebHr+kxaC2IZ5aj9Nr/b5vnAtaK6lnqwdvLZLZjwx1A=','2015-06-12 10:04:52',0,'qq494779656','','','',0,1,'2015-06-12 10:04:50'),(6,'pbkdf2_sha256$20000$j2953d0zDg3q$c/Xb6kZZy2yb2szRFb9JYLT0qkw+aOP4EYhoKsqcRJA=','2015-06-12 14:23:27',0,'abc','','','',0,1,'2015-06-12 14:23:26');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_bin,
  `time` datetime NOT NULL,
  `travelItem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_travelItem_id_5c7bd221_fk_travel_travelitem_id` (`travelItem_id`),
  KEY `comment_comment_user_id_60721937_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_travelItem_id_5c7bd221_fk_travel_travelitem_id` FOREIGN KEY (`travelItem_id`) REFERENCES `travel_travelitem` (`id`),
  CONSTRAINT `comment_comment_user_id_60721937_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-06-11 06:36:26','1','dengyh\'s travel',1,'',10,1),(2,'2015-06-11 06:36:39','2','dengyh\'s travel',1,'',10,1),(3,'2015-06-11 06:36:44','3','dengyh\'s travel',1,'',10,1),(4,'2015-06-11 06:43:37','1','Item of dengyh\'s travel',1,'',11,1),(5,'2015-06-11 06:52:04','2','Item of dengyh\'s travel',1,'',11,1),(6,'2015-06-11 08:48:34','3','Item of dengyh\'s travel',1,'',11,1),(7,'2015-06-11 08:49:12','4','Item of dengyh\'s travel',1,'',11,1),(8,'2015-06-11 08:49:43','5','Item of dengyh\'s travel',1,'',11,1),(9,'2015-06-11 08:50:11','6','Item of dengyh\'s travel',1,'',11,1),(10,'2015-06-11 08:50:33','7','Item of dengyh\'s travel',1,'',11,1),(11,'2015-06-11 08:51:07','8','Item of dengyh\'s travel',1,'',11,1),(12,'2015-06-11 08:51:34','9','Item of dengyh\'s travel',1,'',11,1),(13,'2015-06-11 08:52:04','10','Item of dengyh\'s travel',1,'',11,1),(14,'2015-06-11 10:09:23','1','Relation object',1,'',8,1),(15,'2015-06-11 10:18:18','3','dengyh7',2,'Changed password.',4,1),(16,'2015-06-11 13:05:18','3','dengyh\'s travel',2,'Changed finish.',10,1),(17,'2015-06-12 07:25:21','11','Item of dengyh\'s travel',1,'',11,1),(18,'2015-06-12 07:25:36','11','Item of dengyh\'s travel',3,'',11,1),(19,'2015-06-12 07:41:29','10','Item of dengyh\'s travel',2,'No fields changed.',11,1),(20,'2015-06-12 07:41:55','10','Item of dengyh\'s travel',2,'No fields changed.',11,1),(21,'2015-06-12 07:42:08','9','Item of dengyh\'s travel',2,'No fields changed.',11,1),(22,'2015-06-12 07:42:12','8','Item of dengyh\'s travel',2,'No fields changed.',11,1),(23,'2015-06-12 07:42:19','7','Item of dengyh\'s travel',2,'No fields changed.',11,1),(24,'2015-06-12 07:42:27','6','Item of dengyh\'s travel',2,'No fields changed.',11,1),(25,'2015-06-12 07:42:32','4','Item of dengyh\'s travel',2,'No fields changed.',11,1),(26,'2015-06-12 07:42:39','5','Item of dengyh\'s travel',2,'No fields changed.',11,1),(27,'2015-06-12 07:42:47','3','Item of dengyh\'s travel',2,'No fields changed.',11,1),(28,'2015-06-12 07:42:50','2','Item of dengyh\'s travel',2,'No fields changed.',11,1),(29,'2015-06-12 07:45:00','7','Item of dengyh\'s travel',2,'Changed city and country.',11,1),(30,'2015-06-12 09:07:26','1','Collection object',1,'',12,1),(31,'2015-06-12 09:07:32','2','Collection object',1,'',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'account','collection'),(8,'account','relation'),(7,'account','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'comment','comment'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'travel','travel'),(11,'travel','travelitem');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-05-22 16:24:23'),(2,'contenttypes','0002_remove_content_type_name','2015-05-22 16:24:29'),(3,'auth','0001_initial','2015-05-22 16:26:12'),(4,'auth','0002_alter_permission_name_max_length','2015-05-22 16:26:19'),(5,'auth','0003_alter_user_email_max_length','2015-05-22 16:26:29'),(6,'auth','0004_alter_user_username_opts','2015-05-22 16:26:29'),(7,'auth','0005_alter_user_last_login_null','2015-05-22 16:26:32'),(8,'auth','0006_require_contenttypes_0002','2015-05-22 16:26:32'),(9,'account','0001_initial','2015-05-22 16:26:47'),(10,'admin','0001_initial','2015-05-22 16:27:10'),(11,'sessions','0001_initial','2015-05-22 16:27:14'),(12,'account','0002_auto_20150524_2333','2015-05-24 15:34:16'),(13,'travel','0001_initial','2015-05-24 15:36:46'),(14,'comment','0001_initial','2015-05-24 15:37:06'),(15,'account','0003_auto_20150603_2139','2015-06-03 13:39:39'),(16,'travel','0002_travelitem_country','2015-06-10 14:41:48'),(17,'travel','0003_travelitem_picture','2015-06-10 15:19:10'),(18,'travel','0004_remove_travelitem_type','2015-06-11 06:34:58');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4a62nfsbqobfqtgddvh2neuigq6wtcyv','YWI2MWJhMjkzOWU1YWM5NmE0NmEyNzRlYzQxZDZiYTkzYmZkNTU1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MWQ0YTJjOGU4ODVhYjM3NGRkZjYzMjE4ODFhN2RiODU4OTExOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-06-26 10:05:53'),('ha06g56yrwsn6c7q2z95be7gb9yrxlui','YWI2MWJhMjkzOWU1YWM5NmE0NmEyNzRlYzQxZDZiYTkzYmZkNTU1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MWQ0YTJjOGU4ODVhYjM3NGRkZjYzMjE4ODFhN2RiODU4OTExOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-06-27 05:35:43');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_travel`
--

DROP TABLE IF EXISTS `travel_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finish` tinyint(1) NOT NULL,
  `time` datetime NOT NULL,
  `endItem_id` int(11),
  `nowItem_id` int(11),
  `startItem_id` int(11),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_travel_fe024f06` (`endItem_id`),
  KEY `travel_travel_8e887d87` (`nowItem_id`),
  KEY `travel_travel_529c327b` (`startItem_id`),
  KEY `travel_travel_e8701ad4` (`user_id`),
  CONSTRAINT `travel_travel_endItem_id_3ea12bff_fk_travel_travelitem_id` FOREIGN KEY (`endItem_id`) REFERENCES `travel_travelitem` (`id`),
  CONSTRAINT `travel_travel_nowItem_id_6249176a_fk_travel_travelitem_id` FOREIGN KEY (`nowItem_id`) REFERENCES `travel_travelitem` (`id`),
  CONSTRAINT `travel_travel_startItem_id_1dc87d40_fk_travel_travelitem_id` FOREIGN KEY (`startItem_id`) REFERENCES `travel_travelitem` (`id`),
  CONSTRAINT `travel_travel_user_id_53f80285_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_travel`
--

LOCK TABLES `travel_travel` WRITE;
/*!40000 ALTER TABLE `travel_travel` DISABLE KEYS */;
INSERT INTO `travel_travel` VALUES (1,1,'2015-06-11 06:36:26',NULL,NULL,NULL,1),(2,1,'2015-06-11 06:36:39',NULL,NULL,NULL,1),(3,0,'2015-06-11 06:36:44',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `travel_travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_travelitem`
--

DROP TABLE IF EXISTS `travel_travelitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_travelitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `longtitude` double NOT NULL,
  `latitude` double NOT NULL,
  `city` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `favour` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `next_id` int(11) DEFAULT NULL,
  `travel_id` int(11) NOT NULL,
  `country` varchar(32) COLLATE utf8_bin,
  `picture` varchar(100) COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `travel_travelitem_next_id_7e53bff6_fk_travel_travelitem_id` (`next_id`),
  KEY `travel_travelitem_travel_id_32db504f_fk_travel_travel_id` (`travel_id`),
  CONSTRAINT `travel_travelitem_next_id_7e53bff6_fk_travel_travelitem_id` FOREIGN KEY (`next_id`) REFERENCES `travel_travelitem` (`id`),
  CONSTRAINT `travel_travelitem_travel_id_32db504f_fk_travel_travel_id` FOREIGN KEY (`travel_id`) REFERENCES `travel_travel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_travelitem`
--

LOCK TABLES `travel_travelitem` WRITE;
/*!40000 ALTER TABLE `travel_travelitem` DISABLE KEYS */;
INSERT INTO `travel_travelitem` VALUES (2,'初见洱海、水很清澈、日照充足、水面波光粼粼、只是没有照出来、不过真的很晃眼',100.242216,25.605502,'大理白族自治州',0,'2015-06-11 06:52:03',NULL,1,'中国','travel/1.jpeg'),(3,'望过去茫茫的洱海，好舒服的感觉，真心很美。',100.255727,25.610455,'大理白族自治州',0,'2015-06-11 08:48:34',NULL,1,'中国','travel/2.jpeg'),(4,'吃过午饭后我们前往洱海，11：40到达洱海，洱海虽不是海，但像海一样不见边际，周围由苍山围绕。穿上免费提供的救生衣，穿越了草丛和小树林来到登船的地方，每人喝上一碗免费提供的驱寒姜汤后登船（用木桨划的小木船）。我们团分两艘小船，船上提供了划桨，我们每人一桨亲自动手边划边喊着口号比赛划船，观苍山游洱海，体会大自然的美。',100.265931,25.611888,'大理白族自治州',0,'2015-06-11 08:49:12',NULL,1,'中国','travel/3.jpeg'),(5,'因为从杭州出发到成都，差不多要三个小时的行程，所以买了早班机，原本这样就以为可以早点到成都，没想到被两次告知延误，给呆地妈咪报了两次平安，直到她们也不知道该说啥好了....',103.925557,33.274109,'阿坝藏族羌族自治州',0,'2015-06-11 08:49:43',NULL,2,'中国','travel/4.jpeg'),(6,'镜海就如它的名字一样像一面镜子，不用我多说，大家自己看吧~~',103.926419,33.265536,'阿坝藏族羌族自治州',0,'2015-06-11 08:50:11',NULL,2,'中国','travel/5.jpeg'),(7,'熊猫海的水比箭竹海毫不逊色，甚至更美，还是那种吸人眼球的蓝绿，清澈透底，波光粼粼，如果真有熊猫来这里喝水，那它真是世界上最幸运的熊猫了：）',103.961633,33.252252,'阿坝藏族羌族自治州',0,'2015-06-11 08:50:33',NULL,2,'中国','travel/6.jpeg'),(8,'一早到了竹排码头，安排了九曲溪的竹排，武夷山的气候真是很特别，一会下雨一会就晴天，进山的竟然没有管制带火机等火种的，说是山里湿度大，起火的可能性较小。一早上的雨下的好大，以为今天的行程算是泡汤了呢，结果当我们穿好雨衣，上了竹排，刚刚从九曲开始出发不一会，雨就停下来了，真是天公做美啊。',117.978289,27.646402,'南平市',0,'2015-06-11 08:51:07',NULL,3,'中国','travel/7.jpeg'),(9,'九曲溪漂流几乎是武夷山最具代表性的游览项目，这里有武夷山最精华、最美的景致。竹筏要坐满6个人才会排，不过不用担心，码头会有导游主动要求凑人。再说一说小费的事情，现在小费的行情是20元/人。上竹筏之前6个人务必商量好是否统一支付小费，否则在竹筏上两个小时里人人都会尴尬至极。',117.980005,27.644898,'南平市',0,'2015-06-11 08:51:34',NULL,3,'中国','travel/8.jpeg'),(10,'在九曲溪上，坐着竹筏，可以欣赏到两边的山色风景，不得不说，武夷山作为世界自然与文化双重遗产确实值得一游。',117.979025,27.643266,'南平市',0,'2015-06-11 08:52:04',NULL,3,'中国','travel/9.jpeg'),(12,'....................',100,23,'普洱市',0,'2015-06-13 04:29:08',NULL,3,'中国','travel/jcaptcha.jpg');
/*!40000 ALTER TABLE `travel_travelitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-13 17:52:07
