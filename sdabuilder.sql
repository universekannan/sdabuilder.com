-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2024 at 06:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livebuilders`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `banner_title` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `banner_url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `banner_name`, `status`, `photo`, `banner_title`, `description`, `banner_url`) VALUES
(1, 'SATISFACTION', '1', '1.png', 'SATISFACTION', '99% Guaranteed Satisfaction', ''),
(2, 'ORIGNAL PRODUCTS', '1', '2.png', NULL, '100% Authentic & Branded Products', 'orignal_products'),
(3, 'DEALS', '1', '3.png', NULL, 'Transparent & Competitive Best Pricing', 'deals'),
(4, 'as', '1', NULL, NULL, 'fbg', 'as');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT '0',
  `subject` varchar(50) DEFAULT '0',
  `message` varchar(200) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT '0',
  `phone` varchar(50) DEFAULT '0',
  `status` varchar(20) DEFAULT NULL,
  `enquiry_date` datetime(6) DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`id`, `full_name`, `subject`, `message`, `email_address`, `phone`, `status`, `enquiry_date`) VALUES
(1, 'ashick', 'testing', NULL, 'administrator', '8072378567', '0', '2024-10-21 15:11:37.000000'),
(4, 'ashick', 'testing', NULL, 'administrator', '8072378567', '1', '2024-10-21 15:31:16.000000'),
(5, 'ashick', 'testing', NULL, 'administrator', '8072378567', '1', NULL),
(7, 'ashick', 'testing', NULL, 'administrator', '8072378567', '1', NULL),
(8, 'rudra', 'testing', NULL, 'administrator', '8072378264', '1', '2024-10-22 14:34:16.000000'),
(9, 'ashick', 'testing', NULL, 'administrator', '8072378264', '0', '2024-10-22 14:34:32.000000');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL ,
  `project_status_id` int(20) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `project_owner` varchar(50) DEFAULT NULL,
  `project_mobile` varchar(20) DEFAULT NULL,
  `project_email` varchar(50) DEFAULT NULL,
  `project_amount` varchar(10) DEFAULT NULL,
  `project_address` varchar(500) DEFAULT NULL,
  `photo` varchar(10) DEFAULT NULL,
  `pro_old_balance` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_status_id`, `project_name`, `project_owner`, `project_mobile`, `project_email`, `project_amount`, `project_address`, `photo`, `pro_old_balance`, `user_id`, `date`) VALUES
(13, 2, 'Ashick', 'testing', '8072378264', 'alone@gmail.com', '5000', 'derik', '13.jpg', NULL, NULL, NULL),
(14, 2, 'deva', 'ashicktesting', '8072378264', 'alone@gmail.com', '5000', 'Nagercoil', '14.jpg', NULL, NULL, NULL),
(21, 1, 'JAGUAR', 'testing', '8072378264', 'ashickk@gmail.com', '5000', 'mela ramanputhor.', '21.jpg', NULL, NULL, NULL),
(22, 3, 'MICHEAL', 'testing', '8072546437', 'Qwert@gmail.com', '5000', 'Rithapuram', '22.jpg', NULL, NULL, NULL),
(23, 1, 'Ashick', 'testing', '8072378264', 'ashickk@gmail.com', '5000', 'saligramam', '23.jpg', NULL, NULL, NULL),
(24, 3, 'Ashick', 'testing', '8072546437', 'ashickk@gmail.com', '5000', 'Gopichettipalayam', '24.jpg', NULL, NULL, NULL),
(26, 1, 'Aara', 'testing', '8072546437', 'Qwert@gmail.com', '5000', 'Derik junction', '26.jpg', NULL, NULL, NULL),
(27, 2, 'NP', 'testing', '8072546437', 'Qwert@gmail.com', '5000', 'Nagercoil', '27.jpg', NULL, NULL, NULL),
(28, 3, 'Kingslee', 'testing', '8072546437', 'Qwert@gmail.com', '5000', 'Kanniyakumari', '28.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_image`
--

CREATE TABLE `project_image` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_image`
--

INSERT INTO `project_image` (`id`, `project_id`, `photo`, `s_id`) VALUES
(14, 12, 'veni-12.jpg', NULL),
(15, 12, 'veni-12.jpg', NULL),
(16, 13, 'deva-13.jpg', NULL),
(17, 14, 'deva-14.jpg', NULL),
(18, 23, 'ashick-23.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `id` int(11) NOT NULL,
  `project_status_name` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`id`, `project_status_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Upcoming Projects', 1, NULL, NULL),
(2, 'Progress Projects', 1, NULL, NULL),
(3, 'Completed Projects', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `user_type_id` int(10) DEFAULT NULL,
  `full_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `designation` varchar(20) NOT NULL,
  `mobile` int(11) NOT NULL,
  `facebook` varchar(1000) NOT NULL,
  `twitter` varchar(1000) NOT NULL,
  `linkedin` varchar(1000) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(10) NOT NULL,
  `photo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `full_name`, `email`, `password`, `designation`, `mobile`, `facebook`, `twitter`, `linkedin`, `address`, `status`, `date`, `user_id`, `photo`) VALUES
(1, 1, 'Live Builders', 'livebuilders@gmail.com', '$2y$10$gMKkB0s2IF/iUDcIhThk9esA0QKrU/g3/yQqv4lOtqN/trTrhjOwq', '12345', 1234567890, 'CEO', 'Managing Director', 'linked.com', 'Kanyakumari', 'Active', '2019-05-15', 0, '1-u.php');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `user_type_name` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `user_type_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '1', NULL, NULL),
(2, 'Staff', '1', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_image`
--
ALTER TABLE `project_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `project_image`
--
ALTER TABLE `project_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
