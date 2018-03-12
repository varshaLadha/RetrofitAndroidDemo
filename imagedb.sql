-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2018 at 09:23 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imagedb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser` (IN `name` VARCHAR(20))  NO SQL
UPDATE user SET avail = 0 WHERE firstname=name AND avail=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAll` ()  NO SQL
SELECT * FROM user WHERE avail=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser` (IN `name` VARCHAR(20))  READS SQL DATA
    DETERMINISTIC
SELECT * FROM user WHERE firstname = name and avail=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser` (IN `fname` VARCHAR(20), IN `lname` VARCHAR(20), IN `email` VARCHAR(20), IN `passwd` VARCHAR(20), IN `mobile` VARCHAR(20), IN `image` VARCHAR(20))  MODIFIES SQL DATA
    DETERMINISTIC
INSERT INTO `user`(`firstname`, `lastname`, `email`, `password`, `mobile`, `image`) VALUES (fname,lname,email,passwd,mobile,image)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser` (IN `fname` VARCHAR(20), IN `lname` VARCHAR(20), IN `mno` VARCHAR(10), IN `fstname` VARCHAR(20), IN `pass` VARCHAR(40))  MODIFIES SQL DATA
    DETERMINISTIC
UPDATE `user` SET `firstname`=fstname,`lastname`=lname,`password`=pass,`mobile`=mno WHERE firstname=fname AND avail=1$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `image` varchar(20) NOT NULL,
  `avail` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `mobile`, `image`, `avail`) VALUES
(14, 'Sachin', 'Ladha', 'sachin@gmail.com', '$2a$10$ablfxctLa67Byy1uthEeROsSYGI0QN/h6', '9890873443', 'sachin@gmail.com.jpg', 1),
(15, 'Harsha', 'Maheshwari', 'harsha@gmail.com', '$2a$10$l8kdQw00pdoP09TjBL0/M./36Zk/oeQ7H', '9098453345', 'harsha@gmail.com.jpg', 1),
(16, 'Varsha', 'Rathi', 'varsha@gmail.com', '$2a$10$Pht1qqxTKuk1kHPSWAZqNOQoH7diMoF5b', '9890673345', 'varsha@gmail.com.jpg', 1),
(17, 'Radha', 'Jajoo', 'radha@ymail.com', '$2a$10$r3TqEy9.WNTq3t0T2jeNZuliEaqxYupUM', '9066601230', 'radha@ymail.com.jpg', 1),
(18, 'Sweety', 'Singh', 'swty@gmail.com', '$2a$10$dJhxKkC/vGZIgIgsUoeFeuezak28aiQFA', '9890456734', 'swty@gmail.com.jpg', 1),
(20, 'Niharika', 'Singh', 'niha@yahoo.in', '$2a$10$m.SeWMrEUHJv5jlxa0Es7On05ypqPGlWY', '9003410078', 'niha@yahoo.in.jpg', 1),
(21, 'Swati', 'Ezhava', 'swati@ymail.com', '$2a$10$DY4.7soHvyNpbzC8GizwMO2.FbbgkXCG3', '7794567098', 'swati@ymail.com.jpg', 1),
(22, 'Meena', 'Joshi', 'meenu@ymail.com', '$2a$10$P5HRX6oCPGzzG', '7016084739', 'meenu@ymail.com.jpg', 1),
(23, 'Janvee', 'Patel', 'janvee@gmail.com', '$2a$10$o/hB0xQ8QLgxU', '7005934523', 'janvee@gmail.com.jpg', 1),
(26, 'Disha', 'Goyal', 'disha@yahoo.com', '$2a$10$MMNgQgPpt7BGy', '5689340796', 'disha@yahoo.com.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
