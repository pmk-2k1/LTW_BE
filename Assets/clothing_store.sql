-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 08:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CustomerID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Count` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Content` varchar(500) NOT NULL,
  `Main` tinyint(1) NOT NULL DEFAULT 0,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Material` varchar(1000) DEFAULT NULL,
  `Style` varchar(1000) DEFAULT NULL,
  `Album` varchar(1000) DEFAULT NULL,
  `Model` varchar(1000) DEFAULT NULL,
  `Connect` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Is_active`, `Name`, `Type`, `Price`, `Quantity`, `Description`, `Material`, `Style`, `Album`, `Model`, `Connect`) VALUES
('219971e4-a0c4-4699-bbed-5ce8ba211175', 1, 'ĐẦM HỌA TIẾT TAY RỦ D43262', 'Đầm', '599000.00000', '40', '', 'Vải tổng hợp cao cấp', 'Đầm thiết kế dáng chữ A dài qua gối, tay rủ, tone màu trắng kết hợp họa tiết in', 'NEM NEW', 'Mặc sản phẩm size 2', ''),
('4090ac8e-d1b1-4479-836e-09c63eb822d2', 1, 'ĐẦM SUÔNG ĐỎ TAY RỦ D02002', 'Đầm', '1399000.00000', '60', '', 'Vải tổng hợp cao cấp', 'Đầm thiết kế dáng suông dài qua gối, tay rủ, tone màu đỏ kết hợp họa tiết hoa thêu', 'NEM NEW', 'Mặc sản phẩm size 2', ''),
('420f1322-8d35-4290-b909-6b1f7abc739f', 1, 'SƠ MI CỔ NƠ SM18212', 'Áo sơ mi', '799000.00000', '160', '', 'Vải tổng hợp cao cấp', 'Áo sơ mi thiết kế tay lỡ, tone màu hồng nhat, cổ phối nơ thắt cách điệu', 'NEM NEW', 'Mặc sản phẩm size 2', 'Chân váy Z08302'),
('4459e863-fd78-4ded-b5a0-28fa9580ce37', 1, 'QUẦN CÔNG SỞ Q43242', 'Quần Dài', '429000.00000', '70', '', 'Vải tổng hợp cao cấp', 'Quần dài thiết kế cạp cao, ống đứng, tone màu đen trơn, xếp li phía trước', 'NEM NEW', 'mặc sản phẩm size 2', 'áo SM42552'),
('4626c92a-5c3c-46b4-b25b-1eb558970c8a', 1, 'ÁO DÀI ĐÍNH HOA AD09182', 'Áo dài', '1899000.00000', '80', 'Phù hợp: lễ tết, cưới hỏi, đi sự kiện, tạo vẻ trẻ trung, duyên dáng cho người mặc.', 'Vải tổng hợp cao cấp', 'Áo dài thiết kế tay bồng, tone màu trắng, kết hợp họa tiết hoa thêu đính', 'NEM NEW', 'Mặc sản phẩm size 2', 'Quần Q09192'),
('4a125cf4-c3a8-4dc8-bde3-2a3473f98681', 1, 'SƠ MI OVERSIZE SM19562', 'Áo sơ mi', '999000.00000', '160', 'Lưu ý: sản phẩm không kèm đai', 'Vải tổng hợp cao cấp', 'Áo sơ mi thiết kế dáng rộng, cổ bẻ, tone màu xanh ', 'NEM NEW', 'mặc sản phẩm size 2', 'Quần Q67052'),
('4b649904-35ed-4e52-a3b7-eca925837959', 1, 'CHÂN VÁY BÚT CHÌ Z189022', 'Chân váy', '799000.00000', '20', '', 'Vải tổng hợp cao cấp', '​chân váy bút chì cạp cao,vạt chéo, tone màu đen trơn', 'NEM NEW', 'mặc sản phẩm size 2', 'Áo SM06932'),
('5021a009-4f4c-479f-a97e-87425b1a85e2', 1, 'CHÂN VÁY REN XẾP LI Z19322', 'Chân váy', '899000.00000', '20', 'Mặc mát, thích hợp vào mùa hè', 'Vải ren cao cấp', '​chân váy midi xếp li dài qua gối,  tone màu xanh đậm', 'NEM NEW', 'mặc sản phẩm size 2', 'Áo SM19312'),
('608f0956-8d2b-4c27-bf85-8908f5b1cdf7', 1, 'ĐẦM LIỀN ĐÍNH HOA 3D D20362', 'Đầm', '1399000.00000', '40', '', 'Vải tổng hợp cao cấp', 'Đầm liền thiết kế dáng ôm dài qua gối, tay bồng, tone màu xanh trơn kết hợp hoa 3D đính nổi', 'NEM NEW', 'Mặc sản phẩm size 2', ''),
('65edc9ef-6773-45df-8a0f-2949850ba645', 1, 'QUẦN SHORT XẺ GẤU Q20572', 'Quần Short', '599000.00000', '80', '', 'Vải tổng hợp cao cấp', 'Quần short thiết kế cạp cao, cạp cách điệu, tone màu vàng trơn', 'NEM NEW', 'mặc sản phẩm size 2', 'áo TS60012'),
('6796cad8-04b8-4258-8048-6d44b08d9b5e', 1, 'SƠ MI TRẮNG ĐÍNH HOA NỔI D19412', 'Áo sơ mi', '799000.00000', '80', '', 'Vải tổng hợp cao cấp', 'Áo thiết kế dài tay, cổ bẻ, tone màu trắng kết hợp hoa 3D đính nổi', 'NEM NEW', 'Mặc sản phẩm size 2', 'Chân váy Z20602'),
('80333cd7-ae8b-4fed-957d-62939c4d3d5f', 1, 'BỘ MẶC NHÀ HOA XANH HW03652', 'Set bộ', '599000.00000', '60', '', 'Vải tổng hợp cao cấp', 'Bộ mặc nhà bao gồm áo không tay và quần short, kết hợp họa tiết hoa xanh', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7', 1, 'JUMPSUIT CHẤM BI DÁNG DÀI J04882', 'Jumpsuit', '1399000.00000', '60', '', 'Vải tổng hợp cao cấp', 'Jumpsuit thiết kế ống rộng, cổ bẻ, tone màu đen kết hợp họa tiết chấm bi', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('96934f7d-90c5-4c5e-a52e-633cf6123650', 1, 'ÁO DÀI THÊU HOA AD09942', 'Áo dài', '1759000.00000', '80', 'Phù hợp: lễ tết, cưới hỏi, đi sự kiện, tạo vẻ trẻ trung, duyên dáng cho người mặc.', 'Vải tổng hợp cao cấp', 'Áo dài thiết kế dài tay, tone màu vàng kết hợp họa tiết hoa thêu', 'NEM NEW', 'Mặc sản phẩm size 2', 'Quần Q10882'),
('a579b747-778f-4baa-a93c-eeec5eefa9d0', 1, 'JUMPSUIT DÁNG NGẮN J01302', 'Jumpsuit', '799000.00000', '50', 'Phù hợp: đi làm, sự kiện, hay đi dạo phố, tạo vẻ trẻ trung nữ tính cho người mặc.', 'Vải tổng hợp cao cấp', 'Jumpsuit thiết kế dáng ngắn, không tay, cổ đáp chéo, tone màu đỏ kết hợp họa tiết hoa nhí', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('b89e62d5-b4f1-4f14-bbca-d88efc58447a', 1, 'ĐẦM REN TAY RỦ D19502', 'Đầm', '1599000.00000', '20', 'Lưu ý: sản phẩm không kèm đai', 'vải ren cao cấp', 'đầm thiết kế dáng chữ A dài qua gối, cổ tròn,tay rủ, tone màu nâu be trơn', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('ba09f81e-e926-49bb-8901-20df5e157626', 1, 'ÁO DÀI HỌA TIẾT AD15902', 'Áo Dài', '1499000.00000', '100', '', 'Vải tổng hợp cao cấp', 'Áo dài thiết kế dài tay, tone nền màu nâu kết hợp họa tiết in nổi bật', 'NEM NEW', 'mặc sản phẩm size 2', 'quần Q17292'),
('c6d4928e-5dd2-4619-b597-f531325895fa', 1, 'ÁO DÀI HOA AD10872', 'Áo dài', '1499000.00000', '80', '', 'Vải tổng hợp cao cấp', 'Áo dài thiết kế tone màu xanh kết hợp họa tiết hoa in', 'NEM NEW', 'Mặc sản phẩm size 2', 'Quần Q09102'),
('d28c6612-0006-47f2-92b0-3b4856822323', 1, 'ĐẦM ĐEN TAY BỒNG D19162', 'Đầm', '1399000.00000', '20', 'Lưu ý: sản phẩm không kèm đai', 'Vải tổng hợp cao cấp', 'Đầm thiết kế dáng chữ A dài qua gối, tone màu đen trơn', 'NEM', 'mặc sản phẩm size 2', ''),
('d79d5531-bc03-4a83-ad5b-ad012aa1afa6', 1, 'JUMPSUIT CỔ VEST J09262', 'Jumpsuit', '999000.00000', '20', 'Phù hợp: đi làm, sự kiện, hay đi dạo phố, tạo vẻ trẻ trung nữ tính cho người mặc.', 'Vải tổng hợp cao cấp', 'Jumpsuit thiết kế dáng ngắn, tone màu xanh trơn, cổ bẻ 2 ve', 'NEM NEW', 'Mặc sản phẩm size 2', ''),
('e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d', 1, 'SƠ MI REN SM00292', 'Áo sơ mi', '799000.00000', '160', 'Lưu ý: sản phẩm không kèm đai', 'vải ren cao cấp', 'Áo thiết kế vai bồng, cổ tròn, tone màu đen trơn ', 'NEM', 'Mặc sản phẩm size 2', 'Quần Q00302'),
('e9be9e63-0702-4bc2-b3df-01d766cabf4e', 1, 'JUMPSUIT HOA DÁNG NGẮN J01292', 'Jumpsuit', '999000.00000', '50', 'Phù hợp: đi làm, sự kiện, hay đi dạo phố, tạo vẻ trẻ trung nữ tính cho người mặc.', 'Vải tổng hợp cao cấp', 'Jumpsuit thiết kế dáng ngắn, nền màu trắng trơn kết hợp họa tiết hoa in nổi bật, eo phối đai cùng tone màu', 'NEM NEW', 'Mặc sản phẩm size 2', ''),
('f1d6cc6d-becb-4f18-8ccf-398a70ee9d2d', 1, 'ÁO DÀI NHUNG ĐÍNH HOA 3D AD12852', 'Áo Dài', '449700.00000', '50', '', 'Vải nhung cao cấp', 'Áo dài thiết kế tone màu đỏ đô, phần cổ đính voan, đính hoa 3D bản to', 'NEM NEW', 'mặc sản phẩm size 2', 'quần Q12862'),
('f9f311c5-62f8-41e1-a5d6-defa0abd634b', 1, 'QUẦN JEANS CẠP PHỐI CHUN Q67012', 'Quần Jeans', '599000.00000', '80', 'Phù hợp đi làm, đi sự kiện, hay đi dạo phố, tạo vẻ trẻ trung, hiện đại cho người mặc.', 'Vải jeans cao cấp', 'Quần jeans thiết kế dáng ống đứng, độ dài trên mắt cá chân, cạp phối chun', 'NEM NEW', 'mặc sản phẩm size 2', 'áo phông TS60042'),
('fe85aefc-94cd-4c6c-961d-9d8aaa418dff', 1, 'ÁO THIẾT KẾ TAY BỒNG SM40122', 'Áo sơ mi', '399000.00000', '80', '', 'Vải tổng hợp cao cấp', 'Áo thiết kế tay bồng, tone màu xanh nhạt, cài khuy bọc phía trước', 'NEM NEW', 'Mặc sản phẩm size 2', 'Chân váy Z40112');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
