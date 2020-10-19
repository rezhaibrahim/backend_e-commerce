-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 19, 2020 at 08:21 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `recipient_name` varchar(30) NOT NULL,
  `recipient_phone` bigint(12) NOT NULL,
  `address` text NOT NULL,
  `postal_code` int(11) NOT NULL,
  `city` varchar(20) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `recipient_name`, `recipient_phone`, `address`, `postal_code`, `city`, `create_at`, `update_at`) VALUES
(2, 74, 'anjayani', 'aaaaaanjay', 6614991, 'jl.tanjak anjay turun anjat asoi geboy anjaz', 40404, 'bandung', '2020-10-01 17:39:41', '2020-10-02 02:58:28'),
(4, 80, 'rumahkita', 'rumahasaya', 6614991, 'jl.tanjak anjay turun anjat asoi geboy anjaz', 40404, 'bandung', '2020-10-19 04:47:52', '2020-10-19 04:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `create_at`, `update_at`) VALUES
(1, 'Tie', '/uploads/1601564738789.png', '2020-10-01 15:05:38', '0000-00-00 00:00:00'),
(2, 'shorts', '/uploads/1601564759882.png', '2020-10-01 15:05:59', '0000-00-00 00:00:00'),
(3, 'shoes', '/uploads/1601564774074.png', '2020-10-01 15:06:14', '0000-00-00 00:00:00'),
(4, 'shocks', '/uploads/1601564788731.png', '2020-10-01 15:06:28', '0000-00-00 00:00:00'),
(5, 'pants', '/uploads/1601564805085.png', '2020-10-01 15:06:45', '0000-00-00 00:00:00'),
(6, 'jacket', '/uploads/1601564818067.png', '2020-10-01 15:06:58', '0000-00-00 00:00:00'),
(7, 'handbag', '/uploads/1601564833781.png', '2020-10-01 15:07:13', '0000-00-00 00:00:00'),
(8, 'glasses', '/uploads/1601564849731.png', '2020-10-01 15:07:29', '0000-00-00 00:00:00'),
(9, 'formal suit', '/uploads/1601564867981.png', '2020-10-01 15:07:47', '0000-00-00 00:00:00'),
(10, 'cap', '/uploads/1601564897320.png', '2020-10-01 15:08:17', '0000-00-00 00:00:00'),
(11, 'bagback', '/uploads/1601564917132.png', '2020-10-01 15:08:37', '0000-00-00 00:00:00'),
(12, 'accessories', '/uploads/1601564933473.png', '2020-10-01 15:08:53', '0000-00-00 00:00:00'),
(13, 'wrise watch', '/uploads/1601564950988.png', '2020-10-01 15:09:10', '0000-00-00 00:00:00'),
(14, 'T-shirt', '/uploads/1601564969611.png', '2020-10-01 15:09:29', '0000-00-00 00:00:00'),
(15, 'High Heels', '/uploads/1601564990647.png', '2020-10-01 15:09:50', '0000-00-00 00:00:00'),
(16, 'Dress', '/uploads/1601565011708.png', '2020-10-01 15:10:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(12) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'Black', '2020-09-29 16:03:36', '2020-09-29 16:03:36'),
(2, 'RED', '2020-09-29 16:04:12', '2020-09-29 16:04:12'),
(3, 'Blue', '2020-09-29 16:04:19', '2020-09-29 16:04:19'),
(4, 'Green', '2020-09-29 16:04:28', '2020-09-29 16:04:28'),
(5, 'Yellow', '2020-09-29 16:04:37', '2020-09-29 16:04:37'),
(6, 'Purple', '2020-09-29 16:19:25', '2020-09-29 16:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'NEW', '2020-09-29 16:19:39', '2020-09-29 16:19:39'),
(2, 'POPULAR', '2020-09-29 16:19:48', '2020-10-11 05:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(12) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'Pria', '2020-09-27 05:02:28', '2020-09-27 05:02:28'),
(2, 'Wanita', '2020-09-27 05:02:28', '2020-09-27 05:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `items_id`, `picture`, `create_at`, `update_at`) VALUES
(204, 174, 'assets/uploads/1603084918490.png', '2020-10-19 05:21:58', NULL),
(205, 174, 'assets/uploads/1603084918493.png', '2020-10-19 05:21:58', NULL),
(206, 174, 'assets/uploads/1603084918497.png', '2020-10-19 05:21:58', NULL),
(207, 174, 'assets/uploads/1603084918512.png', '2020-10-19 05:21:58', NULL),
(208, 175, 'assets/uploads/1603084935826.png', '2020-10-19 05:22:15', NULL),
(209, 175, 'assets/uploads/1603084935832.png', '2020-10-19 05:22:15', NULL),
(210, 175, 'assets/uploads/1603084935835.png', '2020-10-19 05:22:15', NULL),
(211, 175, 'assets/uploads/1603084935857.png', '2020-10-19 05:22:15', NULL),
(212, 176, 'assets/uploads/1603084937578.png', '2020-10-19 05:22:17', NULL),
(213, 176, 'assets/uploads/1603084937580.png', '2020-10-19 05:22:17', NULL),
(214, 176, 'assets/uploads/1603084937583.png', '2020-10-19 05:22:17', NULL),
(215, 176, 'assets/uploads/1603084937587.png', '2020-10-19 05:22:17', NULL),
(216, 177, 'assets/uploads/1603084939147.png', '2020-10-19 05:22:19', NULL),
(217, 177, 'assets/uploads/1603084939150.png', '2020-10-19 05:22:19', NULL),
(218, 177, 'assets/uploads/1603084939157.png', '2020-10-19 05:22:19', NULL),
(219, 177, 'assets/uploads/1603084939166.png', '2020-10-19 05:22:19', NULL),
(220, 178, 'assets/uploads/1603084940528.png', '2020-10-19 05:22:20', NULL),
(221, 178, 'assets/uploads/1603084940529.png', '2020-10-19 05:22:20', NULL),
(222, 178, 'assets/uploads/1603084940535.png', '2020-10-19 05:22:20', NULL),
(223, 178, 'assets/uploads/1603084940539.png', '2020-10-19 05:22:20', NULL),
(224, 179, 'assets/uploads/1603084941846.png', '2020-10-19 05:22:21', NULL),
(225, 179, 'assets/uploads/1603084941848.png', '2020-10-19 05:22:21', NULL),
(226, 179, 'assets/uploads/1603084941855.png', '2020-10-19 05:22:21', NULL),
(227, 179, 'assets/uploads/1603084941861.png', '2020-10-19 05:22:21', NULL),
(228, 180, 'assets/uploads/1603084943155.png', '2020-10-19 05:22:23', NULL),
(229, 180, 'assets/uploads/1603084943157.png', '2020-10-19 05:22:23', NULL),
(230, 180, 'assets/uploads/1603084943159.png', '2020-10-19 05:22:23', NULL),
(231, 180, 'assets/uploads/1603084943164.png', '2020-10-19 05:22:23', NULL),
(232, 181, 'assets/uploads/1603084944452.png', '2020-10-19 05:22:24', NULL),
(233, 181, 'assets/uploads/1603084944453.png', '2020-10-19 05:22:24', NULL),
(234, 181, 'assets/uploads/1603084944455.png', '2020-10-19 05:22:24', NULL),
(235, 181, 'assets/uploads/1603084944458.png', '2020-10-19 05:22:24', NULL),
(236, 182, 'assets/uploads/1603084945631.png', '2020-10-19 05:22:25', NULL),
(237, 182, 'assets/uploads/1603084945633.png', '2020-10-19 05:22:25', NULL),
(238, 182, 'assets/uploads/1603084945637.png', '2020-10-19 05:22:25', NULL),
(239, 182, 'assets/uploads/1603084945688.png', '2020-10-19 05:22:25', NULL),
(240, 183, 'assets/uploads/1603084946786.png', '2020-10-19 05:22:26', NULL),
(241, 183, 'assets/uploads/1603084946790.png', '2020-10-19 05:22:26', NULL),
(242, 183, 'assets/uploads/1603084946792.png', '2020-10-19 05:22:26', NULL),
(243, 183, 'assets/uploads/1603084946799.png', '2020-10-19 05:22:26', NULL),
(244, 184, 'assets/uploads/1603084997170.png', '2020-10-19 05:23:17', NULL),
(245, 184, 'assets/uploads/1603084997172.png', '2020-10-19 05:23:17', NULL),
(246, 184, 'assets/uploads/1603084997176.png', '2020-10-19 05:23:17', NULL),
(247, 184, 'assets/uploads/1603084997178.png', '2020-10-19 05:23:17', NULL),
(248, 185, 'assets/uploads/1603084998429.png', '2020-10-19 05:23:18', NULL),
(249, 185, 'assets/uploads/1603084998430.png', '2020-10-19 05:23:18', NULL),
(250, 185, 'assets/uploads/1603084998433.png', '2020-10-19 05:23:18', NULL),
(251, 185, 'assets/uploads/1603084998438.png', '2020-10-19 05:23:18', NULL),
(252, 186, 'assets/uploads/1603084999948.png', '2020-10-19 05:23:19', NULL),
(253, 186, 'assets/uploads/1603084999950.png', '2020-10-19 05:23:19', NULL),
(254, 186, 'assets/uploads/1603084999952.png', '2020-10-19 05:23:19', NULL),
(255, 186, 'assets/uploads/1603084999954.png', '2020-10-19 05:23:19', NULL),
(256, 187, 'assets/uploads/1603085001085.png', '2020-10-19 05:23:21', NULL),
(257, 187, 'assets/uploads/1603085001086.png', '2020-10-19 05:23:21', NULL),
(258, 187, 'assets/uploads/1603085001093.png', '2020-10-19 05:23:21', NULL),
(259, 187, 'assets/uploads/1603085001095.png', '2020-10-19 05:23:21', NULL),
(260, 188, 'assets/uploads/1603085002357.png', '2020-10-19 05:23:22', NULL),
(261, 188, 'assets/uploads/1603085002358.png', '2020-10-19 05:23:22', NULL),
(262, 188, 'assets/uploads/1603085002366.png', '2020-10-19 05:23:22', NULL),
(263, 188, 'assets/uploads/1603085002371.png', '2020-10-19 05:23:22', NULL),
(264, 189, 'assets/uploads/1603085003877.png', '2020-10-19 05:23:23', NULL),
(265, 189, 'assets/uploads/1603085003878.png', '2020-10-19 05:23:23', NULL),
(266, 189, 'assets/uploads/1603085003885.png', '2020-10-19 05:23:23', NULL),
(267, 189, 'assets/uploads/1603085003886.png', '2020-10-19 05:23:23', NULL),
(268, 190, 'assets/uploads/1603085005010.png', '2020-10-19 05:23:25', NULL),
(269, 190, 'assets/uploads/1603085005014.png', '2020-10-19 05:23:25', NULL),
(270, 190, 'assets/uploads/1603085005016.png', '2020-10-19 05:23:25', NULL),
(271, 190, 'assets/uploads/1603085005017.png', '2020-10-19 05:23:25', NULL),
(272, 191, 'assets/uploads/1603085006067.png', '2020-10-19 05:23:26', NULL),
(273, 191, 'assets/uploads/1603085006069.png', '2020-10-19 05:23:26', NULL),
(274, 191, 'assets/uploads/1603085006071.png', '2020-10-19 05:23:26', NULL),
(275, 191, 'assets/uploads/1603085006072.png', '2020-10-19 05:23:26', NULL),
(276, 192, 'assets/uploads/1603085007385.png', '2020-10-19 05:23:27', NULL),
(277, 192, 'assets/uploads/1603085007387.png', '2020-10-19 05:23:27', NULL),
(278, 192, 'assets/uploads/1603085007389.png', '2020-10-19 05:23:27', NULL),
(279, 192, 'assets/uploads/1603085007390.png', '2020-10-19 05:23:27', NULL),
(280, 193, 'assets/uploads/1603085008361.png', '2020-10-19 05:23:28', NULL),
(281, 193, 'assets/uploads/1603085008363.png', '2020-10-19 05:23:28', NULL),
(282, 193, 'assets/uploads/1603085008366.png', '2020-10-19 05:23:28', NULL),
(283, 193, 'assets/uploads/1603085008368.png', '2020-10-19 05:23:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(12) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `description`, `category_id`, `color_id`, `condition_id`, `seller_id`, `create_at`, `update_at`) VALUES
(174, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:21:58', '2020-10-19 05:21:58'),
(175, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:15', '2020-10-19 05:22:15'),
(176, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:17', '2020-10-19 05:22:17'),
(177, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:19', '2020-10-19 05:22:19'),
(178, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:20', '2020-10-19 05:22:20'),
(179, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:21', '2020-10-19 05:22:21'),
(180, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:23', '2020-10-19 05:22:23'),
(181, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:24', '2020-10-19 05:22:24'),
(182, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:25', '2020-10-19 05:22:25'),
(183, 'T-SHIRT screamouse black', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-19 05:22:26', '2020-10-19 05:22:26'),
(184, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:17', '2020-10-19 05:23:17'),
(185, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:18', '2020-10-19 05:23:18'),
(186, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:19', '2020-10-19 05:23:19'),
(187, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:21', '2020-10-19 05:23:21'),
(188, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:22', '2020-10-19 05:23:22'),
(189, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:23', '2020-10-19 05:23:23'),
(190, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:25', '2020-10-19 05:23:25'),
(191, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:26', '2020-10-19 05:23:26'),
(192, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:27', '2020-10-19 05:23:27'),
(193, 'T-SHIRT The simpson', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-19 05:23:28', '2020-10-19 05:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `items_id`, `user_id`, `rating`, `created_at`, `updated_at`) VALUES
(5, 174, 80, 4, '2020-10-19 05:23:56', '2020-10-19 05:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'ADMIN', '2020-09-27 13:51:28', '2020-09-29 02:57:52'),
(2, 'CUSTOMER', '2020-09-27 13:51:28', '2020-09-29 02:58:23'),
(3, 'SELLER', '2020-09-27 13:51:47', '2020-09-29 06:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `information` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `user_id`, `information`) VALUES
(2, 'tokoBaju', 53, 'toko baju terpercaya'),
(4, 'storekokom', 78, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(225) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `items_name` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `qty` int(12) NOT NULL,
  `total_price` int(12) NOT NULL,
  `delivery_fee` int(12) NOT NULL,
  `summary` int(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_id`, `seller_id`, `user_id`, `items_name`, `price`, `qty`, `total_price`, `delivery_fee`, `summary`, `created_at`) VALUES
(7, 'BLANJA1603083187592', 29, 80, 'baju gaul ', 120000, 2, 240000, 10000, 250000, '2020-10-19 04:53:07'),
(8, 'BLANJA1603083187592', 29, 80, 'baju gaul ', 120000, 2, 240000, 10000, 250000, '2020-10-19 04:53:07'),
(9, 'BLANJA1603083187592', 29, 80, 'baju gaul ', 120000, 2, 240000, 10000, 250000, '2020-10-19 04:53:07'),
(10, 'BLANJA1603083187592', 29, 80, 'baju gaul ', 120000, 2, 240000, 10000, 250000, '2020-10-19 04:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `userDetail`
--

CREATE TABLE `userDetail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` bigint(12) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `birthdate` varchar(20) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userDetail`
--

INSERT INTO `userDetail` (`id`, `user_id`, `name`, `phone`, `gender_id`, `birthdate`, `image`, `create_at`, `update_at`) VALUES
(8, 25, 'ADMIN', 8121313, 1, '12/12/12', '', '2020-09-27 13:53:12', '2020-09-27 13:53:12'),
(9, 27, 'ADMIN', 8121313, 1, '12/12/12', '', '2020-09-27 13:54:09', '2020-09-27 13:54:09'),
(10, 28, 'titi', 812321313, 1, '11/11/11', '', '2020-09-27 13:55:41', '2020-09-27 13:55:41'),
(11, 29, 'mangoleh', 8121313, 2, '12/12/12', '', '2020-09-27 14:00:16', '2020-09-27 14:00:16'),
(13, 31, 'MIMIN', 8121313, 1, '12/12/12', '', '2020-09-29 02:48:55', '2020-09-29 02:48:55'),
(23, 53, 'jaya', 816236, 1, '10/10/10', '/uploads/1601372781527.png', '2020-09-29 09:46:21', '2020-09-29 09:46:21'),
(25, 55, 'adit', 813706934, 1, '03/03/1996', '/uploads/1601471861989.JPG', '2020-09-30 13:17:42', '2020-09-30 13:17:42'),
(26, 56, 'siganteng', 813706234, 1, '03/03/1996', '/uploads/1601471898829.JPG', '2020-09-30 13:18:19', '2020-09-30 13:18:19'),
(27, 57, 'ibra', 813706223, 1, '03/03/1996', '/uploads/1601522796558.JPG', '2020-10-01 03:24:08', '2020-10-01 03:26:36'),
(30, 74, 'bambino', 813706908, 1, '03/03/1996', '/uploads/1601606614791.JPG', '2020-10-01 17:15:54', '2020-10-02 02:43:35'),
(34, 78, 'sarkom', 6624981, NULL, NULL, NULL, '2020-10-01 17:23:00', '2020-10-01 17:23:00'),
(35, 79, 'zara', 3453466, 1, '03/03/1996', '/uploads/1602393402649.JPG', '2020-10-02 02:54:23', '2020-10-11 05:16:42'),
(36, 80, 'babaku', 56754464, 1, '03/03/1996', '/uploads/1602393501628.JPG', '2020-10-11 04:15:49', '2020-10-11 05:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `email`, `password`, `create_at`, `update_at`) VALUES
(25, 1, 'asdf@mail.com', '$2b$10$fqJ.Sgwo/YMNXGKTUWt7r.weEOldaG4xXPstJGQwNOXziDKe5jCQG', '2020-09-27 13:53:12', '2020-09-27 13:53:12'),
(27, 1, 'admin@mail.com', '$2b$10$LVYADwkTcOcGkVLlIs63weI5ZKv4pHhVIsFzbqYMmzJ/Ev1ZFT47K', '2020-09-27 13:54:09', '2020-09-27 13:54:09'),
(28, 2, 'titi@mail.com', '$2b$10$XmSkJdGHa8a9z2NL7l0e6e0y1ccFZAUaDzvGNLhvJSVBQyA/eqZwa', '2020-09-27 13:55:41', '2020-09-27 13:55:41'),
(29, 3, 'odading@mail.com', '$2b$10$p8rYkgAexlT07gJ/sGbH/uWrMByLOkWgMQL1gUrD81QxGnaanXoqu', '2020-09-27 14:00:16', '2020-09-27 14:00:16'),
(31, 1, 'mimin@mail.com', '$2b$10$SNLyYGy9gS6/2kDrEMvtqeeDpck9/7Ai2gHViPc.kp7my7N97PMQ6', '2020-09-29 02:48:55', '2020-09-29 02:48:55'),
(39, 1, 'maman@mail.com', '$2b$10$p5Hy95Q553XyB4.k0O5uH.68QFuXCAjvp8g/t97MgadPCAMeyduQ.', '2020-09-29 09:00:23', '2020-09-29 09:00:23'),
(53, 3, 'tokobaju@gmail.com', '$2b$10$UxPIipExeT.IFz2iRwMioODwfY1JGqITVRs4ScvCaQ8lKU.xFSA6W', '2020-09-29 09:46:21', '2020-09-29 09:46:21'),
(55, 2, 'adit@gmail.com', '$2b$10$xxp7Jx90doHCz87ep7/q.eAv4ke31RFpMvU0/vfYMg8CFjUDipHbm', '2020-09-30 13:17:42', '2020-09-30 13:17:42'),
(56, 2, 'ganteng@gmail.com', '$2b$10$Bbm9dVQbZkoKX687bcV3DO3oGiJdq9gtNjJFVPkATjnkizCAa72hu', '2020-09-30 13:18:19', '2020-09-30 13:18:19'),
(57, 2, 'email@gmail.com', '$2b$10$tJmC9CmzvtHx4sUz7g/9YehA0DR3kooYuSUHzN3gsj3UeZUVJfeB.', '2020-10-01 03:24:08', '2020-10-01 03:26:36'),
(74, 2, 'bambang@gmail.com', '$2b$10$4EO3j1HdI8tbR/gadvoTJOz6hAdytY668KbfXyKSq2we1gSrsoM8a', '2020-10-01 17:15:54', '2020-10-02 02:43:35'),
(78, 3, 'kokom@mail.com', '$2b$10$Z9hO0ax6800jqWEoJwF7xOqk310mtrSJgd6aCjWWUgwQUad9vY6Ua', '2020-10-01 17:23:00', '2020-10-01 17:23:00'),
(79, 2, 'tara@gmail.com', '$2b$10$rvk5DdWBSXjlCh6jj92TruGSuqCnA38nUQaYWKTn.5m1DpFLgc1hq', '2020-10-02 02:54:23', '2020-10-11 05:16:42'),
(80, 2, 'baba@gmail.com', '$2b$10$aTkdemWzoMpZVGU1ATBKPOu8fKe02LPq0vzjb.bL.jujDraQ5lN8a', '2020-10-11 04:15:49', '2020-10-11 05:18:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_id` (`items_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_id` (`items_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `items_ibfk_2` (`category_id`),
  ADD KEY `items_ibfk_3` (`condition_id`),
  ADD KEY `items_ibfk_4` (`color_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_id` (`items_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_ibfk_1` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `userDetail`
--
ALTER TABLE `userDetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`user_id`),
  ADD KEY `userDetail_ibfk_2` (`gender_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `userDetail`
--
ALTER TABLE `userDetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`condition_id`) REFERENCES `conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `userDetail`
--
ALTER TABLE `userDetail`
  ADD CONSTRAINT `userDetail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userDetail_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
