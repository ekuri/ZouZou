-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2015-06-17 09:58:45
-- 服务器版本: 5.6.14
-- PHP 版本: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zouzou_debug`
--

-- --------------------------------------------------------

--
-- 表的结构 `account_collection`
--

CREATE TABLE IF NOT EXISTS `account_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `travelItem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_collectio_travelItem_id_340cb3d7_fk_travel_travelitem_id` (`travelItem_id`),
  KEY `account_collection_user_id_c226361_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `account_collection`
--

INSERT INTO `account_collection` (`id`, `time`, `travelItem_id`, `user_id`) VALUES
(1, '2015-06-12 09:07:26', 10, 1),
(2, '2015-06-12 09:07:32', 7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `account_relation`
--

CREATE TABLE IF NOT EXISTS `account_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `fans_id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_relation_fans_id_2798e364_fk_auth_user_id` (`fans_id`),
  KEY `account_relation_follow_id_57171aa9_fk_auth_user_id` (`follow_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `account_relation`
--

INSERT INTO `account_relation` (`id`, `time`, `fans_id`, `follow_id`) VALUES
(1, '2015-06-11 10:09:23', 3, 1),
(2, '2015-06-17 06:39:59', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `account_userprofile`
--

CREATE TABLE IF NOT EXISTS `account_userprofile` (
  `user_id` int(11) NOT NULL,
  `qq` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8_bin,
  `nickname` varchar(64) COLLATE utf8_bin,
  `remark` varchar(256) COLLATE utf8_bin,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `account_userprofile`
--

INSERT INTO `account_userprofile` (`user_id`, `qq`, `phone`, `email`, `avatar`, `nickname`, `remark`) VALUES
(1, NULL, NULL, NULL, '', NULL, NULL),
(2, NULL, NULL, NULL, '', NULL, NULL),
(3, NULL, NULL, NULL, '', NULL, NULL),
(4, NULL, NULL, NULL, '', NULL, NULL),
(5, NULL, NULL, NULL, '', NULL, NULL),
(6, NULL, NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add user profile', 7, 'add_userprofile'),
(20, 'Can change user profile', 7, 'change_userprofile'),
(21, 'Can delete user profile', 7, 'delete_userprofile'),
(22, 'Can add relation', 8, 'add_relation'),
(23, 'Can change relation', 8, 'change_relation'),
(24, 'Can delete relation', 8, 'delete_relation'),
(25, 'Can add Comment', 9, 'add_comment'),
(26, 'Can change Comment', 9, 'change_comment'),
(27, 'Can delete Comment', 9, 'delete_comment'),
(28, 'Can add Travel', 10, 'add_travel'),
(29, 'Can change Travel', 10, 'change_travel'),
(30, 'Can delete Travel', 10, 'delete_travel'),
(31, 'Can add Travel Item', 11, 'add_travelitem'),
(32, 'Can change Travel Item', 11, 'change_travelitem'),
(33, 'Can delete Travel Item', 11, 'delete_travelitem'),
(34, 'Can add collection', 12, 'add_collection'),
(35, 'Can change collection', 12, 'change_collection'),
(36, 'Can delete collection', 12, 'delete_collection');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$20000$qhyZDApYT0Lq$e9Fd1q291QEJIUQX9lpKFoME4GFLOoh8E1SLXDTSQ8w=', '2015-06-17 06:45:48', 1, 'dengyh', '', '', '', 1, 1, '2015-06-03 13:04:37'),
(2, 'pbkdf2_sha256$20000$fl3TSYMHRztT$NOJvBIyuu7e7g+UZz6vyzT5iqgafAQnY/d/tQJfPm2s=', '2015-06-03 13:08:16', 0, '12330071', '', '', '', 0, 1, '2015-06-03 13:08:14'),
(3, 'pbkdf2_sha256$20000$cQzhiQZLbaUY$HQ2VSCwM6ur1kRS9k/fTt+KBncR9wQQmJarzkw1l1Po=', '2015-06-17 06:40:24', 0, 'dengyh7', '', '', '', 0, 1, '2015-06-03 13:09:49'),
(4, 'pbkdf2_sha256$20000$rmyEL1E6XN1s$RSLq+kXA8ZyLdjirB+ur72KPOBxf9fuC95CqV7jShQU=', '2015-06-10 09:11:06', 0, 'ddsdf', '', '', '', 0, 1, '2015-06-10 09:11:04'),
(5, 'pbkdf2_sha256$20000$GJguoCPzzkgl$ebHr+kxaC2IZ5aj9Nr/b5vnAtaK6lnqwdvLZLZjwx1A=', '2015-06-12 10:04:52', 0, 'qq494779656', '', '', '', 0, 1, '2015-06-12 10:04:50'),
(6, 'pbkdf2_sha256$20000$j2953d0zDg3q$c/Xb6kZZy2yb2szRFb9JYLT0qkw+aOP4EYhoKsqcRJA=', '2015-06-12 14:23:27', 0, 'abc', '', '', '', 0, 1, '2015-06-12 14:23:26');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `comment_comment`
--

CREATE TABLE IF NOT EXISTS `comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_bin,
  `time` datetime NOT NULL,
  `travelItem_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_travelItem_id_5c7bd221_fk_travel_travelitem_id` (`travelItem_id`),
  KEY `comment_comment_user_id_60721937_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `comment_comment`
--

INSERT INTO `comment_comment` (`id`, `content`, `time`, `travelItem_id`, `user_id`) VALUES
(2, 'sfsdf', '2015-06-17 06:22:08', 15, 1),
(3, 'dsafsdfaf', '2015-06-17 06:22:13', 15, 1),
(4, 'sdaf', '2015-06-17 06:22:21', 20, 1),
(5, 'sfasdf', '2015-06-17 06:22:23', 18, 1),
(6, 'sdfsdf', '2015-06-17 06:24:42', 16, 1),
(7, 'sdfsdf', '2015-06-17 06:25:41', 16, 1),
(8, 'sdfsdf', '2015-06-17 06:26:04', 16, 1),
(9, 'safasdf', '2015-06-17 06:26:44', 16, 1),
(11, 'sdfsdf', '2015-06-17 06:28:14', 15, 1),
(12, 'dsfadf', '2015-06-17 06:28:42', 15, 1),
(13, 'dsfadf', '2015-06-17 06:28:56', 15, 1),
(14, 'sdfsdf', '2015-06-17 06:29:34', 18, 1),
(15, 'dd', '2015-06-17 06:29:56', 15, 1),
(16, 'sdfsdf', '2015-06-17 06:30:22', 20, 1),
(17, 'dsfsdf', '2015-06-17 06:31:09', 20, 1),
(18, 'sfsdf', '2015-06-17 06:51:55', 22, 1),
(19, 'sdfdsf', '2015-06-17 06:57:58', 22, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-06-11 06:36:26', '1', 'dengyh''s travel', 1, '', 10, 1),
(2, '2015-06-11 06:36:39', '2', 'dengyh''s travel', 1, '', 10, 1),
(3, '2015-06-11 06:36:44', '3', 'dengyh''s travel', 1, '', 10, 1),
(4, '2015-06-11 06:43:37', '1', 'Item of dengyh''s travel', 1, '', 11, 1),
(5, '2015-06-11 06:52:04', '2', 'Item of dengyh''s travel', 1, '', 11, 1),
(6, '2015-06-11 08:48:34', '3', 'Item of dengyh''s travel', 1, '', 11, 1),
(7, '2015-06-11 08:49:12', '4', 'Item of dengyh''s travel', 1, '', 11, 1),
(8, '2015-06-11 08:49:43', '5', 'Item of dengyh''s travel', 1, '', 11, 1),
(9, '2015-06-11 08:50:11', '6', 'Item of dengyh''s travel', 1, '', 11, 1),
(10, '2015-06-11 08:50:33', '7', 'Item of dengyh''s travel', 1, '', 11, 1),
(11, '2015-06-11 08:51:07', '8', 'Item of dengyh''s travel', 1, '', 11, 1),
(12, '2015-06-11 08:51:34', '9', 'Item of dengyh''s travel', 1, '', 11, 1),
(13, '2015-06-11 08:52:04', '10', 'Item of dengyh''s travel', 1, '', 11, 1),
(14, '2015-06-11 10:09:23', '1', 'Relation object', 1, '', 8, 1),
(15, '2015-06-11 10:18:18', '3', 'dengyh7', 2, 'Changed password.', 4, 1),
(16, '2015-06-11 13:05:18', '3', 'dengyh''s travel', 2, 'Changed finish.', 10, 1),
(17, '2015-06-12 07:25:21', '11', 'Item of dengyh''s travel', 1, '', 11, 1),
(18, '2015-06-12 07:25:36', '11', 'Item of dengyh''s travel', 3, '', 11, 1),
(19, '2015-06-12 07:41:29', '10', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(20, '2015-06-12 07:41:55', '10', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(21, '2015-06-12 07:42:08', '9', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(22, '2015-06-12 07:42:12', '8', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(23, '2015-06-12 07:42:19', '7', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(24, '2015-06-12 07:42:27', '6', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(25, '2015-06-12 07:42:32', '4', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(26, '2015-06-12 07:42:39', '5', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(27, '2015-06-12 07:42:47', '3', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(28, '2015-06-12 07:42:50', '2', 'Item of dengyh''s travel', 2, 'No fields changed.', 11, 1),
(29, '2015-06-12 07:45:00', '7', 'Item of dengyh''s travel', 2, 'Changed city and country.', 11, 1),
(30, '2015-06-12 09:07:26', '1', 'Collection object', 1, '', 12, 1),
(31, '2015-06-12 09:07:32', '2', 'Collection object', 1, '', 12, 1),
(32, '2015-06-16 17:03:02', '5', 'dengyh''s travel', 3, '', 10, 1),
(33, '2015-06-17 06:39:59', '2', 'Relation object', 1, '', 8, 1),
(34, '2015-06-17 07:27:15', '4', 'dengyh''s travel', 2, 'Changed finish.', 10, 1),
(35, '2015-06-17 07:27:28', '4', 'dengyh''s travel', 2, 'Changed finish.', 10, 1),
(36, '2015-06-17 07:27:32', '6', 'dengyh''s travel', 2, 'Changed finish.', 10, 1),
(37, '2015-06-17 07:35:06', '6', 'dengyh''s travel', 2, 'Changed finish.', 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'account', 'collection'),
(8, 'account', 'relation'),
(7, 'account', 'userprofile'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'comment', 'comment'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(10, 'travel', 'travel'),
(11, 'travel', 'travelitem');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-05-22 16:24:23'),
(2, 'contenttypes', '0002_remove_content_type_name', '2015-05-22 16:24:29'),
(3, 'auth', '0001_initial', '2015-05-22 16:26:12'),
(4, 'auth', '0002_alter_permission_name_max_length', '2015-05-22 16:26:19'),
(5, 'auth', '0003_alter_user_email_max_length', '2015-05-22 16:26:29'),
(6, 'auth', '0004_alter_user_username_opts', '2015-05-22 16:26:29'),
(7, 'auth', '0005_alter_user_last_login_null', '2015-05-22 16:26:32'),
(8, 'auth', '0006_require_contenttypes_0002', '2015-05-22 16:26:32'),
(9, 'account', '0001_initial', '2015-05-22 16:26:47'),
(10, 'admin', '0001_initial', '2015-05-22 16:27:10'),
(11, 'sessions', '0001_initial', '2015-05-22 16:27:14'),
(12, 'account', '0002_auto_20150524_2333', '2015-05-24 15:34:16'),
(13, 'travel', '0001_initial', '2015-05-24 15:36:46'),
(14, 'comment', '0001_initial', '2015-05-24 15:37:06'),
(15, 'account', '0003_auto_20150603_2139', '2015-06-03 13:39:39'),
(16, 'travel', '0002_travelitem_country', '2015-06-10 14:41:48'),
(17, 'travel', '0003_travelitem_picture', '2015-06-10 15:19:10'),
(18, 'travel', '0004_remove_travelitem_type', '2015-06-11 06:34:58');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4a62nfsbqobfqtgddvh2neuigq6wtcyv', 'YWI2MWJhMjkzOWU1YWM5NmE0NmEyNzRlYzQxZDZiYTkzYmZkNTU1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MWQ0YTJjOGU4ODVhYjM3NGRkZjYzMjE4ODFhN2RiODU4OTExOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-06-26 10:05:53'),
('b6ra7tse1qz0eroqhsiortnihuz5yafv', 'MjgyODEyNjcwYWVhZjYxMzgxNjM0ZjA0ZGYwZmI5MWFiYjllZjRiNTp7fQ==', '2015-06-29 08:12:38'),
('dk02wrauu7wxtbh5b4f4mgmzpie5bu7r', 'MjgyODEyNjcwYWVhZjYxMzgxNjM0ZjA0ZGYwZmI5MWFiYjllZjRiNTp7fQ==', '2015-06-29 08:19:07'),
('f707duwzd9z1xtfaox90jen6gvp13ie2', 'YWI2MWJhMjkzOWU1YWM5NmE0NmEyNzRlYzQxZDZiYTkzYmZkNTU1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MWQ0YTJjOGU4ODVhYjM3NGRkZjYzMjE4ODFhN2RiODU4OTExOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-07-01 06:45:49'),
('ha06g56yrwsn6c7q2z95be7gb9yrxlui', 'YWI2MWJhMjkzOWU1YWM5NmE0NmEyNzRlYzQxZDZiYTkzYmZkNTU1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MWQ0YTJjOGU4ODVhYjM3NGRkZjYzMjE4ODFhN2RiODU4OTExOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-06-27 05:35:43'),
('ojfjipxwi0ptj2qxbxkzzg38besgikm9', 'YWI2MWJhMjkzOWU1YWM5NmE0NmEyNzRlYzQxZDZiYTkzYmZkNTU1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MWQ0YTJjOGU4ODVhYjM3NGRkZjYzMjE4ODFhN2RiODU4OTExOTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-06-29 05:02:49');

-- --------------------------------------------------------

--
-- 表的结构 `travel_travel`
--

CREATE TABLE IF NOT EXISTS `travel_travel` (
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
  KEY `travel_travel_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `travel_travel`
--

INSERT INTO `travel_travel` (`id`, `finish`, `time`, `endItem_id`, `nowItem_id`, `startItem_id`, `user_id`) VALUES
(1, 1, '2015-06-11 06:36:26', NULL, NULL, NULL, 1),
(2, 1, '2015-06-11 06:36:39', NULL, NULL, NULL, 1),
(3, 1, '2015-06-11 06:36:44', NULL, NULL, NULL, 1),
(4, 1, '2015-06-16 11:48:29', NULL, NULL, NULL, 1),
(6, 1, '2015-06-16 17:08:31', NULL, NULL, NULL, 1),
(7, 1, '2015-06-17 06:40:30', NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `travel_travelitem`
--

CREATE TABLE IF NOT EXISTS `travel_travelitem` (
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
  KEY `travel_travelitem_travel_id_32db504f_fk_travel_travel_id` (`travel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `travel_travelitem`
--

INSERT INTO `travel_travelitem` (`id`, `content`, `longtitude`, `latitude`, `city`, `favour`, `time`, `next_id`, `travel_id`, `country`, `picture`) VALUES
(2, '初见洱海、水很清澈、日照充足、水面波光粼粼、只是没有照出来、不过真的很晃眼', 100.242216, 25.605502, '大理白族自治州', 0, '2015-06-11 06:52:03', NULL, 1, '中国', 'travel/1.jpeg'),
(3, '望过去茫茫的洱海，好舒服的感觉，真心很美。', 100.255727, 25.610455, '大理白族自治州', 0, '2015-06-11 08:48:34', NULL, 1, '中国', 'travel/2.jpeg'),
(4, '吃过午饭后我们前往洱海，11：40到达洱海，洱海虽不是海，但像海一样不见边际，周围由苍山围绕。穿上免费提供的救生衣，穿越了草丛和小树林来到登船的地方，每人喝上一碗免费提供的驱寒姜汤后登船（用木桨划的小木船）。我们团分两艘小船，船上提供了划桨，我们每人一桨亲自动手边划边喊着口号比赛划船，观苍山游洱海，体会大自然的美。', 100.265931, 25.611888, '大理白族自治州', 0, '2015-06-11 08:49:12', NULL, 1, '中国', 'travel/3.jpeg'),
(5, '因为从杭州出发到成都，差不多要三个小时的行程，所以买了早班机，原本这样就以为可以早点到成都，没想到被两次告知延误，给呆地妈咪报了两次平安，直到她们也不知道该说啥好了....', 103.925557, 33.274109, '阿坝藏族羌族自治州', 0, '2015-06-11 08:49:43', NULL, 2, '中国', 'travel/4.jpeg'),
(6, '镜海就如它的名字一样像一面镜子，不用我多说，大家自己看吧~~', 103.926419, 33.265536, '阿坝藏族羌族自治州', 0, '2015-06-11 08:50:11', NULL, 2, '中国', 'travel/5.jpeg'),
(7, '熊猫海的水比箭竹海毫不逊色，甚至更美，还是那种吸人眼球的蓝绿，清澈透底，波光粼粼，如果真有熊猫来这里喝水，那它真是世界上最幸运的熊猫了：）', 103.961633, 33.252252, '阿坝藏族羌族自治州', 0, '2015-06-11 08:50:33', NULL, 2, '中国', 'travel/6.jpeg'),
(8, '一早到了竹排码头，安排了九曲溪的竹排，武夷山的气候真是很特别，一会下雨一会就晴天，进山的竟然没有管制带火机等火种的，说是山里湿度大，起火的可能性较小。一早上的雨下的好大，以为今天的行程算是泡汤了呢，结果当我们穿好雨衣，上了竹排，刚刚从九曲开始出发不一会，雨就停下来了，真是天公做美啊。', 117.978289, 27.646402, '南平市', 0, '2015-06-11 08:51:07', NULL, 3, '中国', 'travel/7.jpeg'),
(9, '九曲溪漂流几乎是武夷山最具代表性的游览项目，这里有武夷山最精华、最美的景致。竹筏要坐满6个人才会排，不过不用担心，码头会有导游主动要求凑人。再说一说小费的事情，现在小费的行情是20元/人。上竹筏之前6个人务必商量好是否统一支付小费，否则在竹筏上两个小时里人人都会尴尬至极。', 117.980005, 27.644898, '南平市', 0, '2015-06-11 08:51:34', NULL, 3, '中国', 'travel/8.jpeg'),
(10, '在九曲溪上，坐着竹筏，可以欣赏到两边的山色风景，不得不说，武夷山作为世界自然与文化双重遗产确实值得一游。', 117.979025, 27.643266, '南平市', 0, '2015-06-11 08:52:04', NULL, 3, '中国', 'travel/9.jpeg'),
(12, '....................', 100, 23, '普洱市', 0, '2015-06-13 04:29:08', NULL, 3, '中国', 'travel/jcaptcha.jpg'),
(13, '/....', 101.464918, 30.257502, '甘孜藏族自治州', 0, '2015-06-13 00:00:00', NULL, 4, '中国', 'travel/2-final.png'),
(14, 'sdfasd fsad fasdf', 93.002162, 33.460086, '玉树藏族自治州', 0, '2015-06-19 00:00:00', NULL, 6, '中国', 'travel/2-final_64CKAFv.png'),
(15, 'sdfasdfdsaf', 89.837827, 35.169745, '玉树藏族自治州', 0, '2015-06-12 00:00:00', NULL, 6, '中国', 'travel/2-final_dSsCdja.png'),
(16, '....sfsdf', 95.651372, 36.488168, '海西蒙古族藏族自治州', 0, '2015-06-11 00:00:00', NULL, 6, '中国', 'travel/QQ图片20150526111751.jpg'),
(17, 'sdfasdf', 95.430605, 35.290513, '玉树藏族自治州', 0, '2015-06-21 00:00:00', NULL, 6, '中国', 'travel/er.png'),
(18, 'sdfasdf', 96.902389, 34.684863, '玉树藏族自治州', 0, '2015-06-13 01:00:00', NULL, 6, '中国', 'travel/12330071-DENGYUHENG-HW12-V0.png'),
(19, 'safsdf', 96.313675, 32.716694, '玉树藏族自治州', 0, '2015-06-13 23:59:00', NULL, 6, '中国', 'travel/12330071-DENGYUHENG-HW11-V1.png'),
(20, 'sdfasfas', 99.993134, 38.481861, '张掖市', 0, '2015-06-12 01:00:00', NULL, 6, '中国', 'travel/白盒测试1.png'),
(21, 'sdfasdf', 103.378237, 59.82538, '', 0, '2015-06-19 00:00:00', NULL, 6, '', 'travel/2-final_7uFak9V.png'),
(22, 'test1', 100.802616, 29.100782, '凉山彝族自治州', 2, '2015-06-11 08:02:00', NULL, 7, '中国', 'travel/1_ADKL54o.jpeg'),
(23, 'test2', 104.555664, 32.59218, '绵阳市', 1, '2015-06-19 00:05:00', NULL, 7, '中国', 'travel/2_jSgEoll.jpeg'),
(24, 'test3', 105.733091, 30.001618, '资阳市', 0, '2015-06-20 05:00:00', NULL, 7, '中国', 'travel/3_EE5zKpo.jpeg');

--
-- 限制导出的表
--

--
-- 限制表 `account_collection`
--
ALTER TABLE `account_collection`
  ADD CONSTRAINT `account_collection_user_id_c226361_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `account_collectio_travelItem_id_340cb3d7_fk_travel_travelitem_id` FOREIGN KEY (`travelItem_id`) REFERENCES `travel_travelitem` (`id`);

--
-- 限制表 `account_relation`
--
ALTER TABLE `account_relation`
  ADD CONSTRAINT `account_relation_fans_id_2798e364_fk_auth_user_id` FOREIGN KEY (`fans_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `account_relation_follow_id_57171aa9_fk_auth_user_id` FOREIGN KEY (`follow_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `account_userprofile`
--
ALTER TABLE `account_userprofile`
  ADD CONSTRAINT `account_userprofile_user_id_546764a0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `comment_comment`
--
ALTER TABLE `comment_comment`
  ADD CONSTRAINT `comment_comment_travelItem_id_5c7bd221_fk_travel_travelitem_id` FOREIGN KEY (`travelItem_id`) REFERENCES `travel_travelitem` (`id`),
  ADD CONSTRAINT `comment_comment_user_id_60721937_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `travel_travel`
--
ALTER TABLE `travel_travel`
  ADD CONSTRAINT `travel_travel_endItem_id_3ea12bff_fk_travel_travelitem_id` FOREIGN KEY (`endItem_id`) REFERENCES `travel_travelitem` (`id`),
  ADD CONSTRAINT `travel_travel_nowItem_id_6249176a_fk_travel_travelitem_id` FOREIGN KEY (`nowItem_id`) REFERENCES `travel_travelitem` (`id`),
  ADD CONSTRAINT `travel_travel_startItem_id_1dc87d40_fk_travel_travelitem_id` FOREIGN KEY (`startItem_id`) REFERENCES `travel_travelitem` (`id`),
  ADD CONSTRAINT `travel_travel_user_id_53f80285_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `travel_travelitem`
--
ALTER TABLE `travel_travelitem`
  ADD CONSTRAINT `travel_travelitem_next_id_7e53bff6_fk_travel_travelitem_id` FOREIGN KEY (`next_id`) REFERENCES `travel_travelitem` (`id`),
  ADD CONSTRAINT `travel_travelitem_travel_id_32db504f_fk_travel_travel_id` FOREIGN KEY (`travel_id`) REFERENCES `travel_travel` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
