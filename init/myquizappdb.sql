-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 05:52 PM
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
-- Database: `myquizappdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Answer_text` text NOT NULL,
  `Correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`_id`, `Question_id`, `Answer_text`, `Correct`) VALUES
(0, 0, '1066', 1),
(1, 0, '1939', 0),
(2, 0, '45', 0),
(3, 0, '1010', 0),
(4, 1, '6', 1),
(5, 1, '0', 0),
(6, 1, '64', 0),
(7, 1, '8', 0),
(8, 2, '1 0r 0', 1),
(9, 2, 'Only 7', 0),
(10, 2, 'Anything from one to 10', 0),
(11, 2, 'No value at all', 0),
(12, 3, '4', 1),
(13, 3, 'A half', 0),
(14, 3, '7', 0),
(15, 3, '64', 0),
(16, 4, '8', 1),
(17, 4, '64', 0),
(18, 4, '128', 0),
(19, 4, '1024', 0),
(20, 5, '255', 1),
(21, 5, '10000000', 0),
(22, 5, '42', 0),
(23, 5, '256', 0),
(24, 6, '1 KiloByte', 1),
(25, 6, '1 GigaByte', 0),
(26, 6, '4 KiloBytes', 0),
(27, 6, '1 Elephant', 0);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `_id` int(11) NOT NULL,
  `Quiz_id` int(11) NOT NULL,
  `Question_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`_id`, `Quiz_id`, `Question_text`) VALUES
(0, 0, 'What year was The Battle of Hastings?'),
(1, 0, 'How many different wives did Henry VIII have?'),
(2, 1, 'What values can a bit hold?'),
(3, 1, 'How many bits make a nibble?'),
(4, 1, 'How many bits are there in a byte?'),
(5, 1, 'What is the biggest value a byte can hold?'),
(6, 1, '1024 bytes equals what?');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `_id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Description` text NOT NULL,
  `Num_Quests` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`_id`, `Name`, `Description`, `Num_Quests`) VALUES
(0, 'History', 'A short quiz on general history.', 2),
(1, 'Bits and Bytes', 'A short quiz about basic data quantities', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `Question_id` (`Question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `Quiz_id` (`Quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
