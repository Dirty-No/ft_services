-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-service:3306
-- Generation Time: Jan 16, 2021 at 09:09 PM
-- Server version: 10.5.8-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anclarma`
--
CREATE DATABASE IF NOT EXISTS `anclarma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `anclarma`;

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `panel_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` bigint(20) NOT NULL,
  `handler` bigint(20) NOT NULL,
  `severity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `silenced` tinyint(1) NOT NULL,
  `execution_error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eval_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eval_date` datetime DEFAULT NULL,
  `new_state_date` datetime NOT NULL,
  `state_changes` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `for` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_notification`
--

CREATE TABLE `alert_notification` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `frequency` bigint(20) DEFAULT NULL,
  `send_reminder` tinyint(1) DEFAULT 0,
  `disable_resolve_message` tinyint(1) NOT NULL DEFAULT 0,
  `uid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secure_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_notification_state`
--

CREATE TABLE `alert_notification_state` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) NOT NULL,
  `notifier_id` bigint(20) NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `alert_rule_state_updated_version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_rule_tag`
--

CREATE TABLE `alert_rule_tag` (
  `alert_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_commentmeta`
--

CREATE TABLE `anclarma_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_comments`
--

CREATE TABLE `anclarma_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_comments`
--

INSERT INTO `anclarma_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2021-01-16 21:01:48', '2021-01-16 21:01:48', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_links`
--

CREATE TABLE `anclarma_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_options`
--

CREATE TABLE `anclarma_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_options`
--

INSERT INTO `anclarma_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'https://172.17.0.2:5050', 'yes'),
(2, 'home', 'https://172.17.0.2:5050', 'yes'),
(3, 'blogname', 'anclarma', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'anclarma@anclarma.anclarma', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwenty', 'yes'),
(41, 'stylesheet', 'twentytwenty', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1626382908', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'anclarma_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(97, 'fresh_site', '1', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:7:{i:1610830921;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1610830922;a:4:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1610830928;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1610830933;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1610830988;a:1:{s:28:\"wp_update_comment_type_batch\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1610917321;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, '_transient_doing_cron', '1610831248.3946690559387207031250', 'yes'),
(115, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.6.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.6-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.6-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"5.6\";s:7:\"version\";s:3:\"5.6\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.6.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.6-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.6-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"5.6\";s:7:\"version\";s:3:\"5.6\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.3-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.5.3-partial-1.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.3-rollback-1.zip\";}s:7:\"current\";s:5:\"5.5.3\";s:7:\"version\";s:5:\"5.5.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:5:\"5.5.1\";s:9:\"new_files\";s:0:\"\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.5.2-partial-1.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.2-rollback-1.zip\";}s:7:\"current\";s:5:\"5.5.2\";s:7:\"version\";s:5:\"5.5.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:5:\"5.5.1\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1610830929;s:15:\"version_checked\";s:5:\"5.5.1\";s:12:\"translations\";a:0:{}}', 'no'),
(116, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1610830929;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.6\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(117, '_site_transient_timeout_theme_roots', '1610832730', 'no'),
(118, '_site_transient_theme_roots', 'a:3:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(119, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1610830931;s:7:\"checked\";a:3:{s:14:\"twentynineteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"2.4\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.9.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.5\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.6.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(120, '_site_transient_timeout_browser_656e1b25c052cd1a5731dbed6e0c3a4f', '1611435732', 'no'),
(121, '_site_transient_browser_656e1b25c052cd1a5731dbed6e0c3a4f', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"87.0.4280.88\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(122, '_site_transient_timeout_php_check_787617df3522cd9d9182823c87ee367d', '1611435733', 'no'),
(123, '_site_transient_php_check_787617df3522cd9d9182823c87ee367d', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(124, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1610874134', 'no'),
(125, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class=\"rss-widget\"><p><strong>RSS Error:</strong> XML or PCRE extensions not loaded!</p></div><div class=\"rss-widget\"><p><strong>RSS Error:</strong> XML or PCRE extensions not loaded!</p></div>', 'no'),
(126, 'can_compress_scripts', '1', 'no'),
(127, '_site_transient_timeout_community-events-6718ef04d3f46d7f6ff6aabe77f33591', '1610874135', 'no'),
(128, '_site_transient_community-events-6718ef04d3f46d7f6ff6aabe77f33591', 'a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";s:10:\"172.18.0.0\";}s:6:\"events\";a:2:{i:0;a:10:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:42:\"Discussion group: Custom CSS in the Editor\";s:3:\"url\";s:68:\"https://www.meetup.com/learn-wordpress-discussions/events/275746097/\";s:6:\"meetup\";s:27:\"Learn WordPress Discussions\";s:10:\"meetup_url\";s:51:\"https://www.meetup.com/learn-wordpress-discussions/\";s:4:\"date\";s:19:\"2021-01-19 01:00:00\";s:8:\"end_date\";s:19:\"2021-01-19 02:00:00\";s:20:\"start_unix_timestamp\";i:1611046800;s:18:\"end_unix_timestamp\";i:1611050400;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"US\";s:8:\"latitude\";d:37.779998779297;s:9:\"longitude\";d:-122.41999816895;}}i:1;a:10:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:23:\"WordCamp India (Online)\";s:3:\"url\";s:32:\"https://india.wordcamp.org/2021/\";s:6:\"meetup\";N;s:10:\"meetup_url\";N;s:4:\"date\";s:19:\"2021-01-30 00:00:00\";s:8:\"end_date\";s:19:\"2021-02-14 00:00:00\";s:20:\"start_unix_timestamp\";i:1611945000;s:18:\"end_unix_timestamp\";i:1613241000;s:8:\"location\";a:4:{s:8:\"location\";s:6:\"Online\";s:7:\"country\";s:2:\"IN\";s:8:\"latitude\";d:20.593684;s:9:\"longitude\";d:78.96288;}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_postmeta`
--

CREATE TABLE `anclarma_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_postmeta`
--

INSERT INTO `anclarma_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_posts`
--

CREATE TABLE `anclarma_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_posts`
--

INSERT INTO `anclarma_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-01-16 21:01:48', '2021-01-16 21:01:48', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2021-01-16 21:01:48', '2021-01-16 21:01:48', '', 0, 'https://172.17.0.2:5050/?p=1', 0, 'post', '', 1),
(2, 1, '2021-01-16 21:01:48', '2021-01-16 21:01:48', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://172.17.0.2:5050/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2021-01-16 21:01:48', '2021-01-16 21:01:48', '', 0, 'https://172.17.0.2:5050/?page_id=2', 0, 'page', '', 0),
(3, 1, '2021-01-16 21:01:48', '2021-01-16 21:01:48', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: https://172.17.0.2:5050.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2021-01-16 21:01:48', '2021-01-16 21:01:48', '', 0, 'https://172.17.0.2:5050/?page_id=3', 0, 'page', '', 0),
(4, 1, '2021-01-16 21:02:13', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-01-16 21:02:13', '0000-00-00 00:00:00', '', 0, 'https://172.17.0.2:5050/?p=4', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_termmeta`
--

CREATE TABLE `anclarma_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_terms`
--

CREATE TABLE `anclarma_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_terms`
--

INSERT INTO `anclarma_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_term_relationships`
--

CREATE TABLE `anclarma_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_term_relationships`
--

INSERT INTO `anclarma_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_term_taxonomy`
--

CREATE TABLE `anclarma_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_term_taxonomy`
--

INSERT INTO `anclarma_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_usermeta`
--

CREATE TABLE `anclarma_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_usermeta`
--

INSERT INTO `anclarma_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'anclarma'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'anclarma_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'anclarma_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"1e5bf8d53a412f9af3aa5400411ca97c679ac17a844d6f5a901d9e00206bd984\";a:4:{s:10:\"expiration\";i:1611003728;s:2:\"ip\";s:10:\"172.18.0.1\";s:2:\"ua\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36\";s:5:\"login\";i:1610830928;}}'),
(17, 1, 'anclarma_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:10:\"172.18.0.0\";}'),
(19, 2, 'nickname', 'smaccary'),
(20, 2, 'first_name', 'noël'),
(21, 2, 'last_name', 'maccary'),
(22, 2, 'description', ''),
(23, 2, 'rich_editing', 'true'),
(24, 2, 'syntax_highlighting', 'true'),
(25, 2, 'comment_shortcuts', 'false'),
(26, 2, 'admin_color', 'fresh'),
(27, 2, 'use_ssl', '0'),
(28, 2, 'show_admin_bar_front', 'true'),
(29, 2, 'locale', ''),
(30, 2, 'anclarma_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(31, 2, 'anclarma_user_level', '10'),
(32, 2, 'dismissed_wp_pointers', ''),
(33, 3, 'nickname', 'nsadirac'),
(34, 3, 'first_name', 'nicolas'),
(35, 3, 'last_name', 'sadirac'),
(36, 3, 'description', ''),
(37, 3, 'rich_editing', 'true'),
(38, 3, 'syntax_highlighting', 'true'),
(39, 3, 'comment_shortcuts', 'false'),
(40, 3, 'admin_color', 'fresh'),
(41, 3, 'use_ssl', '0'),
(42, 3, 'show_admin_bar_front', 'true'),
(43, 3, 'locale', ''),
(44, 3, 'anclarma_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(45, 3, 'anclarma_user_level', '0'),
(46, 3, 'dismissed_wp_pointers', '');

-- --------------------------------------------------------

--
-- Table structure for table `anclarma_users`
--

CREATE TABLE `anclarma_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anclarma_users`
--

INSERT INTO `anclarma_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'anclarma', '$P$BhLhw7.LZeps5lEI1D5Cft6LzRD4yk1', 'anclarma', 'anclarma@anclarma.anclarma', 'https://172.17.0.2:5050', '2021-01-16 21:01:48', '', 0, 'anclarma'),
(2, 'smaccary', '$P$BxZv88X926q1jD5HJd95f4AW9jsmNc1', 'smaccary', 'smaccary@student.42.fr', 'http://172.17.0.2', '2021-01-16 21:03:13', '1610830993:$P$BjQhZzJvF.0npkTvEoebFnRUA7IvvY1', 0, 'noël maccary'),
(3, 'nsadirac', '$P$BSH1KaFSywSO6fTb1XhIv7y3Kekz6h0', 'nsadirac', 'nsadirac@42.fr', 'http://nicolas.sadirac.gouv', '2021-01-16 21:04:20', '1610831060:$P$BuBwM6skI3NG/hSqqDdj3Rs.pxKdR90', 0, 'nicolas sadirac');

-- --------------------------------------------------------

--
-- Table structure for table `annotation`
--

CREATE TABLE `annotation` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `dashboard_id` bigint(20) DEFAULT NULL,
  `panel_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_state` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_state` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `region_id` bigint(20) DEFAULT 0,
  `tags` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` bigint(20) DEFAULT 0,
  `updated` bigint(20) DEFAULT 0,
  `epoch_end` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `annotation_tag`
--

CREATE TABLE `annotation_tag` (
  `annotation_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_data`
--

CREATE TABLE `cache_data` (
  `cache_key` varchar(168) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expires` int(255) NOT NULL,
  `created_at` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE `dashboard` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `slug` varchar(189) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(189) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `gnet_id` bigint(20) DEFAULT NULL,
  `plugin_id` varchar(189) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint(20) NOT NULL DEFAULT 0,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `has_acl` tinyint(1) NOT NULL DEFAULT 0,
  `uid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard`
--

INSERT INTO `dashboard` (`id`, `version`, `slug`, `title`, `data`, `org_id`, `created`, `updated`, `updated_by`, `created_by`, `gnet_id`, `plugin_id`, `folder_id`, `is_folder`, `has_acl`, `uid`) VALUES
(1, 1, 'wordpress-dashboard', 'wordpress dashboard', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU wordpress\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"wordpress Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress dashboard\",\"uid\":\"wordpress\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'wordpress'),
(2, 1, 'ftps-dashboard', 'ftps dashboard', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU ftps\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"ftps Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"ftps dashboard\",\"uid\":\"ftps\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'ftps');
INSERT INTO `dashboard` (`id`, `version`, `slug`, `title`, `data`, `org_id`, `created`, `updated`, `updated_by`, `created_by`, `gnet_id`, `plugin_id`, `folder_id`, `is_folder`, `has_acl`, `uid`) VALUES
(3, 1, 'grafana-dashboard', 'grafana dashboard', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU grafana\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"grafana Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"grafana dashboard\",\"uid\":\"grafana\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'grafana'),
(4, 1, 'influxdb-dashboard', 'influxdb dashboard', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU influxdb\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"influxdb Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"influxdb dashboard\",\"uid\":\"influxdb\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'influxdb');
INSERT INTO `dashboard` (`id`, `version`, `slug`, `title`, `data`, `org_id`, `created`, `updated`, `updated_by`, `created_by`, `gnet_id`, `plugin_id`, `folder_id`, `is_folder`, `has_acl`, `uid`) VALUES
(5, 1, 'mariadb-dashboard', 'mariadb dashboard', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU mariadb\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"mariadb Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"mariadb dashboard\",\"uid\":\"mariadb\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'mariadb'),
(6, 1, 'nginx-dash', 'nginx dash', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU Nginx\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"NGINX Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"nginx dash\",\"uid\":\"lBiv2m0Mk\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'lBiv2m0Mk');
INSERT INTO `dashboard` (`id`, `version`, `slug`, `title`, `data`, `org_id`, `created`, `updated`, `updated_by`, `created_by`, `gnet_id`, `plugin_id`, `folder_id`, `is_folder`, `has_acl`, `uid`) VALUES
(7, 1, 'phpmyadmin-dashboard', 'phpmyadmin dashboard', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU phpmyadmin\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"phpmyadmin Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"phpmyadmin dashboard\",\"uid\":\"phpmyadmin\",\"version\":1}', 1, '2021-01-16 20:42:55', '2021-01-16 20:42:55', -1, -1, 0, '', 0, 0, 0, 'phpmyadmin');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_acl`
--

CREATE TABLE `dashboard_acl` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `permission` smallint(6) NOT NULL DEFAULT 4,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_acl`
--

INSERT INTO `dashboard_acl` (`id`, `org_id`, `dashboard_id`, `user_id`, `team_id`, `permission`, `role`, `created`, `updated`) VALUES
(1, -1, -1, NULL, NULL, 1, 'Viewer', '2017-06-20 00:00:00', '2017-06-20 00:00:00'),
(2, -1, -1, NULL, NULL, 2, 'Editor', '2017-06-20 00:00:00', '2017-06-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_provisioning`
--

CREATE TABLE `dashboard_provisioning` (
  `id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` int(11) NOT NULL DEFAULT 0,
  `check_sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_provisioning`
--

INSERT INTO `dashboard_provisioning` (`id`, `dashboard_id`, `name`, `external_id`, `updated`, `check_sum`) VALUES
(1, 1, 'default', '/var/lib/grafana/dashboards/wordpress.json', 1610718474, 'b85e7525798449715991e9a62b0bfa44'),
(2, 2, 'default', '/var/lib/grafana/dashboards/ftps.json', 1610718474, '7003608df04726fa6582ae549df56e99'),
(3, 3, 'default', '/var/lib/grafana/dashboards/grafana.json', 1610718474, '1003c15193576200c59617d27676224c'),
(4, 4, 'default', '/var/lib/grafana/dashboards/influxdb.json', 1610718474, '6c89083e2501840ab297f2932c19dcd3'),
(5, 5, 'default', '/var/lib/grafana/dashboards/mariadb.json', 1610718474, '28d1b1b5d6a8abb51e33da95d17ccefa'),
(6, 6, 'default', '/var/lib/grafana/dashboards/nginx.json', 1610718474, '4fd8b963e01fead5f3e24aa3a2d9997b'),
(7, 7, 'default', '/var/lib/grafana/dashboards/phpmyadmin.json', 1610718474, 'fcf256cb6da65df52545d1b63aee7362');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_snapshot`
--

CREATE TABLE `dashboard_snapshot` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_key` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `external` tinyint(1) NOT NULL,
  `external_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external_delete_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_tag`
--

CREATE TABLE `dashboard_tag` (
  `id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `term` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_version`
--

CREATE TABLE `dashboard_version` (
  `id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `parent_version` int(11) NOT NULL,
  `restored_from` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_version`
--

INSERT INTO `dashboard_version` (`id`, `dashboard_id`, `parent_version`, `restored_from`, `version`, `created`, `created_by`, `message`, `data`) VALUES
(1, 1, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU wordpress\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"wordpress Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5050,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress dashboard\",\"uid\":\"wordpress\",\"version\":1}'),
(2, 2, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU ftps\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"ftps Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"cmd\\\",\\\"containerPort\\\":21,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"data\\\",\\\"containerPort\\\":20,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"pasv\\\",\\\"containerPort\\\":8975,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"ftps dashboard\",\"uid\":\"ftps\",\"version\":1}');
INSERT INTO `dashboard_version` (`id`, `dashboard_id`, `parent_version`, `restored_from`, `version`, `created`, `created_by`, `message`, `data`) VALUES
(3, 3, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU grafana\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"grafana Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":3000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"grafana dashboard\",\"uid\":\"grafana\",\"version\":1}'),
(4, 4, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU influxdb\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"influxdb Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"api\\\",\\\"containerPort\\\":8086,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"influxdb dashboard\",\"uid\":\"influxdb\",\"version\":1}'),
(5, 5, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU mariadb\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"mariadb Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":3306,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"mariadb dashboard\",\"uid\":\"mariadb\",\"version\":1}');
INSERT INTO `dashboard_version` (`id`, `dashboard_id`, `parent_version`, `restored_from`, `version`, `created`, `created_by`, `message`, `data`) VALUES
(6, 6, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU Nginx\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"NGINX Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"http\\\",\\\"containerPort\\\":80,\\\"protocol\\\":\\\"TCP\\\"},{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":443,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"nginx dash\",\"uid\":\"lBiv2m0Mk\",\"version\":1}'),
(7, 7, 1, 0, 1, '2021-01-16 20:42:55', -1, '', '{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":\"-- Grafana --\",\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"gnetId\":null,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":23,\"options\":{\"reduceOptions\":{\"calcs\":[\"mean\"],\"fields\":\"\",\"values\":false},\"showThresholdLabels\":false,\"showThresholdMarkers\":true},\"pluginVersion\":\"7.2.0\",\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"timeFrom\":null,\"timeShift\":null,\"title\":\"CPU phpmyadmin\",\"type\":\"gauge\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"hiddenSeries\":false,\"id\":18,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"query\":\"SELECT non_negative_derivative(mean(\\\"rx_bytes\\\"), 10s) FROM \\\"docker_container_net\\\" WHERE (\\\"annotation.io.kubernetes.container.ports\\\" = \'[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\') AND $timeFilter GROUP BY time(10s) fill(null)\",\"rawQuery\":false,\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":false,\"datasource\":null,\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":8},\"id\":27,\"panels\":[],\"title\":\"Memory\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":0,\"y\":9},\"hiddenSeries\":false,\"id\":2,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"phpmyadmin Usage\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":12,\"x\":12,\"y\":9},\"hiddenSeries\":false,\"id\":29,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_mem\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"max_usage\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Max usage (derivative)\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"collapsed\":true,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":18},\"id\":21,\"panels\":[{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":10,\"w\":12,\"x\":0,\"y\":11},\"hiddenSeries\":false,\"id\":14,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"1s\"],\"type\":\"time\"},{\"params\":[\"linear\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_total\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[],\"type\":\"non_negative_difference\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"cpu usage_total difference\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":21},\"hiddenSeries\":false,\"id\":4,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_cpu\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"usage_percent\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"CPU USAGE %\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"title\":\"CPU\",\"type\":\"row\"},{\"collapsed\":false,\"datasource\":\"${DS_INFLUXDB}\",\"gridPos\":{\"h\":1,\"w\":24,\"x\":0,\"y\":19},\"id\":6,\"panels\":[],\"title\":\"Network\",\"type\":\"row\"},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":9,\"w\":20,\"x\":0,\"y\":20},\"hiddenSeries\":false,\"id\":12,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_status\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"uptime_ns\"],\"type\":\"field\"},{\"params\":[],\"type\":\"count\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Panel Title\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":10,\"x\":0,\"y\":29},\"hiddenSeries\":false,\"id\":10,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"$__interval\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"rx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Received bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}},{\"aliasColors\":{},\"bars\":false,\"dashLength\":10,\"dashes\":false,\"datasource\":null,\"fieldConfig\":{\"defaults\":{\"custom\":{}},\"overrides\":[]},\"fill\":1,\"fillGradient\":0,\"gridPos\":{\"h\":8,\"w\":12,\"x\":10,\"y\":29},\"hiddenSeries\":false,\"id\":16,\"legend\":{\"avg\":false,\"current\":false,\"max\":false,\"min\":false,\"show\":true,\"total\":false,\"values\":false},\"lines\":true,\"linewidth\":1,\"nullPointMode\":\"null\",\"options\":{\"alertThreshold\":true},\"percentage\":false,\"pluginVersion\":\"7.2.0\",\"pointradius\":2,\"points\":false,\"renderer\":\"flot\",\"seriesOverrides\":[],\"spaceLength\":10,\"stack\":false,\"steppedLine\":false,\"targets\":[{\"groupBy\":[{\"params\":[\"10s\"],\"type\":\"time\"},{\"params\":[\"null\"],\"type\":\"fill\"}],\"measurement\":\"docker_container_net\",\"orderByTime\":\"ASC\",\"policy\":\"default\",\"refId\":\"A\",\"resultFormat\":\"time_series\",\"select\":[[{\"params\":[\"tx_bytes\"],\"type\":\"field\"},{\"params\":[],\"type\":\"mean\"},{\"params\":[\"10s\"],\"type\":\"non_negative_derivative\"}]],\"tags\":[{\"key\":\"annotation.io.kubernetes.container.ports\",\"operator\":\"=\",\"value\":\"[{\\\"name\\\":\\\"https\\\",\\\"containerPort\\\":5000,\\\"protocol\\\":\\\"TCP\\\"}]\"}]}],\"thresholds\":[],\"timeFrom\":null,\"timeRegions\":[],\"timeShift\":null,\"title\":\"Transfered bytes\",\"tooltip\":{\"shared\":true,\"sort\":0,\"value_type\":\"individual\"},\"type\":\"graph\",\"xaxis\":{\"buckets\":null,\"mode\":\"time\",\"name\":null,\"show\":true,\"values\":[]},\"yaxes\":[{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true},{\"format\":\"short\",\"label\":null,\"logBase\":1,\"max\":null,\"min\":null,\"show\":true}],\"yaxis\":{\"align\":false,\"alignLevel\":null}}],\"refresh\":\"5s\",\"schemaVersion\":26,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-15m\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"phpmyadmin dashboard\",\"uid\":\"phpmyadmin\",\"version\":1}');

-- --------------------------------------------------------

--
-- Table structure for table `data_source`
--

CREATE TABLE `data_source` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth` tinyint(1) NOT NULL,
  `basic_auth_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `with_credentials` tinyint(1) NOT NULL DEFAULT 0,
  `secure_json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT NULL,
  `uid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_source`
--

INSERT INTO `data_source` (`id`, `org_id`, `version`, `type`, `name`, `access`, `url`, `password`, `user`, `database`, `basic_auth`, `basic_auth_user`, `basic_auth_password`, `is_default`, `json_data`, `created`, `updated`, `with_credentials`, `secure_json_data`, `read_only`, `uid`) VALUES
(1, 1, 1, 'influxdb', 'influxdb', 'proxy', 'http://influxdb-service:8086', 'anclarma', 'anclarma', 'influxdb', 0, '', '', 1, '{}', '2021-01-16 20:42:55', '2021-01-16 20:43:00', 0, '{}', 0, 'IIwIIvBGz');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempt`
--

CREATE TABLE `login_attempt` (
  `id` bigint(20) NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration_log`
--

CREATE TABLE `migration_log` (
  `id` bigint(20) NOT NULL,
  `migration_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_log`
--

INSERT INTO `migration_log` (`id`, `migration_id`, `sql`, `success`, `error`, `timestamp`) VALUES
(1, 'create migration_log table', 'CREATE TABLE IF NOT EXISTS `migration_log` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `migration_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `sql` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `success` TINYINT(1) NOT NULL\n, `error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `timestamp` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(2, 'create user table', 'CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `account_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(3, 'add unique index user.login', 'CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);', 1, '', '2021-01-16 20:42:51'),
(4, 'add unique index user.email', 'CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);', 1, '', '2021-01-16 20:42:51'),
(5, 'drop index UQE_user_login - v1', 'DROP INDEX `UQE_user_login` ON `user`', 1, '', '2021-01-16 20:42:51'),
(6, 'drop index UQE_user_email - v1', 'DROP INDEX `UQE_user_email` ON `user`', 1, '', '2021-01-16 20:42:51'),
(7, 'Rename table user to user_v1 - v1', 'ALTER TABLE `user` RENAME TO `user_v1`', 1, '', '2021-01-16 20:42:51'),
(8, 'create user table v2', 'CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `org_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `email_verified` TINYINT(1) NULL\n, `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(9, 'create index UQE_user_login - v2', 'CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);', 1, '', '2021-01-16 20:42:51'),
(10, 'create index UQE_user_email - v2', 'CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);', 1, '', '2021-01-16 20:42:51'),
(11, 'copy data_source v1 to v2', 'INSERT INTO `user` (`email`\n, `salt`\n, `org_id`\n, `created`\n, `version`\n, `login`\n, `name`\n, `password`\n, `rands`\n, `company`\n, `is_admin`\n, `updated`\n, `id`) SELECT `email`\n, `salt`\n, `account_id`\n, `created`\n, `version`\n, `login`\n, `name`\n, `password`\n, `rands`\n, `company`\n, `is_admin`\n, `updated`\n, `id` FROM `user_v1`', 1, '', '2021-01-16 20:42:51'),
(12, 'Drop old table user_v1', 'DROP TABLE IF EXISTS `user_v1`', 1, '', '2021-01-16 20:42:51'),
(13, 'Add column help_flags1 to user table', 'alter table `user` ADD COLUMN `help_flags1` BIGINT(20) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:51'),
(14, 'Update user table charset', 'ALTER TABLE `user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2021-01-16 20:42:51'),
(15, 'Add last_seen_at column to user', 'alter table `user` ADD COLUMN `last_seen_at` DATETIME NULL ', 1, '', '2021-01-16 20:42:51'),
(16, 'Add missing user data', 'code migration', 1, '', '2021-01-16 20:42:51'),
(17, 'Add is_disabled column to user', 'alter table `user` ADD COLUMN `is_disabled` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:51'),
(18, 'Add index user.login/user.email', 'CREATE INDEX `IDX_user_login_email` ON `user` (`login`,`email`);', 1, '', '2021-01-16 20:42:51'),
(19, 'create temp user table v1-7', 'CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(20, 'create index IDX_temp_user_email - v1-7', 'CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);', 1, '', '2021-01-16 20:42:51'),
(21, 'create index IDX_temp_user_org_id - v1-7', 'CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);', 1, '', '2021-01-16 20:42:51'),
(22, 'create index IDX_temp_user_code - v1-7', 'CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);', 1, '', '2021-01-16 20:42:51'),
(23, 'create index IDX_temp_user_status - v1-7', 'CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);', 1, '', '2021-01-16 20:42:51'),
(24, 'Update temp_user table charset', 'ALTER TABLE `temp_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2021-01-16 20:42:51'),
(25, 'create star table', 'CREATE TABLE IF NOT EXISTS `star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(26, 'add unique index star.user_id_dashboard_id', 'CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`);', 1, '', '2021-01-16 20:42:51'),
(27, 'create org table v1', 'CREATE TABLE IF NOT EXISTS `org` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(28, 'create index UQE_org_name - v1', 'CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`);', 1, '', '2021-01-16 20:42:51'),
(29, 'create org_user table v1', 'CREATE TABLE IF NOT EXISTS `org_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(30, 'create index IDX_org_user_org_id - v1', 'CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);', 1, '', '2021-01-16 20:42:51'),
(31, 'create index UQE_org_user_org_id_user_id - v1', 'CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`);', 1, '', '2021-01-16 20:42:51'),
(32, 'Update org table charset', 'ALTER TABLE `org` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2021-01-16 20:42:51'),
(33, 'Update org_user table charset', 'ALTER TABLE `org_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:51'),
(34, 'Migrate all Read Only Viewers to Viewers', 'UPDATE org_user SET role = \'Viewer\' WHERE role = \'Read Only Editor\'', 1, '', '2021-01-16 20:42:51'),
(35, 'create dashboard table', 'CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:51'),
(36, 'add index dashboard.account_id', 'CREATE INDEX `IDX_dashboard_account_id` ON `dashboard` (`account_id`);', 1, '', '2021-01-16 20:42:51'),
(37, 'add unique index dashboard_account_id_slug', 'CREATE UNIQUE INDEX `UQE_dashboard_account_id_slug` ON `dashboard` (`account_id`,`slug`);', 1, '', '2021-01-16 20:42:52'),
(38, 'create dashboard_tag table', 'CREATE TABLE IF NOT EXISTS `dashboard_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(39, 'add unique index dashboard_tag.dasboard_id_term', 'CREATE UNIQUE INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag` (`dashboard_id`,`term`);', 1, '', '2021-01-16 20:42:52'),
(40, 'drop index UQE_dashboard_tag_dashboard_id_term - v1', 'DROP INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag`', 1, '', '2021-01-16 20:42:52'),
(41, 'Rename table dashboard to dashboard_v1 - v1', 'ALTER TABLE `dashboard` RENAME TO `dashboard_v1`', 1, '', '2021-01-16 20:42:52'),
(42, 'create dashboard v2', 'CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(43, 'create index IDX_dashboard_org_id - v2', 'CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`);', 1, '', '2021-01-16 20:42:52'),
(44, 'create index UQE_dashboard_org_id_slug - v2', 'CREATE UNIQUE INDEX `UQE_dashboard_org_id_slug` ON `dashboard` (`org_id`,`slug`);', 1, '', '2021-01-16 20:42:52'),
(45, 'copy dashboard v1 to v2', 'INSERT INTO `dashboard` (`title`\n, `data`\n, `org_id`\n, `created`\n, `updated`\n, `id`\n, `version`\n, `slug`) SELECT `title`\n, `data`\n, `account_id`\n, `created`\n, `updated`\n, `id`\n, `version`\n, `slug` FROM `dashboard_v1`', 1, '', '2021-01-16 20:42:52'),
(46, 'drop table dashboard_v1', 'DROP TABLE IF EXISTS `dashboard_v1`', 1, '', '2021-01-16 20:42:52'),
(47, 'alter dashboard.data to mediumtext v1', 'ALTER TABLE dashboard MODIFY data MEDIUMTEXT;', 1, '', '2021-01-16 20:42:52'),
(48, 'Add column updated_by in dashboard - v2', 'alter table `dashboard` ADD COLUMN `updated_by` INT NULL ', 1, '', '2021-01-16 20:42:52'),
(49, 'Add column created_by in dashboard - v2', 'alter table `dashboard` ADD COLUMN `created_by` INT NULL ', 1, '', '2021-01-16 20:42:52'),
(50, 'Add column gnetId in dashboard', 'alter table `dashboard` ADD COLUMN `gnet_id` BIGINT(20) NULL ', 1, '', '2021-01-16 20:42:52'),
(51, 'Add index for gnetId in dashboard', 'CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`);', 1, '', '2021-01-16 20:42:52'),
(52, 'Add column plugin_id in dashboard', 'alter table `dashboard` ADD COLUMN `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:52'),
(53, 'Add index for plugin_id in dashboard', 'CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`);', 1, '', '2021-01-16 20:42:52'),
(54, 'Add index for dashboard_id in dashboard_tag', 'CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`);', 1, '', '2021-01-16 20:42:52'),
(55, 'Update dashboard table charset', 'ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `data` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:52'),
(56, 'Update dashboard_tag table charset', 'ALTER TABLE `dashboard_tag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:52'),
(57, 'Add column folder_id in dashboard', 'alter table `dashboard` ADD COLUMN `folder_id` BIGINT(20) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:52'),
(58, 'Add column isFolder in dashboard', 'alter table `dashboard` ADD COLUMN `is_folder` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:52'),
(59, 'Add column has_acl in dashboard', 'alter table `dashboard` ADD COLUMN `has_acl` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:52'),
(60, 'Add column uid in dashboard', 'alter table `dashboard` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:52'),
(61, 'Update uid column values in dashboard', 'UPDATE dashboard SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;', 1, '', '2021-01-16 20:42:52'),
(62, 'Add unique index dashboard_org_id_uid', 'CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`);', 1, '', '2021-01-16 20:42:52'),
(63, 'Remove unique index org_id_slug', 'DROP INDEX `UQE_dashboard_org_id_slug` ON `dashboard`', 1, '', '2021-01-16 20:42:52'),
(64, 'Update dashboard title length', 'ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:52'),
(65, 'Add unique index for dashboard_org_id_title_folder_id', 'CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);', 1, '', '2021-01-16 20:42:52'),
(66, 'create dashboard_provisioning', 'CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(67, 'Rename table dashboard_provisioning to dashboard_provisioning_tmp_qwerty - v1', 'ALTER TABLE `dashboard_provisioning` RENAME TO `dashboard_provisioning_tmp_qwerty`', 1, '', '2021-01-16 20:42:52'),
(68, 'create dashboard_provisioning v2', 'CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(69, 'create index IDX_dashboard_provisioning_dashboard_id - v2', 'CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`);', 1, '', '2021-01-16 20:42:52'),
(70, 'create index IDX_dashboard_provisioning_dashboard_id_name - v2', 'CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`);', 1, '', '2021-01-16 20:42:52'),
(71, 'copy dashboard_provisioning v1 to v2', 'INSERT INTO `dashboard_provisioning` (`dashboard_id`\n, `name`\n, `external_id`\n, `id`) SELECT `dashboard_id`\n, `name`\n, `external_id`\n, `id` FROM `dashboard_provisioning_tmp_qwerty`', 1, '', '2021-01-16 20:42:52'),
(72, 'drop dashboard_provisioning_tmp_qwerty', 'DROP TABLE IF EXISTS `dashboard_provisioning_tmp_qwerty`', 1, '', '2021-01-16 20:42:52'),
(73, 'Add check_sum column', 'alter table `dashboard_provisioning` ADD COLUMN `check_sum` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:52'),
(74, 'Add index for dashboard_title', 'CREATE INDEX `IDX_dashboard_title` ON `dashboard` (`title`);', 1, '', '2021-01-16 20:42:52'),
(75, 'create data_source table', 'CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(76, 'add index data_source.account_id', 'CREATE INDEX `IDX_data_source_account_id` ON `data_source` (`account_id`);', 1, '', '2021-01-16 20:42:52'),
(77, 'add unique index data_source.account_id_name', 'CREATE UNIQUE INDEX `UQE_data_source_account_id_name` ON `data_source` (`account_id`,`name`);', 1, '', '2021-01-16 20:42:52'),
(78, 'drop index IDX_data_source_account_id - v1', 'DROP INDEX `IDX_data_source_account_id` ON `data_source`', 1, '', '2021-01-16 20:42:52'),
(79, 'drop index UQE_data_source_account_id_name - v1', 'DROP INDEX `UQE_data_source_account_id_name` ON `data_source`', 1, '', '2021-01-16 20:42:52'),
(80, 'Rename table data_source to data_source_v1 - v1', 'ALTER TABLE `data_source` RENAME TO `data_source_v1`', 1, '', '2021-01-16 20:42:52'),
(81, 'create data_source table v2', 'CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(82, 'create index IDX_data_source_org_id - v2', 'CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`);', 1, '', '2021-01-16 20:42:52'),
(83, 'create index UQE_data_source_org_id_name - v2', 'CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`);', 1, '', '2021-01-16 20:42:52'),
(84, 'copy data_source v1 to v2', 'INSERT INTO `data_source` (`org_id`\n, `password`\n, `database`\n, `is_default`\n, `version`\n, `url`\n, `user`\n, `basic_auth_user`\n, `created`\n, `updated`\n, `id`\n, `name`\n, `access`\n, `basic_auth`\n, `basic_auth_password`\n, `type`) SELECT `account_id`\n, `password`\n, `database`\n, `is_default`\n, `version`\n, `url`\n, `user`\n, `basic_auth_user`\n, `created`\n, `updated`\n, `id`\n, `name`\n, `access`\n, `basic_auth`\n, `basic_auth_password`\n, `type` FROM `data_source_v1`', 1, '', '2021-01-16 20:42:52'),
(85, 'Drop old table data_source_v1 #2', 'DROP TABLE IF EXISTS `data_source_v1`', 1, '', '2021-01-16 20:42:52'),
(86, 'Add column with_credentials', 'alter table `data_source` ADD COLUMN `with_credentials` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:52'),
(87, 'Add secure json data column', 'alter table `data_source` ADD COLUMN `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:52'),
(88, 'Update data_source table charset', 'ALTER TABLE `data_source` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2021-01-16 20:42:52'),
(89, 'Update initial version to 1', 'UPDATE data_source SET version = 1 WHERE version = 0', 1, '', '2021-01-16 20:42:52'),
(90, 'Add read_only data column', 'alter table `data_source` ADD COLUMN `read_only` TINYINT(1) NULL ', 1, '', '2021-01-16 20:42:52'),
(91, 'Migrate logging ds to loki ds', 'UPDATE data_source SET type = \'loki\' WHERE type = \'logging\'', 1, '', '2021-01-16 20:42:52'),
(92, 'Update json_data with nulls', 'UPDATE data_source SET json_data = \'{}\' WHERE json_data is null', 1, '', '2021-01-16 20:42:52'),
(93, 'Add uid column', 'alter table `data_source` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:52'),
(94, 'Update uid value', 'UPDATE data_source SET uid=lpad(id,9,\'0\');', 1, '', '2021-01-16 20:42:52'),
(95, 'Add unique index datasource_org_id_uid', 'CREATE UNIQUE INDEX `UQE_data_source_org_id_uid` ON `data_source` (`org_id`,`uid`);', 1, '', '2021-01-16 20:42:52'),
(96, 'create api_key table', 'CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(97, 'add index api_key.account_id', 'CREATE INDEX `IDX_api_key_account_id` ON `api_key` (`account_id`);', 1, '', '2021-01-16 20:42:52'),
(98, 'add index api_key.key', 'CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);', 1, '', '2021-01-16 20:42:52'),
(99, 'add index api_key.account_id_name', 'CREATE UNIQUE INDEX `UQE_api_key_account_id_name` ON `api_key` (`account_id`,`name`);', 1, '', '2021-01-16 20:42:52'),
(100, 'drop index IDX_api_key_account_id - v1', 'DROP INDEX `IDX_api_key_account_id` ON `api_key`', 1, '', '2021-01-16 20:42:52'),
(101, 'drop index UQE_api_key_key - v1', 'DROP INDEX `UQE_api_key_key` ON `api_key`', 1, '', '2021-01-16 20:42:52'),
(102, 'drop index UQE_api_key_account_id_name - v1', 'DROP INDEX `UQE_api_key_account_id_name` ON `api_key`', 1, '', '2021-01-16 20:42:52'),
(103, 'Rename table api_key to api_key_v1 - v1', 'ALTER TABLE `api_key` RENAME TO `api_key_v1`', 1, '', '2021-01-16 20:42:52'),
(104, 'create api_key table v2', 'CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:52'),
(105, 'create index IDX_api_key_org_id - v2', 'CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`);', 1, '', '2021-01-16 20:42:52'),
(106, 'create index UQE_api_key_key - v2', 'CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);', 1, '', '2021-01-16 20:42:52'),
(107, 'create index UQE_api_key_org_id_name - v2', 'CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`);', 1, '', '2021-01-16 20:42:53'),
(108, 'copy api_key v1 to v2', 'INSERT INTO `api_key` (`id`\n, `org_id`\n, `name`\n, `key`\n, `role`\n, `created`\n, `updated`) SELECT `id`\n, `account_id`\n, `name`\n, `key`\n, `role`\n, `created`\n, `updated` FROM `api_key_v1`', 1, '', '2021-01-16 20:42:53'),
(109, 'Drop old table api_key_v1', 'DROP TABLE IF EXISTS `api_key_v1`', 1, '', '2021-01-16 20:42:53'),
(110, 'Update api_key table charset', 'ALTER TABLE `api_key` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(111, 'Add expires to api_key table', 'alter table `api_key` ADD COLUMN `expires` BIGINT(20) NULL ', 1, '', '2021-01-16 20:42:53'),
(112, 'create dashboard_snapshot table v4', 'CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(113, 'drop table dashboard_snapshot_v4 #1', 'DROP TABLE IF EXISTS `dashboard_snapshot`', 1, '', '2021-01-16 20:42:53'),
(114, 'create dashboard_snapshot table v5 #2', 'CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `external` TINYINT(1) NOT NULL\n, `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(115, 'create index UQE_dashboard_snapshot_key - v5', 'CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`);', 1, '', '2021-01-16 20:42:53'),
(116, 'create index UQE_dashboard_snapshot_delete_key - v5', 'CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`);', 1, '', '2021-01-16 20:42:53'),
(117, 'create index IDX_dashboard_snapshot_user_id - v5', 'CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`);', 1, '', '2021-01-16 20:42:53'),
(118, 'alter dashboard_snapshot to mediumtext v2', 'ALTER TABLE dashboard_snapshot MODIFY dashboard MEDIUMTEXT;', 1, '', '2021-01-16 20:42:53'),
(119, 'Update dashboard_snapshot table charset', 'ALTER TABLE `dashboard_snapshot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `dashboard` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(120, 'Add column external_delete_url to dashboard_snapshots table', 'alter table `dashboard_snapshot` ADD COLUMN `external_delete_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:53'),
(121, 'create quota table v1', 'CREATE TABLE IF NOT EXISTS `quota` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `limit` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(122, 'create index UQE_quota_org_id_user_id_target - v1', 'CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`);', 1, '', '2021-01-16 20:42:53'),
(123, 'Update quota table charset', 'ALTER TABLE `quota` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(124, 'create plugin_setting table', 'CREATE TABLE IF NOT EXISTS `plugin_setting` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `enabled` TINYINT(1) NOT NULL\n, `pinned` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(125, 'create index UQE_plugin_setting_org_id_plugin_id - v1', 'CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`);', 1, '', '2021-01-16 20:42:53'),
(126, 'Add column plugin_version to plugin_settings', 'alter table `plugin_setting` ADD COLUMN `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:53'),
(127, 'Update plugin_setting table charset', 'ALTER TABLE `plugin_setting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2021-01-16 20:42:53'),
(128, 'create session table', 'CREATE TABLE IF NOT EXISTS `session` (\n`key` CHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(129, 'Drop old table playlist table', 'DROP TABLE IF EXISTS `playlist`', 1, '', '2021-01-16 20:42:53'),
(130, 'Drop old table playlist_item table', 'DROP TABLE IF EXISTS `playlist_item`', 1, '', '2021-01-16 20:42:53'),
(131, 'create playlist table v2', 'CREATE TABLE IF NOT EXISTS `playlist` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(132, 'create playlist item table v2', 'CREATE TABLE IF NOT EXISTS `playlist_item` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `playlist_id` BIGINT(20) NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `order` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(133, 'Update playlist table charset', 'ALTER TABLE `playlist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(134, 'Update playlist_item table charset', 'ALTER TABLE `playlist_item` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(135, 'drop preferences table v2', 'DROP TABLE IF EXISTS `preferences`', 1, '', '2021-01-16 20:42:53'),
(136, 'drop preferences table v3', 'DROP TABLE IF EXISTS `preferences`', 1, '', '2021-01-16 20:42:53'),
(137, 'create preferences table v3', 'CREATE TABLE IF NOT EXISTS `preferences` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `home_dashboard_id` BIGINT(20) NOT NULL\n, `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(138, 'Update preferences table charset', 'ALTER TABLE `preferences` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(139, 'Add column team_id in preferences', 'alter table `preferences` ADD COLUMN `team_id` BIGINT(20) NULL ', 1, '', '2021-01-16 20:42:53'),
(140, 'Update team_id column values in preferences', 'UPDATE preferences SET team_id=0 WHERE team_id IS NULL;', 1, '', '2021-01-16 20:42:53'),
(141, 'create alert table v1', 'CREATE TABLE IF NOT EXISTS `alert` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `panel_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `frequency` BIGINT(20) NOT NULL\n, `handler` BIGINT(20) NOT NULL\n, `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `silenced` TINYINT(1) NOT NULL\n, `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(142, 'add index alert org_id & id ', 'CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`);', 1, '', '2021-01-16 20:42:53'),
(143, 'add index alert state', 'CREATE INDEX `IDX_alert_state` ON `alert` (`state`);', 1, '', '2021-01-16 20:42:53'),
(144, 'add index alert dashboard_id', 'CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`);', 1, '', '2021-01-16 20:42:53'),
(145, 'Create alert_rule_tag table v1', 'CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(146, 'Add unique index alert_rule_tag.alert_id_tag_id', 'CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);', 1, '', '2021-01-16 20:42:53'),
(147, 'create alert_notification table v1', 'CREATE TABLE IF NOT EXISTS `alert_notification` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(148, 'Add column is_default', 'alter table `alert_notification` ADD COLUMN `is_default` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:53'),
(149, 'Add column frequency', 'alter table `alert_notification` ADD COLUMN `frequency` BIGINT(20) NULL ', 1, '', '2021-01-16 20:42:53'),
(150, 'Add column send_reminder', 'alter table `alert_notification` ADD COLUMN `send_reminder` TINYINT(1) NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:53'),
(151, 'Add column disable_resolve_message', 'alter table `alert_notification` ADD COLUMN `disable_resolve_message` TINYINT(1) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:53'),
(152, 'add index alert_notification org_id & name', 'CREATE UNIQUE INDEX `UQE_alert_notification_org_id_name` ON `alert_notification` (`org_id`,`name`);', 1, '', '2021-01-16 20:42:53'),
(153, 'Update alert table charset', 'ALTER TABLE `alert` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;', 1, '', '2021-01-16 20:42:53'),
(154, 'Update alert_notification table charset', 'ALTER TABLE `alert_notification` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(155, 'create notification_journal table v1', 'CREATE TABLE IF NOT EXISTS `alert_notification_journal` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `sent_at` BIGINT(20) NOT NULL\n, `success` TINYINT(1) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(156, 'add index notification_journal org_id & alert_id & notifier_id', 'CREATE INDEX `IDX_alert_notification_journal_org_id_alert_id_notifier_id` ON `alert_notification_journal` (`org_id`,`alert_id`,`notifier_id`);', 1, '', '2021-01-16 20:42:53'),
(157, 'drop alert_notification_journal', 'DROP TABLE IF EXISTS `alert_notification_journal`', 1, '', '2021-01-16 20:42:53'),
(158, 'create alert_notification_state table v1', 'CREATE TABLE IF NOT EXISTS `alert_notification_state` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `state` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `updated_at` BIGINT(20) NOT NULL\n, `alert_rule_state_updated_version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(159, 'add index alert_notification_state org_id & alert_id & notifier_id', 'CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`);', 1, '', '2021-01-16 20:42:53'),
(160, 'Add for to alert table', 'alter table `alert` ADD COLUMN `for` BIGINT(20) NULL ', 1, '', '2021-01-16 20:42:53'),
(161, 'Add column uid in alert_notification', 'alter table `alert_notification` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:53'),
(162, 'Update uid column values in alert_notification', 'UPDATE alert_notification SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;', 1, '', '2021-01-16 20:42:53'),
(163, 'Add unique index alert_notification_org_id_uid', 'CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`);', 1, '', '2021-01-16 20:42:53'),
(164, 'Remove unique index org_id_name', 'DROP INDEX `UQE_alert_notification_org_id_name` ON `alert_notification`', 1, '', '2021-01-16 20:42:53'),
(165, 'Add column secure_settings in alert_notification', 'alter table `alert_notification` ADD COLUMN `secure_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:53'),
(166, 'alter alert.settings to mediumtext', 'ALTER TABLE alert MODIFY settings MEDIUMTEXT;', 1, '', '2021-01-16 20:42:53'),
(167, 'Drop old annotation table v4', 'DROP TABLE IF EXISTS `annotation`', 1, '', '2021-01-16 20:42:53'),
(168, 'create annotation table v5', 'CREATE TABLE IF NOT EXISTS `annotation` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `dashboard_id` BIGINT(20) NULL\n, `panel_id` BIGINT(20) NULL\n, `category_id` BIGINT(20) NULL\n, `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `epoch` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(169, 'add index annotation 0 v3', 'CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`);', 1, '', '2021-01-16 20:42:53'),
(170, 'add index annotation 1 v3', 'CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`);', 1, '', '2021-01-16 20:42:53'),
(171, 'add index annotation 2 v3', 'CREATE INDEX `IDX_annotation_org_id_category_id` ON `annotation` (`org_id`,`category_id`);', 1, '', '2021-01-16 20:42:53'),
(172, 'add index annotation 3 v3', 'CREATE INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation` (`org_id`,`dashboard_id`,`panel_id`,`epoch`);', 1, '', '2021-01-16 20:42:53'),
(173, 'add index annotation 4 v3', 'CREATE INDEX `IDX_annotation_org_id_epoch` ON `annotation` (`org_id`,`epoch`);', 1, '', '2021-01-16 20:42:53'),
(174, 'Update annotation table charset', 'ALTER TABLE `annotation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;', 1, '', '2021-01-16 20:42:53'),
(175, 'Add column region_id to annotation table', 'alter table `annotation` ADD COLUMN `region_id` BIGINT(20) NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:53'),
(176, 'Drop category_id index', 'DROP INDEX `IDX_annotation_org_id_category_id` ON `annotation`', 1, '', '2021-01-16 20:42:53'),
(177, 'Add column tags to annotation table', 'alter table `annotation` ADD COLUMN `tags` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:53'),
(178, 'Create annotation_tag table v2', 'CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:53'),
(179, 'Add unique index annotation_tag.annotation_id_tag_id', 'CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);', 1, '', '2021-01-16 20:42:53'),
(180, 'Update alert annotations and set TEXT to empty', 'UPDATE annotation SET TEXT = \'\' WHERE alert_id > 0', 1, '', '2021-01-16 20:42:53');
INSERT INTO `migration_log` (`id`, `migration_id`, `sql`, `success`, `error`, `timestamp`) VALUES
(181, 'Add created time to annotation table', 'alter table `annotation` ADD COLUMN `created` BIGINT(20) NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:53'),
(182, 'Add updated time to annotation table', 'alter table `annotation` ADD COLUMN `updated` BIGINT(20) NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:53'),
(183, 'Add index for created in annotation table', 'CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`);', 1, '', '2021-01-16 20:42:53'),
(184, 'Add index for updated in annotation table', 'CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`);', 1, '', '2021-01-16 20:42:54'),
(185, 'Convert existing annotations from seconds to milliseconds', 'UPDATE annotation SET epoch = (epoch*1000) where epoch < 9999999999', 1, '', '2021-01-16 20:42:54'),
(186, 'Add epoch_end column', 'alter table `annotation` ADD COLUMN `epoch_end` BIGINT(20) NOT NULL DEFAULT 0 ', 1, '', '2021-01-16 20:42:54'),
(187, 'Add index for epoch_end', 'CREATE INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation` (`org_id`,`epoch`,`epoch_end`);', 1, '', '2021-01-16 20:42:54'),
(188, 'Make epoch_end the same as epoch', 'UPDATE annotation SET epoch_end = epoch', 1, '', '2021-01-16 20:42:54'),
(189, 'Move region to single row', 'code migration', 1, '', '2021-01-16 20:42:54'),
(190, 'Remove index org_id_epoch from annotation table', 'DROP INDEX `IDX_annotation_org_id_epoch` ON `annotation`', 1, '', '2021-01-16 20:42:54'),
(191, 'Remove index org_id_dashboard_id_panel_id_epoch from annotation table', 'DROP INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation`', 1, '', '2021-01-16 20:42:54'),
(192, 'Add index for org_id_dashboard_id_epoch_end_epoch on annotation table', 'CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`);', 1, '', '2021-01-16 20:42:54'),
(193, 'Add index for org_id_epoch_end_epoch on annotation table', 'CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`);', 1, '', '2021-01-16 20:42:54'),
(194, 'Remove index org_id_epoch_epoch_end from annotation table', 'DROP INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation`', 1, '', '2021-01-16 20:42:54'),
(195, 'Add index for alert_id on annotation table', 'CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`);', 1, '', '2021-01-16 20:42:54'),
(196, 'create test_data table', 'CREATE TABLE IF NOT EXISTS `test_data` (\n`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `metric1` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `metric2` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `value_big_int` BIGINT(20) NULL\n, `value_double` DOUBLE NULL\n, `value_float` FLOAT NULL\n, `value_int` INT NULL\n, `time_epoch` BIGINT(20) NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` TIMESTAMP NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(197, 'create dashboard_version table v1', 'CREATE TABLE IF NOT EXISTS `dashboard_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(198, 'add index dashboard_version.dashboard_id', 'CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`);', 1, '', '2021-01-16 20:42:54'),
(199, 'add unique index dashboard_version.dashboard_id and dashboard_version.version', 'CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`);', 1, '', '2021-01-16 20:42:54'),
(200, 'Set dashboard version to 1 where 0', 'UPDATE dashboard SET version = 1 WHERE version = 0', 1, '', '2021-01-16 20:42:54'),
(201, 'save existing dashboard data in dashboard_version table v1', 'INSERT INTO dashboard_version\n(\n	dashboard_id,\n	version,\n	parent_version,\n	restored_from,\n	created,\n	created_by,\n	message,\n	data\n)\nSELECT\n	dashboard.id,\n	dashboard.version,\n	dashboard.version,\n	dashboard.version,\n	dashboard.updated,\n	COALESCE(dashboard.updated_by, -1),\n	\'\',\n	dashboard.data\nFROM dashboard;', 1, '', '2021-01-16 20:42:54'),
(202, 'alter dashboard_version.data to mediumtext v1', 'ALTER TABLE dashboard_version MODIFY data MEDIUMTEXT;', 1, '', '2021-01-16 20:42:54'),
(203, 'create team table', 'CREATE TABLE IF NOT EXISTS `team` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(204, 'add index team.org_id', 'CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);', 1, '', '2021-01-16 20:42:54'),
(205, 'add unique index team_org_id_name', 'CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`);', 1, '', '2021-01-16 20:42:54'),
(206, 'create team member table', 'CREATE TABLE IF NOT EXISTS `team_member` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(207, 'add index team_member.org_id', 'CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`);', 1, '', '2021-01-16 20:42:54'),
(208, 'add unique index team_member_org_id_team_id_user_id', 'CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`);', 1, '', '2021-01-16 20:42:54'),
(209, 'add index team_member.team_id', 'CREATE INDEX `IDX_team_member_team_id` ON `team_member` (`team_id`);', 1, '', '2021-01-16 20:42:54'),
(210, 'Add column email to team table', 'alter table `team` ADD COLUMN `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:54'),
(211, 'Add column external to team_member table', 'alter table `team_member` ADD COLUMN `external` TINYINT(1) NULL ', 1, '', '2021-01-16 20:42:54'),
(212, 'Add column permission to team_member table', 'alter table `team_member` ADD COLUMN `permission` SMALLINT NULL ', 1, '', '2021-01-16 20:42:54'),
(213, 'create dashboard acl table', 'CREATE TABLE IF NOT EXISTS `dashboard_acl` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NULL\n, `team_id` BIGINT(20) NULL\n, `permission` SMALLINT NOT NULL DEFAULT 4\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(214, 'add index dashboard_acl_dashboard_id', 'CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`);', 1, '', '2021-01-16 20:42:54'),
(215, 'add unique index dashboard_acl_dashboard_id_user_id', 'CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`);', 1, '', '2021-01-16 20:42:54'),
(216, 'add unique index dashboard_acl_dashboard_id_team_id', 'CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`);', 1, '', '2021-01-16 20:42:54'),
(217, 'save default acl rules in dashboard_acl table', '\nINSERT INTO dashboard_acl\n	(\n		org_id,\n		dashboard_id,\n		permission,\n		role,\n		created,\n		updated\n	)\n	VALUES\n		(-1,-1, 1,\'Viewer\',\'2017-06-20\',\'2017-06-20\'),\n		(-1,-1, 2,\'Editor\',\'2017-06-20\',\'2017-06-20\')\n	', 1, '', '2021-01-16 20:42:54'),
(218, 'create tag table', 'CREATE TABLE IF NOT EXISTS `tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(219, 'add index tag.key_value', 'CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`);', 1, '', '2021-01-16 20:42:54'),
(220, 'create login attempt table', 'CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(221, 'add index login_attempt.username', 'CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);', 1, '', '2021-01-16 20:42:54'),
(222, 'drop index IDX_login_attempt_username - v1', 'DROP INDEX `IDX_login_attempt_username` ON `login_attempt`', 1, '', '2021-01-16 20:42:54'),
(223, 'Rename table login_attempt to login_attempt_tmp_qwerty - v1', 'ALTER TABLE `login_attempt` RENAME TO `login_attempt_tmp_qwerty`', 1, '', '2021-01-16 20:42:54'),
(224, 'create login_attempt v2', 'CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(225, 'create index IDX_login_attempt_username - v2', 'CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);', 1, '', '2021-01-16 20:42:54'),
(226, 'copy login_attempt v1 to v2', 'INSERT INTO `login_attempt` (`id`\n, `username`\n, `ip_address`) SELECT `id`\n, `username`\n, `ip_address` FROM `login_attempt_tmp_qwerty`', 1, '', '2021-01-16 20:42:54'),
(227, 'drop login_attempt_tmp_qwerty', 'DROP TABLE IF EXISTS `login_attempt_tmp_qwerty`', 1, '', '2021-01-16 20:42:54'),
(228, 'create user auth table', 'CREATE TABLE IF NOT EXISTS `user_auth` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(229, 'create index IDX_user_auth_auth_module_auth_id - v1', 'CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`);', 1, '', '2021-01-16 20:42:54'),
(230, 'alter user_auth.auth_id to length 190', 'ALTER TABLE user_auth MODIFY auth_id VARCHAR(190);', 1, '', '2021-01-16 20:42:54'),
(231, 'Add OAuth access token to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:54'),
(232, 'Add OAuth refresh token to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:54'),
(233, 'Add OAuth token type to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_token_type` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ', 1, '', '2021-01-16 20:42:54'),
(234, 'Add OAuth expiry to user_auth', 'alter table `user_auth` ADD COLUMN `o_auth_expiry` DATETIME NULL ', 1, '', '2021-01-16 20:42:54'),
(235, 'Add index to user_id column in user_auth', 'CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`);', 1, '', '2021-01-16 20:42:54'),
(236, 'create server_lock table', 'CREATE TABLE IF NOT EXISTS `server_lock` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `operation_uid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `last_execution` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(237, 'add index server_lock.operation_uid', 'CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`);', 1, '', '2021-01-16 20:42:54'),
(238, 'create user auth token table', 'CREATE TABLE IF NOT EXISTS `user_auth_token` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `prev_auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_token_seen` TINYINT(1) NOT NULL\n, `seen_at` INT NULL\n, `rotated_at` INT NOT NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(239, 'add unique index user_auth_token.auth_token', 'CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`);', 1, '', '2021-01-16 20:42:54'),
(240, 'add unique index user_auth_token.prev_auth_token', 'CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`);', 1, '', '2021-01-16 20:42:54'),
(241, 'create cache_data table', 'CREATE TABLE IF NOT EXISTS `cache_data` (\n`cache_key` VARCHAR(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER(255) NOT NULL\n, `created_at` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;', 1, '', '2021-01-16 20:42:54'),
(242, 'add unique index cache_data.cache_key', 'CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`);', 1, '', '2021-01-16 20:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `org`
--

CREATE TABLE `org` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `org`
--

INSERT INTO `org` (`id`, `version`, `name`, `address1`, `address2`, `city`, `state`, `zip_code`, `country`, `billing_email`, `created`, `updated`) VALUES
(1, 0, 'Main Org.', '', '', '', '', '', '', NULL, '2021-01-16 20:42:54', '2021-01-16 20:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `org_user`
--

CREATE TABLE `org_user` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `org_user`
--

INSERT INTO `org_user` (`id`, `org_id`, `user_id`, `role`, `created`, `updated`) VALUES
(1, 1, 1, 'Admin', '2021-01-16 20:42:54', '2021-01-16 20:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_item`
--

CREATE TABLE `playlist_item` (
  `id` bigint(20) NOT NULL,
  `playlist_id` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_setting`
--

CREATE TABLE `plugin_setting` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `plugin_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secure_json_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `plugin_version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `home_dashboard_id` bigint(20) NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `team_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quota`
--

CREATE TABLE `quota` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `target` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server_lock`
--

CREATE TABLE `server_lock` (
  `id` bigint(20) NOT NULL,
  `operation_uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint(20) NOT NULL,
  `last_execution` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `server_lock`
--

INSERT INTO `server_lock` (`id`, `operation_uid`, `version`, `last_execution`) VALUES
(1, 'cleanup expired auth tokens', 1, 1610829775),
(2, 'delete old login attempts', 2, 1610830975);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `key` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expiry` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

CREATE TABLE `star` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` bigint(20) NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `permission` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_user`
--

CREATE TABLE `temp_user` (
  `id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invited_by_user_id` bigint(20) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `email_sent_on` datetime DEFAULT NULL,
  `remote_addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_data`
--

CREATE TABLE `test_data` (
  `id` int(11) NOT NULL,
  `metric1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metric2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_big_int` bigint(20) DEFAULT NULL,
  `value_double` double DEFAULT NULL,
  `value_float` float DEFAULT NULL,
  `value_int` int(11) DEFAULT NULL,
  `time_epoch` bigint(20) NOT NULL,
  `time_date_time` datetime NOT NULL,
  `time_time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `login` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rands` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `help_flags1` bigint(20) NOT NULL DEFAULT 0,
  `last_seen_at` datetime DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `login`, `email`, `name`, `password`, `salt`, `rands`, `company`, `org_id`, `is_admin`, `email_verified`, `theme`, `created`, `updated`, `help_flags1`, `last_seen_at`, `is_disabled`) VALUES
(1, 0, 'admin', 'admin@localhost', '', 'c574f9fb1fb4911c8f260b00951585e0fca74b3cabd12d1ba365c33e05a9da6fef4b94835b90c7c7da68925fee27c3ad55f3', 'jSx0KWMZPw', 'L3HMHiSw9k', '', 1, 1, 0, '', '2021-01-16 20:42:54', '2021-01-16 20:42:54', 0, '2021-01-16 20:54:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_module` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `o_auth_access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_auth_refresh_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_auth_token_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_auth_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_auth_token`
--

CREATE TABLE `user_auth_token` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_auth_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token_seen` tinyint(1) NOT NULL,
  `seen_at` int(11) DEFAULT NULL,
  `rotated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_auth_token`
--

INSERT INTO `user_auth_token` (`id`, `user_id`, `auth_token`, `prev_auth_token`, `user_agent`, `client_ip`, `auth_token_seen`, `seen_at`, `rotated_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'f3baffe72780c01ad92b8adc0576bdace30a4bc12259fb0f166617b34fe49653', 'f0a039aa48d46fc4fb8bf2803e82f8d500ce3510e3b54d80f4c1b0dd538131e6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '172.18.0.1', 1, 1610830482, 1610830480, 1610829804, 1610829804);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_alert_org_id_id` (`org_id`,`id`),
  ADD KEY `IDX_alert_state` (`state`),
  ADD KEY `IDX_alert_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `alert_notification`
--
ALTER TABLE `alert_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_alert_notification_org_id_uid` (`org_id`,`uid`);

--
-- Indexes for table `alert_notification_state`
--
ALTER TABLE `alert_notification_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_alert_notification_state_org_id_alert_id_notifier_id` (`org_id`,`alert_id`,`notifier_id`);

--
-- Indexes for table `alert_rule_tag`
--
ALTER TABLE `alert_rule_tag`
  ADD UNIQUE KEY `UQE_alert_rule_tag_alert_id_tag_id` (`alert_id`,`tag_id`);

--
-- Indexes for table `anclarma_commentmeta`
--
ALTER TABLE `anclarma_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `anclarma_comments`
--
ALTER TABLE `anclarma_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `anclarma_links`
--
ALTER TABLE `anclarma_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `anclarma_options`
--
ALTER TABLE `anclarma_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `anclarma_postmeta`
--
ALTER TABLE `anclarma_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `anclarma_posts`
--
ALTER TABLE `anclarma_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `anclarma_termmeta`
--
ALTER TABLE `anclarma_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `anclarma_terms`
--
ALTER TABLE `anclarma_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `anclarma_term_relationships`
--
ALTER TABLE `anclarma_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `anclarma_term_taxonomy`
--
ALTER TABLE `anclarma_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `anclarma_usermeta`
--
ALTER TABLE `anclarma_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `anclarma_users`
--
ALTER TABLE `anclarma_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `annotation`
--
ALTER TABLE `annotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_annotation_org_id_alert_id` (`org_id`,`alert_id`),
  ADD KEY `IDX_annotation_org_id_type` (`org_id`,`type`),
  ADD KEY `IDX_annotation_org_id_created` (`org_id`,`created`),
  ADD KEY `IDX_annotation_org_id_updated` (`org_id`,`updated`),
  ADD KEY `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`),
  ADD KEY `IDX_annotation_org_id_epoch_end_epoch` (`org_id`,`epoch_end`,`epoch`),
  ADD KEY `IDX_annotation_alert_id` (`alert_id`);

--
-- Indexes for table `annotation_tag`
--
ALTER TABLE `annotation_tag`
  ADD UNIQUE KEY `UQE_annotation_tag_annotation_id_tag_id` (`annotation_id`,`tag_id`);

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_api_key_key` (`key`),
  ADD UNIQUE KEY `UQE_api_key_org_id_name` (`org_id`,`name`),
  ADD KEY `IDX_api_key_org_id` (`org_id`);

--
-- Indexes for table `cache_data`
--
ALTER TABLE `cache_data`
  ADD PRIMARY KEY (`cache_key`),
  ADD UNIQUE KEY `UQE_cache_data_cache_key` (`cache_key`);

--
-- Indexes for table `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_org_id_folder_id_title` (`org_id`,`folder_id`,`title`),
  ADD UNIQUE KEY `UQE_dashboard_org_id_uid` (`org_id`,`uid`),
  ADD KEY `IDX_dashboard_org_id` (`org_id`),
  ADD KEY `IDX_dashboard_gnet_id` (`gnet_id`),
  ADD KEY `IDX_dashboard_org_id_plugin_id` (`org_id`,`plugin_id`),
  ADD KEY `IDX_dashboard_title` (`title`);

--
-- Indexes for table `dashboard_acl`
--
ALTER TABLE `dashboard_acl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_acl_dashboard_id_user_id` (`dashboard_id`,`user_id`),
  ADD UNIQUE KEY `UQE_dashboard_acl_dashboard_id_team_id` (`dashboard_id`,`team_id`),
  ADD KEY `IDX_dashboard_acl_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `dashboard_provisioning`
--
ALTER TABLE `dashboard_provisioning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_dashboard_provisioning_dashboard_id` (`dashboard_id`),
  ADD KEY `IDX_dashboard_provisioning_dashboard_id_name` (`dashboard_id`,`name`);

--
-- Indexes for table `dashboard_snapshot`
--
ALTER TABLE `dashboard_snapshot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_snapshot_key` (`key`),
  ADD UNIQUE KEY `UQE_dashboard_snapshot_delete_key` (`delete_key`),
  ADD KEY `IDX_dashboard_snapshot_user_id` (`user_id`);

--
-- Indexes for table `dashboard_tag`
--
ALTER TABLE `dashboard_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_dashboard_tag_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `dashboard_version`
--
ALTER TABLE `dashboard_version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_dashboard_version_dashboard_id_version` (`dashboard_id`,`version`),
  ADD KEY `IDX_dashboard_version_dashboard_id` (`dashboard_id`);

--
-- Indexes for table `data_source`
--
ALTER TABLE `data_source`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_data_source_org_id_name` (`org_id`,`name`),
  ADD UNIQUE KEY `UQE_data_source_org_id_uid` (`org_id`,`uid`),
  ADD KEY `IDX_data_source_org_id` (`org_id`);

--
-- Indexes for table `login_attempt`
--
ALTER TABLE `login_attempt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_login_attempt_username` (`username`);

--
-- Indexes for table `migration_log`
--
ALTER TABLE `migration_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `org`
--
ALTER TABLE `org`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_org_name` (`name`);

--
-- Indexes for table `org_user`
--
ALTER TABLE `org_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_org_user_org_id_user_id` (`org_id`,`user_id`),
  ADD KEY `IDX_org_user_org_id` (`org_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist_item`
--
ALTER TABLE `playlist_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugin_setting`
--
ALTER TABLE `plugin_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_plugin_setting_org_id_plugin_id` (`org_id`,`plugin_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quota`
--
ALTER TABLE `quota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_quota_org_id_user_id_target` (`org_id`,`user_id`,`target`);

--
-- Indexes for table `server_lock`
--
ALTER TABLE `server_lock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_server_lock_operation_uid` (`operation_uid`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_star_user_id_dashboard_id` (`user_id`,`dashboard_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_tag_key_value` (`key`,`value`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_team_org_id_name` (`org_id`,`name`),
  ADD KEY `IDX_team_org_id` (`org_id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_team_member_org_id_team_id_user_id` (`org_id`,`team_id`,`user_id`),
  ADD KEY `IDX_team_member_org_id` (`org_id`),
  ADD KEY `IDX_team_member_team_id` (`team_id`);

--
-- Indexes for table `temp_user`
--
ALTER TABLE `temp_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_temp_user_email` (`email`),
  ADD KEY `IDX_temp_user_org_id` (`org_id`),
  ADD KEY `IDX_temp_user_code` (`code`),
  ADD KEY `IDX_temp_user_status` (`status`);

--
-- Indexes for table `test_data`
--
ALTER TABLE `test_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_user_login` (`login`),
  ADD UNIQUE KEY `UQE_user_email` (`email`),
  ADD KEY `IDX_user_login_email` (`login`,`email`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_user_auth_auth_module_auth_id` (`auth_module`,`auth_id`),
  ADD KEY `IDX_user_auth_user_id` (`user_id`);

--
-- Indexes for table `user_auth_token`
--
ALTER TABLE `user_auth_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQE_user_auth_token_auth_token` (`auth_token`),
  ADD UNIQUE KEY `UQE_user_auth_token_prev_auth_token` (`prev_auth_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alert_notification`
--
ALTER TABLE `alert_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alert_notification_state`
--
ALTER TABLE `alert_notification_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anclarma_commentmeta`
--
ALTER TABLE `anclarma_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anclarma_comments`
--
ALTER TABLE `anclarma_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anclarma_links`
--
ALTER TABLE `anclarma_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anclarma_options`
--
ALTER TABLE `anclarma_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `anclarma_postmeta`
--
ALTER TABLE `anclarma_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `anclarma_posts`
--
ALTER TABLE `anclarma_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `anclarma_termmeta`
--
ALTER TABLE `anclarma_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anclarma_terms`
--
ALTER TABLE `anclarma_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anclarma_term_taxonomy`
--
ALTER TABLE `anclarma_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anclarma_usermeta`
--
ALTER TABLE `anclarma_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `anclarma_users`
--
ALTER TABLE `anclarma_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `annotation`
--
ALTER TABLE `annotation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_key`
--
ALTER TABLE `api_key`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dashboard_acl`
--
ALTER TABLE `dashboard_acl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dashboard_provisioning`
--
ALTER TABLE `dashboard_provisioning`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dashboard_snapshot`
--
ALTER TABLE `dashboard_snapshot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_tag`
--
ALTER TABLE `dashboard_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_version`
--
ALTER TABLE `dashboard_version`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `data_source`
--
ALTER TABLE `data_source`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempt`
--
ALTER TABLE `login_attempt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migration_log`
--
ALTER TABLE `migration_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `org`
--
ALTER TABLE `org`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `org_user`
--
ALTER TABLE `org_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist_item`
--
ALTER TABLE `playlist_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugin_setting`
--
ALTER TABLE `plugin_setting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quota`
--
ALTER TABLE `quota`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_lock`
--
ALTER TABLE `server_lock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `star`
--
ALTER TABLE `star`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_user`
--
ALTER TABLE `temp_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_data`
--
ALTER TABLE `test_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_auth_token`
--
ALTER TABLE `user_auth_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
