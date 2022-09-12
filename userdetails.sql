-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2022 at 05:52 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdetails`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `nationality` varchar(10) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(10) NOT NULL,
  `dob` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullName`, `address`, `nationality`, `nic`, `gender`, `age`, `dob`) VALUES
(1, 'Dilmi Kaushani', 'panadura', 'Sinhala', '985720096V', 'Female', 24, '-19/3/1998'),
(2, 'Dilmi Kaushani', 'panadura', 'Sinhala', '981733443V', 'Male', 24, '-9/6/1998'),
(3, 'Dilmi Kaushani', 'panadura', 'Sinhala', '981733443V', 'Male', 24, '-9/6/1998'),
(4, 'chamila Jeewani', 'panadura', 'Sinhala', '755921793V', 'Female', 47, '1/4/1975'),
(5, 'Thinara Pinsari', 'Colombo', 'Tamil', '199845', 'Male', 2022, '0/1/0'),
(6, 'Krishan', 'Wellawatta', 'Tamil', '660253963V', 'Male', 56, '-6/1/1966'),
(7, 'Krishan', 'Wellawatta', 'Tamil', '660253963V', 'Male', 56, '-6/1/1966'),
(8, 'Krishan', 'Wellawatta', 'Tamil', '660253963V', 'Male', 56, '-6/1/1966');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`nic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
