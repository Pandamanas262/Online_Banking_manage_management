-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 07:06 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accno` int(11) NOT NULL,
  `bal` decimal(14,2) NOT NULL,
  `actype` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `dcardno` varchar(16) DEFAULT NULL,
  `dcardlimit` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accno`, `bal`, `actype`, `active`, `dcardno`, `dcardlimit`, `customer_id`) VALUES
(10001, '4050.00', 'Saving Account', 1, NULL, 0, 1),
(10002, '14000.00', 'Saving Account', 1, NULL, 0, 2),
(10003, '8000.00', 'Saving Account', 1, NULL, 0, 3),
(10004, '5000.00', 'Saving Account', 1, NULL, 0, 4),
(10005, '2000.00', 'Saving Account', 1, NULL, 0, 5),
(10006, '5000.00', 'Saving Account', 1, NULL, 0, 6),
(10007, '7000.00', 'Saving Account', 1, NULL, 0, 9),
(10008, '49000.00', 'Saving Account', 1, NULL, 0, 8),
(10009, '8000.00', 'Saving Account', 1, NULL, 0, 10),
(10010, '10000.00', 'Saving Account', 1, NULL, 0, 11),
(10011, '5000.00', 'Saving Account', 1, NULL, 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add users', 1, 'add_users'),
(2, 'Can change users', 1, 'change_users'),
(3, 'Can delete users', 1, 'delete_users'),
(4, 'Can view users', 1, 'view_users'),
(5, 'Can add customer', 2, 'add_customer'),
(6, 'Can change customer', 2, 'change_customer'),
(7, 'Can delete customer', 2, 'delete_customer'),
(8, 'Can view customer', 2, 'view_customer'),
(9, 'Can add net banking user', 3, 'add_netbankinguser'),
(10, 'Can change net banking user', 3, 'change_netbankinguser'),
(11, 'Can delete net banking user', 3, 'delete_netbankinguser'),
(12, 'Can view net banking user', 3, 'view_netbankinguser'),
(13, 'Can add account', 4, 'add_account'),
(14, 'Can change account', 4, 'change_account'),
(15, 'Can delete account', 4, 'delete_account'),
(16, 'Can view account', 4, 'view_account'),
(17, 'Can add beneficiary', 5, 'add_beneficiary'),
(18, 'Can change beneficiary', 5, 'change_beneficiary'),
(19, 'Can delete beneficiary', 5, 'delete_beneficiary'),
(20, 'Can view beneficiary', 5, 'view_beneficiary'),
(21, 'Can add transactions', 6, 'add_transactions'),
(22, 'Can change transactions', 6, 'change_transactions'),
(23, 'Can delete transactions', 6, 'delete_transactions'),
(24, 'Can view transactions', 6, 'view_transactions'),
(25, 'Can add insurance', 7, 'add_insurance'),
(26, 'Can change insurance', 7, 'change_insurance'),
(27, 'Can delete insurance', 7, 'delete_insurance'),
(28, 'Can view insurance', 7, 'view_insurance'),
(29, 'Can add log entry', 8, 'add_logentry'),
(30, 'Can change log entry', 8, 'change_logentry'),
(31, 'Can delete log entry', 8, 'delete_logentry'),
(32, 'Can view log entry', 8, 'view_logentry'),
(33, 'Can add permission', 9, 'add_permission'),
(34, 'Can change permission', 9, 'change_permission'),
(35, 'Can delete permission', 9, 'delete_permission'),
(36, 'Can view permission', 9, 'view_permission'),
(37, 'Can add group', 10, 'add_group'),
(38, 'Can change group', 10, 'change_group'),
(39, 'Can delete group', 10, 'delete_group'),
(40, 'Can view group', 10, 'view_group'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

CREATE TABLE `beneficiary` (
  `id` int(11) NOT NULL,
  `bname` varchar(30) DEFAULT NULL,
  `accno` int(11) DEFAULT NULL,
  `maxlimit` decimal(12,2) DEFAULT NULL,
  `bankname` varchar(30) DEFAULT NULL,
  `banktype` varchar(20) DEFAULT NULL,
  `ifsc` varchar(15) DEFAULT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beneficiary`
--

INSERT INTO `beneficiary` (`id`, `bname`, `accno`, `maxlimit`, `bankname`, `banktype`, `ifsc`, `customer_id`) VALUES
(2, 'Anil Kapoor', 232652322, '15000.00', 'SBI Bank', 'Other Bank', '456', 1),
(4, 'Raj Kumar', 10002, '30000.00', '', 'Same Bank', '', 1),
(5, 'Anand Singh', 1232323, '15000.00', '', 'Same Bank', '', 8),
(6, 'Rahul Verma', 123654, '15000.00', 'HDFC Bank', 'Other Bank', '123654', 10),
(7, 'Harish Panjwani', 10011, '50000.00', 'Bank of India', 'Other Bank', 'bkid0019008', 11),
(8, 'Sachin Kumar', 2147483647, '5000.00', 'BOI', 'Same Bank', 'BOI234', 12);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `adhar` varchar(12) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(35) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `netbanking` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `cname`, `address`, `gender`, `dob`, `adhar`, `phone`, `email`, `pic`, `netbanking`) VALUES
(1, 'Amit Singh', 'Ahemdabad', 'Male', '2000-10-10', '', '9898989899', 'amit123@gmail.com', 'cpics/2.jpg', 0),
(2, 'Shardul Thakur', 'Greater Noida', 'Male', '1999-12-12', '', '9899899999', 'shardul123@gmail.com', 'cpics/6.jpg', 0),
(3, 'Ankita Singh', 'Hyderabad', 'Female', '1999-12-12', '', '9898999898', 'anita@gmail.com', 'cpics/4.jpg', 0),
(4, 'Ravish Kumar', 'New Delhi', 'Male', '2000-10-10', '', '8998991234', 'ravi123@gmail.com', 'noimage.png', 0),
(5, 'Anuj Tawar', 'Indore', 'Male', '2000-10-10', '', '9898998989', 'anuj@gmail.com', 'noimage.png', 0),
(6, 'Rahul Pandey', 'Botenical Garden Delhi', 'Male', '2000-10-12', '', '9898989998', 'rahul@gmail.com', 'noimage.png', 0),
(7, 'Raveena Tondon', 'Noida', 'Female', '1999-12-12', '', '9868985655', 'raveena@gmail.com', 'noimage.png', 0),
(8, 'Supriya Pawar', 'Jabalpur', 'Female', '1999-11-25', '', '9865985986', 'supriya123@hotmail.com', 'noimage.png', 0),
(9, 'Rahul Bhadoriya', 'Gwalior', 'Male', '1998-10-25', '', '9898998989', 'rahul@gmail.com', 'cpics/logo.png', 0),
(10, 'Abhishek Singh', 'Bhopal', 'Male', '2000-05-12', '', '9811763700', 'abhishek@gmail.com', 'cpics/John-Abraham.jpg', 0),
(11, 'Pankaj Panjwani', '230 Mohini tower F2 Indrapuri C Sector', 'Male', '1989-06-27', '', '7566011111', 'collegeprojectscse@gmail.com', 'cpics/avatar213.png', 0),
(12, 'Harish Kumar', 'ABC Sector B Bhopal', 'Male', '1989-03-24', '', '8943784367', 'harryharish.2011@gmail.com', 'cpics/t4_WWVhK8a.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'admin', 'logentry'),
(10, 'auth', 'group'),
(9, 'auth', 'permission'),
(11, 'auth', 'user'),
(4, 'bankmanage', 'account'),
(5, 'bankmanage', 'beneficiary'),
(2, 'bankmanage', 'customer'),
(7, 'bankmanage', 'insurance'),
(3, 'bankmanage', 'netbankinguser'),
(6, 'bankmanage', 'transactions'),
(1, 'bankmanage', 'users'),
(12, 'contenttypes', 'contenttype'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-30 13:35:01.315696'),
(2, 'auth', '0001_initial', '2022-03-30 13:35:01.645161'),
(3, 'admin', '0001_initial', '2022-03-30 13:35:02.272297'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-30 13:35:02.413764'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-30 13:35:02.445032'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-30 13:35:02.601729'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-03-30 13:35:02.680286'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-03-30 13:35:02.727593'),
(9, 'auth', '0004_alter_user_username_opts', '2022-03-30 13:35:02.743223'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-03-30 13:35:02.821769'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-03-30 13:35:02.837411'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-30 13:35:02.853039'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-03-30 13:35:02.884297'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-30 13:35:02.915958'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-03-30 13:35:02.962855'),
(16, 'auth', '0011_update_proxy_permissions', '2022-03-30 13:35:02.978487'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-30 13:35:03.025806'),
(18, 'sessions', '0001_initial', '2022-03-30 13:35:03.088322'),
(19, 'bankmanage', '0001_initial', '2022-03-30 13:36:30.391840');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('rq5izzzsvxo3gy657mdp617tgm9sv5hw', 'e30:1nZbl2:SaWwKBCmD0qOTy8aTBXbxWI_doWWd8ad25rdMWdvh0c', '2022-04-13 17:05:20.249367');

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `id` int(11) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `father` varchar(50) NOT NULL,
  `maritalstatus` varchar(20) NOT NULL,
  `insurancetype` varchar(20) NOT NULL,
  `suminsured` decimal(14,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `premium` decimal(14,2) NOT NULL,
  `premiumtype` varchar(20) NOT NULL,
  `nomineename` varchar(30) NOT NULL,
  `nomineerelation` varchar(30) NOT NULL,
  `nomineeage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurances`
--

INSERT INTO `insurances` (`id`, `cname`, `address`, `gender`, `email`, `phone`, `dob`, `father`, `maritalstatus`, `insurancetype`, `suminsured`, `duration`, `premium`, `premiumtype`, `nomineename`, `nomineerelation`, `nomineeage`) VALUES
(1001, 'Amit Kumar', 'Noida', 'Male', 'amit@gmail.com', '9898998989', '2000-10-10', 'Raj Kumar', 'Married', 'Life Insurance', '50000.00', 10, '2000.00', 'Monthly', 'Rahul', 'Father', 50),
(1002, 'Ravi Kumar', 'Noida', 'Male', 'ravi@gmail.com', '9899956565', '1999-05-05', 'Rajesh Kumar', 'Single', 'Life Insurance', '600000.00', 10, '3000.00', 'Quarterly', 'Seema', 'Mother', 40),
(1003, 'Test Customer', 'Noida', 'Male', 'test@gmail.com', '9895656632', '2000-10-11', 'Test Father', 'Married', 'Life Insurance', '1500000.00', 10, '5000.00', 'Quarterly', 'Seema', 'Wife', 20);

-- --------------------------------------------------------

--
-- Table structure for table `nbusers`
--

CREATE TABLE `nbusers` (
  `userid` varchar(30) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `attempts` int(11) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `next_login` datetime(6) DEFAULT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nbusers`
--

INSERT INTO `nbusers` (`userid`, `pwd`, `active`, `locked`, `attempts`, `last_login`, `next_login`, `customer_id`) VALUES
('ajaykumar@gmail.com', 'anand', 1, 0, 3, '2021-05-22 08:32:44.961142', NULL, 1),
('anita@gmail.com', 'NjMmt2GqadgXl2H', 1, 0, 3, NULL, NULL, 3),
('collegeprojectscse@gmail.com', 'kIUwET23bcg9yXw', 1, 0, 3, '2021-06-27 19:03:23.382635', NULL, 11),
('harryharish.2011@gmail.com', '0xziokiGdc2bb4Y', 1, 0, 3, '2022-03-30 19:33:39.421876', NULL, 12),
('sapna@hotmail.com', '3k32QGQ3FrL9$HM', 1, 1, 0, '2021-05-22 10:57:34.267152', '2021-05-22 11:12:12.193142', 8),
('sharad@gmail.com', '6cgrbtW5k6$Jd@$', 1, 0, 3, NULL, NULL, 2),
('smart.anandsingh@hotmail.com', 'anand', 1, 0, 3, '2021-05-22 12:51:37.118118', '2021-05-22 11:28:43.708000', 10);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `tdate` date NOT NULL,
  `descr` varchar(50) NOT NULL,
  `cramt` decimal(14,2) DEFAULT NULL,
  `dramt` decimal(14,2) DEFAULT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `tdate`, `descr`, `cramt`, `dramt`, `account_id`) VALUES
(1, '2021-05-15', 'Account Open', '12000.00', NULL, 10002),
(2, '2021-05-15', 'Account Open', '10000.00', NULL, 10001),
(3, '2021-05-15', 'Account Open', '1000.00', NULL, 10001),
(4, '2021-05-15', 'Account Deposit', '2000.00', NULL, 10002),
(5, '2021-05-15', 'Account Withdraw', NULL, '1000.00', 10001),
(6, '2021-05-15', 'Account Deposit', '2000.00', NULL, 10002),
(7, '2021-05-15', 'Account Open', '5000.00', NULL, 10003),
(8, '2021-05-15', 'Account Deposit', '5000.00', NULL, 10003),
(9, '2021-05-15', 'Account Withdraw', NULL, '2000.00', 10003),
(10, '2021-05-17', 'Account Open', '5000.00', NULL, 10004),
(11, '2021-05-17', 'Account Open', '2000.00', NULL, 10005),
(12, '2021-05-17', 'Account Open', '5000.00', NULL, 10006),
(13, '2021-05-17', 'Account Open', '5000.00', NULL, 10007),
(14, '2021-05-17', 'Account Deposit', '2000.00', NULL, 10007),
(15, '2021-05-17', 'Account Withdraw', NULL, '2000.00', 10002),
(16, '2021-05-22', 'Transfer to Raj Kumar', NULL, '1000.00', 10001),
(17, '2021-05-22', 'Transfer to Anil Kapoor', NULL, '2000.00', 10001),
(18, '2021-05-22', 'Account Open', '50000.00', NULL, 10008),
(19, '2021-05-22', 'Transfer to Anand Singh', NULL, '1000.00', 10008),
(20, '2021-05-22', 'Account Open', '10000.00', NULL, 10009),
(21, '2021-05-22', 'Account Deposit', '5000.00', NULL, 10009),
(22, '2021-05-22', 'Account Withdraw', NULL, '2000.00', 10009),
(23, '2021-05-22', 'Transfer to Rahul Verma', NULL, '5000.00', 10009),
(24, '2021-06-24', 'Account Deposit', '50.00', NULL, 10001),
(25, '2021-06-27', 'Account Open', '10000.00', NULL, 10010),
(26, '2022-03-30', 'Account Withdraw', NULL, '1000.00', 10009),
(27, '2022-03-30', 'Account Deposit', '1000.00', NULL, 10009),
(28, '2022-03-30', 'Account Open', '5000.00', NULL, 10011),
(29, '2022-03-30', 'Account Deposit', '1000.00', NULL, 10011),
(30, '2022-03-30', 'Transfer to Sachin Kumar', NULL, '1000.00', 10011);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `pwd`) VALUES
('admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accno`),
  ADD UNIQUE KEY `dcardno` (`dcardno`),
  ADD KEY `accounts_customer_id_0ee1e998_fk_customers_id` (`customer_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beneficiary_customer_id_f28d1729_fk_customers_id` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nbusers`
--
ALTER TABLE `nbusers`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `nbusers_customer_id_d9d97883_fk_customers_id` (`customer_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_account_id_d92b47af_fk_accounts_accno` (`account_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beneficiary`
--
ALTER TABLE `beneficiary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_customer_id_0ee1e998_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD CONSTRAINT `beneficiary_customer_id_f28d1729_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `nbusers`
--
ALTER TABLE `nbusers`
  ADD CONSTRAINT `nbusers_customer_id_d9d97883_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_account_id_d92b47af_fk_accounts_accno` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`accno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
