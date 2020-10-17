-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2020 at 04:38 PM
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
(2, 74, 'anjayani', 'aaaaaanjay', 6614991, 'jl.tanjak anjay turun anjat asoi geboy anjaz', 40404, 'bandung', '2020-10-01 17:39:41', '2020-10-02 02:58:28');

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
(104, 147, 'assets/uploads/1602392557922.png', '2020-10-11 05:02:37', NULL),
(105, 147, 'assets/uploads/1602392557932.png', '2020-10-11 05:02:37', NULL),
(106, 147, 'assets/uploads/1602392557941.png', '2020-10-11 05:02:37', NULL),
(107, 147, 'assets/uploads/1602392557946.png', '2020-10-11 05:02:37', NULL),
(108, 148, 'assets/uploads/1602392565334.png', '2020-10-11 05:02:45', NULL),
(109, 148, 'assets/uploads/1602392565342.png', '2020-10-11 05:02:45', NULL),
(110, 148, 'assets/uploads/1602392565345.png', '2020-10-11 05:02:45', NULL),
(111, 148, 'assets/uploads/1602392565353.png', '2020-10-11 05:02:45', NULL),
(112, 149, 'assets/uploads/1602392566662.png', '2020-10-11 05:02:46', NULL),
(113, 149, 'assets/uploads/1602392566715.png', '2020-10-11 05:02:46', NULL),
(114, 149, 'assets/uploads/1602392566723.png', '2020-10-11 05:02:46', NULL),
(115, 149, 'assets/uploads/1602392566727.png', '2020-10-11 05:02:46', NULL),
(116, 150, 'assets/uploads/1602392567925.png', '2020-10-11 05:02:47', NULL),
(117, 150, 'assets/uploads/1602392567941.png', '2020-10-11 05:02:47', NULL),
(118, 150, 'assets/uploads/1602392567946.png', '2020-10-11 05:02:47', NULL),
(119, 150, 'assets/uploads/1602392567948.png', '2020-10-11 05:02:47', NULL),
(120, 151, 'assets/uploads/1602392568966.png', '2020-10-11 05:02:49', NULL),
(121, 151, 'assets/uploads/1602392568983.png', '2020-10-11 05:02:49', NULL),
(122, 151, 'assets/uploads/1602392568986.png', '2020-10-11 05:02:49', NULL),
(123, 151, 'assets/uploads/1602392568988.png', '2020-10-11 05:02:49', NULL),
(124, 152, 'assets/uploads/1602392570196.png', '2020-10-11 05:02:50', NULL),
(125, 152, 'assets/uploads/1602392570209.png', '2020-10-11 05:02:50', NULL),
(126, 152, 'assets/uploads/1602392570212.png', '2020-10-11 05:02:50', NULL),
(127, 152, 'assets/uploads/1602392570214.png', '2020-10-11 05:02:50', NULL),
(128, 153, 'assets/uploads/1602392571401.png', '2020-10-11 05:02:51', NULL),
(129, 153, 'assets/uploads/1602392571409.png', '2020-10-11 05:02:51', NULL),
(130, 153, 'assets/uploads/1602392571412.png', '2020-10-11 05:02:51', NULL),
(131, 153, 'assets/uploads/1602392571414.png', '2020-10-11 05:02:51', NULL),
(132, 154, 'assets/uploads/1602392572521.png', '2020-10-11 05:02:52', NULL),
(133, 154, 'assets/uploads/1602392572533.png', '2020-10-11 05:02:52', NULL),
(134, 154, 'assets/uploads/1602392572536.png', '2020-10-11 05:02:52', NULL),
(135, 154, 'assets/uploads/1602392572539.png', '2020-10-11 05:02:52', NULL),
(136, 155, 'assets/uploads/1602392573779.png', '2020-10-11 05:02:53', NULL),
(137, 155, 'assets/uploads/1602392573795.png', '2020-10-11 05:02:53', NULL),
(138, 155, 'assets/uploads/1602392573802.png', '2020-10-11 05:02:53', NULL),
(139, 155, 'assets/uploads/1602392573803.png', '2020-10-11 05:02:53', NULL),
(140, 156, 'assets/uploads/1602392574814.png', '2020-10-11 05:02:54', NULL),
(141, 156, 'assets/uploads/1602392574825.png', '2020-10-11 05:02:54', NULL),
(142, 156, 'assets/uploads/1602392574829.png', '2020-10-11 05:02:54', NULL),
(143, 156, 'assets/uploads/1602392574831.png', '2020-10-11 05:02:54', NULL),
(144, 157, 'assets/uploads/1602392618807.png', '2020-10-11 05:03:38', NULL),
(145, 157, 'assets/uploads/1602392618819.png', '2020-10-11 05:03:38', NULL),
(146, 157, 'assets/uploads/1602392618824.png', '2020-10-11 05:03:38', NULL),
(147, 157, 'assets/uploads/1602392618826.png', '2020-10-11 05:03:38', NULL),
(148, 158, 'assets/uploads/1602392657995.png', '2020-10-11 05:04:18', NULL),
(149, 158, 'assets/uploads/1602392658018.png', '2020-10-11 05:04:18', NULL),
(150, 158, 'assets/uploads/1602392658024.png', '2020-10-11 05:04:18', NULL),
(151, 158, 'assets/uploads/1602392658027.png', '2020-10-11 05:04:18', NULL),
(152, 159, 'assets/uploads/1602392761942.png', '2020-10-11 05:06:02', NULL),
(153, 159, 'assets/uploads/1602392761959.png', '2020-10-11 05:06:02', NULL),
(154, 159, 'assets/uploads/1602392761965.png', '2020-10-11 05:06:02', NULL),
(155, 159, 'assets/uploads/1602392761966.png', '2020-10-11 05:06:02', NULL),
(156, 161, 'assets/uploads/1602392811167.png', '2020-10-11 05:06:51', NULL),
(157, 161, 'assets/uploads/1602392811180.png', '2020-10-11 05:06:51', NULL),
(158, 161, 'assets/uploads/1602392811184.png', '2020-10-11 05:06:51', NULL),
(159, 161, 'assets/uploads/1602392811186.png', '2020-10-11 05:06:51', NULL),
(160, 162, 'assets/uploads/1602392885587.png', '2020-10-11 05:08:05', NULL),
(161, 162, 'assets/uploads/1602392885594.png', '2020-10-11 05:08:05', NULL),
(162, 162, 'assets/uploads/1602392885601.png', '2020-10-11 05:08:05', NULL),
(163, 162, 'assets/uploads/1602392885605.png', '2020-10-11 05:08:05', NULL),
(164, 163, 'assets/uploads/1602392887107.png', '2020-10-11 05:08:07', NULL),
(165, 163, 'assets/uploads/1602392887125.png', '2020-10-11 05:08:07', NULL),
(166, 163, 'assets/uploads/1602392887148.png', '2020-10-11 05:08:07', NULL),
(167, 163, 'assets/uploads/1602392887163.png', '2020-10-11 05:08:07', NULL),
(168, 164, 'assets/uploads/1602392888444.png', '2020-10-11 05:08:08', NULL),
(169, 164, 'assets/uploads/1602392888469.png', '2020-10-11 05:08:08', NULL),
(170, 164, 'assets/uploads/1602392888479.png', '2020-10-11 05:08:08', NULL),
(171, 164, 'assets/uploads/1602392888482.png', '2020-10-11 05:08:08', NULL),
(172, 165, 'assets/uploads/1602392889761.png', '2020-10-11 05:08:09', NULL),
(173, 165, 'assets/uploads/1602392889769.png', '2020-10-11 05:08:09', NULL),
(174, 165, 'assets/uploads/1602392889772.png', '2020-10-11 05:08:09', NULL),
(175, 165, 'assets/uploads/1602392889774.png', '2020-10-11 05:08:09', NULL),
(176, 166, 'assets/uploads/1602392890828.png', '2020-10-11 05:08:10', NULL),
(177, 166, 'assets/uploads/1602392890836.png', '2020-10-11 05:08:10', NULL),
(178, 166, 'assets/uploads/1602392890840.png', '2020-10-11 05:08:10', NULL),
(179, 166, 'assets/uploads/1602392890841.png', '2020-10-11 05:08:10', NULL),
(180, 167, 'assets/uploads/1602392891840.png', '2020-10-11 05:08:11', NULL),
(181, 167, 'assets/uploads/1602392891848.png', '2020-10-11 05:08:11', NULL),
(182, 167, 'assets/uploads/1602392891853.png', '2020-10-11 05:08:11', NULL),
(183, 167, 'assets/uploads/1602392891858.png', '2020-10-11 05:08:11', NULL),
(184, 168, 'assets/uploads/1602392892902.png', '2020-10-11 05:08:12', NULL),
(185, 168, 'assets/uploads/1602392892912.png', '2020-10-11 05:08:12', NULL),
(186, 168, 'assets/uploads/1602392892926.png', '2020-10-11 05:08:12', NULL),
(187, 168, 'assets/uploads/1602392892928.png', '2020-10-11 05:08:12', NULL),
(188, 169, 'assets/uploads/1602392893777.png', '2020-10-11 05:08:13', NULL),
(189, 169, 'assets/uploads/1602392893795.png', '2020-10-11 05:08:13', NULL),
(190, 169, 'assets/uploads/1602392893799.png', '2020-10-11 05:08:13', NULL),
(191, 169, 'assets/uploads/1602392893804.png', '2020-10-11 05:08:13', NULL),
(192, 170, 'assets/uploads/1602392894892.png', '2020-10-11 05:08:14', NULL),
(193, 170, 'assets/uploads/1602392894897.png', '2020-10-11 05:08:14', NULL),
(194, 170, 'assets/uploads/1602392894905.png', '2020-10-11 05:08:14', NULL),
(195, 170, 'assets/uploads/1602392894907.png', '2020-10-11 05:08:14', NULL),
(196, 171, 'assets/uploads/1602393221954.png', '2020-10-11 05:13:42', NULL),
(197, 171, 'assets/uploads/1602393221968.png', '2020-10-11 05:13:42', NULL),
(198, 171, 'assets/uploads/1602393221980.png', '2020-10-11 05:13:42', NULL),
(199, 171, 'assets/uploads/1602393221983.png', '2020-10-11 05:13:42', NULL),
(200, 172, 'assets/uploads/1602397956690.png', '2020-10-11 06:32:36', NULL),
(201, 172, 'assets/uploads/1602397956705.png', '2020-10-11 06:32:36', NULL),
(202, 172, 'assets/uploads/1602397956719.png', '2020-10-11 06:32:36', NULL),
(203, 172, 'assets/uploads/1602397956725.png', '2020-10-11 06:32:36', NULL);

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
(147, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:37', '2020-10-11 05:02:37'),
(148, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:45', '2020-10-11 05:02:45'),
(149, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:46', '2020-10-11 05:02:46'),
(150, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:47', '2020-10-11 05:02:47'),
(151, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:48', '2020-10-11 05:02:48'),
(152, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:50', '2020-10-11 05:02:50'),
(153, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:51', '2020-10-11 05:02:51'),
(154, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:52', '2020-10-11 05:02:52'),
(155, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:53', '2020-10-11 05:02:53'),
(156, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:02:54', '2020-10-11 05:02:54'),
(157, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:03:38', '2020-10-11 05:03:38'),
(158, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:04:18', '2020-10-11 05:04:18'),
(159, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:06:02', '2020-10-11 05:06:02'),
(160, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:06:35', '2020-10-11 05:06:35'),
(161, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 1, 29, '2020-10-11 05:06:51', '2020-10-11 05:06:51'),
(162, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:05', '2020-10-11 05:08:05'),
(163, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:07', '2020-10-11 05:08:07'),
(164, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:08', '2020-10-11 05:08:08'),
(165, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:09', '2020-10-11 05:08:09'),
(166, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:10', '2020-10-11 05:08:10'),
(167, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:11', '2020-10-11 05:08:11'),
(168, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:12', '2020-10-11 05:08:12'),
(169, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:13', '2020-10-11 05:08:13'),
(170, 't-shirt screamous ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:08:14', '2020-10-11 05:08:14'),
(171, 'baju gaul ', 120000, 'baju anak muda ternma di bandung', 14, 1, 2, 29, '2020-10-11 05:13:42', '2020-10-11 05:13:42'),
(172, 'baju gaul ', 120000, 'baju anak muda ternma di bandung', 4, 1, 2, 29, '2020-10-11 06:32:36', '2020-10-11 06:32:36');

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
  ADD KEY `color_id` (`color_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

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
  ADD CONSTRAINT `items_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
