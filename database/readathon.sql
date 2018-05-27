-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-05-25 14:35:09
-- 服务器版本： 5.6.33-0ubuntu0.14.04.1
-- PHP Version: 7.1.16-1+ubuntu14.04.1+deb.sury.org+1

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
(1, '21天阅读习惯养成赛 - 4月', '', '2018-04-01', '2018-04-22', '2018-04-25', '2018-05-20', '/images/kv-01.png', NULL, '2018-05-22 07:50:26'),
(2, '5月全城挑战赛', '', '2018-05-01', '2018-05-30', '2018-06-10', '2018-06-20', '/images/kv-01.png', NULL, '2018-05-21 19:17:25');

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
(59, 2, 1, 10, '用户点赞赠送字数', '2018-05-13 15:53:00', '2018-05-13 15:53:00'),
(60, 2, 21, 10, '用户点赞赠送字数', '2018-05-13 17:57:04', '2018-05-13 17:57:04'),
(61, 2, 16, 10, '用户点赞赠送字数', '2018-05-13 17:59:52', '2018-05-13 17:59:52'),
(62, 2, 1, 10, '用户点赞赠送字数', '2018-05-13 17:59:54', '2018-05-13 17:59:54'),
(63, 2, 5, 10, '用户点赞赠送字数', '2018-05-13 17:59:55', '2018-05-13 17:59:55'),
(64, 2, 17, 10, '用户点赞赠送字数', '2018-05-13 17:59:55', '2018-05-13 17:59:55'),
(65, 2, 6, 10, '用户点赞赠送字数', '2018-05-13 18:00:00', '2018-05-13 18:00:00'),
(66, 2, 13, 10, '用户点赞赠送字数', '2018-05-13 18:00:02', '2018-05-13 18:00:02'),
(67, 2, 26, 10, '用户点赞赠送字数', '2018-05-13 18:00:04', '2018-05-13 18:00:04'),
(68, 2, 20, 10, '用户点赞赠送字数', '2018-05-13 18:00:05', '2018-05-13 18:00:05'),
(69, 2, 8, 10, '用户点赞赠送字数', '2018-05-13 18:00:06', '2018-05-13 18:00:06'),
(70, 2, 12, 10, '用户点赞赠送字数', '2018-05-13 18:00:08', '2018-05-13 18:00:08'),
(71, 2, 2, 10, '用户点赞赠送字数', '2018-05-13 18:00:11', '2018-05-13 18:00:11'),
(72, 2, 14, 10, '用户点赞赠送字数', '2018-05-13 18:00:12', '2018-05-13 18:00:12'),
(73, 2, 11, 10, '用户点赞赠送字数', '2018-05-13 23:25:56', '2018-05-13 23:25:56'),
(74, 2, 25, 10, '用户点赞赠送字数', '2018-05-13 23:26:03', '2018-05-13 23:26:03'),
(75, 2, 9, 10, '用户点赞赠送字数', '2018-05-14 03:13:21', '2018-05-14 03:13:21'),
(76, 2, 11, 10, '用户点赞赠送字数', '2018-05-14 03:13:23', '2018-05-14 03:13:23'),
(77, 2, 15, 10, '用户点赞赠送字数', '2018-05-14 03:13:24', '2018-05-14 03:13:24'),
(78, 2, 25, 10, '用户点赞赠送字数', '2018-05-14 03:13:26', '2018-05-14 03:13:26'),
(79, 2, 23, 10, '用户点赞赠送字数', '2018-05-14 03:14:50', '2018-05-14 03:14:50'),
(80, 2, 10, 10, '用户点赞赠送字数', '2018-05-14 03:14:50', '2018-05-14 03:14:50'),
(81, 2, 3, 10, '用户点赞赠送字数', '2018-05-14 03:15:54', '2018-05-14 03:15:54'),
(82, 2, 24, 10, '用户点赞赠送字数', '2018-05-14 03:16:02', '2018-05-14 03:16:02'),
(83, 2, 7, 10, '用户点赞赠送字数', '2018-05-14 03:19:43', '2018-05-14 03:19:43'),
(85, 2, 9, 10, '用户点赞赠送字数', '2018-05-14 06:24:54', '2018-05-14 06:24:54'),
(86, 2, 11, 10, '用户点赞赠送字数', '2018-05-14 06:24:56', '2018-05-14 06:24:56'),
(87, 2, 15, 10, '用户点赞赠送字数', '2018-05-14 06:24:57', '2018-05-14 06:24:57'),
(88, 2, 25, 10, '用户点赞赠送字数', '2018-05-14 06:24:59', '2018-05-14 06:24:59'),
(89, 2, 5, 10, '用户点赞赠送字数', '2018-05-14 06:32:39', '2018-05-14 06:32:39'),
(90, 2, 16, 10, '用户点赞赠送字数', '2018-05-14 07:32:15', '2018-05-14 07:32:15'),
(91, 2, 1, 10, '用户点赞赠送字数', '2018-05-14 07:32:17', '2018-05-14 07:32:17'),
(92, 2, 4, 10, '用户点赞赠送字数', '2018-05-14 07:32:19', '2018-05-14 07:32:19'),
(93, 2, 24, 10, '用户点赞赠送字数', '2018-05-14 07:32:21', '2018-05-14 07:32:21'),
(95, 2, 9, 10, '用户点赞赠送字数', '2018-05-15 07:16:58', '2018-05-15 07:16:58'),
(96, 2, 11, 10, '用户点赞赠送字数', '2018-05-15 07:16:59', '2018-05-15 07:16:59'),
(97, 2, 15, 10, '用户点赞赠送字数', '2018-05-15 07:17:01', '2018-05-15 07:17:01'),
(98, 2, 25, 10, '用户点赞赠送字数', '2018-05-15 07:17:07', '2018-05-15 07:17:07'),
(99, 2, 3, 10, '用户点赞赠送字数', '2018-05-15 07:17:07', '2018-05-15 07:17:07'),
(100, 2, 21, 10, '用户点赞赠送字数', '2018-05-15 07:17:08', '2018-05-15 07:17:08'),
(101, 2, 10, 10, '用户点赞赠送字数', '2018-05-15 07:17:09', '2018-05-15 07:17:09'),
(102, 2, 23, 10, '用户点赞赠送字数', '2018-05-15 07:17:09', '2018-05-15 07:17:09'),
(103, 2, 9, 10, '用户点赞赠送字数', '2018-05-15 08:00:04', '2018-05-15 08:00:04'),
(104, 2, 11, 10, '用户点赞赠送字数', '2018-05-15 08:00:06', '2018-05-15 08:00:06'),
(105, 2, 15, 10, '用户点赞赠送字数', '2018-05-15 08:00:06', '2018-05-15 08:00:06'),
(106, 2, 16, 10, '用户点赞赠送字数', '2018-05-15 08:00:08', '2018-05-15 08:00:08'),
(107, 2, 1, 10, '用户点赞赠送字数', '2018-05-15 08:00:09', '2018-05-15 08:00:09'),
(108, 2, 19, 10, '用户点赞赠送字数', '2018-05-15 08:00:10', '2018-05-15 08:00:10'),
(109, 2, 78, 10, '用户点赞赠送字数', '2018-05-15 08:00:19', '2018-05-15 08:00:19'),
(110, 2, 11, 10, '用户点赞赠送字数', '2018-05-15 16:58:38', '2018-05-15 16:58:38'),
(112, 2, 9, 10, '用户点赞赠送字数', '2018-05-16 03:31:56', '2018-05-16 03:31:56'),
(113, 2, 11, 10, '用户点赞赠送字数', '2018-05-16 03:31:57', '2018-05-16 03:31:57'),
(114, 2, 2, 200, '问题回答正确奖励字数', '2018-05-22 03:49:40', '2018-05-22 03:49:40'),
(115, 2, 84, 200, '问题回答正确奖励字数', '2018-05-22 07:30:18', '2018-05-22 07:30:18'),
(116, 2, 92, 200, '有奖问答奖励', '2018-05-23 11:39:15', '2018-05-23 11:39:15'),
(117, 1, 91, 1000, '儿童机活动', '2018-05-24 03:09:10', '2018-05-24 03:09:10'),
(126, 1, 90, 1000, '母亲节', '2018-05-24 03:10:58', '2018-05-24 03:10:58'),
(128, 2, 80, 5000, '儿童节活动', '2018-05-24 03:33:45', '2018-05-24 03:33:45'),
(129, 2, 90, 10000, '父亲节', '2018-05-24 05:45:38', '2018-05-24 05:45:38'),
(131, 2, 75, 1000, '阅读比赛', '2018-05-24 06:02:04', '2018-05-24 06:02:04'),
(132, 2, 75, 500, '阅读比赛', '2018-05-24 06:41:48', '2018-05-24 06:41:48');

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
(2, 1, 1, 3, 837, 6304, 86, 0, '2018-05-07 16:28:49', '2018-05-22 15:57:46'),
(2, 2, 1, 1, 7871, 1521, 5, 0, '2018-05-07 16:32:34', '2018-05-22 07:47:24'),
(2, 4, 1, 1, 614, 6173, 39, 0, '2018-05-07 16:33:47', '2018-05-22 15:57:47'),
(2, 5, 1, 1, 2535, 6761, 78, 0, '2018-05-07 16:36:48', '2018-05-22 05:05:52'),
(2, 6, 1, 1, 834, 5208, 66, 0, '2018-05-07 16:36:48', '2018-05-21 08:31:47'),
(2, 7, 1, 2, 6564, 5825, 3, 0, NULL, '2018-05-22 14:59:59'),
(2, 8, 1, 1, 320, 3403, 9, 0, '2018-05-07 15:57:01', '2018-05-21 08:31:37'),
(2, 9, 1, 1, 1905, 9620, 44, 0, '2018-05-07 15:57:01', '2018-05-22 17:52:32'),
(2, 10, 1, 1, 8566, 7541, 55, 0, '2018-05-07 15:57:01', '2018-05-22 15:57:43'),
(2, 11, 1, 1, 7115, 9035, 64, 0, '2018-05-07 15:57:01', '2018-05-23 11:35:10'),
(2, 12, 1, 1, 9876, 2081, 6, 0, '2018-05-07 15:57:01', '2018-05-13 18:00:08'),
(2, 13, 1, 1, 8038, 3622, 71, 0, '2018-05-07 15:57:01', '2018-05-13 18:00:02'),
(2, 14, 1, 1, 559, 1855, 34, 0, '2018-05-07 15:57:01', '2018-05-13 18:00:12'),
(2, 15, 1, 1, 8682, 8450, 64, 0, '2018-05-07 15:57:01', '2018-05-23 11:35:10'),
(2, 16, 1, 1, 1733, 6456, 96, 0, '2018-05-07 15:57:01', '2018-05-22 15:57:46'),
(2, 17, 1, 1, 2621, 6931, 86, 0, '2018-05-07 15:57:01', '2018-05-22 05:03:43'),
(2, 18, 1, 1, 7905, 5305, 45, 0, '2018-05-07 15:57:01', '2018-05-10 05:27:07'),
(2, 19, 1, 1, 1661, 5803, 73, 0, '2018-05-07 15:57:01', '2018-05-15 08:00:10'),
(2, 20, 1, 1, 4591, 3059, 26, 0, '2018-05-07 15:57:01', '2018-05-13 18:00:05'),
(2, 21, 1, 1, 7970, 7906, 14, 0, '2018-05-07 15:57:01', '2018-05-22 15:57:43'),
(2, 22, 1, 1, 6076, 194, 76, 0, '2018-05-07 15:57:01', '2018-05-22 18:55:01'),
(2, 23, 1, 1, 6472, 7350, 47, 0, '2018-05-07 15:57:01', '2018-05-22 15:57:44'),
(2, 24, 1, 1, 4131, 6087, 99, 0, '2018-05-07 15:57:01', '2018-05-22 05:06:04'),
(2, 25, 1, 1, 1239, 8348, 49, 0, '2018-05-07 15:57:01', '2018-05-23 11:35:11'),
(2, 26, 1, 1, 3804, 3258, 27, 0, '2018-05-07 15:57:01', '2018-05-13 18:00:04'),
(2, 75, 1, 1, 12, 25498, 7, 0, '2018-05-14 06:24:26', '2018-05-24 06:41:48'),
(2, 78, 1, 1, 1, 110, 1, 0, '2018-05-14 06:54:23', '2018-05-15 08:00:19'),
(2, 80, 1, 1, 1, 5020, 1, 0, '2018-05-22 03:15:45', '2018-05-24 03:33:45'),
(2, 84, 1, 1, 6, 2940, 3, 0, '2018-05-21 05:11:35', '2018-05-23 11:37:28'),
(2, 85, 2, 1, 1, 110, 1, 0, '2018-05-21 06:18:42', '2018-05-22 18:55:00'),
(2, 91, 4, 1, 1, 985, 0, 0, '2018-05-24 06:36:26', '2018-05-24 06:36:26'),
(2, 92, 1, 1, 1, 310, 1, 0, '2018-05-23 03:44:41', '2018-05-23 11:39:15');

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
(1, 'annabelle', 'shi.annabelle@athenaca.com', '$2y$10$XwWb/1oSQO24MQg8E1kFdu3xf/.qpXfaiMuziOw26uCemBJ9QRZfO', 'QaJWkAPh2TP5CX4Zx6PyMw9jddxRdVb1ll2gxcjbCFmyWN7aPw2hbXYKIjV6', '2018-04-22 09:42:48', '2018-05-21 15:25:31'),
(3, 'Test', 'test@at.cm', '$2y$10$YN5X5shmwpUFDKBgijIgNugOvR8w.BWrCDxpgpMspTv8RLu8YJA4i', NULL, '2018-05-23 08:40:45', '2018-05-23 08:42:08'),
(4, 'SHJA', '2@athenaca.com', '$2y$10$rY32SOSsFe4tN9MQTjeRQOFWypnxli4TZygFIWBQuHKB/3ygYXV4i', NULL, '2018-05-24 11:02:12', '2018-05-24 11:04:21'),
(5, 'SHSJ', '1@athenaca.com', '$2y$10$QsfZwp/yc7PFfvdWYz.kQOcnR78nPeYSNfk1T59Dq4zkJjhI4802W', NULL, '2018-05-24 11:03:55', '2018-05-24 11:13:57'),
(6, 'SZOCT', '3@athenaca.com', '$2y$10$cC6ihRPfTBYbqc6BJAPebe.Z5TDNNqDCXgeTbDzt12CX2ljl2EHY6', NULL, '2018-05-24 11:04:58', '2018-05-24 11:04:58'),
(7, 'SZSW', '4@athenaca.com', '$2y$10$i0YBuV9D6t/M80cO00zYt.Dantn1XpDF5JRIlxAXEIlAbpO0bWBdi', NULL, '2018-05-24 11:05:21', '2018-05-24 11:05:21'),
(8, 'NBHS', '5@athenaca.com', '$2y$10$wDXOm5pmGAxNcMlB/x5EIen/Vl.VqmR21Bz6GI03gjHmTabDwOMFa', 'nweCtfpWNR3zqEOZvoVaAL43kuzsNnQiTflZRXDJ2oXYyG0IqUEpO5x7wYho', '2018-05-24 11:06:02', '2018-05-24 11:06:02'),
(9, 'NBYZ', '6@athenaca.com', '$2y$10$OVOftjvPMDYs4my4snRyEeF2HqGddZDssDfMd7/.xrG3oayvuen1a', NULL, '2018-05-24 11:06:27', '2018-05-24 11:06:27'),
(10, 'HZWX', '7@athenaca.com', '$2y$10$7zVccwY3U903JrNk7ADADuTlPvguYgPV3UsJmzOncftqhK/fakrTa', NULL, '2018-05-24 11:06:49', '2018-05-24 11:06:49');

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
(2, '杭州', 3, '2018-05-18 07:07:21', '2018-05-18 08:19:46'),
(3, '深圳', 2, '2018-05-18 07:07:27', '2018-05-18 08:19:40'),
(4, '宁波', 4, '2018-05-18 07:07:32', '2018-05-18 07:07:32'),
(5, '其他城市', 5, '2018-05-24 04:18:30', '2018-05-24 04:18:30');

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
(8, 'App\\Administrator', 1),
(3, 'App\\Administrator', 3),
(8, 'App\\Administrator', 3),
(3, 'App\\Administrator', 4),
(8, 'App\\Administrator', 4),
(3, 'App\\Administrator', 5),
(8, 'App\\Administrator', 5),
(3, 'App\\Administrator', 6),
(8, 'App\\Administrator', 6),
(3, 'App\\Administrator', 7),
(8, 'App\\Administrator', 7),
(3, 'App\\Administrator', 8),
(8, 'App\\Administrator', 8),
(3, 'App\\Administrator', 9),
(8, 'App\\Administrator', 9),
(3, 'App\\Administrator', 10),
(8, 'App\\Administrator', 10);

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
(2, 'App\\Administrator', 1),
(1, 'App\\Administrator', 3),
(1, 'App\\Administrator', 4),
(1, 'App\\Administrator', 5),
(1, 'App\\Administrator', 6),
(1, 'App\\Administrator', 7),
(1, 'App\\Administrator', 8),
(1, 'App\\Administrator', 9),
(1, 'App\\Administrator', 10);

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
(4, 'about', '关于阅读马拉松', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00'),
(5, 'prize', '奖品详情', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00'),
(6, 'test', '关于美国权威STAR英文水平测试', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00'),
(7, 'athena', '关于知慧学院 Athena Academy', '', '2018-05-07 16:00:00', '2018-05-07 16:00:00');

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
(3, '比赛管理', 'admin', '2018-04-22 09:42:48', '2018-04-22 09:42:48'),
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
(1, '幻灯片1', 'slides', '', NULL, 999, '/images/kv-01.png', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(3, '幻灯片3', 'slides', '', 1, 999, '/images/kv-01.png', '', '2018-05-08 16:00:00', '2018-05-08 16:00:00'),
(4, '100本必读知慧书单 - 6月版 （TEST）', 'article', '<p><strong>一、文学类：</strong><br />\n<br />\n《百年孤独》《活着》《悲惨世界》《老人与海》《挪威的森林》<br />\n<br />\n《人间词话》《唐诗三百首》《呐喊》《撒哈拉的故事》《不能承受的生命之轻》<br />\n<br />\n《海子诗全集》《三体》《四大名著》《围城》《1984》<br />\n<br />\n《傲慢与偏见》《茶馆》《魔戒》《白鹿原》《射雕英雄传》<br />\n<br />\n《我们仨》《月亮和六便士》《倾城之恋》《白夜行》《飘》<br />\n<br />\n《尘埃落定》《福尔摩斯探案全集》《诗经》《目送》《基督山伯爵》<br />\n<br />\n《边城》《如何阅读一本书》《苏菲的世界》《红高粱》《文学回忆录》<br />\n<br />\n《麦田里的守望者》《平凡的世界》《我与地坛》　　<br />\n<br />\n<strong>二、社科类：</strong><br />\n<br />\n《论语》《光荣与梦想》《全球通史》《自私的基因》《南渡北归》<br />\n<br />\n《中国哲学简史》《万历十五年》《社会契约论》《菊与刀》《失控》<br />\n<br />\n《文化苦旅》《乌合之众》《孙子兵法》《炮、病菌与钢铁》《中国历代得失》<br />\n<br />\n《宽容》《传家》《明朝那些事儿》《历史深处的忧虑》《剑桥中国史》<br />\n<br />\n《西方哲学史》《大问题:简明哲学导论》<br />\n<br />\n<strong>三、经管励志类：</strong><br />\n<br />\n《高效能人士的七个习惯》《经济学原理》《金字塔原理》《少有人走的路》《向前一步》<br />\n<br />\n《洛克菲勒给儿子的38封信》《基业长青》《影响力》《伟大的博弈》《与神对话》<br />\n<br />\n《心理学与生活》《卓有成效的管理者》《从0到1》《资本论》《激荡三十年》<br />\n<br />\n<strong>四、少儿类：</strong><br />\n<br />\n《哈利波特》《不一样的卡梅拉》《小王子》《丁丁历险记》《猜猜我有多爱你》<br />\n<br />\n《安徒生童话》《爱的教育》《失落的一角》《上下五千年》《好饿的毛毛虫》<br />\n<br />\n《夏洛的网》　　　　<br />\n<br />\n<strong>五、科技类：</strong><br />\n<br />\n《时间简史》《科学百科》《万物运转的秘密》《从一到无穷大》《浪潮之巅》<br />\n<br />\n《上帝与新物理学》《硅谷百年史》《昆虫记》《万物简史》　<br />\n<br />\n<strong>六、艺术类：</strong><br />\n<br />\n《艺术的故事》《美的历程》《加德纳艺术通史》<br />\n<br />\n<strong>七、生活类：</strong><br />\n<br />\n《好妈妈胜过好老师》《男人来自火星，女人来自金星》<br />\n&nbsp;</p>', 2, 999, '', '', '2018-05-08 16:00:00', '2018-05-21 03:20:02'),
(7, '6月知慧书单', 'slides', '', 2, 999, '/photos/1/kv20180522.png', '', '2018-05-08 16:00:00', '2018-05-22 15:22:00');
INSERT INTO `posts` (`id`, `title`, `block_type`, `body`, `page_id`, `sort_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(9, '阅读马拉松隐私政策', 'article', '<p align=\"center\" style=\"margin:0cm 0cm 0.0001pt; text-align:center; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><font color=\"#000000\" face=\"SimSun\"><span style=\"caret-color: rgb(0, 0, 0);\">阅读马拉松隐私政策</span></font></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\">&nbsp;</p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"font-family:SimSun\">我们保护您个人隐私的承诺。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">ATHENA.ACADEMY（以下简称&ldquo;Athena&rdquo;或&ldquo;我们&rdquo;）致力于保护我们潜在及现有客户和员工的隐私。本隐私政策（以下简称&ldquo;隐私政策&rdquo;）适用于我们所处理的所有个人数据（如下所定义），包括通过我们的网站、移动应用程序或通过我们的官方社交媒体网页（以下统称&ldquo;Athena数字产品&rdquo;）或通过其他线上和线下渠道（于下文详述）收集或提交的个人数据。您应在使用Athena数字产品或向Athena提交您的任何个人数据前认真阅读隐私政策，一旦您开始使用Athena数字产品或向Athena提交您的任何个人数据，即表示您已阅读隐私政策，且同意我们根据隐私政策收集、使用和/或分享您的个人数据。如果您未阅读隐私政策或不同意隐私政策的任何条款，请勿使用Athena数字产品或向Athena提交任何个人数据。但是，若您不能或不愿向Athena提供我们合理要求的个人数据，则我们可能无法向您提供您所请求的信息、商品或服务。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Athena将按照中华人民共和国大陆地区（不包括香港、澳门、台湾地区）（以下简称&ldquo;中国&rdquo;）关于隐私和个人数据保护的法律法规处理您的个人数据。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">个人数据&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&ldquo;个人数据&rdquo;是指可以识别您的一条或多条信息，包括但不限于：&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;姓名和联系方式，包括但不限于邮政和电子邮箱地址、电话号码等&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;帐户信息，包括但不限于用户名、个人照片或社交媒体账号等&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;居住地址，包括但不限于居住国家、详细地址、邮政编码等</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;出生日期&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;技术信息，包括但不限于网名、IP地址、浏览器及设备数据、通过cookie收集的信息、像素标签及其他技术、服务器日志文件数据、应用程序使用数据及位置信息等&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;偏好，包括但不限于购物习惯、首选教育课程等&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;公司或学校名称及地址&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;信用卡和借记卡号&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&bull;</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;&nbsp;&nbsp;&nbsp;医疗信息（如过敏或疾病情况）&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">我们如何收集个人数据？</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"font-family:SimSun\">我们可通过以下方式收集个人数据：</span></span>&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">1.&nbsp;直接向您收集：Athena可能会直接向您收集信息，或者由您直接向我们提供信息，或者我们通过您的行为收集信息。具体如下：&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">1） 线上：我们可能会通过Athena数字产品或其他线上渠道收集您的个人数据，如当您订阅我们的新闻简讯或手册、参加或购买某项产品或服务或活动、参加在线调查或社区论坛、向我们提交您的个人简历时，我们可以收集到您的相关信息。除此之外，我们还可能通过下述方式收集个人数据：</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\">&nbsp;</p>\n\n<ol start=\"12\" style=\"list-style-type:lower-alpha\">\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\" value=\"50\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">通过</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Cookies。Cookies使网络服务器能够将数据传输至另一台计算机或设备，以供记录保存及其他目的。如果您不希望Athena通过使用Cookies收集信息，大部分浏览器有设置Cookies权限的功能，您可以根据浏览器功能设置来拒绝使用Cookies。欲了解更多关于Cookies&nbsp;的信息，请访问</span></span></span></span></span><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">http://www.allaboutcookies.org/。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></li>\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\" value=\"50\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">通过您使用移动应用程序。当您下载和使用移动设备应用程序，我们可基于您的设备编号跟踪并收集移动应用程序的使用数据，如您的设备上的移动应用程序访问我们服务器的日期和时间以及下载至移动应用程序的信息和文件。</span></span></span></span></span></span></li>\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\" value=\"50\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">通过您的设备。如果您在设备上已启用此功能，我们便可收集设备的物理位置，从而向您提供个性化、基于位置的服务和内容。</span></span></span></span></span></span></li>\n</ol>\n\n<p style=\"margin:0cm 0cm 0.0001pt 21pt; text-align:justify; -webkit-text-stroke-width:0px\">&nbsp;</p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">&nbsp;2） 线下：我们可能会通过线下途径收集您的个人数据，如当您联系我们的客服、参加或购买某项产品或服务或活动、向我们提交您的个人简历或以书面形式向我们提供信息时，我们可以收集到您的相关信息。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">在您向我们提供第三方的个人数据前，您应先获得该第三方的同意并告知该第三方本隐私政策的相关内容。一旦您选择向我们提供第三方的个人数据，表示您已告知了该第三方本隐私政策的相关内容并事先获得了该第三方的同意，同意我们根据本隐私政策处理其个人数据。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">2.&nbsp;通过我们在中国境内外的关联方、业务合作方、服务提供商或理赔机构。我们在中国境内外的关联方、业务合作方、服务提供商或理赔机构可能会就有关您的项目而向我们提供个人数据。&nbsp;&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">3.&nbsp;通过其他途径。我们可能会通过其他公开、合法的途径获取您的个人数据，包括但不限于公用数据库、联合营销合作伙伴、社交媒体平台、您的朋友或在社交媒体平台与您有关联的其他人士以及其他第三方。例如，如果您选择将您的社交媒体帐户连接至您的Athena数字产品帐户，则您的社交媒体帐户上的某些个人数据将会共享给我们，其中可能包括构成您个人资料一部分的个人数据。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们还可能会收集一些关于您通过浏览器使用我们服务的非个人身份信息，如您的媒体访问控制（</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">MAC）地址、电脑类型（Windows或Macintosh）、屏幕分辨率、操作系统名称及版本、设备制造商及型号、语言、互联网浏览器类型和版本、服务提供商以及您正在使用之Athena数字产品的名称和版本。此外，每当您访问Athena数字产品时，我们的服务器将自动识别并在服务器日志文件中记录您的IP地址，以及您的访问时间和所访问的页面。除非您已向Athena提交了个人信息并就此接受本隐私政策，否则前述数据不会与任何已识别或可识别个人的信息相关联。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">我们如何使用个人数据？</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">1. Athena将为完成您的预定服务、提供您所订购的产品及服务（包括但不限于旅行保险等）、客户服务、管理服务或为履行您和我们之间的合同而属必要的其他目的处理您的个人数据。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">2. Athena还可结合源自第三方提供之与您相关的信息使用您的个人数据，以便推广我们的产品和服务，其中包括根据您的兴趣开展的特别促销活动。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">3.&nbsp;我们还可能将个人数据用于下述目的：</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt 10.5pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">1）用于统计目的、计算使用情况和帮助诊断服务器问题，以及确保Athena数字产品正常运行。&nbsp;&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt 10.5pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">2）让您能够按适用产品允许的方式通过Athena数字产品与其他用户互相联系。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt 10.5pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">3）让您能够参与留言板、聊天、个人资料页面和博客，以及使用其他能够使您发布信息和资料的服务。您应当知道，您通过前述服务提供的信息和资料是公开的，可能被其他人获知，并且其他人可能将此等信息和资料用于与您取得联系，主动向您发送消息，或者用于我们或您都无法控制的用途。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt 10.5pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">4）通过识别使用趋势、确定促销活动的有效性和基于您过往在Athena数字产品的活动定制Athena数字产品体验和内容，分析和改善我们的产品和服务。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt 10.5pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">通过使用您的设备的物理位置（若您在设备上已启用此功能）向您提供个性化的基于位置的服务和内容。向您发送有关我们产品和服务的信息，包括用于营销和客户满意度调研目的背景调查。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">我们如何分享个人数据？</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<ol>\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们可能会根据中国关于隐私和个人数据保护的法律法规向我们在中国境内外的关联方、业务合作方、服务提供商和理赔机构分享您的个人数据。为此目的，在前述法律法规允许的情况下，您的个人数据可能被发送到您所居住的国家</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">/地区以外的其他国家/地区并在这些国家/地区进行分享、转移、处理和存储。</span></span></span></span></span></li>\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们可以分享或披露个人数据的情形，包括但不限于：</span></span></span></span></span></span></li>\n</ol>\n\n<p style=\"margin:0cm 0cm 0.0001pt 39pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">(a)根据中国法律法规的要求；(b)&nbsp;为遵守法律程序；(c)应政府机构的合法请求，该等政府机构既包括您居住国的政府机构，也包括您居住国境外的政府机构；(d)&nbsp;为执行我们与您约定的条款与条件；及(e)&nbsp;法律法规规定的其他必需或允许的情形。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<ol start=\"3\">\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">如果我们从事或涉及任何合并、收购、重组、资产出售的事件，那么我们可以将您的个人数据分享给我们新的关联方，或者您的个人数据将转移给非关联方的新实体承接，如果属于前述第二种情形的，我们将通知您，您可以撤回您的许可。</span></span></span></span></span></span></li>\n	<li style=\"margin:0cm 0cm 0.0001pt; text-align:justify\"><span style=\"font-size:9px;\"><span style=\"line-height:150%\"><span style=\"font-family:DengXian\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">如果您已参加某个语言测试或某一门语言课程，我们可能会向我们的关联方提供您的某些个人数据（出生日期、国籍和您的会员号）及您的测试和学习结果，以作研究、统计和审计之用。</span></span></span></span></span></span></li>\n</ol>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">安全&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们将建立严格的制度，并采用适当的技术和管理措施来确保个人数据处于</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Athena控制之下、准确和适时更新，以及防止个人数据遭到未授权或非法处理和个人数据发生意外丢失、毁损或损坏。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">取消订阅&nbsp;</span></span></span>&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">如果您在任何时候不再想要接收</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Athena的营销信息，您可使用您所收到之营销信息中所含的取消订阅功能或者通过&ldquo;联系我们&rdquo;中所列的联系方式告知我们。请在您的请求中指明您希望停止接收我们的营销信息。&nbsp;&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">请注意，此变更可能不会立即生效。我们在切实可行的情况下，将尽力依从您的要求，但无论如何也不会迟于我们收到您的请求后</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">30天。&nbsp;&nbsp;&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">第三方网站</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">本隐私政策不约束任何第三方的隐私政策、信息保护或其他行为，包括经营</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Athena数字产品中链接的网站的第三方。我们亦不对Athena数字产品中链接的网站的隐私实践负责。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">此外，我们可能会向您提供访问第三方的功能，从而使您能够将您在</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Athena数字产品上的活动分享至您的社交媒体帐户（如微博或微信）。请注意，您通过使用此功能所提供的任何信息要受相关第三方的隐私政策而非本隐私政策的约束。有关任何第三方对您通过使用此功能所提供之信息的使用，我们无控制权，亦不对此负责。&nbsp;&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们建议并鼓励您在访问上述第三方网站或使用上述功能时查看相关第三方的隐私政策。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">保存期&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们仅在需要您的个人数据作指定用途期间或在符合法律规定和市场惯例所规定的时限内保存您的个人数据，但为遵守某项法律义务或为发起、行使或抗辩法律诉求而需要继续留存或者已经与您沟通达成特定保存时限则另作别论。</span></span></span>&nbsp;&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们将为营销目的保存您的个人数据，直至您撤销同意或我们不再需要该等个人数据为止。届时我们将采取必要、合理的技术手段销毁该等个人数据，或向您返还个人数据（在该等个人数据具备返还可能的情况下）。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">未成年人</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">如果您未满</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">18岁，应在您的父母或监护人的陪同下阅读本隐私政策的条款，以确保您与您的父母/监护人均知晓该等条款。虽然我们不负责确定用户的年龄，但我们可能会进行核查。如果我们获知我们在未经父母或法定监护人同意的情况下收集了未满18岁未成年人的个人数据，我们将尽快删除此信息，并禁止该名未成年人访问Athena数字产品或采取我们认为必要的其他合理措施。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">敏感数据</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">我们一般不会收集任何敏感个人数据（如有关种族或民族、政治观点、宗教或哲学信仰或工会会藉的数据）。但是，在某些情况下，可能有必要收集此等信息（如为了向您提供您所订购或有关您的保险的服务和产品）。我们将确保我们收到您对于该处理的明确同意，并妥善处理此等信息。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">本隐私政策的更新</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">本隐私政策可能会不时变更。我们不会在未通知您的情况下，减少您在本隐私政策项下的权利。我们将在本页面发布对于隐私政策的任何变更，且如出现重大的变更，我们将以更明显的方式刊登通知。若法律有要求，我们将就任何变更事先取得您的同意。您同意将定期访问本页面，了解和审阅任何此类变更。在此类变更生效后，如果您继续使用</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">Athena数字产品或向我们提交您的任何个人数据，表示您接受和同意了变更之内容。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h2 style=\"margin:13pt 0cm; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"line-height:36.90666580200195px\"><span style=\"break-after:avoid-page\"><span style=\"font-family:&quot;DengXian Light&quot;\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span lang=\"ZH-CN\"><span style=\"line-height:32.293331146240234px\"><span style=\"font-family:SimSun\">联系我们&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h2>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">您有权随时电邮至</span></span></span><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">athena.marketing@athenaca.com联系我们，提出与隐私相关的疑问或投诉，或要求查看、纠正、更新或删除您的个人数据，撤销您的同意或拒绝我们为直接营销目的或其他目的使用您的个人数据。我们在切实可行的情况下，将尽快予以答复。</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\">&nbsp;</p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\"><span style=\"line-height:21px\"><span lang=\"ZH-CN\"><span style=\"line-height:24px\"><span style=\"font-family:SimSun\">如果我们无法圆满的解决您对我们处理您的个人数据的疑虑，可联系您所在国家的相关政府监管部门。&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\"><span style=\"font-size:9px;\"><span style=\"font-family:DengXian\"><span style=\"caret-color:#000000\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"word-spacing:0px\"><span style=\"text-decoration:none\">&nbsp;</span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:0cm 0cm 0.0001pt; text-align:justify; -webkit-text-stroke-width:0px\">&nbsp;</p>', 3, 999, '', '', '2018-05-08 16:00:00', '2018-05-21 05:00:31');
INSERT INTO `posts` (`id`, `title`, `block_type`, `body`, `page_id`, `sort_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(10, '关于阅读马拉松', 'article', '<section style=\"box-sizing: border-box;\">\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">知慧阅读马拉松&nbsp;</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Athena Readathon</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; font-size: 17px; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">书中自有黄金屋，书中自有万里路。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">阅读能力是一切学习的基础，我们一直努力帮助孩子爱上阅读，并让他们可以乐享其中。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">养成坚持阅读的好习惯，是心智的启发，更是可以受益一生的精神财富。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Athena Academy 知慧学院</strong></span>把让中国的青少儿&ldquo; <strong style=\"box-sizing: border-box;\">学会知识，习得智慧</strong>&rdquo;作为使命，坚信开卷有益。引进欧美青少儿流行的阅读马拉松概念，鼓励中国孩子多读书，读好书，好读书。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">希望 <span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">阅读马拉松</strong></span>可以成为孩子们记录阅读的好助手，帮助更多的孩子爱上阅读，懂得思考。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<div style=\"white-space: normal; box-sizing: border-box;\"><strong><a href=\"https://www.wjx.cn/jq/24189032.aspx\"><span style=\"color:#2980b9;\"><span style=\"font-size:14px;\">预约STAR英文阅读水平测试</span></span></a></strong></div>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<div style=\"box-sizing: border-box;\"><strong><a href=\"https://mp.weixin.qq.com/s/Twuw906Wrv96GQIWBPZJjA\"><span style=\"color:#2980b9;\"><span style=\"font-size:14px;\">联系知慧学院</span></span></a></strong></div>\n\n<div style=\"box-sizing: border-box;\"><strong><a href=\"http://readathon.athenaca.com/page/about/athena\"><span style=\"color:#2980b9;\"><span style=\"font-size:14px;\">了解知慧学院</span></span></a></strong></div>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">阅读马拉松流程<br style=\"box-sizing: border-box;\" />\nReadathon Procedure</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/_________.jpg\" /></p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">阅读水平测试<br style=\"box-sizing: border-box;\" />\nSTAR Reading Test</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; font-size: 17px; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">知慧学院为所有参赛者免费提供美国权威STAR英文阅读水平测试，并根据参赛者的阅读水平，结合年龄和兴趣爱好，推荐一份英文阅读书单。</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong><a href=\"http://readathon.athenaca.com/page/about/test\"><span style=\"color:#2980b9;\"><span style=\"font-size:14px;\">关于STAR英文阅读测试</span></span></a></strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">阅读马拉使用松规则<br style=\"box-sizing: border-box;\" />\nReadathon User Guide</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">记录阅读字数</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">在&ldquo;我的账户&rdquo;点击&ldquo;添加阅读记录&rdquo;，输入书名和阅读字数，即可累计字数。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">如不确定书籍字数，可在<strong><a href=\"http://www.arbookfind.com/default.aspx\"><span style=\"color:#2980b9;\">arbookfind</span></a></strong>查询英文书籍字数。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">每条阅读记录的字数上限为10000字。若参赛者阅读的书籍超过该字数，请分多条记录。</p>\n	</li>\n</ul>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">请真实做好每一条阅读记录，知慧学院有权对所有参赛者提交的阅读记录做进一步核实。若存在虚假记录，知慧学院有权注销参赛资格。</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">字数奖励</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">邀请好友一起参加阅读马拉松活动，就能获得500字数奖励。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">邀请好友点赞，即可获赠10字数，每日每位参赛者可最多获赠100字数。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">参加知慧学院的线下活动，即可获得不同字数累计(具体字数详见活动介绍)。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">参加各种类型马拉松跑，经知慧学院核实后，即可获得不同字数累计(具体字数以马拉松跑里程为准)。</p>\n	</li>\n</ul>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">阅读马拉松比赛</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Readathon Competition</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">阅读马拉松会不定期举办各种比赛，鼓励大家养成良好的阅读习惯，并有丰厚礼品领取！</p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\"><strong>阅读乐趣赛(日常比赛)：</strong>赢得精美礼品，奖学金&hellip;</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\"><strong>21天阅读习惯养成赛：</strong>赢得英文原版书籍，一对一阅读课&hellip;</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\"><strong>全城挑战赛：</strong>赢得价值过万的各项大奖：免费夏令营/冬令营名额，奖学金，Kindle&hellip;</p>\n	</li>\n</ul>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">参赛规则</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">每新一次比赛开始，之前的阅读字数则会清零，重新开始计算字数</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">每新一次比赛开始，在输入一条阅读记录后，就自动加入该比赛</p>\n	</li>\n</ul>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">请注意：</strong></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">请真实记录每一条阅读记录，请勿弄虚作假。知慧学院有权对所有参赛者提交的阅读记录做进一步核实。如有任何虚假行为，知慧学院有权取消参赛权，并要求归还奖品，更可要求赔偿。</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">年龄分组</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">系统会自动在开赛日计算参赛者的年龄，把参赛者归入对应的年龄组。</p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">&lt;5岁</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">5&ndash;7岁</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">8&ndash;10岁</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">11&ndash;14岁</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">&gt;14岁</p>\n	</li>\n</ul>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">城市分组</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; font-size: 17px; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">如果参赛者所在城市不在：上海/深圳/杭州/宁波，则自动归入全国组。</p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">全国</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">上海</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">深圳</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">杭州</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">宁波</p>\n	</li>\n</ul>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">查看排名</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">在<strong>首页</strong>，即可查看参赛者在当季比赛下，所在城市、所在年龄段的排名。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">在<strong>排行榜</strong>，即可查看当前和往期比赛的各城市，各年龄段的排名。</p>\n	</li>\n</ul>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 5px solid rgb(255, 228, 121); font-size: 17px; line-height: 1.6; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">领取奖品</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; font-size: 17px; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">阅读马拉松为参赛者设置了丰富的奖品。每次比赛结束后可以按照获得的排名来领取对应的奖品。</p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">每位参赛者，每一次比赛，在线可领取一份奖品，在奖品有效期内在知慧学院核销兑换。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">每份奖品有领取时限。错过领取时间，则视为放弃奖品领取权，不做任何补偿。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">每份奖品设有使用效时间和使用规则。奖品过期将不做任何补偿。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">奖品领取后，请在&rdquo;我的账户&ldquo;下查看状态。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">如有领取错误，请和知慧学院联系。</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">知慧学院拥有所有奖品的最终解释权。</p>\n	</li>\n</ul>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">在不同的赛季，知慧学院将邀请排名前列的参赛者前往全国各学习中心，参加线下颁奖活动，并授予奖品，以资鼓励！</p>\n</section>\n</section>\n</section>\n</section>', 4, 999, '', '', '2018-05-08 16:00:00', '2018-05-25 04:52:47'),
(11, '关于阅读马拉松', 'slides', '', 4, 999, '/photos/1/kv-01.png', '', '2018-05-21 03:37:53', '2018-05-21 03:37:53'),
(12, '美国权威STAR英文水平测试', 'article', '<section style=\"box-sizing: border-box;\">\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Athena Academy知慧学院免费为所有阅读马拉松参赛者提供STAT英文阅读水平测试。</strong></span></p>\n\n<p style=\"white-space: normal; box-sizing: border-box; text-align: center;\"><span style=\"font-size:16px;\"><strong><a href=\"https://www.wjx.cn/jq/24189032.aspx\"><span style=\"color:#2980b9;\">点此预约STAR英文水平测试</span></a></strong></span></p>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<div style=\"box-sizing: border-box;\"><strong><span style=\"font-size:14px;\"><a href=\"https://mp.weixin.qq.com/s/Twuw906Wrv96GQIWBPZJjA\"><span style=\"color:null;\">点此联系知慧学院</span></a></span></strong></div>\n\n<div style=\"box-sizing: border-box;\"><strong><span style=\"font-size:14px;\"><a href=\"http://readathon.athenaca.com/page/about/athena\"><span style=\"color:null;\">点此了解知慧学院</span></a></span></strong></div>\n</section>\n</section>\n</section>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/1.jpg\" /></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><strong>Accelerated Reader (AR)&nbsp;分级系统</strong>是由英国&nbsp;Renaissance Learning&nbsp;公司开发的一套非常精确的 英文阅读分级系统。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">在英美两国乃至全球都有很多学校和学生在使用&nbsp;AR&nbsp;系统，仅在美国就有1/3也就是&nbsp;60000&nbsp;所学校在使用这个测试系统，是目前比较被广泛使用的分级阅读系统之一。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">AR分级系统主要包括 <strong style=\"box-sizing: border-box;\"><span style=\"color:#ffe479;\">&nbsp;STAR&nbsp;阅读能力测评系统</span>&nbsp;</strong>和&nbsp; <span style=\"color:#ffe479;\"><strong style=\"box-sizing: border-box;\">AR&nbsp;原版图书阅读理解测试系统</strong></span>。</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">STAR&nbsp;阅读能力测评系统</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; line-height: 2; text-align: justify; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">STAR&nbsp;阅读能能力测评系统是经过&nbsp;30&nbsp;多年的研究和数据累积，通过&nbsp;34&nbsp;道多选题，在&nbsp;15-20&nbsp;分钟 内从不同的方面来测试学生的阅读能力。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">同时测评属于自适应性测试，即在测试过程中系统会根据学生的即时表现，自动的有针对性的选择测试题目，比如，如果上一道题目做对则下一道题目会增加难度，做错了则降低难度。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">测评结果从相对全面具体，会从词汇认知和理解，阅读理解，文本分析，作者的修辞写作手法分析理解，文本的分析推理能力等&nbsp;4&nbsp;个方面对学生进行测评，同时比对美国同年级学生平均水平，并给出适合学生阅读的书籍的范围，对家长和老师都有一定的指导意义。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">专业的后台管理系统也可以根据每个学生的不同情况，设定短期和长期目标，通过监控和分析数据掌握学生的学习进程，并提供阅读指导。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 0.5em; margin-bottom: 0.5em; position: static; box-sizing: border-box;\">\n<section style=\"border-width: 0px 0px 1px; border-style: solid; border-bottom-color: rgb(255, 228, 121); font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">AR&nbsp;原版图书阅读理解测试系统 (AR Quiz)</strong></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; font-size: 17px; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">AR&nbsp;原版图书阅读理解测试系统是&nbsp;Renaissance&nbsp;公司根据单本图书开发的，分别有三种类型：Reading Practice (RP), Literacy Skills (LS)&nbsp;和&nbsp;Vocabulary Practice (VP)。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">在完成某本书的阅读 后，孩子可以通过这个系统来测试自己的阅读理解程度。根据测试准确率，阅读的&nbsp;AR&nbsp;积点和单词累计，家长和老师也可以给学生制定一个合理的阅读目标，帮助孩子稳步的提高阅读能力。</p>\n</section>\n</section>\n</section>\n</section>\n\n<p>&nbsp;</p>', 6, 999, '', '', '2018-05-21 05:05:02', '2018-05-23 11:12:06');
INSERT INTO `posts` (`id`, `title`, `block_type`, `body`, `page_id`, `sort_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(13, '关于知慧学院 Athena Academy', 'article', '<section style=\"box-sizing: border-box;\">\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"display: inline-block; vertical-align: top; box-sizing: border-box;\">\n<section style=\"width: 8px; height: 8px; float: left; border-top: 1px solid rgb(255, 228, 121); border-radius: 4px 0px 0px; border-left: 1px solid rgb(255, 228, 121); box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"width: 8px; height: 8px; float: right; border-top: 1px solid rgb(255, 228, 121); border-right: 1px solid rgb(255, 228, 121); border-radius: 0px 4px 0px 0px; box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"clear: both; box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"margin-top: -5px; margin-bottom: -5px; padding-right: 8px; padding-left: 8px; line-height: 1.3; color: rgb(255, 228, 121); font-size: 18px; box-sizing: border-box;\">\n<p style=\"clear: none; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">关于知慧学院</strong></p>\n</section>\n\n<section style=\"width: 8px; height: 8px; float: left; border-bottom: 1px solid rgb(255, 228, 121); border-left: 1px solid rgb(255, 228, 121); border-radius: 0px 0px 0px 4px; box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"width: 8px; height: 8px; float: right; border-bottom: 1px solid rgb(255, 228, 121); border-right: 1px solid rgb(255, 228, 121); border-radius: 0px 0px 4px; box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"clear: both; box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"font-size: 17px; text-align: justify; line-height: 2; letter-spacing: 1px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\">Athena Academy 知慧学院， <span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">以青少儿学术英语全方案为定位</strong></span>，帮助国内5-14岁具有国际视野的青少儿，全面提升学术英语能力，特别是英语阅读和写作能力。知慧学院倡导中国的青少儿<span style=\"color:#ffe479;\"><strong>学会知识，习得智慧</strong></span> &ldquo;Learning to Learn, Learning to Think&rdquo;，并致力为他们搭建一条个性化的K12国际教育成长通路。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">知慧学院的整体课程架构对标 <span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">美国Common Core State Standards课程标准体系</strong></span>，并结合中国学生特点自主研发课程，严选资深母语外教，进行8-10人小班探讨式英语教学。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">目前，知慧学院已经在<span style=\"color:#ffe479;\"><strong>上海</strong></span>、<span style=\"color:#ffe479;\"><strong>深圳</strong></span>、<span style=\"color:#ffe479;\"><strong>杭州</strong></span>、和<span style=\"color:#ffe479;\"><strong>宁波</strong></span>等城市开设了共七个教学点。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"font-size:14px;\"><strong><a href=\"https://mp.weixin.qq.com/s/Twuw906Wrv96GQIWBPZJjA\"><span style=\"color:#2980b9;\">点此联系知慧学院</span></a></strong></span></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"line-height: 2; letter-spacing: 1px; font-size: 17px; box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><span style=\"color:#ffe479;\"><strong style=\"box-sizing: border-box;\">知慧学院的课程主要有：</strong></span></p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">英文阅读启蒙</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">分享式英文阅读</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">专题式英文精读与写作</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">指导式独立阅读</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">夏令营/冬令营</p>\n	</li>\n</ul>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"box-sizing: border-box; text-align: justify;\">知慧学院关注学生的个体发展，为每一位学生设计适合他们的学习计划。</p>\n\n<p style=\"box-sizing: border-box; text-align: justify;\">&nbsp;</p>\n\n<p style=\"box-sizing: border-box; text-align: justify;\">每位学生在入学前均须先接受<span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">权威STAR英文能力级别测试</strong></span>，经由老师确认其个人水平级别后，方可进入对应级别的班级学习。</p>\n\n<p style=\"box-sizing: border-box; text-align: justify;\">&nbsp;</p>\n\n<p style=\"box-sizing: border-box; text-align: justify;\">同时，每阶段学习结束后学生均须接受水平重测，老师将根据学生更新水平级别建议在适应班课继续学习。</p>\n\n<p style=\"box-sizing: border-box;\"><span style=\"font-size:14px;\"><strong><a href=\"http://readathon.athenaca.com/page/about/test\"><span style=\"color:#2980b9;\">点此了解STAR英文测试</span></a></strong></span></p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"display: inline-block; vertical-align: top; box-sizing: border-box;\">\n<section style=\"width: 12px; height: 12px; margin-left: -1px; border-top: 3px solid rgb(255, 228, 121); border-left: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"margin-top: -11px; margin-bottom: -11px; border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding: 4px; box-sizing: border-box;\">\n<section style=\"border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding-left: 6px; padding-right: 6px; font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Guided Independent Reading</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">指导式独立阅读</strong></p>\n</section>\n</section>\n\n<section style=\"width: 12px; height: 12px; margin-left: auto; margin-right: -1px; border-bottom: 3px solid rgb(255, 228, 121); border-right: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; line-height: 2; letter-spacing: 1px; font-size: 17px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/course/IGR-_____________________.jpg\" />知慧学院极具特色的图书馆课程，授课地点设在知慧学院各学习中心的<span style=\"color:#ffe479;\"><strong>原版英文图书馆内</strong></span>。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">图书馆的所有书籍均是知慧学院从全球各大专业出版社、知名书店畅销书、推荐书单中精心挑选并进行严格分级的进口原版书籍，也包含大量欧美经典少儿读物。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">图书馆也会不断新增全球最佳、最新畅销青少儿读物，保证知慧学院图书馆的书籍与全球领先英语分级阅读在内容和质量上的同步。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/IMG_4085.jpg\" /></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"color:#ffe479;\"><strong style=\"box-sizing: border-box;\">图书馆课程采用预约制：</strong></span></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">学生通过提前预约上课时间。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"color:#ffe479;\"><strong style=\"box-sizing: border-box;\">图书馆学习5步骤</strong></span></p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">按预约时间进入图书馆，在适合自己级别的书中挑选自己喜爱的书</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">配合使用字典等方法进行独立阅读</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">读书完成与外教老师进行1对1全英语探讨问答</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">完成与所读书本有关的阅读理解quiz</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">在老师指导下完成book report读书报告</p>\n	</li>\n</ul>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">图书馆课程不仅能锻炼孩子的英语表达交流能力、阅读理解提炼能力，也有助于学生养成独立自主学习的习惯，从独立的阅读者成长为终生的学习者与思考者。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/IMG_4341.jpg\" /></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"display: inline-block; vertical-align: top; box-sizing: border-box;\">\n<section style=\"width: 12px; height: 12px; margin-left: auto; margin-right: -1px; border-top: 3px solid rgb(255, 228, 121); border-right: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"margin-top: -11px; margin-bottom: -11px; border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding: 4px; box-sizing: border-box;\">\n<section style=\"border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding-left: 6px; padding-right: 6px; font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Emerging English</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">英文阅读启蒙</strong></p>\n</section>\n</section>\n\n<section style=\"width: 12px; height: 12px; margin-left: -1px; border-bottom: 3px solid rgb(255, 228, 121); border-left: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; line-height: 2; letter-spacing: 1px; font-size: 17px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/course/EE-__________________.jpg\" />通过系统学习自然拼读规则、常用词(Sight Words)，及结合启蒙绘本阅读练习，打好英语阅读基础、培养英语阅读兴趣、尝试开始进行英文写作。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/DSCF9525.jpg\" /></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"display: inline-block; vertical-align: top; box-sizing: border-box;\">\n<section style=\"width: 12px; height: 12px; margin-left: -1px; border-top: 3px solid rgb(255, 228, 121); border-left: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"margin-top: -11px; margin-bottom: -11px; border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding: 4px; box-sizing: border-box;\">\n<section style=\"border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding-left: 6px; padding-right: 6px; font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Group Guided Reading</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">分享式英文阅读</strong></p>\n</section>\n</section>\n\n<section style=\"width: 12px; height: 12px; margin-left: auto; margin-right: -1px; border-bottom: 3px solid rgb(255, 228, 121); border-right: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; letter-spacing: 1px; line-height: 2; font-size: 17px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/course/GGR_-______________________.jpg\" />使用根据<span style=\"color:#ffe479;\"><strong>美国Common Core State Standards</strong></span>编写，涵盖Fiction和Non-fiction的专业英文分级读物，围绕不同主题进行小组探究式讨论，提升英语阅读理解能力，扩大英语词汇与文法结构的积累。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">同时，通过课上老师的Guided Writing与课后练习，进行基础写作输出训练，为培养学术英文阅读与写作技能打下基础。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/IMG_4211.jpg\" /></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"display: inline-block; vertical-align: top; box-sizing: border-box;\">\n<section style=\"width: 12px; height: 12px; margin-left: auto; margin-right: -1px; border-top: 3px solid rgb(255, 228, 121); border-right: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"margin-top: -11px; margin-bottom: -11px; border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding: 4px; box-sizing: border-box;\">\n<section style=\"border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding-left: 6px; padding-right: 6px; font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Literature, Writing &amp; Projects</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">专题式英文精读与写作</strong></p>\n</section>\n</section>\n\n<section style=\"width: 12px; height: 12px; margin-left: -1px; border-bottom: 3px solid rgb(255, 228, 121); border-left: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; line-height: 2; letter-spacing: 1px; font-size: 17px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/course/LWP-______________________________.jpg\" />对标<span style=\"color:#ffe479;\"><strong>美国 Common Core State Standards课程体系</strong></span>，使用美国学校同步英文教材，强化学习各年级要求掌握的词汇、语法要素和阅读策略技巧，进行不同题材与文体的写作训练，全面强化学术英文阅读力和写作力。</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">同时，更采用 <span style=\"color: rgb(255, 228, 121); box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Project-Based Learning项目式学习法</strong></span>，不仅使阅读写作变得有趣，更培养学生的创造力、批判性思维能力、沟通能力、团队协作能力、项目管理能力和解决问题等软技能。</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/IMG_4330.jpg\" /></p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"display: inline-block; vertical-align: top; box-sizing: border-box;\">\n<section style=\"width: 12px; height: 12px; margin-left: auto; margin-right: -1px; border-top: 3px solid rgb(255, 228, 121); border-right: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n\n<section style=\"margin-top: -11px; margin-bottom: -11px; border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding: 4px; box-sizing: border-box;\">\n<section style=\"border-width: 1px; border-style: solid; border-color: rgb(223, 223, 223); padding-left: 6px; padding-right: 6px; font-size: 18px; color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">Summer/Winter Camp</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">夏令营/冬令营</strong></p>\n</section>\n</section>\n\n<section style=\"width: 12px; height: 12px; margin-left: -1px; border-bottom: 3px solid rgb(255, 228, 121); border-left: 3px solid rgb(255, 228, 121); transform: rotate(0deg); -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -o-transform: rotate(0deg); box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"position: static; box-sizing: border-box;\">\n<section style=\"text-align: justify; line-height: 2; letter-spacing: 1px; font-size: 17px; box-sizing: border-box;\">\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"letter-spacing: 0px; box-sizing: border-box;\"><img alt=\"\" src=\"http://readathon.athenaca.com/photos/1/course/_______________.jpeg\" />在寒暑假，知慧学院将学术英语课程与青少年最需要培养的<span style=\"color:#ffe479;\"><strong>设计思维</strong></span>相结合，引入全球前沿教育领域的创新热点课程；将STEM、戏剧、游戏、电影制作等经典课程完美融入英语学习中，让学生通过观察，调研，问题聚焦，头脑风暴，去发现问题，解决问题，并进行反思。</span></p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"white-space: normal; box-sizing: border-box;\"><span style=\"color:#ffe479;\"><strong style=\"box-sizing: border-box;\"><span style=\"letter-spacing: 0px; box-sizing: border-box;\">这些经典课程包括：</span></strong></span></p>\n\n<ul class=\"list-paddingleft-2\" style=\"\">\n	<li>\n	<p style=\"box-sizing: border-box;\">畅销书俱乐部&nbsp;</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">英语戏剧与艺术创作课&nbsp;</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">动画电影制作课</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">电子游戏设计课</p>\n	</li>\n	<li>\n	<p style=\"box-sizing: border-box;\">等等</p>\n	</li>\n</ul>\n\n<p style=\"box-sizing: border-box;\"><strong><a href=\"https://mp.weixin.qq.com/s?__biz=MzIyNzU4MDM5Mg==&amp;mid=2247484749&amp;idx=1&amp;sn=35ecbe75ad6b1613631ba3068bd27168&amp;chksm=e85e45cadf29ccdc69aad736b42645000d13d74e7b0f7b4aa68f14e28c848b3b41911f1593cc#rd\"><span style=\"color:#3498db;\"><span style=\"font-size:14px;\">点此了解2018年全英文文理通才夏令营</span></span></a></strong></p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; position: static; box-sizing: border-box;\">\n<section style=\"padding: 10px; border-color: rgb(255, 228, 121); border-width: 1px; border-radius: 5px; border-style: dotted; box-sizing: border-box;\">\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"position: static; box-sizing: border-box;\">\n<section style=\"margin-top: 10px; margin-bottom: 10px; text-align: center; position: static; box-sizing: border-box;\">\n<section style=\"padding: 3px; display: inline-block; border-bottom: 1px solid rgb(255, 228, 121); color: rgb(255, 228, 121); box-sizing: border-box;\">\n<p style=\"box-sizing: border-box;\"><span style=\"font-size:14px;\"><strong style=\"box-sizing: border-box;\">Athena Academy 学校地址</strong></span></p>\n</section>\n</section>\n</section>\n\n<section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"box-sizing: border-box;\">\n<section style=\"margin: 10px 0%; position: static; box-sizing: border-box;\">\n<section style=\"color: rgb(255, 255, 255); line-height: 1.6; letter-spacing: 1px; padding-right: 10px; padding-left: 10px; box-sizing: border-box;\">\n<p style=\"text-align: center; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">上海</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">静安校区：</strong>上海市静安区延安西路200号2号楼3楼</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">电话：</strong>021-5290 2038 / 156 1831 5229</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">松江校区：</strong>上海市松江区茸北路336号</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">电话：</strong> <span style=\"box-sizing: border-box;\">186 1626 3592 /&nbsp;</span> <span style=\"box-sizing: border-box;\">186 1635 4636</span></p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"text-align: center; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">深圳</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">华侨城校区：</strong>深圳南山区侨城东路99号深南电路三楼302</p>\n\n<p style=\"box-sizing: border-box;\">电话：0755-2690 7064 / 186 6596 5902</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">海上世界校区：</strong>深圳南山蛇口海上世界A区3号楼2楼</p>\n\n<p style=\"box-sizing: border-box;\">电话：0755-2690 7064 / 180 2765 4150</p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"text-align: center; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">杭州</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">地址：</strong>杭州市西湖区古墩路413号文新图书大楼3楼</p>\n\n<p style=\"box-sizing: border-box;\">&nbsp; &nbsp; &nbsp; 杭州市文一西路532号绿城育华小学图书馆2楼&nbsp;</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">电话：</strong>0571-87698331 / 159 6719 5371</p>\n\n<p style=\"box-sizing: border-box;\">&nbsp;</p>\n\n<p style=\"text-align: center; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">宁波</strong></p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">海曙校区：</strong>宁波市海曙区解放南路10号&nbsp;</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">电话：</strong>0574-5522 9530 / 158 6958 1041</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">鄞州校区：</strong>宁波市鄞州区邱隘盛莫北路505号</p>\n\n<p style=\"box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">电话：</strong>0574-5584 2106 / 182 6746 5342</p>\n</section>\n</section>\n</section>\n</section>\n\n<section style=\"width: 100%; text-align: right; margin-top: -4px; box-sizing: border-box;\">\n<section style=\"width: 50px; height: 4px; background-color: rgb(255, 228, 121); box-sizing: border-box;\">&nbsp;</section>\n</section>\n</section>\n</section>\n</section>\n\n<p>&nbsp;</p>', 7, 999, '', '', '2018-05-21 05:06:59', '2018-05-23 03:42:58'),
(14, '阅读马拉松', 'slides', '', 3, 999, '/photos/1/kv-01.png', '', '2018-05-21 05:08:19', '2018-05-21 05:08:19'),
(15, '奖品1', 'slides', '', 5, 1, '/photos/1/kv2018052201.png', 'http://readathon.athenaca.com/page/prize/1', '2018-05-21 09:38:11', '2018-05-22 15:02:08'),
(17, '预约测试', 'slides', '', 6, 999, '/photos/1/kv-01.png', '', '2018-05-23 11:10:43', '2018-05-23 11:10:43'),
(18, 'AthenaAcademy', 'slides', '', 7, 999, '/photos/1/kv-01.png', '', '2018-05-23 11:10:59', '2018-05-23 11:10:59');

-- --------------------------------------------------------

--
-- 表的结构 `prizes`
--

CREATE TABLE `prizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winning_min_rank` int(10) UNSIGNED NOT NULL,
  `winning_max_rank` int(10) UNSIGNED NOT NULL,
  `winned_number` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `sort_id` int(10) UNSIGNED NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `prizes`
--

INSERT INTO `prizes` (`id`, `name`, `winning_min_rank`, `winning_max_rank`, `winned_number`, `body`, `activity_id`, `sort_id`, `created_at`, `updated_at`) VALUES
(2, '第三名', 3, 3, 0, '<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"color:#1abc9c;\"><strong>Kindle (paper white) - 价值958元</strong></span></span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"color:#1abc9c;\"><strong>1000元常规课程抵用券</strong></span></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"font-size:14px;\">1000元抵用券可以用于超过1万元以上的常规课抵扣</span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s/j3zkCZife2wZycz43l_Wtw\"><span style=\"color:#3498db;\">点此了解知慧学院课程</span></a></span></p>\n\n<p><span style=\"font-size:12px;\">* 所有课程抵用券有效期至2018年8月31日。仅适用于上海/深圳/杭州/宁波的参赛者。课程抵用券不能和其他优惠叠加使用，可向知慧学院申请转让。</span></p>\n\n<p><span style=\"font-size:12px;\">* 在线领奖后请联系您最近的知慧学院教学中心，领取和核销奖品。所有奖品不兑换现金。</span></p>\n\n<p><span style=\"font-size:12px;\">* 知慧学院有权对所有参赛者提交的阅读记录做进一步核实。如有任何虚假行为，知慧学院有权取消参赛权，并要求归还奖品，更可要求赔偿。</span></p>', 2, 3, '2018-05-01 16:00:00', '2018-05-24 04:09:49'),
(5, '第一名', 1, 1, 0, '<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"color:#1abc9c;\"><strong>2018全英文未来通才夏令营 - 10日全天营</strong></span></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"font-size:14px;\">如果已经报名同类型夏令营，可以保留名额至冬令营，或补差额升级更多天数的营期</span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><strong><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s?__biz=MzIyNzU4MDM5Mg==&amp;mid=2247484749&amp;idx=1&amp;sn=35ecbe75ad6b1613631ba3068bd27168&amp;chksm=e85e45cadf29ccdc69aad736b42645000d13d74e7b0f7b4aa68f14e28c848b3b41911f1593cc#rd\"><span style=\"color:#3498db;\">点此了解未来通才夏令营信息</span></a></span></strong></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><strong><span style=\"color:#1abc9c;\">2000元常规课程抵用券</span></strong></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"font-size:14px;\">2000元抵用券可以用于超过1万元以上的常规课抵扣</span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><strong><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s/j3zkCZife2wZycz43l_Wtw\"><span style=\"color:#3498db;\">点此了解知慧学院课程</span></a></span></strong></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:12px;\">* 所有课程抵用券有效期至2018年8月31日。仅适用于上海/深圳/杭州/宁波的参赛者。课程抵用券不能和其他优惠叠加使用，可向知慧学院申请转让。</span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:12px;\">* 在线领奖后请联系您最近的知慧学院教学中心，领取和核销奖品。所有奖品不兑换现金。</span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:12px;\">* 知慧学院有权对所有参赛者提交的阅读记录做进一步核实。如有任何虚假行为，知慧学院有权取消参赛权，并要求归还奖品，更可要求赔偿。</span></p>', 2, 1, '2018-05-22 06:59:24', '2018-05-24 04:09:22'),
(6, '第二名', 2, 2, 0, '<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"color:#1abc9c;\"><strong>2018全英文未来通才夏令营 - 5日全天营</strong></span></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"font-size:14px;\">如果已经报名同类型夏令营，可以保留名额至冬令营，或补差额升级更多天数的营期</span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><strong><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s?__biz=MzIyNzU4MDM5Mg==&amp;mid=2247484749&amp;idx=1&amp;sn=35ecbe75ad6b1613631ba3068bd27168&amp;chksm=e85e45cadf29ccdc69aad736b42645000d13d74e7b0f7b4aa68f14e28c848b3b41911f1593cc#rd\"><span style=\"color:#3498db;\">点此了解未来通才夏令营信息</span></a></span></strong></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><strong><span style=\"color:#1abc9c;\">1500元常规课程抵用券</span></strong></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"font-size:14px;\">1500元抵用券可以用于超过1万元以上的常规课抵扣</span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><strong><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s/j3zkCZife2wZycz43l_Wtw\"><span style=\"color:#3498db;\">点此了解知慧学院课程</span></a></span></strong></p>\n\n<p><span style=\"font-size:12px;\">* 所有课程抵用券有效期至2018年8月31日。仅适用于上海/深圳/杭州/宁波的参赛者。课程抵用券不能和其他优惠叠加使用，可向知慧学院申请转让。</span></p>\n\n<p><span style=\"font-size:12px;\">* 在线领奖后请联系您最近的知慧学院教学中心，领取和核销奖品。所有奖品不兑换现金。</span></p>\n\n<p><span style=\"font-size:12px;\">* 知慧学院有权对所有参赛者提交的阅读记录做进一步核实。如有任何虚假行为，知慧学院有权取消参赛权，并要求归还奖品，更可要求赔偿。</span></p>', 2, 2, '2018-05-22 07:00:59', '2018-05-24 04:09:37'),
(8, '第四名 ～ 第十名', 4, 10, 0, '<p><font color=\"#1abc9c\"><span style=\"caret-color: rgb(26, 188, 156); font-size: 14px;\"><b>知慧学院全英文图书馆月卡</b></span></font></p>\n\n<ul>\n	<li><span style=\"font-size:14px;\">在有效时间内不限阅读次数</span></li>\n	<li><span style=\"font-size: 14px;\">仅限在中心图书馆内阅读，图书暂不外借</span></li>\n</ul>\n\n<p><span style=\"font-size:14px;\"><strong><span style=\"color:#1abc9c;\">500元常规课程抵用券</span></strong></span></p>\n\n<ul>\n	<li><span style=\"font-size:14px;\">500元抵用券可以用于超过5000元以上的任何课程抵扣</span></li>\n</ul>\n\n<p><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s/j3zkCZife2wZycz43l_Wtw\">点此了解知慧学院课程</a></span></p>\n\n<p><span style=\"font-size:12px;\">* 所有课程抵用券有效期至2018年8月31日。仅适用于上海/深圳/杭州/宁波的参赛者。课程抵用券不能和其他优惠叠加使用，可向知慧学院申请转让。</span></p>\n\n<p><span style=\"font-size:12px;\">* 在线领奖后请联系您最近的知慧学院教学中心，领取和核销奖品。所有奖品不兑换现金。</span></p>\n\n<p><span style=\"font-size:12px;\">* 知慧学院有权对所有参赛者提交的阅读记录做进一步核实。如有任何虚假行为，知慧学院有权取消参赛权，并要求归还奖品，更可要求赔偿。</span></p>', 2, 4, '2018-05-22 07:15:42', '2018-05-24 04:10:02'),
(9, '小小阅读家奖', 11, 10000, 0, '<p style=\"text-align: center;\"><span style=\"color:null;\"><strong><span style=\"font-size:14px;\">（所有参赛者都可领取）</span></strong></span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"color:#1abc9c;\"><strong>知慧学院全英文图书馆一对一全外教课程1次 </strong></span></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"color:null;\"><span style=\"font-size:14px;\">若已经是图书馆会员，则增加一次课程</span></span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"color:#1abc9c;\"><strong>500元常规课程抵用券</strong></span></span></p>\n\n<ul>\n	<li style=\"text-align: justify;\"><span style=\"font-size:14px;\">500元抵用券可以用于超过5000元以上的所有课程抵扣</span></li>\n</ul>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:12px;\"><a href=\"https://mp.weixin.qq.com/s/j3zkCZife2wZycz43l_Wtw\">点此了解知慧学院课程</a></span></p>\n\n<p><span style=\"font-size:12px;\">* 所有课程抵用券有效期至2018年8月31日。仅适用于上海/深圳/杭州/宁波的参赛者。课程抵用券不能和其他优惠叠加使用，可向知慧学院申请转让。</span></p>\n\n<p><span style=\"font-size:12px;\">* 在线领奖后请联系您最近的知慧学院教学中心，领取和核销奖品。所有奖品不兑换现金。</span></p>\n\n<p><span style=\"font-size:12px;\">* 知慧学院有权对所有参赛者提交的阅读记录做进一步核实。如有任何虚假行为，知慧学院有权取消参赛权，并要求归还奖品，更可要求赔偿。</span></p>', 2, 999, '2018-05-22 07:18:25', '2018-05-24 04:10:18');

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
(1, 1, 1, 2, 3, 0, '2018-05-07 19:05:15', '2018-05-07 19:05:15'),
(2, 1, 75, 5, 3, 0, '2018-05-07 19:05:15', '2018-05-07 19:05:15'),
(3, 2, 75, 5, 3, 0, '2018-05-07 19:05:15', '2018-05-24 06:17:27');

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
  `user_id` int(10) UNSIGNED NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT '0',
  `answered_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `question_logs`
--

INSERT INTO `question_logs` (`question_id`, `user_id`, `is_right`, `answered_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2018-05-07 19:25:30', '2018-05-07 19:25:30'),
(1, 2, 1, 2, '2018-05-22 03:49:40', '2018-05-22 03:49:40'),
(1, 75, 0, 1, '2018-05-14 07:46:29', '2018-05-14 07:46:29'),
(1, 78, 0, 1, '2018-05-14 07:50:21', '2018-05-14 07:50:21'),
(1, 84, 1, 2, '2018-05-22 07:30:18', '2018-05-22 07:30:18'),
(1, 92, 1, 2, '2018-05-23 11:39:15', '2018-05-23 11:39:15');

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
(41, 'Harry', 2, 1, 100, '2018-05-14 03:18:29', '2018-05-14 03:18:29'),
(42, 'Harry Potter', 2, 75, 100, '2018-05-14 06:24:26', '2018-05-14 06:24:26'),
(43, 'Harry', 2, 78, 100, '2018-05-14 06:54:23', '2018-05-14 06:54:23'),
(44, 'Abc', 2, 75, 100, '2018-05-14 07:37:16', '2018-05-14 07:37:16'),
(45, 'Qwe', 2, 75, 100, '2018-05-14 07:37:27', '2018-05-14 07:37:27'),
(46, 'Shb', 2, 75, 1824, '2018-05-14 07:37:37', '2018-05-14 07:37:37'),
(47, 'Hdh', 2, 75, 112, '2018-05-14 07:37:51', '2018-05-14 07:37:51'),
(48, 'Gg', 2, 75, 22, '2018-05-14 07:44:40', '2018-05-14 07:44:40'),
(49, 'Hhh', 2, 75, 334, '2018-05-14 07:44:49', '2018-05-14 07:44:49'),
(50, 'gggg', 2, 75, 233, '2018-05-14 07:44:59', '2018-05-14 07:44:59'),
(51, 'Hggg', 2, 75, 566, '2018-05-14 07:45:04', '2018-05-14 07:45:04'),
(52, 'Yuh', 2, 75, 567, '2018-05-14 07:45:10', '2018-05-14 07:45:10'),
(53, 'Harry Potter the half blood prince', 2, 75, 10000, '2018-05-16 03:37:10', '2018-05-16 03:37:10'),
(54, 'Sherlock', 2, 75, 10000, '2018-05-18 07:09:40', '2018-05-18 07:09:40'),
(55, 'Big bus', 2, 84, 10, '2018-05-21 05:11:35', '2018-05-21 05:11:35'),
(56, 'Harry Potter', 2, 84, 100, '2018-05-21 06:09:31', '2018-05-21 06:09:31'),
(57, 'Harry', 2, 85, 100, '2018-05-21 06:18:42', '2018-05-21 06:18:42'),
(58, 'National Geography', 2, 84, 100, '2018-05-22 03:12:13', '2018-05-22 03:12:13'),
(59, 'Big', 2, 80, 10, '2018-05-22 03:15:45', '2018-05-22 03:15:45'),
(60, 'Myth', 2, 84, 500, '2018-05-22 16:06:30', '2018-05-22 16:06:30'),
(61, 'Beauty and beast', 2, 92, 100, '2018-05-23 03:44:41', '2018-05-23 03:44:41'),
(62, 'The little prince', 2, 84, 1000, '2018-05-23 11:37:14', '2018-05-23 11:37:14'),
(63, 'The wonderful wizard of oz', 2, 84, 1000, '2018-05-23 11:37:28', '2018-05-23 11:37:28'),
(64, 'The biggest pumpkin', 2, 91, 985, '2018-05-24 06:36:26', '2018-05-24 06:36:26');

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
-- 表的结构 `school_districts`
--

CREATE TABLE `school_districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `school_districts`
--

INSERT INTO `school_districts` (`id`, `name`, `city_id`) VALUES
(1, '上海静安校区', 1),
(2, '上海松江校区', 1),
(3, '杭州文新校区', 2),
(4, '深圳华侨城校区', 3),
(5, '深圳海上世界校区', 3),
(6, '宁波海曙校区', 4),
(7, '宁波鄞州校区', 4),
(8, '其他', 5);

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
  `school_district_id` int(10) UNSIGNED DEFAULT NULL,
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

INSERT INTO `users` (`id`, `name`, `birthdate`, `openid`, `nickname`, `avatar`, `city_id`, `school_district_id`, `tel`, `is_reading`, `sex`, `ge`, `invite_id`, `is_activated`, `created_at`, `updated_at`) VALUES
(1, '小A', '2010-01-01', 'oJ_0JwkVa8mHBSQ1CDeCTkVqncwE', '小A', 'http://wx.qlogo.cn/mmopen/vi_32/Va2CgZbPaKHeZLqk5VOyAscvSQ5CGWicNTQ5icwicb53v1Lk5LLfibk1682pGt30VJTwl6jsuVwDqBdtGdR1arc8xw/0', 1, NULL, '15618892632', 1, '1', NULL, NULL, 1, '2018-04-22 15:20:22', '2018-05-03 20:04:42'),
(2, 'AA', NULL, 'oHfDAwRL_X6nVuFYTlxi2LDz-Nm0', 'AA', 'http://readathon.athenaca.com/storage/avatars/2.jpg?_=1527015275', 1, NULL, '15618892632', 0, '0', NULL, NULL, 1, NULL, '2018-05-22 18:54:38'),
(3, '大A', NULL, 'oHfDAwRI9lv_vsW_xeZSBa_PKM7A', '大A', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKG0SkhqIsVeXk457v96DZSHpmIzRYtQLU7rrXEb4FfiauOqALvHeFpUgEYl4vLIAic9c31vbnQA5nA/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(4, 'costa', NULL, 'oHfDAwdQoFvNFt4KISTds-sLTeJ8', 'costa', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX7ibUnibz0W72QW6zO5zmFwIv6VA3kkqe2ibYXpzRDGI0S5pSngY94CbiauHAE8y62jutQv7o2wsnFf6/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(5, NULL, '2011-01-01', 'oHfDAwRT2E95o-w2XfSFgIqa1fzU', '喜喜Xu', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI548pJiclHXYGtMdHEvg457DJhQzeGmyMQiaUGicyfIYhnSmzOd4fU0RePiajCcQG8SIpw7XFK22FyyZ03/0', NULL, NULL, NULL, 0, '2', NULL, NULL, 0, NULL, '2018-05-13 06:29:48'),
(6, '范范（carol)', NULL, 'oHfDAwXz1SC2-5pTj5MkoT7B6R0c', '范范（carol)', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI543v2TtPSsZZ0gUnd7UevD8ZQdp0ia6f4kghWNJgvuiaavPlvIxRutlDicSpHI77jBTt6nicrsZxibmGTib/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(7, '枫桥', NULL, 'oHfDAwTFYhV7wCaYGgjfdqoQ3M7U', '枫桥', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXibPYj1wsnj85foZgibt4HAF2E8P7MwYVM13C2bibxJVmDlIgl3n1wSV1zj8enbbkO2dRNbLHzXGFRS/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(8, '袁老实', NULL, 'oHfDAwaWmxraqT90F0AAdZgkVd8M', '袁老实', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI540A7HQQwa063Ze6Kiass3ra2oNIpsMqHStIvOYltfoGvQcY3m0okHiarJtQQfapbZVniaKrl4Gaqf6T/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(9, '大莹🎏', NULL, 'oHfDAwQkTAdQ_LN0Fm7qsFz6y3NQ', '大莹🎏', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDTmwQFbb8r5gYulMicYenG3W50ibWx9CxRrUJM70O0gicjXNU69nKJMGSyeaqjRBM27Fabibu4cwJiaZA/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(10, 'Abel曹国献', NULL, 'oHfDAwdOKha4HjSOZD9DaZAFvMn0', 'Abel曹国献', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX7Shg7F0VKURwh5Zhz0XtxlvVhxGROIGd2SUibIvW6gRy4z6iaUn4O3IRwgNxdyCr5icnFibWX1hQpRh/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(11, 'Yang', NULL, 'oHfDAweAabBjxZPyBwiAndJsr3Cg', 'Yang', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkbQcTc6N3ibA3LkqGpdtUPgfzFuYhTlw8Xr4iaCv0CwLpGkF8Ntn7QWtl1HwmjmBCMw7SQL8o1b49W/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(12, '王翔', NULL, 'oHfDAwbl6_Ecupfv3qL_Hyn3-U6M', '王翔', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXibLTJUu0aRveCVDF2JoO2BNeRa93OrN3CXX2oqjopGynPBTaO8BKbdapZUQKe7P5oViatPvR2MO5p/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(13, '周春健', NULL, 'oHfDAwanzxZuWwtbEbxdYrO9QWVU', '周春健', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M195ZPxV4MMMFpbnHWyaNu9KC7Jxqic0CLXA1KulQYEib1TC56ZYaM1oFKiaTSZyIUoBh9qZRRRicop8g/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(14, '海涛', NULL, 'oHfDAwcbIJzK1VNFBxDO0e_zGdP0', '海涛', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4usricOMBfC2eXVBFvibvHSTuNsfeDzUeNOTh30WhQCq5IfYEyqsMcQFcdphalx095EgEW6b7G96ufr/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(15, 'Sky', NULL, 'oHfDAwXZHkV3cz_-wa_ld57zq6VA', 'Sky', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBEtZ1qAXt3XQicYFCOPL5ykZF4Khzv0Ae19kBicCIHMhfb59L9ELicvf3ibE5XhXQWibRWyhB6F4N7wcw/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(16, 'Jessica aus 南徐大道', NULL, 'oHfDAwb79gz7J2vKx3CRbzIX4CRQ', 'Jessica aus 南徐大道', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfZ9gDib8PQCjmWH6viaNKjWG9OYdmMOwAOasRGd2DpMWFUHMpmHZTaia7mlGvUEUzsia0EODVdgYVPic3/0', 1, NULL, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(17, '小林子', NULL, 'oHfDAwW_b6kCQm_vZQ0iLljrd-p8', '小林子', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX2aLSZ4l1MvtE5MA2kRuVcuXyyb7AbtX1GrkCKluE00vTK81HC8ZEdK6Ik84cXjBbbrAzaE1UuMM/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(18, 'Gloria', NULL, 'oHfDAwZDYvsDauT-KANQrEhdbnS8', 'Gloria', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKlrwqEnTYSM0IezZDkrQsabkmg1ialmhV0EI8LICV4G0p4nj8dR7v986mEhIH2lrm3icQQFYqJLqzA/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(19, 'ahaqian', NULL, 'oHfDAwVaLGAyHH3_l-rqc15qt7IQ', 'ahaqian', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI543XXB5KchBrmrr9eZp9prnibUYXlNBcuAFEGic9a6yD5TqDPGIMlDcvKIn7tk445JmEZqA7G691rPt/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(20, '朱平礼^ω^', NULL, 'oHfDAwYSE9DhK5y4huPgWjYROVoM', '朱平礼^ω^', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkV5y7yPhKP7QNVoBzBKjNva4hfVSSsOLeMrVIfEhKVwEAulpanacRyvXrY6PExtXcFQxhiaOd1fNh/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(21, 'Huaxiaren', NULL, 'oHfDAwVBxpXJhf9aU7aWNEAMPRQQ', 'Huaxiaren', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXy96kfiaRXq3dYiaWXYJ0QiaLvJOlKFXtLzoNwzx4WIvcZ5QoiaW0nPzwu9LJqdibBCex2n0AIjRG3icBW/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(22, '甘伟彪', '2017-12-05', 'oHfDAwXb7ddWgUC2zpGcgDBVp7hc', '甘伟彪', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX0t7oLnOXn99OtcSQe5XvkLhLxVwjLYYOC51tRTTtDkC2DUz2VwbeysuuQMb21GEJIUL7lLiclPb1/0', 1, NULL, '15618892632', 1, '1', NULL, NULL, 1, NULL, '2018-05-06 15:44:51'),
(23, 'sharon', NULL, 'oHfDAwZVoqe4Y9UV5KlD3Ba5k5Pk', 'sharon', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4uqHIb06s9rj1mm99o8IPUKrSDgfKXSeJFlhm142nGGAicmu1SV3Ku7S4wLr7Wd2uPB5mVr5RPuqld/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(24, '婧婧陀啦！p', NULL, 'oHfDAwda4A3oQDdNRNF4Qzj2JKdw', '婧婧陀啦！p', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKCu8148iaZv1RhfibjlXcf2rF3icex9ibgibxadL7N7EicNQKeOFnUJiaicjyt4va9Ax8Ne0N0FtM3HGNiabA/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(25, '黄啸', NULL, 'oHfDAwWMXJ6bEIQjp5S2QBIy0VEI', '黄啸', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkeiaeANj4rRibhT4u9aibYBcyV1dx768CfFSee1Ngy5qTAtRLdICiaQceSBm6fFf5jy5WiaZebpHmG0UA/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(26, 'Michael', NULL, 'oHfDAwcj0A1kd5UWdYpDNC3NBcRM', 'Michael', '/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(27, 'Kevin', NULL, 'oHfDAwYu2EBvdFq6JdvlMf5IhZyg', 'Kevin', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4ukicVD9hiaQSxWz6jtsaNggtRo0u0lNbbG7lQIexSWGh7YziaZKs7bPPTic4TcAGKjJvYwLn8wxlsbcl/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(28, '超级马超', NULL, 'oHfDAwf5mgmXgms12tim8xWL7fJE', '超级马超', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6l6JxdECL9sN3v93KSS0H1f8UmOpqsR7cl2lLSJmV5n16fSbgXE9QaHUibfogHg3IIAhYxL5Orgt7BDMw2XeNicZa/0', 1, NULL, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(29, '娜', NULL, 'oHfDAwTzboUuKdnWsQzRFSiIlzfQ', '娜', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M15NsDiavrS6tZIqic4b23lmppEUzHxeLK1AW8WCpgENaGFKvkaE1SOxOiaerCmSodt59zADp06A2ZhQ/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(30, '奈么僵忒勒', NULL, 'oHfDAwaLZiPTVZXYUx66Jxp1aFPs', '奈么僵忒勒', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkZIhf3yxicGtvBQ4FmRibbCHX0zFlpoqnUrvo3186LXgPYSxLC129WlicWjtTtAvOwibsjLtClfvB1Tj/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(31, '我的', NULL, 'oHfDAwV8Jxt8zR3C2WNmvZ8zbGsQ', '我的', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL4tq41xh3awiacosEibGeJjgVY9DPFVm2WVQd6qc8Kj2ibicG2ZRf5rS5CccgEvthoEAopIjj9UEo0Qw/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(32, '姚丽丹_Daniela', NULL, 'oHfDAwbrHhVLqvz-gVk5RDAwDc_Y', '姚丽丹_Daniela', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4uvrrLscxZcOOichyU1Y93PU0LRKSKJEItY0MbtRGzeXhz4nIYKbgiar9xibpcXyw0eA5Oq5MibzJQGvU/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(33, '墨轩', NULL, 'oHfDAwd4i_3TO5kn2Mv7VTQAsLBE', '墨轩', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK1lYmibqzEjexRzdqPhc01k2RPMuW1CzOMZf6Ajv0taF2LElc2Z2VSonFpkHQtyA8MjQguPpkZgxQ/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(34, '家穷人丑', NULL, 'oHfDAwVB5iyWuL-A1aqUYJzRZr3c', '家穷人丑', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkYJOce1HSGJlVJbLBq5b7S5tHFCHW6FQRDH9Vw40yaKatGgiaGFvC9icRpsn1WCF3YZ86wly2KWy0m/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(35, '唐珺', NULL, 'oHfDAwQay-plJ9F4g_cna6r6sPXE', '唐珺', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6nPg2GrOr8MTwFOurrAngfqJcwHjddI2mmoWQykt6wibMBEND0efpKZWPWwCNxAc8S3oib5E1NANkHhHOX4VO9eB6/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(36, 'Sunnie', NULL, 'oHfDAwTOUXha358dSOa5xuUoNzYY', 'Sunnie', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN57KVIjt1kgCYvCTZmeicpGFY0r03jrrIx8U0icZZU7CiavmN4DcD445ZxzVRsJBLYVzicWlvwpEs5HwlKLh0libzenyj/0', 1, NULL, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(37, '涵孝', NULL, 'oHfDAwa1yTLHNBVXw5AErNPly-xU', '涵孝', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN56O1HgzNVlT24tXYJorLulWicg2NJ9rJhQu3nyOaCXTsaTesr9qJhVRsribHf1zbvib7JFBaibC8zdYlQ/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(38, '魔', NULL, 'oHfDAwbL3vCaLM1JKo61NmeGnOGs', '魔', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJepryUKH8QoKPBuwchzSMyFRp8AUJ0sibLhfbtjjjPk4icRAYECARUcojo8b7X7UGibPHDI9hf6dZ8g/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(39, '王之琦', NULL, 'oHfDAwQNpWN2rWKXAuGZ6bymcNa0', '王之琦', '/0', 1, NULL, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(40, '风', NULL, 'oHfDAwaNRePd7jpkTkOTxEf-Jh1c', '风', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkRHrVSwhIicy7pia2Euz85icMUCwaTXDgs2KicIsOGUgDQ8Uf7NmdBXgUj7diaepDNP5LGuja6pyDzQeF/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(41, '灵验', NULL, 'oHfDAwdDpLvxMx8SrI8GNkhZzdsA', '灵验', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI540g2j6MceAoUmQiaKaJV6wq5WtDb6aCsbHDgSrbOTlvnDKfj91xibRjIiaMxYdOibm7icTticA73dqYr5T/0', 1, NULL, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(42, '黑猫警长', NULL, 'oHfDAwcxG_n8BX9_Z1qo-kjz5tMU', '黑猫警长', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bx3oDf8EeVEzI61cjRrQIicYbt1UUL5ZFic920Epz4iaJLp2AuspOKvh5MnFhmdgYOjwyLnEcWpLHnXg/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(43, 'Vicky', NULL, 'oHfDAwRSathLAnCHWWrSZW76JpJ0', 'Vicky', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX8RpHhmP7ibjkQgX5YIdgZWlePYhdct6ribvra3KxuJfzzia7icqBZWmg2bL5IefYQZric72vWdysRcGj/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(44, '丁鹏飞', NULL, 'oHfDAwY3nNH-ABWg3JprS2U7qjiI', '丁鹏飞', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB0rmpgz4zKQZ9WCNiaiaarTcA4sAWrib37IUwibzhMDwn6qdOnicejp8XhLMPnA9nrM1IGEyJWXia3OAWQ/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(45, '强', NULL, 'oHfDAwTA7zNYCqxCdEsD8qfo2yQE', '强', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkRiaAsjwiav3AwWQTtXALTQzhC6931mjfVhlfYFwibZYiafRDS4C3lkMJyd5RlibuOOoxPsbywABEEIVk/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(46, 'fancy', NULL, 'oHfDAwYr5uzfPw_IpjkFo7v4G1SE', 'fancy', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM78muGF4k9cvVleEpTeU2NrjeECHD9qeUPf5LxXYNC40T1icGWdPfUgl1OqbjAFmUcoNEiarfZnicAXcSXibHa4gIiaRmf28w2pRBW4/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(47, '磊', NULL, 'oHfDAwS3HTebhcZmqJAmiWSWk4WQ', '磊', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkXibtReo0NVUofogibOU47PibjRgtKDiakhJ6Mmfu6FgBg63KHldavaciaaMkzTvehwYuxaH3iaYjTQsznI/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(48, '乐林', NULL, 'oHfDAwQnbDusPzGQY7rZHTeahZRo', '乐林', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEInPS1PiapxNTYjTzHQe53EbsOCYpMZbelib3jzDPkJFfVlM28twRNQh7kCSzj57MWNWeicNHk5AZBZA/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(49, '王书元', NULL, 'oHfDAwac4Wb6WI5nbHXkFjONz-Ac', '王书元', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDn5rSKndiawdsPj9bUAOYskBUJSWNEaYGUezJBicIhKaFd2vaUu1e4J20NU2PIuOribkKlZ3qFkXhJA/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(50, '🏀浩天', NULL, 'oHfDAwX9xpB4_lWBIkFQrw5XXG9I', '🏀浩天', 'http://wx.qlogo.cn/mmopen/5PgiagjhLntSm99k9jIqBkdgAhkXJov4pk6HStEZYic4zDBWEf12egU7ErNoG0ladCEVPmHDiaxu6yILFBdkHrbq4r8qialyT6ku/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(51, '叮叮', NULL, 'oHfDAwZmKhrr8IiQsSEq8K6-wLb4', '叮叮', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELic7EmJjCcuckmibuOa5HICRGUhOyc94xHINyjicY3fUnKuwJz1rwEZMRq179SDh1a93UjfibzkMfDOQ/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(52, '李天灏 Benjamin', NULL, 'oHfDAwTPmORU3VKkf1b7SrCPbebg', '李天灏 Benjamin', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJSibjyftZWCShWdHngQZXWrouw7v2Xyvdia2untoBR3NbF66N1b4IN4qfhW2icSicP8WfCJeUub6wTWg/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(53, '对号入座', NULL, 'oHfDAwQULoTHWLSmblaYWKhvK_2I', '对号入座', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX79SWuVhIfoWsg4rbnjXricKbWSKobP4Z3e5JaMAVXwvDbCWEs6VyQn4gW53D8VticLIMA4HfaibsIw/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(54, '吕松良', NULL, 'oHfDAwQHoneCWyy8iG6y2aWVGbLE', '吕松良', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6nrGSXiaiaTV36apl09fGiaeYqQCajicIcneLeFw9bGq4GvsRL0HwxzX7K1pNQdACK4lPk5V3Oib1mgapvOiawKVzDibTc/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(55, 'fisher', NULL, 'oHfDAwb7tViD2KQF8zjL4UoZ-LxU', 'fisher', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN552jT95sXI54ibJVAkRPwH4jCzT4rLwcyu26YhjCtVcFibrP5Z8bgiathQ4iakMfITE1OPp7EPYssq79e41JZq3XyoV/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(56, 'A\\  宜信贷款の周文琴💋', NULL, 'oHfDAwf5SLkLrsBUNKzoG7Nq1WGw', 'A\\  宜信贷款の周文琴💋', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4upUibbRIV5b6RwUanU2KEotOGKOJwkJL6ID380cpyyY8jl6V0QmJEsOsBsdiaf8g2tAnbJThBaVnHE/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(57, '葛轶君', NULL, 'oHfDAwSies5qWrJDQhei0xIIr9k0', '葛轶君', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX1PmmqWhpL5FSl8U88OiaibCTQtlszoqJMh4tQ0DWdgKnUicJzYS0fUStrEqWuK94eiaGhnZZNMsFRtt/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(58, '小鹿', NULL, 'oHfDAwVqvj17MOZJoLDTW3yK-kxk', '小鹿', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJJxLEc8ibgwWgjcHASu1m0gONDOKnzKWRy6lSDYXV7pk16ctSefkBIvfaricNczRuyIM6EOVspyAxA/0', 1, NULL, '', 0, '0', NULL, NULL, 1, NULL, NULL),
(59, '马子虬', NULL, 'oHfDAwcUQ683VyiMgErIPJutzRv0', '马子虬', 'http://wx.qlogo.cn/mmopen/4TmuRQAgN548ibgNG9MamaR3KqZfN3ggCZGznHnic0gVJDQ3e0xvLw8bDeykBWMdqg9UAhZldkAMBa8MSnSbdY5gcyBbnHhwaA/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(60, 'Jay', NULL, 'oHfDAwZfSFEy7_ufaudKD4T3eczs', 'Jay', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX0TUr9Ndqkc6ic44zEYQ5lbwtfvB0AFK2Yg0ytrW52EQNmoUCDSGNfqhhlxamIqEfS94uzE231SFE/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(61, 'Jessie的老王子', NULL, 'oHfDAwatA_csHgcgGRXyGHGRSvhM', 'Jessie的老王子', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfR7UAsNWpdibulXjXKEsQ2hT6qgicsPr61jucMUIGic1M109HXWKOG9Lnh5iaIzNuMQcS4sPcFbmZOHH/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(62, '韦亚军Carola', NULL, 'oHfDAwVCVJszxxuniEJaRd90DgZs', '韦亚军Carola', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M2m5ptlMeYuzeqaVDtFQFFNTJbLaLiclNxiciasvVZ0ibcs4ufxIbDeYiaibKOq8PKMJFyohms6WMfUYLJg/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(63, '一望无际', NULL, 'oHfDAwfMXBZ1ZhY5MBLCL4fMfUM4', '一望无际', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5OVrIS7ByjFiar8uqxPEUYt0cb6NibuhYibsODhgWQLnl9TjcWAoFOviaceFsaP2aJNia33D8mD3IhaLqibicwYT4qvOoVKB6dv2EKAQ/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(64, '周元欣', NULL, 'oHfDAweTay0QbhvciobGua_rtdsA', '周元欣', 'http://wx.qlogo.cn/mmopen/EjB59MCR1By9t3V0EH4UlvdZcl0vAh7fYhw1P0XCjMFEBTquNFtEjDBAenrJRu8QweaCSwfA1dJ8c90z8Kib2rA/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(65, 'Linda', NULL, 'oHfDAwaJXYShpij2yCJcPc8o9j9s', 'Linda', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6GiaZbCH9012SXMu0k4ODqHGJ1JgA1QcuyBn7c978snH3qSMorFiczFfAHfkwGoWqkmiacWjVVdloHQ/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(66, '李晟  PLANT4', NULL, 'oHfDAwec8FPa2GZ-mX8Z9oS6B45M', '李晟  PLANT4', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfVx5XjPsbCibcvibxxTS69VFrnExLflzo8mMbzPZEnUpAOlcfdv1LicT6FgHnaC7G2Cm6pUwVGdG3nU/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(67, '好孩子', NULL, 'oHfDAwaROifoGQFMIXBn5vzs5lUw', '好孩子', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4uiafXsib2UIVsxyibYSHKEuUwKicYgnhUrcJc1Zic7q6dZXdQicYylPXC5icY9bA8clzcDmXpnm94mXuNVy/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(68, '王仁忠', NULL, 'oHfDAwXvnSrKzQAX2okQtFMkNitY', '王仁忠', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfZqDTqGTQSqfN6ibt50nASBzj4zuxYxwG7GPsQYqLicFyngQ7IYVKe0o7ZjgBb2QABqeiaVa9nGJOKY/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(69, '娄兆海', NULL, 'oHfDAwUfjImmt2fMSaEP58Su-FE0', '娄兆海', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4MS6rASV4sofzJEYSb61J9STr027ootzCweZddGhDPQ8rNrjlAsOlL9mL5icYwrAOsn4SicylCLTSg/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(70, '夏夜馨空', NULL, 'oHfDAwaqZ1QZDH-IZEKLy4jk0LWc', '夏夜馨空', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz2CCrIBqhkX9X9kuxjVxzTcPNZ6hLMMaJNI3kwO9MlZCeHlxuIhP2LMLicpgZ1deDWiaALhqaDrIUPq2a1tm2cMm/0', 1, NULL, '', 0, '2', NULL, NULL, 1, NULL, NULL),
(71, '中华田园猫王 💸', NULL, 'oHfDAwRg1q-4Wc6BmueY-rrhNGXM', '中华田园猫王 💸', 'http://wx.qlogo.cn/mmopen/g9RQicMD01M1VESVz7UU4ulYar24Kd01sBbmfUagIReslibYBotZ6hz8Sp9e0ZzoJgmdOb8jclibBhMakicp9Lm4g3pyteNRDicpr/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(72, '^_^', NULL, 'oHfDAwTTwYL-PN6ZswJjoDfQ0DUM', '^_^', 'http://wx.qlogo.cn/mmopen/cKlFibcBtx6khpEUtXAyIfVLFic9yfhFlo5DjlHEGlVdxRcgVsRh0EGoicDl5IJRvZn4qGoDGPiaiaD7h2BaZsj2RnlLgM5t8V9Qr/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(73, '李宇', NULL, 'oHfDAwUFRlmhHBpmLcnQkNGsYHBY', '李宇', 'http://wx.qlogo.cn/mmopen/EjB59MCR1Bz1DCPB1iaMIOnia3L7SwZibwv4Qt4kfBxP4fs9PX4I47ltLuHia8QM3xWMrnLL4tpIXzWMiaqibW59PibAGERYEkWYKeF/0', 1, NULL, '', 0, '1', NULL, NULL, 1, NULL, NULL),
(74, 'T.A', '2015-03-01', 'opyuV0xteKR1g4mRGrqyi7Iw9rRs', '小A23', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJCkVv1aibMd2ZW0YISZMbUh7XeK65WCvzj9TpZ7DOTFtvsicGw3RSHJWwuaavsx8GCpAYJWTQXCaNQ/132', 3, NULL, '11222233334444', 0, '1', NULL, NULL, 0, '2018-05-07 10:12:30', '2018-05-21 10:57:03'),
(75, 'Annabelle', '2002-01-01', 'opyuV0zb7e1ss', 'Annabelle', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIMlhFsrd9oQuS3ubGJo0rJGib8QiaDpJvib37Y73BJN4v18W4aLswbUkGuOAj57sw4MlAreDLkc3MRg/132', 1, 1, '1234567890', 1, '0', '3.0', NULL, 1, '2018-05-13 16:08:36', '2018-05-24 04:18:03'),
(76, NULL, NULL, 'opyuV05cF-YPvGC2jFCn68MWxzLw', '超人小安🌙', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwOSu16FaicaC8kUhhvicDRahMYsxd4deKUEMo8cZx3nBphqI0PZSkFRo4kibicH5oZdNNNFyCSp0ZibA/132', NULL, NULL, NULL, 0, '2', NULL, NULL, 0, '2018-05-13 23:23:52', '2018-05-13 23:23:52'),
(77, 'kaye', '2018-01-01', 'opyuV08sQRT3nSs9tYnAY4WdTOi8', 'k a ye', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKNueO5SvcgZJaDznddlSSZBnr6hCsJ281M4flae87ysjHMdEyYZN0cHVcjbnrDmh9xm1bdcRjcMg/132', 1, NULL, '15622842283', 1, '2', NULL, NULL, 1, '2018-05-14 06:28:30', '2018-05-14 06:32:02'),
(78, '[deleted]', '2012-06-10', 'opyuV05YtgHJk8mZq', '[deleted]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epOkhhrZ8reEgwbS2zST6Ny0VulzV8IHsvenJUcTR817XsWqUiaaiaJ76HoswhO9vf7TF83STnYh1Vg/132', 1, NULL, '12346512364', 1, '2', NULL, NULL, 1, '2018-05-14 06:33:56', '2018-05-14 09:24:24'),
(79, NULL, NULL, 'opyuV04a_7m05WsZv38YrTiXZrgs', '小A', 'http://thirdwx.qlogo.cn/mmopen/vi_32/EotMygyz2hl4oJsEQ2vY0T6ibtL3Ne7ibTDwh0fIaILC2zwqx5ib83Sgdntnm0vSJSNvz7QVHegACD290bKVoyKCg/132', NULL, NULL, NULL, 0, '0', NULL, NULL, 0, '2018-05-15 16:41:47', '2018-05-15 16:41:47'),
(80, 'Daffry', '2011-09-01', 'opyuV07QKoPnTrMnB6iQjFMuv3KY', 'Daffry', 'http://readathon.athenaca.com/storage/avatars/80.jpg?_=1527144999', 1, NULL, '13916825976', 1, '2', NULL, NULL, 1, '2018-05-16 09:10:51', '2018-05-24 06:56:43'),
(81, 'Francis', '2000-01-01', 'opyuV08a8SbqfbFUT9b_OrOzTHr0', 'Francis🐑', 'http://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEK1QsrKm66d8JuUYhShktppV3GaniaDxvfF6KJLWSmVG0icGEYSQo6IKrqYrqzAlwSyHgQVb9eTzKMw/132', 1, NULL, '15921734780', 0, '1', NULL, NULL, 1, '2018-05-16 09:21:00', '2018-05-17 05:49:35'),
(82, 'Paddy', '2013-04-08', 'opyuV05_zB872mzCwkHdQ41JIKX4', 'fish俞', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er1icoyGseduib6gIjgImiaAT1foW6htxDzNX9iaRmFGGkKA3IZribgc8t02UL5ZNv1RXOWKCCJxPXV7pw/132', 1, NULL, '13575745963', 1, '2', NULL, NULL, 1, '2018-05-18 06:32:13', '2018-05-18 06:51:36'),
(83, 'William', '2007-11-11', 'opyuV043mG5CoKqP3eL1zJ9YBN7k', 'Marybell', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJWWcm6gx2vvZvEm2zOco3u8zW6oqEuEuEGMMfm8iaqpUianP7BribcGDMe9ouzRx8dgy9vOHgXPNTOA/132', 1, NULL, '18676651729', 1, '2', NULL, NULL, 1, '2018-05-18 06:34:51', '2018-05-18 06:59:37'),
(84, 'Belle', '2008-01-01', 'opyuV0zb7e1ssWjVusLai8JtMS7I', 'Annabelle', 'http://readathon.athenaca.com/storage/avatars/84.jpg', 1, NULL, '1234567890', 1, '1', '7', NULL, 1, '2018-05-21 03:04:52', '2018-05-23 02:29:34'),
(85, 'Arial', '2013-01-01', 'opyuV0ztDeauswjhTSosxIf_Yz50', '李静 畹町', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIibw5w10blZgDEG0rBc3IMOPuFDpGAvJvx7cmT9EOJoibFou35COUCQHIKY9koUFqicAfFtXqspkPzA/132', 2, NULL, '123456789', 0, '2', NULL, NULL, -1, '2018-05-21 05:56:06', '2018-05-24 04:18:59'),
(86, NULL, NULL, 'opyuV06aUIguUnM8APyYMuKsN2Cg', '陈晓静', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM4k1p9vySrJjsGicZ1EwtJVVJ8h4JkB7vvhEJyicNL93pNrvwUnkI7XgxnM1ZRh46O8jx3GCExD60pQ/132', NULL, NULL, NULL, 0, '2', NULL, NULL, 0, '2018-05-21 09:11:17', '2018-05-21 09:11:17'),
(87, NULL, NULL, 'opyuV0wLSAGam33POJMVfSCGVrQk', '🤗grace💖', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJEcpxVjZsxLAaLNiaia1ZYSyMgHNiaeRrtYsordHjRBEKRer3THq1cpDLSWRTt1JJTClSClOYYGFkdw/132', NULL, NULL, NULL, 0, '2', NULL, NULL, 0, '2018-05-21 09:23:05', '2018-05-21 09:23:05'),
(88, '茹佐和', '2018-01-01', 'opyuV001zWIJUDkQa-2VDR_hroHI', '茹佐和', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBYTPXLJHRgYJYziaDKgUyl70iczMR9DTXQ3Okrny3Eq8ZBML24fCcoFFlLsY4vWEBeFsNAtSKicgdYg/132', 1, NULL, '12345678901', 0, '0', '7', NULL, 1, '2018-05-21 11:49:28', '2018-05-21 11:54:51'),
(89, 'Ray Li', '2007-05-01', 'opyuV00_jxs6wmsKJxvx3Sl3iqnc', 'Tess Ding', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKLkgv12g6M2LCeUA6Uroa4icT0r0edFrU8VxwJgMzAkOgOrcomKnAuAtLtibPVGJ0oxWFpk4ZXHwhw/132', 1, NULL, '15802116472', 0, '1', '7', NULL, 1, '2018-05-22 04:54:05', '2018-05-22 15:18:37'),
(90, 'Simon', '2008-01-01', 'opyuV08xYt5A6GAGxk0k_ethKPcU', 'Simon ', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJaz65ibfZ01Hxf8SyEsKoXEQ2CMEiclYBJmhVf1KondB4rGrJtXAiaTYPCxbF8SqR1ds68oIeOR1Thg/132', 4, NULL, '13615886954', 1, '1', NULL, NULL, 1, '2018-05-23 00:22:26', '2018-05-23 02:29:10'),
(91, 'Jacob Jin', '2011-12-09', 'opyuV03dcBLZ5GjR9fEVPQmlbXrw', 'Jacob', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLER5sG6KaHGBu5IwKSdU964iaQdDianHX2LMpupkoOyhPVTjSORia3ibboR4f26OY7yAcx7Ad50Nl4Bg/132', 4, 7, '13958201330', 1, '0', '3', NULL, 1, '2018-05-23 02:00:15', '2018-05-24 03:19:36'),
(92, 'Harry', '2013-01-01', 'opyuV05YtgHJk8mZqxlSW4idZje0', 'Harry', 'http://readathon.athenaca.com/storage/avatars/92.jpg?_=1527047150', 1, NULL, '123456789', 0, '2', NULL, NULL, 1, '2018-05-23 03:27:44', '2018-05-23 03:46:27'),
(93, NULL, NULL, 'opyuV00LRr-WJvZs3Yf6TLyaOq3Q', 'Miao', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epK2Bl68BomgK6ovh5AUXGMR9sNJreTLCEBBjb9XsAAia0ibC47BMbZ54LkhfhTCicoaUDCWoD4Qiavjg/132', NULL, NULL, NULL, 0, '0', NULL, NULL, 0, '2018-05-23 12:24:11', '2018-05-23 12:24:11'),
(94, NULL, NULL, 'opyuV0-PPfynpS_eGWsoJvtkicSI', 'ki', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erLQ2ZOV1loHHMf7zTxEUMFUrEOicXxFwAA0VWJG5T82vgbnHQEJaAO4nF5PlSs0zKAPA2icQrS5WIA/132', NULL, NULL, NULL, 0, '2', NULL, NULL, 0, '2018-05-24 06:30:47', '2018-05-24 06:30:47'),
(95, '张若轻', '2008-12-13', 'opyuV00bVHoQKiLsE8WP7fvbkWIk', 'Veronica@Athena', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9Nicr0ahll9D9y06KJIRUgic7Kwh34KtvPlVDyEMkoic5fRDoAGB50x8Uq10FNC6l950FFTibNJeqbw/132', 1, NULL, '18616354636', 1, '2', NULL, NULL, 1, '2018-05-24 06:31:42', '2018-05-24 06:49:15'),
(96, '啊静静', '2008-01-01', 'opyuV0-5bndC6aWvh5panjzdpOzo', 'Athena知慧学院鄞州校区', 'http://thirdwx.qlogo.cn/mmopen/vi_32/46ps5O5EBzYLMbibwObiaW61AByYHSlGibgJoKXXR5vED63BwsGLpGAx6lq0Uu2RUxiaZmCxDAzicuao4ksH3FHSrOw/132', 4, NULL, '18237465342', 1, '0', NULL, NULL, 1, '2018-05-24 06:50:14', '2018-05-24 06:52:52'),
(97, 'Kevin Zhu', '2008-10-14', 'opyuV01RiN-WGDr4KKTuBpvwiYjE', 'Kevin', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJVqRRPDCZCnTrhF6Haysoo40eGDxvDAxiaBmJknKy5KTwGRR4pXlZrLePNicC8mcSQalq22jVuA1SA/132', 1, 1, '13601791897', 1, '0', '2.1', NULL, 1, '2018-05-24 07:09:47', '2018-05-24 07:31:06'),
(98, '陈火火', '2000-06-02', 'opyuV00CfF3dUDcpnlU5jxfZGsjE', 'Missོ Chén', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoFEzaj5ibhdqjj4JoPRJc3aR5RibFpIfveBM6g1Cys5EqZ44mLQNmxNaamQEUhmwJwOG5NXwEG5dSw/132', 4, NULL, '18268619675', 1, '2', NULL, NULL, 1, '2018-05-25 06:01:52', '2018-05-25 06:21:38');

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
(1, 1),
(74, 3),
(86, 3),
(91, 3),
(80, 4),
(97, 4),
(95, 5),
(83, 6),
(90, 8),
(94, 8),
(98, 8),
(96, 9),
(82, 10);

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
(1, 74, 2, '2018-05-13', '2018-05-13 15:53:00', '2018-05-13 15:53:00'),
(1, 75, 2, '2018-05-14', '2018-05-14 07:32:17', '2018-05-14 07:32:17'),
(1, 84, 2, '2018-05-22', '2018-05-22 15:57:46', '2018-05-22 15:57:46'),
(2, 1, 2, '2018-05-09', '2018-05-10 07:08:03', '2018-05-10 07:08:03'),
(2, 1, 2, '2018-05-12', '2018-05-11 21:15:12', '2018-05-11 21:15:12'),
(2, 1, 2, '2018-05-14', '2018-05-13 18:00:11', '2018-05-13 18:00:11'),
(2, 1, 2, '2018-05-22', '2018-05-22 07:47:24', '2018-05-22 07:47:24'),
(3, 1, 2, '2018-05-09', '2018-05-10 07:07:59', '2018-05-10 07:07:59'),
(3, 1, 2, '2018-05-10', '2018-05-10 07:16:38', '2018-05-10 07:16:38'),
(3, 1, 2, '2018-05-14', '2018-05-14 03:15:54', '2018-05-14 03:15:54'),
(3, 74, 2, '2018-05-22', '2018-05-22 07:46:33', '2018-05-22 07:46:33'),
(3, 84, 2, '2018-05-22', '2018-05-22 05:00:55', '2018-05-22 05:00:55'),
(4, 75, 2, '2018-05-14', '2018-05-14 07:32:19', '2018-05-14 07:32:19'),
(4, 84, 2, '2018-05-22', '2018-05-22 15:57:47', '2018-05-22 15:57:47'),
(5, 1, 2, '2018-05-14', '2018-05-13 17:59:55', '2018-05-13 17:59:55'),
(5, 75, 2, '2018-05-14', '2018-05-14 06:32:39', '2018-05-14 06:32:39'),
(5, 84, 2, '2018-05-22', '2018-05-22 05:05:52', '2018-05-22 05:05:52'),
(6, 1, 2, '2018-05-14', '2018-05-13 18:00:00', '2018-05-13 18:00:00'),
(7, 1, 2, '2018-05-22', '2018-05-22 04:19:10', '2018-05-22 04:19:10'),
(7, 7, 2, '2018-05-14', '2018-05-14 03:19:43', '2018-05-14 03:19:43'),
(7, 84, 2, '2018-05-22', '2018-05-22 14:59:59', '2018-05-22 14:59:59'),
(8, 1, 2, '2018-05-14', '2018-05-13 18:00:06', '2018-05-13 18:00:06'),
(8, 76, 2, '2018-05-21', '2018-05-21 08:31:37', '2018-05-21 08:31:37'),
(9, 1, 2, '2018-05-22', '2018-05-22 07:47:06', '2018-05-22 07:47:06'),
(9, 2, 2, '2018-05-23', '2018-05-22 17:52:32', '2018-05-22 17:52:32'),
(9, 76, 2, '2018-05-15', '2018-05-15 08:00:04', '2018-05-15 08:00:04'),
(9, 84, 2, '2018-05-22', '2018-05-22 15:57:36', '2018-05-22 15:57:36'),
(9, 84, 2, '2018-05-23', '2018-05-22 16:07:05', '2018-05-22 16:07:05'),
(10, 1, 2, '2018-05-14', '2018-05-14 03:14:50', '2018-05-14 03:14:50'),
(10, 74, 2, '2018-05-22', '2018-05-22 07:46:48', '2018-05-22 07:46:48'),
(10, 75, 2, '2018-05-15', '2018-05-15 07:17:09', '2018-05-15 07:17:09'),
(10, 84, 2, '2018-05-22', '2018-05-22 15:57:43', '2018-05-22 15:57:43'),
(11, 1, 2, '2018-05-22', '2018-05-22 07:47:07', '2018-05-22 07:47:07'),
(11, 75, 2, '2018-05-14', '2018-05-14 06:24:56', '2018-05-14 06:24:56'),
(11, 75, 2, '2018-05-15', '2018-05-15 07:16:59', '2018-05-15 07:16:59'),
(11, 75, 2, '2018-05-16', '2018-05-16 03:31:57', '2018-05-16 03:31:57'),
(11, 75, 2, '2018-05-19', '2018-05-19 08:16:02', '2018-05-19 08:16:02'),
(11, 76, 2, '2018-05-14', '2018-05-13 23:25:56', '2018-05-13 23:25:56'),
(11, 76, 2, '2018-05-15', '2018-05-15 08:00:06', '2018-05-15 08:00:06'),
(11, 84, 2, '2018-05-22', '2018-05-22 15:57:37', '2018-05-22 15:57:37'),
(11, 84, 2, '2018-05-23', '2018-05-23 11:35:10', '2018-05-23 11:35:10'),
(12, 1, 2, '2018-05-14', '2018-05-13 18:00:08', '2018-05-13 18:00:08'),
(13, 1, 2, '2018-05-14', '2018-05-13 18:00:02', '2018-05-13 18:00:02'),
(14, 1, 2, '2018-05-14', '2018-05-13 18:00:12', '2018-05-13 18:00:12'),
(15, 76, 2, '2018-05-15', '2018-05-15 08:00:06', '2018-05-15 08:00:06'),
(15, 84, 2, '2018-05-23', '2018-05-23 11:35:10', '2018-05-23 11:35:10'),
(15, 92, 2, '2018-05-23', '2018-05-23 03:45:09', '2018-05-23 03:45:09'),
(16, 1, 2, '2018-05-14', '2018-05-13 17:59:52', '2018-05-13 17:59:52'),
(16, 75, 2, '2018-05-14', '2018-05-14 07:32:15', '2018-05-14 07:32:15'),
(16, 76, 2, '2018-05-15', '2018-05-15 08:00:08', '2018-05-15 08:00:08'),
(16, 84, 2, '2018-05-22', '2018-05-22 15:57:46', '2018-05-22 15:57:46'),
(17, 1, 2, '2018-05-14', '2018-05-13 17:59:55', '2018-05-13 17:59:55'),
(17, 84, 2, '2018-05-22', '2018-05-22 05:03:43', '2018-05-22 05:03:43'),
(19, 76, 2, '2018-05-15', '2018-05-15 08:00:10', '2018-05-15 08:00:10'),
(20, 1, 2, '2018-05-14', '2018-05-13 18:00:05', '2018-05-13 18:00:05'),
(21, 1, 2, '2018-05-14', '2018-05-13 17:57:04', '2018-05-13 17:57:04'),
(21, 74, 2, '2018-05-22', '2018-05-22 07:46:28', '2018-05-22 07:46:28'),
(21, 75, 2, '2018-05-15', '2018-05-15 07:17:08', '2018-05-15 07:17:08'),
(21, 84, 2, '2018-05-22', '2018-05-22 15:57:43', '2018-05-22 15:57:43'),
(22, 2, 2, '2018-05-23', '2018-05-22 18:55:01', '2018-05-22 18:55:01'),
(23, 1, 2, '2018-05-14', '2018-05-14 03:14:50', '2018-05-14 03:14:50'),
(23, 75, 2, '2018-05-15', '2018-05-15 07:17:09', '2018-05-15 07:17:09'),
(23, 84, 2, '2018-05-22', '2018-05-22 15:57:44', '2018-05-22 15:57:44'),
(24, 1, 2, '2018-05-14', '2018-05-14 03:16:02', '2018-05-14 03:16:02'),
(24, 1, 2, '2018-05-22', '2018-05-22 04:19:06', '2018-05-22 04:19:06'),
(24, 75, 2, '2018-05-14', '2018-05-14 07:32:21', '2018-05-14 07:32:21'),
(24, 84, 2, '2018-05-22', '2018-05-22 05:06:04', '2018-05-22 05:06:04'),
(25, 1, 2, '2018-05-14', '2018-05-14 03:13:26', '2018-05-14 03:13:26'),
(25, 75, 2, '2018-05-19', '2018-05-19 08:16:45', '2018-05-19 08:16:45'),
(25, 76, 2, '2018-05-14', '2018-05-13 23:26:03', '2018-05-13 23:26:03'),
(25, 84, 2, '2018-05-22', '2018-05-22 05:01:16', '2018-05-22 05:01:16'),
(25, 84, 2, '2018-05-23', '2018-05-23 11:35:11', '2018-05-23 11:35:11'),
(26, 1, 2, '2018-05-14', '2018-05-13 18:00:04', '2018-05-13 18:00:04'),
(75, 1, 2, '2018-05-22', '2018-05-22 09:05:51', '2018-05-22 09:05:51'),
(75, 74, 2, '2018-05-22', '2018-05-22 07:46:38', '2018-05-22 07:46:38'),
(75, 84, 2, '2018-05-22', '2018-05-22 15:57:16', '2018-05-22 15:57:16'),
(75, 84, 2, '2018-05-23', '2018-05-23 11:35:06', '2018-05-23 11:35:06'),
(78, 76, 2, '2018-05-15', '2018-05-15 08:00:19', '2018-05-15 08:00:19'),
(80, 2, 2, '2018-05-23', '2018-05-22 18:54:58', '2018-05-22 18:54:58'),
(84, 84, 2, '2018-05-22', '2018-05-22 15:57:15', '2018-05-22 15:57:15'),
(84, 84, 2, '2018-05-23', '2018-05-23 11:35:07', '2018-05-23 11:35:07'),
(85, 2, 2, '2018-05-23', '2018-05-22 18:55:00', '2018-05-22 18:55:00'),
(92, 92, 2, '2018-05-23', '2018-05-23 03:44:58', '2018-05-23 03:44:58');

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
  ADD KEY `password_resets_email_index` (`email`(191));

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
  ADD KEY `question_logs_user_id_foreign` (`user_id`);

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
-- Indexes for table `school_districts`
--
ALTER TABLE `school_districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

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
  ADD KEY `users_school_district_id_foreign` (`school_district_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
--
-- 使用表AUTO_INCREMENT `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- 使用表AUTO_INCREMENT `prizes`
--
ALTER TABLE `prizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `prize_logs`
--
ALTER TABLE `prize_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `school_districts`
--
ALTER TABLE `school_districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
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
-- 限制表 `school_districts`
--
ALTER TABLE `school_districts`
  ADD CONSTRAINT `school_districts_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- 限制表 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_invite_id_foreign` FOREIGN KEY (`invite_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_school_district_id_foreign` FOREIGN KEY (`school_district_id`) REFERENCES `school_districts` (`id`);

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
