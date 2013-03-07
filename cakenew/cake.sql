-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2013 at 03:36 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

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
  KEY `FKgid` (`guest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `guest_id`) VALUES
(1, 'amina', 'amina@gmail.com', 'very nice', 1),
(2, 'lina', 'lina@gmail.com', 'super', 2),
(5, 'yasmin', 'yasmin@gmail.com', 'nice', 1),
(6, 'yasmin', 'yasmin@gmail.com', 'sarah', 1),
(7, 'alkamlw', 'yasmin@gmail.comd', 'wed', 1),
(8, 'sarah', 'sarah@hotmail.com', 'nice', 2),
(9, 'amina', 'amina@gmail.com', 'a5iran?', 2),
(10, 'sarah', 'sarah@hotmail.com', 'jkdl', 1),
(11, 'amina', 'amina@gmail.com', 'comments', 1),
(12, 'amina', 'amina@gmail.com', 'comments', 1),
(13, 'amina', 'amina@gmail.com', 'aaa', 1),
(14, 'sarah', 'sarah@hotmail.com', 's', 2),
(15, 'sarah', 'sarah@hotmail.com', 's', 2),
(16, 'sarah', 'sarah@hotmail.com', 's', 2),
(17, 'medhat', 'medhat@gmail.com', 'commentt', 2),
(18, 'sarah', 'sarah@hotmail.com', 'done!', 1),
(19, 'sarah', 'sarah@hotmail.com', 'hi', 5);

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKid` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `name`, `user_id`) VALUES
(1, 'sarah''s book', 1),
(2, 'yasmin''s book', 2),
(3, 'My new book', 12),
(4, 'another new book', 12),
(5, 'another new', 12);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created`) VALUES
(1, 'The title', 'This is the post body.', '2013-03-01 11:23:30'),
(2, 'A title once again and again', 'And the post body follows.', '2013-03-01 11:23:30'),
(3, 'Title strikes back', 'This is really exciting! Not.', '2013-03-01 11:23:30'),
(4, 'Title book', 'sarah ahmed', '2013-03-01 15:53:09'),
(5, 'Title book', 'sarah ahmed', '2013-03-01 15:55:13'),
(6, 'bardo', 'new', '2013-03-01 17:42:32'),
(9, 'sarah', 'kqassq', '2013-03-01 17:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'sarah@gmail.com', '4b568e1b4e437d1354ae'),
(2, 'yasmin@gmail.com', '123456'),
(10, 'marwa@gmail.com', '4b568e1b4e437d1354ae'),
(11, 'h@gmail.com', '4b568e1b4e437d1354ae'),
(12, 'hh@gmail.com', '4b568e1b4e437d1354ae4b85d5d2da5b31bad6fc');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FKgid` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`);

--
-- Constraints for table `guests`
--
ALTER TABLE `guests`
  ADD CONSTRAINT `FKid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
