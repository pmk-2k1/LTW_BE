-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 08:15 AM
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
  `Content` mediumblob NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`Id`, `Content`, `ProductID`) VALUES
('06944a33-9c78-47da-88ba-335249234d7b', 0x433a78616d7070096d70706870453539392e746d70, '4b649904-35ed-4e52-a3b7-eca925837959'),
('0982e224-c5d6-4f23-b94a-7f66233cd4ab', 0x433a78616d7070096d70706870424437452e746d70, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('0c9ac50c-a9b2-4b62-ae11-f0bb6f5b1cd3', 0x433a78616d7070096d70706870414331302e746d70, '4a125cf4-c3a8-4dc8-bde3-2a3473f98681'),
('18741a51-1554-4d88-9760-dd7b3278bfb2', 0x433a78616d7070096d70706870313443462e746d70, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('29dc5ba5-14ba-4f40-96bd-fa3756ceaa1f', 0x433a78616d7070096d70706870384537442e746d70, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('33d0f864-659b-4c0e-b351-b798b999acda', 0x433a78616d7070096d70706870464436372e746d70, '4b649904-35ed-4e52-a3b7-eca925837959'),
('3bb04be2-f208-4c8b-a216-79408cfb78de', 0x433a78616d7070096d70706870353345372e746d70, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('3eeb05f4-b778-4cfc-8b3d-190f2173f633', 0x433a78616d7070096d70706870464536452e746d70, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('40e97fc5-c55f-433b-b6b7-7a0d2ab57c75', 0x433a78616d7070096d70706870333436432e746d70, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('4cac795a-13ad-49b8-8c81-10e1a7335a76', 0x433a78616d7070096d70706870453435412e746d70, '80333cd7-ae8b-4fed-957d-62939c4d3d5f'),
('53bb20ae-2969-4f3f-998a-dcb3eba4bcaa', 0x433a78616d7070096d70706870444236462e746d70, '4a125cf4-c3a8-4dc8-bde3-2a3473f98681'),
('5af88464-f684-421c-8825-c28f5a117ea7', 0x433a78616d7070096d70706870453634322e746d70, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('5cc2ab71-4f76-4e7d-b8ff-0d07e1f22792', 0x433a78616d7070096d707068703739422e746d70, 'e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d'),
('5ece174c-7a31-4f2d-b62e-daf3ea8dd4f5', 0x433a78616d7070096d707068703242432e746d70, '5021a009-4f4c-479f-a97e-87425b1a85e2'),
('61795f4d-5e78-4faa-a34f-a0f314a0449c', 0x433a78616d7070096d70706870454231352e746d70, '420f1322-8d35-4290-b909-6b1f7abc739f'),
('69716bb4-1607-4cbc-a669-df4b9fe7da6b', 0x433a78616d7070096d70706870413832302e746d70, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('6a767e6d-540a-4569-bd55-1e57f9e08019', 0x433a78616d7070096d70706870313333302e746d70, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('6c3a5baa-165d-492d-811d-b22f5f54c5e4', 0x433a78616d7070096d70706870413143452e746d70, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('700d9a10-8f3d-4a09-b548-4b46867bada5', 0x433a78616d7070096d707068704432392e746d70, 'd28c6612-0006-47f2-92b0-3b4856822323'),
('73e0f0f5-b387-4dc7-aac1-488cc05bb210', 0x433a78616d7070096d70706870413334462e746d70, '8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7'),
('77b54fbd-7de6-411d-bae3-6044806154fa', 0x433a78616d7070096d70706870373346392e746d70, 'b89e62d5-b4f1-4f14-bbca-d88efc58447a'),
('87da7aed-00ca-4d51-a048-84fbaaf2dc13', 0x433a78616d7070096d70706870453131372e746d70, 'e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d'),
('8d5d2f69-aeb7-4a05-8a75-d0308d8d889c', 0x433a78616d7070096d70706870333242352e746d70, 'd28c6612-0006-47f2-92b0-3b4856822323'),
('933a8bf0-f226-4b22-922d-4df395996963', 0x433a78616d7070096d70706870453544442e746d70, '5021a009-4f4c-479f-a97e-87425b1a85e2'),
('93808c2f-65df-4675-9f58-5c7327d60011', 0x433a78616d7070096d70706870443430442e746d70, 'b89e62d5-b4f1-4f14-bbca-d88efc58447a'),
('97be3b53-dffa-4218-87e9-910b9d7903ea', 0x433a78616d7070096d70706870424632432e746d70, '4a125cf4-c3a8-4dc8-bde3-2a3473f98681'),
('9ef6295c-fff2-44f9-87b2-4a6121e36d57', 0x433a78616d7070096d70706870433836422e746d70, '4b649904-35ed-4e52-a3b7-eca925837959'),
('9f4dd241-3e0a-4210-b3c1-b8f8753b3054', 0x433a78616d7070096d70706870333441452e746d70, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('a1fb1178-60f0-46fc-9841-d02604cb8d3a', 0x433a78616d7070096d70706870323445442e746d70, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('a6323b8a-c092-4295-a345-6324f7f48db7', 0x433a78616d7070096d70706870314543312e746d70, '5021a009-4f4c-479f-a97e-87425b1a85e2'),
('a7091c6c-594e-482a-b1ae-25c05dbcc1f9', 0x433a78616d7070096d70706870453737432e746d70, '65edc9ef-6773-45df-8a0f-2949850ba645'),
('a8a8395f-c8d8-4b1f-bb66-80701bd86556', 0x433a78616d7070096d70706870363534442e746d70, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('a926f688-241d-4082-be7d-302248f043ef', 0x433a78616d7070096d70706870314538302e746d70, 'd28c6612-0006-47f2-92b0-3b4856822323'),
('b0c6748c-a29f-447e-af49-9c3b143c9cb6', 0x433a78616d7070096d70706870324338392e746d70, 'e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d'),
('b73c266c-0367-48b9-a808-d722a442a76a', 0x433a78616d7070096d70706870353446352e746d70, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('b97a9caa-bf7b-4ad0-b800-195e85e72209', 0x433a78616d7070096d707068704132372e746d70, '420f1322-8d35-4290-b909-6b1f7abc739f'),
('d647f03a-e72a-401d-a6ad-d53532ed7fc2', 0x433a78616d7070096d707068703832462e746d70, '80333cd7-ae8b-4fed-957d-62939c4d3d5f'),
('d9510907-1a07-49d0-8914-3c3306fbe232', 0x433a78616d7070096d70706870323343422e746d70, '420f1322-8d35-4290-b909-6b1f7abc739f'),
('da17539c-054b-4fb3-87f6-065a0fe35d7a', 0x433a78616d7070096d707068703637452e746d70, '65edc9ef-6773-45df-8a0f-2949850ba645'),
('da7c9bdb-4410-441c-b044-a3e6f410f084', 0x433a78616d7070096d70706870373836392e746d70, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('dc2f4349-b77e-4380-8afa-f919c04415d0', 0x433a78616d7070096d70706870354534352e746d70, '8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7'),
('de3cfda0-5e0d-4d3f-bec7-d2376fa10b0d', 0x433a78616d7070096d70706870383335322e746d70, '8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7'),
('e0f885ce-92f3-4079-853c-683215e0bb84', 0x433a78616d7070096d70706870413346332e746d70, 'b89e62d5-b4f1-4f14-bbca-d88efc58447a'),
('e32e838f-a19d-4047-a758-62c2b2b8bd7c', 0x433a78616d7070096d70706870314437322e746d70, '65edc9ef-6773-45df-8a0f-2949850ba645'),
('f3a822c4-155d-4db0-b178-4627ac0ca417', 0x433a78616d7070096d70706870313437462e746d70, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('f5171c4e-0609-4abd-91dd-8c590749d5b8', 0x433a78616d7070096d70706870434139372e746d70, '80333cd7-ae8b-4fed-957d-62939c4d3d5f');

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
('420f1322-8d35-4290-b909-6b1f7abc739f', 1, 'SƠ MI CỔ NƠ SM18212', 'Áo Somi', '799000.00000', '160', '', 'Vải tổng hợp cao cấp', 'Áo sơ mi thiết kế tay lỡ, tone màu hồng nhat, cổ phối nơ thắt cách điệu', 'NEM NEW', 'mặc sản phẩm size 2', 'chân váy Z08302'),
('4459e863-fd78-4ded-b5a0-28fa9580ce37', 1, 'QUẦN CÔNG SỞ Q43242', 'Quần Dài', '429000.00000', '70', '', 'Vải tổng hợp cao cấp', 'Quần dài thiết kế cạp cao, ống đứng, tone màu đen trơn, xếp li phía trước', 'NEM NEW', 'mặc sản phẩm size 2', 'áo SM42552'),
('4a125cf4-c3a8-4dc8-bde3-2a3473f98681', 1, 'SƠ MI OVERSIZE SM19562', 'Áo Somi', '999000.00000', '160', 'Lưu ý: sản phẩm không kèm đai', 'Vải tổng hợp cao cấp', 'Ao sơ mi thiết kế dáng rộng, cổ bẻ, tone màu xanh ', 'NEM NEW', 'mặc sản phẩm size 2', 'quần Q67052'),
('4b649904-35ed-4e52-a3b7-eca925837959', 1, 'CHÂN VÁY BÚT CHÌ Z189022', 'Chân váy', '799000.00000', '20', '', 'Vải tổng hợp cao cấp', '​chân váy bút chì cạp cao,vạt chéo, tone màu đen trơn', 'NEM NEW', 'mặc sản phẩm size 2', 'Áo SM06932'),
('5021a009-4f4c-479f-a97e-87425b1a85e2', 1, 'CHÂN VÁY REN XẾP LI Z19322', 'Chân váy', '899000.00000', '20', 'Mặc mát, thích hợp vào mùa hè', 'Vải ren cao cấp', '​chân váy midi xếp li dài qua gối,  tone màu xanh đậm', 'NEM NEW', 'mặc sản phẩm size 2', 'Áo SM19312'),
('65edc9ef-6773-45df-8a0f-2949850ba645', 1, 'QUẦN SHORT XẺ GẤU Q20572', 'Quần Short', '599000.00000', '80', '', 'Vải tổng hợp cao cấp', 'Quần short thiết kế cạp cao, cạp cách điệu, tone màu vàng trơn', 'NEM NEW', 'mặc sản phẩm size 2', 'áo TS60012'),
('80333cd7-ae8b-4fed-957d-62939c4d3d5f', 1, 'BỘ MẶC NHÀ HOA XANH HW03652', 'Set bộ', '599000.00000', '60', '', 'Vải tổng hợp cao cấp', 'Bộ mặc nhà bao gồm áo không tay và quần short, kết hợp họa tiết hoa xanh', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7', 1, 'JUMPSUIT CHẤM BI DÁNG DÀI J04882', 'Jumpsuit', '1399000.00000', '60', '', 'Vải tổng hợp cao cấp', 'Jumpsuit thiết kế ống rộng, cổ bẻ, tone màu đen kết hợp họa tiết chấm bi', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('b89e62d5-b4f1-4f14-bbca-d88efc58447a', 1, 'ĐẦM REN TAY RỦ D19502', 'Đầm', '1599000.00000', '20', 'Lưu ý: sản phẩm không kèm đai', 'vải ren cao cấp', 'đầm thiết kế dáng chữ A dài qua gối, cổ tròn,tay rủ, tone màu nâu be trơn', 'NEM NEW', 'mặc sản phẩm size 2', ''),
('ba09f81e-e926-49bb-8901-20df5e157626', 1, 'ÁO DÀI HỌA TIẾT AD15902', 'Áo Dài', '1499000.00000', '100', '', 'Vải tổng hợp cao cấp', 'Áo dài thiết kế dài tay, tone nền màu nâu kết hợp họa tiết in nổi bật', 'NEM NEW', 'mặc sản phẩm size 2', 'quần Q17292'),
('d28c6612-0006-47f2-92b0-3b4856822323', 1, 'ĐẦM ĐEN TAY BỒNG D19162', 'Đầm', '1399000.00000', '20', 'Lưu ý: sản phẩm không kèm đai', 'Vải tổng hợp cao cấp', 'Đầm thiết kế dáng chữ A dài qua gối, tone màu đen trơn', 'NEM', 'mặc sản phẩm size 2', ''),
('e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d', 1, 'SƠ MI REN SM00292', 'Áo Somi', '799000.00000', '160', 'Lưu ý: sản phẩm không kèm đai', 'vải ren cao cấp', 'Áo thiết kế vai bồng, cổ tròn, tone màu đen trơn ', 'NEM', 'mặc sản phẩm size 2', 'quần Q00302'),
('f1d6cc6d-becb-4f18-8ccf-398a70ee9d2d', 1, 'ÁO DÀI NHUNG ĐÍNH HOA 3D AD12852', 'Áo Dài', '449700.00000', '50', '', 'Vải nhung cao cấp', 'Áo dài thiết kế tone màu đỏ đô, phần cổ đính voan, đính hoa 3D bản to', 'NEM NEW', 'mặc sản phẩm size 2', 'quần Q12862'),
('f9f311c5-62f8-41e1-a5d6-defa0abd634b', 1, 'QUẦN JEANS CẠP PHỐI CHUN Q67012', 'Quần Jeans', '599000.00000', '80', 'Phù hợp đi làm, đi sự kiện, hay đi dạo phố, tạo vẻ trẻ trung, hiện đại cho người mặc.', 'Vải jeans cao cấp', 'Quần jeans thiết kế dáng ống đứng, độ dài trên mắt cá chân, cạp phối chun', 'NEM NEW', 'mặc sản phẩm size 2', 'áo phông TS60042');

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
