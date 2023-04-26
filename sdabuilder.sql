-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2023 at 03:19 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdabuilder`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_project`
--

CREATE TABLE `assign_project` (
  `id` int(11) NOT NULL,
  `assign_project_id` int(11) DEFAULT NULL,
  `assign_project_user_id` int(11) DEFAULT NULL,
  `assign_project_description` varchar(1000) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` varchar(10) NOT NULL,
  `time_out` varchar(10) DEFAULT NULL,
  `states` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Completed Projects', 'Active'),
(2, 'Progress Projects', 'Active'),
(3, 'Upcoming Projects', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `chat_message` varchar(500) DEFAULT NULL,
  `to_id` int(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `user_id`, `chat_message`, `to_id`, `date`) VALUES
(1, 1, 'Y', NULL, '2021-05-30 09:34:54'),
(2, 1, 'Y', NULL, '2021-05-30 09:37:31'),
(3, 1, 'Ol', NULL, '2021-05-31 10:35:13'),
(4, 1, 'Ol', NULL, '2021-05-31 10:35:31'),
(5, 3, 'Hi', NULL, '2021-06-10 13:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `equipment_name` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `stock` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `id` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `more_images`
--

CREATE TABLE `more_images` (
  `id` int(10) NOT NULL,
  `products_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `payed` varchar(100) DEFAULT NULL,
  `balance` varchar(100) DEFAULT NULL,
  `old_balance` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `states` varchar(10) DEFAULT NULL,
  `staff_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `project_id`, `description`, `amount`, `payed`, `balance`, `old_balance`, `user_id`, `date`, `states`, `staff_id`) VALUES
(1, 2, 'ddd', NULL, '100000', '2100000', '2200000', 1, '2020-08-02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `category_id` int(10) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `category_id`, `project_name`, `project_owner`, `project_mobile`, `project_email`, `project_amount`, `project_address`, `photo`, `pro_old_balance`, `user_id`, `date`) VALUES
(1, 1, 'House', 'Ahamathu', '9585916253', 'ahamathu@gmail.com', '800000', 'Thiruvithancode', '1.jpg', NULL, 1, NULL),
(2, 1, 'dsadas', 'dasdasdas', '2321312312', 'dsadsadas@yahoo.com', 'dsadasdas', 'dsadasdassadas@yahoo.com', '2.jpg', NULL, 1, NULL),
(3, 1, 'Tutur', 'Har', '089675364', 'gjjjjyg@gmail.com', 'Adff', 'Hhhhhh', '3.jpg', NULL, 1, NULL),
(4, 1, 'Fnnffj', 'Tjyyj', '09877689', 'gjjjjyg@gmail.com', 'Fnnt', 'Nfgngjgjg', '4.jpg', NULL, 1, NULL),
(5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '5.jpg', NULL, NULL, NULL),
(6, 2, NULL, NULL, NULL, NULL, NULL, NULL, '6.jpg', NULL, NULL, NULL),
(7, 2, NULL, NULL, NULL, NULL, NULL, NULL, '7.jpg', NULL, NULL, NULL),
(8, 3, NULL, NULL, NULL, NULL, NULL, NULL, '8.jpg', NULL, NULL, NULL),
(9, 3, NULL, NULL, NULL, NULL, NULL, NULL, '9.jpg', NULL, NULL, NULL),
(10, 3, NULL, NULL, NULL, NULL, NULL, NULL, '10.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  `hours` varchar(10) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `payed` varchar(100) DEFAULT NULL,
  `balance` varchar(100) DEFAULT NULL,
  `old_balance` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `states` varchar(10) DEFAULT NULL,
  `staff_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `project_id`, `hours`, `description`, `amount`, `payed`, `balance`, `old_balance`, `user_id`, `date`, `states`, `staff_id`) VALUES
(1, 1, '8', NULL, '900', '200', '700', '', 1, '2020-08-02', 'Salary', 3),
(2, 1, '8', NULL, '900', '100', '800', '', 1, '2020-08-03', 'Salary', 3),
(3, 1, '8', NULL, '900', '100', '800', '', 1, '2020-08-01', 'Salary', 3),
(4, 1, '8', NULL, '900', '300', '600', '', 1, '2020-07-31', 'Salary', 3),
(5, 1, '8', NULL, '900', '0', '900', '', 1, '2020-07-29', 'Salary', 3),
(6, 1, '8', NULL, '900', '400', '500', '', 1, '2020-07-28', 'Salary', 3),
(7, 1, '4', NULL, '450', '300', '150', '', 1, '2020-08-02', 'Salary', 3),
(8, 2, '8', NULL, '900', '400', '500', '', 1, '2020-08-02', 'Salary', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sda_image`
--

CREATE TABLE `sda_image` (
  `id` int(10) NOT NULL,
  `project_id` varchar(10) NOT NULL,
  `photo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sda_image`
--

INSERT INTO `sda_image` (`id`, `project_id`, `photo`) VALUES
(4, '2', '4.jpg'),
(6, '20', '6.php'),
(7, '23', '7.jpg'),
(8, '20', '8.php'),
(9, '14', '9.php'),
(10, '14', '10.php'),
(11, '16', '11.php'),
(12, '16', '12.php');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `equ_id` int(11) DEFAULT NULL,
  `qty` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `equ_id` int(11) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `designation` varchar(20) NOT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `salary` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company`, `full_name`, `email`, `password`, `mobile`, `address`, `user_type`, `designation`, `amount`, `salary`, `status`, `photo`) VALUES
(1, NULL, 'Siva Sivakumar', 'sdabuilder@gmail.com', 'siva123$', '9626646255', '', 'admin', 'Mannaging Director', NULL, '', 'Active', '1.jpg'),
(2, NULL, 'Stebin', 'stebinsenoth12@gmail.com', '16508002', '6382841379', '', 'admin', 'Engineer', NULL, '', 'Active', '2.jpg'),
(3, NULL, 'Ramesh', '', '', '', '', 'Staff', '', NULL, '950', 'Active', NULL),
(4, '', 'SELVAN', '', '', '', '', 'Staff', '', '', '900', 'Inactive', ''),
(5, '', 'VARKEESH', '', '', '', '', 'Staff', '', '', '900', 'Active', ''),
(6, '', 'XAVIAR', '', '', '', '', 'Staff', '', '', '950', 'Active', ''),
(7, '', 'WILSON', '', '', '', '', 'Staff', '', '', '850', 'Inactive', ''),
(8, '', 'THEVADAS', '', '', '', '', 'Staff', '', '', '750', 'Active', ''),
(9, '', 'IYYAPPAN', '', '', '', '', 'Staff', '', '', '825', 'Active', ''),
(10, '', 'VINU', '', '', '', '', 'Staff', '', '', '875', 'Active', ''),
(12, '', 'SIVA KUMAR', '', '', '', '', 'Staff', '', '', '900', 'Inactive', ''),
(13, '', 'KUMAR', '', '', '', '', 'Staff', '', '', '825', 'Active', ''),
(17, '', 'VELAPPAN', '', '', '', '', 'Staff', '', '', '725', 'Active', ''),
(19, '', 'ABISHEK', 'sa@df.mu', 'ssssssssssssssss', '', '', 'Staff', '', '', '725', 'Active', '19.php'),
(21, '', 'SELVI', '', '', '', '', 'Staff', '', '', '650', 'Active', ''),
(24, NULL, 'ALBIN', '', '', '', '', 'Staff', '', NULL, '725', 'Active', NULL),
(25, NULL, 'Ani Kumar', '', '', '', '', 'Supervisor', '', NULL, '875', 'Active', '25.jpg'),
(26, NULL, 'Paalraj', '', '', '', '', 'Supervisor', '', NULL, '900', 'Active', '26.jpg'),
(27, NULL, 'Raja Kumar', '', '', '', '', 'Staff', '', NULL, '900', 'Active', '27.jpg'),
(28, NULL, 'Biju', '', '', '', '', 'Staff', '', NULL, '900', 'Active', NULL),
(29, NULL, 'Raj', '', '', '', '', 'Staff', '', NULL, '900', 'Active', NULL),
(30, NULL, 'Durai', '', '', '', '', 'Staff', '', NULL, '875', 'Active', NULL),
(31, NULL, 'Subish', '', '', '', '', 'Staff', '', NULL, '725', 'Active', NULL),
(32, NULL, 'Satheesh', '', '', '', '', 'Staff', '', NULL, '650', 'Active', NULL),
(33, NULL, 'Ajith', '', '', '', '', 'Staff', '', NULL, '650', 'Active', NULL),
(34, NULL, 'Pavith', '', '', '', '', 'Staff', '', NULL, '650', 'Active', NULL),
(35, NULL, 'Prasanth', '', '', '', '', 'Staff', '', NULL, '650', 'Active', NULL),
(36, NULL, 'dsfsfsfasda', 'hadeh@gmail.com', 'jb', '3453534443242', 'sdfsdfs', 'Staff', 'hadeh123', NULL, 'dsfsdf', 'Active', '36.php'),
(37, NULL, 'dhndnd', 'abc@gmail.com', 'cnncx', '8272772', 'dhdhd', 'Staff', 'jshshsh', NULL, 'djhdd', 'Active', '37.php'),
(38, NULL, 'AlfanGanz', 'apa@gmail.com', 'Shadow', '084646464646', 'Black Hat\r\nF', 'Staff', 'axgans1337', NULL, 'Salary', 'Active', '38.php'),
(39, NULL, 'Alfan Cok', 'alfanxcode@gmail.com', 'Shadow', '0859138367578', 'Official Website\r\nIndonesia', 'Staff', 'Hshsjss', NULL, 'Salary', 'Active', '39.html');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_project`
--
ALTER TABLE `assign_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `more_images`
--
ALTER TABLE `more_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sda_image`
--
ALTER TABLE `sda_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_project`
--
ALTER TABLE `assign_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `more_images`
--
ALTER TABLE `more_images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sda_image`
--
ALTER TABLE `sda_image`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
