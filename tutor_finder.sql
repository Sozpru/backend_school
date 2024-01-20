-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 06, 2024 at 05:02 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutor_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` text NOT NULL,
  `fees` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `firebase_results`
--

DROP TABLE IF EXISTS `firebase_results`;
CREATE TABLE IF NOT EXISTS `firebase_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fcm_multicast_id` bigint(20) DEFAULT NULL,
  `fcm_success` varchar(200) DEFAULT NULL,
  `fcm_failure` varchar(200) DEFAULT NULL,
  `fcm_error` varchar(200) DEFAULT NULL,
  `fcm_type` varchar(200) NOT NULL,
  `fcm_send_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hours_availability`
--

DROP TABLE IF EXISTS `hours_availability`;
CREATE TABLE IF NOT EXISTS `hours_availability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hours` text NOT NULL,
  `session` text NOT NULL COMMENT 'AM/PM',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hours_availability`
--

INSERT INTO `hours_availability` (`id`, `hours`, `session`) VALUES
(16, '08:00', 'am'),
(17, '01:00', 'pm');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `message` longtext NOT NULL,
  `user_id` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
CREATE TABLE IF NOT EXISTS `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_email` text NOT NULL,
  `student_email` text NOT NULL,
  `amount` double NOT NULL,
  `sub_fees` text NOT NULL,
  `transaction_id` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `tutor_email` text NOT NULL,
  `rate` float NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_email` text NOT NULL,
  `student_email` text NOT NULL,
  `subject` text NOT NULL,
  `fees` text NOT NULL,
  `status` text DEFAULT NULL,
  `m_hours` text NOT NULL,
  `a_hours` text NOT NULL,
  `tuition_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `tutor_email`, `student_email`, `subject`, `fees`, `status`, `m_hours`, `a_hours`, `tuition_type`) VALUES
(13, 'maxiq2024@gmail.com', 'ahmad.m.yahya@gmail.com', '10', '12', NULL, '16', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_status` varchar(10) NOT NULL DEFAULT 'true',
  `about` longtext NOT NULL,
  `privacy_policy` longtext NOT NULL,
  `distance` int(11) NOT NULL,
  `stripe_client_key` text NOT NULL,
  `stripe_public_key` text NOT NULL,
  `percentage` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `notification_status`, `about`, `privacy_policy`, `distance`, `stripe_client_key`, `stripe_public_key`, `percentage`) VALUES
(2, 'true', '<p>This page is about of tutor finder app.</p>', '<p>&nbsp;This page is Privacy Policy of tutor finder app.</p>', 5, 'sk_test_C2CqMfoav2GD8UdMjLDvdghx00PwrJibHL', 'pk_test_kfsr3luyMDMdh8xNwDmxNJNS00CIROHuDs', '5');

-- --------------------------------------------------------

--
-- Table structure for table `standard`
--

DROP TABLE IF EXISTS `standard`;
CREATE TABLE IF NOT EXISTS `standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard`
--

INSERT INTO `standard` (`id`, `std`) VALUES
(8, '7 to 8'),
(9, '9 to 10');

-- --------------------------------------------------------

--
-- Table structure for table `student_registration`
--

DROP TABLE IF EXISTS `student_registration`;
CREATE TABLE IF NOT EXISTS `student_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `standard` text DEFAULT NULL,
  `subject` text NOT NULL,
  `location` text DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `latitude` text NOT NULL,
  `longitude` text NOT NULL,
  `tuition_type` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_registration`
--

INSERT INTO `student_registration` (`id`, `email`, `standard`, `subject`, `location`, `mobile_no`, `latitude`, `longitude`, `tuition_type`, `datetime`) VALUES
(4, 'ahmad.m.yahya@gmail.com', '11', '', 'Suly,Raprin', 770, '', '', 0, '2024-01-01 21:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subject_name`, `image`) VALUES
(10, 'Math', 'http://127.0.0.1:8000/subject/1-1702921546.jpg'),
(11, 'Science', 'http://127.0.0.1:8000/subject/11-1702921577.png'),
(12, 'Sport', 'http://127.0.0.1:8000/subject/12-1702921588.png');

-- --------------------------------------------------------

--
-- Table structure for table `tutor_registration`
--

DROP TABLE IF EXISTS `tutor_registration`;
CREATE TABLE IF NOT EXISTS `tutor_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `standard` text NOT NULL,
  `subject` text NOT NULL,
  `monthly_fees` text NOT NULL,
  `university` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `year_of_experience` int(11) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `latitude` text NOT NULL,
  `longitude` text NOT NULL,
  `tuition_type` int(11) NOT NULL,
  `m_hours` text NOT NULL,
  `a_hours` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor_registration`
--

INSERT INTO `tutor_registration` (`id`, `email`, `standard`, `subject`, `monthly_fees`, `university`, `location`, `year_of_experience`, `mobile_no`, `latitude`, `longitude`, `tuition_type`, `m_hours`, `a_hours`, `datetime`) VALUES
(10, 'maxiq2024@gmail.com', '9', '10,11', '10,20', 'Smart', 'Suly', 12, 1, '37.4219983', '-122.084', 3, '16', '', '2024-01-05 12:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `firebase_id` varchar(300) DEFAULT NULL,
  `fcm_token` varchar(300) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `user_type` varchar(250) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `facebook_user_id` text DEFAULT NULL,
  `forgot_pass_token` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `image`, `firebase_id`, `fcm_token`, `reg_date`, `user_type`, `type`, `password`, `facebook_user_id`, `forgot_pass_token`, `updated_at`, `created_at`) VALUES
(42, 'Test Teacher', 'maxiq2024@gmail.com', NULL, NULL, 'dro64Z8gTiqmP23-nMK1O5:APA91bEuXu20wnZ5IpKQVsOJTMJRSQa7MP1hHaYD5PFcjGZplyAr6DZ1SBlxwYTYQ16z41OlkQbX7aoMBLRr3-5SMeL7k9xJgVkKIb96Xo5TMbsVQOXuNf-7HccejRkEOqU2B3acJYKN', '2023-12-18 19:44:49', 'normal', 'tutor', '$2y$10$GLeBj2RYWe36ouUZFMRLReuK2T0I1axumvHewr6dhZ4FQdyU2U0pC', NULL, NULL, '2024-01-05 13:06:47', '2024-01-05 13:06:47'),
(44, 'ahmad.m.yahya@gmail.com', 'ahmad.m.yahya@gmail.com', NULL, NULL, 'dro64Z8gTiqmP23-nMK1O5:APA91bEuXu20wnZ5IpKQVsOJTMJRSQa7MP1hHaYD5PFcjGZplyAr6DZ1SBlxwYTYQ16z41OlkQbX7aoMBLRr3-5SMeL7k9xJgVkKIb96Xo5TMbsVQOXuNf-7HccejRkEOqU2B3acJYKN', '2024-01-02 00:20:00', 'normal', 'student', '$2y$10$4ear0PeCI3coepqeczr6f.HEhQxDMjfgOyuFqj89SvIB6jn5GULPy', NULL, NULL, '2024-01-05 13:52:01', '2024-01-05 13:52:01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
