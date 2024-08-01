-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2024 at 07:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thegamingconsole`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Member` tinyint(1) DEFAULT NULL,
  `Fee` decimal(10,2) DEFAULT NULL,
  `PrePaid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `SessionID`, `CustomerID`, `Date`, `Member`, `Fee`, `PrePaid`) VALUES
(1, 1, 1, '2023-10-21', 0, NULL, NULL),
(2, 1, 2, '2023-10-21', 0, 1000.00, 0),
(3, 1, 3, '2023-10-21', 0, 900.00, 0),
(4, 1, 4, '2023-10-25', 0, 1000.00, 0),
(5, 2, 5, '2023-10-21', 0, 450.00, 0),
(6, 4, 6, '2023-10-06', 0, 450.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `consolemachine`
--

CREATE TABLE `consolemachine` (
  `ConsoleID` int(11) DEFAULT NULL,
  `MachineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consoles`
--

CREATE TABLE `consoles` (
  `ConsoleID` int(11) NOT NULL,
  `ConsoleName` varchar(50) DEFAULT NULL,
  `PEGI` varchar(10) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consoles`
--

INSERT INTO `consoles` (`ConsoleID`, `ConsoleName`, `PEGI`, `Quantity`) VALUES
(1, 'PS1', 'PG', 3),
(2, 'PS2', 'PG', 2),
(3, 'PS4', 'PG', 3),
(4, 'Nintendo Switch', 'PG', 2),
(5, 'Xbox 360', '15', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `MemberType` varchar(20) DEFAULT NULL,
  `MembershipFee` decimal(10,2) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Address`, `MemberType`, `MembershipFee`, `JoinDate`, `DateOfBirth`) VALUES
(1, 'Saroj', 'Upadhyay', 'Dillibazar, Kathmandu', 'Standard', 1000.00, '2023-09-01', '1998-02-01'),
(2, 'Neha', 'Kakkar', 'Putalisadak, Kathmandu', 'Premium', 14000.00, '2023-06-05', '2000-10-15'),
(3, 'Himani', 'Puri', 'Baneshwor, Kathmandu', 'Premium', 14000.00, '0000-00-00', '2001-07-20'),
(4, 'Ritesh', 'Gurung', 'Gaushala, Kathmandu', 'Standard', 1000.00, '2023-04-05', '1983-05-03'),
(5, 'Rohan', 'Jha', 'Unknown Address', 'Standard', 1000.00, '2023-09-01', '1990-01-01'),
(6, 'Ghanshyam', 'Bhat', 'Unknown Address', 'Standard', 1000.00, '2023-09-01', '1990-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `MachineID` int(11) NOT NULL,
  `Game` varchar(50) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`MachineID`, `Game`, `Year`, `Floor`) VALUES
(12, 'Pokemon', 2016, 2),
(45, 'PUBG Battlegrounds', 2004, 1),
(78, 'Grand Theft Auto', 2013, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SessionID` int(11) NOT NULL,
  `SessionDay` varchar(10) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `Floor` int(20) DEFAULT NULL,
  `SessionType` varchar(20) DEFAULT NULL,
  `FloorPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SessionID`, `SessionDay`, `StartTime`, `EndTime`, `Floor`, `SessionType`, `FloorPrice`) VALUES
(1, 'Sunday', '11:00:00', '19:00:00', 1, 'Free', 1000.00),
(2, 'Sunday', '11:00:00', '19:00:00', 2, 'Free', 500.00),
(3, 'Saturday', '11:00:00', '19:00:00', 1, 'Free', 1000.00),
(4, 'Friday', '19:00:00', '22:00:00', 2, 'Special', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `StaffName` varchar(50) DEFAULT NULL,
  `Session` int(20) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `Session`, `Role`) VALUES
(1, 'Sujal Bohara ', 1, 'cafe'),
(2, 'Rajesh Hamal', 1, 'Maintenance'),
(3, 'Rooz Ojha', 1, 'Counter'),
(4, 'Rashi Timsina', 2, 'Counter'),
(5, 'Jack Jones', 2, 'Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `consolemachine`
--
ALTER TABLE `consolemachine`
  ADD KEY `ConsoleID` (`ConsoleID`),
  ADD KEY `MachineID` (`MachineID`);

--
-- Indexes for table `consoles`
--
ALTER TABLE `consoles`
  ADD PRIMARY KEY (`ConsoleID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`MachineID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `consolemachine`
--
ALTER TABLE `consolemachine`
  ADD CONSTRAINT `consolemachine_ibfk_1` FOREIGN KEY (`ConsoleID`) REFERENCES `consoles` (`ConsoleID`),
  ADD CONSTRAINT `consolemachine_ibfk_2` FOREIGN KEY (`MachineID`) REFERENCES `machines` (`MachineID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
