-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 18, 2022 at 02:29 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fairbet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `last_login` datetime NOT NULL,
  `last_login_ip` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `is_active`, `last_login`, `last_login_ip`, `created_at`, `updated_at`) VALUES
(1, 'palash', 'ppnavkiran@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 1, '2022-03-01 06:57:46', '', '2022-03-01 06:57:46', '2022-03-01 06:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `bets_info`
--

CREATE TABLE `bets_info` (
  `id` int(11) NOT NULL,
  `user_id_a` int(11) NOT NULL,
  `user_id_b` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `match_id` varchar(250) NOT NULL,
  `team_a` varchar(250) NOT NULL,
  `team_b` varchar(250) NOT NULL,
  `winner_user_id` int(11) NOT NULL,
  `parity` varchar(250) NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `bet_amount_2` float NOT NULL,
  `winner_team` int(11) NOT NULL,
  `team_a_win_amt` float NOT NULL,
  `team_b_win_amt` float NOT NULL,
  `bet_date` date NOT NULL,
  `bet_status` int(11) NOT NULL COMMENT '0:created,1:Published,2:Private',
  `commission_fee` float NOT NULL,
  `total_payout_amount` float NOT NULL,
  `currency` varchar(50) NOT NULL,
  `transaction_status` varchar(250) NOT NULL,
  `payment_in_method` varchar(250) NOT NULL,
  `user_a_mobile` char(12) NOT NULL,
  `user_b_mobile` char(12) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `USD_conversion_rate` float NOT NULL,
  `user_a_ip` varchar(250) NOT NULL,
  `user_b_ip` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bets_info`
--

INSERT INTO `bets_info` (`id`, `user_id_a`, `user_id_b`, `country_id`, `match_id`, `team_a`, `team_b`, `winner_user_id`, `parity`, `bet_amount`, `bet_amount_2`, `winner_team`, `team_a_win_amt`, `team_b_win_amt`, `bet_date`, `bet_status`, `commission_fee`, `total_payout_amount`, `currency`, `transaction_status`, `payment_in_method`, `user_a_mobile`, `user_b_mobile`, `transaction_id`, `USD_conversion_rate`, `user_a_ip`, `user_b_ip`, `created_at`, `update_at`) VALUES
(1, 41, 0, 73, '497958121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-13', 0, 0, 200, 'xaf', '', '', '', '', '1', 0.00158, '', '', '2022-05-13 22:00:48', '0000-00-00 00:00:00'),
(2, 41, 0, 73, '497958121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-13', 0, 0, 200, 'xaf', '', '', '', '', '2', 0.00158, '', '', '2022-05-13 22:01:45', '0000-00-00 00:00:00'),
(3, 41, 0, 73, '497958121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-13', 0, 0, 200, 'xaf', '', '', '', '', '3', 0.00158, '', '', '2022-05-13 22:09:02', '0000-00-00 00:00:00'),
(4, 2, 0, 2, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-13', 0, 0, 200, 'XAF', '', '', '', '', '4', 0.00158, '', '', '2022-05-14 01:10:55', '0000-00-00 00:00:00'),
(5, 2, 0, 3, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-13', 1, 0, 200, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-14 01:14:02', '2022-05-14 01:14:05'),
(6, 2, 0, 2, '497958121', '', '', 0, '2:1', 100, 200, 0, 0, 0, '2022-05-13', 1, 0, 300, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 12:49:25', '2022-05-16 11:14:58'),
(7, 2, 0, 4, '497598121', '', '', 0, '3:2', 100, 150, 0, 0, 0, '2022-05-13', 0, 0, 250, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 12:52:19', '0000-00-00 00:00:00'),
(8, 2, 0, 4, '497598121', '', '', 0, '3:2', 100, 150, 0, 0, 0, '2022-05-13', 1, 0, 250, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 12:56:09', '2022-05-14 01:26:23'),
(11, 2, 0, 4, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '0000-00-00', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:08:22', '0000-00-00 00:00:00'),
(12, 2, 0, 4, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '1969-12-31', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:14:01', '0000-00-00 00:00:00'),
(13, 2, 0, 4, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '0000-00-00', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:14:59', '0000-00-00 00:00:00'),
(14, 2, 0, 4, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '1969-12-31', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:16:46', '0000-00-00 00:00:00'),
(15, 2, 0, 4, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-14', 1, 0, 200, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:19:35', '2022-05-14 01:50:25'),
(16, 2, 0, 5, '28131744', '', '', 0, '5:4', 120, 150, 0, 0, 0, '2022-05-14', 1, 0, 270, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:21:29', '2022-05-14 01:51:37'),
(17, 2, 0, 4, '497598121', '', '', 0, '1:1', 150, 150, 0, 0, 0, '2022-05-14', 0, 0, 300, 'XAF', '', '', '', '', '', 0.00158, '', '', '2022-05-13 13:23:07', '0000-00-00 00:00:00'),
(18, 41, 0, 6, '497958121', '', '', 0, '1:1', 1000, 1000, 0, 0, 0, '2022-05-14', 0, 0, 2000, 'xaf', '', '', '', '', '', 0.00158, '', '', '2022-05-13 15:18:39', '0000-00-00 00:00:00'),
(19, 41, 0, 3, '479597120', '', '', 0, '1:1', 10, 10, 0, 0, 0, '2022-05-14', 0, 0, 20, 'xaf', '', '', '', '', '', 0.00158, '', '', '2022-05-13 15:20:25', '0000-00-00 00:00:00'),
(20, 41, 0, 3, '479597120', '', '', 0, '1:1', 10, 10, 0, 0, 0, '2022-05-14', 0, 0, 20, 'xaf', '', '', '', '', '', 0.00158, '', '', '2022-05-13 15:20:40', '0000-00-00 00:00:00'),
(21, 41, 0, 3, '479597120', '', '', 0, '1:1', 10, 10, 0, 0, 0, '2022-05-14', 0, 0, 20, 'xaf', '', '', '', '', '', 0.00158, '', '', '2022-05-13 15:24:12', '0000-00-00 00:00:00'),
(22, 41, 0, 3, '479597120', '', '', 0, '1:1', 10, 10, 0, 0, 0, '2022-05-14', 0, 0, 20, 'xaf', '', '', '', '', '', 0.00158, '', '', '2022-05-13 15:24:15', '0000-00-00 00:00:00'),
(23, 41, 0, 3, '479597120', '', '', 0, '1:1', 10, 10, 0, 0, 0, '2022-05-14', 0, 0, 20, 'xaf', '', '', '', '', '', 0.00158, '', '', '2022-05-13 15:25:37', '0000-00-00 00:00:00'),
(24, 41, 0, 3, '497958121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-14', 0, 0, 200, 'xaf', '', '', '', '', '7', 0.00158, '', '', '2022-05-13 16:28:43', '0000-00-00 00:00:00'),
(31, 2, 0, 3, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-15', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-13 21:54:43', '0000-00-00 00:00:00'),
(32, 2, 0, 3, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-15', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-13 21:57:31', '0000-00-00 00:00:00'),
(33, 2, 0, 13, '497598121', '', '', 0, '6:1', 50, 300, 0, 0, 0, '2022-05-16', 0, 0, 350, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-13 21:58:58', '0000-00-00 00:00:00'),
(34, 2, 0, 13, '497598121', '', '', 0, '6:1', 50, 300, 0, 0, 0, '2022-05-16', 1, 0, 350, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-13 21:59:20', '2022-05-14 10:29:22'),
(35, 41, 0, 14, '497958121', '', '', 0, '6:1', 1000, 6000, 0, 0, 0, '2022-05-15', 0, 0, 7000, 'xaf', '', '', '', '', '11', 0.00159, '', '', '2022-05-14 09:41:42', '0000-00-00 00:00:00'),
(36, 41, 0, 14, '497958121', '', '', 0, '6:1', 1000, 6000, 0, 0, 0, '2022-05-15', 0, 0, 7000, 'xaf', '', '', '', '', '', 0.00159, '', '', '2022-05-14 09:42:31', '0000-00-00 00:00:00'),
(37, 2, 0, 3, '497598121', '', '', 0, '5:4', 120, 150, 0, 0, 0, '2022-05-17', 1, 0, 270, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:45:38', '2022-05-16 11:15:54'),
(38, 2, 0, 4, '38942744', '', '', 0, '1:1', 150, 150, 0, 0, 0, '2022-05-17', 2, 0, 300, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:47:16', '2022-05-16 11:17:17'),
(39, 42, 0, 55, '478539912', '', '', 0, '1:1', 55, 55, 0, 0, 0, '2022-05-16', 0, 0, 110, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:54:10', '0000-00-00 00:00:00'),
(40, 42, 0, 4, '38942744', '', '', 0, '1:1', 102, 102, 0, 0, 0, '2022-05-16', 0, 0, 204, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:54:40', '0000-00-00 00:00:00'),
(41, 42, 0, 4, '38942744', '', '', 0, '1:1', 102, 102, 0, 0, 0, '2022-05-16', 0, 0, 204, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:54:47', '0000-00-00 00:00:00'),
(42, 42, 0, 4, '29114544', '', '', 0, '1:1', 200, 200, 0, 0, 0, '2022-05-17', 0, 0, 400, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:55:09', '0000-00-00 00:00:00'),
(43, 42, 0, 3, '38942744', '', '', 0, '1:1', 40, 40, 0, 0, 0, '2022-05-16', 0, 0, 80, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:55:37', '0000-00-00 00:00:00'),
(44, 42, 0, 3, '38942744', '', '', 0, '1:1', 40, 40, 0, 0, 0, '2022-05-16', 0, 0, 80, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 22:57:09', '0000-00-00 00:00:00'),
(45, 42, 0, 3, '38942744', '', '', 0, '1:1', 40, 40, 0, 0, 0, '2022-05-16', 0, 0, 80, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:00:17', '0000-00-00 00:00:00'),
(46, 2, 0, 2, '497598121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-18', 1, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:36:23', '2022-05-16 13:04:54'),
(47, 42, 0, 3, '38942744', '', '', 0, '1:1', 55, 55, 0, 0, 0, '2022-05-16', 1, 0, 110, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:51:52', '2022-05-16 12:22:00'),
(48, 42, 0, 3, '497598121', '', '', 0, '1:1', 55, 55, 0, 0, 0, '2022-05-16', 1, 0, 110, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:52:24', '2022-05-16 12:22:32'),
(49, 42, 0, 3, '478539912', '', '', 0, '22:115', 115, 22, 0, 0, 0, '2022-05-16', 1, 0, 137, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:54:53', '2022-05-16 12:25:42'),
(50, 42, 0, 3, '478539912', '', '', 0, '22:115', 115, 22, 0, 0, 0, '2022-05-16', 1, 0, 137, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:55:33', '2022-05-16 12:26:54'),
(51, 42, 0, 3, '38942744', '', '', 0, '22:7', 14, 44, 0, 0, 0, '2022-05-16', 1, 0, 58, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:57:32', '2022-05-16 12:28:20'),
(52, 42, 0, 3, '497598121', '', '', 0, '11:7', 14, 22, 0, 0, 0, '2022-05-16', 1, 0, 36, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-15 23:59:03', '2022-05-16 12:29:18'),
(53, 2, 0, 10, '397195124', '', '', 0, '1:1', 150, 150, 0, 0, 0, '2022-05-24', 2, 0, 300, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 00:12:21', '2022-05-16 12:42:26'),
(54, 2, 0, 10, '397195124', '', '', 0, '1:1', 150, 150, 0, 0, 0, '2022-05-24', 1, 0, 300, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 00:12:44', '2022-05-16 12:44:50'),
(55, 42, 0, 3, '497598121', '', '', 0, '44:115', 115, 44, 0, 0, 0, '2022-05-16', 0, 0, 159, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-16 00:16:07', '0000-00-00 00:00:00'),
(56, 42, 0, 3, '497598121', '', '', 0, '44:115', 115, 44, 0, 0, 0, '2022-05-16', 1, 0, 159, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-16 00:17:06', '2022-05-16 12:47:12'),
(57, 42, 0, 3, '497598121', '', '', 0, '44:115', 115, 44, 0, 0, 0, '2022-05-16', 1, 0, 159, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-16 00:17:24', '2022-05-16 05:24:00'),
(58, 2, 0, 30, '397767129', '', '', 0, '1:1', 150, 150, 0, 0, 0, '2022-05-24', 2, 0, 300, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 00:39:26', '2022-05-16 13:09:33'),
(59, 42, 0, 2, '497598121', '', '', 0, '44:115', 115, 44, 0, 0, 0, '2022-05-16', 1, 0, 159, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-16 04:29:17', '2022-05-16 04:29:33'),
(60, 2, 0, 2, '497598121', '', '', 0, '3:2', 200, 300, 0, 0, 0, '2022-05-16', 1, 0, 500, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 05:11:33', '2022-05-16 05:11:35'),
(61, 42, 0, 93, '38942744', '', '', 0, '258:115', 115, 258, 0, 0, 0, '2022-05-16', 1, 0, 373, 'xof', '', '', '', '', '', 0.00159, '', '', '2022-05-16 05:27:40', '2022-05-16 05:27:41'),
(62, 41, 0, 3, '497958121', '', '', 0, '1:1', 50, 50, 0, 0, 0, '2022-05-16', 0, 0, 100, 'xaf', '', '', '', '', '', 0.00159, '', '', '2022-05-16 06:58:53', '0000-00-00 00:00:00'),
(63, 41, 0, 10, '397767129', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-17', 0, 0, 200, 'xaf', '', '', '', '', '', 0.00159, '', '', '2022-05-16 20:38:26', '0000-00-00 00:00:00'),
(64, 41, 0, 10, '397767129', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-17', 0, 0, 200, 'xaf', '', '', '', '', '16', 0.00159, '', '', '2022-05-16 20:38:59', '0000-00-00 00:00:00'),
(65, 2, 0, 3, '478539912', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-18', 1, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 22:24:45', '2022-05-16 22:27:34'),
(66, 2, 0, 3, '478539912', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-18', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 22:26:27', '0000-00-00 00:00:00'),
(67, 2, 0, 3, '478539912', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-18', 0, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-16 22:26:32', '0000-00-00 00:00:00'),
(68, 41, 0, 6, '497958121', '', '', 0, '1:1', 100, 100, 0, 0, 0, '2022-05-17', 1, 0, 200, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-17 00:01:25', '2022-05-17 00:03:09'),
(69, 41, 0, 73, '396189126', '', '', 0, '1:1', 50, 50, 0, 0, 0, '2022-05-17', 1, 0, 100, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-17 00:50:37', '2022-05-17 00:50:40'),
(70, 2, 0, 3, '497598121', '', '', 0, '6:5', 100, 120, 0, 0, 0, '2022-05-18', 2, 0, 220, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-17 01:57:57', '2022-05-17 01:58:22'),
(71, 41, 0, 10, '397195124', '', '', 0, '1:1', 10, 10, 0, 0, 0, '2022-05-17', 1, 0, 20, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-17 02:02:46', '2022-05-17 02:03:05'),
(72, 2, 0, 4, '38942744', '', '', 0, '2:1', 100, 200, 0, 0, 0, '2022-05-18', 2, 0, 300, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-17 03:34:12', '2022-05-17 03:34:19'),
(73, 41, 0, 3, '397767129', '', '', 0, '1:1', 10000, 10000, 0, 0, 0, '2022-05-17', 1, 0, 20000, 'XAF', '', '', '', '', '', 0.00159, '', '', '2022-05-17 07:34:01', '2022-05-17 07:35:12'),
(74, 42, 0, 3, '38942744', '', '', 0, '1:1', 44, 44, 0, 0, 0, '2022-05-18', 1, 0, 88, 'XOF', '', '', '', '', '', 0.0016, '', '', '2022-05-17 22:08:37', '2022-05-17 22:08:45'),
(75, 42, 0, 2, '497598121', '', '', 0, '1:1', 3, 3, 0, 0, 0, '2022-05-18', 1, 0, 6, 'XOF', '', '', '', '', '', 0.0016, '', '', '2022-05-17 22:25:47', '2022-05-17 22:26:17'),
(76, 41, 0, 3, '478539912', '', '', 0, '11:1201', 1201, 11, 0, 0, 0, '2022-05-17', 2, 0, 1212, 'XAF', '', '', '', '', '', 0.0016, '', '', '2022-05-17 22:29:23', '2022-05-17 22:29:33'),
(77, 41, 0, 3, '497958121', '', '', 0, '1.5:10.7', 11, 1.5, 0, 0, 0, '2022-05-20', 1, 0, 12.2, 'XAF', '', '', '', '', '', 0.0016, '', '', '2022-05-18 00:01:53', '2022-05-18 00:01:57'),
(78, 42, 0, 4, '38942744', '', '', 0, '5:7', 14, 10, 0, 0, 0, '2022-05-19', 1, 0, 24, 'XOF', '', '', '', '', '', 0.0016, '', '', '2022-05-18 03:14:42', '2022-05-18 03:14:46'),
(79, 2, 0, 4, '29114544', '', '', 0, '2:1', 100, 200, 0, 0, 0, '2022-05-19', 1, 0, 300, 'XAF', '', '', '', '', '', 0.0016, '', '', '2022-05-18 05:05:59', '2022-05-18 05:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(64) NOT NULL DEFAULT '',
  `country_code` varchar(2) NOT NULL,
  `currency_sym` varchar(7) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`, `country_code`, `currency_sym`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 'null', 0, NULL, NULL),
(2, 'Albania', 'AL', 'null', 1, NULL, NULL),
(3, 'Algeria', 'DZ', 'null', 1, NULL, NULL),
(4, 'American Samoa', 'AS', 'null', 1, NULL, NULL),
(5, 'Andorra', 'AD', 'null', 1, NULL, NULL),
(6, 'Angola', 'AO', 'null', 1, NULL, NULL),
(7, 'Anguilla', 'AI', 'null', 1, NULL, NULL),
(8, 'Antarctica', 'AQ', 'null', 1, NULL, NULL),
(9, 'Antigua and Barbuda', 'AG', 'null', 1, NULL, NULL),
(10, 'Argentina', 'AR', 'null', 1, NULL, NULL),
(11, 'Armenia', 'AM', 'null', 1, NULL, NULL),
(12, 'Aruba', 'AW', 'null', 1, NULL, NULL),
(13, 'Australia', 'AU', 'null', 1, NULL, NULL),
(14, 'Austria', 'AT', 'null', 1, NULL, NULL),
(15, 'Azerbaijan', 'AZ', 'null', 1, NULL, NULL),
(16, 'Bahamas', 'BS', 'null', 1, NULL, NULL),
(17, 'Bahrain', 'BH', 'null', 1, NULL, NULL),
(18, 'Bangladesh', 'BD', 'null', 1, NULL, NULL),
(19, 'Barbados', 'BB', 'null', 1, NULL, NULL),
(20, 'Belarus', 'BY', 'null', 1, NULL, NULL),
(21, 'Belgium', 'BE', 'null', 1, NULL, NULL),
(22, 'Belize', 'BZ', 'null', 1, NULL, NULL),
(23, 'Benin', 'BJ', 'null', 1, NULL, NULL),
(24, 'Bermuda', 'BM', 'null', 1, NULL, NULL),
(25, 'Bhutan', 'BT', 'null', 1, NULL, NULL),
(26, 'Bolivia', 'BO', 'null', 1, NULL, NULL),
(27, 'Bosnia and Herzegowina', 'BA', 'null', 1, NULL, NULL),
(28, 'Botswana', 'BW', 'null', 1, NULL, NULL),
(29, 'Bouvet Island', 'BV', 'null', 1, NULL, NULL),
(30, 'Brazil', 'BR', 'null', 1, NULL, NULL),
(31, 'British Indian Ocean Territory', 'IO', 'null', 1, NULL, NULL),
(32, 'Brunei Darussalam', 'BN', 'null', 1, NULL, NULL),
(33, 'Bulgaria', 'BG', 'null', 1, NULL, NULL),
(34, 'Burkina Faso', 'BF', 'null', 1, NULL, NULL),
(35, 'Burundi', 'BI', 'null', 1, NULL, NULL),
(36, 'Cambodia', 'KH', 'null', 1, NULL, NULL),
(37, 'Cameroon', 'CM', 'null', 1, NULL, NULL),
(38, 'Canada', 'CA', 'null', 1, NULL, NULL),
(39, 'Cape Verde', 'CV', 'null', 1, NULL, NULL),
(40, 'Cayman Islands', 'KY', 'null', 1, NULL, NULL),
(41, 'Central African Republic', 'CF', 'null', 1, NULL, NULL),
(42, 'Chad', 'TD', 'null', 1, NULL, NULL),
(43, 'Chile', 'CL', 'null', 1, NULL, NULL),
(44, 'China', 'CN', 'null', 1, NULL, NULL),
(45, 'Christmas Island', 'CX', 'null', 1, NULL, NULL),
(46, 'Cocos (Keeling) Islands', 'CC', 'null', 1, NULL, NULL),
(47, 'Colombia', 'CO', 'null', 1, NULL, NULL),
(48, 'Comoros', 'KM', 'null', 1, NULL, NULL),
(49, 'Congo Democratic Republic of', 'CG', 'null', 1, NULL, NULL),
(50, 'Cook Islands', 'CK', 'null', 1, NULL, NULL),
(51, 'Costa Rica', 'CR', 'null', 1, NULL, NULL),
(52, 'Cote D\'Ivoire', 'CI', 'null', 1, NULL, NULL),
(53, 'Croatia', 'HR', 'null', 1, NULL, NULL),
(54, 'Cuba', 'CU', 'null', 1, NULL, NULL),
(55, 'Cyprus', 'CY', 'null', 1, NULL, NULL),
(56, 'Czech Republic', 'CZ', 'null', 1, NULL, NULL),
(57, 'Denmark', 'DK', 'null', 1, NULL, NULL),
(58, 'Djibouti', 'DJ', 'null', 1, NULL, NULL),
(59, 'Dominica', 'DM', 'null', 1, NULL, NULL),
(60, 'Dominican Republic', 'DO', 'null', 1, NULL, NULL),
(61, 'Timor-Leste', 'TL', 'null', 1, NULL, NULL),
(62, 'Ecuador', 'EC', 'null', 1, NULL, NULL),
(63, 'Egypt', 'EG', 'null', 1, NULL, NULL),
(64, 'El Salvador', 'SV', 'null', 1, NULL, NULL),
(65, 'Equatorial Guinea', 'GQ', 'null', 1, NULL, NULL),
(66, 'Eritrea', 'ER', 'null', 1, NULL, NULL),
(67, 'Estonia', 'EE', 'null', 1, NULL, NULL),
(68, 'Ethiopia', 'ET', 'null', 1, NULL, NULL),
(69, 'Falkland Islands (Malvinas)', 'FK', 'null', 1, NULL, NULL),
(70, 'Faroe Islands', 'FO', 'null', 1, NULL, NULL),
(71, 'Fiji', 'FJ', 'null', 1, NULL, NULL),
(72, 'Finland', 'FI', 'null', 1, NULL, NULL),
(73, 'France', 'FR', 'null', 1, NULL, NULL),
(75, 'French Guiana', 'GF', 'null', 1, NULL, NULL),
(76, 'French Polynesia', 'PF', 'null', 1, NULL, NULL),
(77, 'French Southern Territories', 'TF', 'null', 1, NULL, NULL),
(78, 'Gabon', 'GA', 'null', 1, NULL, NULL),
(79, 'Gambia', 'GM', 'null', 1, NULL, NULL),
(80, 'Georgia', 'GE', 'null', 1, NULL, NULL),
(81, 'Germany', 'DE', 'null', 1, NULL, NULL),
(82, 'Ghana', 'GH', 'null', 1, NULL, NULL),
(83, 'Gibraltar', 'GI', 'null', 1, NULL, NULL),
(84, 'Greece', 'GR', 'null', 1, NULL, NULL),
(85, 'Greenland', 'GL', 'null', 1, NULL, NULL),
(86, 'Grenada', 'GD', 'null', 1, NULL, NULL),
(87, 'Guadeloupe', 'GP', 'null', 1, NULL, NULL),
(88, 'Guam', 'GU', 'null', 1, NULL, NULL),
(89, 'Guatemala', 'GT', 'null', 1, NULL, NULL),
(90, 'Guinea', 'GN', 'null', 1, NULL, NULL),
(91, 'Guinea-bissau', 'GW', 'null', 1, NULL, NULL),
(92, 'Guyana', 'GY', 'null', 1, NULL, NULL),
(93, 'Haiti', 'HT', 'null', 1, NULL, NULL),
(94, 'Heard Island and McDonald Islands', 'HM', 'null', 1, NULL, NULL),
(95, 'Honduras', 'HN', 'null', 1, NULL, NULL),
(96, 'Hong Kong', 'HK', 'null', 1, NULL, NULL),
(97, 'Hungary', 'HU', 'null', 1, NULL, NULL),
(98, 'Iceland', 'IS', 'null', 1, NULL, NULL),
(99, 'India', 'IN', 'null', 1, NULL, NULL),
(100, 'Indonesia', 'ID', 'null', 1, NULL, NULL),
(101, 'Iran (Islamic Republic of)', 'IR', 'null', 1, NULL, NULL),
(102, 'Iraq', 'IQ', 'null', 1, NULL, NULL),
(103, 'Ireland', 'IE', 'null', 1, NULL, NULL),
(104, 'Israel', 'IL', 'null', 1, NULL, NULL),
(105, 'Italy', 'IT', 'null', 1, NULL, NULL),
(106, 'Jamaica', 'JM', 'null', 1, NULL, NULL),
(107, 'Japan', 'JP', 'null', 1, NULL, NULL),
(108, 'Jordan', 'JO', 'null', 1, NULL, NULL),
(109, 'Kazakhstan', 'KZ', 'null', 1, NULL, NULL),
(110, 'Kenya', 'KE', 'null', 1, NULL, NULL),
(111, 'Kiribati', 'KI', 'null', 1, NULL, NULL),
(112, 'Korea, Democratic People\'s Republic of', 'KP', 'null', 1, NULL, NULL),
(113, 'South Korea', 'KR', 'null', 1, NULL, NULL),
(114, 'Kuwait', 'KW', 'null', 1, NULL, NULL),
(115, 'Kyrgyzstan', 'KG', 'null', 1, NULL, NULL),
(116, 'Lao People\'s Democratic Republic', 'LA', 'null', 1, NULL, NULL),
(117, 'Latvia', 'LV', 'null', 1, NULL, NULL),
(118, 'Lebanon', 'LB', 'null', 1, NULL, NULL),
(119, 'Lesotho', 'LS', 'null', 1, NULL, NULL),
(120, 'Liberia', 'LR', 'null', 1, NULL, NULL),
(121, 'Libya', 'LY', 'null', 1, NULL, NULL),
(122, 'Liechtenstein', 'LI', 'null', 1, NULL, NULL),
(123, 'Lithuania', 'LT', 'null', 1, NULL, NULL),
(124, 'Luxembourg', 'LU', 'null', 1, NULL, NULL),
(125, 'Macao', 'MO', 'null', 1, NULL, NULL),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'null', 1, NULL, NULL),
(127, 'Madagascar', 'MG', 'null', 1, NULL, NULL),
(128, 'Malawi', 'MW', 'null', 1, NULL, NULL),
(129, 'Malaysia', 'MY', 'null', 1, NULL, NULL),
(130, 'Maldives', 'MV', 'null', 1, NULL, NULL),
(131, 'Mali', 'ML', 'null', 1, NULL, NULL),
(132, 'Malta', 'MT', 'null', 1, NULL, NULL),
(133, 'Marshall Islands', 'MH', 'null', 1, NULL, NULL),
(134, 'Martinique', 'MQ', 'null', 1, NULL, NULL),
(135, 'Mauritania', 'MR', 'null', 1, NULL, NULL),
(136, 'Mauritius', 'MU', 'null', 1, NULL, NULL),
(137, 'Mayotte', 'YT', 'null', 1, NULL, NULL),
(138, 'Mexico', 'MX', 'null', 1, NULL, NULL),
(139, 'Micronesia, Federated States of', 'FM', 'null', 1, NULL, NULL),
(140, 'Moldova', 'MD', 'null', 1, NULL, NULL),
(141, 'Monaco', 'MC', 'null', 1, NULL, NULL),
(142, 'Mongolia', 'MN', 'null', 1, NULL, NULL),
(143, 'Montserrat', 'MS', 'null', 1, NULL, NULL),
(144, 'Morocco', 'MA', 'null', 1, NULL, NULL),
(145, 'Mozambique', 'MZ', 'null', 1, NULL, NULL),
(146, 'Myanmar', 'MM', 'null', 1, NULL, NULL),
(147, 'Namibia', 'NA', 'null', 1, NULL, NULL),
(148, 'Nauru', 'NR', 'null', 1, NULL, NULL),
(149, 'Nepal', 'NP', 'null', 1, NULL, NULL),
(150, 'Netherlands', 'NL', 'null', 1, NULL, NULL),
(151, 'Netherlands Antilles', 'AN', 'null', 1, NULL, NULL),
(152, 'New Caledonia', 'NC', 'null', 1, NULL, NULL),
(153, 'New Zealand', 'NZ', 'null', 1, NULL, NULL),
(154, 'Nicaragua', 'NI', 'null', 1, NULL, NULL),
(155, 'Niger', 'NE', 'null', 1, NULL, NULL),
(156, 'Nigeria', 'NG', 'null', 1, NULL, NULL),
(157, 'Niue', 'NU', 'null', 1, NULL, NULL),
(158, 'Norfolk Island', 'NF', 'null', 1, NULL, NULL),
(159, 'Northern Mariana Islands', 'MP', 'null', 1, NULL, NULL),
(160, 'Norway', 'NO', 'null', 1, NULL, NULL),
(161, 'Oman', 'OM', 'null', 1, NULL, NULL),
(162, 'Pakistan', 'PK', 'null', 1, NULL, NULL),
(163, 'Palau', 'PW', 'null', 1, NULL, NULL),
(164, 'Panama', 'PA', 'null', 1, NULL, NULL),
(165, 'Papua New Guinea', 'PG', 'null', 1, NULL, NULL),
(166, 'Paraguay', 'PY', 'null', 1, NULL, NULL),
(167, 'Peru', 'PE', 'null', 1, NULL, NULL),
(168, 'Philippines', 'PH', 'null', 1, NULL, NULL),
(169, 'Pitcairn', 'PN', 'null', 1, NULL, NULL),
(170, 'Poland', 'PL', 'null', 1, NULL, NULL),
(171, 'Portugal', 'PT', 'null', 1, NULL, NULL),
(172, 'Puerto Rico', 'PR', 'null', 1, NULL, NULL),
(173, 'Qatar', 'QA', 'null', 1, NULL, NULL),
(174, 'Reunion', 'RE', 'null', 1, NULL, NULL),
(175, 'Romania', 'RO', 'null', 1, NULL, NULL),
(176, 'Russian Federation', 'RU', 'null', 1, NULL, NULL),
(177, 'Rwanda', 'RW', 'null', 1, NULL, NULL),
(178, 'Saint Kitts and Nevis', 'KN', 'null', 1, NULL, NULL),
(179, 'Saint Lucia', 'LC', 'null', 1, NULL, NULL),
(180, 'Saint Vincent and the Grenadines', 'VC', 'null', 1, NULL, NULL),
(181, 'Samoa', 'WS', 'null', 1, NULL, NULL),
(182, 'San Marino', 'SM', 'null', 1, NULL, NULL),
(183, 'Sao Tome and Principe', 'ST', 'null', 1, NULL, NULL),
(184, 'Saudi Arabia', 'SA', 'null', 1, NULL, NULL),
(185, 'Senegal', 'SN', 'null', 1, NULL, NULL),
(186, 'Seychelles', 'SC', 'null', 1, NULL, NULL),
(187, 'Sierra Leone', 'SL', 'null', 1, NULL, NULL),
(188, 'Singapore', 'SG', 'null', 1, NULL, NULL),
(189, 'Slovakia (Slovak Republic)', 'SK', 'null', 1, NULL, NULL),
(190, 'Slovenia', 'SI', 'null', 1, NULL, NULL),
(191, 'Solomon Islands', 'SB', 'null', 1, NULL, NULL),
(192, 'Somalia', 'SO', 'null', 1, NULL, NULL),
(193, 'South Africa', 'ZA', 'null', 1, NULL, NULL),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'null', 1, NULL, NULL),
(195, 'Spain', 'ES', 'null', 1, NULL, NULL),
(196, 'Sri Lanka', 'LK', 'null', 1, NULL, NULL),
(197, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'null', 1, NULL, NULL),
(198, 'St. Pierre and Miquelon', 'PM', 'null', 1, NULL, NULL),
(199, 'Sudan', 'SD', 'null', 1, NULL, NULL),
(200, 'Suriname', 'SR', 'null', 1, NULL, NULL),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'null', 1, NULL, NULL),
(202, 'Swaziland', 'SZ', 'null', 1, NULL, NULL),
(203, 'Sweden', 'SE', 'null', 1, NULL, NULL),
(204, 'Switzerland', 'CH', 'null', 1, NULL, NULL),
(205, 'Syrian Arab Republic', 'SY', 'null', 1, NULL, NULL),
(206, 'Taiwan', 'TW', 'null', 1, NULL, NULL),
(207, 'Tajikistan', 'TJ', 'null', 1, NULL, NULL),
(208, 'Tanzania, United Republic of', 'TZ', 'null', 1, NULL, NULL),
(209, 'Thailand', 'TH', 'null', 1, NULL, NULL),
(210, 'Togo', 'TG', 'null', 1, NULL, NULL),
(211, 'Tokelau', 'TK', 'null', 1, NULL, NULL),
(212, 'Tonga', 'TO', 'null', 1, NULL, NULL),
(213, 'Trinidad and Tobago', 'TT', 'null', 1, NULL, NULL),
(214, 'Tunisia', 'TN', 'null', 1, NULL, NULL),
(215, 'Turkey', 'TR', 'null', 1, NULL, NULL),
(216, 'Turkmenistan', 'TM', 'null', 1, NULL, NULL),
(217, 'Turks and Caicos Islands', 'TC', 'null', 1, NULL, NULL),
(218, 'Tuvalu', 'TV', 'null', 1, NULL, NULL),
(219, 'Uganda', 'UG', 'null', 1, NULL, NULL),
(220, 'Ukraine', 'UA', 'null', 1, NULL, NULL),
(221, 'United Arab Emirates', 'AE', 'null', 1, NULL, NULL),
(222, 'United Kingdom', 'GB', 'null', 1, NULL, NULL),
(223, 'United States', 'US', 'null', 1, NULL, NULL),
(224, 'United States Minor Outlying Islands', 'UM', 'null', 1, NULL, NULL),
(225, 'Uruguay', 'UY', 'null', 1, NULL, NULL),
(226, 'Uzbekistan', 'UZ', 'null', 1, NULL, NULL),
(227, 'Vanuatu', 'VU', 'null', 1, NULL, NULL),
(228, 'Vatican City State (Holy See)', 'VA', 'null', 1, NULL, NULL),
(229, 'Venezuela', 'VE', 'null', 1, NULL, NULL),
(230, 'Vietnam', 'VN', 'null', 1, NULL, NULL),
(231, 'Virgin Islands (British)', 'VG', 'null', 1, NULL, NULL),
(232, 'Virgin Islands (U.S.)', 'VI', 'null', 1, NULL, NULL),
(233, 'Wallis and Futuna Islands', 'WF', 'null', 1, NULL, NULL),
(234, 'Western Sahara', 'EH', 'null', 1, NULL, NULL),
(235, 'Yemen', 'YE', 'null', 1, NULL, NULL),
(236, 'Serbia', 'RS', 'null', 1, NULL, NULL),
(238, 'Zambia', 'ZM', 'null', 1, NULL, NULL),
(239, 'Zimbabwe', 'ZW', 'null', 1, NULL, NULL),
(240, 'Aaland Islands', 'AX', 'null', 1, NULL, NULL),
(241, 'Palestine', 'PS', 'null', 1, NULL, NULL),
(242, 'Montenegro', 'ME', 'null', 1, NULL, NULL),
(243, 'Guernsey', 'GG', 'null', 1, NULL, NULL),
(244, 'Isle of Man', 'IM', 'null', 1, NULL, NULL),
(245, 'Jersey', 'JE', 'null', 1, NULL, NULL),
(247, 'Curaçao', 'CW', 'null', 1, NULL, NULL),
(248, 'Ivory Coast', 'CI', 'null', 1, NULL, NULL),
(249, 'Kosovo', 'XK', 'null', 1, NULL, NULL),
(250, 'p', 'p1', NULL, 0, NULL, NULL),
(251, 'p2', 'p1', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  `currency_sym` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country_name`, `currency`, `country_code`, `currency_sym`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(2, 'America', 'Dollars', 'USD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(4, 'Argentina', 'Pesos', 'ARS', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(6, 'Australia', 'Dollars', 'AUD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(8, 'Bahamas', 'Dollars', 'BSD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(9, 'Barbados', 'Dollars', 'BBD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(11, 'Belgium', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(13, 'Bermuda', 'Dollars', 'BMD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(16, 'Botswana', 'Pula', 'BWP', 'P', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(17, 'Bulgaria', 'Leva', 'BGN', 'лв', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(18, 'Brazil', 'Reais', 'BRL', 'R$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(21, 'Cambodia', 'Riels', 'KHR', '៛', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(22, 'Canada', 'Dollars', 'CAD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(24, 'Chile', 'Pesos', 'CLP', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(26, 'Colombia', 'Pesos', 'COP', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(29, 'Cuba', 'Pesos', 'CUP', '₱', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(30, 'Cyprus', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(35, 'Egypt', 'Pounds', 'EGP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(36, 'El Salvador', 'Colones', 'SVC', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(38, 'Euro', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(40, 'Fiji', 'Dollars', 'FJD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(41, 'France', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(42, 'Ghana', 'Cedis', 'GHC', '¢', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(44, 'Greece', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(46, 'Guernsey', 'Pounds', 'GGP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(47, 'Guyana', 'Dollars', 'GYD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(53, 'India', 'Rupees', 'INR', 'Rp', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(55, 'Iran', 'Rials', 'IRR', '﷼', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(56, 'Ireland', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(58, 'Israel', 'New Shekels', 'ILS', '₪', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(59, 'Italy', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(61, 'Japan', 'Yen', 'JPY', '¥', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(62, 'Jersey', 'Pounds', 'JEP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(64, 'Korea (North)', 'Won', 'KPW', '₩', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(65, 'Korea (South)', 'Won', 'KRW', '₩', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(67, 'Laos', 'Kips', 'LAK', '₭', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(69, 'Lebanon', 'Pounds', 'LBP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(70, 'Liberia', 'Dollars', 'LRD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(76, 'Malta', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(78, 'Mexico', 'Pesos', 'MXN', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(81, 'Namibia', 'Dollars', 'NAD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(82, 'Nepal', 'Rupees', 'NPR', '₨', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(84, 'Netherlands', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(85, 'New Zealand', 'Dollars', 'NZD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(88, 'North Korea', 'Won', 'KPW', '₩', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(89, 'Norway', 'Krone', 'NOK', 'kr', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(90, 'Oman', 'Rials', 'OMR', '﷼', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(97, 'Qatar', 'Rials', 'QAR', '﷼', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(98, 'Romania', 'New Lei', 'RON', 'lei', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(99, 'Russia', 'Rubles', 'RUB', 'руб', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(104, 'Singapore', 'Dollars', 'SGD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(105, 'Slovenia', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(107, 'Somalia', 'Shillings', 'SOS', 'S', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(108, 'South Africa', 'Rand', 'ZAR', 'R', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(109, 'South Korea', 'Won', 'KRW', '₩', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(110, 'Spain', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(114, 'Suriname', 'Dollars', 'SRD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(115, 'Syria', 'Pounds', 'SYP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(117, 'Thailand', 'Baht', 'THB', '฿', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(119, 'Turkey', 'Lira', 'TRY', 'TL', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(120, 'Turkey', 'Liras', 'TRL', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(124, 'United States of America', 'Dollars', 'USD', '$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(127, 'Vatican City', 'Euro', 'EUR', '€', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(129, 'Vietnam', 'Dong', 'VND', '₫', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(130, 'Yemen', 'Rials', 'YER', '﷼', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', '2022-04-21 15:21:06', '2022-04-21 15:21:06'),
(132, 'India', 'Rupees', 'INR', '₹', '2022-04-21 15:21:06', '2022-04-21 15:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `site_on_maintenance` int(11) NOT NULL DEFAULT 0,
  `commission_percentage_fee` varchar(250) NOT NULL,
  `payment_in_methods` int(11) NOT NULL COMMENT '0: off,1: on',
  `payment_out_methods` int(11) NOT NULL COMMENT '0: off,1: on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_payment`
--

CREATE TABLE `test_payment` (
  `id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL,
  `payment_response` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_payment`
--

INSERT INTO `test_payment` (`id`, `type`, `payment_response`, `created_at`) VALUES
(1, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051400263544854861\",\"transaction_uuid\":\"22051400263544854861\",\"phone\":\"237674158800\",\"amount\":\"1000\",\"fee\":\"15\",\"revenue\":\"1000\",\"status\":\"success\",\"message\":\"SUCCESSFUL\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"operator_transaction_id\":\"4049940660\",\"currency\":\"XAF\",\"user\":\"41\",\"item_ref\":\"2536\",\"payment_ref\":\"20220513162634\",\"first_name\":\"Enam Fon\",\"last_name\":\"Enam Fon\",\"email\":\"enammt2@gmail.com\",\"sign\":\"0f62fec06822b2acda8d8e7119736424\"}', '2022-05-13 23:27:12'),
(2, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051400285214955623\",\"transaction_uuid\":\"22051400285214955623\",\"phone\":\"237674158800\",\"amount\":\"100\",\"fee\":\"2\",\"revenue\":\"100\",\"status\":\"success\",\"message\":\"SUCCESSFUL\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"operator_transaction_id\":\"4049942557\",\"currency\":\"XAF\",\"user\":\"41\",\"item_ref\":\"2536\",\"payment_ref\":\"20220513162852\",\"first_name\":\"Enam Fon\",\"last_name\":\"Enam Fon\",\"email\":\"enammt2@gmail.com\",\"sign\":\"5460b93b5e222c68d2c3a36016a1b8cd\"}', '2022-05-13 23:29:27'),
(3, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051621320461643631\",\"transaction_uuid\":\"22051621320461643631\",\"phone\":\"237674158800\",\"amount\":\"1000\",\"fee\":\"15\",\"revenue\":\"1000\",\"status\":\"success\",\"message\":\"SUCCESSFUL\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"operator_transaction_id\":\"4064834380\",\"currency\":\"XAF\",\"user\":\"41\",\"item_ref\":\"1281\",\"payment_ref\":\"20220516133202\",\"first_name\":\"Enam Fon\",\"last_name\":\"Enam Fon\",\"email\":\"enammt2@gmail.com\",\"sign\":\"6e72a5a5bd81efee9fb141eafbde17b2\"}', '2022-05-16 20:32:34'),
(4, 'CinetPayRes', '{\"cpm_site_id\":\"445160\",\"cpm_trans_id\":\"20220516233737\",\"cpm_trans_date\":\"2022-05-17 06:37:37\",\"cpm_amount\":\"100\",\"cpm_currency\":\"XAF\",\"signature\":\"07df4e8ed59630a6379f687b1091ff95171129821797c980e4288a26de07c8e22154\",\"payment_method\":\"MTNCM\",\"cel_phone_num\":\"674158800\",\"cpm_phone_prefixe\":\"237\",\"cpm_language\":\"fr\",\"cpm_version\":\"V4\",\"cpm_payment_config\":\"SINGLE\",\"cpm_page_action\":\"PAYMENT\"}', '2022-05-17 06:38:17'),
(5, 'CinetPayRes', '{\"cpm_site_id\":\"445160\",\"cpm_trans_id\":\"20220516233737\",\"cpm_trans_date\":\"2022-05-17 06:37:37\",\"cpm_amount\":\"100\",\"cpm_currency\":\"XAF\",\"signature\":\"07df4e8ed59630a6379f687b1091ff95171129821797c980e4288a26de07c8e22154\",\"payment_method\":\"MTNCM\",\"cel_phone_num\":\"674158800\",\"cpm_phone_prefixe\":\"237\",\"cpm_language\":\"fr\",\"cpm_version\":\"V4\",\"cpm_payment_config\":\"SINGLE\",\"cpm_page_action\":\"PAYMENT\"}', '2022-05-17 06:38:17'),
(6, 'CinetPayRes', '{\"cpm_site_id\":\"445160\",\"cpm_trans_id\":\"20220518023051\",\"cpm_trans_date\":\"2022-05-18 09:30:51\",\"cpm_amount\":\"100\",\"cpm_currency\":\"XAF\",\"signature\":\"100fab39588901a38fd5ebcd4ddf50d2689f9c076a5b93a182578759466770f72154\",\"payment_method\":\"MTNCM\",\"cel_phone_num\":\"654088375\",\"cpm_phone_prefixe\":\"237\",\"cpm_language\":\"fr\",\"cpm_version\":\"V4\",\"cpm_payment_config\":\"SINGLE\",\"cpm_page_action\":\"PAYMENT\",\"cpm_designation\":\"test\"}', '2022-05-18 09:38:12'),
(7, 'CinetPayRes', '{\"cpm_site_id\":\"445160\",\"cpm_trans_id\":\"20220518024711\",\"cpm_trans_date\":\"2022-05-18 09:47:11\",\"cpm_amount\":\"100\",\"cpm_currency\":\"XAF\",\"signature\":\"fec0c6ad171072c4a73d5d08dc6b47be3fdd372d6f51409b6269ef3994edd8d52154\",\"payment_method\":\"MTNCM\",\"cel_phone_num\":\"654088375\",\"cpm_phone_prefixe\":\"237\",\"cpm_language\":\"fr\",\"cpm_version\":\"V4\",\"cpm_payment_config\":\"SINGLE\",\"cpm_page_action\":\"PAYMENT\",\"cpm_designation\":\"test\"}', '2022-05-18 09:54:47'),
(8, 'CinetPayRes', '{\"cpm_site_id\":\"445160\",\"cpm_trans_id\":\"20220518030328\",\"cpm_trans_date\":\"2022-05-18 10:03:28\",\"cpm_amount\":\"100\",\"cpm_currency\":\"XAF\",\"signature\":\"a250600d5c56b42bde87831994b03f9aa29661904038de3411aebaf4d0bf97db2154\",\"payment_method\":\"MTNCM\",\"cel_phone_num\":\"654088375\",\"cpm_phone_prefixe\":\"237\",\"cpm_language\":\"fr\",\"cpm_version\":\"V4\",\"cpm_payment_config\":\"SINGLE\",\"cpm_page_action\":\"PAYMENT\",\"cpm_designation\":\"test\"}', '2022-05-18 10:11:06'),
(9, 'CinetPayRes', '{\"cpm_site_id\":\"445160\",\"cpm_trans_id\":\"20220518042838\",\"cpm_trans_date\":\"2022-05-18 11:28:38\",\"cpm_amount\":\"100\",\"cpm_currency\":\"XAF\",\"signature\":\"74599abe5829344ed285939cfd1245b09dc871445a675f8d6ee48d217193156d2154\",\"payment_method\":\"MTNCM\",\"cel_phone_num\":\"654088375\",\"cpm_phone_prefixe\":\"237\",\"cpm_language\":\"fr\",\"cpm_version\":\"V4\",\"cpm_payment_config\":\"SINGLE\",\"cpm_page_action\":\"PAYMENT\",\"cpm_designation\":\"test\"}', '2022-05-18 11:36:08'),
(10, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051812374873666136\",\"transaction_uuid\":\"22051812374873666136\",\"phone\":\"237654088375\",\"amount\":\"1\",\"fee\":\"-0.01\",\"revenue\":\"0\",\"status\":\"cancelled\",\"message\":\"Transaction cancelled\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"currency\":\"XAF\",\"user\":\"2\",\"item_ref\":\"9893\",\"payment_ref\":\"20220518043746\",\"first_name\":\"palash\",\"last_name\":\"palash\",\"email\":\"ppnavkiran@gmail.com\",\"sign\":\"7a621dcf8896a2d53171e7afb2a8f93d\"}', '2022-05-18 11:38:46'),
(11, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051812374873666136\",\"transaction_uuid\":\"22051812374873666136\",\"phone\":\"237654088375\",\"amount\":\"1\",\"fee\":\"-0.01\",\"revenue\":\"0\",\"status\":\"failed\",\"message\":\"COULD_NOT_PERFORM_TRANSACTION\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"operator_transaction_id\":null,\"currency\":\"XAF\",\"user\":\"2\",\"item_ref\":\"9893\",\"payment_ref\":\"20220518043746\",\"first_name\":\"palash\",\"last_name\":\"palash\",\"email\":\"ppnavkiran@gmail.com\",\"sign\":\"1875d9976e22f85fcca2e99c0aa19eb8\"}', '2022-05-18 11:45:00'),
(12, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051812475527526191\",\"transaction_uuid\":\"22051812475527526191\",\"phone\":\"237654088375\",\"amount\":\"1\",\"fee\":\"-0.01\",\"revenue\":\"0\",\"status\":\"cancelled\",\"message\":\"Transaction cancelled\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"currency\":\"XAF\",\"user\":\"2\",\"item_ref\":\"53954\",\"payment_ref\":\"20220518044754\",\"first_name\":\"palash\",\"last_name\":\"palash\",\"email\":\"ppnavkiran@gmail.com\",\"sign\":\"f6df131f2ee152a468d7e3bac6829321\"}', '2022-05-18 11:48:25'),
(13, 'MonetBilRes', '{\"service\":\"kTcr8yJPge7ZYirWGSTH6OVIWVTXwa7S\",\"transaction_id\":\"22051812475527526191\",\"transaction_uuid\":\"22051812475527526191\",\"phone\":\"237654088375\",\"amount\":\"1\",\"fee\":\"-0.01\",\"revenue\":\"0\",\"status\":\"failed\",\"message\":\"COULD_NOT_PERFORM_TRANSACTION\",\"country_name\":\"CAMEROON\",\"country_iso\":\"CM\",\"country_code\":\"237\",\"mccmnc\":\"62401\",\"operator\":\"MTN\",\"operator_code\":\"CM_MTNMOBILEMONEY\",\"operator_transaction_id\":null,\"currency\":\"XAF\",\"user\":\"2\",\"item_ref\":\"53954\",\"payment_ref\":\"20220518044754\",\"first_name\":\"palash\",\"last_name\":\"palash\",\"email\":\"ppnavkiran@gmail.com\",\"sign\":\"6ccb08b78ea2efcf897fa3be7452f76e\"}', '2022-05-18 11:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL,
  `payment_in_method` varchar(250) NOT NULL,
  `payment_type` varchar(250) NOT NULL COMMENT 'pay_out,pay_in',
  `transaction_amount` float NOT NULL,
  `currency` varchar(250) NOT NULL,
  `USD_conversion_rate` varchar(250) NOT NULL,
  `USD_value` varchar(250) NOT NULL,
  `transaction_status` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`id`, `user_id`, `transaction_id`, `date_created`, `payment_in_method`, `payment_type`, `transaction_amount`, `currency`, `USD_conversion_rate`, `USD_value`, `transaction_status`, `created_at`, `updated_at`) VALUES
(1, 41, '20220513093137', '2022-05-13 00:00:00', '', 'pay_in', 100, 'xaf', '0.158', '0.158', 'started', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 41, '20220513093151', '2022-05-13 00:00:00', '', 'pay_in', 100, 'xaf', '0.158', '0.158', 'started', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 41, '20220513094007', '2022-05-13 00:00:00', '', 'pay_in', 100, 'xaf', '0.158', '0.158', 'started', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, '20220513124102', '2022-05-13 00:00:00', '', 'pay_in', 100, 'XAF', '0.158', '0.158', 'started', '2022-05-13 19:41:02', '0000-00-00 00:00:00'),
(5, 41, '20220513153115', '2022-05-13 00:00:00', '', 'pay_in', 100, 'xaf', '0.158', '0.158', 'started', '2022-05-13 22:31:15', '0000-00-00 00:00:00'),
(6, 41, '20220513162634', '2022-05-13 00:00:00', '', 'pay_in', 1000, 'xaf', '1.58', '1.58', 'started', '2022-05-13 23:26:34', '0000-00-00 00:00:00'),
(7, 41, '20220513162852', '2022-05-13 00:00:00', '', 'pay_in', 100, 'xaf', '0.158', '0.158', 'started', '2022-05-13 23:28:52', '0000-00-00 00:00:00'),
(8, 2, '20220513221946', '2022-05-13 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-14 05:19:46', '0000-00-00 00:00:00'),
(9, 2, '20220513222018', '2022-05-13 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-14 05:20:18', '0000-00-00 00:00:00'),
(10, 2, '20220513223054', '2022-05-13 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-14 05:30:54', '0000-00-00 00:00:00'),
(11, 41, '20220514094202', '2022-05-14 00:00:00', '', 'pay_in', 1000, 'xaf', '1.59', '1.59', 'started', '2022-05-14 16:42:02', '0000-00-00 00:00:00'),
(12, 2, '20220516040718', '2022-05-16 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-16 11:07:19', '0000-00-00 00:00:00'),
(13, 41, '20220516063526', '2022-05-16 00:00:00', '', 'pay_in', 100, 'xaf', '0.159', '0.159', 'started', '2022-05-16 13:35:26', '0000-00-00 00:00:00'),
(14, 41, '20220516133203', '2022-05-16 00:00:00', '', 'pay_in', 1000, 'xaf', '1.59', '1.59', 'started', '2022-05-16 20:32:03', '0000-00-00 00:00:00'),
(15, 41, '20220516133829', '2022-05-16 00:00:00', '', 'pay_in', 100, 'xaf', '0.159', '0.159', 'started', '2022-05-16 20:38:29', '0000-00-00 00:00:00'),
(16, 41, '20220516203911', '2022-05-16 00:00:00', '', 'pay_in', 100, 'xaf', '0.159', '0.159', 'started', '2022-05-17 03:39:11', '0000-00-00 00:00:00'),
(17, 41, '20220516232803', '2022-05-16 00:00:00', '', 'pay_in', 100, 'xaf', '0.159', '0.159', 'started', '2022-05-17 06:28:03', '0000-00-00 00:00:00'),
(18, 41, '20220516233011', '2022-05-16 00:00:00', '', 'pay_in', 1000, 'xaf', '1.59', '1.59', 'started', '2022-05-17 06:30:11', '0000-00-00 00:00:00'),
(19, 41, '20220516233737', '2022-05-16 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'Success', '2022-05-17 06:37:37', '0000-00-00 00:00:00'),
(20, 41, '20220517004413', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-17 07:44:14', '0000-00-00 00:00:00'),
(21, 2, '20220517033505', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-17 10:35:05', '0000-00-00 00:00:00'),
(22, 2, '20220517033700', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-17 10:37:01', '0000-00-00 00:00:00'),
(23, 2, '20220517033711', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-17 10:37:11', '0000-00-00 00:00:00'),
(24, 2, '20220517033920', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.159', '0.159', 'started', '2022-05-17 10:39:21', '0000-00-00 00:00:00'),
(25, 42, '20220517223006', '2022-05-17 00:00:00', '', 'pay_in', 11, 'XOF', '0.0176', '0.0176', 'started', '2022-05-18 05:30:06', '0000-00-00 00:00:00'),
(26, 41, '20220517235919', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'started', '2022-05-18 06:59:20', '0000-00-00 00:00:00'),
(27, 41, '20220517235933', '2022-05-17 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'started', '2022-05-18 06:59:33', '0000-00-00 00:00:00'),
(28, 42, '20220518000213', '2022-05-18 00:00:00', '', 'pay_in', 111, 'XOF', '0.1776', '0.1776', 'started', '2022-05-18 07:02:13', '0000-00-00 00:00:00'),
(29, 42, '20220518014808', '2022-05-18 00:00:00', '', 'pay_in', 11, 'XOF', '0.0176', '0.0176', 'started', '2022-05-18 08:48:08', '0000-00-00 00:00:00'),
(31, 2, '20220518020549', '2022-05-18 00:00:00', '', 'pay_out', 100, 'XAF', '0.16', '0.16', 'success', '2022-05-18 09:05:53', '0000-00-00 00:00:00'),
(32, 2, '20220518021236', '2022-05-18 00:00:00', '', 'pay_out', 100, 'XAF', '0.16', '0.16', 'success', '2022-05-18 09:12:39', '0000-00-00 00:00:00'),
(33, 2, '20220518021659', '2022-05-18 00:00:00', '', 'pay_out', 1, 'XAF', '0.0016', '0.0016', 'success', '2022-05-18 09:17:03', '2022-05-18 02:16:59'),
(34, 2, '20220518022110', '2022-05-18 00:00:00', '', 'pay_out', 1, 'XAF', '0.0016', '0.0016', 'success', '2022-05-18 09:21:14', '2022-05-18 02:21:14'),
(35, 2, '20220518022244', '2022-05-18 00:00:00', '', 'pay_out', 1, 'XAF', '0.0016', '0.0016', 'success', '2022-05-18 09:22:47', '2022-05-18 00:00:00'),
(36, 2, '20220518023051', '2022-05-18 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'failed', '2022-05-18 09:30:51', '0000-00-00 00:00:00'),
(37, 2, '20220518024711', '2022-05-18 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'failed', '2022-05-18 09:47:12', '2022-05-18 02:54:47'),
(38, 2, '20220518030328', '2022-05-18 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'failed', '2022-05-18 10:03:28', '2022-05-18 03:11:06'),
(39, 2, '20220518034246', '2022-05-18 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'cancelled', '2022-05-18 10:42:46', '0000-00-00 00:00:00'),
(40, 2, '20220518042838', '2022-05-18 00:00:00', '', 'pay_in', 100, 'XAF', '0.16', '0.16', 'failed', '2022-05-18 11:28:38', '2022-05-18 04:36:08'),
(42, 2, '20220518044754', '2022-05-18 00:00:00', '', 'pay_in', 1, 'XAF', '0.0016', '0.0016', 'failed', '2022-05-18 11:47:54', '2022-05-18 04:55:01'),
(43, 2, '20220518044918', '2022-05-18 00:00:00', '', 'pay_out', 1, 'XAF', '0.0016', '0.0016', 'success', '2022-05-18 11:49:21', '2022-05-18 04:49:21'),
(44, 2, '20220518045904', '2022-05-18 00:00:00', '', 'pay_out', 1, 'XAF', '0.0016', '0.0016', 'success', '2022-05-18 11:59:08', '2022-05-18 04:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `upcomming_matches`
--

CREATE TABLE `upcomming_matches` (
  `id` int(11) NOT NULL,
  `sports_type` varchar(255) NOT NULL,
  `match_id` varchar(250) NOT NULL,
  `league_Id` varchar(250) NOT NULL,
  `league_type` varchar(20) NOT NULL,
  `league_name` varchar(250) NOT NULL,
  `home_name` varchar(250) NOT NULL,
  `away_name` varchar(250) NOT NULL,
  `league_short_name` varchar(250) NOT NULL,
  `match_time` datetime NOT NULL,
  `match_status` varchar(20) NOT NULL,
  `is_approved` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upcomming_matches`
--

INSERT INTO `upcomming_matches` (`id`, `sports_type`, `match_id`, `league_Id`, `league_type`, `league_name`, `home_name`, `away_name`, `league_short_name`, `match_time`, `match_status`, `is_approved`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Football', '125500226', '170412', '1', 'Norway Division 4', 'Mjolner', 'Senja', 'NOR D4', '2022-05-14 07:00:00', '0', 1, '2022-05-13 03:38:57', '0000-00-00 00:00:00', 1),
(2, 'Football', '499999128', '10415', '1', 'Primera Division Liga MX', 'Atlas', 'Chivas Guadalajara', 'MEX D1', '2022-05-15 04:00:00', '0', 1, '2022-05-13 03:39:02', '0000-00-00 00:00:00', 1),
(3, 'Football', '479597120', '177', '1', 'Denmark Superligaen', 'Silkeborg', 'Midtjylland', 'DEN SASL', '2022-05-16 10:00:00', '0', 1, '2022-05-13 03:39:04', '0000-00-00 00:00:00', 1),
(4, 'Football', '280424121', '15476', '1', 'Saudi Arabia Division 1', 'Ohod Medina', 'Al-Nahdha', 'KSA D1', '2022-05-17 09:35:00', '0', 1, '2022-05-13 03:39:05', '0000-00-00 00:00:00', 1),
(5, 'Football', '396189126', '196117', '1', 'Colombia Copa Premier', 'Fortaleza F.C', 'Bogota FC', 'COL D2', '2022-05-17 05:40:00', '0', 1, '2022-05-13 03:39:07', '0000-00-00 00:00:00', 1),
(6, 'Football', '497879123', '1460', '2', 'Norway NM Cupen', 'Melhus', 'Strindheim IL', 'NORC', '2022-05-19 08:59:00', '0', 1, '2022-05-13 03:39:08', '0000-00-00 00:00:00', 1),
(7, 'Football', '396805121', '14914', '1', 'Singapore League', 'Tanjong Pagar Utd', 'Balestier Khalsa FC', 'SIN D1', '2022-05-20 04:45:00', '0', 1, '2022-05-13 03:39:10', '0000-00-00 00:00:00', 1),
(8, 'Football', '499866020', '112418', '1', 'French Championnat Amateur', 'CHAMALIERES', 'Angers II', 'FRA D4', '2022-05-21 08:59:00', '0', 1, '2022-05-13 03:39:15', '0000-00-00 00:00:00', 1),
(9, 'Football', '499597122', '177', '1', 'Denmark Superligaen', 'FC Copenhagen', 'Aalborg', 'DEN SASL', '2022-05-22 08:00:00', '0', 1, '2022-05-13 03:39:17', '0000-00-00 00:00:00', 1),
(10, 'Football', '399453123', '1123', '1', 'USA Major League Soccer', 'Austin FC', 'Orlando City', 'MLS', '2022-05-22 05:00:00', '0', 1, '2022-05-13 03:39:19', '0000-00-00 00:00:00', 1),
(11, 'Football', '399870126', '27850', '1', 'Futsal Spain Division De Honor', 'Rios Renovables Ribera Navarra Futsal', 'F.C.Barcelona Futsal', 'SPA FDH', '2022-05-24 08:59:00', '0', 1, '2022-05-13 03:39:20', '0000-00-00 00:00:00', 1),
(12, 'Football', '499884121', '1527', '1', 'J-League Division 1', 'Yokohama Marinos', 'Kyoto Sanga', 'JPN D1', '2022-05-25 03:00:00', '0', 1, '2022-05-13 03:39:22', '0000-00-00 00:00:00', 1),
(13, 'Football', '397128120', '163414', '1', 'Sweden Div 3 Mellersta', 'Ariana', 'Rappe GOIF', 'SWE D3', '2022-05-26 05:00:00', '0', 1, '2022-05-13 03:39:23', '0000-00-00 00:00:00', 1),
(14, 'Football', '399756129', '17131', '1', 'Malaysia Premier League', 'Darul Takzim II', 'Selangor PKNS', 'MAS PL', '2022-05-27 05:15:00', '0', 1, '2022-05-13 03:39:25', '0000-00-00 00:00:00', 1),
(15, 'Football', '479989125', '126413', '1', 'Argentina Ding Group Tebolidun League Manchester', 'Yupanqui', 'Deportivo Paraguayo', 'ADT M', '2022-05-28 01:00:00', '0', 1, '2022-05-13 03:39:28', '0000-00-00 00:00:00', 1),
(16, 'Football', '498778122', '107018', '1', 'Latvia Division 2', 'Grobina', 'JDFS Alberts', 'LAT D2', '2022-05-29 06:00:00', '0', 1, '2022-05-13 03:39:31', '0000-00-00 00:00:00', 1),
(17, 'Football', '397466125', '12125', '1', 'Finland Ykkonen', 'PEPO Lappeenranta', 'KPV', 'FIN D2', '2022-05-30 08:30:00', '0', 1, '2022-05-13 03:39:33', '0000-00-00 00:00:00', 1),
(18, 'Football', '385197123', '15746', '1', 'Finland Women Premier League', 'Honka Espoo (w)', 'Aland United (w)', 'FIN WD1', '2022-05-31 08:30:00', '0', 1, '2022-05-13 03:39:33', '0000-00-00 00:00:00', 1),
(19, 'Football', '388297127', '174012', '1', 'Iceland Women\'s Premier League', 'Trottur Reykjavik (w)', 'Stjarnan Gardabaer (w)', 'ICE WPR', '2022-06-01 12:15:00', '0', 1, '2022-05-13 03:39:34', '0000-00-00 00:00:00', 1),
(20, 'Football', '498687121', '146819', '2', 'UEFA Nations League', 'Serbia', 'Norway', 'UEFA  NL', '2022-06-02 11:45:00', '0', 1, '2022-05-13 03:39:36', '0000-00-00 00:00:00', 1),
(21, 'Football', '398466126', '12125', '1', 'Finland Ykkonen', 'KTP Kotka', 'PIF Parainen', 'FIN D2', '2022-06-03 08:30:00', '0', 1, '2022-05-13 03:39:37', '0000-00-00 00:00:00', 1),
(22, 'Football', '499989127', '126413', '1', 'Argentina Ding Group Tebolidun League Manchester', 'Deportivo Paraguayo', 'Central Ballester', 'ADT M', '2022-06-04 01:00:00', '0', 1, '2022-05-13 03:39:40', '0000-00-00 00:00:00', 1),
(23, 'Football', '489687121', '146819', '2', 'UEFA Nations League', 'San Marino', 'Malta', 'UEFA  NL', '2022-06-05 06:00:00', '0', 1, '2022-05-13 03:39:42', '0000-00-00 00:00:00', 1),
(24, 'Football', '496958120', '174315', '1', 'Brasileiro, Serie C', 'Ferroviario CE', 'SC Paysandu Para', 'BRA D3', '2022-06-06 04:00:00', '0', 1, '2022-05-13 03:39:43', '0000-00-00 00:00:00', 1),
(25, 'Football', '488339911', '14116', '2', 'UEFA - EURO U21 Qualifying', 'Israel U21', 'San Marino U21', 'UEFA  U21Q', '2022-06-07 05:00:00', '0', 1, '2022-05-13 03:39:44', '0000-00-00 00:00:00', 1),
(26, 'Football', '397195124', '144', '1', 'Brazil Serie A', 'America MG', 'Ceara', 'BRA D1', '2022-06-08 03:00:00', '0', 1, '2022-05-13 03:39:45', '0000-00-00 00:00:00', 0),
(27, 'Football', '397767129', '17287', '1', 'WK League', 'Boeun Sangmu (w)', 'Sejong Gumi Sportstoto (w)', 'KOR WD1', '2022-06-09 02:00:00', '0', 1, '2022-05-13 03:39:46', '0000-00-00 00:00:00', 1),
(28, 'Football', '478539912', '14116', '2', 'UEFA - EURO U21 Qualifying', 'Turkey U21', 'Kazakhstan U21', 'UEFA  U21Q', '2022-06-10 05:00:00', '0', 1, '2022-05-13 03:39:48', '0000-00-00 00:00:00', 1),
(29, 'Football', '497598121', '162413', '1', 'Austrian 3.Liga', 'Dornbirner SV', 'RW Rankweil', 'AUS D3', '2022-06-11 07:00:00', '0', 1, '2022-05-13 03:39:50', '0000-00-00 00:00:00', 1),
(30, 'Football', '497958121', '174315', '1', 'Brasileiro, Serie C', 'Volta Redonda', 'Remo Belem (PA)', 'BRA D3', '2022-06-12 01:00:00', '0', 1, '2022-05-13 03:39:52', '0000-00-00 00:00:00', 1),
(31, 'Basketball', '24372747', '19267', '0', 'UG Div 1', 'UMU Flames', 'YMCA Hamstars', '0', '2022-05-13 10:00:00', '0', 1, '2022-05-13 03:40:27', '0000-00-00 00:00:00', 0),
(32, 'Basketball', '25262746', '12035', '0', 'LNB', 'Instituto de Cordoba', 'San Martin', '0', '2022-05-14 04:00:00', '0', 1, '2022-05-13 03:40:28', '0000-00-00 00:00:00', 1),
(33, 'Basketball', '35862742', '18648', '0', 'Chilean National Bas', 'Las Animas', 'Leones de Quilpue', '0', '2022-05-15 04:00:00', '0', 1, '2022-05-13 03:40:30', '0000-00-00 00:00:00', 1),
(34, 'Basketball', '38961745', '11517', '0', 'NBB', 'Sao Paulo', 'Vivo Franca', '0', '2022-05-16 04:00:00', '0', 1, '2022-05-13 03:40:31', '0000-00-00 00:00:00', 0),
(35, 'Basketball', '25812747', '11517', '0', 'NBB', 'Pitagoras Minas', 'Flamengo', '0', '2022-05-17 04:00:00', '0', 1, '2022-05-13 03:40:32', '0000-00-00 00:00:00', 1),
(36, 'Basketball', '34962742', '1617', '0', 'Serie A', 'Centrale del Latte Brescia', 'Dinamo Sassari', '0', '2022-05-18 11:30:00', '0', 1, '2022-05-13 03:40:33', '0000-00-00 00:00:00', 1),
(37, 'Basketball', '21861747', '177', '0', 'EURO', 'FC Barcelona', 'Real Madrid Teka', '0', '2022-05-19 12:00:00', '0', 1, '2022-05-13 03:40:34', '0000-00-00 00:00:00', 1),
(38, 'Basketball', '12041748', '122', '0', 'WNBA', 'Atlanta Dream', 'Washington Mystics', '0', '2022-05-20 04:30:00', '0', 1, '2022-05-13 03:40:36', '0000-00-00 00:00:00', 0),
(39, 'Basketball', '26604545', '122', '0', 'WNBA', 'Las Vegas Aces', 'Phoenix Mercury', '0', '2022-05-21 12:00:00', '0', 1, '2022-05-13 03:40:36', '0000-00-00 00:00:00', 1),
(40, 'Basketball', '29604548', '122', '0', 'WNBA', 'Indiana Fever', 'Connecticut Sun', '0', '2022-05-22 12:00:00', '0', 1, '2022-05-13 03:40:37', '0000-00-00 00:00:00', 1),
(41, 'Basketball', '29604548', '122', '0', 'WNBA', 'Indiana Fever', 'Connecticut Sun', '0', '2022-05-22 12:00:00', '0', 1, '2022-05-13 03:40:37', '0000-00-00 00:00:00', 1),
(42, 'Basketball', '22704542', '122', '0', 'WNBA', 'Connecticut Sun', 'Dallas Wings', '0', '2022-05-24 04:00:00', '0', 1, '2022-05-13 03:40:39', '0000-00-00 00:00:00', 1),
(43, 'Basketball', '26804547', '122', '0', 'WNBA', 'Minnesota Lynx', 'New York Liberty', '0', '2022-05-24 05:00:00', '0', 1, '2022-05-13 03:40:39', '0000-00-00 00:00:00', 1),
(44, 'Basketball', '25704545', '122', '0', 'WNBA', 'Connecticut Sun', 'Dallas Wings', '0', '2022-05-26 04:00:00', '0', 1, '2022-05-13 03:40:40', '0000-00-00 00:00:00', 1),
(45, 'Basketball', '26704546', '122', '0', 'WNBA', 'Indiana Fever', 'Los Angeles Sparks', '0', '2022-05-27 04:00:00', '0', 1, '2022-05-13 03:40:41', '0000-00-00 00:00:00', 1),
(46, 'Basketball', '28704548', '122', '0', 'WNBA', 'Connecticut Sun', 'Washington Mystics', '0', '2022-05-28 04:00:00', '0', 1, '2022-05-13 03:40:42', '0000-00-00 00:00:00', 1),
(47, 'Basketball', '20804541', '122', '0', 'WNBA', 'Minnesota Lynx', 'Los Angeles Sparks', '0', '2022-05-29 04:00:00', '0', 1, '2022-05-13 03:40:43', '0000-00-00 00:00:00', 0),
(48, 'Basketball', '20804541', '122', '0', 'WNBA', 'Minnesota Lynx', 'Los Angeles Sparks', '0', '2022-05-29 04:00:00', '0', 1, '2022-05-13 03:40:43', '0000-00-00 00:00:00', 1),
(49, 'Basketball', '39804540', '122', '0', 'WNBA', 'Indiana Fever', 'Washington Mystics', '0', '2022-05-31 04:00:00', '0', 1, '2022-05-13 03:40:44', '0000-00-00 00:00:00', 0),
(50, 'Basketball', '24904546', '122', '0', 'WNBA', 'Atlanta Dream', 'Minnesota Lynx', '0', '2022-06-01 04:00:00', '0', 1, '2022-05-13 03:40:45', '0000-00-00 00:00:00', 1),
(51, 'Basketball', '21910742', '10932', '0', 'ISL', 'Foolad Mahan Esfahan', 'Shahrdary Arak', '0', '2022-06-02 05:00:00', '0', 1, '2022-05-13 03:40:46', '0000-00-00 00:00:00', 1),
(52, 'Basketball', '27904549', '122', '0', 'WNBA', 'Atlanta Dream', 'Chicago Sky', '0', '2022-06-03 04:30:00', '0', 1, '2022-05-13 03:40:47', '0000-00-00 00:00:00', 1),
(53, 'Basketball', '27340745', '1527', '0', 'TBL', 'Petkim Spor', 'Besiktas Cola Turka', '0', '2022-06-04 07:00:00', '0', 1, '2022-05-13 03:40:48', '0000-00-00 00:00:00', 1),
(54, 'Basketball', '15014549', '122', '0', 'WNBA', 'Las Vegas Aces', 'Dallas Wings', '0', '2022-06-05 03:00:00', '0', 1, '2022-05-13 03:40:48', '0000-00-00 00:00:00', 1),
(55, 'Basketball', '39631740', '15410', '0', 'NBL', 'Auckland Huskies', 'Manawatu Jets', '0', '2022-06-05 08:00:00', '0', 1, '2022-05-13 03:40:49', '0000-00-00 00:00:00', 1),
(56, 'Basketball', '26014540', '122', '0', 'WNBA', 'New York Liberty', 'Minnesota Lynx', '0', '2022-06-07 04:00:00', '0', 1, '2022-05-13 03:40:50', '0000-00-00 00:00:00', 1),
(57, 'Basketball', '29014543', '122', '0', 'WNBA', 'Washington Mystics', 'Chicago Sky', '0', '2022-06-08 04:00:00', '0', 1, '2022-05-13 03:40:51', '0000-00-00 00:00:00', 1),
(58, 'Basketball', '28131744', '15410', '0', 'NBL', 'Bay Hawks', 'Southland Sharks', '0', '2022-06-09 12:30:00', '0', 1, '2022-05-13 03:40:52', '0000-00-00 00:00:00', 1),
(59, 'Basketball', '11114546', '122', '0', 'WNBA', 'Indiana Fever', 'New York Liberty', '0', '2022-06-10 04:00:00', '0', 1, '2022-05-13 03:40:53', '0000-00-00 00:00:00', 1),
(60, 'Basketball', '38942744', '12743', '0', 'NBL1N', 'Gold Coast Sea Hawk', 'Rockhampton Rockets', '0', '2022-06-11 03:30:00', '0', 1, '2022-05-13 03:40:54', '0000-00-00 00:00:00', 1),
(61, 'Basketball', '29114544', '122', '0', 'WNBA', 'Minnesota Lynx', 'Indiana Fever', '0', '2022-06-12 04:00:00', '0', 1, '2022-05-13 03:40:55', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` char(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `currency_sym` char(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `auth_token` longtext NOT NULL,
  `phone_prefix` int(11) NOT NULL,
  `phone_number` char(12) NOT NULL,
  `referred_by` int(11) NOT NULL,
  `number_of_referrals` int(11) NOT NULL,
  `is_actual_user` int(11) NOT NULL,
  `last_successful_bet_date` datetime NOT NULL,
  `total_amount_of_successful_bets` int(11) NOT NULL DEFAULT 0,
  `total_commission_earned` int(11) NOT NULL DEFAULT 0,
  `total_withdrawn` int(11) DEFAULT 0,
  `balance_commissions_earned` int(11) NOT NULL DEFAULT 0,
  `wallet_ballance` float NOT NULL DEFAULT 0,
  `is_account_verified` int(11) NOT NULL DEFAULT 0,
  `photo_url` longtext NOT NULL,
  `expiring_date` datetime NOT NULL,
  `date_of_image_upload_image` datetime NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `user_type` int(11) NOT NULL DEFAULT 2 COMMENT '1=>Admin,2=>User',
  `last_login` datetime NOT NULL,
  `pass_key` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `log_in_otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `country_id`, `currency_sym`, `name`, `last_name`, `email`, `password`, `auth_token`, `phone_prefix`, `phone_number`, `referred_by`, `number_of_referrals`, `is_actual_user`, `last_successful_bet_date`, `total_amount_of_successful_bets`, `total_commission_earned`, `total_withdrawn`, `balance_commissions_earned`, `wallet_ballance`, `is_account_verified`, `photo_url`, `expiring_date`, `date_of_image_upload_image`, `is_active`, `user_type`, `last_login`, `pass_key`, `ip_address`, `status`, `created_at`, `updated_at`, `log_in_otp`) VALUES
(1, 'rajukdas', 1, 'XAF', 'raju', 'das', 'rajudas.techexactly@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 'jCp2qJUkDLuDuM0Bij93vVrUGZqWvmpBfqjbyXEhsuSOZzgSi5r1S7Rq8kcx', 91, '9088534772', 0, 0, 1, '2022-02-23 08:13:08', 0, 0, 0, 0, 10000, 1, '', '2022-02-23 08:13:08', '2022-02-23 08:13:08', 1, 1, '2022-05-17 16:03:15', 'Admin@123', '157.40.108.114', 1, '2022-02-23 08:13:08', '2022-05-17 16:03:15', 1638),
(2, 'palashpal008', 1, 'XAF', 'palash', '', 'ppnavkiran@gmail.com', '202cb962ac59075b964b07152d234b70', 'AQVjpt20B2xFHKT1ftjK52kjSLnY1EsxU26XHNmTQU81DIxzpVAkYgNSTyde', 237, '654088375', 0, 0, 0, '2022-02-23 08:15:13', 0, 0, 0, 0, 99.512, 1, '', '2022-02-23 08:15:13', '2022-02-23 08:15:13', 1, 1, '2022-05-18 12:23:49', 'Admin@123', '117.99.91.209', 2, '2022-02-23 08:15:13', '2022-05-18 05:05:59', 0),
(41, 'enammt2', 37, 'XAF', 'Enam Fon', '', 'enammt2@gmail.com', '4eac6d9e6eca456e39c40c7345db197f', 'gHakl6JLVKIj3goKaMZXkKa3AzIBvuI6zmOXgCmWJ4uiOCsCknOqu6t1yfqO', 237, '9732255555', 123, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 65.4215, 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2, '2022-05-18 12:29:03', 'gulf123456', '75.82.176.128', 1, '2022-05-13 21:54:40', '2022-05-18 01:57:08', 8336),
(42, 'Mozzafar', 99, 'XOF', 'Md Mozzafar Ahmed', '', 'mozzafar.techexactly@gmail.com', '202cb962ac59075b964b07152d234b70', 'LOGv35ZlUYJNxhkYalxMgGfOP4z2IIYusejXFPcXYqsWzdki8s7LFmc0XGRv', 91, '7003072439', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 98.4029, 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2, '2022-05-18 12:32:02', '123', '203.163.247.170', 1, '2022-05-16 11:18:16', '2022-05-18 03:14:42', 3267);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bet_id` int(11) NOT NULL,
  `amount` float NOT NULL COMMENT 'in USD',
  `payment_type` varchar(50) NOT NULL COMMENT 'IN,OUT',
  `payment_status` int(11) NOT NULL DEFAULT 0 COMMENT '0:failed,1:success',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wallet_history`
--

INSERT INTO `wallet_history` (`id`, `transaction_id`, `user_id`, `bet_id`, `amount`, `payment_type`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, '20220513093048', 41, 1, 0.158, 'OUT', 0, '2022-05-13 22:00:48', '0000-00-00 00:00:00'),
(2, '20220513093145', 41, 2, 0.158, 'OUT', 0, '2022-05-13 22:01:45', '0000-00-00 00:00:00'),
(3, '20220513093902', 41, 3, 0.158, 'OUT', 0, '2022-05-13 22:09:02', '0000-00-00 00:00:00'),
(4, '20220513124402', 2, 5, 0.158, 'OUT', 0, '2022-05-14 01:14:02', '0000-00-00 00:00:00'),
(5, '20220513124925', 2, 6, 0.158, 'OUT', 0, '2022-05-13 12:49:25', '0000-00-00 00:00:00'),
(6, '20220513125219', 2, 7, 0.158, 'OUT', 0, '2022-05-13 12:52:19', '0000-00-00 00:00:00'),
(7, '20220513125609', 2, 8, 0.158, 'OUT', 0, '2022-05-13 12:56:09', '0000-00-00 00:00:00'),
(8, '20220513130506', 2, 9, 0.158, 'OUT', 0, '2022-05-13 13:05:06', '0000-00-00 00:00:00'),
(9, '20220513130649', 2, 10, 0.158, 'OUT', 0, '2022-05-13 13:06:49', '0000-00-00 00:00:00'),
(10, '20220513130822', 2, 11, 0.158, 'OUT', 0, '2022-05-13 13:08:22', '0000-00-00 00:00:00'),
(11, '20220513131401', 2, 12, 0.158, 'OUT', 0, '2022-05-13 13:14:01', '0000-00-00 00:00:00'),
(12, '20220513131459', 2, 13, 0.158, 'OUT', 0, '2022-05-13 13:14:59', '0000-00-00 00:00:00'),
(13, '20220513131646', 2, 14, 0.158, 'OUT', 0, '2022-05-13 13:16:46', '0000-00-00 00:00:00'),
(14, '20220513131935', 2, 15, 0.158, 'OUT', 0, '2022-05-13 13:19:35', '0000-00-00 00:00:00'),
(15, '20220513132129', 2, 16, 0.1896, 'OUT', 0, '2022-05-13 13:21:29', '0000-00-00 00:00:00'),
(16, '20220513132307', 2, 17, 0.237, 'OUT', 0, '2022-05-13 13:23:07', '0000-00-00 00:00:00'),
(17, '20220513153115', 41, 0, 0.158, 'IN', 0, '2022-05-13 22:31:15', '0000-00-00 00:00:00'),
(18, '20220513162634', 41, 0, 1.58, 'IN', 0, '2022-05-13 23:26:34', '0000-00-00 00:00:00'),
(19, '20220513213033', 2, 25, 0.159, 'OUT', 0, '2022-05-13 21:30:33', '0000-00-00 00:00:00'),
(20, '20220513213802', 2, 26, 0.159, 'OUT', 0, '2022-05-13 21:38:02', '0000-00-00 00:00:00'),
(21, '20220513214431', 2, 27, 0.159, 'OUT', 0, '2022-05-13 21:44:31', '0000-00-00 00:00:00'),
(22, '20220513214720', 2, 28, 0.159, 'OUT', 0, '2022-05-13 21:47:20', '0000-00-00 00:00:00'),
(23, '20220513215209', 2, 29, 0.159, 'OUT', 0, '2022-05-13 21:52:09', '0000-00-00 00:00:00'),
(24, '20220513215253', 2, 30, 0.159, 'OUT', 0, '2022-05-13 21:52:53', '0000-00-00 00:00:00'),
(25, '20220513215443', 2, 31, 0.159, 'OUT', 0, '2022-05-13 21:54:43', '0000-00-00 00:00:00'),
(26, '20220513215731', 2, 32, 0.159, 'OUT', 0, '2022-05-13 21:57:31', '0000-00-00 00:00:00'),
(27, '20220513215858', 2, 33, 0.0795, 'OUT', 0, '2022-05-13 21:58:58', '0000-00-00 00:00:00'),
(28, '20220513215920', 2, 34, 0.0795, 'OUT', 0, '2022-05-13 21:59:20', '0000-00-00 00:00:00'),
(29, '20220513221946', 2, 0, 0.159, 'IN', 0, '2022-05-14 05:19:46', '0000-00-00 00:00:00'),
(30, '20220513222018', 2, 0, 0.159, 'IN', 0, '2022-05-14 05:20:18', '0000-00-00 00:00:00'),
(31, '20220513223054', 2, 0, 0.159, 'IN', 0, '2022-05-14 05:30:54', '0000-00-00 00:00:00'),
(32, '20220515224538', 2, 37, 0.1908, 'OUT', 0, '2022-05-15 22:45:38', '0000-00-00 00:00:00'),
(33, '20220515224716', 2, 38, 0.2385, 'OUT', 0, '2022-05-15 22:47:16', '0000-00-00 00:00:00'),
(34, '20220515233623', 2, 46, 0.159, 'OUT', 0, '2022-05-15 23:36:23', '0000-00-00 00:00:00'),
(35, '20220515235152', 42, 47, 0.08745, 'OUT', 0, '2022-05-15 23:51:52', '0000-00-00 00:00:00'),
(36, '20220515235224', 42, 48, 0.08745, 'OUT', 0, '2022-05-15 23:52:24', '0000-00-00 00:00:00'),
(37, '20220515235453', 42, 49, 0.18285, 'OUT', 0, '2022-05-15 23:54:53', '0000-00-00 00:00:00'),
(38, '20220515235533', 42, 50, 0.18285, 'OUT', 0, '2022-05-15 23:55:33', '0000-00-00 00:00:00'),
(39, '20220515235732', 42, 51, 0.02226, 'OUT', 0, '2022-05-15 23:57:32', '0000-00-00 00:00:00'),
(40, '20220515235903', 42, 52, 0.02226, 'OUT', 0, '2022-05-15 23:59:03', '0000-00-00 00:00:00'),
(41, '20220516001221', 2, 53, 0.2385, 'OUT', 0, '2022-05-16 00:12:21', '0000-00-00 00:00:00'),
(42, '20220516001244', 2, 54, 0.2385, 'OUT', 0, '2022-05-16 00:12:44', '0000-00-00 00:00:00'),
(43, '20220516001607', 42, 55, 0.18285, 'OUT', 0, '2022-05-16 00:16:07', '0000-00-00 00:00:00'),
(44, '20220516001706', 42, 56, 0.18285, 'OUT', 0, '2022-05-16 00:17:06', '0000-00-00 00:00:00'),
(45, '20220516001724', 42, 57, 0.18285, 'OUT', 0, '2022-05-16 00:17:24', '0000-00-00 00:00:00'),
(46, '20220516003926', 2, 58, 0.2385, 'OUT', 0, '2022-05-16 00:39:26', '0000-00-00 00:00:00'),
(47, '20220516040718', 2, 0, 0.159, 'IN', 0, '2022-05-16 11:07:19', '0000-00-00 00:00:00'),
(48, '20220516042917', 42, 59, 0.18285, 'OUT', 0, '2022-05-16 04:29:17', '0000-00-00 00:00:00'),
(49, '20220516051133', 2, 60, 0.318, 'OUT', 0, '2022-05-16 05:11:33', '0000-00-00 00:00:00'),
(50, '20220516052740', 42, 61, 0.18285, 'OUT', 0, '2022-05-16 05:27:40', '0000-00-00 00:00:00'),
(51, '20220516063526', 41, 0, 0.159, 'IN', 0, '2022-05-16 13:35:26', '0000-00-00 00:00:00'),
(52, '20220516133203', 41, 0, 1.59, 'IN', 0, '2022-05-16 20:32:03', '0000-00-00 00:00:00'),
(53, '20220516133829', 41, 0, 0.159, 'IN', 0, '2022-05-16 20:38:29', '0000-00-00 00:00:00'),
(54, '20220516222445', 2, 65, 0.159, 'OUT', 0, '2022-05-16 22:24:45', '0000-00-00 00:00:00'),
(55, '20220516222627', 2, 66, 0.159, 'OUT', 0, '2022-05-16 22:26:27', '0000-00-00 00:00:00'),
(56, '20220516222632', 2, 67, 0.159, 'OUT', 0, '2022-05-16 22:26:32', '0000-00-00 00:00:00'),
(57, '20220516232803', 41, 0, 0.159, 'IN', 0, '2022-05-17 06:28:03', '0000-00-00 00:00:00'),
(58, '20220516233011', 41, 0, 1.59, 'IN', 0, '2022-05-17 06:30:11', '0000-00-00 00:00:00'),
(59, '20220516233737', 41, 0, 0.159, 'IN', 0, '2022-05-17 06:37:37', '0000-00-00 00:00:00'),
(60, '20220517000125', 41, 68, 0.159, 'OUT', 0, '2022-05-17 00:01:25', '0000-00-00 00:00:00'),
(61, '20220517004413', 41, 0, 0.159, 'IN', 0, '2022-05-17 07:44:14', '0000-00-00 00:00:00'),
(62, '20220517005037', 41, 69, 0.0795, 'OUT', 0, '2022-05-17 00:50:37', '0000-00-00 00:00:00'),
(63, '20220517015757', 2, 70, 0.159, 'OUT', 0, '2022-05-17 01:57:57', '0000-00-00 00:00:00'),
(64, '20220517020246', 41, 71, 0.0159, 'OUT', 0, '2022-05-17 02:02:46', '0000-00-00 00:00:00'),
(65, '20220517033412', 2, 72, 0.159, 'OUT', 0, '2022-05-17 03:34:12', '0000-00-00 00:00:00'),
(66, '20220517033505', 2, 0, 0.159, 'IN', 0, '2022-05-17 10:35:05', '0000-00-00 00:00:00'),
(67, '20220517033700', 2, 0, 0.159, 'IN', 0, '2022-05-17 10:37:01', '0000-00-00 00:00:00'),
(68, '20220517033711', 2, 0, 0.159, 'IN', 0, '2022-05-17 10:37:11', '0000-00-00 00:00:00'),
(69, '20220517033920', 2, 0, 0.159, 'IN', 0, '2022-05-17 10:39:21', '0000-00-00 00:00:00'),
(70, '20220517073401', 41, 73, 15.9, 'OUT', 0, '2022-05-17 07:34:01', '0000-00-00 00:00:00'),
(71, '20220517220837', 42, 74, 0.0704, 'OUT', 0, '2022-05-17 22:08:37', '0000-00-00 00:00:00'),
(72, '20220517222547', 42, 75, 0.0048, 'OUT', 0, '2022-05-17 22:25:47', '0000-00-00 00:00:00'),
(73, '20220517222923', 41, 76, 1.9216, 'OUT', 0, '2022-05-17 22:29:23', '0000-00-00 00:00:00'),
(74, '20220517223006', 42, 0, 0.0176, 'IN', 0, '2022-05-18 05:30:06', '0000-00-00 00:00:00'),
(75, '20220517235919', 41, 0, 0.16, 'IN', 0, '2022-05-18 06:59:20', '0000-00-00 00:00:00'),
(76, '20220517235933', 41, 0, 0.16, 'IN', 0, '2022-05-18 06:59:33', '0000-00-00 00:00:00'),
(77, '20220518000153', 41, 77, 0.01712, 'OUT', 0, '2022-05-18 00:01:53', '0000-00-00 00:00:00'),
(78, '20220518000213', 42, 0, 0.1776, 'IN', 0, '2022-05-18 07:02:13', '0000-00-00 00:00:00'),
(79, '20220518014808', 42, 0, 0.0176, 'IN', 0, '2022-05-18 08:48:08', '0000-00-00 00:00:00'),
(81, '20220518020549', 2, 0, 0.16, 'OUT', 0, '2022-05-18 09:05:53', '0000-00-00 00:00:00'),
(82, '20220518021236', 2, 0, 0.16, 'OUT', 0, '2022-05-18 09:12:39', '0000-00-00 00:00:00'),
(83, '20220518021659', 2, 0, 0.0016, 'OUT', 0, '2022-05-18 09:17:03', '2022-05-18 09:17:03'),
(84, '20220518022110', 2, 0, 0.0016, 'OUT', 0, '2022-05-18 09:21:14', '2022-05-18 09:21:14'),
(85, '20220518022244', 2, 0, 0.0016, 'OUT', 0, '2022-05-18 09:22:47', '2022-05-18 09:22:47'),
(86, '20220518023051', 2, 0, 0.16, 'IN', 0, '2022-05-18 09:30:51', '2022-05-18 09:30:51'),
(87, '20220518024711', 2, 0, 0.16, 'IN', 0, '2022-05-18 09:47:12', '2022-05-18 09:47:12'),
(89, '20220518031442', 42, 78, 0.0224, 'OUT', 0, '2022-05-18 03:14:42', '2022-05-18 10:14:42'),
(94, '20220518044918', 2, 0, 0.0016, 'OUT', 0, '2022-05-18 11:49:21', '2022-05-18 11:49:21'),
(95, '20220518045904', 2, 0, 0.0016, 'OUT', 1, '2022-05-18 11:59:08', '2022-05-18 04:59:08'),
(96, '20220518050559', 2, 79, 0.16, 'OUT', 1, '2022-05-18 05:05:59', '2022-05-18 12:05:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bets_info`
--
ALTER TABLE `bets_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `test_payment`
--
ALTER TABLE `test_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upcomming_matches`
--
ALTER TABLE `upcomming_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bets_info`
--
ALTER TABLE `bets_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_payment`
--
ALTER TABLE `test_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `upcomming_matches`
--
ALTER TABLE `upcomming_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
