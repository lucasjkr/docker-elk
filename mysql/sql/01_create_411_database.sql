# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: docker.local (MySQL 5.5.5-10.3.8-MariaDB-1:10.3.8+maria~bionic)
# Database: fouroneone
# Generation Time: 2018-08-23 14:21:14 +0000
# ************************************************************

# Dump of table alert_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alert_logs`;

CREATE TABLE `alert_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `action` tinyint(4) unsigned NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` bigint(20) unsigned NOT NULL,
  `b` bigint(20) unsigned NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `alert_idx` (`alert_id`),
  KEY `user_idx` (`user_id`),
  KEY `action_idx` (`action`),
  KEY `a_idx` (`a`),
  KEY `b_idx` (`b`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table alerts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alerts`;

CREATE TABLE `alerts` (
  `alert_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alert_date` bigint(20) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_hash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignee_type` tinyint(4) NOT NULL,
  `assignee` bigint(20) unsigned NOT NULL,
  `search_id` bigint(20) unsigned NOT NULL,
  `escalated` tinyint(1) NOT NULL,
  `state` int(11) NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  `renderer_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolution` tinyint(1) NOT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `alert_date_idx` (`alert_date`),
  KEY `search_id_idx` (`search_id`),
  KEY `assignee_idx` (`assignee`),
  KEY `assignee_type_idx` (`assignee_type`),
  KEY `escalated_idx` (`escalated`),
  KEY `state_idx` (`state`),
  KEY `content_hash_idx` (`content_hash`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `site_id` bigint(20) unsigned NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`site_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;

INSERT INTO `config` (`site_id`, `key`, `value`)
VALUES
	(1,'cookie_secret','b/p/C6V7XcBd9sI74rL+9E10US8ztlzR'),
	(1,'cron_enabled','1'),
	(1,'default_email','admin@fouroneone'),
	(1,'error_email_enabled','1'),
	(1,'error_email_throttle','30'),
	(1,'from_email','alert@fouroneone'),
	(1,'from_error_email','error@fouroneone'),
	(1,'last_cron_date','0'),
	(1,'last_rollup_date','0'),
	(1,'summary_enabled','1'),
	(1,'timezone','UTC'),
	(1,'worker_enabled','1');

/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table group_targets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_targets`;

CREATE TABLE `group_targets` (
  `group_target_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`group_target_id`),
  KEY `group_id_idx` (`group_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `state` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `type_idx` (`type`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `state` tinyint(4) unsigned NOT NULL,
  `completion` tinyint(4) unsigned NOT NULL,
  `tries` int(20) unsigned NOT NULL,
  `target_date` bigint(20) unsigned NOT NULL,
  `last_execution_date` bigint(20) unsigned NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `type_idx` (`type`),
  KEY `target_id_idx` (`target_id`),
  KEY `state_idx` (`state`),
  KEY `tries_idx` (`tries`),
  KEY `last_execution_date_idx` (`last_execution_date`),
  KEY `site_id_idx` (`site_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `target_date_idx` (`target_date`),
  KEY `type_target_id_site_id_archived_idx` (`type`,`target_id`,`site_id`,`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table lists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lists`;

CREATE TABLE `lists` (
  `list_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `type_idx` (`type`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `name_idx` (`name`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meta`;

CREATE TABLE `meta` (
  `site_id` bigint(20) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`site_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table report_targets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_targets`;

CREATE TABLE `report_targets` (
  `report_target_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` bigint(20) unsigned NOT NULL,
  `search_id` bigint(20) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`report_target_id`),
  KEY `report_id_idx` (`report_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `report_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `range` int(11) NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `frequency` bigint(20) unsigned NOT NULL,
  `assignee_type` tinyint(4) NOT NULL,
  `assignee` bigint(20) unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `start_date` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `type_idx` (`type`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table search_filters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_filters`;

CREATE TABLE `search_filters` (
  `filter_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `search_id` bigint(20) unsigned NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `lifetime` bigint(20) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`filter_id`),
  KEY `search_id_idx` (`search_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`),
  KEY `site_id_archived_lifetime_idx` (`site_id`,`archived`,`lifetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table search_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_logs`;

CREATE TABLE `search_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `search_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `search_id_idx` (`search_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table search_targets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_targets`;

CREATE TABLE `search_targets` (
  `target_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `search_id` bigint(20) unsigned NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `lifetime` bigint(20) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`target_id`),
  KEY `search_id_idx` (`search_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`),
  KEY `site_id_archived_lifetime_idx` (`site_id`,`archived`,`lifetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searches`;

CREATE TABLE `searches` (
  `search_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(1) NOT NULL,
  `frequency` int(11) NOT NULL,
  `range` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `assignee_type` tinyint(4) NOT NULL,
  `assignee` bigint(20) unsigned NOT NULL,
  `owner` bigint(20) unsigned NOT NULL,
  `last_execution_date` bigint(20) unsigned NOT NULL,
  `last_success_date` bigint(20) unsigned NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `schedule_type` tinyint(4) NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_failure_date` bigint(20) unsigned NOT NULL,
  `last_error_email_date` bigint(20) unsigned NOT NULL,
  `renderer_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_status` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `flap_rate` double NOT NULL,
  `notif_type` tinyint(1) NOT NULL,
  `notif_format` tinyint(1) NOT NULL,
  `notif_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoclose_threshold` int(11) DEFAULT NULL,
  `state_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `type_idx` (`type`),
  KEY `category_idx` (`category`),
  KEY `tags_idx` (`tags`),
  KEY `priority_idx` (`priority`),
  KEY `enabled_idx` (`enabled`),
  KEY `assignee_type_idx` (`assignee_type`),
  KEY `assignee_idx` (`assignee`),
  KEY `owner_idx` (`owner`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `site_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secure` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`site_id`, `name`, `host`, `secure`, `archived`, `create_date`, `update_date`)
VALUES
	(1,'FourOneOne','fouroneone',0,0,1535034046,1535034046);

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table slogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `slogs`;

CREATE TABLE `slogs` (
  `slog_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `action` tinyint(4) unsigned NOT NULL,
  `target` bigint(20) unsigned NOT NULL,
  `actor` bigint(20) unsigned NOT NULL,
  `a` bigint(20) unsigned NOT NULL,
  `b` bigint(20) unsigned NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`slog_id`),
  KEY `type_idx` (`type`),
  KEY `action_idx` (`action`),
  KEY `target_idx` (`target`),
  KEY `actor_idx` (`actor`),
  KEY `a_idx` (`a`),
  KEY `b_idx` (`b`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`),
  KEY `site_id_idx` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `settings` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` bigint(20) unsigned NOT NULL,
  `create_date` bigint(20) unsigned NOT NULL,
  `update_date` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `site_id_name_idx` (`site_id`,`name`),
  UNIQUE KEY `site_id_api_key_idx` (`site_id`,`api_key`),
  KEY `site_id_idx` (`site_id`),
  KEY `archived_idx` (`archived`),
  KEY `create_date_idx` (`create_date`),
  KEY `update_date_idx` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `site_id`, `name`, `real_name`, `password`, `email`, `timezone`, `admin`, `settings`, `api_key`, `archived`, `create_date`, `update_date`)
VALUES
	(1,1,'admin','Admin','$2y$10$lvSDcLEhvd.yHExJtCAE7.06yOPD7Jb31rtJOqkxK7i/lPreqUkia','admin@fouroneone','',1,'{}','Generate a new API key!',0,1535034046,1535034046);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;