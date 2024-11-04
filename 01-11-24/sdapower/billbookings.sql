-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 06:33 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billbookings`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac_accounts`
--

CREATE TABLE `ac_accounts` (
  `id` int(5) NOT NULL,
  `count_id` int(5) DEFAULT NULL,
  `store_id` int(5) DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `sort_code` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `account_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `account_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `balance` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `delete_bit` int(1) DEFAULT 0,
  `account_selection_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `paymenttypes_id` int(1) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `expense_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_moneydeposits`
--

CREATE TABLE `ac_moneydeposits` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_moneytransfer`
--

CREATE TABLE `ac_moneytransfer` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL,
  `transfer_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_transactions`
--

CREATE TABLE `ac_transactions` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_type` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `debit_account_id` int(5) DEFAULT NULL,
  `credit_account_id` int(5) DEFAULT NULL,
  `debit_amt` double(20,4) DEFAULT NULL,
  `credit_amt` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `ref_accounts_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_moneytransfer_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_moneydeposits_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_salespayments_id` int(5) DEFAULT NULL,
  `ref_salespaymentsreturn_id` int(5) DEFAULT NULL,
  `ref_purchasepayments_id` int(5) DEFAULT NULL,
  `ref_purchasepaymentsreturn_id` int(5) DEFAULT NULL,
  `ref_expense_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('35t16idunkccmgfgbgjrpuvivcambk7b', '::1', 1709183946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393138333934363b),
('rfnj0bahs8unncnopk76itc10ksrkdnc', '::1', 1709183946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393138333934363b),
('lu430g62ce1ur7rvf211rrcr9vj54pin', '::1', 1709183946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393138333934363b),
('f6pvumgs1acfmv4fu9aqkvhgsdh3qaoe', '::1', 1709184513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393138343531333b63757272656e63797c733a333a22e282b9223b63757272656e63795f706c6163656d656e747c733a343a224c656674223b63757272656e63795f636f64657c733a333a22494e52223b766965775f646174657c733a31303a2264642d6d6d2d79797979223b766965775f74696d657c733a323a223132223b646563696d616c737c733a313a2230223b7174795f646563696d616c737c733a313a2230223b73746f72655f6e616d657c733a31373a22532e442e4120504f57455220544f4f4c53223b696e765f757365726e616d657c733a393a2241444d494e53495641223b757365725f6c6e616d657c733a353a224b554d4152223b696e765f7573657269647c733a333a22313033223b6c6f676765645f696e7c623a313b726f6c655f69647c733a323a223332223b726f6c655f6e616d657c733a343a2255534552223b73746f72655f69647c733a313a2232223b656d61696c7c733a31393a22736976616b756d617240676d61696c2e636f6d223b6c616e67756167657c733a373a22456e676c697368223b6c616e67756167655f69647c733a313a2231223b),
('4612hqsu93r7mf73ec5ao756ge7u64fs', '::1', 1709184514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730393138343531333b63757272656e63797c733a333a22e282b9223b63757272656e63795f706c6163656d656e747c733a343a224c656674223b63757272656e63795f636f64657c733a333a22494e52223b766965775f646174657c733a31303a2264642d6d6d2d79797979223b766965775f74696d657c733a323a223132223b646563696d616c737c733a313a2230223b7174795f646563696d616c737c733a313a2230223b73746f72655f6e616d657c733a31373a22532e442e4120504f57455220544f4f4c53223b696e765f757365726e616d657c733a393a2241444d494e53495641223b757365725f6c6e616d657c733a353a224b554d4152223b696e765f7573657269647c733a333a22313033223b6c6f676765645f696e7c623a313b726f6c655f69647c733a323a223332223b726f6c655f6e616d657c733a343a2255534552223b73746f72655f69647c733a313a2232223b656d61696c7c733a31393a22736976616b756d617240676d61696c2e636f6d223b6c616e67756167657c733a373a22456e676c697368223b6c616e67756167655f69647c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `db_bankdetails`
--

CREATE TABLE `db_bankdetails` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `holder_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IFSC or Bank Code',
  `account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_bankdetails`
--

INSERT INTO `db_bankdetails` (`id`, `store_id`, `country_id`, `holder_name`, `bank_name`, `branch_name`, `code`, `account_type`, `account_number`, `other_details`, `description`, `status`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_brands`
--

CREATE TABLE `db_brands` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `brand_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_brands`
--

INSERT INTO `db_brands` (`id`, `store_id`, `brand_code`, `brand_name`, `description`, `status`) VALUES
(331, 2, NULL, 'GC POWER', '', 1),
(332, 2, NULL, 'POWERTUFF', '', 1),
(333, 2, NULL, 'HI-MAX', '', 1),
(334, 2, NULL, 'GOLDEN BULLCT', '', 1),
(335, 2, NULL, 'EMTRAX', '', 1),
(336, 2, NULL, 'LASER  TECH', '', 1),
(337, 2, NULL, 'YURI', '', 1),
(338, 2, NULL, 'POWERTEX', '', 1),
(339, 2, NULL, 'XTRA  POWER', '', 1),
(340, 2, NULL, 'XTRA - POWER', '', 1),
(341, 2, NULL, 'EMTEX', '', 1),
(342, 2, NULL, 'COVINA', '', 1),
(343, 2, NULL, 'SURIE', '', 1),
(344, 2, NULL, 'SURIE POLEX', '', 1),
(345, 2, NULL, 'DAMIER', '', 1),
(346, 2, NULL, 'LASERTECH', '', 1),
(347, 2, NULL, 'HI  KOKI', '', 1),
(348, 2, NULL, 'HI  KOKI , BOSCH', '', 1),
(349, 2, NULL, 'ULTRAFAST', '', 1),
(350, 2, NULL, 'USTAD', '', 1),
(351, 2, NULL, 'DONG CHENG', '', 1),
(352, 2, NULL, 'TOSHON', '', 1),
(353, 2, NULL, 'ROHM', '', 1),
(354, 2, NULL, 'SKYFLEX', '', 1),
(355, 2, NULL, 'SANOU', '', 1),
(356, 2, NULL, 'PEACOCK', '', 1),
(357, 2, NULL, 'DAYURI', '', 1),
(358, 2, NULL, 'HI- MAX', '', 1),
(359, 2, NULL, 'YIWAX', '', 1),
(360, 2, NULL, 'GALAXY', '', 1),
(361, 2, NULL, 'FREEMANS', '', 1),
(362, 2, NULL, 'XTRAPOWER', '', 1),
(363, 2, NULL, 'RAINBOW', '', 1),
(364, 2, NULL, 'IDEAL', '', 1),
(365, 2, NULL, 'JON BHANDARI', '', 1),
(366, 2, NULL, 'G CUT', '', 1),
(367, 2, NULL, 'SHARP SWORD', '', 1),
(368, 2, NULL, 'TREMR POWER GOLD', '', 1),
(369, 2, NULL, 'DCJ', '', 1),
(370, 2, NULL, 'GAURAV', '', 1),
(371, 2, NULL, 'MANSAROVAR', '', 1),
(372, 2, NULL, 'PRO CUT', '', 1),
(373, 2, NULL, 'GOGA&#039; POWER', '', 1),
(374, 2, NULL, 'MASTECH', '', 1),
(375, 2, NULL, 'JHALANI', '', 1),
(376, 2, NULL, 'STB', '', 1),
(377, 2, NULL, 'ZOOM', '', 1),
(378, 2, NULL, 'STAR WELD', '', 1),
(379, 2, NULL, 'SRUNV', '', 1),
(380, 2, NULL, 'STANLEY', '', 1),
(381, 2, NULL, 'TAPARIA', '', 1),
(382, 2, NULL, 'VOMB', '', 1),
(383, 2, NULL, 'PIPE WRENCH', '', 1),
(384, 2, NULL, 'LC- TEX', '', 1),
(385, 2, NULL, 'P/A TOOLS', '', 1),
(386, 2, NULL, 'OMEGA', '', 1),
(387, 2, NULL, 'OLYMPUS', '', 1),
(388, 2, NULL, 'MASAKI', '', 1),
(389, 2, NULL, 'KOMAL', '', 1),
(390, 2, NULL, 'compressor', '', 1),
(391, 2, NULL, 'LG  TEX', '', 1),
(392, 2, NULL, 'XTREME', '', 1),
(393, 2, NULL, 'MAKTEC', '', 1),
(394, 2, NULL, 'P J D', '', 1),
(395, 2, NULL, 'BOSCH', '', 1),
(396, 2, NULL, 'POWER TAX', '', 1),
(397, 2, NULL, 'OAYKAY', '', 1),
(398, 2, NULL, 'KANVEE', '', 1),
(399, 2, NULL, 'ANCHAL', '', 1),
(400, 2, NULL, 'BHOLA', '', 1),
(401, 2, NULL, 'SATURN', '', 1),
(402, 2, NULL, 'XVNT', '', 1),
(403, 2, NULL, 'ECO', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create category Code',
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `store_id`, `count_id`, `category_code`, `category_name`, `description`, `company_id`, `status`) VALUES
(90, 2, 1, 'CT0001', 'ELECTRIC DRILL', '', NULL, 1),
(91, 2, 2, 'CT0002', 'DRILLING', '', NULL, 1),
(92, 2, 3, 'CT0003', 'ELLCTRIC MIXER', '', NULL, 1),
(93, 2, 4, 'CT0004', 'BLADE', '', NULL, 1),
(94, 2, 5, 'CT0005', 'HOT AIR GUN', '', NULL, 1),
(95, 2, 6, 'CT0006', 'MARBLE  CUTTER', '', NULL, 1),
(96, 2, 7, 'CT0007', 'FIBRE DISC', '', NULL, 1),
(97, 2, 8, 'CT0008', 'DRILL BIT', '', NULL, 1),
(98, 2, 9, 'CT0009', 'POWER TOOLS', '', NULL, 1),
(99, 2, 10, 'CT0010', 'DISC  GRINDER', '', NULL, 1),
(100, 2, 11, 'CT0011', 'DRY WALL SANDER', '', NULL, 1),
(101, 2, 12, 'CT0012', 'SAND PAPER', '', NULL, 1),
(102, 2, 13, 'CT0013', 'GRANITE  BLADE', '', NULL, 1),
(103, 2, 14, 'CT0014', 'DRILL MACHINE', '', NULL, 1),
(104, 2, 15, 'CT0015', 'WRENCH', '', NULL, 1),
(105, 2, 16, 'CT0016', 'WASHER', '', NULL, 1),
(106, 2, 17, 'CT0017', 'GASOLINE CHAIN MACHINE', '', NULL, 1),
(107, 2, 18, 'CT0018', 'WELDING MICHINE', '', NULL, 1),
(108, 2, 19, 'CT0019', 'CHUK KEY', '', NULL, 1),
(109, 2, 20, 'CT0020', 'MAGNETIC NUT SETTER', '', NULL, 1),
(110, 2, 21, 'CT0021', 'DRILL CHUCK', '', NULL, 1),
(111, 2, 22, 'CT0022', 'POINT BIT', '', NULL, 1),
(112, 2, 23, 'CT0023', 'FLAT BIT', '', NULL, 1),
(113, 2, 24, 'CT0024', 'DISC GRINDER', '', NULL, 1),
(114, 2, 25, 'CT0025', 'WOOD CUTTING', '', NULL, 1),
(115, 2, 26, 'CT0026', 'TCT  BLADE', '', NULL, 1),
(116, 2, 27, 'CT0027', 'SLIM CUT BLADE', '', NULL, 1),
(117, 2, 28, 'CT0028', 'TOOLS', '', NULL, 1),
(118, 2, 29, 'CT0029', 'CARBON BRUSH', '', NULL, 1),
(119, 2, 30, 'CT0030', 'MEASUREING TAPE', '', NULL, 1),
(120, 2, 31, 'CT0031', 'WELDING ROD', '', NULL, 1),
(121, 2, 32, 'CT0032', 'ROTARY HAMMER', '', NULL, 1),
(122, 2, 33, 'CT0033', 'ANGLE GRANDER', '', NULL, 1),
(123, 2, 34, 'CT0034', 'HAMMER', '', NULL, 1),
(124, 2, 35, 'CT0035', 'LEVEL', '', NULL, 1),
(125, 2, 36, 'CT0036', 'SPANNER', '', NULL, 1),
(126, 2, 37, 'CT0037', 'RING SPANNER', '', NULL, 1),
(127, 2, 38, 'CT0038', 'KEY', '', NULL, 1),
(128, 2, 39, 'CT0039', 'SAFTY GLASS', '', NULL, 1),
(129, 2, 40, 'CT0040', 'WELDING CABLE', '', NULL, 1),
(130, 2, 41, 'CT0041', 'SCROW DRIVER', '', NULL, 1),
(131, 2, 42, 'CT0042', 'CUTTING PLAYER', '', NULL, 1),
(132, 2, 43, 'CT0043', 'AIR COMPRESSOR', '', NULL, 1),
(133, 2, 44, 'CT0044', 'BIT', '', NULL, 1),
(134, 2, 45, 'CT0045', 'CABLE CUTTER', '', NULL, 1),
(135, 2, 46, 'CT0046', 'SPRAY GUN', '', NULL, 1),
(136, 2, 47, 'CT0047', 'DIS PAPER', '', NULL, 1),
(137, 2, 48, 'CT0048', 'HANDLE', '', NULL, 1),
(138, 2, 49, 'CT0049', 'HOLE SAW SET', '', NULL, 1),
(139, 2, 50, 'CT0050', 'NEEDLE', '', NULL, 1),
(140, 2, 51, 'CT0051', 'PUMP SET', '', NULL, 1),
(141, 2, 52, 'CT0052', 'PIPE CUTTER', '', NULL, 1),
(142, 2, 53, 'CT0053', 'EN  ORBITAL  SANDER', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_cobpayments`
--

CREATE TABLE `db_cobpayments` (
  `id` int(5) NOT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_company`
--

CREATE TABLE `db_company` (
  `id` double DEFAULT NULL,
  `company_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `category_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `status` int(1) DEFAULT NULL,
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `sales_terms_and_conditions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_company`
--

INSERT INTO `db_company` (`id`, `company_code`, `company_name`, `company_website`, `mobile`, `phone`, `email`, `website`, `company_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `invoice_view`, `status`, `sms_status`, `sales_terms_and_conditions`) VALUES
(1, '', 'Company Name', NULL, '9999999999', '', 'admin@example.com', '', 'company_logo.png', 'logo-0.png', NULL, NULL, 'India', 'Karnataka', 'Belgaum', 'Address Details', '', '', '', '', '', 1, 'CT', 'IT', 'SP', 'PU', 'PR', 'CU', 'SL', 'PR', 'EX', 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_country`
--

CREATE TABLE `db_country` (
  `id` int(5) NOT NULL,
  `country` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_country`
--

INSERT INTO `db_country` (`id`, `country`, `added_on`, `status`) VALUES
(79, 'India', '2020-11-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_coupons`
--

CREATE TABLE `db_coupons` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(20,2) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_currency`
--

CREATE TABLE `db_currency` (
  `id` int(5) NOT NULL,
  `currency_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `symbol` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_currency`
--

INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES
(35, 'India - Indian rupee', 'INR', 0xe282b9, '?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_custadvance`
--

CREATE TABLE `db_custadvance` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `payment_type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_customers`
--

CREATE TABLE `db_customers` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Customer Code',
  `customer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,4) DEFAULT NULL,
  `sales_due` double(20,4) DEFAULT NULL,
  `sales_return_due` double(20,4) DEFAULT NULL,
  `country_id` int(50) DEFAULT NULL,
  `state_id` int(50) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_country_id` int(5) DEFAULT NULL,
  `ship_state_id` int(5) DEFAULT NULL,
  `ship_city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `location_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_level_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Increase',
  `price_level` double(20,4) DEFAULT 0.0000,
  `delete_bit` int(1) DEFAULT 0,
  `tot_advance` double(20,4) DEFAULT NULL,
  `credit_limit` double(20,4) DEFAULT -1.0000,
  `shippingaddress_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_customers`
--

INSERT INTO `db_customers` (`id`, `store_id`, `count_id`, `customer_code`, `customer_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `sales_due`, `sales_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `ship_country_id`, `ship_state_id`, `ship_city`, `ship_postcode`, `ship_address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `location_link`, `attachment_1`, `price_level_type`, `price_level`, `delete_bit`, `tot_advance`, `credit_limit`, `shippingaddress_id`) VALUES
(1, 1, NULL, 'CU0001', 'Walk-in customer', NULL, '', '', '', '', NULL, 0.0000, 0.0000, 0.0000, 1, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01', '10:55:54 pm', 'admin', NULL, 1, NULL, NULL, 'Increase', 0.0000, 1, NULL, -1.0000, 1),
(2, 2, 1, 'CU/02/0001', 'Walk-in customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-02-12', '05:53:37 pm', '', NULL, 1, NULL, NULL, 'Increase', 0.0000, 1, 0.0000, -1.0000, 2),
(3, 2, 2, 'CU0002', 'Ramesh kumar', '9344532520', '', 'mimaramesh26@gmail.com', '', '', NULL, 0.0000, -9450.0000, NULL, 79, 46, 'Nagercoil', '629201', '18/456a karavilai', NULL, NULL, NULL, NULL, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-05', '12:25:36 pm', 'ADMINSIVA', NULL, 1, '', NULL, 'Increase', 0.0000, 0, 0.0000, -1.0000, 20);

-- --------------------------------------------------------

--
-- Table structure for table `db_customer_coupons`
--

CREATE TABLE `db_customer_coupons` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(20,2) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_customer_payments`
--

CREATE TABLE `db_customer_payments` (
  `id` int(5) NOT NULL,
  `salespayment_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_emailtemplates`
--

CREATE TABLE `db_emailtemplates` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL,
  `admin_only` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_emailtemplates`
--

INSERT INTO `db_emailtemplates` (`id`, `store_id`, `key`, `template_name`, `content`, `variables`, `status`, `undelete_bit`, `admin_only`) VALUES
(1, 1, 'SAAS_FORGOT_PASSWORD_EMAIL', 'Site forgot password email template', 'Hi {{user_name}},\r\n\r\nyour OTP is {{email_otp}}\r\n\r\nThank you\r\n{{saas_name}}', '{{user_name}}<br>\r\n{{saas_name}}<br>\r\n{{email_otp}}<br>', 1, 1, 1),
(2, 1, 'SAAS_WELCOME_EMAIL', 'Site welcome email', 'Hi {{user_name}},\r\nYour email id {{email_id}},\r\nwelcome to our {{saas_name}},\r\n\r\nThank you', '{{user_name}}<br>\r\n{{email_id}}<br>\r\n{{saas_name}}<br>', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_expense`
--

CREATE TABLE `db_expense` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Expense Code',
  `expense_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_amt` double(20,4) DEFAULT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_expense_category`
--

CREATE TABLE `db_expense_category` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_fivemojo`
--

CREATE TABLE `db_fivemojo` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `instance_id` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_hold`
--

CREATE TABLE `db_hold` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temprary',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_holditems`
--

CREATE TABLE `db_holditems` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `hold_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_instamojo`
--

CREATE TABLE `db_instamojo` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `api_key` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `api_token` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_instamojo`
--

INSERT INTO `db_instamojo` (`id`, `store_id`, `sandbox`, `api_key`, `api_token`, `updated_at`, `updated_by`, `status`) VALUES
(1, 1, 1, '', '', '2021-02-22', 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_instamojopayments`
--

CREATE TABLE `db_instamojopayments` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `buyer_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `purpose` text CHARACTER SET utf8 DEFAULT NULL,
  `expires_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `send_sms` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `send_email` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `sms_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `shorturl` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `longurl` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `redirect_url` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `webhook` mediumtext CHARACTER SET utf8 DEFAULT NULL,
  `allow_repeated_payments` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `customer_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modified_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_items`
--

CREATE TABLE `db_items` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create ITEM Code',
  `item_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sac` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `alert_qty` int(10) DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `lot_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `price` double(20,4) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `purchase_price` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_margin` double(20,2) DEFAULT NULL,
  `sales_price` double(20,4) DEFAULT NULL,
  `stock` double(20,2) DEFAULT NULL,
  `item_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Percentage',
  `discount` double(20,2) DEFAULT 0.00,
  `service_bit` int(1) DEFAULT 0,
  `seller_points` double(20,2) DEFAULT 0.00,
  `custom_barcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `variant_id` int(5) DEFAULT NULL,
  `child_bit` int(1) DEFAULT 0,
  `mrp` double(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_items`
--

INSERT INTO `db_items` (`id`, `store_id`, `count_id`, `item_code`, `item_name`, `category_id`, `sku`, `hsn`, `sac`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `discount_type`, `discount`, `service_bit`, `seller_points`, `custom_barcode`, `description`, `item_group`, `parent_id`, `variant_id`, `child_bit`, `mrp`) VALUES
(1, 2, 1, 'IT020001', 'POWEERTUF-DRILL MSCHINE 10MM-PT-1218(RED)', 90, '', '', NULL, 63, 0, 331, NULL, NULL, 850.0000, 153, 850.0000, 'Inclusive', 6.00, 900.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-03', '12:39:43 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 950.0000),
(2, 2, 2, 'IT020002', 'POWEERTUF-DRILL MSCHINE 10MM-PT-1218(RED)', 90, '', '', NULL, 63, 1, 332, NULL, NULL, 1400.0000, 153, 1400.0000, 'Inclusive', -10.00, 1260.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-08', '11:04:24 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(3, 2, 3, 'IT020003', 'HIMAX-DRILL MACHINE 6.5MM-IC025', 91, '', '', NULL, 63, 1, 333, NULL, NULL, 1550.0000, 153, 1550.0000, 'Inclusive', -10.00, 1395.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-08', '11:19:20 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(4, 2, 4, 'IT020004', 'GC POWER-IMPACT DRILL 13MM-GC-13B', 90, '', '', NULL, 63, 1, 331, NULL, NULL, 1450.0000, 153, 1450.0000, 'Inclusive', -10.00, 1305.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-08', '11:25:18 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(5, 2, 5, 'IT020005', 'HIMAX-ELECTRIC MIXER-IC-038', 92, '', '', NULL, 63, 1, 333, NULL, NULL, 3500.0000, 153, 3500.0000, 'Inclusive', -10.00, 3150.0000, 0.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-08', '11:38:32 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(6, 2, 6, 'IT020006', 'BULLET-TCT SAW BLADE-4X40(PENCIL)', 93, '', '', NULL, 63, 15, 334, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-09', '03:48:27 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(7, 2, 7, 'IT020007', 'BULLET-TCT SAW BLADE-5X40(PENCIL)', 93, '', '', NULL, 63, 10, 334, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 30.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-09', '03:52:44 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(8, 2, 8, 'IT020008', 'EMTRAX-TCT SAW BLADE-5X40', 93, '', '', NULL, 63, 15, 335, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-09', '03:55:32 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(9, 2, 9, 'IT020009', 'EMTRAX-HOT AIR GUN', 94, '', '', NULL, 63, 1, 335, NULL, NULL, 1150.0000, 153, 1150.0000, 'Inclusive', -10.00, 1035.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-09', '03:59:13 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(10, 2, 10, 'IT020010', 'LASER  TECH-MARBLE CUTTUR 4&quot;-LHD -4SA', 95, '', '', NULL, 63, 1, 336, NULL, NULL, 3000.0000, 153, 3000.0000, 'Inclusive', -10.00, 2700.0000, 7.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-09', '04:03:06 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(11, 2, 11, 'IT020011', 'POWERTUFF-MARBLE CUTTUR 4&quot;-CM4SA', 95, '', '', NULL, 63, 1, 332, NULL, NULL, 2250.0000, 153, 2250.0000, 'Inclusive', -10.00, 2025.0000, 6.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-09', '04:07:38 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(12, 2, 12, 'IT020012', 'YURI SPEED- MARBLE CUTTUR 4&quot;-SP-4SA', 95, '', '', NULL, 63, 1, 337, NULL, NULL, 1900.0000, 153, 1900.0000, 'Inclusive', -10.00, 1710.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:06:08 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(13, 2, 13, 'IT020013', 'CALIBRE-FIBRE DISC 5&quot;-60 GRIT', 96, '', '', NULL, 63, 30, 338, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:10:44 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(14, 2, 14, 'IT020014', 'ORMAT-FIBRE DISC 5&quot;-36 GRIT', 96, '', '', NULL, 63, 30, 340, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:16:56 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(15, 2, 15, 'IT020015', 'ORMAT-FIBRE DISC 5&quot;-80 GRIT', 96, '', '', NULL, 63, 30, 338, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:34:46 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(16, 2, 16, 'IT020016', 'CALIBRE -FIBRE DISC 5&quot;100A  GRIT', 96, '', '', NULL, 63, 30, 337, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:37:24 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(17, 2, 17, 'IT020017', 'EMTEX - MARBLE BLADE 4&quot; SEG', 93, '', '', NULL, 63, 20, 341, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:43:54 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(18, 2, 18, 'IT020018', 'BULLET-MARBLE BLADE 4&quot; SEG (GREEN ECO)', 93, '', '', NULL, 63, 20, 334, NULL, NULL, 120.0000, 153, 120.0000, 'Inclusive', 0.00, 120.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:47:08 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(19, 2, 19, 'IT020019', 'COVINA- CERAMIC BLADE', 93, '', '', NULL, 63, 20, 342, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:49:25 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(20, 2, 20, 'IT020020', 'POWERTEX - MARBLE BLADE 4&quot;SEG', 93, '', '', NULL, 63, 20, 338, NULL, NULL, 120.0000, 153, 120.0000, 'Inclusive', 0.00, 120.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:53:44 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(21, 2, 21, 'IT020021', 'XTRAPOWER - THIN TURBO  4&quot;', 93, '', '', NULL, 63, 20, 340, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '11:56:33 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(22, 2, 22, 'IT020022', 'SURIE - DCROD - NO 0   (MIRREX)', 93, '', '', NULL, 63, 50, 343, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:01:27 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(23, 2, 23, 'IT020023', 'SURIE - DCROD - NO 1    (MIRREX)', 93, '', '', NULL, 63, 50, 344, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:03:37 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(24, 2, 24, 'IT020024', 'SURIE - DCROD - NO 2     (MIRREX)', 93, '', '', NULL, 63, 50, 344, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:05:39 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(25, 2, 25, 'IT020025', 'SURIE - DCROD - NO 3     (MIRREX)', 93, '', '', NULL, 63, 50, 344, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:06:46 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(26, 2, 26, 'IT020026', 'SURIE - DCROD - NO 4     (MIRREX)', 93, '', '', NULL, 63, 50, 344, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:08:24 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(27, 2, 27, 'IT020027', 'SURIE - DCROD - NO 5    (MIRREX)', 93, '', '', NULL, 63, 50, 344, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:10:37 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(28, 2, 28, 'IT020028', 'SURIE - DCROD - NO 6    (MIRREX)', 93, '', '', NULL, 63, 50, 344, NULL, NULL, 75.0000, 153, 75.0000, 'Inclusive', 0.00, 75.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:12:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(29, 2, 29, 'IT020029', 'EMTRAX-TCT SAW BLADE-4X40', 93, '', '', NULL, 63, 50, 335, NULL, NULL, 120.0000, 153, 120.0000, 'Inclusive', 0.00, 120.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:33:14 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(30, 2, 30, 'IT020030', 'YURI - COW 4X1 - GREEN (GO GREEN )', 93, '', '', NULL, 63, 100, 337, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 500.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:39:39 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(31, 2, 31, 'IT020031', 'EMTEX -SDS  DRILL BIT - 5X160', 97, '', '', NULL, 63, 2, 341, NULL, NULL, 80.0000, 153, 80.0000, 'Inclusive', 0.00, 80.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:44:59 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(32, 2, 32, 'IT020032', 'EMTEX -SDS  DRILL BIT - 6X160', 97, '', '', NULL, 63, 2, 340, NULL, NULL, 80.0000, 153, 80.0000, 'Inclusive', 0.00, 80.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:50:58 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(33, 2, 33, 'IT020033', 'EMTEX -SDS  DRILL BIT - 8X160', 97, '', '', NULL, 63, 2, 341, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '12:54:36 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(34, 2, 34, 'IT020034', 'EMTEX -SDS  DRILL BIT - 10X160', 97, '', '', NULL, 63, 2, 345, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '01:04:09 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(35, 2, 35, 'IT020035', 'EMTEX -SDS  DRILL BIT - 12X160', 97, '', '', NULL, 63, 2, 337, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '01:07:31 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(36, 2, 36, 'IT020036', 'EMTEX -SDS  DRILL BIT - 13X160', 97, '', '', NULL, 63, 2, 340, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '01:14:30 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(37, 2, 37, 'IT020037', 'EMTEX -SDS  DRILL BIT - 14X160', 97, '', '', NULL, 63, 2, 340, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '02:45:20 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(38, 2, 38, 'IT020038', 'EMTEX -SDS  DRILL BIT - 16X160', 97, '', '', NULL, 63, 2, 345, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '02:48:45 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(39, 2, 39, 'IT020039', 'EMTEX -SDS  DRILL BIT - 18X210', 97, '', '', NULL, 63, 2, 338, NULL, NULL, 210.0000, 153, 210.0000, 'Inclusive', 0.00, 210.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '02:51:29 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(40, 2, 40, 'IT020040', 'EMTEX -SDS  DRILL BIT - 19X210', 97, '', '', NULL, 63, 2, 338, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '02:53:52 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(41, 2, 41, 'IT020041', 'EMTEX -SDS  DRILL BIT - 25X 210', 97, '', '', NULL, 63, 2, 341, NULL, NULL, 400.0000, 153, 400.0000, 'Inclusive', 0.00, 400.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '03:31:50 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(42, 2, 42, 'IT020042', 'GC POWER- CORDLESS DRILL  2IV-GC -2IVO', 90, '', '', NULL, 63, 0, 331, NULL, NULL, 3500.0000, 153, 3500.0000, 'Inclusive', -10.00, 3150.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '03:48:44 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(43, 2, 43, 'IT020043', 'LASERTECH -ROTARY HAMMER 26MM-LHD- 26RH', 98, '', '', NULL, 63, 1, 346, NULL, NULL, 3500.0000, 153, 3500.0000, 'Inclusive', -10.00, 3150.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '03:51:46 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(44, 2, 44, 'IT020044', 'YURI- ROTARY HAMMER 26MM', 98, '', '', NULL, 63, 1, 337, NULL, NULL, 3500.0000, 153, 3500.0000, 'Inclusive', -10.00, 3150.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:06:58 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(45, 2, 45, 'IT020045', 'POWERTEX- ROTARY HAMMER  26MM -RH26ECO', 98, '', '', NULL, 63, 2, 338, NULL, NULL, 3700.0000, 153, 3700.0000, 'Inclusive', -10.00, 3330.0000, 4.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:10:39 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(46, 2, 46, 'IT020046', 'HIKOKI- ANGLE GRINDER 4&quot;', 99, '', '', NULL, 63, 1, 347, NULL, NULL, 3000.0000, 153, 3000.0000, 'Inclusive', -10.00, 2700.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:19:37 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(47, 2, 47, 'IT020047', 'HIKOKI- ANGLE GRINDER 4&quot;-G10SS2', 99, '', '', NULL, 63, 1, 348, NULL, NULL, 3500.0000, 153, 3500.0000, 'Inclusive', -10.00, 3150.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:24:02 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(48, 2, 48, 'IT020048', 'GC POWER - DRYWALL SANDER 7&quot;- GC -DWS980', 100, '', '', NULL, 63, 1, 331, NULL, NULL, 6500.0000, 153, 6500.0000, 'Inclusive', -10.00, 5850.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:28:47 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(49, 2, 49, 'IT020049', 'ULTRAFAST - VELCRO PAPER  7&quot;-120 GRIT', 101, '', '', NULL, 63, 50, 349, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:32:50 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(50, 2, 50, 'IT020050', 'YURI - MARBLE BLADE  4&quot; SEG ( B- 111)', 102, '', '', NULL, 63, 20, 337, NULL, NULL, 110.0000, 153, 110.0000, 'Inclusive', 0.00, 110.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-10', '04:38:00 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(51, 2, 51, 'IT020051', 'DIVIS- 11E CHIESEL -18 x 400 (FLAT)', 97, '', '', NULL, 63, 2, 336, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '09:27:12 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(52, 2, 52, 'IT020052', 'DIVIS- 11E CHIESEL -18 x 400 (POINT)', 97, '', '', NULL, 63, 2, 338, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '09:31:06 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(53, 2, 53, 'IT020053', 'DIVIS- 11E CHIESEL -18 x 600 (FLAT)', 97, '', '', NULL, 63, 1, 336, NULL, NULL, 300.0000, 153, 300.0000, 'Inclusive', 0.00, 300.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '10:35:48 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(54, 2, 54, 'IT020054', 'DIVIS- 11E CHIESEL -18 x 600 (POINT)', 97, '', '', NULL, 63, 2, 338, NULL, NULL, 300.0000, 153, 300.0000, 'Inclusive', 0.00, 300.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '10:38:07 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(55, 2, 55, 'IT020055', 'POWERTUFF-CORDLESS DRILL 12V-PT12V', 103, '', '', NULL, 63, 1, 332, NULL, NULL, 2000.0000, 153, 2000.0000, 'Inclusive', -10.00, 1800.0000, 4.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '10:41:34 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(56, 2, 56, 'IT020056', 'YURI - MARBLE BLADE  4&quot; SEG ( B- 111)', 102, '', '', NULL, 63, 20, 337, NULL, NULL, 110.0000, 153, 110.0000, 'Inclusive', 0.00, 110.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '10:44:39 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(57, 2, 57, 'IT020057', 'SDT-CERAMIC BLADE 4&quot;-SEC', 102, '', '', NULL, 63, 15, 350, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 25.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '10:47:35 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(58, 2, 58, 'IT020058', 'DONGHCHENG- ELECTRIC WRENCH-DPB20C', 104, '', '', NULL, 63, 0, 351, NULL, NULL, 4500.0000, 153, 4500.0000, 'Inclusive', -10.00, 4050.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '10:57:52 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(59, 2, 59, 'IT020059', 'DONGHCHENG- ELECTRIC WRENCH-DPB12', 104, '', '', NULL, 63, 1, 351, NULL, NULL, 3500.0000, 153, 3500.0000, 'Inclusive', -10.00, 3150.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:00:25 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(60, 2, 60, 'IT020060', 'POWERTUFF- PRESSURE WASHER- PT1290', 105, '', '', NULL, 63, 0, 332, NULL, NULL, 5800.0000, 153, 5800.0000, 'Inclusive', -10.00, 5220.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:03:24 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(61, 2, 61, 'IT020061', 'YURI-PRESSURE WASHER-YPW-RS3', 105, '', '', NULL, 63, 0, 337, NULL, NULL, 6000.0000, 153, 6000.0000, 'Inclusive', -10.00, 5400.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:06:44 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(62, 2, 62, 'IT020062', 'GC POWER-CHAINSAW 18&quot;-GC-GS18', 106, '', '', NULL, 63, 0, 331, NULL, NULL, 7950.0000, 153, 7950.0000, 'Inclusive', -10.00, 7155.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:11:29 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(63, 2, 63, 'IT020063', 'TOSHON-WELDING MICHINE -ARC 200G (IGBT)', 107, '', '', NULL, 63, 0, 352, NULL, NULL, 8500.0000, 153, 8500.0000, 'Inclusive', -10.00, 7650.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:15:26 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(64, 2, 64, 'IT020064', 'TOSHON-WELDING MICHINE -ARC 200 (MOSFET)', 107, '', '', NULL, 63, 0, 352, NULL, NULL, 10500.0000, 153, 10500.0000, 'Inclusive', -10.00, 9450.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:17:19 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(65, 2, 65, 'IT020065', 'CHUCK KEY 3/8 &quot;', 108, '', '', NULL, 63, 10, 353, NULL, NULL, 25.0000, 153, 25.0000, 'Inclusive', 0.00, 25.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:20:58 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(66, 2, 66, 'IT020066', 'NUT RUNNER 8x 50MM (YIWU)', 109, '', '', NULL, 63, 2, 354, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:27:56 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(67, 2, 67, 'IT020067', 'DRILL CHUCK 1/2x1/2 (PEACOCK)', 110, '', '', NULL, 63, 2, 355, NULL, NULL, 200.0000, 153, 200.0000, 'Inclusive', 0.00, 200.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:31:59 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(68, 2, 68, 'IT020068', 'DRILL CHUCK 6MM (PEACOCK)', 110, '', '', NULL, 63, 2, 356, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:33:45 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(69, 2, 69, 'IT020069', 'DIVIS- 0810T CHISEL - 17x250 (POINT)', 111, '', '', NULL, 63, 5, 332, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:38:21 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(70, 2, 70, 'IT020070', 'DIVIS- 0810T CHISEL - 17x250 (FLAT)', 112, '', '', NULL, 63, 5, 346, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:40:03 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(71, 2, 71, 'IT020071', 'YURI SPEED-AMGLE GRINDER 4&quot;-SP-901', 99, '', '', NULL, 63, 1, 337, NULL, NULL, 1550.0000, 153, 1550.0000, 'Inclusive', -10.00, 1395.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:43:14 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(72, 2, 72, 'IT020072', 'DA YURI-ANGEL GRINDER 4&quot;- DA 5012 (950W)', 113, '', '', NULL, 63, 1, 357, NULL, NULL, 2000.0000, 153, 2000.0000, 'Inclusive', -10.00, 1800.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:46:53 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(73, 2, 73, 'IT020073', 'HIMAX- ANGEL GRINDER 4&quot;-IC 022 (801)', 99, '', '', NULL, 63, 1, 358, NULL, NULL, 1600.0000, 153, 1600.0000, 'Inclusive', -10.00, 1440.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:56:15 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(74, 2, 74, 'IT020074', 'YIWAX- TCT SAW BLADE - 250 x 25.4x 40T', 114, '', '', NULL, 63, 2, 359, NULL, NULL, 800.0000, 153, 800.0000, 'Inclusive', 0.00, 800.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '11:59:48 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(75, 2, 75, 'IT020075', 'POWERTEX - TCT SAW BLADE - 10x40T (SLIM CUT)', 116, '', '', NULL, 63, 5, 338, NULL, NULL, 850.0000, 153, 850.0000, 'Inclusive', 0.00, 850.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:04:38 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(76, 2, 76, 'IT020076', 'GALAXY -CHAIN 18&quot; - 21LPX', 117, '', '', NULL, 63, 2, 360, NULL, NULL, 600.0000, 153, 600.0000, 'Inclusive', 0.00, 600.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:08:26 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(77, 2, 77, 'IT020077', '801 AB WASHER', 105, '', '', NULL, 63, 10, 337, NULL, NULL, 25.0000, 153, 25.0000, 'Inclusive', 0.00, 25.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:11:31 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(78, 2, 78, 'IT020078', '9553 AB WASHER( LASERTECH)', 105, '', '', NULL, 63, 10, 337, NULL, NULL, 25.0000, 153, 25.0000, 'Inclusive', 0.00, 25.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:14:29 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(79, 2, 79, 'IT020079', 'CM4SA AB WASHER(DAMIER)', 105, '', '', NULL, 63, 10, 336, NULL, NULL, 30.0000, 153, 30.0000, 'Inclusive', 0.00, 30.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:17:28 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(80, 2, 80, 'IT020080', 'YURI- CARBON BRUSH- 801', 118, '', '', NULL, 63, 5, 337, NULL, NULL, 20.0000, 153, 20.0000, 'Inclusive', 0.00, 20.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:20:00 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(81, 2, 81, 'IT020081', 'YURI- CARBON BRUSH -6-100', 118, '', '', NULL, 63, 5, 337, NULL, NULL, 20.0000, 153, 20.0000, 'Inclusive', 0.00, 20.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:22:26 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(82, 2, 82, 'IT020082', 'YURI- CARBON BRUSH-  2-26', 118, '', '', NULL, 63, 5, 337, NULL, NULL, 30.0000, 153, 30.0000, 'Inclusive', 0.00, 30.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:23:47 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(83, 2, 83, 'IT020083', 'YURI- CARBON BRUSH- CM4SA', 118, '', '', NULL, 63, 5, 337, NULL, NULL, 20.0000, 153, 20.0000, 'Inclusive', 0.00, 20.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:25:09 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(84, 2, 84, 'IT020084', 'YURI- CARBON BRUSH- ED6H', 118, '', '', NULL, 63, 5, 337, NULL, NULL, 20.0000, 153, 20.0000, 'Inclusive', 0.00, 20.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:26:11 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(85, 2, 85, 'IT020085', 'YURI- CARBON BRUSH- 11E', 118, '', '', NULL, 63, 5, 332, NULL, NULL, 50.0000, 153, 50.0000, 'Inclusive', 0.00, 50.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:27:24 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(86, 2, 86, 'IT020086', 'FREEMANS- MEASUREING TAPE- 5MTRS(BASIK)', 119, '', '', NULL, 63, 20, 361, NULL, NULL, 120.0000, 153, 120.0000, 'Inclusive', 0.00, 120.0000, 39.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:30:01 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(87, 2, 87, 'IT020087', 'FREEMANS- MEASUREING TAPE- 10MTRS(FIBR GLASS)', 119, '', '', NULL, 63, 2, 361, NULL, NULL, 200.0000, 153, 200.0000, 'Inclusive', 0.00, 200.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:31:58 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(88, 2, 88, 'IT020088', 'FREEMANS- MEASUREING TAPE- 15 MTRS (FIBRE GLASS)', 119, '', '', NULL, 63, 2, 361, NULL, NULL, 270.0000, 153, 270.0000, 'Inclusive', 0.00, 270.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:33:55 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(89, 2, 89, 'IT020089', 'FREEMANS- MEASUREING TAPE- 20MTRS(FIBREGLASS)', 119, '', '', NULL, 63, 2, 361, NULL, NULL, 350.0000, 153, 350.0000, 'Inclusive', 0.00, 350.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '12:35:42 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(90, 2, 90, 'IT020090', 'YURI- WELDING ROD -8G', 120, '', '', NULL, 63, 0, 337, NULL, NULL, 400.0000, 153, 400.0000, 'Inclusive', 0.00, 400.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '01:00:40 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(91, 2, 91, 'IT020091', 'YURI- WELDING ROD -10G', 120, '', '', NULL, 63, 0, 337, NULL, NULL, 500.0000, 153, 500.0000, 'Inclusive', 0.00, 500.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '01:01:36 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(92, 2, 92, 'IT020092', 'XTRAPOWER- ROTARY HAMMER 26MM - XPT434(03-26)', 121, '', '', NULL, 63, 0, 362, NULL, NULL, 6500.0000, 153, 6500.0000, 'Inclusive', -10.00, 5850.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '01:04:31 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(93, 2, 93, 'IT020093', 'DONGCHENG - ROTARY HAMMER 26MM- DZCO3-26', 121, '', '', NULL, 63, 0, 351, NULL, NULL, 7000.0000, 153, 7000.0000, 'Inclusive', -10.00, 6300.0000, 0.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-13', '01:06:10 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(94, 2, 94, 'IT020094', 'RAINBOW BLADE NICE', 93, '', '', NULL, 63, 50, 363, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '01:53:49 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(95, 2, 95, 'IT020095', 'RAINBOW BLADE SEGMENT', 93, '', '', NULL, 63, 50, 363, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '01:55:39 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(96, 2, 96, 'IT020096', 'FLAT BLADE', 93, '', '', NULL, 63, 5, 363, NULL, NULL, 200.0000, 153, 200.0000, 'Inclusive', 0.00, 200.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '01:56:55 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(97, 2, 97, 'IT020097', '3&quot; CUP BLADE IDEAL', 93, '', '', NULL, 63, 15, 364, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 25.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '01:59:37 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(98, 2, 98, 'IT020098', '3&quot; CUP BLADE RAINBOW', 93, '', '', NULL, 63, 15, 363, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 25.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:01:18 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(99, 2, 99, 'IT020099', '5MM HSS DRILL BIT J/B', 97, '', '', NULL, 63, 25, 365, NULL, NULL, 30.0000, 153, 30.0000, 'Inclusive', 0.00, 30.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:05:00 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(100, 2, 100, 'IT020100', '6MM HSS DRILL BIT J/B', 97, '', '', NULL, 63, 25, 365, NULL, NULL, 45.0000, 153, 45.0000, 'Inclusive', 0.00, 45.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:07:06 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(101, 2, 101, 'IT020101', '8 MM HSS DRILL BIT J/B', 97, '', '', NULL, 63, 25, 365, NULL, NULL, 85.0000, 153, 85.0000, 'Inclusive', 0.00, 85.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:08:48 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(102, 2, 102, 'IT020102', '100MM HSS DRILL BIT J/B', 97, '', '', NULL, 63, 25, 365, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:10:16 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(103, 2, 103, 'IT020103', '12MM HSS DRILL BIT J/B', 97, '', '', NULL, 63, 25, 365, NULL, NULL, 140.0000, 153, 140.0000, 'Inclusive', 0.00, 140.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:11:44 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(104, 2, 104, 'IT020104', '13MM HSS DRILL BIT J/B', 97, '', '', NULL, 63, 25, 365, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:13:15 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(105, 2, 105, 'IT020105', '6x110 SDS DRILL BIT', 97, '', '', NULL, 63, 10, 366, NULL, NULL, 30.0000, 153, 30.0000, 'Inclusive', 0.00, 30.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:17:09 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(106, 2, 106, 'IT020106', '8x160 SDS DRILL BIT', 97, '', '', NULL, 63, 10, 367, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:19:33 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(107, 2, 107, 'IT020107', '10x 160 SDA DRILL BIT', 97, '', '', NULL, 63, 10, 364, NULL, NULL, 110.0000, 153, 110.0000, 'Inclusive', 0.00, 110.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:21:39 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(108, 2, 108, 'IT020108', '12x160 SDS DRILL BIT', 97, '', '', NULL, 63, 10, 367, NULL, NULL, 120.0000, 153, 120.0000, 'Inclusive', 0.00, 120.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:22:37 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(109, 2, 109, 'IT020109', '16x310 SDS DRILL BIT', 97, '', '', NULL, 63, 2, 368, NULL, NULL, 240.0000, 153, 240.0000, 'Inclusive', 0.00, 240.0000, 3.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:24:55 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(110, 2, 110, 'IT020110', '18x310 SDS DRILL BIT', 97, '', '', NULL, 63, 2, 368, NULL, NULL, 260.0000, 153, 260.0000, 'Inclusive', 0.00, 260.0000, 3.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:26:33 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(111, 2, 111, 'IT020111', '20x310 SDS DRILL BIT', 97, '', '', NULL, 63, 2, 367, NULL, NULL, 320.0000, 153, 320.0000, 'Inclusive', 0.00, 320.0000, 3.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:28:23 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(112, 2, 112, 'IT020112', '25x310 SDS DRILL BIT', 97, '', '', NULL, 63, 2, 367, NULL, NULL, 375.0000, 153, 375.0000, 'Inclusive', 0.00, 375.0000, 3.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:29:49 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(113, 2, 113, 'IT020113', '4x30 TCT BLADE BULLET', 93, '', '', NULL, 63, 25, 334, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:31:40 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(114, 2, 114, 'IT020114', '5x30 TCT BLADE BULLET', 93, '', '', NULL, 63, 25, 334, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:33:11 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(115, 2, 115, 'IT020115', 'BATTER ANGLE GRANDER', 122, '', '', NULL, 63, 1, 369, NULL, NULL, 6000.0000, 153, 6000.0000, 'Inclusive', 0.00, 6000.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:35:45 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(116, 2, 116, 'IT020116', 'CLOW HAMMER', 123, '', '', NULL, 63, 10, 331, NULL, NULL, 270.0000, 153, 270.0000, 'Inclusive', 0.00, 270.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:41:00 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(117, 2, 117, 'IT020117', 'RUBBER HAMMER', 123, '', '', NULL, 63, 10, 370, NULL, NULL, 300.0000, 153, 300.0000, 'Inclusive', 0.00, 300.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:44:22 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(118, 2, 118, 'IT020118', 'NYLON HAMMER', 123, '', '', NULL, 63, 5, 371, NULL, NULL, 495.0000, 153, 495.0000, 'Inclusive', 0.00, 495.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:51:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(119, 2, 119, 'IT020119', '8&quot;SPRITE LEVEL', 124, '', '', NULL, 63, 5, 372, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:53:52 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(120, 2, 120, 'IT020120', '12&quot; SPRITE LEVEL', 124, '', '', NULL, 63, 2, 373, NULL, NULL, 180.0000, 153, 180.0000, 'Inclusive', 0.00, 180.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '02:58:43 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(121, 2, 121, 'IT020121', '12&quot;SPRITE LEVEL', 124, '', '', NULL, 63, 5, 364, NULL, NULL, 300.0000, 153, 300.0000, 'Inclusive', 0.00, 300.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:02:25 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(122, 2, 122, 'IT020122', '12&quot; SPRITE LEVEL MASTECH', 124, '', '', NULL, 63, 5, 374, NULL, NULL, 200.0000, 153, 200.0000, 'Inclusive', 0.00, 200.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:03:50 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(123, 2, 123, 'IT020123', '24&quot; SPRITE LEVEL', 124, '', '', NULL, 63, 5, 364, NULL, NULL, 450.0000, 153, 450.0000, 'Inclusive', 0.00, 450.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:06:01 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(124, 2, 124, 'IT020124', '24&quot; SPRITE LEVEL MASTECH', 124, '', '', NULL, 63, 5, 374, NULL, NULL, 480.0000, 153, 480.0000, 'Inclusive', 0.00, 480.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:07:33 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(125, 2, 125, 'IT020125', '6x7 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 66.0000, 153, 66.0000, 'Inclusive', 0.00, 66.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:09:37 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(126, 2, 126, 'IT020126', '8x9 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 84.0000, 153, 84.0000, 'Inclusive', 0.00, 84.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:10:38 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(127, 2, 127, 'IT020127', '10x11 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 94.0000, 153, 94.0000, 'Inclusive', 0.00, 94.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:11:31 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(128, 2, 128, 'IT020128', '12x13 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 97.0000, 153, 97.0000, 'Inclusive', 0.00, 97.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:12:50 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(129, 2, 129, 'IT020129', '14X15 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 108.0000, 153, 108.0000, 'Inclusive', 0.00, 108.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:13:42 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(130, 2, 130, 'IT020130', '16x17 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 134.0000, 153, 134.0000, 'Inclusive', 0.00, 134.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:14:28 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(131, 2, 131, 'IT020131', '18x19 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 162.0000, 153, 162.0000, 'Inclusive', 0.00, 162.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:15:23 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(132, 2, 132, 'IT020132', '20x22 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 202.0000, 153, 202.0000, 'Inclusive', 0.00, 202.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:16:19 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(133, 2, 133, 'IT020133', '21x23 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 246.0000, 153, 246.0000, 'Inclusive', 0.00, 246.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:17:14 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(134, 2, 134, 'IT020134', '24x26 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 268.0000, 153, 268.0000, 'Inclusive', 0.00, 268.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:18:17 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(135, 2, 135, 'IT020135', '25x28 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 348.0000, 153, 348.0000, 'Inclusive', 0.00, 348.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:19:28 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(136, 2, 136, 'IT020136', '30x32 RING SPANNER', 126, '', '', NULL, 63, 5, 375, NULL, NULL, 450.0000, 153, 450.0000, 'Inclusive', 0.00, 450.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:20:52 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(137, 2, 137, 'IT020137', '6x7  SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 19.0000, 153, 19.0000, 'Inclusive', 0.00, 19.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:27:51 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(138, 2, 138, 'IT020138', '8x9 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 26.0000, 153, 26.0000, 'Inclusive', 0.00, 26.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:29:10 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(139, 2, 139, 'IT020139', '10x11 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 27.0000, 153, 27.0000, 'Inclusive', 0.00, 27.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:30:28 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(140, 2, 140, 'IT020140', '12x13 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 32.0000, 153, 32.0000, 'Inclusive', 0.00, 32.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:31:41 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(141, 2, 141, 'IT020141', '14X15 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 39.0000, 153, 39.0000, 'Inclusive', 0.00, 39.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:32:54 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(142, 2, 142, 'IT020142', '16x17 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 51.0000, 153, 51.0000, 'Inclusive', 0.00, 51.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:34:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(143, 2, 143, 'IT020143', '18x19 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 62.0000, 153, 62.0000, 'Inclusive', 0.00, 62.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:34:58 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(144, 2, 144, 'IT020144', '20x22  D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 77.0000, 153, 77.0000, 'Inclusive', 0.00, 77.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:36:06 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(145, 2, 145, 'IT020145', '21x23 D/E  SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 88.0000, 153, 88.0000, 'Inclusive', 0.00, 88.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:37:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(146, 2, 146, 'IT020146', '24x26 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 118.0000, 153, 118.0000, 'Inclusive', 0.00, 118.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:38:31 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(147, 2, 147, 'IT020147', '25x28 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:40:23 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(148, 2, 148, 'IT020148', '30x32 D/E SPANNER', 125, '', '', NULL, 63, 5, 375, NULL, NULL, 170.0000, 153, 170.0000, 'Inclusive', 0.00, 170.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:41:44 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(149, 2, 149, 'IT020149', 'ALLENKEY SET BOX', 127, '', '', NULL, 63, 5, 376, NULL, NULL, 200.0000, 153, 200.0000, 'Inclusive', 0.00, 200.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:44:43 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(150, 2, 150, 'IT020150', 'ALLENKEY SET', 127, '', '', NULL, 63, 5, 376, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:45:56 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(151, 2, 151, 'IT020151', 'ZOOM GOGGLES BLACK', 128, '', '', NULL, 63, 5, 377, NULL, NULL, 50.0000, 153, 50.0000, 'Inclusive', 0.00, 50.0000, 12.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:47:42 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(152, 2, 152, 'IT020152', 'ZOOM GOGGLES WHITE', 128, '', '', NULL, 63, 5, 377, NULL, NULL, 50.0000, 153, 50.0000, 'Inclusive', 0.00, 50.0000, 12.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:48:33 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(153, 2, 153, 'IT020153', '16SQMM CABLE', 129, '', '', NULL, 63, 50, 378, NULL, NULL, 180.0000, 153, 180.0000, 'Inclusive', 0.00, 180.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:52:26 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(154, 2, 154, 'IT020154', '24 PCS SOCKET SET', 104, '', '', NULL, 63, 2, 379, NULL, NULL, 2800.0000, 153, 2800.0000, 'Inclusive', -10.00, 2520.0000, 3.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:54:59 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(155, 2, 155, 'IT020155', '6x7 TO 30x32 D/E SPANNER', 125, '', '', NULL, 63, 0, 380, NULL, NULL, 1200.0000, 153, 1200.0000, 'Inclusive', 0.00, 1200.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:57:29 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(156, 2, 156, 'IT020156', '6x7 TO 30x32 RING SPANNER', 126, '', '', NULL, 63, 0, 380, NULL, NULL, 2000.0000, 153, 2000.0000, 'Inclusive', 0.00, 2000.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '03:58:30 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(157, 2, 157, 'IT020157', 'SCROW DRIVER 2IN1', 130, '', '', NULL, 63, 10, 381, NULL, NULL, 80.0000, 153, 80.0000, 'Inclusive', 0.00, 80.0000, 21.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:01:09 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(158, 2, 158, 'IT020158', '12&quot; PIPE WRENCH', 104, '', '', NULL, 63, 2, 382, NULL, NULL, 320.0000, 153, 320.0000, 'Inclusive', 0.00, 320.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:03:59 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000);
INSERT INTO `db_items` (`id`, `store_id`, `count_id`, `item_code`, `item_name`, `category_id`, `sku`, `hsn`, `sac`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`, `discount_type`, `discount`, `service_bit`, `seller_points`, `custom_barcode`, `description`, `item_group`, `parent_id`, `variant_id`, `child_bit`, `mrp`) VALUES
(159, 2, 159, 'IT020159', '14&quot; PIPE WRENCH', 104, '', '', NULL, 63, 2, 382, NULL, NULL, 380.0000, 153, 380.0000, 'Inclusive', 0.00, 380.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:04:59 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(160, 2, 160, 'IT020160', '18&quot; PIPE WRENCH', 104, '', '', NULL, 63, 2, 383, NULL, NULL, 550.0000, 153, 550.0000, 'Inclusive', 0.00, 550.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:06:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(161, 2, 161, 'IT020161', 'J/B8&quot;CITTING PLAYER', 131, '', '', NULL, 63, 5, 365, NULL, NULL, 250.0000, 153, 250.0000, 'Inclusive', 0.00, 250.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:07:31 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(162, 2, 162, 'IT020162', '110 LTR AIR COMPRESSOR', 132, '', '', NULL, 63, 0, 384, NULL, NULL, 25000.0000, 153, 25000.0000, 'Inclusive', 0.00, 25000.0000, 0.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:10:33 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(163, 2, 163, 'IT020163', '3/4 TILE CORE BIT', 133, '', '', NULL, 63, 2, 385, NULL, NULL, 350.0000, 153, 350.0000, 'Inclusive', 0.00, 350.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:12:42 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(164, 2, 164, 'IT020164', '1&quot; TILE CORE BIT', 133, '', '', NULL, 63, 2, 385, NULL, NULL, 420.0000, 153, 420.0000, 'Inclusive', 0.00, 420.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:13:38 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(165, 2, 165, 'IT020165', '6&quot; CABLE CUTTER', 134, '', '', NULL, 63, 5, 371, NULL, NULL, 210.0000, 153, 210.0000, 'Inclusive', 0.00, 210.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:16:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(166, 2, 166, 'IT020166', '1/2 PAINT SPRAY GUN', 135, '', '', NULL, 63, 5, 386, NULL, NULL, 750.0000, 153, 750.0000, 'Inclusive', 0.00, 750.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:18:42 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(167, 2, 167, 'IT020167', '1 PAINT SPRAY GUN', 135, '', '', NULL, 63, 5, 387, NULL, NULL, 800.0000, 153, 800.0000, 'Inclusive', 0.00, 800.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:20:05 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(168, 2, 168, 'IT020168', '12V CORDLESS DRILL M/C', 103, '', '', NULL, 63, 2, 388, NULL, NULL, 3000.0000, 153, 3000.0000, 'Inclusive', -10.00, 2700.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:22:29 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(169, 2, 169, 'IT020169', 'KOMAL BLADE', 93, '', '', NULL, 63, 20, 389, NULL, NULL, 130.0000, 153, 130.0000, 'Inclusive', 0.00, 130.0000, 50.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:23:36 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(170, 2, 170, 'IT020170', '12 V CORDLESS DRILL M/C BULLET', 103, '', '', NULL, 63, 1, 334, NULL, NULL, 2325.0000, 153, 2325.0000, 'Inclusive', -10.00, 2093.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:25:14 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(171, 2, 171, 'IT020171', 'IDEAL AIRLESS SPRAY GUN', 135, '', '', NULL, 63, 0, 364, NULL, NULL, 26000.0000, 153, 26000.0000, 'Inclusive', -10.00, 23400.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '04:26:23 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(172, 2, 172, 'IT020172', '5&quot; DIS PAPER', 136, '', '', NULL, 63, 200, 334, NULL, NULL, 30.0000, 153, 30.0000, 'Inclusive', 0.00, 30.0000, 400.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-01-20', '05:30:45 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(173, 2, 173, 'IT020173', '50LTR COMPRESSOR', 132, '', '', NULL, 63, 0, 364, NULL, NULL, 26000.0000, 153, 26000.0000, 'Inclusive', 0.00, 26000.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:46:13 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(174, 2, 174, 'IT020174', '110 LTR  COMPRESSOR', 132, '', '', NULL, 63, 0, 391, NULL, NULL, 36000.0000, 153, 36000.0000, 'Inclusive', 0.00, 36000.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:48:16 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(175, 2, 175, 'IT020175', 'DOGCHUY DRY WALL SAND', 100, '', '', NULL, 63, 0, 351, NULL, NULL, 7000.0000, 153, 7000.0000, 'Inclusive', 0.00, 7000.0000, NULL, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:49:50 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(176, 2, 176, 'IT020176', '4x1 CUT OFF WHEEL', 93, '', '', NULL, 63, 50, 365, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:54:31 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(177, 2, 177, 'IT020177', '4x1 CUT OFF WHEEL', 93, '', '', NULL, 63, 100, 337, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 200.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:56:07 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(178, 2, 178, 'IT020178', '12x100T BLADE', 93, '', '', NULL, 63, 0, 392, NULL, NULL, 2500.0000, 153, 2500.0000, 'Inclusive', 0.00, 2500.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:58:13 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(179, 2, 179, 'IT020179', '12x 120 T BLADE', 93, '', '', NULL, 63, 0, 364, NULL, NULL, 2600.0000, 153, 2600.0000, 'Inclusive', 0.00, 2600.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '10:59:36 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(180, 2, 180, 'IT020180', '10x100 T BLADE', 93, '', '', NULL, 63, 0, 393, NULL, NULL, 2900.0000, 153, 2900.0000, 'Inclusive', 0.00, 2900.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:01:54 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(181, 2, 181, 'IT020181', '1/2  RATCHET  HANDLE', 137, '', '', NULL, 63, 0, 394, NULL, NULL, 500.0000, 153, 500.0000, 'Inclusive', 0.00, 500.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:05:41 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(182, 2, 182, 'IT020182', '4x40T BLADE', 93, '', '', NULL, 63, 5, 395, NULL, NULL, 160.0000, 153, 160.0000, 'Inclusive', 0.00, 160.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:29:44 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(183, 2, 183, 'IT020183', '4x 40t  BLADE', 93, '', '', NULL, 63, 5, 347, NULL, NULL, 160.0000, 153, 160.0000, 'Inclusive', 0.00, 160.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:32:09 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(184, 2, 184, 'IT020184', '4x  40t BLADE', 93, '', '', NULL, 63, 12, 396, NULL, NULL, 140.0000, 153, 140.0000, 'Inclusive', 0.00, 140.0000, 25.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:35:06 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(185, 2, 185, 'IT020185', '8&#039;&#039; CUTTING  PLIER', 131, '', '', NULL, 63, 3, 397, NULL, NULL, 295.0000, 153, 295.0000, 'Inclusive', 0.00, 295.0000, 6.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:40:00 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(186, 2, 186, 'IT020186', '13  x   1/4  BLADE', 93, '', '', NULL, 63, 1, 398, NULL, NULL, 1430.0000, 153, 1430.0000, 'Inclusive', 0.00, 1430.0000, 1430.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:44:16 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(187, 2, 187, 'IT020187', '15  x 1/4 BLADE', 93, '', '', NULL, 63, 1, 398, NULL, NULL, 1650.0000, 153, 1650.0000, 'Inclusive', 0.00, 1650.0000, 3.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:45:53 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(188, 2, 188, 'IT020188', '1900B PLANNER  BLADE', 93, '', '', NULL, 63, 2, 364, NULL, NULL, 400.0000, 153, 400.0000, 'Inclusive', 0.00, 400.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:47:49 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(189, 2, 189, 'IT020189', 'PLANER BLADE F20', 93, '', '', NULL, 63, 2, 364, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 5.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '11:48:56 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(190, 2, 190, 'IT020190', '6 PCS HOLESAW  SET', 138, '', '', NULL, 63, 1, 389, NULL, NULL, 150.0000, 153, 150.0000, 'Inclusive', 0.00, 150.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:01:00 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(191, 2, 191, 'IT020191', 'NEEDIL FALES', 139, '', '', NULL, 63, 10, 394, NULL, NULL, 20.0000, 153, 20.0000, 'Inclusive', 0.00, 20.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:04:42 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(192, 2, 192, 'IT020192', '8&#039;&#039; ADJUSTABLE  SPANNER', 125, '', '', NULL, 63, 1, 399, NULL, NULL, 180.0000, 153, 180.0000, 'Inclusive', 0.00, 180.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:08:16 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(193, 2, 193, 'IT020193', '10&#039;&#039; ADJUSTABLE  SPANNER', 125, '', '', NULL, 63, 1, 399, NULL, NULL, 225.0000, 153, 225.0000, 'Inclusive', 0.00, 225.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:09:41 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(194, 2, 194, 'IT020194', '12&#039;&#039; ADJUSTABLE  SPANNER', 125, '', '', NULL, 63, 1, 400, NULL, NULL, 300.0000, 153, 300.0000, 'Inclusive', 0.00, 300.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:11:08 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(195, 2, 195, 'IT020195', '3-5 JIB HSS DRILL BIT', 133, '', '', NULL, 63, 50, 365, NULL, NULL, 15.0000, 153, 15.0000, 'Inclusive', 0.00, 15.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:12:41 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(196, 2, 196, 'IT020196', '2-5 JIB HSS DRILL BIT', 133, '', '', NULL, 63, 100, 365, NULL, NULL, 10.0000, 153, 10.0000, 'Inclusive', 0.00, 10.0000, 200.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:13:48 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(197, 2, 197, 'IT020197', '3 JIB HSS DRILL BIT', 133, '', '', NULL, 63, 50, 365, NULL, NULL, 12.0000, 153, 12.0000, 'Inclusive', 0.00, 12.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:14:56 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(198, 2, 198, 'IT020198', '4  JIB HSS DRILL BIT', 133, '', '', NULL, 63, 5, 365, NULL, NULL, 20.0000, 153, 20.0000, 'Inclusive', 0.00, 20.0000, 9.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:17:40 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(199, 2, 199, 'IT020199', '9502 ROUTER BIT', 133, '', '', NULL, 63, 5, 365, NULL, NULL, 95.0000, 153, 95.0000, 'Inclusive', 0.00, 95.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:22:07 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(200, 2, 200, 'IT020200', '9503 ROUTER BIT', 133, '', '', NULL, 63, 5, 365, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:23:59 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(201, 2, 201, 'IT020201', '9501 ROUTER BIT', 133, '', '', NULL, 63, 10, 365, NULL, NULL, 90.0000, 153, 90.0000, 'Inclusive', 0.00, 90.0000, 20.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:25:45 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(202, 2, 202, 'IT020202', '3&#039;&#039; CUP  BLADE', 93, '', '', NULL, 63, 5, 401, NULL, NULL, 100.0000, 153, 100.0000, 'Inclusive', 0.00, 100.0000, 10.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:42:56 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(203, 2, 203, 'IT020203', '7 VELCRON PAPER', 136, '', '', NULL, 63, 50, 349, NULL, NULL, 35.0000, 153, 35.0000, 'Inclusive', 0.00, 35.0000, 100.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:51:23 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(204, 2, 204, 'IT020204', '2  x  2 PUMP SET', 140, '', '', NULL, 63, 0, 402, NULL, NULL, 14500.0000, 153, 14500.0000, 'Inclusive', 0.00, 14500.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:53:28 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(205, 2, 205, 'IT020205', '200 MAPROM  WELDING M/C', 107, '', '', NULL, 63, 0, 0, NULL, NULL, 4950.0000, 153, 4950.0000, 'Inclusive', 0.00, 4950.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:56:13 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(206, 2, 206, 'IT020206', 'PVC  CUTTER', 141, '', '', NULL, 63, 1, 403, NULL, NULL, 450.0000, 153, 450.0000, 'Inclusive', 0.00, 450.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '12:58:10 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(207, 2, 207, 'IT020207', 'DONGCHENG   DSB  185B', 142, '', '', NULL, 63, 1, 351, NULL, NULL, 2850.0000, 153, 2850.0000, 'Inclusive', 0.00, 2850.0000, 2.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-08', '01:00:33 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(208, 2, 208, NULL, '3X3 PUMP SET', 140, '', '82032000', NULL, 61, 0, 402, NULL, NULL, 16500.0000, 153, 16500.0000, 'Inclusive', 0.00, 16500.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-24', '02:14:54 pm', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000),
(209, 2, 209, 'IT020209', '2x2 pump set', 140, '', 'ASS\\23-24\\1099', NULL, 61, 0, 402, NULL, NULL, 14500.0000, 151, 14500.0000, 'Inclusive', -10.00, 13050.0000, 1.00, NULL, '::1', 'DESKTOP-8BGMAA4', '2024-02-26', '11:25:22 am', 'ADMINSIVA', NULL, 1, 'Percentage', 0.00, 0, 0.00, '', '', 'Single', NULL, NULL, 0, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `db_languages`
--

CREATE TABLE `db_languages` (
  `id` int(5) NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_languages`
--

INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES
(1, 'English', 1),
(2, 'Russian', 1),
(3, 'Spanish', 1),
(4, 'Arabic', 1),
(5, 'Bangla', 1),
(6, 'French', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_package`
--

CREATE TABLE `db_package` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `package_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_price` double(20,2) DEFAULT NULL,
  `annual_price` double(20,2) DEFAULT NULL,
  `trial_days` int(10) DEFAULT NULL,
  `max_users` int(10) DEFAULT NULL,
  `max_items` int(10) DEFAULT NULL,
  `max_invoices` int(10) DEFAULT NULL,
  `max_warehouses` int(10) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `plan_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_package`
--

INSERT INTO `db_package` (`id`, `store_id`, `package_type`, `package_code`, `package_name`, `description`, `monthly_price`, `annual_price`, `trial_days`, `max_users`, `max_items`, `max_invoices`, `max_warehouses`, `expire_date`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `status`, `plan_type`) VALUES
(1, 1, 'Free', NULL, 'Free', 'Test description', 0.00, 0.00, 10, 2, 20, 20, 2, '2021-01-14', '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-01-13', '06:37:21 pm', 'admin', 1, NULL),
(2, 1, 'Paid', NULL, 'Regular', 'Test description', 250.00, 2000.00, 15, 20, 200, 200, 20, NULL, '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-01-13', '06:39:23 pm', 'admin', 1, NULL),
(3, 1, 'Paid', NULL, 'Ultimate', 'Description', 500.00, 5000.00, 15, -1, -1, -1, -1, NULL, '127.0.0.1', 'LAPTOP-I5OUIM4R', '2021-01-24', '12:35:30 pm', 'admin', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_paymenttypes`
--

CREATE TABLE `db_paymenttypes` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_paymenttypes`
--

INSERT INTO `db_paymenttypes` (`id`, `store_id`, `payment_type`, `status`) VALUES
(36, 2, 'CASH', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_paypal`
--

CREATE TABLE `db_paypal` (
  `id` int(5) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_paypal`
--

INSERT INTO `db_paypal` (`id`, `store_id`, `sandbox`, `email`, `updated_at`, `updated_by`, `status`) VALUES
(1, 1, 1, '', '2021-02-22', 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_paypalpaylog`
--

CREATE TABLE `db_paypalpaylog` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_permissions`
--

CREATE TABLE `db_permissions` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permissions` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_permissions`
--

INSERT INTO `db_permissions` (`id`, `store_id`, `role_id`, `permissions`) VALUES
(4414, 1, 17, 'items_add'),
(4415, 1, 17, 'items_edit'),
(4416, 1, 17, 'items_delete'),
(4417, 1, 17, 'items_view'),
(4418, 1, 17, 'import_items'),
(4419, 1, 17, 'brand_add'),
(4420, 1, 17, 'brand_edit'),
(4421, 1, 17, 'brand_delete'),
(4422, 1, 17, 'brand_view'),
(4423, 1, 17, 'customers_add'),
(4424, 1, 17, 'customers_edit'),
(4425, 1, 17, 'customers_delete'),
(4426, 1, 17, 'customers_view'),
(4427, 1, 17, 'sales_add'),
(4428, 1, 17, 'sales_edit'),
(4429, 1, 17, 'sales_delete'),
(4430, 1, 17, 'sales_view'),
(4431, 1, 17, 'sales_payment_view'),
(4432, 1, 17, 'sales_payment_add'),
(4433, 1, 17, 'sales_payment_delete'),
(4434, 1, 17, 'sales_report'),
(4435, 1, 17, 'sales_payments_report'),
(4436, 1, 17, 'items_category_add'),
(4437, 1, 17, 'items_category_edit'),
(4438, 1, 17, 'items_category_delete'),
(4439, 1, 17, 'items_category_view'),
(4440, 1, 17, 'print_labels'),
(4441, 1, 17, 'dashboard_view'),
(4442, 1, 17, 'dashboard_info_box_1'),
(4443, 1, 17, 'dashboard_info_box_2'),
(4444, 1, 17, 'dashboard_pur_sal_chart'),
(4445, 1, 17, 'dashboard_recent_items'),
(4446, 1, 17, 'dashboard_stock_alert'),
(4447, 1, 17, 'dashboard_trending_items_chart'),
(4448, 1, 17, 'sales_return_add'),
(4449, 1, 17, 'sales_return_edit'),
(4450, 1, 17, 'sales_return_delete'),
(4451, 1, 17, 'sales_return_view'),
(4452, 1, 17, 'sales_return_report'),
(4453, 1, 17, 'sales_return_payment_view'),
(4454, 1, 17, 'sales_return_payment_add'),
(4455, 1, 17, 'sales_return_payment_delete'),
(4456, 1, 17, 'payment_types_add'),
(4457, 1, 17, 'payment_types_edit'),
(4458, 1, 17, 'payment_types_delete'),
(4459, 1, 17, 'payment_types_view'),
(4460, 1, 17, 'import_customers'),
(4461, 1, 17, 'stock_transfer_add'),
(4462, 1, 17, 'stock_transfer_edit'),
(4463, 1, 17, 'stock_transfer_delete'),
(4464, 1, 17, 'stock_transfer_view'),
(4465, 1, 17, 'seller_points_report'),
(4466, 1, 17, 'services_add'),
(4467, 1, 17, 'services_edit'),
(4468, 1, 17, 'services_delete'),
(4469, 1, 17, 'services_view'),
(4470, 1, 17, 'import_services'),
(4471, 1, 17, 'stock_adjustment_add'),
(4472, 1, 17, 'stock_adjustment_edit'),
(4473, 1, 17, 'stock_adjustment_delete'),
(4474, 1, 17, 'stock_adjustment_view'),
(4475, 1, 17, 'variant_add'),
(4476, 1, 17, 'variant_edit'),
(4477, 1, 17, 'variant_delete'),
(4478, 1, 17, 'variant_view'),
(4479, 1, 17, 'accounts_add'),
(4480, 1, 17, 'accounts_edit'),
(4481, 1, 17, 'accounts_delete'),
(4482, 1, 17, 'accounts_view'),
(4483, 1, 17, 'money_transfer_add'),
(4484, 1, 17, 'money_transfer_edit'),
(4485, 1, 17, 'money_transfer_delete'),
(4486, 1, 17, 'money_transfer_view'),
(4487, 1, 17, 'money_deposit_add'),
(4488, 1, 17, 'money_deposit_edit'),
(4489, 1, 17, 'money_deposit_delete'),
(4490, 1, 17, 'money_deposit_view'),
(4491, 1, 17, 'sales_tax_report'),
(4492, 1, 18, 'tax_add'),
(4493, 1, 18, 'tax_edit'),
(4494, 1, 18, 'tax_delete'),
(4495, 1, 18, 'tax_view'),
(4496, 1, 18, 'units_add'),
(4497, 1, 18, 'units_edit'),
(4498, 1, 18, 'units_delete'),
(4499, 1, 18, 'units_view'),
(4500, 1, 18, 'items_add'),
(4501, 1, 18, 'items_edit'),
(4502, 1, 18, 'items_delete'),
(4503, 1, 18, 'items_view'),
(4504, 1, 18, 'import_items'),
(4505, 1, 18, 'brand_add'),
(4506, 1, 18, 'brand_edit'),
(4507, 1, 18, 'brand_delete'),
(4508, 1, 18, 'brand_view'),
(4509, 1, 18, 'suppliers_add'),
(4510, 1, 18, 'suppliers_edit'),
(4511, 1, 18, 'suppliers_delete'),
(4512, 1, 18, 'suppliers_view'),
(4513, 1, 18, 'purchase_add'),
(4514, 1, 18, 'purchase_edit'),
(4515, 1, 18, 'purchase_delete'),
(4516, 1, 18, 'purchase_view'),
(4517, 1, 18, 'purchase_report'),
(4518, 1, 18, 'purchase_payments_report'),
(4519, 1, 18, 'items_category_add'),
(4520, 1, 18, 'items_category_edit'),
(4521, 1, 18, 'items_category_delete'),
(4522, 1, 18, 'items_category_view'),
(4523, 1, 18, 'print_labels'),
(4524, 1, 18, 'dashboard_view'),
(4525, 1, 18, 'dashboard_info_box_1'),
(4526, 1, 18, 'dashboard_info_box_2'),
(4527, 1, 18, 'dashboard_pur_sal_chart'),
(4528, 1, 18, 'dashboard_recent_items'),
(4529, 1, 18, 'dashboard_stock_alert'),
(4530, 1, 18, 'dashboard_trending_items_chart'),
(4531, 1, 18, 'purchase_return_add'),
(4532, 1, 18, 'purchase_return_edit'),
(4533, 1, 18, 'purchase_return_delete'),
(4534, 1, 18, 'purchase_return_view'),
(4535, 1, 18, 'purchase_return_report'),
(4536, 1, 18, 'purchase_return_payment_view'),
(4537, 1, 18, 'purchase_return_payment_add'),
(4538, 1, 18, 'purchase_return_payment_delete'),
(4539, 1, 18, 'purchase_payment_view'),
(4540, 1, 18, 'purchase_payment_add'),
(4541, 1, 18, 'purchase_payment_delete'),
(4542, 1, 18, 'payment_types_add'),
(4543, 1, 18, 'payment_types_edit'),
(4544, 1, 18, 'payment_types_delete'),
(4545, 1, 18, 'payment_types_view'),
(4546, 1, 18, 'import_suppliers'),
(4547, 1, 18, 'stock_transfer_add'),
(4548, 1, 18, 'stock_transfer_edit'),
(4549, 1, 18, 'stock_transfer_delete'),
(4550, 1, 18, 'stock_transfer_view'),
(4551, 1, 18, 'warehouse_add'),
(4552, 1, 18, 'warehouse_edit'),
(4553, 1, 18, 'warehouse_delete'),
(4554, 1, 18, 'warehouse_view'),
(4555, 1, 18, 'services_add'),
(4556, 1, 18, 'services_edit'),
(4557, 1, 18, 'services_delete'),
(4558, 1, 18, 'services_view'),
(4559, 1, 18, 'import_services'),
(4560, 1, 18, 'stock_adjustment_add'),
(4561, 1, 18, 'stock_adjustment_edit'),
(4562, 1, 18, 'stock_adjustment_delete'),
(4563, 1, 18, 'stock_adjustment_view'),
(4564, 1, 18, 'variant_add'),
(4565, 1, 18, 'variant_edit'),
(4566, 1, 18, 'variant_delete'),
(4567, 1, 18, 'variant_view'),
(4568, 1, 18, 'accounts_add'),
(4569, 1, 18, 'accounts_edit'),
(4570, 1, 18, 'accounts_delete'),
(4571, 1, 18, 'accounts_view'),
(4572, 1, 18, 'money_transfer_add'),
(4573, 1, 18, 'money_transfer_edit'),
(4574, 1, 18, 'money_transfer_delete'),
(4575, 1, 18, 'money_transfer_view'),
(4576, 1, 18, 'money_deposit_add'),
(4577, 1, 18, 'money_deposit_edit'),
(4578, 1, 18, 'money_deposit_delete'),
(4579, 1, 18, 'money_deposit_view'),
(4580, 1, 18, 'purchase_tax_report'),
(5818, 1, 2, 'users_add'),
(5819, 1, 2, 'users_edit'),
(5820, 1, 2, 'users_delete'),
(5821, 1, 2, 'users_view'),
(5822, 1, 2, 'tax_add'),
(5823, 1, 2, 'tax_edit'),
(5824, 1, 2, 'tax_delete'),
(5825, 1, 2, 'tax_view'),
(5826, 1, 2, 'store_edit'),
(5827, 1, 2, 'units_add'),
(5828, 1, 2, 'units_edit'),
(5829, 1, 2, 'units_delete'),
(5830, 1, 2, 'units_view'),
(5831, 1, 2, 'roles_add'),
(5832, 1, 2, 'roles_edit'),
(5833, 1, 2, 'roles_delete'),
(5834, 1, 2, 'roles_view'),
(5835, 1, 2, 'expense_add'),
(5836, 1, 2, 'expense_edit'),
(5837, 1, 2, 'expense_delete'),
(5838, 1, 2, 'expense_view'),
(5839, 1, 2, 'items_add'),
(5840, 1, 2, 'items_edit'),
(5841, 1, 2, 'items_delete'),
(5842, 1, 2, 'items_view'),
(5843, 1, 2, 'import_items'),
(5844, 1, 2, 'brand_add'),
(5845, 1, 2, 'brand_edit'),
(5846, 1, 2, 'brand_delete'),
(5847, 1, 2, 'brand_view'),
(5848, 1, 2, 'suppliers_add'),
(5849, 1, 2, 'suppliers_edit'),
(5850, 1, 2, 'suppliers_delete'),
(5851, 1, 2, 'suppliers_view'),
(5852, 1, 2, 'customers_add'),
(5853, 1, 2, 'customers_edit'),
(5854, 1, 2, 'customers_delete'),
(5855, 1, 2, 'customers_view'),
(5856, 1, 2, 'purchase_add'),
(5857, 1, 2, 'purchase_edit'),
(5858, 1, 2, 'purchase_delete'),
(5859, 1, 2, 'purchase_view'),
(5860, 1, 2, 'sales_add'),
(5861, 1, 2, 'sales_edit'),
(5862, 1, 2, 'sales_delete'),
(5863, 1, 2, 'sales_view'),
(5864, 1, 2, 'sales_payment_view'),
(5865, 1, 2, 'sales_payment_add'),
(5866, 1, 2, 'sales_payment_delete'),
(5867, 1, 2, 'sales_report'),
(5868, 1, 2, 'purchase_report'),
(5869, 1, 2, 'expense_report'),
(5870, 1, 2, 'profit_report'),
(5871, 1, 2, 'stock_report'),
(5872, 1, 2, 'item_sales_report'),
(5873, 1, 2, 'purchase_payments_report'),
(5874, 1, 2, 'sales_payments_report'),
(5875, 1, 2, 'items_category_add'),
(5876, 1, 2, 'items_category_edit'),
(5877, 1, 2, 'items_category_delete'),
(5878, 1, 2, 'items_category_view'),
(5879, 1, 2, 'print_labels'),
(5880, 1, 2, 'expense_category_add'),
(5881, 1, 2, 'expense_category_edit'),
(5882, 1, 2, 'expense_category_delete'),
(5883, 1, 2, 'expense_category_view'),
(5884, 1, 2, 'dashboard_view'),
(5885, 1, 2, 'dashboard_info_box_1'),
(5886, 1, 2, 'dashboard_info_box_2'),
(5887, 1, 2, 'dashboard_pur_sal_chart'),
(5888, 1, 2, 'dashboard_recent_items'),
(5889, 1, 2, 'dashboard_stock_alert'),
(5890, 1, 2, 'dashboard_trending_items_chart'),
(5891, 1, 2, 'send_sms'),
(5892, 1, 2, 'sms_template_edit'),
(5893, 1, 2, 'sms_template_view'),
(5894, 1, 2, 'sms_api_view'),
(5895, 1, 2, 'sms_api_edit'),
(5896, 1, 2, 'purchase_return_add'),
(5897, 1, 2, 'purchase_return_edit'),
(5898, 1, 2, 'purchase_return_delete'),
(5899, 1, 2, 'purchase_return_view'),
(5900, 1, 2, 'purchase_return_report'),
(5901, 1, 2, 'sales_return_add'),
(5902, 1, 2, 'sales_return_edit'),
(5903, 1, 2, 'sales_return_delete'),
(5904, 1, 2, 'sales_return_view'),
(5905, 1, 2, 'sales_return_report'),
(5906, 1, 2, 'sales_return_payment_view'),
(5907, 1, 2, 'sales_return_payment_add'),
(5908, 1, 2, 'sales_return_payment_delete'),
(5909, 1, 2, 'purchase_return_payment_view'),
(5910, 1, 2, 'purchase_return_payment_add'),
(5911, 1, 2, 'purchase_return_payment_delete'),
(5912, 1, 2, 'purchase_payment_view'),
(5913, 1, 2, 'purchase_payment_add'),
(5914, 1, 2, 'purchase_payment_delete'),
(5915, 1, 2, 'payment_types_add'),
(5916, 1, 2, 'payment_types_edit'),
(5917, 1, 2, 'payment_types_delete'),
(5918, 1, 2, 'payment_types_view'),
(5919, 1, 2, 'import_customers'),
(5920, 1, 2, 'import_suppliers'),
(5921, 1, 2, 'stock_transfer_add'),
(5922, 1, 2, 'stock_transfer_edit'),
(5923, 1, 2, 'stock_transfer_delete'),
(5924, 1, 2, 'stock_transfer_view'),
(5925, 1, 2, 'warehouse_add'),
(5926, 1, 2, 'warehouse_edit'),
(5927, 1, 2, 'warehouse_delete'),
(5928, 1, 2, 'warehouse_view'),
(5929, 1, 2, 'supplier_items_report'),
(5930, 1, 2, 'seller_points_report'),
(5931, 1, 2, 'services_add'),
(5932, 1, 2, 'services_edit'),
(5933, 1, 2, 'services_delete'),
(5934, 1, 2, 'services_view'),
(5935, 1, 2, 'quotation_add'),
(5936, 1, 2, 'quotation_edit'),
(5937, 1, 2, 'quotation_delete'),
(5938, 1, 2, 'quotation_view'),
(5939, 1, 2, 'import_services'),
(5940, 1, 2, 'stock_adjustment_add'),
(5941, 1, 2, 'stock_adjustment_edit'),
(5942, 1, 2, 'stock_adjustment_delete'),
(5943, 1, 2, 'stock_adjustment_view'),
(5944, 1, 2, 'variant_add'),
(5945, 1, 2, 'variant_edit'),
(5946, 1, 2, 'variant_delete'),
(5947, 1, 2, 'variant_view'),
(5948, 1, 2, 'accounts_add'),
(5949, 1, 2, 'accounts_edit'),
(5950, 1, 2, 'accounts_delete'),
(5951, 1, 2, 'accounts_view'),
(5952, 1, 2, 'money_transfer_add'),
(5953, 1, 2, 'money_transfer_edit'),
(5954, 1, 2, 'money_transfer_delete'),
(5955, 1, 2, 'money_transfer_view'),
(5956, 1, 2, 'money_deposit_add'),
(5957, 1, 2, 'money_deposit_edit'),
(5958, 1, 2, 'money_deposit_delete'),
(5959, 1, 2, 'money_deposit_view'),
(5960, 1, 2, 'sales_tax_report'),
(5961, 1, 2, 'purchase_tax_report'),
(5962, 1, 2, 'cash_transactions'),
(5963, 1, 2, 'show_all_users_sales_invoices'),
(5964, 1, 2, 'show_all_users_sales_return_invoices'),
(5965, 1, 2, 'show_all_users_purchase_invoices'),
(5966, 1, 2, 'show_all_users_purchase_return_invoices'),
(5967, 1, 2, 'show_all_users_expenses'),
(5968, 1, 2, 'show_all_users_quotations'),
(5969, 1, 2, 'subscription'),
(5970, 1, 2, 'smtp_settings'),
(5971, 1, 2, 'send_email'),
(5972, 1, 2, 'sms_settings'),
(5973, 1, 2, 'email_template_edit'),
(5974, 1, 2, 'email_template_view'),
(5975, 1, 2, 'cust_adv_payments_add'),
(5976, 1, 2, 'cust_adv_payments_edit'),
(5977, 1, 2, 'cust_adv_payments_delete'),
(5978, 1, 2, 'cust_adv_payments_view'),
(5999, 2, 28, 'cust_adv_payments_add'),
(6000, 2, 28, 'cust_adv_payments_edit'),
(6001, 2, 28, 'cust_adv_payments_delete'),
(6002, 2, 28, 'cust_adv_payments_view'),
(6011, 2, 29, 'users_add'),
(6012, 2, 29, 'users_edit'),
(6013, 2, 29, 'users_delete'),
(6014, 2, 29, 'users_view'),
(6015, 2, 29, 'tax_add'),
(6016, 2, 29, 'tax_edit'),
(6017, 2, 29, 'tax_delete'),
(6018, 2, 29, 'tax_view'),
(6019, 2, 29, 'store_edit'),
(6020, 2, 29, 'units_add'),
(6021, 2, 29, 'units_edit'),
(6022, 2, 29, 'units_delete'),
(6023, 2, 29, 'units_view'),
(6024, 2, 29, 'roles_add'),
(6025, 2, 29, 'roles_edit'),
(6026, 2, 29, 'roles_delete'),
(6027, 2, 29, 'roles_view'),
(6028, 2, 29, 'expense_add'),
(6029, 2, 29, 'expense_edit'),
(6030, 2, 29, 'expense_delete'),
(6031, 2, 29, 'expense_view'),
(6032, 2, 29, 'items_add'),
(6033, 2, 29, 'items_edit'),
(6034, 2, 29, 'items_delete'),
(6035, 2, 29, 'items_view'),
(6036, 2, 29, 'import_items'),
(6037, 2, 29, 'brand_add'),
(6038, 2, 29, 'brand_edit'),
(6039, 2, 29, 'brand_delete'),
(6040, 2, 29, 'brand_view'),
(6041, 2, 29, 'suppliers_add'),
(6042, 2, 29, 'suppliers_edit'),
(6043, 2, 29, 'suppliers_delete'),
(6044, 2, 29, 'suppliers_view'),
(6045, 2, 29, 'customers_add'),
(6046, 2, 29, 'customers_edit'),
(6047, 2, 29, 'customers_delete'),
(6048, 2, 29, 'customers_view'),
(6049, 2, 29, 'purchase_add'),
(6050, 2, 29, 'purchase_edit'),
(6051, 2, 29, 'purchase_delete'),
(6052, 2, 29, 'purchase_view'),
(6053, 2, 29, 'sales_add'),
(6054, 2, 29, 'sales_edit'),
(6055, 2, 29, 'sales_delete'),
(6056, 2, 29, 'sales_view'),
(6057, 2, 29, 'sales_payment_view'),
(6058, 2, 29, 'sales_payment_add'),
(6059, 2, 29, 'sales_payment_delete'),
(6060, 2, 29, 'sales_report'),
(6061, 2, 29, 'purchase_report'),
(6062, 2, 29, 'expense_report'),
(6063, 2, 29, 'profit_report'),
(6064, 2, 29, 'stock_report'),
(6065, 2, 29, 'item_sales_report'),
(6066, 2, 29, 'purchase_payments_report'),
(6067, 2, 29, 'sales_payments_report'),
(6068, 2, 29, 'items_category_add'),
(6069, 2, 29, 'items_category_edit'),
(6070, 2, 29, 'items_category_delete'),
(6071, 2, 29, 'items_category_view'),
(6072, 2, 29, 'print_labels'),
(6073, 2, 29, 'expense_category_add'),
(6074, 2, 29, 'expense_category_edit'),
(6075, 2, 29, 'expense_category_delete'),
(6076, 2, 29, 'expense_category_view'),
(6077, 2, 29, 'dashboard_view'),
(6078, 2, 29, 'dashboard_info_box_1'),
(6079, 2, 29, 'dashboard_info_box_2'),
(6080, 2, 29, 'dashboard_pur_sal_chart'),
(6081, 2, 29, 'dashboard_recent_items'),
(6082, 2, 29, 'dashboard_stock_alert'),
(6083, 2, 29, 'dashboard_trending_items_chart'),
(6084, 2, 29, 'send_sms'),
(6085, 2, 29, 'sms_template_edit'),
(6086, 2, 29, 'sms_template_view'),
(6087, 2, 29, 'sms_api_view'),
(6088, 2, 29, 'sms_api_edit'),
(6089, 2, 29, 'purchase_return_add'),
(6090, 2, 29, 'purchase_return_edit'),
(6091, 2, 29, 'purchase_return_delete'),
(6092, 2, 29, 'purchase_return_view'),
(6093, 2, 29, 'purchase_return_report'),
(6094, 2, 29, 'sales_return_add'),
(6095, 2, 29, 'sales_return_edit'),
(6096, 2, 29, 'sales_return_delete'),
(6097, 2, 29, 'sales_return_view'),
(6098, 2, 29, 'sales_return_report'),
(6099, 2, 29, 'sales_return_payment_view'),
(6100, 2, 29, 'sales_return_payment_add'),
(6101, 2, 29, 'sales_return_payment_delete'),
(6102, 2, 29, 'purchase_return_payment_view'),
(6103, 2, 29, 'purchase_return_payment_add'),
(6104, 2, 29, 'purchase_return_payment_delete'),
(6105, 2, 29, 'purchase_payment_view'),
(6106, 2, 29, 'purchase_payment_add'),
(6107, 2, 29, 'purchase_payment_delete'),
(6108, 2, 29, 'payment_types_add'),
(6109, 2, 29, 'payment_types_edit'),
(6110, 2, 29, 'payment_types_delete'),
(6111, 2, 29, 'payment_types_view'),
(6112, 2, 29, 'import_customers'),
(6113, 2, 29, 'import_suppliers'),
(6114, 2, 29, 'stock_transfer_add'),
(6115, 2, 29, 'stock_transfer_edit'),
(6116, 2, 29, 'stock_transfer_delete'),
(6117, 2, 29, 'stock_transfer_view'),
(6118, 2, 29, 'warehouse_add'),
(6119, 2, 29, 'warehouse_edit'),
(6120, 2, 29, 'warehouse_delete'),
(6121, 2, 29, 'warehouse_view'),
(6122, 2, 29, 'supplier_items_report'),
(6123, 2, 29, 'seller_points_report'),
(6124, 2, 29, 'services_add'),
(6125, 2, 29, 'services_edit'),
(6126, 2, 29, 'services_delete'),
(6127, 2, 29, 'services_view'),
(6128, 2, 29, 'quotation_add'),
(6129, 2, 29, 'quotation_edit'),
(6130, 2, 29, 'quotation_delete'),
(6131, 2, 29, 'quotation_view'),
(6132, 2, 29, 'import_services'),
(6133, 2, 29, 'stock_adjustment_add'),
(6134, 2, 29, 'stock_adjustment_edit'),
(6135, 2, 29, 'stock_adjustment_delete'),
(6136, 2, 29, 'stock_adjustment_view'),
(6137, 2, 29, 'variant_add'),
(6138, 2, 29, 'variant_edit'),
(6139, 2, 29, 'variant_delete'),
(6140, 2, 29, 'variant_view'),
(6141, 2, 29, 'accounts_add'),
(6142, 2, 29, 'accounts_edit'),
(6143, 2, 29, 'accounts_delete'),
(6144, 2, 29, 'accounts_view'),
(6145, 2, 29, 'money_transfer_add'),
(6146, 2, 29, 'money_transfer_edit'),
(6147, 2, 29, 'money_transfer_delete'),
(6148, 2, 29, 'money_transfer_view'),
(6149, 2, 29, 'money_deposit_add'),
(6150, 2, 29, 'money_deposit_edit'),
(6151, 2, 29, 'money_deposit_delete'),
(6152, 2, 29, 'money_deposit_view'),
(6153, 2, 29, 'sales_tax_report'),
(6154, 2, 29, 'purchase_tax_report'),
(6155, 2, 29, 'cash_transactions'),
(6156, 2, 29, 'show_all_users_sales_invoices'),
(6157, 2, 29, 'show_all_users_sales_return_invoices'),
(6158, 2, 29, 'show_all_users_purchase_invoices'),
(6159, 2, 29, 'show_all_users_purchase_return_invoices'),
(6160, 2, 29, 'show_all_users_expenses'),
(6161, 2, 29, 'show_all_users_quotations'),
(6162, 2, 29, 'smtp_settings'),
(6163, 2, 29, 'send_email'),
(6164, 2, 29, 'sms_settings'),
(6165, 2, 29, 'email_template_edit'),
(6166, 2, 29, 'email_template_view'),
(6167, 2, 29, 'cust_adv_payments_add'),
(6168, 2, 29, 'cust_adv_payments_edit'),
(6169, 2, 29, 'cust_adv_payments_delete'),
(6170, 2, 29, 'cust_adv_payments_view'),
(6179, 1, 2, 'gstr_1_report'),
(6180, 1, 2, 'gstr_2_report'),
(6181, 1, 2, 'delivery_sheet_report'),
(6182, 1, 2, 'load_sheet_report'),
(6183, 1, 2, 'show_purchase_price'),
(6184, 1, 2, 'customer_orders_report'),
(6185, 1, 2, 'discountCouponAdd'),
(6186, 1, 2, 'discountCouponEdit'),
(6187, 1, 2, 'discountCouponDelete'),
(6188, 1, 2, 'discountCouponView'),
(6189, 2, 2, 'sales_gst_report'),
(6190, 2, 2, 'purchase_gst_report'),
(6191, 2, 2, 'subscription'),
(6192, 1, 2, 'customerCouponAdd'),
(6193, 1, 2, 'customerCouponEdit'),
(6194, 1, 2, 'customerCouponDelete'),
(6195, 1, 2, 'customerCouponView'),
(6196, 1, 2, 'return_items_report'),
(6197, 1, 2, 'help_link'),
(6198, 2, 31, 'sales_add'),
(6199, 2, 31, 'sales_edit'),
(6200, 2, 31, 'sales_delete'),
(6201, 2, 31, 'sales_view'),
(6202, 2, 31, 'sales_payment_view'),
(6203, 2, 31, 'sales_payment_add'),
(6204, 2, 31, 'sales_payment_delete'),
(6205, 2, 31, 'sales_return_add'),
(6206, 2, 31, 'sales_return_edit'),
(6207, 2, 31, 'sales_return_delete'),
(6208, 2, 31, 'sales_return_view'),
(6209, 2, 31, 'sales_return_payment_view'),
(6210, 2, 31, 'sales_return_payment_add'),
(6211, 2, 31, 'sales_return_payment_delete'),
(6212, 2, 31, 'show_all_users_sales_invoices'),
(6213, 2, 31, 'show_all_users_sales_return_invoices'),
(6214, 2, 31, 'show_purchase_price'),
(6215, 2, 2, 'recent_sales_invoice_list'),
(6216, 1, 2, 'stock_transfer_report'),
(6217, 1, 2, 'pos'),
(6218, 1, 2, 'sales_summary_report'),
(6219, 1, 2, 'sales_return_payments'),
(6220, 2, 32, 'tax_add'),
(6221, 2, 32, 'tax_edit'),
(6222, 2, 32, 'tax_delete'),
(6223, 2, 32, 'tax_view'),
(6224, 2, 32, 'store_edit'),
(6225, 2, 32, 'units_add'),
(6226, 2, 32, 'units_edit'),
(6227, 2, 32, 'units_delete'),
(6228, 2, 32, 'units_view'),
(6229, 2, 32, 'items_add'),
(6230, 2, 32, 'items_edit'),
(6231, 2, 32, 'items_delete'),
(6232, 2, 32, 'items_view'),
(6233, 2, 32, 'brand_add'),
(6234, 2, 32, 'brand_edit'),
(6235, 2, 32, 'brand_delete'),
(6236, 2, 32, 'brand_view'),
(6237, 2, 32, 'suppliers_add'),
(6238, 2, 32, 'suppliers_edit'),
(6239, 2, 32, 'suppliers_delete'),
(6240, 2, 32, 'suppliers_view'),
(6241, 2, 32, 'customers_add'),
(6242, 2, 32, 'customers_edit'),
(6243, 2, 32, 'customers_delete'),
(6244, 2, 32, 'customers_view'),
(6245, 2, 32, 'purchase_add'),
(6246, 2, 32, 'purchase_edit'),
(6247, 2, 32, 'purchase_delete'),
(6248, 2, 32, 'purchase_view'),
(6249, 2, 32, 'sales_add'),
(6250, 2, 32, 'sales_edit'),
(6251, 2, 32, 'sales_delete'),
(6252, 2, 32, 'sales_view'),
(6253, 2, 32, 'sales_payment_view'),
(6254, 2, 32, 'sales_payment_add'),
(6255, 2, 32, 'sales_payment_delete'),
(6256, 2, 32, 'sales_report'),
(6257, 2, 32, 'purchase_report'),
(6258, 2, 32, 'expense_report'),
(6259, 2, 32, 'profit_report'),
(6260, 2, 32, 'stock_report'),
(6261, 2, 32, 'item_sales_report'),
(6262, 2, 32, 'purchase_payments_report'),
(6263, 2, 32, 'sales_payments_report'),
(6264, 2, 32, 'items_category_add'),
(6265, 2, 32, 'items_category_edit'),
(6266, 2, 32, 'items_category_delete'),
(6267, 2, 32, 'items_category_view'),
(6268, 2, 32, 'print_labels'),
(6269, 2, 32, 'dashboard_view'),
(6270, 2, 32, 'dashboard_info_box_1'),
(6271, 2, 32, 'dashboard_info_box_2'),
(6272, 2, 32, 'dashboard_pur_sal_chart'),
(6273, 2, 32, 'dashboard_recent_items'),
(6274, 2, 32, 'dashboard_stock_alert'),
(6275, 2, 32, 'dashboard_trending_items_chart'),
(6276, 2, 32, 'purchase_return_add'),
(6277, 2, 32, 'purchase_return_edit'),
(6278, 2, 32, 'purchase_return_delete'),
(6279, 2, 32, 'purchase_return_view'),
(6280, 2, 32, 'purchase_return_report'),
(6281, 2, 32, 'sales_return_add'),
(6282, 2, 32, 'sales_return_edit'),
(6283, 2, 32, 'sales_return_delete'),
(6284, 2, 32, 'sales_return_view'),
(6285, 2, 32, 'sales_return_report'),
(6286, 2, 32, 'sales_return_payment_view'),
(6287, 2, 32, 'sales_return_payment_add'),
(6288, 2, 32, 'sales_return_payment_delete'),
(6289, 2, 32, 'purchase_return_payment_view'),
(6290, 2, 32, 'purchase_return_payment_add'),
(6291, 2, 32, 'purchase_return_payment_delete'),
(6292, 2, 32, 'purchase_payment_view'),
(6293, 2, 32, 'purchase_payment_add'),
(6294, 2, 32, 'purchase_payment_delete'),
(6295, 2, 32, 'payment_types_add'),
(6296, 2, 32, 'payment_types_edit'),
(6297, 2, 32, 'payment_types_delete'),
(6298, 2, 32, 'payment_types_view'),
(6299, 2, 32, 'supplier_items_report'),
(6300, 2, 32, 'seller_points_report'),
(6301, 2, 32, 'services_add'),
(6302, 2, 32, 'services_edit'),
(6303, 2, 32, 'services_delete'),
(6304, 2, 32, 'services_view'),
(6305, 2, 32, 'quotation_add'),
(6306, 2, 32, 'quotation_edit'),
(6307, 2, 32, 'quotation_delete'),
(6308, 2, 32, 'quotation_view'),
(6309, 2, 32, 'variant_add'),
(6310, 2, 32, 'variant_edit'),
(6311, 2, 32, 'variant_delete'),
(6312, 2, 32, 'variant_view'),
(6313, 2, 32, 'sales_tax_report'),
(6314, 2, 32, 'purchase_tax_report'),
(6315, 2, 32, 'show_all_users_sales_invoices'),
(6316, 2, 32, 'show_all_users_sales_return_invoices'),
(6317, 2, 32, 'show_all_users_purchase_invoices'),
(6318, 2, 32, 'show_all_users_purchase_return_invoices'),
(6319, 2, 32, 'show_all_users_quotations'),
(6320, 2, 32, 'cust_adv_payments_add'),
(6321, 2, 32, 'cust_adv_payments_edit'),
(6322, 2, 32, 'cust_adv_payments_delete'),
(6323, 2, 32, 'cust_adv_payments_view'),
(6324, 2, 32, 'gstr_1_report'),
(6325, 2, 32, 'gstr_2_report'),
(6326, 2, 32, 'customer_orders_report'),
(6327, 2, 32, 'load_sheet_report'),
(6328, 2, 32, 'delivery_sheet_report'),
(6329, 2, 32, 'show_purchase_price'),
(6330, 2, 32, 'sales_gst_report'),
(6331, 2, 32, 'purchase_gst_report'),
(6332, 2, 32, 'return_items_report'),
(6333, 2, 32, 'recent_sales_invoice_list'),
(6334, 2, 32, 'stock_transfer_report'),
(6335, 2, 32, 'pos'),
(6336, 2, 32, 'sales_summary_report'),
(6337, 2, 32, 'sales_return_payments');

-- --------------------------------------------------------

--
-- Table structure for table `db_purchase`
--

CREATE TABLE `db_purchase` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Purchase Code',
  `purchase_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,4) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,4) DEFAULT NULL,
  `purchase_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Purchase return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchase`
--

INSERT INTO `db_purchase` (`id`, `store_id`, `warehouse_id`, `count_id`, `purchase_code`, `reference_no`, `purchase_date`, `purchase_status`, `supplier_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `purchase_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`, `return_bit`) VALUES
(1, 2, 87, 1, 'PU0001', '', '2024-01-03', 'Received', 1, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 4250.0000, NULL, 4250.0000, '', 'Paid', 4250.0000, '2024-01-03', '01:04:12 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, 1, NULL),
(2, 2, 87, 2, 'PU0002', 'ASS\\23-24\\1099', '2024-02-21', 'Received', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 31000.0000, NULL, 31000.0000, '', 'Unpaid', 0.0000, '2024-02-24', '02:09:06 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitems`
--

CREATE TABLE `db_purchaseitems` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `purchase_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `profit_margin_per` double(20,4) DEFAULT NULL,
  `unit_sales_price` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchaseitems`
--

INSERT INTO `db_purchaseitems` (`id`, `store_id`, `purchase_id`, `purchase_status`, `item_id`, `purchase_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `profit_margin_per`, `unit_sales_price`, `status`, `description`) VALUES
(213, 2, 1, 'Received', 1, 5.00, 850.0000, 'Inclusive', 153, 648.0000, 'Percentage', 0.0000, 0.0000, 850.0000, 4250.0000, NULL, NULL, 1, ''),
(222, 2, 2, 'Received', 204, 1.00, 14500.0000, 'Inclusive', 153, 2212.0000, 'Percentage', 0.0000, 0.0000, 14500.0000, 14500.0000, NULL, NULL, 1, ''),
(223, 2, 2, 'Received', 208, 1.00, 16500.0000, 'Inclusive', 153, 2517.0000, 'Percentage', 0.0000, 0.0000, 16500.0000, 16500.0000, NULL, NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitemsreturn`
--

CREATE TABLE `db_purchaseitemsreturn` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `profit_margin_per` double(20,4) DEFAULT NULL,
  `unit_sales_price` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepayments`
--

CREATE TABLE `db_purchasepayments` (
  `id` int(5) NOT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchasepayments`
--

INSERT INTO `db_purchasepayments` (`id`, `count_id`, `payment_code`, `store_id`, `purchase_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`, `account_id`, `supplier_id`, `short_code`) VALUES
(113, 1, 'PP0001', 2, 1, '2024-01-03', 'CASH', 4250.0000, '', '::1', 'DESKTOP-8BGMAA4', '01:04:12', '2024-01-03', 'ADMINSIVA', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepaymentsreturn`
--

CREATE TABLE `db_purchasepaymentsreturn` (
  `id` int(5) NOT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasereturn`
--

CREATE TABLE `db_purchasereturn` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Purchase Return Code',
  `warehouse_id` int(5) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,4) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,4) DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_quotation`
--

CREATE TABLE `db_quotation` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create quotation Code',
  `quotation_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `quotation_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL,
  `round_off` double(20,4) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `quotation_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'quotation return raised',
  `customer_previous_due` double(20,4) DEFAULT NULL,
  `customer_total_due` double(20,4) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_quotationitems`
--

CREATE TABLE `db_quotationitems` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quotation_id` int(5) DEFAULT NULL,
  `quotation_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `seller_points` double(20,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_roles`
--

CREATE TABLE `db_roles` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_roles`
--

INSERT INTO `db_roles` (`id`, `store_id`, `role_name`, `description`, `status`) VALUES
(1, 1, 'Admin', 'All Rights Permitted.', 1),
(2, 1, 'Store Admin', 'Note: Apply this role for New Store Admin. ', 1),
(31, 2, 'Cashier', '', 1),
(32, 2, 'USER', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sales`
--

CREATE TABLE `db_sales` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `init_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_id` decimal(20,0) DEFAULT NULL COMMENT 'Use to create Sales Code',
  `sales_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised',
  `customer_previous_due` double(20,2) DEFAULT NULL,
  `customer_total_due` double(20,2) DEFAULT NULL,
  `quotation_id` int(5) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL,
  `coupon_amt` double(20,2) DEFAULT 0.00,
  `invoice_terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sales`
--

INSERT INTO `db_sales` (`id`, `store_id`, `warehouse_id`, `init_code`, `count_id`, `sales_code`, `reference_no`, `sales_date`, `due_date`, `sales_status`, `customer_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `sales_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `pos`, `status`, `return_bit`, `customer_previous_due`, `customer_total_due`, `quotation_id`, `coupon_id`, `coupon_amt`, `invoice_terms`) VALUES
(1, 2, 87, 'SDAIN', '1', 'SDAIN1', '', '2024-01-03', NULL, 'Final', 3, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 9450.00, NULL, 9450.0000, '', 'Paid', 9450.0000, '2024-01-26', '04:10:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(2, 2, 87, 'SDAIN', '2', 'SDAIN2', '', '2024-01-27', NULL, 'Final', 3, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 3330.00, NULL, 3330.0000, '', '', 12780.0000, '2024-02-06', '11:54:23 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(3, 2, 87, 'SDAIN', '3', 'SDAIN3', '', '2024-01-04', NULL, 'Final', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 1800.00, NULL, 1800.0000, '', 'Paid', 1800.0000, '2024-02-06', '12:12:38 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(4, 2, 87, 'SDAIN', '4', 'SDAIN4', '', '2024-01-11', NULL, 'Final', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 120.00, NULL, 120.0000, '', 'Paid', 120.0000, '2024-02-06', '12:14:20 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(5, 2, 87, 'SDAIN', '5', 'SDAIN5', '', '2024-02-24', NULL, 'Final', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 15000.00, NULL, 15000.0000, '', 'Paid', 15000.0000, '2024-02-24', '01:53:58 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(6, 2, 87, 'SDAIN', '6', 'SDAIN6', '', '2024-02-10', NULL, 'Final', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 15000.00, NULL, 15000.0000, '', 'Paid', 15000.0000, '2024-02-24', '05:26:52 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(7, 2, 87, 'SDAIN', '7', 'SDAIN7', '', '2024-02-26', NULL, 'Final', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 12000.00, NULL, 12000.0000, '', 'Paid', 12000.0000, '2024-02-26', '11:27:52 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'),
(8, 2, 87, 'SDAIN', '8', 'SDAIN8', '', '2024-02-28', NULL, 'Final', 2, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 6000.00, NULL, 6000.0000, '', 'Paid', 6000.0000, '2024-02-28', '04:41:32 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0.00, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.');

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitems`
--

CREATE TABLE `db_salesitems` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `seller_points` double(20,2) DEFAULT 0.00,
  `purchase_price` double(20,3) DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salesitems`
--

INSERT INTO `db_salesitems` (`id`, `store_id`, `sales_id`, `sales_status`, `item_id`, `description`, `sales_qty`, `price_per_unit`, `tax_type`, `tax_id`, `tax_amt`, `discount_type`, `discount_input`, `discount_amt`, `unit_total_cost`, `total_cost`, `status`, `seller_points`, `purchase_price`) VALUES
(700, 2, 1, 'Final', 5, '', 1.00, 3150.0000, 'Inclusive', 153, 481.0000, 'Percentage', NULL, 0.0000, 3150.0000, 3150.0000, 1, 0.00, 3500.000),
(701, 2, 1, 'Final', 93, '', 1.00, 6300.0000, 'Inclusive', 153, 961.0000, 'Percentage', NULL, 0.0000, 6300.0000, 6300.0000, 1, 0.00, 7000.000),
(705, 2, 2, 'Final', 45, '', 1.00, 3330.0000, 'Inclusive', 153, 508.0000, 'Percentage', NULL, 0.0000, 3330.0000, 3330.0000, 1, 0.00, 3700.000),
(706, 2, 3, 'Final', 55, '', 1.00, 1800.0000, 'Inclusive', 153, 275.0000, 'Percentage', NULL, 0.0000, 1800.0000, 1800.0000, 1, 0.00, 2000.000),
(707, 2, 4, 'Final', 86, '', 1.00, 120.0000, 'Inclusive', 153, 18.0000, 'Percentage', NULL, 0.0000, 120.0000, 120.0000, 1, 0.00, 120.000),
(708, 2, 5, 'Final', 162, '', 1.00, 15000.0000, 'Inclusive', 153, 2288.0000, 'Percentage', NULL, 0.0000, 15000.0000, 15000.0000, 1, 0.00, 25000.000),
(710, 2, 6, 'Final', 162, '', 1.00, 15000.0000, 'Inclusive', 151, 1239.0000, 'Percentage', NULL, 0.0000, 15000.0000, 15000.0000, 1, 0.00, 25000.000),
(711, 2, 7, 'Final', 209, '', 1.00, 12000.0000, 'Inclusive', 153, 1831.0000, 'Percentage', NULL, 0.0000, 12000.0000, 12000.0000, 1, 0.00, 14500.000),
(712, 2, 8, 'Final', 209, '', 1.00, 6000.0000, 'Inclusive', 151, 495.0000, 'Percentage', NULL, 0.0000, 6000.0000, 6000.0000, 1, 0.00, 14500.000);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitemsreturn`
--

CREATE TABLE `db_salesitemsreturn` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double(20,3) DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salespayments`
--

CREATE TABLE `db_salespayments` (
  `id` int(5) NOT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return` double(20,4) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_adjusted` double(20,4) DEFAULT NULL,
  `cheque_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_period` int(10) DEFAULT NULL,
  `cheque_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salespayments`
--

INSERT INTO `db_salespayments` (`id`, `count_id`, `payment_code`, `store_id`, `sales_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `change_return`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`, `account_id`, `customer_id`, `short_code`, `advance_adjusted`, `cheque_number`, `cheque_period`, `cheque_status`) VALUES
(386, 1, 'SP0001', 2, 1, '2024-01-03', 'CASH', 9450.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '04:10:05 pm', '2024-01-26', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending'),
(387, 2, 'SP0002', 2, 2, '2024-02-06', 'CASH', 12780.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '11:54:23 am', '2024-02-06', 'ADMINSIVA', 1, NULL, 3, NULL, 0.0000, '', 0, 'Pending'),
(388, 3, 'SP0003', 2, 3, '2024-01-04', 'CASH', 1800.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '12:12:38 pm', '2024-02-06', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending'),
(389, 4, 'SP0004', 2, 4, '2024-01-11', 'CASH', 120.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '12:14:20 pm', '2024-02-06', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending'),
(390, 5, 'SP0005', 2, 5, '2024-02-24', 'CASH', 15000.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '01:53:58 pm', '2024-02-24', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending'),
(391, 6, 'SP0006', 2, 6, '2024-02-24', 'CASH', 15000.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '05:26:52 pm', '2024-02-24', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending'),
(392, 7, 'SP0007', 2, 7, '2024-02-26', 'CASH', 12000.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '11:27:52 am', '2024-02-26', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending'),
(393, 8, 'SP0008', 2, 8, '2024-02-28', 'CASH', 6000.0000, '', NULL, '::1', 'DESKTOP-8BGMAA4', '04:41:32 pm', '2024-02-28', 'ADMINSIVA', 1, NULL, 2, NULL, 0.0000, '', 0, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `db_salespaymentsreturn`
--

CREATE TABLE `db_salespaymentsreturn` (
  `id` int(5) NOT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return` double(20,4) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salesreturn`
--

CREATE TABLE `db_salesreturn` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Sales Return Code',
  `sales_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL,
  `round_off` double(20,4) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Return raised or not 1 or null',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_amt` double(20,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_shippingaddress`
--

CREATE TABLE `db_shippingaddress` (
  `id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL,
  `state_id` int(10) DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `postcode` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `address` text CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `location_link` text CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_shippingaddress`
--

INSERT INTO `db_shippingaddress` (`id`, `store_id`, `country_id`, `state_id`, `city`, `postcode`, `address`, `status`, `customer_id`, `location_link`) VALUES
(1, 1, 1, NULL, NULL, '', '', 1, 1, NULL),
(2, 2, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL),
(20, 2, 79, 46, 'Nagercoil', '629201', '18/456a karavilai', 1, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `db_sitesettings`
--

CREATE TABLE `db_sitesettings` (
  `id` int(5) NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'path',
  `machine_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sitesettings`
--

INSERT INTO `db_sitesettings` (`id`, `version`, `site_name`, `logo`, `machine_id`, `domain`, `unique_code`) VALUES
(1, '3.0', 'S.D.A POWER TOOLS', '/uploads/site/WhatsApp_Image_2024-01-02_at_11__(1).jpg', '1', 'pointofsale.ozonepos.com', '4kcd2s8v9axrpm6gy1foh7tlqij5nw');

-- --------------------------------------------------------

--
-- Table structure for table `db_smsapi`
--

CREATE TABLE `db_smsapi` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `info` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_value` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smsapi`
--

INSERT INTO `db_smsapi` (`id`, `store_id`, `info`, `key`, `key_value`, `delete_bit`) VALUES
(26, 2, 'url', 'weblink', 'http://example.com/sendmessage', NULL),
(27, 2, 'mobile', 'mobiles', '', NULL),
(28, 2, 'message', 'message', '', NULL),
(29, 1, 'url', 'weblink', 'https://www.example.com/api/mt/SendSMS?', NULL),
(30, 1, 'mobile', 'mobiles', '', NULL),
(31, 1, 'message', 'message', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_smstemplates`
--

CREATE TABLE `db_smstemplates` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smstemplates`
--

INSERT INTO `db_smstemplates` (`id`, `store_id`, `template_name`, `content`, `variables`, `status`, `undelete_bit`) VALUES
(1, 1, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{sales_id}}<br>\r\n{{sales_date}}<br>\r\n{{sales_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{store_name}}<br>\r\n{{store_mobile}}<br>\r\n{{store_address}}<br>\r\n{{store_website}}<br>\r\n{{store_email}}<br>\r\n', 1, 1),
(2, 1, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{return_id}}<br>\r\n{{return_date}}<br>\r\n{{return_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', 1, 1),
(12, 2, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}                          \r\n{{sales_id}}\r\n{{sales_date}}\r\n{{sales_amount}}\r\n{{paid_amt}}\r\n{{due_amt}}\r\n{{store_name}}\r\n{{store_mobile}}\r\n{{store_address}}\r\n{{store_website}}\r\n{{store_email}}\r\n', 1, 1),
(13, 2, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}                          \r\n{{return_id}}\r\n{{return_date}}\r\n{{return_amount}}\r\n{{paid_amt}}\r\n{{due_amt}}\r\n{{company_name}}\r\n{{company_mobile}}\r\n{{company_address}}\r\n{{company_website}}\r\n{{company_email}}\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sobpayments`
--

CREATE TABLE `db_sobpayments` (
  `id` int(5) NOT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_states`
--

CREATE TABLE `db_states` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `state_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_states`
--

INSERT INTO `db_states` (`id`, `store_id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES
(23, 1, 'ST0001', 'Karnataka', 'CNT0001', NULL, 'India', '2017-07-10', 1, 1),
(24, 1, 'ST0024', 'Maharashtra', 'CNT0001', NULL, 'India', '2018-04-13', 1, 1),
(25, 2, 'ST0025', 'Andhra Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(26, 1, 'ST0026', 'Arunachal Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(27, 1, 'ST0027', 'Assam', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(28, 1, 'ST0028', 'Bihar', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(29, 1, 'ST0029', 'Chhattisgarh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(30, 1, 'ST0030', 'Goa', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(31, 1, 'ST0031', 'Gujarat', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(32, 1, 'ST0032', 'Haryana', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(33, 1, 'ST0033', 'Himachal Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(34, 1, 'ST0034', 'Jammu and Kashmir', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(35, 1, 'ST0035', 'Jharkhand', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(36, 1, 'ST0036', 'Kerala', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(37, 1, 'ST0037', 'Madhya Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(38, 1, 'ST0038', 'Manipur', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(39, 1, 'ST0039', 'Meghalaya', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(40, 1, 'ST0040', 'Mizoram', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(41, 1, 'ST0041', 'Nagaland', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(42, 1, 'ST0042', 'Odisha', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(43, 1, 'ST0043', 'Punjab', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(44, 1, 'ST0044', 'Rajasthan', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(45, 1, 'ST0045', 'Sikkim', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(46, 1, 'ST0046', 'Tamil Nadu', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(47, 1, 'ST0047', 'Telangana', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(48, 1, 'ST0048', 'Tripura', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(49, 1, 'ST0049', 'Uttar Pradesh', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(50, 1, 'ST0050', 'Uttarakhand', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(51, 1, 'ST0051', 'West Bengal', 'CNT0001', NULL, 'India', '2018-11-02', NULL, 1),
(52, 1, NULL, 'New York', NULL, NULL, 'USA', NULL, NULL, 1),
(53, 1, NULL, 'Delhi', NULL, NULL, 'India', NULL, NULL, 1),
(63, 2, NULL, 'Karnataka', NULL, 79, 'India', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_stockadjustment`
--

CREATE TABLE `db_stockadjustment` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_date` date DEFAULT NULL,
  `adjustment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_stockadjustment`
--

INSERT INTO `db_stockadjustment` (`id`, `store_id`, `warehouse_id`, `reference_no`, `adjustment_date`, `adjustment_note`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`) VALUES
(18, 2, 2, NULL, '2022-08-09', NULL, '2022-08-09', '12:00:19 pm', 'Chris', '37.28.46.147', 'dynamic.isp.ooredoo.om', 1),
(19, 2, 2, NULL, '2022-08-09', NULL, '2022-08-09', '01:38:51 pm', 'Chris', '37.28.46.147', 'dynamic.isp.ooredoo.om', 1),
(20, 2, 2, NULL, '2022-08-10', NULL, '2022-08-10', '09:23:28 am', 'Chris', '5.21.237.233', '5.21.237.233', 1),
(21, 2, 2, NULL, '2023-06-01', NULL, '2023-06-01', '08:22:53 pm', 'Chris', '103.163.248.214', '103.163.248.214', 1),
(22, 2, 2, NULL, '2023-06-02', NULL, '2023-06-02', '06:20:10 am', 'RS POWER', '103.163.248.214', '103.163.248.214', 1),
(23, 2, 2, NULL, '2023-06-02', NULL, '2023-06-02', '06:23:47 am', 'RS POWER', '103.163.248.214', '103.163.248.214', 1),
(24, 2, 2, NULL, '2023-06-02', NULL, '2023-06-02', '10:41:14 am', 'RS POWER', '120.138.12.202', 'ws202-12.138.120.rcil.gov.in', 1),
(25, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:07:55 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(26, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:10:35 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(27, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:10:47 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(28, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:10:59 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(29, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:11:13 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(30, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:11:30 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(31, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:11:41 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(32, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:13:00 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(33, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:13:11 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(34, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:13:26 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(35, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:13:48 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(36, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:14:07 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(37, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:14:38 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(38, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:15:26 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(39, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:15:41 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(40, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:15:58 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(41, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:16:26 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(42, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:16:57 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(43, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:17:12 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(44, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:17:34 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(45, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:18:01 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(46, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:18:17 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(47, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:18:33 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(48, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:18:49 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(49, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:19:03 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(50, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:19:19 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(51, 2, 2, '', '2023-06-03', '', '2023-06-03', '10:19:35 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(52, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:19:49 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(53, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:20:04 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(54, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:20:22 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(55, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:20:43 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(56, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:20:58 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(57, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:21:14 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(58, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:21:30 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(59, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:21:46 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(60, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:22:02 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(61, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:22:16 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(62, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:22:34 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(63, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:22:49 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(64, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:23:06 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(65, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:43:13 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(66, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:44:57 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(67, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:45:11 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(68, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:45:27 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(69, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:45:44 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(70, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:45:57 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(71, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:46:14 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(72, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:46:39 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(73, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:46:55 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(74, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:47:13 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(75, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:47:34 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(76, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:48:02 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(77, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:48:17 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(78, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:48:42 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(79, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:48:57 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(80, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:49:12 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(81, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:49:28 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(82, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:49:42 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(83, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:50:00 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(84, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:50:16 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(85, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:50:36 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(86, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:50:53 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(87, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:51:08 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(88, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:51:23 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(89, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:51:37 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(90, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:52:04 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(91, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:52:24 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(92, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:52:40 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(93, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:52:59 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(94, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:53:24 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(95, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:53:46 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(96, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:54:32 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(97, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:56:31 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(98, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:56:50 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(99, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:57:08 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(100, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:57:30 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(101, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:58:24 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(102, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:59:04 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(103, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '10:59:37 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(104, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:02:24 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(105, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:03:07 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(106, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:03:40 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(107, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:04:16 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(108, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:04:41 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(109, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:05:07 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(110, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:05:32 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(111, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:06:11 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(112, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:06:32 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(113, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:07:25 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(114, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:07:43 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(115, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:09:41 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(116, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:10:01 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(117, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:10:34 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(118, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:10:53 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(119, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:14:22 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(120, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:16:15 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(121, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:23:06 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(122, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:26:01 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(123, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:33:22 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(124, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:35:14 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(125, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:37:08 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(126, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:38:25 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(127, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:40:29 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(128, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:43:24 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(129, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:44:53 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(130, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:46:41 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(131, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:48:18 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(132, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:49:23 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(133, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:50:44 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(134, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:51:57 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(135, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:53:56 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(136, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '11:55:20 am', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(137, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:47:38 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(138, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:50:02 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(139, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:52:00 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(140, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:54:11 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(141, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:55:49 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(142, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:57:50 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(143, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '12:59:11 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(144, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:01:26 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(145, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:02:52 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(146, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:05:44 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(147, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:08:40 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(148, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:09:57 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(149, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:11:05 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(150, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:12:38 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(151, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:14:29 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(152, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:17:02 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(153, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:19:03 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(154, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:20:27 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(155, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:21:51 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(156, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:25:10 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(157, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:26:17 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(158, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:27:37 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(159, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:28:24 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(160, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:29:48 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(161, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:30:48 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(162, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:32:10 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(163, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:33:26 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(164, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:35:08 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(165, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:37:10 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(166, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:38:10 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(167, 2, 2, '', '2023-06-03', '', '2023-06-03', '01:39:22 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(168, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:40:31 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(169, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:42:03 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(170, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:43:42 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(171, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:44:57 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(172, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:46:31 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(173, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:47:52 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(174, 2, 2, NULL, '2023-06-03', NULL, '2023-06-03', '01:48:48 pm', 'RS POWER', '120.138.12.181', 'ws181-12.138.120.rcil.gov.in', 1),
(175, 2, 2, NULL, '2023-06-09', NULL, '2023-06-09', '03:33:40 pm', 'RS POWER', '120.138.12.221', 'ws221-12.138.120.rcil.gov.in', 1),
(176, 2, 2, '', '2023-06-13', '', '2023-06-13', '12:35:53 pm', 'RS POWER', '120.138.12.128', 'ws128-12.138.120.rcil.gov.in', 1),
(177, 2, 2, NULL, '2023-06-13', NULL, '2023-06-13', '01:48:49 pm', 'RS POWER', '103.28.246.50', 'ws50-246.28.103.rcil.gov.in', 1),
(178, 2, 2, NULL, '2023-06-17', NULL, '2023-06-17', '08:04:11 pm', 'RS POWER', '103.246.195.227', 'ws227-195.246.103.rcil.gov.in', 1),
(179, 2, 2, NULL, '2023-06-17', NULL, '2023-06-17', '08:07:14 pm', 'RS POWER', '103.246.195.227', 'ws227-195.246.103.rcil.gov.in', 1),
(180, 2, 2, NULL, '2023-06-17', NULL, '2023-06-17', '08:09:51 pm', 'RS POWER', '103.246.195.227', 'ws227-195.246.103.rcil.gov.in', 1),
(181, 2, 2, NULL, '2023-06-17', NULL, '2023-06-17', '08:16:40 pm', 'RS POWER', '103.246.195.227', 'ws227-195.246.103.rcil.gov.in', 1),
(182, 2, 87, NULL, '2024-01-03', NULL, '2024-01-03', '12:39:43 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(183, 2, 87, NULL, '2024-01-08', NULL, '2024-01-08', '11:04:24 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(184, 2, 87, NULL, '2024-01-08', NULL, '2024-01-08', '11:19:20 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(185, 2, 87, NULL, '2024-01-08', NULL, '2024-01-08', '11:25:18 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(186, 2, 87, NULL, '2024-01-08', NULL, '2024-01-08', '11:38:32 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(187, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '03:48:27 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(188, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '03:52:44 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(189, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '03:55:32 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(190, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '03:59:13 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(191, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '04:03:06 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(192, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '04:07:38 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(193, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '04:14:46 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(194, 2, 87, NULL, '2024-01-09', NULL, '2024-01-09', '04:35:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(195, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:06:08 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(196, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:10:44 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(197, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:16:56 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(198, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:34:46 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(199, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:37:24 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(200, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:40:16 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(201, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:41:55 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(202, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:43:54 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(203, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:47:08 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(204, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:49:25 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(205, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:53:44 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(206, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '11:56:33 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(207, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:01:27 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(208, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:03:37 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(209, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:05:39 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(210, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:06:46 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(211, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:08:24 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(212, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:10:37 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(213, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:12:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(214, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:33:14 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(215, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:39:39 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(216, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:44:59 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(217, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:50:58 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(218, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '12:54:36 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(219, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '01:04:09 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(220, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '01:07:31 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(221, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '01:14:30 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(222, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '02:45:20 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(223, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '02:48:45 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(224, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '02:51:29 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(225, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '02:53:52 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(226, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '03:31:50 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(227, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '03:48:44 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(228, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '03:52:19 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(229, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:06:58 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(230, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:10:39 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(231, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:19:37 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(232, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:24:02 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(233, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:28:47 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(234, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:32:50 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(235, 2, 87, NULL, '2024-01-10', NULL, '2024-01-10', '04:38:00 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(236, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '09:27:12 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(237, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '09:31:06 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(238, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '10:35:48 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(239, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '10:38:07 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(240, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '10:41:34 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(241, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '10:44:39 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(242, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '10:47:35 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(243, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '10:57:52 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(244, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:00:25 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(245, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:03:24 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(246, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:06:44 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(247, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:11:29 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(248, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:15:26 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(249, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:17:19 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(250, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:20:58 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(251, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:27:56 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(252, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:31:59 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(253, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:33:45 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(254, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:38:21 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(255, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:40:03 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(256, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:43:14 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(257, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:46:53 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(258, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:56:15 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(259, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '11:59:48 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(260, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:04:38 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(261, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:08:26 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(262, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:11:31 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(263, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:14:29 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(264, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:17:28 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(265, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:20:00 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(266, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:22:26 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(267, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:23:47 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(268, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:25:09 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(269, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:26:11 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(270, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:27:24 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(271, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:30:01 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(272, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:31:58 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(273, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:33:55 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(274, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '12:35:42 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(275, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '01:00:40 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(276, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '01:01:36 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(277, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '01:04:31 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(278, 2, 87, NULL, '2024-01-13', NULL, '2024-01-13', '01:06:10 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(279, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '01:53:49 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(280, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '01:55:39 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(281, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '01:56:55 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(282, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '01:59:37 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(283, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:01:18 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(284, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:05:00 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(285, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:07:06 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(286, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:08:48 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(287, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:10:16 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(288, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:11:44 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(289, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:13:15 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(290, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:17:09 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(291, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:19:33 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(292, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:21:39 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(293, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:22:37 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(294, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:24:55 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(295, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:26:33 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(296, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:28:23 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(297, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:29:49 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(298, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:31:40 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(299, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:33:11 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(300, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:35:45 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(301, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:41:00 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(302, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:44:22 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(303, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:51:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(304, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:53:52 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(305, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '02:58:43 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(306, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:02:25 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(307, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:03:50 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(308, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:06:01 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(309, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:07:33 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(310, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:09:37 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(311, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:10:38 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(312, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:11:31 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(313, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:12:50 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(314, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:13:42 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(315, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:14:28 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(316, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:15:23 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(317, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:16:19 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(318, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:17:14 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(319, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:18:17 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(320, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:19:28 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(321, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:20:52 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(322, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:27:51 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(323, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:29:10 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(324, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:30:28 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(325, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:31:41 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(326, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:32:54 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(327, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:34:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(328, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:34:58 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(329, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:36:06 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(330, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:37:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(331, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:38:31 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(332, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:40:23 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(333, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:41:44 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(334, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:44:43 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(335, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:45:56 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(336, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:47:42 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(337, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:48:33 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(338, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:52:26 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(339, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:54:59 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(340, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:57:29 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(341, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '03:58:30 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(342, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:01:09 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(343, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:03:59 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(344, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:04:59 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(345, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:06:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(346, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:07:31 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(347, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:10:33 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(348, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:12:42 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(349, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:13:38 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(350, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:16:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(351, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:18:42 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(352, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:20:05 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(353, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:22:29 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(354, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:23:36 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(355, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:25:14 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(356, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '04:26:23 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(357, 2, 87, NULL, '2024-01-20', NULL, '2024-01-20', '05:30:45 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(358, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:41:22 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(359, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:46:13 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(360, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:48:16 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(361, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:54:31 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(362, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:56:07 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(363, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:58:13 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(364, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '10:59:36 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(365, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:01:54 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(366, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:05:41 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(367, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:29:44 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(368, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:32:09 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(369, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:35:06 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(370, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:40:00 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(371, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:44:16 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(372, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:45:53 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(373, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:47:49 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(374, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '11:48:56 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(375, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:01:00 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(376, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:04:42 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(377, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:08:16 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(378, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:09:41 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(379, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:11:08 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(380, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:12:41 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(381, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:13:48 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(382, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:14:56 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(383, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:17:40 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(384, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:22:07 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(385, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:23:59 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(386, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:25:45 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(387, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:42:56 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(388, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:51:23 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(389, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:53:28 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(390, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:56:13 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(391, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '12:58:10 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(392, 2, 87, NULL, '2024-02-08', NULL, '2024-02-08', '01:00:33 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(393, 2, 87, NULL, '2024-02-26', NULL, '2024-02-26', '11:25:22 am', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1),
(394, 2, 87, NULL, '2024-02-28', NULL, '2024-02-28', '04:40:10 pm', 'ADMINSIVA', '::1', 'DESKTOP-8BGMAA4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_stockadjustmentitems`
--

CREATE TABLE `db_stockadjustmentitems` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `adjustment_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `adjustment_qty` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_stockadjustmentitems`
--

INSERT INTO `db_stockadjustmentitems` (`id`, `store_id`, `warehouse_id`, `adjustment_id`, `item_id`, `adjustment_qty`, `status`, `description`) VALUES
(530, 2, 87, 182, 1, 5.00, 1, NULL),
(531, 2, 87, 183, 2, 5.00, 1, NULL),
(532, 2, 87, 184, 3, 5.00, 1, NULL),
(533, 2, 87, 185, 4, 5.00, 1, NULL),
(534, 2, 87, 186, 5, 2.00, 1, NULL),
(535, 2, 87, 187, 6, 50.00, 1, NULL),
(536, 2, 87, 188, 7, 30.00, 1, NULL),
(537, 2, 87, 189, 8, 50.00, 1, NULL),
(538, 2, 87, 190, 9, 5.00, 1, NULL),
(539, 2, 87, 191, 10, 5.00, 1, NULL),
(540, 2, 87, 192, 11, 3.00, 1, NULL),
(541, 2, 87, 193, 10, 2.00, 1, NULL),
(542, 2, 87, 194, 11, 3.00, 1, NULL),
(543, 2, 87, 195, 12, 5.00, 1, NULL),
(544, 2, 87, 196, 13, 100.00, 1, NULL),
(545, 2, 87, 197, 14, 100.00, 1, NULL),
(546, 2, 87, 198, 15, 100.00, 1, NULL),
(547, 2, 87, 199, 16, 100.00, 1, NULL),
(550, 2, 87, 202, 17, 50.00, 1, NULL),
(551, 2, 87, 203, 18, 50.00, 1, NULL),
(552, 2, 87, 204, 19, 50.00, 1, NULL),
(553, 2, 87, 205, 20, 50.00, 1, NULL),
(554, 2, 87, 206, 21, 50.00, 1, NULL),
(555, 2, 87, 207, 22, 100.00, 1, NULL),
(556, 2, 87, 208, 23, 100.00, 1, NULL),
(557, 2, 87, 209, 24, 100.00, 1, NULL),
(558, 2, 87, 210, 25, 100.00, 1, NULL),
(559, 2, 87, 211, 26, 100.00, 1, NULL),
(560, 2, 87, 212, 27, 100.00, 1, NULL),
(561, 2, 87, 213, 28, 100.00, 1, NULL),
(562, 2, 87, 214, 29, 100.00, 1, NULL),
(563, 2, 87, 215, 30, 500.00, 1, NULL),
(564, 2, 87, 216, 31, 5.00, 1, NULL),
(565, 2, 87, 217, 32, 5.00, 1, NULL),
(566, 2, 87, 218, 33, 5.00, 1, NULL),
(567, 2, 87, 219, 34, 5.00, 1, NULL),
(568, 2, 87, 220, 35, 5.00, 1, NULL),
(569, 2, 87, 221, 36, 5.00, 1, NULL),
(570, 2, 87, 222, 37, 5.00, 1, NULL),
(571, 2, 87, 223, 38, 5.00, 1, NULL),
(572, 2, 87, 224, 39, 5.00, 1, NULL),
(573, 2, 87, 225, 40, 5.00, 1, NULL),
(574, 2, 87, 226, 41, 5.00, 1, NULL),
(575, 2, 87, 227, 42, 1.00, 1, NULL),
(576, 2, 87, 228, 43, 2.00, 1, NULL),
(577, 2, 87, 229, 44, 2.00, 1, NULL),
(578, 2, 87, 230, 45, 5.00, 1, NULL),
(579, 2, 87, 231, 46, 2.00, 1, NULL),
(580, 2, 87, 232, 47, 2.00, 1, NULL),
(581, 2, 87, 233, 48, 2.00, 1, NULL),
(582, 2, 87, 234, 49, 100.00, 1, NULL),
(583, 2, 87, 235, 50, 50.00, 1, NULL),
(584, 2, 87, 236, 51, 5.00, 1, NULL),
(585, 2, 87, 237, 52, 5.00, 1, NULL),
(586, 2, 87, 238, 53, 5.00, 1, NULL),
(587, 2, 87, 239, 54, 5.00, 1, NULL),
(588, 2, 87, 240, 55, 5.00, 1, NULL),
(589, 2, 87, 241, 56, 50.00, 1, NULL),
(590, 2, 87, 242, 57, 25.00, 1, NULL),
(591, 2, 87, 243, 58, 1.00, 1, NULL),
(592, 2, 87, 244, 59, 2.00, 1, NULL),
(593, 2, 87, 245, 60, 1.00, 1, NULL),
(594, 2, 87, 246, 61, 1.00, 1, NULL),
(595, 2, 87, 247, 62, 1.00, 1, NULL),
(596, 2, 87, 248, 63, 1.00, 1, NULL),
(597, 2, 87, 249, 64, 1.00, 1, NULL),
(598, 2, 87, 250, 65, 20.00, 1, NULL),
(599, 2, 87, 251, 66, 5.00, 1, NULL),
(600, 2, 87, 252, 67, 5.00, 1, NULL),
(601, 2, 87, 253, 68, 5.00, 1, NULL),
(602, 2, 87, 254, 69, 10.00, 1, NULL),
(603, 2, 87, 255, 70, 10.00, 1, NULL),
(604, 2, 87, 256, 71, 2.00, 1, NULL),
(605, 2, 87, 257, 72, 2.00, 1, NULL),
(606, 2, 87, 258, 73, 2.00, 1, NULL),
(607, 2, 87, 259, 74, 5.00, 1, NULL),
(608, 2, 87, 260, 75, 10.00, 1, NULL),
(609, 2, 87, 261, 76, 5.00, 1, NULL),
(610, 2, 87, 262, 77, 20.00, 1, NULL),
(611, 2, 87, 263, 78, 20.00, 1, NULL),
(612, 2, 87, 264, 79, 20.00, 1, NULL),
(613, 2, 87, 265, 80, 10.00, 1, NULL),
(614, 2, 87, 266, 81, 10.00, 1, NULL),
(615, 2, 87, 267, 82, 10.00, 1, NULL),
(616, 2, 87, 268, 83, 10.00, 1, NULL),
(617, 2, 87, 269, 84, 10.00, 1, NULL),
(618, 2, 87, 270, 85, 10.00, 1, NULL),
(619, 2, 87, 271, 86, 40.00, 1, NULL),
(620, 2, 87, 272, 87, 5.00, 1, NULL),
(621, 2, 87, 273, 88, 5.00, 1, NULL),
(622, 2, 87, 274, 89, 5.00, 1, NULL),
(623, 2, 87, 275, 90, 1.00, 1, NULL),
(624, 2, 87, 276, 91, 1.00, 1, NULL),
(625, 2, 87, 277, 92, 1.00, 1, NULL),
(626, 2, 87, 278, 93, 2.00, 1, NULL),
(627, 2, 87, 279, 94, 100.00, 1, NULL),
(628, 2, 87, 280, 95, 100.00, 1, NULL),
(629, 2, 87, 281, 96, 10.00, 1, NULL),
(630, 2, 87, 282, 97, 25.00, 1, NULL),
(631, 2, 87, 283, 98, 25.00, 1, NULL),
(632, 2, 87, 284, 99, 50.00, 1, NULL),
(633, 2, 87, 285, 100, 50.00, 1, NULL),
(634, 2, 87, 286, 101, 50.00, 1, NULL),
(635, 2, 87, 287, 102, 50.00, 1, NULL),
(636, 2, 87, 288, 103, 50.00, 1, NULL),
(637, 2, 87, 289, 104, 50.00, 1, NULL),
(638, 2, 87, 290, 105, 20.00, 1, NULL),
(639, 2, 87, 291, 106, 20.00, 1, NULL),
(640, 2, 87, 292, 107, 20.00, 1, NULL),
(641, 2, 87, 293, 108, 20.00, 1, NULL),
(642, 2, 87, 294, 109, 3.00, 1, NULL),
(643, 2, 87, 295, 110, 3.00, 1, NULL),
(644, 2, 87, 296, 111, 3.00, 1, NULL),
(645, 2, 87, 297, 112, 3.00, 1, NULL),
(646, 2, 87, 298, 113, 50.00, 1, NULL),
(647, 2, 87, 299, 114, 50.00, 1, NULL),
(648, 2, 87, 300, 115, 2.00, 1, NULL),
(649, 2, 87, 301, 116, 20.00, 1, NULL),
(650, 2, 87, 302, 117, 20.00, 1, NULL),
(651, 2, 87, 303, 118, 10.00, 1, NULL),
(652, 2, 87, 304, 119, 10.00, 1, NULL),
(653, 2, 87, 305, 120, 5.00, 1, NULL),
(654, 2, 87, 306, 121, 10.00, 1, NULL),
(655, 2, 87, 307, 122, 10.00, 1, NULL),
(656, 2, 87, 308, 123, 10.00, 1, NULL),
(657, 2, 87, 309, 124, 10.00, 1, NULL),
(658, 2, 87, 310, 125, 10.00, 1, NULL),
(659, 2, 87, 311, 126, 10.00, 1, NULL),
(660, 2, 87, 312, 127, 10.00, 1, NULL),
(661, 2, 87, 313, 128, 10.00, 1, NULL),
(662, 2, 87, 314, 129, 10.00, 1, NULL),
(663, 2, 87, 315, 130, 10.00, 1, NULL),
(664, 2, 87, 316, 131, 10.00, 1, NULL),
(665, 2, 87, 317, 132, 10.00, 1, NULL),
(666, 2, 87, 318, 133, 10.00, 1, NULL),
(667, 2, 87, 319, 134, 10.00, 1, NULL),
(668, 2, 87, 320, 135, 10.00, 1, NULL),
(669, 2, 87, 321, 136, 10.00, 1, NULL),
(670, 2, 87, 322, 137, 10.00, 1, NULL),
(671, 2, 87, 323, 138, 10.00, 1, NULL),
(672, 2, 87, 324, 139, 10.00, 1, NULL),
(673, 2, 87, 325, 140, 10.00, 1, NULL),
(674, 2, 87, 326, 141, 10.00, 1, NULL),
(675, 2, 87, 327, 142, 10.00, 1, NULL),
(676, 2, 87, 328, 143, 10.00, 1, NULL),
(677, 2, 87, 329, 144, 10.00, 1, NULL),
(678, 2, 87, 330, 145, 10.00, 1, NULL),
(679, 2, 87, 331, 146, 10.00, 1, NULL),
(680, 2, 87, 332, 147, 10.00, 1, NULL),
(681, 2, 87, 333, 148, 10.00, 1, NULL),
(682, 2, 87, 334, 149, 10.00, 1, NULL),
(683, 2, 87, 335, 150, 10.00, 1, NULL),
(684, 2, 87, 336, 151, 12.00, 1, NULL),
(685, 2, 87, 337, 152, 12.00, 1, NULL),
(686, 2, 87, 338, 153, 100.00, 1, NULL),
(687, 2, 87, 339, 154, 3.00, 1, NULL),
(688, 2, 87, 340, 155, 1.00, 1, NULL),
(689, 2, 87, 341, 156, 1.00, 1, NULL),
(690, 2, 87, 342, 157, 21.00, 1, NULL),
(691, 2, 87, 343, 158, 5.00, 1, NULL),
(692, 2, 87, 344, 159, 5.00, 1, NULL),
(693, 2, 87, 345, 160, 5.00, 1, NULL),
(694, 2, 87, 346, 161, 10.00, 1, NULL),
(695, 2, 87, 347, 162, 1.00, 1, NULL),
(696, 2, 87, 348, 163, 5.00, 1, NULL),
(697, 2, 87, 349, 164, 5.00, 1, NULL),
(698, 2, 87, 350, 165, 10.00, 1, NULL),
(699, 2, 87, 351, 166, 10.00, 1, NULL),
(700, 2, 87, 352, 167, 10.00, 1, NULL),
(701, 2, 87, 353, 168, 5.00, 1, NULL),
(702, 2, 87, 354, 169, 50.00, 1, NULL),
(703, 2, 87, 355, 170, 2.00, 1, NULL),
(704, 2, 87, 356, 171, 1.00, 1, NULL),
(705, 2, 87, 357, 172, 400.00, 1, NULL),
(706, 2, 87, 358, 162, 1.00, 1, NULL),
(707, 2, 87, 359, 173, 1.00, 1, NULL),
(708, 2, 87, 360, 174, 1.00, 1, NULL),
(709, 2, 87, 361, 176, 100.00, 1, NULL),
(710, 2, 87, 362, 177, 200.00, 1, NULL),
(711, 2, 87, 363, 178, 1.00, 1, NULL),
(712, 2, 87, 364, 179, 1.00, 1, NULL),
(713, 2, 87, 365, 180, 1.00, 1, NULL),
(714, 2, 87, 366, 181, 5.00, 1, NULL),
(715, 2, 87, 367, 182, 10.00, 1, NULL),
(716, 2, 87, 368, 183, 10.00, 1, NULL),
(717, 2, 87, 369, 184, 25.00, 1, NULL),
(718, 2, 87, 370, 185, 6.00, 1, NULL),
(719, 2, 87, 371, 186, 1430.00, 1, NULL),
(720, 2, 87, 372, 187, 3.00, 1, NULL),
(721, 2, 87, 373, 188, 5.00, 1, NULL),
(722, 2, 87, 374, 189, 5.00, 1, NULL),
(723, 2, 87, 375, 190, 2.00, 1, NULL),
(724, 2, 87, 376, 191, 20.00, 1, NULL),
(725, 2, 87, 377, 192, 2.00, 1, NULL),
(726, 2, 87, 378, 193, 2.00, 1, NULL),
(727, 2, 87, 379, 194, 2.00, 1, NULL),
(728, 2, 87, 380, 195, 100.00, 1, NULL),
(729, 2, 87, 381, 196, 200.00, 1, NULL),
(730, 2, 87, 382, 197, 100.00, 1, NULL),
(731, 2, 87, 383, 198, 9.00, 1, NULL),
(732, 2, 87, 384, 199, 10.00, 1, NULL),
(733, 2, 87, 385, 200, 10.00, 1, NULL),
(734, 2, 87, 386, 201, 20.00, 1, NULL),
(735, 2, 87, 387, 202, 10.00, 1, NULL),
(736, 2, 87, 388, 203, 100.00, 1, NULL),
(737, 2, 87, 389, 204, 1.00, 1, NULL),
(738, 2, 87, 390, 205, 1.00, 1, NULL),
(739, 2, 87, 391, 206, 2.00, 1, NULL),
(740, 2, 87, 392, 207, 2.00, 1, NULL),
(741, 2, 87, 393, 209, 1.00, 1, NULL),
(742, 2, 87, 394, 209, 2.00, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_stockentry`
--

CREATE TABLE `db_stockentry` (
  `id` int(5) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_stocktransfer`
--

CREATE TABLE `db_stocktransfer` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL COMMENT 'from store',
  `to_store_id` int(11) DEFAULT NULL COMMENT 'to store transfer',
  `warehouse_from` int(5) DEFAULT NULL,
  `warehouse_to` int(5) DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `note` text CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_stocktransferitems`
--

CREATE TABLE `db_stocktransferitems` (
  `id` int(5) NOT NULL,
  `stocktransfer_id` int(5) DEFAULT NULL,
  `store_id` int(5) DEFAULT NULL COMMENT 'from store',
  `to_store_id` int(5) DEFAULT NULL COMMENT 'to store',
  `warehouse_from` int(5) DEFAULT NULL COMMENT 'warehouse ids',
  `warehouse_to` int(11) DEFAULT NULL COMMENT 'warehouse ids',
  `item_id` int(11) DEFAULT NULL,
  `transfer_qty` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_store`
--

CREATE TABLE `db_store` (
  `id` int(5) NOT NULL,
  `store_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cid` int(50) DEFAULT NULL,
  `category_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journal_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cust_advance_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `status` int(1) DEFAULT NULL,
  `language_id` int(5) DEFAULT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `currency_placement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` int(5) DEFAULT NULL,
  `sales_discount` double(20,4) DEFAULT NULL,
  `currencysymbol_id` int(5) DEFAULT NULL,
  `regno_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fav_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return` int(2) DEFAULT NULL,
  `sales_invoice_format_id` int(5) DEFAULT NULL,
  `pos_invoice_format_id` int(5) DEFAULT NULL,
  `sales_invoice_footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimals` int(1) DEFAULT 2,
  `money_transfer_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_return_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_return_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_subscriptionlist_id` int(10) DEFAULT 0,
  `smtp_host` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_status` int(1) DEFAULT 0,
  `sms_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `mrp_column` int(1) DEFAULT 0,
  `invoice_terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_balance_bit` int(1) DEFAULT 1 COMMENT '1=Show, 0=Hide - Shows on sales invoice',
  `qty_decimals` int(5) DEFAULT 2,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_signature` int(1) DEFAULT 0,
  `t_and_c_status` int(1) DEFAULT 1 COMMENT '1=Show, 0=Hide - Shows on sales invoice',
  `t_and_c_status_pos` int(1) DEFAULT 1,
  `number_to_words` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'Default',
  `default_account_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_store`
--

INSERT INTO `db_store` (`id`, `store_code`, `store_name`, `store_website`, `mobile`, `phone`, `email`, `website`, `store_logo`, `logo`, `upi_id`, `upi_code`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `accounts_init`, `journal_init`, `cust_advance_init`, `invoice_view`, `sms_status`, `status`, `language_id`, `currency_id`, `currency_placement`, `timezone`, `date_format`, `time_format`, `sales_discount`, `currencysymbol_id`, `regno_key`, `fav_icon`, `purchase_code`, `change_return`, `sales_invoice_format_id`, `pos_invoice_format_id`, `sales_invoice_footer_text`, `round_off`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `quotation_init`, `decimals`, `money_transfer_init`, `sales_payment_init`, `sales_return_payment_init`, `purchase_payment_init`, `purchase_return_payment_init`, `expense_payment_init`, `current_subscriptionlist_id`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_status`, `sms_url`, `user_id`, `mrp_column`, `invoice_terms`, `previous_balance_bit`, `qty_decimals`, `signature`, `show_signature`, `t_and_c_status`, `t_and_c_status_pos`, `number_to_words`, `default_account_id`) VALUES
(1, 'ST0001', 'SAAS ADMIN', '', '+919999999999', '', 'admin@example.com', 'www', 'uploads/store/company_logo.png', NULL, NULL, NULL, 'India', 'Karnataka', 'Bengalore', 'Gandhi Road', '', '', '', '', '', NULL, 'CT/01/', 'IT01', 'SU/01/', 'PU/2020/01', 'PR/2020/01/', 'CU/01/', 'SL/2020/01/', 'SR/2020/01/', 'EX/2020/01/', 'AC/01/', 'JE', 'ADV', 1, 0, 1, 1, 35, 'Left', 'Asia/Kolkata\r\n', 'dd-mm-yyyy', 12, 0.0000, NULL, NULL, NULL, NULL, 1, 3, 1, 'Its Footer, You can change it from Store Settings.', 0, NULL, NULL, NULL, NULL, NULL, 'QT/2020/01/', 2, 'MT/01/', 'SP/2020/01/', 'SRP/2020/01/', 'PP/2020/01/', 'PRP/2020/01/', 'XP/2020/01/', 26, 'ssl://smtp.gmail.com', '465', 'salmanpathanindia@gmail.com', '9632563672', 1, 'http://sms.proware.in/api/sendhttp.php?authkey=248050Asbku6K75bf27efc&amp;mobiles={{MOBILE}}&amp;message={{MESSAGE}}&amp;sender=WBMGIC&amp;route=4', 0, 0, NULL, 1, 2, NULL, 0, 1, 1, 'Default', NULL),
(2, 'ST0002', 'S.D.A POWER TOOLS', '', '9626646255', '9585916253', 'sivak8214@gmail.com', NULL, 'uploads/store/WhatsApp_Image_2024-01-02_at_11_1.jpg', NULL, NULL, NULL, 'India', 'Tamil Nadu', 'NAGERCOIL, KANYAKUMARI DIST', 'Opp LIFE LINE HOSPITAL, VILLUKURI', '629002', '33DRFPK2093N1ZH', '', '', 'S.D.A POWER TOOLS\r\nNAME: SIVA KUMAR\r\nA/C NO: 26580100000XXXX\r\nIFSC CODE: IOBA0002658\r\nGPAY NUMBER : 934453 XXXX ', NULL, 'CT', 'IT02', 'SU', 'PU', 'PR', 'CU', 'SDAIN', 'SR', 'EX', 'AC', NULL, 'ADV', 1, 2, 1, 1, 35, 'Left', 'Asia/Calcutta\r\n', 'dd-mm-yyyy', 12, 0.0000, NULL, NULL, NULL, NULL, 0, 4, 1, 'This is a Computer Generated Invoice', 1, '2021-02-12', '05:53:37 pm', '', '127.0.0.1', 'LAPTOP-I5OUIM4R', 'RSQT', 0, 'MT', 'SP', 'SRP', 'PP', 'PRP', 'XP', 28, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.', 0, 0, 'uploads/signature/sda1.png', 1, 1, 1, 'Indian', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_stripe`
--

CREATE TABLE `db_stripe` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `publishable_key` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `api_secret` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_stripepayments`
--

CREATE TABLE `db_stripepayments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `buyer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `buyer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount_currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_subscription`
--

CREATE TABLE `db_subscription` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `payment_id` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_id` int(5) DEFAULT NULL,
  `package_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `subscription_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trial_days` int(10) DEFAULT NULL,
  `max_users` int(10) DEFAULT NULL,
  `max_warehouses` int(10) DEFAULT NULL,
  `max_items` int(10) DEFAULT NULL,
  `max_invoices` int(10) DEFAULT NULL,
  `payment_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `txn_id` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_gross` double(10,2) DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payer_email` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_status` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_status` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'manual subscription only',
  `package_count` int(10) DEFAULT NULL COMMENT 'manual subscription only'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_subscription`
--

INSERT INTO `db_subscription` (`id`, `store_id`, `payment_id`, `package_id`, `package_type`, `package_name`, `description`, `subscription_date`, `expire_date`, `trial_days`, `max_users`, `max_warehouses`, `max_items`, `max_invoices`, `payment_by`, `txn_id`, `payment_gross`, `currency_code`, `payer_email`, `payment_status`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `package_status`, `payment_type`, `package_count`) VALUES
(13, 22, NULL, 2, NULL, 'Regular', 'Test description', '2021-01-25', NULL, 15, 20, 20, 200, 200, 'PayPal', '48R18927X78299709', 250.00, 'USD', 'sb-9fy504805522@business.example.com', 'Pending', '2021-01-25', '01:30:45 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL),
(14, 22, NULL, 2, 'Paid', 'Regular', 'Test description', '2021-01-25', NULL, 15, 20, 20, 200, 200, 'PayPal', '9M838440FH9266015', 250.00, 'USD', 'sb-9fy504805522@business.example.com', 'Pending', '2021-01-25', '01:32:28 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL),
(16, 22, NULL, 2, 'Paid', 'Regular', 'Test description', '2021-01-25', '2021-02-25', 15, 20, 20, 200, 200, 'PayPal', '2PT61144W90213341', 250.00, 'USD', 'sb-9fy504805522@business.example.com', 'Pending', '2021-01-25', '02:00:38 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL),
(26, 1, NULL, 1, 'Free', 'Free', 'Test description', '2021-01-25', '2021-02-04', 10, 2, 2, 20, 20, 'Self', '', 0.00, '', '', '', '2021-01-25', '06:32:32 pm', 'admin', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL),
(27, 24, NULL, 1, 'Free', 'Free', 'Test description', '2021-02-11', '2021-02-21', 10, 2, 2, 20, 20, 'Self', '', 0.00, '', '', '', '2021-02-11', '03:09:47 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL),
(28, 2, NULL, 1, 'Free', 'Free', 'Test description', '2021-02-12', '2021-02-22', 10, 2, 2, 20, 20, 'Self', '', 0.00, '', '', '', '2021-02-12', '06:57:18 pm', 'Tester', '127.0.0.1', 'LAPTOP-I5OUIM4R', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_suppliers`
--

CREATE TABLE `db_suppliers` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create supplier Code',
  `supplier_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,4) DEFAULT NULL,
  `purchase_due` double(20,4) DEFAULT NULL,
  `purchase_return_due` double(20,4) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `state_id` int(5) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_suppliers`
--

INSERT INTO `db_suppliers` (`id`, `store_id`, `count_id`, `supplier_code`, `supplier_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `purchase_due`, `purchase_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 2, 1, 'SU0001', 'SDA BUILDING WORKS', '96266646255', '', '', '', '', NULL, 100000000.0000, 0.0000, NULL, 79, 46, 'NAGERCOIL', '629001', '1-39,KOTTANKACHI VILAI,MUTHALAKURICHY,THIRUVITHANCODE POST,KANYAKUMARI', '::1', 'DESKTOP-8BGMAA4', '2024-01-03', '12:22:49 pm', 'ADMINSIVA', NULL, 1),
(2, 2, 2, 'SU0002', 'ALLYS  SPAEES', '', '', '', '', '', NULL, 0.0000, 31000.0000, NULL, 0, 0, '', '', '', '::1', 'DESKTOP-8BGMAA4', '2024-02-24', '02:08:10 pm', 'ADMINSIVA', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_supplier_payments`
--

CREATE TABLE `db_supplier_payments` (
  `id` int(5) NOT NULL,
  `purchasepayment_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_tax`
--

CREATE TABLE `db_tax` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `tax_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double(20,4) DEFAULT NULL,
  `group_bit` int(1) DEFAULT NULL COMMENT '1=Yes, 0=No',
  `subtax_ids` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tax groups IDs',
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_tax`
--

INSERT INTO `db_tax` (`id`, `store_id`, `tax_name`, `tax`, `group_bit`, `subtax_ids`, `status`) VALUES
(149, 2, 'VAT', 5.0000, NULL, NULL, 1),
(151, 2, 'CGST 9%', 9.0000, NULL, NULL, 1),
(152, 2, 'SGST 14 %', 14.0000, NULL, NULL, 1),
(153, 2, 'GST 18%', 18.0000, 1, '151,155', 1),
(154, 2, 'CGST 14 %', 14.0000, NULL, NULL, 1),
(155, 2, 'SGST 9 %', 9.0000, NULL, NULL, 1),
(156, 2, 'CGST 6%', 6.0000, NULL, NULL, 1),
(157, 2, 'SGST 6 %', 6.0000, NULL, NULL, 1),
(158, 2, 'GST 28%', 28.0000, 1, '152,154', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_timezone`
--

CREATE TABLE `db_timezone` (
  `id` int(5) NOT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_timezone`
--

INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES
(1, 'Africa/Abidjan\r', 1),
(2, 'Africa/Accra\r', 1),
(3, 'Africa/Addis_Ababa\r', 1),
(4, 'Africa/Algiers\r', 1),
(5, 'Africa/Asmara\r', 1),
(6, 'Africa/Asmera\r', 1),
(7, 'Africa/Bamako\r', 1),
(8, 'Africa/Bangui\r', 1),
(9, 'Africa/Banjul\r', 1),
(10, 'Africa/Bissau\r', 1),
(11, 'Africa/Blantyre\r', 1),
(12, 'Africa/Brazzaville\r', 1),
(13, 'Africa/Bujumbura\r', 1),
(14, 'Africa/Cairo\r', 1),
(15, 'Africa/Casablanca\r', 1),
(16, 'Africa/Ceuta\r', 1),
(17, 'Africa/Conakry\r', 1),
(18, 'Africa/Dakar\r', 1),
(19, 'Africa/Dar_es_Salaam\r', 1),
(20, 'Africa/Djibouti\r', 1),
(21, 'Africa/Douala\r', 1),
(22, 'Africa/El_Aaiun\r', 1),
(23, 'Africa/Freetown\r', 1),
(24, 'Africa/Gaborone\r', 1),
(25, 'Africa/Harare\r', 1),
(26, 'Africa/Johannesburg\r', 1),
(27, 'Africa/Juba\r', 1),
(28, 'Africa/Kampala\r', 1),
(29, 'Africa/Khartoum\r', 1),
(30, 'Africa/Kigali\r', 1),
(31, 'Africa/Kinshasa\r', 1),
(32, 'Africa/Lagos\r', 1),
(33, 'Africa/Libreville\r', 1),
(34, 'Africa/Lome\r', 1),
(35, 'Africa/Luanda\r', 1),
(36, 'Africa/Lubumbashi\r', 1),
(37, 'Africa/Lusaka\r', 1),
(38, 'Africa/Malabo\r', 1),
(39, 'Africa/Maputo\r', 1),
(40, 'Africa/Maseru\r', 1),
(41, 'Africa/Mbabane\r', 1),
(42, 'Africa/Mogadishu\r', 1),
(43, 'Africa/Monrovia\r', 1),
(44, 'Africa/Nairobi\r', 1),
(45, 'Africa/Ndjamena\r', 1),
(46, 'Africa/Niamey\r', 1),
(47, 'Africa/Nouakchott\r', 1),
(48, 'Africa/Ouagadougou\r', 1),
(49, 'Africa/Porto-Novo\r', 1),
(50, 'Africa/Sao_Tome\r', 1),
(51, 'Africa/Timbuktu\r', 1),
(52, 'Africa/Tripoli\r', 1),
(53, 'Africa/Tunis\r', 1),
(54, 'Africa/Windhoek\r', 1),
(55, 'AKST9AKDT\r', 1),
(56, 'America/Adak\r', 1),
(57, 'America/Anchorage\r', 1),
(58, 'America/Anguilla\r', 1),
(59, 'America/Antigua\r', 1),
(60, 'America/Araguaina\r', 1),
(61, 'America/Argentina/Buenos_Aires\r', 1),
(62, 'America/Argentina/Catamarca\r', 1),
(63, 'America/Argentina/ComodRivadavia\r', 1),
(64, 'America/Argentina/Cordoba\r', 1),
(65, 'America/Argentina/Jujuy\r', 1),
(66, 'America/Argentina/La_Rioja\r', 1),
(67, 'America/Argentina/Mendoza\r', 1),
(68, 'America/Argentina/Rio_Gallegos\r', 1),
(69, 'America/Argentina/Salta\r', 1),
(70, 'America/Argentina/San_Juan\r', 1),
(71, 'America/Argentina/San_Luis\r', 1),
(72, 'America/Argentina/Tucuman\r', 1),
(73, 'America/Argentina/Ushuaia\r', 1),
(74, 'America/Aruba\r', 1),
(75, 'America/Asuncion\r', 1),
(76, 'America/Atikokan\r', 1),
(77, 'America/Atka\r', 1),
(78, 'America/Bahia\r', 1),
(79, 'America/Bahia_Banderas\r', 1),
(80, 'America/Barbados\r', 1),
(81, 'America/Belem\r', 1),
(82, 'America/Belize\r', 1),
(83, 'America/Blanc-Sablon\r', 1),
(84, 'America/Boa_Vista\r', 1),
(85, 'America/Bogota\r', 1),
(86, 'America/Boise\r', 1),
(87, 'America/Buenos_Aires\r', 1),
(88, 'America/Cambridge_Bay\r', 1),
(89, 'America/Campo_Grande\r', 1),
(90, 'America/Cancun\r', 1),
(91, 'America/Caracas\r', 1),
(92, 'America/Catamarca\r', 1),
(93, 'America/Cayenne\r', 1),
(94, 'America/Cayman\r', 1),
(95, 'America/Chicago\r', 1),
(96, 'America/Chihuahua\r', 1),
(97, 'America/Coral_Harbour\r', 1),
(98, 'America/Cordoba\r', 1),
(99, 'America/Costa_Rica\r', 1),
(100, 'America/Creston\r', 1),
(101, 'America/Cuiaba\r', 1),
(102, 'America/Curacao\r', 1),
(103, 'America/Danmarkshavn\r', 1),
(104, 'America/Dawson\r', 1),
(105, 'America/Dawson_Creek\r', 1),
(106, 'America/Denver\r', 1),
(107, 'America/Detroit\r', 1),
(108, 'America/Dominica\r', 1),
(109, 'America/Edmonton\r', 1),
(110, 'America/Eirunepe\r', 1),
(111, 'America/El_Salvador\r', 1),
(112, 'America/Ensenada\r', 1),
(113, 'America/Fort_Wayne\r', 1),
(114, 'America/Fortaleza\r', 1),
(115, 'America/Glace_Bay\r', 1),
(116, 'America/Godthab\r', 1),
(117, 'America/Goose_Bay\r', 1),
(118, 'America/Grand_Turk\r', 1),
(119, 'America/Grenada\r', 1),
(120, 'America/Guadeloupe\r', 1),
(121, 'America/Guatemala\r', 1),
(122, 'America/Guayaquil\r', 1),
(123, 'America/Guyana\r', 1),
(124, 'America/Halifax\r', 1),
(125, 'America/Havana\r', 1),
(126, 'America/Hermosillo\r', 1),
(127, 'America/Indiana/Indianapolis\r', 1),
(128, 'America/Indiana/Knox\r', 1),
(129, 'America/Indiana/Marengo\r', 1),
(130, 'America/Indiana/Petersburg\r', 1),
(131, 'America/Indiana/Tell_City\r', 1),
(132, 'America/Indiana/Vevay\r', 1),
(133, 'America/Indiana/Vincennes\r', 1),
(134, 'America/Indiana/Winamac\r', 1),
(135, 'America/Indianapolis\r', 1),
(136, 'America/Inuvik\r', 1),
(137, 'America/Iqaluit\r', 1),
(138, 'America/Jamaica\r', 1),
(139, 'America/Jujuy\r', 1),
(140, 'America/Juneau\r', 1),
(141, 'America/Kentucky/Louisville\r', 1),
(142, 'America/Kentucky/Monticello\r', 1),
(143, 'America/Knox_IN\r', 1),
(144, 'America/Kralendijk\r', 1),
(145, 'America/La_Paz\r', 1),
(146, 'America/Lima\r', 1),
(147, 'America/Los_Angeles\r', 1),
(148, 'America/Louisville\r', 1),
(149, 'America/Lower_Princes\r', 1),
(150, 'America/Maceio\r', 1),
(151, 'America/Managua\r', 1),
(152, 'America/Manaus\r', 1),
(153, 'America/Marigot\r', 1),
(154, 'America/Martinique\r', 1),
(155, 'America/Matamoros\r', 1),
(156, 'America/Mazatlan\r', 1),
(157, 'America/Mendoza\r', 1),
(158, 'America/Menominee\r', 1),
(159, 'America/Merida\r', 1),
(160, 'America/Metlakatla\r', 1),
(161, 'America/Mexico_City\r', 1),
(162, 'America/Miquelon\r', 1),
(163, 'America/Moncton\r', 1),
(164, 'America/Monterrey\r', 1),
(165, 'America/Montevideo\r', 1),
(166, 'America/Montreal\r', 1),
(167, 'America/Montserrat\r', 1),
(168, 'America/Nassau\r', 1),
(169, 'America/New_York\r', 1),
(170, 'America/Nipigon\r', 1),
(171, 'America/Nome\r', 1),
(172, 'America/Noronha\r', 1),
(173, 'America/North_Dakota/Beulah\r', 1),
(174, 'America/North_Dakota/Center\r', 1),
(175, 'America/North_Dakota/New_Salem\r', 1),
(176, 'America/Ojinaga\r', 1),
(177, 'America/Panama\r', 1),
(178, 'America/Pangnirtung\r', 1),
(179, 'America/Paramaribo\r', 1),
(180, 'America/Phoenix\r', 1),
(181, 'America/Port_of_Spain\r', 1),
(182, 'America/Port-au-Prince\r', 1),
(183, 'America/Porto_Acre\r', 1),
(184, 'America/Porto_Velho\r', 1),
(185, 'America/Puerto_Rico\r', 1),
(186, 'America/Rainy_River\r', 1),
(187, 'America/Rankin_Inlet\r', 1),
(188, 'America/Recife\r', 1),
(189, 'America/Regina\r', 1),
(190, 'America/Resolute\r', 1),
(191, 'America/Rio_Branco\r', 1),
(192, 'America/Rosario\r', 1),
(193, 'America/Santa_Isabel\r', 1),
(194, 'America/Santarem\r', 1),
(195, 'America/Santiago\r', 1),
(196, 'America/Santo_Domingo\r', 1),
(197, 'America/Sao_Paulo\r', 1),
(198, 'America/Scoresbysund\r', 1),
(199, 'America/Shiprock\r', 1),
(200, 'America/Sitka\r', 1),
(201, 'America/St_Barthelemy\r', 1),
(202, 'America/St_Johns\r', 1),
(203, 'America/St_Kitts\r', 1),
(204, 'America/St_Lucia\r', 1),
(205, 'America/St_Thomas\r', 1),
(206, 'America/St_Vincent\r', 1),
(207, 'America/Swift_Current\r', 1),
(208, 'America/Tegucigalpa\r', 1),
(209, 'America/Thule\r', 1),
(210, 'America/Thunder_Bay\r', 1),
(211, 'America/Tijuana\r', 1),
(212, 'America/Toronto\r', 1),
(213, 'America/Tortola\r', 1),
(214, 'America/Vancouver\r', 1),
(215, 'America/Virgin\r', 1),
(216, 'America/Whitehorse\r', 1),
(217, 'America/Winnipeg\r', 1),
(218, 'America/Yakutat\r', 1),
(219, 'America/Yellowknife\r', 1),
(220, 'Antarctica/Casey\r', 1),
(221, 'Antarctica/Davis\r', 1),
(222, 'Antarctica/DumontDUrville\r', 1),
(223, 'Antarctica/Macquarie\r', 1),
(224, 'Antarctica/Mawson\r', 1),
(225, 'Antarctica/McMurdo\r', 1),
(226, 'Antarctica/Palmer\r', 1),
(227, 'Antarctica/Rothera\r', 1),
(228, 'Antarctica/South_Pole\r', 1),
(229, 'Antarctica/Syowa\r', 1),
(230, 'Antarctica/Vostok\r', 1),
(231, 'Arctic/Longyearbyen\r', 1),
(232, 'Asia/Aden\r', 1),
(233, 'Asia/Almaty\r', 1),
(234, 'Asia/Amman\r', 1),
(235, 'Asia/Anadyr\r', 1),
(236, 'Asia/Aqtau\r', 1),
(237, 'Asia/Aqtobe\r', 1),
(238, 'Asia/Ashgabat\r', 1),
(239, 'Asia/Ashkhabad\r', 1),
(240, 'Asia/Baghdad\r', 1),
(241, 'Asia/Bahrain\r', 1),
(242, 'Asia/Baku\r', 1),
(243, 'Asia/Bangkok\r', 1),
(244, 'Asia/Beirut\r', 1),
(245, 'Asia/Bishkek\r', 1),
(246, 'Asia/Brunei\r', 1),
(247, 'Asia/Calcutta\r', 1),
(248, 'Asia/Choibalsan\r', 1),
(249, 'Asia/Chongqing\r', 1),
(250, 'Asia/Chungking\r', 1),
(251, 'Asia/Colombo\r', 1),
(252, 'Asia/Dacca\r', 1),
(253, 'Asia/Damascus\r', 1),
(254, 'Asia/Dhaka\r', 1),
(255, 'Asia/Dili\r', 1),
(256, 'Asia/Dubai\r', 1),
(257, 'Asia/Dushanbe\r', 1),
(258, 'Asia/Gaza\r', 1),
(259, 'Asia/Harbin\r', 1),
(260, 'Asia/Hebron\r', 1),
(261, 'Asia/Ho_Chi_Minh\r', 1),
(262, 'Asia/Hong_Kong\r', 1),
(263, 'Asia/Hovd\r', 1),
(264, 'Asia/Irkutsk\r', 1),
(265, 'Asia/Istanbul\r', 1),
(266, 'Asia/Jakarta\r', 1),
(267, 'Asia/Jayapura\r', 1),
(268, 'Asia/Jerusalem\r', 1),
(269, 'Asia/Kabul\r', 1),
(270, 'Asia/Kamchatka\r', 1),
(271, 'Asia/Karachi\r', 1),
(272, 'Asia/Kashgar\r', 1),
(273, 'Asia/Kathmandu\r', 1),
(274, 'Asia/Katmandu\r', 1),
(275, 'Asia/Kolkata\r', 1),
(276, 'Asia/Krasnoyarsk\r', 1),
(277, 'Asia/Kuala_Lumpur\r', 1),
(278, 'Asia/Kuching\r', 1),
(279, 'Asia/Kuwait\r', 1),
(280, 'Asia/Macao\r', 1),
(281, 'Asia/Macau\r', 1),
(282, 'Asia/Magadan\r', 1),
(283, 'Asia/Makassar\r', 1),
(284, 'Asia/Manila\r', 1),
(285, 'Asia/Muscat\r', 1),
(286, 'Asia/Nicosia\r', 1),
(287, 'Asia/Novokuznetsk\r', 1),
(288, 'Asia/Novosibirsk\r', 1),
(289, 'Asia/Omsk\r', 1),
(290, 'Asia/Oral\r', 1),
(291, 'Asia/Phnom_Penh\r', 1),
(292, 'Asia/Pontianak\r', 1),
(293, 'Asia/Pyongyang\r', 1),
(294, 'Asia/Qatar\r', 1),
(295, 'Asia/Qyzylorda\r', 1),
(296, 'Asia/Rangoon\r', 1),
(297, 'Asia/Riyadh\r', 1),
(298, 'Asia/Saigon\r', 1),
(299, 'Asia/Sakhalin\r', 1),
(300, 'Asia/Samarkand\r', 1),
(301, 'Asia/Seoul\r', 1),
(302, 'Asia/Shanghai\r', 1),
(303, 'Asia/Singapore\r', 1),
(304, 'Asia/Taipei\r', 1),
(305, 'Asia/Tashkent\r', 1),
(306, 'Asia/Tbilisi\r', 1),
(307, 'Asia/Tehran\r', 1),
(308, 'Asia/Tel_Aviv\r', 1),
(309, 'Asia/Thimbu\r', 1),
(310, 'Asia/Thimphu\r', 1),
(311, 'Asia/Tokyo\r', 1),
(312, 'Asia/Ujung_Pandang\r', 1),
(313, 'Asia/Ulaanbaatar\r', 1),
(314, 'Asia/Ulan_Bator\r', 1),
(315, 'Asia/Urumqi\r', 1),
(316, 'Asia/Vientiane\r', 1),
(317, 'Asia/Vladivostok\r', 1),
(318, 'Asia/Yakutsk\r', 1),
(319, 'Asia/Yekaterinburg\r', 1),
(320, 'Asia/Yerevan\r', 1),
(321, 'Atlantic/Azores\r', 1),
(322, 'Atlantic/Bermuda\r', 1),
(323, 'Atlantic/Canary\r', 1),
(324, 'Atlantic/Cape_Verde\r', 1),
(325, 'Atlantic/Faeroe\r', 1),
(326, 'Atlantic/Faroe\r', 1),
(327, 'Atlantic/Jan_Mayen\r', 1),
(328, 'Atlantic/Madeira\r', 1),
(329, 'Atlantic/Reykjavik\r', 1),
(330, 'Atlantic/South_Georgia\r', 1),
(331, 'Atlantic/St_Helena\r', 1),
(332, 'Atlantic/Stanley\r', 1),
(333, 'Australia/ACT\r', 1),
(334, 'Australia/Adelaide\r', 1),
(335, 'Australia/Brisbane\r', 1),
(336, 'Australia/Broken_Hill\r', 1),
(337, 'Australia/Canberra\r', 1),
(338, 'Australia/Currie\r', 1),
(339, 'Australia/Darwin\r', 1),
(340, 'Australia/Eucla\r', 1),
(341, 'Australia/Hobart\r', 1),
(342, 'Australia/LHI\r', 1),
(343, 'Australia/Lindeman\r', 1),
(344, 'Australia/Lord_Howe\r', 1),
(345, 'Australia/Melbourne\r', 1),
(346, 'Australia/North\r', 1),
(347, 'Australia/NSW\r', 1),
(348, 'Australia/Perth\r', 1),
(349, 'Australia/Queensland\r', 1),
(350, 'Australia/South\r', 1),
(351, 'Australia/Sydney\r', 1),
(352, 'Australia/Tasmania\r', 1),
(353, 'Australia/Victoria\r', 1),
(354, 'Australia/West\r', 1),
(355, 'Australia/Yancowinna\r', 1),
(356, 'Brazil/Acre\r', 1),
(357, 'Brazil/DeNoronha\r', 1),
(358, 'Brazil/East\r', 1),
(359, 'Brazil/West\r', 1),
(360, 'Canada/Atlantic\r', 1),
(361, 'Canada/Central\r', 1),
(362, 'Canada/Eastern\r', 1),
(363, 'Canada/East-Saskatchewan\r', 1),
(364, 'Canada/Mountain\r', 1),
(365, 'Canada/Newfoundland\r', 1),
(366, 'Canada/Pacific\r', 1),
(367, 'Canada/Saskatchewan\r', 1),
(368, 'Canada/Yukon\r', 1),
(369, 'CET\r', 1),
(370, 'Chile/Continental\r', 1),
(371, 'Chile/EasterIsland\r', 1),
(372, 'CST6CDT\r', 1),
(373, 'Cuba\r', 1),
(374, 'EET\r', 1),
(375, 'Egypt\r', 1),
(376, 'Eire\r', 1),
(377, 'EST\r', 1),
(378, 'EST5EDT\r', 1),
(379, 'Etc./GMT\r', 1),
(380, 'Etc./GMT+0\r', 1),
(381, 'Etc./UCT\r', 1),
(382, 'Etc./Universal\r', 1),
(383, 'Etc./UTC\r', 1),
(384, 'Etc./Zulu\r', 1),
(385, 'Europe/Amsterdam\r', 1),
(386, 'Europe/Andorra\r', 1),
(387, 'Europe/Athens\r', 1),
(388, 'Europe/Belfast\r', 1),
(389, 'Europe/Belgrade\r', 1),
(390, 'Europe/Berlin\r', 1),
(391, 'Europe/Bratislava\r', 1),
(392, 'Europe/Brussels\r', 1),
(393, 'Europe/Bucharest\r', 1),
(394, 'Europe/Budapest\r', 1),
(395, 'Europe/Chisinau\r', 1),
(396, 'Europe/Copenhagen\r', 1),
(397, 'Europe/Dublin\r', 1),
(398, 'Europe/Gibraltar\r', 1),
(399, 'Europe/Guernsey\r', 1),
(400, 'Europe/Helsinki\r', 1),
(401, 'Europe/Isle_of_Man\r', 1),
(402, 'Europe/Istanbul\r', 1),
(403, 'Europe/Jersey\r', 1),
(404, 'Europe/Kaliningrad\r', 1),
(405, 'Europe/Kiev\r', 1),
(406, 'Europe/Lisbon\r', 1),
(407, 'Europe/Ljubljana\r', 1),
(408, 'Europe/London\r', 1),
(409, 'Europe/Luxembourg\r', 1),
(410, 'Europe/Madrid\r', 1),
(411, 'Europe/Malta\r', 1),
(412, 'Europe/Mariehamn\r', 1),
(413, 'Europe/Minsk\r', 1),
(414, 'Europe/Monaco\r', 1),
(415, 'Europe/Moscow\r', 1),
(416, 'Europe/Nicosia\r', 1),
(417, 'Europe/Oslo\r', 1),
(418, 'Europe/Paris\r', 1),
(419, 'Europe/Podgorica\r', 1),
(420, 'Europe/Prague\r', 1),
(421, 'Europe/Riga\r', 1),
(422, 'Europe/Rome\r', 1),
(423, 'Europe/Samara\r', 1),
(424, 'Europe/San_Marino\r', 1),
(425, 'Europe/Sarajevo\r', 1),
(426, 'Europe/Simferopol\r', 1),
(427, 'Europe/Skopje\r', 1),
(428, 'Europe/Sofia\r', 1),
(429, 'Europe/Stockholm\r', 1),
(430, 'Europe/Tallinn\r', 1),
(431, 'Europe/Tirane\r', 1),
(432, 'Europe/Tiraspol\r', 1),
(433, 'Europe/Uzhgorod\r', 1),
(434, 'Europe/Vaduz\r', 1),
(435, 'Europe/Vatican\r', 1),
(436, 'Europe/Vienna\r', 1),
(437, 'Europe/Vilnius\r', 1),
(438, 'Europe/Volgograd\r', 1),
(439, 'Europe/Warsaw\r', 1),
(440, 'Europe/Zagreb\r', 1),
(441, 'Europe/Zaporozhye\r', 1),
(442, 'Europe/Zurich\r', 1),
(443, 'GB\r', 1),
(444, 'GB-Eire\r', 1),
(445, 'GMT\r', 1),
(446, 'GMT+0\r', 1),
(447, 'GMT0\r', 1),
(448, 'GMT-0\r', 1),
(449, 'Greenwich\r', 1),
(450, 'Hong Kong\r', 1),
(451, 'HST\r', 1),
(452, 'Iceland\r', 1),
(453, 'Indian/Antananarivo\r', 1),
(454, 'Indian/Chagos\r', 1),
(455, 'Indian/Christmas\r', 1),
(456, 'Indian/Cocos\r', 1),
(457, 'Indian/Comoro\r', 1),
(458, 'Indian/Kerguelen\r', 1),
(459, 'Indian/Mahe\r', 1),
(460, 'Indian/Maldives\r', 1),
(461, 'Indian/Mauritius\r', 1),
(462, 'Indian/Mayotte\r', 1),
(463, 'Indian/Reunion\r', 1),
(464, 'Iran\r', 1),
(465, 'Israel\r', 1),
(466, 'Jamaica\r', 1),
(467, 'Japan\r', 1),
(468, 'JST-9\r', 1),
(469, 'Kwajalein\r', 1),
(470, 'Libya\r', 1),
(471, 'MET\r', 1),
(472, 'Mexico/BajaNorte\r', 1),
(473, 'Mexico/BajaSur\r', 1),
(474, 'Mexico/General\r', 1),
(475, 'MST\r', 1),
(476, 'MST7MDT\r', 1),
(477, 'Navajo\r', 1),
(478, 'NZ\r', 1),
(479, 'NZ-CHAT\r', 1),
(480, 'Pacific/Apia\r', 1),
(481, 'Pacific/Auckland\r', 1),
(482, 'Pacific/Chatham\r', 1),
(483, 'Pacific/Chuuk\r', 1),
(484, 'Pacific/Easter\r', 1),
(485, 'Pacific/Efate\r', 1),
(486, 'Pacific/Enderbury\r', 1),
(487, 'Pacific/Fakaofo\r', 1),
(488, 'Pacific/Fiji\r', 1),
(489, 'Pacific/Funafuti\r', 1),
(490, 'Pacific/Galapagos\r', 1),
(491, 'Pacific/Gambier\r', 1),
(492, 'Pacific/Guadalcanal\r', 1),
(493, 'Pacific/Guam\r', 1),
(494, 'Pacific/Honolulu\r', 1),
(495, 'Pacific/Johnston\r', 1),
(496, 'Pacific/Kiritimati\r', 1),
(497, 'Pacific/Kosrae\r', 1),
(498, 'Pacific/Kwajalein\r', 1),
(499, 'Pacific/Majuro\r', 1),
(500, 'Pacific/Marquesas\r', 1),
(501, 'Pacific/Midway\r', 1),
(502, 'Pacific/Nauru\r', 1),
(503, 'Pacific/Niue\r', 1),
(504, 'Pacific/Norfolk\r', 1),
(505, 'Pacific/Noumea\r', 1),
(506, 'Pacific/Pago_Pago\r', 1),
(507, 'Pacific/Palau\r', 1),
(508, 'Pacific/Pitcairn\r', 1),
(509, 'Pacific/Pohnpei\r', 1),
(510, 'Pacific/Ponape\r', 1),
(511, 'Pacific/Port_Moresby\r', 1),
(512, 'Pacific/Rarotonga\r', 1),
(513, 'Pacific/Saipan\r', 1),
(514, 'Pacific/Samoa\r', 1),
(515, 'Pacific/Tahiti\r', 1),
(516, 'Pacific/Tarawa\r', 1),
(517, 'Pacific/Tongatapu\r', 1),
(518, 'Pacific/Truk\r', 1),
(519, 'Pacific/Wake\r', 1),
(520, 'Pacific/Wallis\r', 1),
(521, 'Pacific/Yap\r', 1),
(522, 'Poland\r', 1),
(523, 'Portugal\r', 1),
(524, 'PRC\r', 1),
(525, 'PST8PDT\r', 1),
(526, 'ROC\r', 1),
(527, 'ROK\r', 1),
(528, 'Singapore\r', 1),
(529, 'Turkey\r', 1),
(530, 'UCT\r', 1),
(531, 'Universal\r', 1),
(532, 'US/Alaska\r', 1),
(533, 'US/Aleutian\r', 1),
(534, 'US/Arizona\r', 1),
(535, 'US/Central\r', 1),
(536, 'US/Eastern\r', 1),
(537, 'US/East-Indiana\r', 1),
(538, 'US/Hawaii\r', 1),
(539, 'US/Indiana-Starke\r', 1),
(540, 'US/Michigan\r', 1),
(541, 'US/Mountain\r', 1),
(542, 'US/Pacific\r', 1),
(543, 'US/Pacific-New\r', 1),
(544, 'US/Samoa\r', 1),
(545, 'UTC\r', 1),
(546, 'WET\r', 1),
(547, 'W-SU\r', 1),
(548, 'Zulu\r', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_twilio`
--

CREATE TABLE `db_twilio` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `account_sid` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `auth_token` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `twilio_phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_twilio`
--

INSERT INTO `db_twilio` (`id`, `store_id`, `account_sid`, `auth_token`, `twilio_phone`, `status`) VALUES
(1, 1, '', '', '', 0),
(3, 2, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `db_units`
--

CREATE TABLE `db_units` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `unit_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_units`
--

INSERT INTO `db_units` (`id`, `store_id`, `unit_name`, `description`, `company_id`, `status`) VALUES
(61, 2, 'PCS', '', NULL, 1),
(62, 2, 'KG', '', NULL, 1),
(63, 2, 'PIECE', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_users`
--

CREATE TABLE `db_users` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` blob DEFAULT NULL,
  `member_of` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` blob DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `profile_picture` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` double DEFAULT NULL,
  `creater_id` int(5) DEFAULT NULL,
  `updater_id` int(5) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_users`
--

INSERT INTO `db_users` (`id`, `store_id`, `username`, `first_name`, `last_name`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `postcode`, `role_name`, `role_id`, `profile_picture`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `status`, `creater_id`, `updater_id`, `updated_at`, `default_warehouse_id`) VALUES
(1, 1, 'user_48886', 'Admin', 'Power', 0x6531306164633339343962613539616262653536653035376632306638383365, '', NULL, NULL, '', 'super@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'uploads/users/admin.png', '2018-11-27', '::1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(2, 2, 'SDAPOWER', 'SIVA', 'KUMAR', 0x6531306164633339343962613539616262653536653035376632306638383365, NULL, NULL, NULL, '9626646255', 'admin@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'uploads/users/WhatsApp_Image_2024-01-02_at_11_.jpg', '2021-02-12', '05:53:37 pm', '', '127.0.0.1', 'LAPTOP-I5OUIM4R', 1, NULL, NULL, NULL, 0),
(103, 2, 'ADMINSIVA', 'SIVA', 'KUMAR', 0x6531306164633339343962613539616262653536653035376632306638383365, NULL, NULL, NULL, '', 'sivakumar@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 'uploads/users/WhatsApp_Image_2024-01-02_at_11_1.jpg', '2024-01-03', '10:37:11 am', 'RSPOWER', '::1', 'DESKTOP-016EDF3', 1, NULL, NULL, NULL, 87);

-- --------------------------------------------------------

--
-- Table structure for table `db_userswarehouses`
--

CREATE TABLE `db_userswarehouses` (
  `id` int(5) NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_userswarehouses`
--

INSERT INTO `db_userswarehouses` (`id`, `user_id`, `warehouse_id`) VALUES
(78, 103, 87);

-- --------------------------------------------------------

--
-- Table structure for table `db_variants`
--

CREATE TABLE `db_variants` (
  `id` int(5) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `variant_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_warehouse`
--

CREATE TABLE `db_warehouse` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_warehouse`
--

INSERT INTO `db_warehouse` (`id`, `store_id`, `warehouse_type`, `warehouse_name`, `mobile`, `email`, `status`, `created_date`) VALUES
(1, 1, 'System', 'Warehouse-A', '', 'warehouse_a@example.com', 1, NULL),
(2, 2, 'System', 'System Warehouse', '', '', 1, NULL),
(87, 2, 'Custom', 'S.D.A POWER TOOLS', '9626646255', '', 1, '2024-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `db_warehouseitems`
--

CREATE TABLE `db_warehouseitems` (
  `id` int(5) NOT NULL,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `available_qty` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_warehouseitems`
--

INSERT INTO `db_warehouseitems` (`id`, `store_id`, `warehouse_id`, `item_id`, `available_qty`) VALUES
(4540, 2, 87, 2, 5.00),
(4541, 2, 87, 3, 5.00),
(4542, 2, 87, 4, 5.00),
(4544, 2, 87, 6, 50.00),
(4545, 2, 87, 7, 30.00),
(4546, 2, 87, 8, 50.00),
(4547, 2, 87, 9, 5.00),
(4550, 2, 87, 10, 7.00),
(4551, 2, 87, 11, 6.00),
(4552, 2, 87, 12, 5.00),
(4553, 2, 87, 13, 100.00),
(4554, 2, 87, 14, 100.00),
(4555, 2, 87, 15, 100.00),
(4556, 2, 87, 16, 100.00),
(4559, 2, 87, 17, 50.00),
(4560, 2, 87, 18, 50.00),
(4561, 2, 87, 19, 50.00),
(4562, 2, 87, 20, 50.00),
(4563, 2, 87, 21, 50.00),
(4564, 2, 87, 22, 100.00),
(4565, 2, 87, 23, 100.00),
(4566, 2, 87, 24, 100.00),
(4567, 2, 87, 25, 100.00),
(4568, 2, 87, 26, 100.00),
(4569, 2, 87, 27, 100.00),
(4570, 2, 87, 28, 100.00),
(4571, 2, 87, 29, 100.00),
(4572, 2, 87, 30, 500.00),
(4573, 2, 87, 31, 5.00),
(4574, 2, 87, 32, 5.00),
(4575, 2, 87, 33, 5.00),
(4576, 2, 87, 34, 5.00),
(4577, 2, 87, 35, 5.00),
(4578, 2, 87, 36, 5.00),
(4579, 2, 87, 37, 5.00),
(4580, 2, 87, 38, 5.00),
(4581, 2, 87, 39, 5.00),
(4582, 2, 87, 40, 5.00),
(4583, 2, 87, 41, 5.00),
(4584, 2, 87, 42, 1.00),
(4585, 2, 87, 43, 2.00),
(4586, 2, 87, 44, 2.00),
(4588, 2, 87, 46, 2.00),
(4589, 2, 87, 47, 2.00),
(4590, 2, 87, 48, 2.00),
(4591, 2, 87, 49, 100.00),
(4592, 2, 87, 50, 50.00),
(4593, 2, 87, 51, 5.00),
(4594, 2, 87, 52, 5.00),
(4595, 2, 87, 53, 5.00),
(4596, 2, 87, 54, 5.00),
(4598, 2, 87, 56, 50.00),
(4599, 2, 87, 57, 25.00),
(4600, 2, 87, 58, 1.00),
(4601, 2, 87, 59, 2.00),
(4602, 2, 87, 60, 1.00),
(4603, 2, 87, 61, 1.00),
(4604, 2, 87, 62, 1.00),
(4605, 2, 87, 63, 1.00),
(4606, 2, 87, 64, 1.00),
(4607, 2, 87, 65, 20.00),
(4608, 2, 87, 66, 5.00),
(4609, 2, 87, 67, 5.00),
(4610, 2, 87, 68, 5.00),
(4611, 2, 87, 69, 10.00),
(4612, 2, 87, 70, 10.00),
(4613, 2, 87, 71, 2.00),
(4614, 2, 87, 72, 2.00),
(4615, 2, 87, 73, 2.00),
(4616, 2, 87, 74, 5.00),
(4617, 2, 87, 75, 10.00),
(4618, 2, 87, 76, 5.00),
(4619, 2, 87, 77, 20.00),
(4620, 2, 87, 78, 20.00),
(4621, 2, 87, 79, 20.00),
(4622, 2, 87, 80, 10.00),
(4623, 2, 87, 81, 10.00),
(4624, 2, 87, 82, 10.00),
(4625, 2, 87, 83, 10.00),
(4626, 2, 87, 84, 10.00),
(4627, 2, 87, 85, 10.00),
(4629, 2, 87, 87, 5.00),
(4630, 2, 87, 88, 5.00),
(4631, 2, 87, 89, 5.00),
(4632, 2, 87, 90, 1.00),
(4633, 2, 87, 91, 1.00),
(4634, 2, 87, 92, 1.00),
(4636, 2, 87, 94, 100.00),
(4637, 2, 87, 95, 100.00),
(4638, 2, 87, 96, 10.00),
(4639, 2, 87, 97, 25.00),
(4640, 2, 87, 98, 25.00),
(4641, 2, 87, 99, 50.00),
(4642, 2, 87, 100, 50.00),
(4643, 2, 87, 101, 50.00),
(4644, 2, 87, 102, 50.00),
(4645, 2, 87, 103, 50.00),
(4646, 2, 87, 104, 50.00),
(4647, 2, 87, 105, 20.00),
(4648, 2, 87, 106, 20.00),
(4649, 2, 87, 107, 20.00),
(4650, 2, 87, 108, 20.00),
(4651, 2, 87, 109, 3.00),
(4652, 2, 87, 110, 3.00),
(4653, 2, 87, 111, 3.00),
(4654, 2, 87, 112, 3.00),
(4655, 2, 87, 113, 50.00),
(4656, 2, 87, 114, 50.00),
(4657, 2, 87, 115, 2.00),
(4658, 2, 87, 116, 20.00),
(4659, 2, 87, 117, 20.00),
(4660, 2, 87, 118, 10.00),
(4661, 2, 87, 119, 10.00),
(4662, 2, 87, 120, 5.00),
(4663, 2, 87, 121, 10.00),
(4664, 2, 87, 122, 10.00),
(4665, 2, 87, 123, 10.00),
(4666, 2, 87, 124, 10.00),
(4667, 2, 87, 125, 10.00),
(4668, 2, 87, 126, 10.00),
(4669, 2, 87, 127, 10.00),
(4670, 2, 87, 128, 10.00),
(4671, 2, 87, 129, 10.00),
(4672, 2, 87, 130, 10.00),
(4673, 2, 87, 131, 10.00),
(4674, 2, 87, 132, 10.00),
(4675, 2, 87, 133, 10.00),
(4676, 2, 87, 134, 10.00),
(4677, 2, 87, 135, 10.00),
(4678, 2, 87, 136, 10.00),
(4679, 2, 87, 137, 10.00),
(4680, 2, 87, 138, 10.00),
(4681, 2, 87, 139, 10.00),
(4682, 2, 87, 140, 10.00),
(4683, 2, 87, 141, 10.00),
(4684, 2, 87, 142, 10.00),
(4685, 2, 87, 143, 10.00),
(4686, 2, 87, 144, 10.00),
(4687, 2, 87, 145, 10.00),
(4688, 2, 87, 146, 10.00),
(4689, 2, 87, 147, 10.00),
(4690, 2, 87, 148, 10.00),
(4691, 2, 87, 149, 10.00),
(4692, 2, 87, 150, 10.00),
(4693, 2, 87, 151, 12.00),
(4694, 2, 87, 152, 12.00),
(4695, 2, 87, 153, 100.00),
(4696, 2, 87, 154, 3.00),
(4697, 2, 87, 155, 1.00),
(4698, 2, 87, 156, 1.00),
(4699, 2, 87, 157, 21.00),
(4700, 2, 87, 158, 5.00),
(4701, 2, 87, 159, 5.00),
(4702, 2, 87, 160, 5.00),
(4703, 2, 87, 161, 10.00),
(4705, 2, 87, 163, 5.00),
(4706, 2, 87, 164, 5.00),
(4707, 2, 87, 165, 10.00),
(4708, 2, 87, 166, 10.00),
(4709, 2, 87, 167, 10.00),
(4710, 2, 87, 168, 5.00),
(4711, 2, 87, 169, 50.00),
(4712, 2, 87, 170, 2.00),
(4713, 2, 87, 171, 1.00),
(4714, 2, 87, 172, 400.00),
(4717, 2, 87, 1, 10.00),
(4726, 2, 87, 5, 1.00),
(4727, 2, 87, 45, 4.00),
(4728, 2, 87, 93, 1.00),
(4729, 2, 87, 55, 4.00),
(4730, 2, 87, 86, 39.00),
(4732, 2, 87, 173, 1.00),
(4733, 2, 87, 174, 1.00),
(4734, 2, 87, 176, 100.00),
(4735, 2, 87, 177, 200.00),
(4736, 2, 87, 178, 1.00),
(4737, 2, 87, 179, 1.00),
(4738, 2, 87, 180, 1.00),
(4739, 2, 87, 181, 5.00),
(4740, 2, 87, 182, 10.00),
(4741, 2, 87, 183, 10.00),
(4742, 2, 87, 184, 25.00),
(4743, 2, 87, 185, 6.00),
(4744, 2, 87, 186, 1430.00),
(4745, 2, 87, 187, 3.00),
(4746, 2, 87, 188, 5.00),
(4747, 2, 87, 189, 5.00),
(4748, 2, 87, 190, 2.00),
(4749, 2, 87, 191, 20.00),
(4750, 2, 87, 192, 2.00),
(4751, 2, 87, 193, 2.00),
(4752, 2, 87, 194, 2.00),
(4753, 2, 87, 195, 100.00),
(4754, 2, 87, 196, 200.00),
(4755, 2, 87, 197, 100.00),
(4756, 2, 87, 198, 9.00),
(4757, 2, 87, 199, 10.00),
(4758, 2, 87, 200, 10.00),
(4759, 2, 87, 201, 20.00),
(4760, 2, 87, 202, 10.00),
(4761, 2, 87, 203, 100.00),
(4763, 2, 87, 205, 1.00),
(4764, 2, 87, 206, 2.00),
(4765, 2, 87, 207, 2.00),
(4777, 2, 87, 204, 2.00),
(4778, 2, 87, 208, 1.00),
(4780, 2, 87, 209, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `temp_holdinvoice`
--

CREATE TABLE `temp_holdinvoice` (
  `id` int(5) NOT NULL,
  `invoice_id` int(5) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `item_qty` int(5) DEFAULT NULL,
  `item_price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ac_accounts`
--
ALTER TABLE `ac_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `paymenttypes_id` (`paymenttypes_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `expense_id` (`expense_id`);

--
-- Indexes for table `ac_moneydeposits`
--
ALTER TABLE `ac_moneydeposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_account_id` (`debit_account_id`),
  ADD KEY `to_account_id` (`credit_account_id`),
  ADD KEY `db_moneydeposits_ibfk_3` (`store_id`);

--
-- Indexes for table `ac_moneytransfer`
--
ALTER TABLE `ac_moneytransfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_account_id` (`debit_account_id`),
  ADD KEY `to_account_id` (`credit_account_id`),
  ADD KEY `db_moneytransfer_ibfk_3` (`store_id`);

--
-- Indexes for table `ac_transactions`
--
ALTER TABLE `ac_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_id` (`transaction_type`),
  ADD KEY `account_id` (`debit_account_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `ac_accounts_id` (`ref_accounts_id`),
  ADD KEY `ac_moneytransfer_id` (`ref_moneytransfer_id`),
  ADD KEY `ac_moneydeposits_id` (`ref_moneydeposits_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `ref_salespayments_id` (`ref_salespayments_id`),
  ADD KEY `ref_purchasepayments_id` (`ref_purchasepayments_id`),
  ADD KEY `ref_purchasepaymentsreturn_id` (`ref_purchasepaymentsreturn_id`),
  ADD KEY `ac_transactions_ibfk_9` (`ref_salespaymentsreturn_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `ref_expense_id` (`ref_expense_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `db_bankdetails`
--
ALTER TABLE `db_bankdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_brands`
--
ALTER TABLE `db_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_country`
--
ALTER TABLE `db_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_coupons`
--
ALTER TABLE `db_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_currency`
--
ALTER TABLE `db_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_custadvance`
--
ALTER TABLE `db_custadvance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_customers`
--
ALTER TABLE `db_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_customer_coupons`
--
ALTER TABLE `db_customer_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `salespayment_id` (`salespayment_id`);

--
-- Indexes for table `db_emailtemplates`
--
ALTER TABLE `db_emailtemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_expense`
--
ALTER TABLE `db_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_fivemojo`
--
ALTER TABLE `db_fivemojo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_hold`
--
ALTER TABLE `db_hold`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `db_holditems`
--
ALTER TABLE `db_holditems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `sales_id` (`hold_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `db_instamojo`
--
ALTER TABLE `db_instamojo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_instamojopayments`
--
ALTER TABLE `db_instamojopayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_items`
--
ALTER TABLE `db_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_languages`
--
ALTER TABLE `db_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_package`
--
ALTER TABLE `db_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_paypal`
--
ALTER TABLE `db_paypal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_paypalpaylog`
--
ALTER TABLE `db_paypalpaylog`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `db_permissions`
--
ALTER TABLE `db_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_purchase`
--
ALTER TABLE `db_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `purchase_id` (`purchase_id`);

--
-- Indexes for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `purchase_id` (`purchase_id`);

--
-- Indexes for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `purchase_id` (`purchase_id`);

--
-- Indexes for table `db_quotation`
--
ALTER TABLE `db_quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `db_quotationitems`
--
ALTER TABLE `db_quotationitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `db_roles`
--
ALTER TABLE `db_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_sales`
--
ALTER TABLE `db_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `sales_id` (`sales_id`);

--
-- Indexes for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `return_id` (`return_id`);

--
-- Indexes for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `sales_id` (`sales_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `db_salespaymentsreturn_ibfk_3` (`customer_id`);

--
-- Indexes for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `sales_id` (`sales_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `db_shippingaddress`
--
ALTER TABLE `db_shippingaddress`
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_states`
--
ALTER TABLE `db_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_stockadjustment`
--
ALTER TABLE `db_stockadjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_stockadjustmentitems`
--
ALTER TABLE `db_stockadjustmentitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`adjustment_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_stocktransfer`
--
ALTER TABLE `db_stocktransfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `warehouse_id` (`warehouse_from`),
  ADD KEY `warehouse_to` (`warehouse_to`),
  ADD KEY `db_stocktransfer_ibfk_4` (`to_store_id`);

--
-- Indexes for table `db_stocktransferitems`
--
ALTER TABLE `db_stocktransferitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `warehouse_from` (`warehouse_from`),
  ADD KEY `warehouse_to` (`warehouse_to`),
  ADD KEY `stocktranfer_id` (`stocktransfer_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `db_stocktransferitems_ibfk_6` (`to_store_id`);

--
-- Indexes for table `db_store`
--
ALTER TABLE `db_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_stripe`
--
ALTER TABLE `db_stripe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_stripepayments`
--
ALTER TABLE `db_stripepayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_subscription`
--
ALTER TABLE `db_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `purchasepayment_id` (`purchasepayment_id`);

--
-- Indexes for table `db_tax`
--
ALTER TABLE `db_tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_timezone`
--
ALTER TABLE `db_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_twilio`
--
ALTER TABLE `db_twilio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_units`
--
ALTER TABLE `db_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_users`
--
ALTER TABLE `db_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_userswarehouses`
--
ALTER TABLE `db_userswarehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `db_variants`
--
ALTER TABLE `db_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `db_warehouseitems`
--
ALTER TABLE `db_warehouseitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `temp_holdinvoice`
--
ALTER TABLE `temp_holdinvoice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ac_accounts`
--
ALTER TABLE `ac_accounts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ac_moneydeposits`
--
ALTER TABLE `ac_moneydeposits`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ac_moneytransfer`
--
ALTER TABLE `ac_moneytransfer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ac_transactions`
--
ALTER TABLE `ac_transactions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=830;

--
-- AUTO_INCREMENT for table `db_bankdetails`
--
ALTER TABLE `db_bankdetails`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_brands`
--
ALTER TABLE `db_brands`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_country`
--
ALTER TABLE `db_country`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `db_coupons`
--
ALTER TABLE `db_coupons`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `db_currency`
--
ALTER TABLE `db_currency`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `db_custadvance`
--
ALTER TABLE `db_custadvance`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_customers`
--
ALTER TABLE `db_customers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_customer_coupons`
--
ALTER TABLE `db_customer_coupons`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_emailtemplates`
--
ALTER TABLE `db_emailtemplates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `db_expense`
--
ALTER TABLE `db_expense`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `db_fivemojo`
--
ALTER TABLE `db_fivemojo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_hold`
--
ALTER TABLE `db_hold`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `db_holditems`
--
ALTER TABLE `db_holditems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `db_instamojo`
--
ALTER TABLE `db_instamojo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_instamojopayments`
--
ALTER TABLE `db_instamojopayments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `db_items`
--
ALTER TABLE `db_items`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `db_languages`
--
ALTER TABLE `db_languages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `db_package`
--
ALTER TABLE `db_package`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `db_paypal`
--
ALTER TABLE `db_paypal`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_paypalpaylog`
--
ALTER TABLE `db_paypalpaylog`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_permissions`
--
ALTER TABLE `db_permissions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6338;

--
-- AUTO_INCREMENT for table `db_purchase`
--
ALTER TABLE `db_purchase`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_quotation`
--
ALTER TABLE `db_quotation`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `db_quotationitems`
--
ALTER TABLE `db_quotationitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT for table `db_roles`
--
ALTER TABLE `db_roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `db_sales`
--
ALTER TABLE `db_sales`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=713;

--
-- AUTO_INCREMENT for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_shippingaddress`
--
ALTER TABLE `db_shippingaddress`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_states`
--
ALTER TABLE `db_states`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `db_stockadjustment`
--
ALTER TABLE `db_stockadjustment`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `db_stockadjustmentitems`
--
ALTER TABLE `db_stockadjustmentitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=743;

--
-- AUTO_INCREMENT for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_stocktransfer`
--
ALTER TABLE `db_stocktransfer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_stocktransferitems`
--
ALTER TABLE `db_stocktransferitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `db_store`
--
ALTER TABLE `db_store`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_stripe`
--
ALTER TABLE `db_stripe`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_stripepayments`
--
ALTER TABLE `db_stripepayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_subscription`
--
ALTER TABLE `db_subscription`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `db_tax`
--
ALTER TABLE `db_tax`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `db_timezone`
--
ALTER TABLE `db_timezone`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;

--
-- AUTO_INCREMENT for table `db_twilio`
--
ALTER TABLE `db_twilio`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_units`
--
ALTER TABLE `db_units`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `db_users`
--
ALTER TABLE `db_users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `db_userswarehouses`
--
ALTER TABLE `db_userswarehouses`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `db_variants`
--
ALTER TABLE `db_variants`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `db_warehouseitems`
--
ALTER TABLE `db_warehouseitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4781;

--
-- AUTO_INCREMENT for table `temp_holdinvoice`
--
ALTER TABLE `temp_holdinvoice`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ac_accounts`
--
ALTER TABLE `ac_accounts`
  ADD CONSTRAINT `ac_accounts_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_accounts_ibfk_2` FOREIGN KEY (`paymenttypes_id`) REFERENCES `db_paymenttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_accounts_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_accounts_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_accounts_ibfk_5` FOREIGN KEY (`expense_id`) REFERENCES `db_expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ac_moneydeposits`
--
ALTER TABLE `ac_moneydeposits`
  ADD CONSTRAINT `ac_moneydeposits_ibfk_1` FOREIGN KEY (`debit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_moneydeposits_ibfk_2` FOREIGN KEY (`credit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_moneydeposits_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ac_moneytransfer`
--
ALTER TABLE `ac_moneytransfer`
  ADD CONSTRAINT `ac_moneytransfer_ibfk_1` FOREIGN KEY (`debit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_moneytransfer_ibfk_2` FOREIGN KEY (`credit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_moneytransfer_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ac_transactions`
--
ALTER TABLE `ac_transactions`
  ADD CONSTRAINT `ac_transactions_ibfk_10` FOREIGN KEY (`ref_purchasepayments_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_11` FOREIGN KEY (`ref_purchasepaymentsreturn_id`) REFERENCES `db_purchasepaymentsreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_12` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_13` FOREIGN KEY (`ref_expense_id`) REFERENCES `db_expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_4` FOREIGN KEY (`ref_accounts_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_5` FOREIGN KEY (`ref_moneytransfer_id`) REFERENCES `ac_moneytransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_6` FOREIGN KEY (`ref_moneydeposits_id`) REFERENCES `ac_moneydeposits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_7` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_8` FOREIGN KEY (`ref_salespayments_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ac_transactions_ibfk_9` FOREIGN KEY (`ref_salespaymentsreturn_id`) REFERENCES `db_salespaymentsreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_bankdetails`
--
ALTER TABLE `db_bankdetails`
  ADD CONSTRAINT `db_bankdetails_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `db_brands`
--
ALTER TABLE `db_brands`
  ADD CONSTRAINT `db_brands_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_brands_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_category`
--
ALTER TABLE `db_category`
  ADD CONSTRAINT `db_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_coupons`
--
ALTER TABLE `db_coupons`
  ADD CONSTRAINT `db_coupons_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_coupons_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_custadvance`
--
ALTER TABLE `db_custadvance`
  ADD CONSTRAINT `db_custadvance_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_custadvance_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_customers`
--
ALTER TABLE `db_customers`
  ADD CONSTRAINT `db_customers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_customer_coupons`
--
ALTER TABLE `db_customer_coupons`
  ADD CONSTRAINT `db_customer_coupons_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_customer_coupons_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_customer_coupons_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_customer_coupons_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `db_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_customer_payments`
--
ALTER TABLE `db_customer_payments`
  ADD CONSTRAINT `db_customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_customer_payments_ibfk_2` FOREIGN KEY (`salespayment_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_emailtemplates`
--
ALTER TABLE `db_emailtemplates`
  ADD CONSTRAINT `db_emailtemplates_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_expense`
--
ALTER TABLE `db_expense`
  ADD CONSTRAINT `db_expense_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_expense_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  ADD CONSTRAINT `db_expense_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_fivemojo`
--
ALTER TABLE `db_fivemojo`
  ADD CONSTRAINT `db_fivemojo_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_hold`
--
ALTER TABLE `db_hold`
  ADD CONSTRAINT `db_hold_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_hold_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_hold_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_holditems`
--
ALTER TABLE `db_holditems`
  ADD CONSTRAINT `db_holditems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_holditems_ibfk_2` FOREIGN KEY (`hold_id`) REFERENCES `db_hold` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_holditems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_instamojo`
--
ALTER TABLE `db_instamojo`
  ADD CONSTRAINT `db_instamojo_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_items`
--
ALTER TABLE `db_items`
  ADD CONSTRAINT `db_items_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_package`
--
ALTER TABLE `db_package`
  ADD CONSTRAINT `db_package_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  ADD CONSTRAINT `db_paymenttypes_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_paypal`
--
ALTER TABLE `db_paypal`
  ADD CONSTRAINT `db_paypal_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_permissions`
--
ALTER TABLE `db_permissions`
  ADD CONSTRAINT `db_permissions_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_purchase`
--
ALTER TABLE `db_purchase`
  ADD CONSTRAINT `db_purchase_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchase_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  ADD CONSTRAINT `db_purchaseitems_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  ADD CONSTRAINT `db_purchaseitemsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchaseitemsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  ADD CONSTRAINT `db_purchasepayments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchasepayments_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchasepayments_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  ADD CONSTRAINT `db_purchasepaymentsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchasepaymentsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchasepaymentsreturn_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  ADD CONSTRAINT `db_purchasereturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_purchasereturn_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_quotation`
--
ALTER TABLE `db_quotation`
  ADD CONSTRAINT `db_quotation_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_quotation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_quotation_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_quotationitems`
--
ALTER TABLE `db_quotationitems`
  ADD CONSTRAINT `db_quotationitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_quotationitems_ibfk_2` FOREIGN KEY (`quotation_id`) REFERENCES `db_quotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_roles`
--
ALTER TABLE `db_roles`
  ADD CONSTRAINT `db_roles_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_sales`
--
ALTER TABLE `db_sales`
  ADD CONSTRAINT `db_sales_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_sales_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_sales_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `db_customer_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  ADD CONSTRAINT `db_salesitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salesitems_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  ADD CONSTRAINT `db_salesitemsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salesitemsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  ADD CONSTRAINT `db_salespayments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salespayments_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salespayments_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  ADD CONSTRAINT `db_salespaymentsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salespaymentsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salespaymentsreturn_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  ADD CONSTRAINT `db_salesreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salesreturn_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_salesreturn_ibfk_3` FOREIGN KEY (`coupon_id`) REFERENCES `db_customer_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_shippingaddress`
--
ALTER TABLE `db_shippingaddress`
  ADD CONSTRAINT `db_shippingaddress_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_shippingaddress_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  ADD CONSTRAINT `db_smsapi_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  ADD CONSTRAINT `db_smstemplates_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_states`
--
ALTER TABLE `db_states`
  ADD CONSTRAINT `db_states_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_stockadjustment`
--
ALTER TABLE `db_stockadjustment`
  ADD CONSTRAINT `db_stockadjustment_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_stockadjustmentitems`
--
ALTER TABLE `db_stockadjustmentitems`
  ADD CONSTRAINT `db_stockadjustmentitems_ibfk_1` FOREIGN KEY (`adjustment_id`) REFERENCES `db_stockadjustment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stockadjustmentitems_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stockadjustmentitems_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stockadjustmentitems_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_stocktransfer`
--
ALTER TABLE `db_stocktransfer`
  ADD CONSTRAINT `db_stocktransfer_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransfer_ibfk_2` FOREIGN KEY (`warehouse_from`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransfer_ibfk_3` FOREIGN KEY (`warehouse_to`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransfer_ibfk_4` FOREIGN KEY (`to_store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_stocktransferitems`
--
ALTER TABLE `db_stocktransferitems`
  ADD CONSTRAINT `db_stocktransferitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransferitems_ibfk_2` FOREIGN KEY (`warehouse_from`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransferitems_ibfk_3` FOREIGN KEY (`warehouse_to`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransferitems_ibfk_4` FOREIGN KEY (`stocktransfer_id`) REFERENCES `db_stocktransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransferitems_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_stocktransferitems_ibfk_6` FOREIGN KEY (`to_store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_stripe`
--
ALTER TABLE `db_stripe`
  ADD CONSTRAINT `db_stripe_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  ADD CONSTRAINT `db_suppliers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_supplier_payments`
--
ALTER TABLE `db_supplier_payments`
  ADD CONSTRAINT `db_supplier_payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_supplier_payments_ibfk_2` FOREIGN KEY (`purchasepayment_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_tax`
--
ALTER TABLE `db_tax`
  ADD CONSTRAINT `db_tax_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_twilio`
--
ALTER TABLE `db_twilio`
  ADD CONSTRAINT `db_twilio_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_units`
--
ALTER TABLE `db_units`
  ADD CONSTRAINT `db_units_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_users`
--
ALTER TABLE `db_users`
  ADD CONSTRAINT `db_users_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_userswarehouses`
--
ALTER TABLE `db_userswarehouses`
  ADD CONSTRAINT `db_userswarehouses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_userswarehouses_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_variants`
--
ALTER TABLE `db_variants`
  ADD CONSTRAINT `db_variants_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_variants_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  ADD CONSTRAINT `db_warehouse_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_warehouseitems`
--
ALTER TABLE `db_warehouseitems`
  ADD CONSTRAINT `db_warehouseitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_warehouseitems_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_warehouseitems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
