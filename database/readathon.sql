-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-05-21 00:33:25
-- 服务器版本： 5.7.22
-- PHP Version: 7.2.5-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `readathon`
--

-- --------------------------------------------------------

--
-- 表的结构 `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `receive_start_date` date DEFAULT NULL,
  `receive_end_date` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `activities`
--

INSERT INTO `activities` (`id`, `name`, `body`, `start_date`, `end_date`, `receive_start_date`, `receive_end_date`, `image`, `created_at`, `updated_at`) VALUES
(1, '21天阅读习惯养成赛 赛季1', '', '2018-02-01', '2018-04-30', '2018-05-03', '2018-05-20', '/images/kv-01.png', NULL, NULL),
(2, '21天阅读习惯养成赛 第二赛季', '', '2018-04-01', '2018-05-30', '2018-06-10', '2018-06-20', 'http://readathon.dev.com/photos/1/kv-01.png', NULL, '2018-05-14 15:37:44'),
(3, '阅读习惯养成 第三季', '', '2017-07-01', '2017-08-01', '2018-08-15', '2018-09-15', 'http://readathon.dev.com/photos/1/kv-01.png', '2018-05-14 15:31:57', '2018-05-14 15:31:57');

-- --------------------------------------------------------

--
-- 表的结构 `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `words_number` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `activity_id`, `user_id`, `words_number`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 400, '问卷回答奖励', '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(2, 1, 22, 200, '问题回答正确奖励字数', '2018-05-06 16:39:49', '2018-05-06 16:39:49'),
(3, 1, 22, 200, '问题回答正确奖励字数', '2018-05-06 16:47:34', '2018-05-06 16:47:34'),
(4, 2, 25, 10, '用户点赞赠送字数', '2018-05-07 16:15:50', '2018-05-07 16:15:50'),
(5, 2, 2, 10, '用户点赞赠送字数', '2018-05-07 16:34:05', '2018-05-07 16:34:05'),
(6, 2, 4, 10, '用户点赞赠送字数', '2018-05-07 16:34:29', '2018-05-07 16:34:29'),
(7, 2, 25, 10, '用户点赞赠送字数', '2018-05-07 16:34:58', '2018-05-07 16:34:58'),
(8, 2, 3, 10, '用户点赞赠送字数', '2018-05-07 16:35:02', '2018-05-07 16:35:02'),
(9, 2, 2, 10, '用户点赞赠送字数', '2018-05-07 16:35:31', '2018-05-07 16:35:31'),
(10, 2, 2, 10, '用户点赞赠送字数', '2018-05-07 16:35:42', '2018-05-07 16:35:42'),
(11, 2, 3, 10, '用户点赞赠送字数', '2018-05-07 16:36:04', '2018-05-07 16:36:04'),
(12, 2, 6, 10, '用户点赞赠送字数', '2018-05-07 16:36:54', '2018-05-07 16:36:54'),
(13, 2, 25, 10, '用户点赞赠送字数', '2018-05-07 16:41:10', '2018-05-07 16:41:10'),
(14, 2, 4, 10, '用户点赞赠送字数', '2018-05-07 16:41:18', '2018-05-07 16:41:18'),
(15, 2, 1, 10, '用户点赞赠送字数', '2018-05-07 16:41:44', '2018-05-07 16:41:44'),
(16, 2, 2, 10, '用户点赞赠送字数', '2018-05-07 16:42:26', '2018-05-07 16:42:26'),
(17, 2, 3, 10, '用户点赞赠送字数', '2018-05-07 16:42:39', '2018-05-07 16:42:39'),
(18, 2, 4, 10, '用户点赞赠送字数', '2018-05-07 16:42:50', '2018-05-07 16:42:50'),
(19, 2, 25, 10, '用户点赞赠送字数', '2018-05-07 16:43:24', '2018-05-07 16:43:24'),
(20, 2, 1, 10, '用户点赞赠送字数', '2018-05-07 16:43:28', '2018-05-07 16:43:28'),
(21, 2, 6, 10, '用户点赞赠送字数', '2018-05-07 16:43:28', '2018-05-07 16:43:28'),
(22, 2, 2, 10, '用户点赞赠送字数', '2018-05-07 16:43:45', '2018-05-07 16:43:45'),
(23, 2, 25, 10, '用户点赞赠送字数', '2018-05-07 16:43:46', '2018-05-07 16:43:46'),
(24, 2, 3, 10, '用户点赞赠送字数', '2018-05-07 16:43:47', '2018-05-07 16:43:47'),
(25, 2, 4, 10, '用户点赞赠送字数', '2018-05-07 16:43:48', '2018-05-07 16:43:48'),
(26, 2, 1, 10, '用户点赞赠送字数', '2018-05-07 16:43:51', '2018-05-07 16:43:51'),
(27, 2, 6, 10, '用户点赞赠送字数', '2018-05-07 16:43:51', '2018-05-07 16:43:51'),
(28, 2, 1, 200, '问题回答正确奖励字数', '2018-05-07 19:23:49', '2018-05-07 19:23:49'),
(29, 2, 1, 200, '问题回答正确奖励字数', '2018-05-07 19:24:49', '2018-05-07 19:24:49'),
(30, 2, 1, 200, '问题回答正确奖励字数', '2018-05-07 19:25:30', '2018-05-07 19:25:30'),
(31, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:10:27', '2018-05-09 04:10:27'),
(32, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:14:13', '2018-05-09 04:14:13'),
(33, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:15:22', '2018-05-09 04:15:22'),
(34, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:18:34', '2018-05-09 04:18:34'),
(35, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:19:36', '2018-05-09 04:19:36'),
(36, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:24:39', '2018-05-09 04:24:39'),
(37, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:25:09', '2018-05-09 04:25:09'),
(38, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:26:39', '2018-05-09 04:26:39'),
(39, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 04:28:11', '2018-05-09 04:28:11'),
(40, 2, 3, 10, '用户点赞赠送字数', '2018-05-09 05:48:05', '2018-05-09 05:48:05'),
(41, 2, 1, 10, '用户点赞赠送字数', '2018-05-09 06:26:58', '2018-05-09 06:26:58'),
(42, 2, 2, 10, '用户点赞赠送字数', '2018-05-09 06:26:59', '2018-05-09 06:26:59'),
(43, 2, 25, 10, '用户点赞赠送字数', '2018-05-09 06:27:01', '2018-05-09 06:27:01'),
(44, 2, 4, 10, '用户点赞赠送字数', '2018-05-09 18:31:05', '2018-05-09 18:31:05'),
(45, 2, 6, 10, '用户点赞赠送字数', '2018-05-09 19:11:44', '2018-05-09 19:11:44'),
(46, 2, 1, 10, '用户点赞赠送字数', '2018-05-09 19:11:55', '2018-05-09 19:11:55'),
(47, 2, 25, 10, '用户点赞赠送字数', '2018-05-10 05:27:07', '2018-05-10 05:27:07'),
(48, 2, 2, 10, '用户点赞赠送字数', '2018-05-10 05:27:14', '2018-05-10 05:27:14'),
(49, 2, 4, 10, '用户点赞赠送字数', '2018-05-10 05:34:56', '2018-05-10 05:34:56'),
(50, 2, 3, 10, '用户点赞赠送字数', '2018-05-10 05:34:57', '2018-05-10 05:34:57'),
(51, 2, 1, 10, '用户点赞赠送字数', '2018-05-10 05:34:59', '2018-05-10 05:34:59'),
(52, 2, 6, 10, '用户点赞赠送字数', '2018-05-10 05:35:03', '2018-05-10 05:35:03'),
(53, 2, 3, 10, '用户点赞赠送字数', '2018-05-10 07:07:59', '2018-05-10 07:07:59'),
(54, 2, 1, 10, '用户点赞赠送字数', '2018-05-10 07:08:01', '2018-05-10 07:08:01'),
(55, 2, 2, 10, '用户点赞赠送字数', '2018-05-10 07:08:03', '2018-05-10 07:08:03'),
(56, 2, 1, 10, '用户点赞赠送字数', '2018-05-10 07:09:01', '2018-05-10 07:09:01'),
(57, 2, 3, 10, '用户点赞赠送字数', '2018-05-10 07:16:38', '2018-05-10 07:16:38'),
(58, 2, 2, 10, '用户点赞赠送字数', '2018-05-11 21:15:12', '2018-05-11 21:15:12'),
(59, 2, 1, 500, '被邀请用户激活奖励字数', '2018-05-14 05:02:57', '2018-05-14 05:02:57'),
(60, 2, 9, 10, '用户点赞赠送字数', '2018-05-15 15:40:34', '2018-05-15 15:40:34'),
(61, 2, 11, 10, '用户点赞赠送字数', '2018-05-15 15:41:26', '2018-05-15 15:41:26'),
(62, 2, 15, 10, '用户点赞赠送字数', '2018-05-18 03:45:03', '2018-05-18 03:45:03'),
(63, 2, 1, 10, '用户点赞赠送字数', '2018-05-18 03:45:07', '2018-05-18 03:45:07'),
(64, 2, 11, 10, '用户点赞赠送字数', '2018-05-18 04:20:40', '2018-05-18 04:20:40'),
(65, 2, 11, -10, '用户取消点赞', '2018-05-18 04:21:35', '2018-05-18 04:21:35'),
(66, 2, 11, 10, '用户点赞赠送字数', '2018-05-18 04:21:42', '2018-05-18 04:21:42'),
(67, 2, 11, -10, '用户取消点赞', '2018-05-18 04:21:43', '2018-05-18 04:21:43'),
(68, 2, 1, -10, '用户取消点赞', '2018-05-18 04:22:00', '2018-05-18 04:22:00'),
(69, 2, 1, 10, '用户点赞赠送字数', '2018-05-18 04:22:44', '2018-05-18 04:22:44');

-- --------------------------------------------------------

--
-- 表的结构 `activity_users`
--

CREATE TABLE `activity_users` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `age_group_id` int(10) UNSIGNED DEFAULT NULL,
  `reading_number` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `words_number` int(10) UNSIGNED DEFAULT '0',
  `voted_number` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `receive_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `activity_users`
--

INSERT INTO `activity_users` (`activity_id`, `user_id`, `city_id`, `age_group_id`, `reading_number`, `words_number`, `voted_number`, `receive_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 5013, 858, 79, 0, NULL, '2018-05-04 10:08:23'),
(1, 2, 1, 2, 5600, 364, 40, 0, NULL, '2018-05-04 09:54:31'),
(1, 3, 1, 2, 2963, 9247, 63, 0, NULL, '2018-05-04 09:54:27'),
(1, 4, 1, 3, 8014, 5144, 95, 0, NULL, '2018-05-04 10:02:32'),
(1, 5, 1, 2, 1179, 7979, 85, 0, NULL, '2018-05-04 09:54:30'),
(1, 6, 1, 2, 1855, 4462, 38, 0, NULL, '2018-05-04 10:02:31'),
(1, 7, 1, 3, 5737, 8371, 39, 0, NULL, NULL),
(1, 8, 1, 2, 3121, 8472, 78, 0, NULL, '2018-05-04 09:54:24'),
(1, 9, 1, 1, 8393, 7245, 73, 0, NULL, '2018-05-04 10:02:24'),
(1, 10, 1, 2, 2602, 810, 31, 0, NULL, '2018-05-04 10:02:23'),
(1, 20, 1, 1, 7830, 2316, 35, 0, '2018-05-05 08:27:40', '2018-05-05 08:27:40'),
(1, 22, 1, 1, 1343, 9147, 83, 0, '2018-05-05 08:38:35', '2018-05-06 16:47:34'),
(1, 23, 1, 1, 3226, 8790, 10, 0, '2018-05-07 01:45:09', '2018-05-07 01:45:09'),
(1, 25, 1, 1, 2103, 6507, 3, 0, '2018-05-07 01:45:22', '2018-05-07 01:45:22'),
(2, 1, 1, 2, 5013, 858, 79, 0, NULL, '2018-05-04 10:08:23'),
(2, 2, 1, 1, 7871, 1301, 3, 0, '2018-05-07 16:32:34', '2018-05-11 21:15:12'),
(2, 3, 1, 1, 6845, 8011, 69, 0, '2018-05-07 16:33:07', '2018-05-10 07:16:38'),
(2, 4, 1, 1, 614, 6153, 37, 0, '2018-05-07 16:33:47', '2018-05-10 05:34:56'),
(2, 5, 1, 1, 2535, 6731, 75, 0, '2018-05-07 16:36:48', '2018-05-10 05:35:03'),
(2, 6, 1, 1, 834, 5198, 65, 0, '2018-05-07 16:36:48', '2018-05-10 05:35:03'),
(2, 7, 1, 2, 6564, 5795, 0, 0, NULL, '2018-05-04 09:54:31'),
(2, 8, 1, 1, 320, 3383, 7, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 9, 1, 1, 1905, 9550, 37, 0, '2018-05-07 15:57:01', '2018-05-18 04:24:58'),
(2, 10, 1, 1, 8566, 7501, 51, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 11, 1, 1, 7115, 8935, 54, 0, '2018-05-07 15:57:01', '2018-05-18 04:24:59'),
(2, 12, 1, 1, 9876, 2071, 5, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 13, 1, 1, 8038, 3612, 70, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 14, 1, 1, 559, 1845, 33, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 15, 1, 1, 8682, 8400, 59, 0, '2018-05-07 15:57:01', '2018-05-18 03:45:03'),
(2, 16, 1, 1, 1733, 6416, 92, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 17, 1, 1, 2621, 6911, 84, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 18, 1, 1, 7905, 5305, 45, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 19, 1, 1, 1661, 5793, 72, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 20, 1, 1, 4591, 3049, 25, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 21, 1, 1, 7970, 7866, 10, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 22, 1, 1, 6076, 184, 75, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 23, 1, 1, 6472, 7320, 44, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 24, 1, 1, 4131, 6047, 95, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 25, 1, 1, 1239, 8278, 42, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 26, 1, 1, 3804, 3248, 26, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07');

-- --------------------------------------------------------

--
-- 表的结构 `administrators`
--

CREATE TABLE `administrators` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `administrators`
--

INSERT INTO `administrators` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$Evis.hwrIpnJQUWqpEIANeLBCKettPwgt5GiE6YaOhkNbqxJHAFF2', 'oMI2cswP1HbMhpyC6XwKvVW7WtRzuUGrEbVyfmDZnZkKyIZm5eEx1dRGSzF9', '2018-04-22 09:42:48', '2018-04-22 09:42:48');

-- --------------------------------------------------------

--
-- 表的结构 `age_groups`
--

CREATE TABLE `age_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_age` int(11) NOT NULL,
  `max_age` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `age_groups`
--

INSERT INTO `age_groups` (`id`, `title`, `min_age`, `max_age`, `sort_id`, `created_at`, `updated_at`) VALUES
(1, '<5岁', 0, 4, 1, '2018-04-22 14:53:54', '2018-04-22 14:54:53'),
(2, '5-7岁', 5, 7, 2, '2018-04-22 14:55:20', '2018-04-22 14:55:20'),
(3, '8-10岁', 8, 10, 3, '2018-04-22 14:55:32', '2018-04-22 14:55:32'),
(4, '11-14岁', 11, 14, 4, '2018-04-22 14:55:45', '2018-04-22 14:55:45'),
(5, '>14岁', 15, 999, 5, '2018-04-22 14:55:45', '2018-04-22 14:55:45');

-- --------------------------------------------------------

--
-- 表的结构 `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `cities`
--

INSERT INTO `cities` (`id`, `name`, `sort_id`, `created_at`, `updated_at`) VALUES
(1, '上海', 1, '2018-04-22 14:08:19', '2018-04-22 14:08:19'),
(2, '北京', 2, '2018-05-14 04:02:41', '2018-05-14 04:02:41'),
(3, '宁波', 3, '2018-05-14 04:02:48', '2018-05-14 04:02:48');

-- --------------------------------------------------------

--
-- 表的结构 `favourites`
--

CREATE TABLE `favourites` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2018_04_22_000001_create_cities_table', 1),
(3, '2018_04_22_000003_create_users_table', 1),
(4, '2018_04_22_112717_create_administrators_table', 1),
(5, '2018_04_22_144028_create_permission_tables', 1),
(6, '2018_04_22_155020_create_pages_table', 1),
(7, '2018_04_22_160156_create_activities_table', 1),
(8, '2018_04_22_162042_create_prizes_table', 1),
(9, '2018_04_22_163742_create_questions_table', 1),
(10, '2018_05_05_090017_create_sessions_table', 2),
(11, '2018_05_08_175320_create_posts_table', 3);

-- --------------------------------------------------------

--
-- 表的结构 `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Administrator', 1),
(2, 'App\\Administrator', 1),
(3, 'App\\Administrator', 1),
(4, 'App\\Administrator', 1),
(5, 'App\\Administrator', 1),
(6, 'App\\Administrator', 1),
(7, 'App\\Administrator', 1),
(8, 'App\\Administrator', 1);

-- --------------------------------------------------------

--
-- 表的结构 `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Administrator', 1);

-- --------------------------------------------------------

--
-- 表的结构 `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `pages`
--

INSERT INTO `pages` (`id`, `name`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 'home', '首页', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00'),
(2, 'activity', '比赛动态', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00'),
(3, 'register', '用户注册', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00'),
(4, 'about', '关于阅读马拉松', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, '页面管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(2, '权限管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(3, '活动管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(4, '奖品管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(5, '问答管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(6, '城市管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(7, '年龄组管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(8, '用户管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48');

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `sort_id` int(10) UNSIGNED NOT NULL DEFAULT '999',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`id`, `title`, `block_type`, `body`, `page_id`, `sort_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, '幻灯片', 'slides', '', NULL, 999, '/images/kv-01.png', '', '2018-05-08 16:00:00', '2018-05-20 14:43:26'),
(2, '幻灯片2', 'slides', '', 1, 999, '/images/kv-01.png', 'http://readathon.dev.com/admin/page/1/post/2/edit', '2018-05-08 16:00:00', '2018-05-20 16:17:18'),
(3, '幻灯片3', 'slides', '', 1, 999, '/images/kv-01.png', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(4, 'The Square Enix E3 Showcase 2018', 'article', 'オプションアイテムのラインナップに新たなアイテムが追加されます！\r\n<img src=\"https://pbs.twimg.com/media/DcpzFQwUQAEHGFm.jpg\" />\r\nSave the Date!\r\nThe Square Enix E3 Showcase 2018 – Monday June 11 at 10 AM PDT/1PM EDT/6pm BST\r\nJoin us for a special video presentation to discover the exciting future of Square Enix!', 2, 999, '', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(5, 'FREE download ', 'article', 'New eBook: Understanding big data technologies & architectures for successful data-intensive apps | FREE download ↓\r\n<img src=\"https://pbs.twimg.com/ad_img/988492426263252992/DseiJiY9?format=jpg&name=orig\" />', 2, 999, '', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(6, 'Life is Strange', 'article', 'The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates \r\n<img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />', 2, 999, '', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(7, '幻灯片1', 'slides', '', 2, 999, '/images/kv-01.png', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(8, '幻灯片1', 'slides', '', 2, 999, '/images/kv-01.png', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(9, '阅读马拉松隐私政策', 'article', 'The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />', 3, 999, '', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(10, '关于阅读马拉松', 'article', 'The final commissioned artwork by @Afterlaughs is here! Find out more about our collaboration via our blog: https://sqex.link/FarewellPirates  <img src= \"https://pbs.twimg.com/media/DcruOVTX0AAtaVA.jpg\" />', 4, 999, '', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(11, '阅读马拉松', 'slides', '', 2, 1, '/photos/1/kv-01.png', '', '2018-05-20 16:25:02', '2018-05-20 16:25:02');

-- --------------------------------------------------------

--
-- 表的结构 `prizes`
--

CREATE TABLE `prizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winning_min_rank` int(10) UNSIGNED NOT NULL,
  `winning_max_rank` int(10) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `prizes`
--

INSERT INTO `prizes` (`id`, `name`, `winning_min_rank`, `winning_max_rank`, `body`, `activity_id`, `created_at`, `updated_at`) VALUES
(1, '超大奖', 1, 5, '連休明けの午後は、スターバックス® スパークリングのほどよい炭酸で爽やかに。久しぶりのお仕事に向けて、スマートに気分転換しませんか。 ', 1, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(2, 'Macbook', 1, 10, 'これは談合坂SA上り線店でのお話。「地元の人が楽しく集まれる場所にしたい」。その想いに共感した近隣のお店と合同でキッズパーティを開いたバリスタ。旅の途中で立ち寄ったお客様にも見守っていただき…。', 1, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(3, 'ipad', 1, 20, 'This white paper from Dr Charles A. Bell describes how to use #MySQL Enterprise Backup for backup and recovery with each of the three HA features: asynchronous replication, group replication, and #InnoDB Cluster. http://ora.cl/ep0k8 ', 1, '2018-05-01 16:00:00', '2018-05-01 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `prize_logs`
--

CREATE TABLE `prize_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `prize_id` int(10) UNSIGNED NOT NULL,
  `rank` int(10) UNSIGNED NOT NULL,
  `has_checked` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `prize_logs`
--

INSERT INTO `prize_logs` (`id`, `activity_id`, `user_id`, `prize_id`, `rank`, `has_checked`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 3, 0, '2018-05-07 19:05:15', '2018-05-07 19:05:15');

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rewarded_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `questions`
--

INSERT INTO `questions` (`id`, `title`, `activity_id`, `start_date`, `end_date`, `rewarded_number`, `created_at`, `updated_at`) VALUES
(1, 'Why didn’t the spider answer the animals when they asked questions? ', 2, '2018-05-01', '2018-05-30', 200, '2018-05-04 16:00:00', '2018-05-04 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT '0',
  `sort_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `question_answers`
--

INSERT INTO `question_answers` (`id`, `title`, `question_id`, `is_right`, `sort_id`, `created_at`, `updated_at`) VALUES
(1, ' She was rude ', 1, 0, 1, '2018-05-04 16:00:00', '2018-05-04 16:00:00'),
(2, 'She was spinning her web ', 1, 1, 1, '2018-05-04 16:00:00', '2018-05-04 16:00:00'),
(3, 'She didn’t like other animals ', 1, 0, 1, '2018-05-04 16:00:00', '2018-05-04 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `question_logs`
--

CREATE TABLE `question_logs` (
  `question_id` int(10) UNSIGNED NOT NULL,
  `answered_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `question_logs`
--

INSERT INTO `question_logs` (`question_id`, `answered_id`, `user_id`, `is_right`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2018-05-18 07:51:48', '2018-05-18 07:51:48');

-- --------------------------------------------------------

--
-- 表的结构 `reading_logs`
--

CREATE TABLE `reading_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `words_number` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `reading_logs`
--

INSERT INTO `reading_logs` (`id`, `book_name`, `activity_id`, `user_id`, `words_number`, `created_at`, `updated_at`) VALUES
(1, 'Harry Potter I', 1, 1, 30000, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(2, 'Harry Potter II', 1, 1, 43200, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(3, 'Harry Potter III', 1, 1, 43200, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(4, 'Harry Potter IV', 1, 1, 43200, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(5, 'Harry Potter V', 1, 1, 43200, '2018-05-01 16:00:00', '2018-05-01 16:00:00'),
(6, 'Book name', 1, 1, 30023, '2018-05-03 23:00:45', '2018-05-03 23:00:45'),
(7, 'American Gods', 1, 1, 324, '2018-05-03 23:02:17', '2018-05-03 23:02:17'),
(8, 'Harry', 1, 1, 3002, '2018-05-03 23:05:36', '2018-05-03 23:05:36'),
(9, 'Bootstrap', 1, 1, 3200, '2018-05-03 23:06:40', '2018-05-03 23:06:40'),
(10, 'goods', 1, 1, 23, '2018-05-03 23:07:31', '2018-05-03 23:07:31'),
(11, 'book name', 1, 1, 3200, '2018-05-03 23:08:09', '2018-05-03 23:08:09'),
(12, 'Campaign', 1, 1, 3200, '2018-05-03 23:09:13', '2018-05-03 23:09:13'),
(13, 'test book', 1, 1, 3200, '2018-05-03 23:15:22', '2018-05-03 23:15:22'),
(14, 'book name', 1, 1, 3200, '2018-05-03 23:15:41', '2018-05-03 23:15:41'),
(15, 'good', 1, 1, 3200, '2018-05-03 23:19:00', '2018-05-03 23:19:00'),
(16, 'testing...', 1, 1, 3200, '2018-05-03 23:21:10', '2018-05-03 23:21:10'),
(17, 'good2', 1, 1, 200, '2018-05-03 23:21:36', '2018-05-03 23:21:36'),
(18, 'sss', 1, 1, 23, '2018-05-03 23:22:12', '2018-05-03 23:22:12'),
(19, 'it', 1, 1, 23, '2018-05-03 23:25:32', '2018-05-03 23:25:32'),
(20, 'it', 1, 1, 23, '2018-05-03 23:25:55', '2018-05-03 23:25:55'),
(21, 'it', 1, 1, 23, '2018-05-03 23:31:47', '2018-05-03 23:31:47'),
(22, 'it', 1, 1, 23, '2018-05-03 23:32:02', '2018-05-03 23:32:02'),
(23, 'goods', 1, 1, 23, '2018-05-03 23:45:40', '2018-05-03 23:45:40'),
(24, 'yes~', 1, 1, 3200, '2018-05-03 23:46:27', '2018-05-03 23:46:27'),
(25, 'yes', 1, 1, 23, '2018-05-04 00:21:47', '2018-05-04 00:21:47'),
(26, 'yes', 1, 1, 2, '2018-05-04 00:21:57', '2018-05-04 00:21:57'),
(27, '7777', 1, 1, 22, '2018-05-04 01:10:31', '2018-05-04 01:10:31'),
(28, 'goods', 1, 1, 322, '2018-05-04 10:08:23', '2018-05-04 10:08:23'),
(32, 'Ame', 2, 25, 2, '2018-05-07 15:57:01', '2018-05-07 15:57:01'),
(33, 'vue-router', 2, 25, 300, '2018-05-07 15:57:41', '2018-05-07 15:57:41'),
(34, 'Vue.js', 2, 25, 300, '2018-05-07 16:15:45', '2018-05-07 16:15:45'),
(35, 'react', 2, 1, 300, '2018-05-07 16:28:49', '2018-05-07 16:28:49'),
(36, '爬坑', 2, 2, 723, '2018-05-07 16:32:34', '2018-05-07 16:32:34'),
(37, '动态路由匹配', 2, 3, 592, '2018-05-07 16:33:07', '2018-05-07 16:33:07'),
(38, 'laravel', 2, 4, 320, '2018-05-07 16:33:47', '2018-05-07 16:33:47'),
(39, 'Think PHP', 2, 6, 20, '2018-05-07 16:36:48', '2018-05-07 16:36:48'),
(40, 'offcloud', 2, 1, 200, '2018-05-13 15:01:43', '2018-05-13 15:01:43'),
(42, 'goos', 2, 1, 3, '2018-05-17 07:47:03', '2018-05-17 07:47:03');

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, '管理员', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
(2, '超级管理员', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48');

-- --------------------------------------------------------

--
-- 表的结构 `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2H65eEAkiV9HgckJlM2OMW0aXOfZyamMZRhh98VA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTl5UXA4Rlk0bVE0T2JVRGl4TjZDYng2NG4yOXBmVVNTRUc1Q0ZINCI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aToxO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511544),
('4kNmNOQivvJtWYWd4BwNzimQGSCn8nXrX0PsfeZ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS3p5SWNseE11UFh2elFlS3VKMHBpOUZYMVVZcWZrdzlBdWw1c3JuZyI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aTowO319czoxMjoicmVkaXJlY3RfdXJsIjtzOjgwOiJodHRwOi8vcmVhZGF0aG9uLmRldi5jb20vcGFnZT9zZXNzaW9uaWQ9ZkZIbkZSV3VRclVOZERRYWl1b3F4SGxIb3EyOEU3ckU4WE9OVmJUcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly9yZWFkYXRob24uZGV2LmNvbS9wYWdlP3Nlc3Npb25pZD1mRkhuRlJXdVFyVU5kRFFhaXVvcXhIbEhvcTI4RTdyRThYT05WYlRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511665),
('Hdxp0lDFmk9wvUKhJGu7zNi3QC2w3w5fxbGrJXkC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVZuU21nakxweXVJdkxxbnRRTEhJSWthamIwbTZ3WkZvMGExUmRGbiI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aToxO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511580),
('LtyeE3DzvIwROqoDNFiFNwV8fRlkQuu7hAoEjSD6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHI0V2hsajNoTG5FOXE0SG1zVnc2TzF3MUIyNjZxY2JLYk8xQVdBciI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aToxO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511580),
('NrZ8RnvnM5pmhU1emrLt9X9uJawj9tNgacPBKQef', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialdkbVowTU5kblhLb0RwaWdKYUxZWEplSDVGQjlwWGI4NUlrd2sxYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly9yZWFkYXRob24uZGV2LmNvbS9hcGkvdXNlcj9fdG9rZW49S3p5SWNseE11UFh2elFlS3VKMHBpOUZYMVVZcWZrdzlBdWw1c3JuZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1525512166),
('nzc1eeDVMoPhhKPDXFSP4H2pXGU2RcZ0N8vN3IK5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWktROXNCODdYMUN1SldUMVdvTU1iUkxSV2xkMHFRaVNCMEU3Z3VmbCI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aToxO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511543),
('sGsaqdtiDrQEE8H5lAL31rNca6NQ2lzzmBJiHOMT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEt0R1RIT3ZhSGhlUDUxYlpIS2gwbDJsbFdyeklqeDFlYjBnWnZRdCI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aToxO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511545),
('xehNzR54HtkSftm9GDQNqwcHnPR8ytq7vk6cSxXb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3N2ZUNBUlNVaFpqRm9WaFVKcDJYcklya1R1YTRDb3VTMDFZTlMwdSI7czoyOiJ3eCI7YToxOntzOjQ6InVzZXIiO2E6MjA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NDoi5bCPQSI7czo2OiJvcGVuaWQiO3M6Mjg6Im9KXzBKd2tWYThtSEJTUTFDRGVDVGtWcW5jd0UiO3M6NjoiYXZhdGFyIjtzOjEyNDoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9WYTJDZ1piUGFLSGVaTHFrNVZPeUFzY3ZTUTVDR1dpY05UUTVpY3dpY2I1M3YxTGs1TExmaWJrMTY4MnBHdDMwVkpUd2w2anN1VndEcUJkdEdkUjFhcmM4eHcvMCI7czo4OiJuaWNrbmFtZSI7czo0OiLlsI9BIjtzOjM6ImFnZSI7aTo4O3M6OToiYmlydGhkYXRlIjtzOjEwOiIyMDEwLTAxLTAxIjtzOjEyOiJpc19hY3RpdmF0ZWQiO2k6MTtzOjEwOiJpc19yZWFkaW5nIjtpOjE7czoxMjoiYWdlX2dyb3VwX2lkIjtpOjI7czo0OiJyYW5rIjtpOjM7czo3OiJjaXR5X2lkIjtpOjE7czoyOiJnZSI7TjtzOjM6InRlbCI7czoxMToiMTU2MTg4OTI2MzIiO3M6OToiY2l0eV9uYW1lIjtzOjY6IuS4iua1tyI7czoxMjoid29yZHNfbnVtYmVyIjtpOjM1Njk7czoxOToiZm9ybWF0X3dvcmRzX251bWJlciI7czo1OiIzLDU2OSI7czoxNDoicmVhZGluZ19udW1iZXIiO2k6NTtzOjEyOiJ2b3RlZF9udW1iZXIiO2k6MztzOjk6Imhhc192b3RlZCI7aToxO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1525511542);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `openid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `tel` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_reading` tinyint(1) NOT NULL DEFAULT '0',
  `sex` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ge` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invite_id` int(10) UNSIGNED DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `birthdate`, `openid`, `nickname`, `avatar`, `city_id`, `tel`, `is_reading`, `sex`, `ge`, `invite_id`, `is_activated`, `created_at`, `updated_at`) VALUES
(1, '小A', '2010-01-01', 'oJ_0JwkVa8mHBSQ1CDeCTkVqncwE', '小A', 'http://readathon.dev.com/storage/avatars/1.jpg', 1, '15618892632', 1, '1', '2.6', NULL, 1, '2018-04-22 15:20:22', '2018-05-18 03:33:38'),
(2, NULL, NULL, 'oHfDAwRL_X6nVuFYTlxi2LDz-Nm0', 'AA', 'http://wx.qlogo.cn/mmopen/vi_32/libqCibQpwWXxz29xpicgs3Oibm1qyiaEPJrUpe1tFRnbyFBD3c4VJDibia0SnNpPY7nVH8OrPBs8ltib3cq0xibsicxln8w/0', 1, '', 0, '0', NULL, NULL, 0, NULL, NULL),
(3, '大A', NULL, 'oHfDAwRI9lv_vsW_xeZSBa_PKM7A', '大A', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKG0SkhqIsVeXk457v96DZSHpmIzRYtQLU7rrXEb4FfiauOqALvHeFpUgEYl4vLIAic9c31vbnQA5nA/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(4, 'costa', NULL, 'oHfDAwdQoFvNFt4KISTds-sLTeJ8', 'costa', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX7ibUnibz0W72QW6zO5zmFwIv6VA3kkqe2ibYXpzRDGI0S5pSngY94CbiauHAE8y62jutQv7o2wsnFf6/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(5, NULL, '2011-01-01', 'oHfDAwRT2E95o-w2XfSFgIqa1fzU', '喜喜Xu', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI548pJiclHXYGtMdHEvg457DJhQzeGmyMQiaUGicyfIYhnSmzOd4fU0RePiajCcQG8SIpw7XFK22FyyZ03/0', NULL, NULL, 0, '2', NULL, NULL, 0, NULL, '2018-05-13 06:29:48'),
(6, '范范（carol)', NULL, 'oHfDAwXz1SC2-5pTj5MkoT7B6R0c', '范范（carol)', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI543v2TtPSsZZ0gUnd7UevD8ZQdp0ia6f4kghWNJgvuiaavPlvIxRutlDicSpHI77jBTt6nicrsZxibmGTib/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(7, '枫桥', NULL, 'oHfDAwTFYhV7wCaYGgjfdqoQ3M7U', '枫桥', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXibPYj1wsnj85foZgibt4HAF2E8P7MwYVM13C2bibxJVmDlIgl3n1wSV1zj8enbbkO2dRNbLHzXGFRS/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(8, '袁老实', NULL, 'oHfDAwaWmxraqT90F0AAdZgkVd8M', '袁老实', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI540A7HQQwa063Ze6Kiass3ra2oNIpsMqHStIvOYltfoGvQcY3m0okHiarJtQQfapbZVniaKrl4Gaqf6T/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(9, '大莹🎏', NULL, 'oHfDAwQkTAdQ_LN0Fm7qsFz6y3NQ', '大莹🎏', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDTmwQFbb8r5gYulMicYenG3W50ibWx9CxRrUJM70O0gicjXNU69nKJMGSyeaqjRBM27Fabibu4cwJiaZA/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(10, 'Abel曹国献', NULL, 'oHfDAwdOKha4HjSOZD9DaZAFvMn0', 'Abel曹国献', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX7Shg7F0VKURwh5Zhz0XtxlvVhxGROIGd2SUibIvW6gRy4z6iaUn4O3IRwgNxdyCr5icnFibWX1hQpRh/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(11, 'Yang', NULL, 'oHfDAweAabBjxZPyBwiAndJsr3Cg', 'Yang', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkbQcTc6N3ibA3LkqGpdtUPgfzFuYhTlw8Xr4iaCv0CwLpGkF8Ntn7QWtl1HwmjmBCMw7SQL8o1b49W/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(12, '王翔', NULL, 'oHfDAwbl6_Ecupfv3qL_Hyn3-U6M', '王翔', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXibLTJUu0aRveCVDF2JoO2BNeRa93OrN3CXX2oqjopGynPBTaO8BKbdapZUQKe7P5oViatPvR2MO5p/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(13, '周春健', NULL, 'oHfDAwanzxZuWwtbEbxdYrO9QWVU', '周春健', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M195ZPxV4MMMFpbnHWyaNu9KC7Jxqic0CLXA1KulQYEib1TC56ZYaM1oFKiaTSZyIUoBh9qZRRRicop8g/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(14, '海涛', NULL, 'oHfDAwcbIJzK1VNFBxDO0e_zGdP0', '海涛', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4usricOMBfC2eXVBFvibvHSTuNsfeDzUeNOTh30WhQCq5IfYEyqsMcQFcdphalx095EgEW6b7G96ufr/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(15, 'Sky', NULL, 'oHfDAwXZHkV3cz_-wa_ld57zq6VA', 'Sky', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBEtZ1qAXt3XQicYFCOPL5ykZF4Khzv0Ae19kBicCIHMhfb59L9ELicvf3ibE5XhXQWibRWyhB6F4N7wcw/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(16, 'Jessica aus 南徐大道', NULL, 'oHfDAwb79gz7J2vKx3CRbzIX4CRQ', 'Jessica aus 南徐大道', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfZ9gDib8PQCjmWH6viaNKjWG9OYdmMOwAOasRGd2DpMWFUHMpmHZTaia7mlGvUEUzsia0EODVdgYVPic3/0', 1, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(17, '小林子', NULL, 'oHfDAwW_b6kCQm_vZQ0iLljrd-p8', '小林子', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX2aLSZ4l1MvtE5MA2kRuVcuXyyb7AbtX1GrkCKluE00vTK81HC8ZEdK6Ik84cXjBbbrAzaE1UuMM/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(18, 'Gloria', NULL, 'oHfDAwZDYvsDauT-KANQrEhdbnS8', 'Gloria', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKlrwqEnTYSM0IezZDkrQsabkmg1ialmhV0EI8LICV4G0p4nj8dR7v986mEhIH2lrm3icQQFYqJLqzA/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(19, 'ahaqian', NULL, 'oHfDAwVaLGAyHH3_l-rqc15qt7IQ', 'ahaqian', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI543XXB5KchBrmrr9eZp9prnibUYXlNBcuAFEGic9a6yD5TqDPGIMlDcvKIn7tk445JmEZqA7G691rPt/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(20, '朱平礼^ω^', NULL, 'oHfDAwYSE9DhK5y4huPgWjYROVoM', '朱平礼^ω^', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkV5y7yPhKP7QNVoBzBKjNva4hfVSSsOLeMrVIfEhKVwEAulpanacRyvXrY6PExtXcFQxhiaOd1fNh/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(21, 'Huaxiaren', NULL, 'oHfDAwVBxpXJhf9aU7aWNEAMPRQQ', 'Huaxiaren', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXy96kfiaRXq3dYiaWXYJ0QiaLvJOlKFXtLzoNwzx4WIvcZ5QoiaW0nPzwu9LJqdibBCex2n0AIjRG3icBW/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(22, '甘伟彪', '2017-12-05', 'oHfDAwXb7ddWgUC2zpGcgDBVp7hc', '甘伟彪', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX0t7oLnOXn99OtcSQe5XvkLhLxVwjLYYOC51tRTTtDkC2DUz2VwbeysuuQMb21GEJIUL7lLiclPb1/0', 1, '15618892632', 1, '1', NULL, NULL, 1, NULL, '2018-05-06 15:44:51'),
(23, 'sharon', NULL, 'oHfDAwZVoqe4Y9UV5KlD3Ba5k5Pk', 'sharon', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4uqHIb06s9rj1mm99o8IPUKrSDgfKXSeJFlhm142nGGAicmu1SV3Ku7S4wLr7Wd2uPB5mVr5RPuqld/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(24, '婧婧陀啦！p', NULL, 'oHfDAwda4A3oQDdNRNF4Qzj2JKdw', '婧婧陀啦！p', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKCu8148iaZv1RhfibjlXcf2rF3icex9ibgibxadL7N7EicNQKeOFnUJiaicjyt4va9Ax8Ne0N0FtM3HGNiabA/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(25, '黄啸', NULL, 'oHfDAwWMXJ6bEIQjp5S2QBIy0VEI', '黄啸', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkeiaeANj4rRibhT4u9aibYBcyV1dx768CfFSee1Ngy5qTAtRLdICiaQceSBm6fFf5jy5WiaZebpHmG0UA/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(26, 'Michael', NULL, 'oHfDAwcj0A1kd5UWdYpDNC3NBcRM', 'Michael', '/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(27, 'Kevin', NULL, 'oHfDAwYu2EBvdFq6JdvlMf5IhZyg', 'Kevin', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4ukicVD9hiaQSxWz6jtsaNggtRo0u0lNbbG7lQIexSWGh7YziaZKs7bPPTic4TcAGKjJvYwLn8wxlsbcl/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(28, '超级马超', NULL, 'oHfDAwf5mgmXgms12tim8xWL7fJE', '超级马超', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6l6JxdECL9sN3v93KSS0H1f8UmOpqsR7cl2lLSJmV5n16fSbgXE9QaHUibfogHg3IIAhYxL5Orgt7BDMw2XeNicZa/0', 1, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(29, '娜', NULL, 'oHfDAwTzboUuKdnWsQzRFSiIlzfQ', '娜', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M15NsDiavrS6tZIqic4b23lmppEUzHxeLK1AW8WCpgENaGFKvkaE1SOxOiaerCmSodt59zADp06A2ZhQ/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(30, '奈么僵忒勒', NULL, 'oHfDAwaLZiPTVZXYUx66Jxp1aFPs', '奈么僵忒勒', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkZIhf3yxicGtvBQ4FmRibbCHX0zFlpoqnUrvo3186LXgPYSxLC129WlicWjtTtAvOwibsjLtClfvB1Tj/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(31, '我的', NULL, 'oHfDAwV8Jxt8zR3C2WNmvZ8zbGsQ', '我的', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL4tq41xh3awiacosEibGeJjgVY9DPFVm2WVQd6qc8Kj2ibicG2ZRf5rS5CccgEvthoEAopIjj9UEo0Qw/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(32, '姚丽丹_Daniela', NULL, 'oHfDAwbrHhVLqvz-gVk5RDAwDc_Y', '姚丽丹_Daniela', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4uvrrLscxZcOOichyU1Y93PU0LRKSKJEItY0MbtRGzeXhz4nIYKbgiar9xibpcXyw0eA5Oq5MibzJQGvU/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(33, '墨轩', NULL, 'oHfDAwd4i_3TO5kn2Mv7VTQAsLBE', '墨轩', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK1lYmibqzEjexRzdqPhc01k2RPMuW1CzOMZf6Ajv0taF2LElc2Z2VSonFpkHQtyA8MjQguPpkZgxQ/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(34, '家穷人丑', NULL, 'oHfDAwVB5iyWuL-A1aqUYJzRZr3c', '家穷人丑', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkYJOce1HSGJlVJbLBq5b7S5tHFCHW6FQRDH9Vw40yaKatGgiaGFvC9icRpsn1WCF3YZ86wly2KWy0m/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(35, '唐珺', NULL, 'oHfDAwQay-plJ9F4g_cna6r6sPXE', '唐珺', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6nPg2GrOr8MTwFOurrAngfqJcwHjddI2mmoWQykt6wibMBEND0efpKZWPWwCNxAc8S3oib5E1NANkHhHOX4VO9eB6/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(36, 'Sunnie', NULL, 'oHfDAwTOUXha358dSOa5xuUoNzYY', 'Sunnie', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN57KVIjt1kgCYvCTZmeicpGFY0r03jrrIx8U0icZZU7CiavmN4DcD445ZxzVRsJBLYVzicWlvwpEs5HwlKLh0libzenyj/0', 1, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(37, '涵孝', NULL, 'oHfDAwa1yTLHNBVXw5AErNPly-xU', '涵孝', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN56O1HgzNVlT24tXYJorLulWicg2NJ9rJhQu3nyOaCXTsaTesr9qJhVRsribHf1zbvib7JFBaibC8zdYlQ/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(38, '魔', NULL, 'oHfDAwbL3vCaLM1JKo61NmeGnOGs', '魔', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJepryUKH8QoKPBuwchzSMyFRp8AUJ0sibLhfbtjjjPk4icRAYECARUcojo8b7X7UGibPHDI9hf6dZ8g/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(39, '王之琦', NULL, 'oHfDAwQNpWN2rWKXAuGZ6bymcNa0', '王之琦', '/0', 1, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(40, '风', NULL, 'oHfDAwaNRePd7jpkTkOTxEf-Jh1c', '风', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkRHrVSwhIicy7pia2Euz85icMUCwaTXDgs2KicIsOGUgDQ8Uf7NmdBXgUj7diaepDNP5LGuja6pyDzQeF/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(41, '灵验', NULL, 'oHfDAwdDpLvxMx8SrI8GNkhZzdsA', '灵验', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI540g2j6MceAoUmQiaKaJV6wq5WtDb6aCsbHDgSrbOTlvnDKfj91xibRjIiaMxYdOibm7icTticA73dqYr5T/0', 1, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(42, '黑猫警长', NULL, 'oHfDAwcxG_n8BX9_Z1qo-kjz5tMU', '黑猫警长', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bx3oDf8EeVEzI61cjRrQIicYbt1UUL5ZFic920Epz4iaJLp2AuspOKvh5MnFhmdgYOjwyLnEcWpLHnXg/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(43, 'Vicky', NULL, 'oHfDAwRSathLAnCHWWrSZW76JpJ0', 'Vicky', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX8RpHhmP7ibjkQgX5YIdgZWlePYhdct6ribvra3KxuJfzzia7icqBZWmg2bL5IefYQZric72vWdysRcGj/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(44, '丁鹏飞', NULL, 'oHfDAwY3nNH-ABWg3JprS2U7qjiI', '丁鹏飞', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB0rmpgz4zKQZ9WCNiaiaarTcA4sAWrib37IUwibzhMDwn6qdOnicejp8XhLMPnA9nrM1IGEyJWXia3OAWQ/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(45, '强', NULL, 'oHfDAwTA7zNYCqxCdEsD8qfo2yQE', '强', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkRiaAsjwiav3AwWQTtXALTQzhC6931mjfVhlfYFwibZYiafRDS4C3lkMJyd5RlibuOOoxPsbywABEEIVk/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(46, 'fancy', NULL, 'oHfDAwYr5uzfPw_IpjkFo7v4G1SE', 'fancy', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM78muGF4k9cvVleEpTeU2NrjeECHD9qeUPf5LxXYNC40T1icGWdPfUgl1OqbjAFmUcoNEiarfZnicAXcSXibHa4gIiaRmf28w2pRBW4/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(47, '磊', NULL, 'oHfDAwS3HTebhcZmqJAmiWSWk4WQ', '磊', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXibtReo0NVUofogibOU47PibjRgtKDiakhJ6Mmfu6FgBg63KHldavaciaaMkzTvehwYuxaH3iaYjTQsznI/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(48, '乐林', NULL, 'oHfDAwQnbDusPzGQY7rZHTeahZRo', '乐林', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEInPS1PiapxNTYjTzHQe53EbsOCYpMZbelib3jzDPkJFfVlM28twRNQh7kCSzj57MWNWeicNHk5AZBZA/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(49, '王书元', NULL, 'oHfDAwac4Wb6WI5nbHXkFjONz-Ac', '王书元', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDn5rSKndiawdsPj9bUAOYskBUJSWNEaYGUezJBicIhKaFd2vaUu1e4J20NU2PIuOribkKlZ3qFkXhJA/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(50, '🏀浩天', NULL, 'oHfDAwX9xpB4_lWBIkFQrw5XXG9I', '🏀浩天', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkdgAhkXJov4pk6HStEZYic4zDBWEf12egU7ErNoG0ladCEVPmHDiaxu6yILFBdkHrbq4r8qialyT6ku/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(51, '叮叮', NULL, 'oHfDAwZmKhrr8IiQsSEq8K6-wLb4', '叮叮', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELic7EmJjCcuckmibuOa5HICRGUhOyc94xHINyjicY3fUnKuwJz1rwEZMRq179SDh1a93UjfibzkMfDOQ/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(52, '李天灏 Benjamin', NULL, 'oHfDAwTPmORU3VKkf1b7SrCPbebg', '李天灏 Benjamin', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJSibjyftZWCShWdHngQZXWrouw7v2Xyvdia2untoBR3NbF66N1b4IN4qfhW2icSicP8WfCJeUub6wTWg/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(53, '对号入座', NULL, 'oHfDAwQULoTHWLSmblaYWKhvK_2I', '对号入座', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX79SWuVhIfoWsg4rbnjXricKbWSKobP4Z3e5JaMAVXwvDbCWEs6VyQn4gW53D8VticLIMA4HfaibsIw/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(54, '吕松良', NULL, 'oHfDAwQHoneCWyy8iG6y2aWVGbLE', '吕松良', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6nrGSXiaiaTV36apl09fGiaeYqQCajicIcneLeFw9bGq4GvsRL0HwxzX7K1pNQdACK4lPk5V3Oib1mgapvOiawKVzDibTc/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(55, 'fisher', NULL, 'oHfDAwb7tViD2KQF8zjL4UoZ-LxU', 'fisher', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI54ibJVAkRPwH4jCzT4rLwcyu26YhjCtVcFibrP5Z8bgiathQ4iakMfITE1OPp7EPYssq79e41JZq3XyoV/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(56, 'A\\  宜信贷款の周文琴💋', NULL, 'oHfDAwf5SLkLrsBUNKzoG7Nq1WGw', 'A\\  宜信贷款の周文琴💋', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4upUibbRIV5b6RwUanU2KEotOGKOJwkJL6ID380cpyyY8jl6V0QmJEsOsBsdiaf8g2tAnbJThBaVnHE/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(57, '葛轶君', NULL, 'oHfDAwSies5qWrJDQhei0xIIr9k0', '葛轶君', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX1PmmqWhpL5FSl8U88OiaibCTQtlszoqJMh4tQ0DWdgKnUicJzYS0fUStrEqWuK94eiaGhnZZNMsFRtt/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(58, '小鹿', NULL, 'oHfDAwVqvj17MOZJoLDTW3yK-kxk', '小鹿', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJJxLEc8ibgwWgjcHASu1m0gONDOKnzKWRy6lSDYXV7pk16ctSefkBIvfaricNczRuyIM6EOVspyAxA/0', 1, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(59, '马子虬', NULL, 'oHfDAwcUQ683VyiMgErIPJutzRv0', '马子虬', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN548ibgNG9MamaR3KqZfN3ggCZGznHnic0gVJDQ3e0xvLw8bDeykBWMdqg9UAhZldkAMBa8MSnSbdY5gcyBbnHhwaA/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(60, 'Jay', NULL, 'oHfDAwZfSFEy7_ufaudKD4T3eczs', 'Jay', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX0TUr9Ndqkc6ic44zEYQ5lbwtfvB0AFK2Yg0ytrW52EQNmoUCDSGNfqhhlxamIqEfS94uzE231SFE/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(61, 'Jessie的老王子', NULL, 'oHfDAwatA_csHgcgGRXyGHGRSvhM', 'Jessie的老王子', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfR7UAsNWpdibulXjXKEsQ2hT6qgicsPr61jucMUIGic1M109HXWKOG9Lnh5iaIzNuMQcS4sPcFbmZOHH/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(62, '韦亚军Carola', NULL, 'oHfDAwVCVJszxxuniEJaRd90DgZs', '韦亚军Carola', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M2m5ptlMeYuzeqaVDtFQFFNTJbLaLiclNxiciasvVZ0ibcs4ufxIbDeYiaibKOq8PKMJFyohms6WMfUYLJg/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(63, '一望无际', NULL, 'oHfDAwfMXBZ1ZhY5MBLCL4fMfUM4', '一望无际', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5OVrIS7ByjFiar8uqxPEUYt0cb6NibuhYibsODhgWQLnl9TjcWAoFOviaceFsaP2aJNia33D8mD3IhaLqibicwYT4qvOoVKB6dv2EKAQ/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(64, '周元欣', NULL, 'oHfDAweTay0QbhvciobGua_rtdsA', '周元欣', 'http://wx.qlogo.cn/mmopen/EjB59MCR1By9t3V0EH4UlvdZcl0vAh7fYhw1P0XCjMFEBTquNFtEjDBAenrJRu8QweaCSwfA1dJ8c90z8Kib2rA/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(65, 'Linda', NULL, 'oHfDAwaJXYShpij2yCJcPc8o9j9s', 'Linda', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6GiaZbCH9012SXMu0k4ODqHGJ1JgA1QcuyBn7c978snH3qSMorFiczFfAHfkwGoWqkmiacWjVVdloHQ/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(66, '李晟  PLANT4', NULL, 'oHfDAwec8FPa2GZ-mX8Z9oS6B45M', '李晟  PLANT4', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfVx5XjPsbCibcvibxxTS69VFrnExLflzo8mMbzPZEnUpAOlcfdv1LicT6FgHnaC7G2Cm6pUwVGdG3nU/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(67, '好孩子', NULL, 'oHfDAwaROifoGQFMIXBn5vzs5lUw', '好孩子', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4uiafXsib2UIVsxyibYSHKEuUwKicYgnhUrcJc1Zic7q6dZXdQicYylPXC5icY9bA8clzcDmXpnm94mXuNVy/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(68, '王仁忠', NULL, 'oHfDAwXvnSrKzQAX2okQtFMkNitY', '王仁忠', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfZqDTqGTQSqfN6ibt50nASBzj4zuxYxwG7GPsQYqLicFyngQ7IYVKe0o7ZjgBb2QABqeiaVa9nGJOKY/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(69, '娄兆海', NULL, 'oHfDAwUfjImmt2fMSaEP58Su-FE0', '娄兆海', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4MS6rASV4sofzJEYSb61J9STr027ootzCweZddGhDPQ8rNrjlAsOlL9mL5icYwrAOsn4SicylCLTSg/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(70, '夏夜馨空', NULL, 'oHfDAwaqZ1QZDH-IZEKLy4jk0LWc', '夏夜馨空', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX9X9kuxjVxzTcPNZ6hLMMaJNI3kwO9MlZCeHlxuIhP2LMLicpgZ1deDWiaALhqaDrIUPq2a1tm2cMm/0', 1, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(71, '中华田园猫王 💸', NULL, 'oHfDAwRg1q-4Wc6BmueY-rrhNGXM', '中华田园猫王 💸', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4ulYar24Kd01sBbmfUagIReslibYBotZ6hz8Sp9e0ZzoJgmdOb8jclibBhMakicp9Lm4g3pyteNRDicpr/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(72, '^_^', NULL, 'oHfDAwTTwYL-PN6ZswJjoDfQ0DUM', '^_^', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfVLFic9yfhFlo5DjlHEGlVdxRcgVsRh0EGoicDl5IJRvZn4qGoDGPiaiaD7h2BaZsj2RnlLgM5t8V9Qr/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(73, '李宇', '2007-11-11', 'oHfDAwUFRlmhHBpmLcnQkNGsYHBY', '李宇', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz1DCPB1iaMIOnia3L7SwZibwv4Qt4kfBxP4fs9PX4I47ltLuHia8QM3xWMrnLL4tpIXzWMiaqibW59PibAGERYEkWYKeF/0', 1, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(74, '许鸣', '2013-04-03', 'opyuV0xteKR1g4mRGrqyi7Iw9rRs', '小A23', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJCkVv1aibMd2ZW0YISZMbUh7XeK65WCvzj9TpZ7DOTFtvsicGw3RSHJWwuaavsx8GCpAYJWTQXCaNQ/132', 1, '13310030509', 0, '0', '2.5', 1, 1, '2018-05-07 10:12:30', '2018-05-14 05:19:11');

-- --------------------------------------------------------

--
-- 表的结构 `user_administrators`
--

CREATE TABLE `user_administrators` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `administrator_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user_administrators`
--

INSERT INTO `user_administrators` (`user_id`, `administrator_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `vote_logs`
--

CREATE TABLE `vote_logs` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `voter_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `vote_date` date NOT NULL DEFAULT '2018-05-07',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `vote_logs`
--

INSERT INTO `vote_logs` (`user_id`, `voter_id`, `activity_id`, `vote_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2018-05-18', '2018-05-18 04:24:58', '2018-05-18 04:24:58'),
(2, 1, 2, '2018-05-09', '2018-05-10 07:08:03', '2018-05-10 07:08:03'),
(2, 1, 2, '2018-05-12', '2018-05-11 21:15:12', '2018-05-11 21:15:12'),
(3, 1, 2, '2018-05-09', '2018-05-10 07:07:59', '2018-05-10 07:07:59'),
(3, 1, 2, '2018-05-10', '2018-05-10 07:16:38', '2018-05-10 07:16:38'),
(9, 1, 2, '2018-05-18', '2018-05-18 04:24:58', '2018-05-18 04:24:58'),
(11, 1, 2, '2018-05-18', '2018-05-18 04:24:59', '2018-05-18 04:24:59'),
(15, 1, 2, '2018-05-18', '2018-05-18 03:45:03', '2018-05-18 03:45:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_activity_id_foreign` (`activity_id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `activity_users`
--
ALTER TABLE `activity_users`
  ADD PRIMARY KEY (`activity_id`,`user_id`),
  ADD KEY `activity_users_user_id_foreign` (`user_id`),
  ADD KEY `activity_users_age_group_id_foreign` (`age_group_id`),
  ADD KEY `vote_number` (`voted_number`),
  ADD KEY `activity_users_city_id_foreign` (`city_id`),
  ADD KEY `words_number` (`words_number`);

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `administrators_name_unique` (`name`);

--
-- Indexes for table `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sort_id` (`sort_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`item_id`,`uid`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_page_id_foreign` (`page_id`),
  ADD KEY `block_type` (`block_type`),
  ADD KEY `sort_id` (`sort_id`);

--
-- Indexes for table `prizes`
--
ALTER TABLE `prizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prizes_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `prize_logs`
--
ALTER TABLE `prize_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prize_logs_activity_id_foreign` (`activity_id`),
  ADD KEY `prize_logs_user_id_foreign` (`user_id`),
  ADD KEY `prize_logs_prize_id_foreign` (`prize_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `question_logs`
--
ALTER TABLE `question_logs`
  ADD PRIMARY KEY (`question_id`,`user_id`),
  ADD KEY `question_logs_user_id_foreign` (`user_id`),
  ADD KEY `question_logs_answered_id_foreign` (`answered_id`);

--
-- Indexes for table `reading_logs`
--
ALTER TABLE `reading_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_logs_activity_id_foreign` (`activity_id`),
  ADD KEY `reading_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_openid_unique` (`openid`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_invite_id_foreign` (`invite_id`),
  ADD KEY `is_reading` (`is_reading`),
  ADD KEY `sex` (`sex`),
  ADD KEY `is_activated` (`is_activated`);

--
-- Indexes for table `user_administrators`
--
ALTER TABLE `user_administrators`
  ADD PRIMARY KEY (`user_id`,`administrator_id`),
  ADD KEY `user_administrators_administrator_id_foreign` (`administrator_id`);

--
-- Indexes for table `vote_logs`
--
ALTER TABLE `vote_logs`
  ADD PRIMARY KEY (`user_id`,`voter_id`,`activity_id`,`vote_date`),
  ADD KEY `vote_logs_voter_id_foreign` (`voter_id`),
  ADD KEY `vote_logs_activity_id_foreign` (`activity_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- 使用表AUTO_INCREMENT `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `prizes`
--
ALTER TABLE `prizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `prize_logs`
--
ALTER TABLE `prize_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `reading_logs`
--
ALTER TABLE `reading_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- 限制导出的表
--

--
-- 限制表 `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `activity_users`
--
ALTER TABLE `activity_users`
  ADD CONSTRAINT `activity_users_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `activity_users_age_group_id_foreign` FOREIGN KEY (`age_group_id`) REFERENCES `age_groups` (`id`),
  ADD CONSTRAINT `activity_users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `activity_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- 限制表 `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- 限制表 `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);

--
-- 限制表 `prizes`
--
ALTER TABLE `prizes`
  ADD CONSTRAINT `prizes_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

--
-- 限制表 `prize_logs`
--
ALTER TABLE `prize_logs`
  ADD CONSTRAINT `prize_logs_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `prize_logs_prize_id_foreign` FOREIGN KEY (`prize_id`) REFERENCES `prizes` (`id`),
  ADD CONSTRAINT `prize_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

--
-- 限制表 `question_answers`
--
ALTER TABLE `question_answers`
  ADD CONSTRAINT `question_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- 限制表 `question_logs`
--
ALTER TABLE `question_logs`
  ADD CONSTRAINT `question_logs_answered_id_foreign` FOREIGN KEY (`answered_id`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `question_logs_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `question_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `reading_logs`
--
ALTER TABLE `reading_logs`
  ADD CONSTRAINT `reading_logs_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `reading_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- 限制表 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_invite_id_foreign` FOREIGN KEY (`invite_id`) REFERENCES `users` (`id`);

--
-- 限制表 `user_administrators`
--
ALTER TABLE `user_administrators`
  ADD CONSTRAINT `user_administrators_administrator_id_foreign` FOREIGN KEY (`administrator_id`) REFERENCES `administrators` (`id`),
  ADD CONSTRAINT `user_administrators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `vote_logs`
--
ALTER TABLE `vote_logs`
  ADD CONSTRAINT `vote_logs_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `vote_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `vote_logs_voter_id_foreign` FOREIGN KEY (`voter_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
