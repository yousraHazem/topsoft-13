-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 08, 2013 at 07:09 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cake`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `comment` text NOT NULL,
  `guest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKid` (`guest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `guest_id`) VALUES
(4, 'sarah', 'sarah@gmail.com', 'nice!', 6),
(5, 'lina', 'lina@gmail.com', 'hiiii', 7);

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `name`, `user_id`) VALUES
(3, 'sarah''s book', 1),
(6, 'lina''s book', 4),
(7, 'new book', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `posts` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `posts`) VALUES
(1, 'edit'),
(2, 'yasmin'),
(3, 'third'),
(4, 'forth'),
(9, 'amina');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'sarah@gmail.com', '78d67bc946c91f7360fe297c78d197a1c381cc4d'),
(2, 'amina@gmail.com', '78d67bc946c91f7360fe297c78d197a1c381cc4d'),
(3, 'yasmin@gmail.com', '78d67bc946c91f7360fe297c78d197a1c381cc4d'),
(4, 'lina@gmail.com', '78d67bc946c91f7360fe297c78d197a1c381cc4d'),
(5, 'nadine@gmail.com', '78d67bc946c91f7360fe297c78d197a1c381cc4d');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FKid` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
