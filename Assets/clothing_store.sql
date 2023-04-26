-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 09:01 AM
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
-- Database: `clothing_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1,
  `Total` decimal(20,5) NOT NULL DEFAULT 0.00000,
  `Time` datetime NOT NULL,
  `Pay_method` varchar(10) NOT NULL DEFAULT 'Momo',
  `Note` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `CustomerID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `BillID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `Price_item` decimal(20,5) NOT NULL DEFAULT 0.00000,
  `Size` int(2) NOT NULL,
  `Color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Rate` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CustomerID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Count` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Is_active` tinyint(1) NOT NULL DEFAULT 1,
  `Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Phone_number` varchar(12) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` char(32) NOT NULL,
  `Gender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'male',
  `Role` varchar(8) NOT NULL DEFAULT 'customer',
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `Is_active`, `Name`, `Phone_number`, `Email`, `Password`, `Gender`, `Role`, `Address`, `Birthday`) VALUES
('1e70288b-d156-11ed-a5a2-089798e3fef0', 1, 'Hoàng Cao Chí', '0912345678', 'fhdsjkalfsad@gmail.com', 'a@D12345678901234567890123456789', 'male', 'customer', NULL, NULL),
('31100e15-7931-423d-be78-a10ab488641a', 1, 'Nguyen Van A', '0123456984', '', 'e10adc3949ba59abbe56e057f20f883e', 'male', 'customer', '', NULL),
('AFFE02B6-E596-CD3D-E142-9E741E22477B', 1, 'Trần Phàm', '0987654123', 'tran@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'male', 'manager', '', '0000-00-00'),
('b4b97558-8bf3-425d-a26f-bf6dd5a2bb13', 1, 'Nguyen Van A', '0123456987', '', '25f9e794323b453885f5181f1b624d0b', 'male', 'customer', '', NULL),
('c1323099-cc4d-451f-95be-46a68c9d1bfb', 1, 'Nguyen Van A', '0123456985', '', 'e10adc3949ba59abbe56e057f20f883e', 'male', 'customer', '', NULL),
('cae1da1c-1ba0-4670-875f-84fd67eed92b', 1, 'Nguyen Van A', '01234569876', '', 'e10adc3949ba59abbe56e057f20f883e', 'male', 'customer', '', NULL),
('fbb9e56e-cd26-42aa-a07d-5b3cb3e88815', 1, 'Nguyen B', '0123456135', 'nguyenb@gmail.com', '5baf03061fefc117e70984026e543e04', 'male', 'manager', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `CustomerID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Start_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Content` mediumblob NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`Id`, `Content`, `ProductID`) VALUES
('0bff9c13-9bca-4c60-9fac-b44a4b070d47', 0x443a58414d5050096d70706870333330332e746d70, '73fe9634-5c32-4571-a1c6-ca3d7ce5ee4e'),
('12df0186-1886-4b77-9a50-7abcacaaca90', 0x443a58414d5050096d70706870434336322e746d70, '82306123-643e-400e-bfdc-d8b6b7848abf'),
('141e8966-57ba-4011-8a77-58e591a24b0b', 0x443a58414d5050096d70706870393839332e746d70, 'cfd97690-9690-4ce0-bee2-f2f933e78f2a'),
('19c06a82-be3f-4f72-b037-3e9578e6db54', 0x443a58414d5050096d70706870363531422e746d70, '68819863-7f7a-4493-a808-4b657e7da961'),
('1ea6be97-a10d-4ad5-8cdf-7a317ec134b4', 0x443a58414d5050096d70706870453132342e746d70, '82306123-643e-400e-bfdc-d8b6b7848abf'),
('24f0f6fe-9a0e-4aad-9bd0-c1da49f98fcf', 0x443a58414d5050096d70706870423543432e746d70, '82306123-643e-400e-bfdc-d8b6b7848abf'),
('2c50f41c-52a0-4651-854e-9f622498a4cb', 0x443a58414d5050096d70706870334333372e746d70, '9e8f2fca-5d7d-4556-8b33-4c39ff272ff7'),
('32375cb9-c591-4077-9972-b956007545b5', 0x443a58414d5050096d70706870313742412e746d70, '73fe9634-5c32-4571-a1c6-ca3d7ce5ee4e'),
('4a40c368-c0bf-4f0e-b904-b578adc89657', 0x443a58414d5050096d70706870394344372e746d70, '001cd400-b52a-46b2-8993-050639d5f7c4'),
('77e286eb-48fe-4da0-898d-76db56f106c0', 0x443a58414d5050096d70706870344334392e746d70, '73fe9634-5c32-4571-a1c6-ca3d7ce5ee4e'),
('7a507bb3-046e-4582-9787-ee742d21065c', 0x443a58414d5050096d70706870443041392e746d70, '2a385955-39ea-44a3-be16-9be55e4540de'),
('7c1030da-48e8-4da3-a5f4-26f230cbaeaf', 0x443a58414d5050096d70706870344546352e746d70, '9e8f2fca-5d7d-4556-8b33-4c39ff272ff7'),
('7fc4a0fa-07e9-43e6-a7df-86dd1d2d8534', 0x443a58414d5050096d70706870323231352e746d70, '5e1848c8-0348-47a6-bef6-e164f670ab12'),
('84273b29-05c1-4c74-ac90-3b5423a94bd9', 0x443a58414d5050096d70706870423439382e746d70, 'cfd97690-9690-4ce0-bee2-f2f933e78f2a'),
('8735debd-3af0-491c-8cba-0d9dc0982683', 0x443a58414d5050096d70706870374138382e746d70, '68819863-7f7a-4493-a808-4b657e7da961'),
('8c46faf9-0702-4785-887d-08914b2b1d84', 0x443a58414d5050096d70706870394232462e746d70, '2a385955-39ea-44a3-be16-9be55e4540de'),
('b1b3c7d9-adf7-4a01-b94f-f30f12748af5', 0x443a58414d5050096d70706870394438332e746d70, '68819863-7f7a-4493-a808-4b657e7da961'),
('bcff31d1-18c4-455c-9e96-d9b1887eebe3', 0x443a58414d5050096d70706870383137302e746d70, 'cfd97690-9690-4ce0-bee2-f2f933e78f2a'),
('bf00cf46-259b-4882-8c77-88ca52d1e8c7', 0x443a58414d5050096d70706870423943342e746d70, '2a385955-39ea-44a3-be16-9be55e4540de'),
('c0553c04-24a1-4248-8fc5-a7fcfb5400dc', 0x443a58414d5050096d70706870353338382e746d70, '5e1848c8-0348-47a6-bef6-e164f670ab12'),
('ccb29707-4bfe-4d60-a2c9-b2241d0ba249', 0x443a58414d5050096d70706870334137312e746d70, '5e1848c8-0348-47a6-bef6-e164f670ab12'),
('e20013bf-746b-48df-b9b6-f3d6849f2e78', 0x443a58414d5050096d70706870423346412e746d70, '001cd400-b52a-46b2-8993-050639d5f7c4'),
('e8cfebf1-b6d6-4182-adf5-644569868acf', 0x443a58414d5050096d70706870323131442e746d70, '9e8f2fca-5d7d-4556-8b33-4c39ff272ff7'),
('efa2fa54-8eff-4afa-bf94-a9fa6bb70aef', 0x443a58414d5050096d70706870383635312e746d70, '001cd400-b52a-46b2-8993-050639d5f7c4');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0,
  `Start_date` datetime DEFAULT NULL,
  `End_date` datetime DEFAULT NULL,
  `Content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Is_active` tinyint(1) NOT NULL DEFAULT 1,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Price` decimal(20,5) NOT NULL,
  `Quantity` decimal(10,0) NOT NULL DEFAULT 0,
  `Description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Is_active`, `Name`, `Type`, `Price`, `Quantity`, `Description`) VALUES
('001cd400-b52a-46b2-8993-050639d5f7c4', 1, 'Đầm vàng', 'Đầm', '600000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('2a385955-39ea-44a3-be16-9be55e4540de', 1, 'Sơ mi', 'Áo', '400000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('5e1848c8-0348-47a6-bef6-e164f670ab12', 1, 'Đầm hồng', 'Đầm', '450000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('68819863-7f7a-4493-a808-4b657e7da961', 1, 'Áo vest', 'Áo', '1200000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('73fe9634-5c32-4571-a1c6-ca3d7ce5ee4e', 1, 'Áo dài', 'Áo', '1200000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('749dc53a-e383-11ed-901c-089798e3fef0', 1, 'Quần short', 'Quần', '12000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('749dee01-e383-11ed-901c-089798e3fef0', 1, 'Áo blue', 'Áo', '120000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('81d2876a-e383-11ed-901c-089798e3fef0', 1, 'Quần dài', 'Quần', '12000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('82306123-643e-400e-bfdc-d8b6b7848abf', 1, 'Áo len', 'Áo', '1200000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('8be77bbf-e383-11ed-901c-089798e3fef0', 1, 'Quần tây', 'Quần', '120000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('9c017aad-e383-11ed-901c-089798e3fef0', 1, 'Áo phông', 'Áo', '120000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('9e8f2fca-5d7d-4556-8b33-4c39ff272ff7', 1, 'Quần đen', 'Quần', '300000.00000', '20', 'Mặc mát, thích hợp vào mùa hè'),
('cfd97690-9690-4ce0-bee2-f2f933e78f2a', 1, 'Quần kaki', 'Quần', '360000.00000', '20', 'Mặc mát, thích hợp vào mùa hè');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Is_active` tinyint(1) NOT NULL DEFAULT 1,
  `Percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Start_date` datetime NOT NULL,
  `End_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CustomerID` (`CustomerID`) USING BTREE;

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`BillID`,`ProductID`),
  ADD KEY `BillID` (`BillID`),
  ADD KEY `FK_bill_detail_product` (`ProductID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CustomerID`,`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `FK_cart_product` (`ProductID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Phone_number` (`Phone_number`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`CustomerID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`) USING BTREE;

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_image_product` (`ProductID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`Id`);

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `FK_bill_detail_bill` FOREIGN KEY (`BillID`) REFERENCES `bill` (`Id`),
  ADD CONSTRAINT `FK_bill_detail_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cart_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_feedback_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_feedback_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_image_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
