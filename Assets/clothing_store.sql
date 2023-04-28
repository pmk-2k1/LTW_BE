-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2023 at 07:10 AM
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
  `Pay_method` varchar(100) NOT NULL DEFAULT 'Momo',
  `Note` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `CustomerID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Id`, `Status`, `Total`, `Time`, `Pay_method`, `Note`, `CustomerID`) VALUES
('fd7be617-3767-465c-a737-f45248777ef2', 0, '2197000.00000', '2023-04-28 04:51:38', 'Offline', '', 'fbb9e56e-cd26-42aa-a07d-5b3cb3e88815');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `Id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `BillID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Count` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `Price_item` decimal(20,5) NOT NULL DEFAULT 0.00000,
  `Size` int(2) NOT NULL,
  `Color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Rate` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`Id`, `BillID`, `ProductID`, `Count`, `Price_item`, `Size`, `Color`, `Rate`) VALUES
('51145805-b4b0-45e3-9526-c765a270090a', 'fd7be617-3767-465c-a737-f45248777ef2', '219971e4-a0c4-4699-bbed-5ce8ba211175', 1, '599000.00000', 2, 'pink', 2),
('9b3fc02a-d529-4261-8207-618b92396d0a', 'fd7be617-3767-465c-a737-f45248777ef2', '420f1322-8d35-4290-b909-6b1f7abc739f', 2, '799000.00000', 3, 'yellow', 4);

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
  `Content` varchar(500) NOT NULL,
  `Main` tinyint(1) NOT NULL DEFAULT 0,
  `ProductID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`Id`, `Content`, `Main`, `ProductID`) VALUES
('01c149c0-569e-42cb-b2dd-6ceebf007eef', 'https://product.hstatic.net/200000182297/product/6_ad1ca12b64114ab88aeb0620fcafa123_master.jpg', 1, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('02d247fd-e8d0-4d7e-941a-fdff35678a55', 'https://product.hstatic.net/200000182297/product/23_f8ddcce6b6ba41ac97692dbd23dece40_master.jpg', 1, '5021a009-4f4c-479f-a97e-87425b1a85e2'),
('0b79f53e-646a-4048-950e-60062695899a', 'https://product.hstatic.net/200000182297/product/15_d1d4160aa62a48f3bd1ab2e9b36b1c33_master.jpg', 1, '65edc9ef-6773-45df-8a0f-2949850ba645'),
('0d0618eb-b095-40cf-bc96-8ea209c00d5d', 'https://product.hstatic.net/200000182297/product/j013021962212020474p799dt_2__4810418d2d3b448ba66971423d913652_master.jpg', 0, 'a579b747-778f-4baa-a93c-eeec5eefa9d0'),
('10e5e782-44e6-49cc-b21c-a3f88ba1a86a', 'https://product.hstatic.net/200000182297/product/43_49842837958449f2bb5ed995a1127341_master.jpg', 1, 'c6d4928e-5dd2-4619-b597-f531325895fa'),
('13d842ec-ae22-4a39-8136-742005bb5ff8', 'https://product.hstatic.net/200000182297/product/ad159021582215000458p1499dt_q172921782214030401p699dt_20c6a9de88b549f59299d02c153d1986_master.jpg', 0, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('19417453-1e98-4052-b605-4c91aef86c9f', 'https://product.hstatic.net/200000182297/product/j013021962212020474p799dt_4__d995b38f1beb425ab4f4fde5014f5c0a_master.jpg', 0, 'a579b747-778f-4baa-a93c-eeec5eefa9d0'),
('2254fbdc-659a-4ee7-9ae7-3bf6d6b4ca1b', 'https://product.hstatic.net/200000182297/product/ts600121902332030462p299dt_q205921702312050457p599dt_3__5a24d365f0d7495ebd12009d3d3a4a35_master.jpg', 0, '65edc9ef-6773-45df-8a0f-2949850ba645'),
('2a63b6cf-3f36-46d1-8759-acbee95cf87a', 'https://product.hstatic.net/200000182297/product/d203621412312160405p1399dt_f66f0be27d164b0d91d9ae2f9719178c_master.jpg', 0, '608f0956-8d2b-4c27-bf85-8908f5b1cdf7'),
('2bb45fe3-4639-4307-a1b2-4b793c5a8413', 'https://product.hstatic.net/200000182297/product/210_bf511813b79a410a9916467e7383c698_master.jpg', 1, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('2d2a7ef3-f07c-4e29-9724-3d829536f548', 'https://product.hstatic.net/200000182297/product/d191621412352110401p1399dt_1__0bfa8db0b6b849768dcf5fd858b81d5b_master.jpg', 0, 'd28c6612-0006-47f2-92b0-3b4856822323'),
('315f6e01-8afd-4940-94ac-0c9a7ff21e30', 'https://product.hstatic.net/200000182297/product/ad099421582223030658p1759dt_q108821782223050401p599dt_4__1ac4f97cd7aa4589893e9c6eeb7f9da9_master.jpg', 0, '96934f7d-90c5-4c5e-a52e-633cf6123650'),
('31de9c33-30ed-4219-956a-807a939c08ed', 'https://product.hstatic.net/200000182297/product/2_9d881f3f665344f1bf3777735cf334e3_master.jpg', 1, '219971e4-a0c4-4699-bbed-5ce8ba211175'),
('32eebd89-2c00-4a99-8b4a-41154059a21e', 'https://product.hstatic.net/200000182297/product/2_6958d81e54a642a6a155b32a20e1979d_master.jpg', 1, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('33986087-16c9-4410-b875-fa97b39cc4bf', 'https://product.hstatic.net/200000182297/product/j012921962212400426p999dt_2__05cfd5f308624bc39da52697da626ae7_master.jpg', 0, 'e9be9e63-0702-4bc2-b3df-01d766cabf4e'),
('33ae9d6e-63ba-4301-b31f-f8d1e00c8cc8', 'https://product.hstatic.net/200000182297/product/d020021412362420674p1399dt_ef8bcfa3fa8f4fd0b686922e0d5d8ba0_master.jpg', 0, '4090ac8e-d1b1-4479-836e-09c63eb822d2'),
('35b1ca88-eb40-428f-8863-31be29b97989', 'https://product.hstatic.net/200000182297/product/ad159021582215000458p1499dt_q172921782214030401p699dt_2__ab69249b7fb1455aa70ae0d996b15326_master.jpg', 0, 'ba09f81e-e926-49bb-8901-20df5e157626'),
('38a58fe7-482c-4d32-aec4-73edd880c5be', 'https://product.hstatic.net/200000182297/product/ts600121902332030462p299dt_q205921702312050457p599dt_ce1975bcae5048159765387b262262d6_master.jpg', 0, '65edc9ef-6773-45df-8a0f-2949850ba645'),
('416e52e7-ff86-4cd8-88ec-66e5bc14f68c', 'https://product.hstatic.net/200000182297/product/ad128521582224720458p1499dt_q128621782224040418p699dt_4__377f8320ebe2418a823a35e28f8a8b19_master.jpg', 0, 'f1d6cc6d-becb-4f18-8ccf-398a70ee9d2d'),
('494757b7-d7f8-49c0-a795-b5fecb138748', 'https://product.hstatic.net/200000182297/product/sm182121222332420401p799dt_z083021522213130674p699dt_1__7c836f4b1b1b4248a437dbe3a184e706_master.jpg', 0, '420f1322-8d35-4290-b909-6b1f7abc739f'),
('4d221236-9040-428f-accb-a0667c80d1a9', 'https://product.hstatic.net/200000182297/product/ak401221312352160457p399dt_z401121542382160457p399dt_4__2388328dd9f545fb96efce4fe24c11eb_master.jpg', 0, 'fe85aefc-94cd-4c6c-961d-9d8aaa418dff'),
('52ca2a01-6f1d-4ef1-90ab-53698ad64f46', 'https://product.hstatic.net/200000182297/product/d432621412382000274p599dt_21632c5dc1fd4cfd96636b43c08dbf2c_master.jpg', 0, '219971e4-a0c4-4699-bbed-5ce8ba211175'),
('5436e47b-537f-42f1-8d48-e79ed4890cab', 'https://product.hstatic.net/200000182297/product/19_22ea2a2036b041a3a3a35f71834dacd9_master.jpg', 1, 'e9be9e63-0702-4bc2-b3df-01d766cabf4e'),
('5774bba3-ded2-4514-bc4f-714da9799ff2', 'https://product.hstatic.net/200000182297/product/sm425521232231000257p429dt_q432421722322110474p429dt_3f7ad9cb48df4c29a3c4f81fc3e67b96_master.jpg', 0, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('5f9a3ffb-c5f2-4073-96b9-84df3066521c', 'https://product.hstatic.net/200000182297/product/ad091821582213030401p1899dt_q091921782223030401p599dt_1__556aa0e67f50405d9ad190d4847c132e_master.jpg', 0, '4626c92a-5c3c-46b4-b25b-1eb558970c8a'),
('606030b6-6e4e-4f09-a253-b6b2b51bc158', 'https://product.hstatic.net/200000182297/product/j092621962213160474p999dt_4__66d621f6e94f4812916efb81030738d8_master.jpg', 0, 'd79d5531-bc03-4a83-ad5b-ad012aa1afa6'),
('6130aa0c-675b-4cc9-8505-6fba005b7f0f', 'https://product.hstatic.net/200000182297/product/1_ee5c7dc3014e48f49fbbbaf7f11b1a9e_master.jpg', 1, '80333cd7-ae8b-4fed-957d-62939c4d3d5f'),
('62a33b2b-cd01-4cca-9381-c7e1c193017d', 'https://product.hstatic.net/200000182297/product/ad108721582213060401p1499dt_q091021782223030258p599dt_2__ca873630512d4cc9b61f7bd3bf08c68b_master.jpg', 0, 'c6d4928e-5dd2-4619-b597-f531325895fa'),
('656a2067-c4f2-41ca-a060-2a6a1dc96a37', 'https://product.hstatic.net/200000182297/product/31_8a3eaf0308104cd8bb630c5e1194a274_master.jpg', 1, '96934f7d-90c5-4c5e-a52e-633cf6123650'),
('656a748c-e158-4191-8ea1-47bd02d814d6', 'https://product.hstatic.net/200000182297/product/j092621962213160474p999dt_99ce7905e2e94cd5a18c40d85a4df068_master.jpg', 0, 'd79d5531-bc03-4a83-ad5b-ad012aa1afa6'),
('689eec90-16a2-4f25-927f-2074eb570934', 'https://product.hstatic.net/200000182297/product/sm193121212322060401p799dt_z193221542322060401p899dt_83cda94747aa45b296030e2df6b89fd6_master.jpg', 0, '5021a009-4f4c-479f-a97e-87425b1a85e2'),
('6ec70458-6db1-4196-a145-753b5d83fd19', 'https://product.hstatic.net/200000182297/product/ak401221312352160457p399dt_z401121542382160457p399dt_2__f3ed1e839d8a4ff9a15a5a5a87ee28de_master.jpg', 0, 'fe85aefc-94cd-4c6c-961d-9d8aaa418dff'),
('710a30fb-6a0b-4cf7-adc7-5f92872774ab', 'https://product.hstatic.net/200000182297/product/d191621412352110401p1399dt_3__73a088eab40a433ca72bbeba60e73e13_master.jpg', 0, 'd28c6612-0006-47f2-92b0-3b4856822323'),
('715a29a7-7963-4e4b-b891-7c5420f796cf', 'https://product.hstatic.net/200000182297/product/sm193121212322060401p799dt_z193221542322060401p899dt_3__5abf5695d9ee4ae798a979a52ccc3dab_master.jpg', 0, '5021a009-4f4c-479f-a97e-87425b1a85e2'),
('7250a7fb-911f-4c7a-9b8c-344395a349cb', 'https://product.hstatic.net/200000182297/product/3_6ac13cb8fbd74d3195b0e57f0f099652_master.jpg', 1, 'd28c6612-0006-47f2-92b0-3b4856822323'),
('8276cdc5-8f9f-4fb3-8514-1bed27353790', 'https://product.hstatic.net/200000182297/product/4_35a7431a025e44a48660e50db7f054c8_master.jpg', 1, 'e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d'),
('83c7ecbf-95b6-42bc-8300-17d58e8b2419', 'https://product.hstatic.net/200000182297/product/ad108721582213060401p1499dt_q091021782223030258p599dt_6b83bd3e1c2d4841895f3008636d2df0_master.jpg', 0, 'c6d4928e-5dd2-4619-b597-f531325895fa'),
('8a1360b0-6544-42d0-8c04-2be47325f1a9', 'https://product.hstatic.net/200000182297/product/210_fe6b471654ef42dbbc3c5882dc930508_master.jpg', 1, 'd79d5531-bc03-4a83-ad5b-ad012aa1afa6'),
('8c0b71ba-22c9-4b3b-b6f6-5e7dc2663921', 'https://product.hstatic.net/200000182297/product/5_a93c4dcf98c94defaee40045d93ecbf7_master.jpg', 1, 'b89e62d5-b4f1-4f14-bbca-d88efc58447a'),
('96997556-3790-45f6-b353-62bc5060e3ed', 'https://product.hstatic.net/200000182297/product/sm194121232332030457p799dt_z206021522382110447p699dt_4__9870cfe31b864bffb3b7e402e34eadee_master.jpg', 0, '6796cad8-04b8-4258-8048-6d44b08d9b5e'),
('9777a93e-6cff-42e5-94ce-d40122bf2963', 'https://product.hstatic.net/200000182297/product/d203621412312160405p1399dt_2__cb5f0198fcfa472a8afd6a38477d1153_master.jpg', 0, '608f0956-8d2b-4c27-bf85-8908f5b1cdf7'),
('a01d38ff-1e92-485c-9c06-21889bf99869', 'https://product.hstatic.net/200000182297/product/sm195621222352169018p999dt_q670521732230900432p699dt_5__296e834c4ed1452cab4197c374564375_master.jpg', 0, '4a125cf4-c3a8-4dc8-bde3-2a3473f98681'),
('a20c1c51-0e86-4840-b979-c9978887d901', 'https://product.hstatic.net/200000182297/product/22_7779da7751654ff5844e409c83238c31_master.jpg', 1, 'f1d6cc6d-becb-4f18-8ccf-398a70ee9d2d'),
('a719f670-2fbd-427b-b348-c2164521dfac', 'https://product.hstatic.net/200000182297/product/5_3d5eef22ad804b81848fb4bfc3c2f0c4_master.jpg', 1, '8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7'),
('a940959d-1a0c-40d8-8369-b12d05bd330d', 'https://product.hstatic.net/200000182297/product/4_e9d22bff0d834a98a9186681261199bd_master.jpg', 1, '4a125cf4-c3a8-4dc8-bde3-2a3473f98681'),
('b1ee07a0-85c6-4013-90b9-d8bd074b584b', 'https://product.hstatic.net/200000182297/product/j048821962212400458p1399dt_44beb51a530d499da8dd49b21fd961f5_master.jpg', 0, '8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7'),
('b2e943e8-1c10-4278-a1eb-8f1cce595009', 'https://product.hstatic.net/200000182297/product/d195021412362040418p1599dt_2__463f3ca8b58f40edab8174486cba6a2f_master.jpg', 0, 'b89e62d5-b4f1-4f14-bbca-d88efc58447a'),
('b50c8c4e-f9de-40b9-ab34-190db0c65695', 'https://product.hstatic.net/200000182297/product/2_dc797f567b934a4a870a258b98376c2c_master.jpg', 1, '608f0956-8d2b-4c27-bf85-8908f5b1cdf7'),
('b58d886c-fd7f-499c-aaef-2403186340d4', 'https://product.hstatic.net/200000182297/product/3_a75a636b559f4f199a8bcd4df7bb3fb3_master.jpg', 1, '4090ac8e-d1b1-4479-836e-09c63eb822d2'),
('c3f3ccfa-12ff-4e85-b391-43fcaf5a69eb', 'https://product.hstatic.net/200000182297/product/d195021412362040418p1599dt_4d483fc14fcb4549ac9f9020503c1845_master.jpg', 0, 'b89e62d5-b4f1-4f14-bbca-d88efc58447a'),
('c4f3da71-ff86-4673-be5a-3a6073f68e87', 'https://product.hstatic.net/200000182297/product/j013021962212020474p799dt_1__05b03f7eb596400797a3b5bd1f0aa1f4_master.jpg', 1, 'a579b747-778f-4baa-a93c-eeec5eefa9d0'),
('cabf3e0c-1ef8-44c2-b4d8-6211ed04e7fb', 'https://product.hstatic.net/200000182297/product/j012921962212400426p999dt_3829bb87560948d4aa3358f4775da8eb_master.jpg', 0, 'e9be9e63-0702-4bc2-b3df-01d766cabf4e'),
('cb63917c-4d98-4f91-be8e-c38a01821677', 'https://product.hstatic.net/200000182297/product/d020021412362420674p1399dt_3__c7ab01612ca24944b98d814a95afb038_master.jpg', 0, '4090ac8e-d1b1-4479-836e-09c63eb822d2'),
('ce4eb0d8-0a18-4e93-a125-30f9e9063c3b', 'https://product.hstatic.net/200000182297/product/j048821962212400458p1399dt_3__dbc049950ab94463acf342224742ba3f_master.jpg', 0, '8dafd7d6-4bfa-4085-a0f7-e4c37e8ff3b7'),
('cfdffc8b-25fe-4402-8a88-0d85fa95e9a3', 'https://product.hstatic.net/200000182297/product/hw036521742312000401p599dt_b86326ab5ac84e31a9a8ade1fb9012d1_master.jpg', 0, '80333cd7-ae8b-4fed-957d-62939c4d3d5f'),
('d3f3d0a2-dcad-4c23-84bd-65917c1c015f', 'https://product.hstatic.net/200000182297/product/d432621412382000274p599dt_3__25485f4d7e1a4f9a820415036df6c356_master.jpg', 0, '219971e4-a0c4-4699-bbed-5ce8ba211175'),
('d8d5796f-5143-4362-bd4b-ed166aa3b2bf', 'https://product.hstatic.net/200000182297/product/1_5869f370b1c74829bf3ce79c6f2d16f2_master.jpg', 1, 'fe85aefc-94cd-4c6c-961d-9d8aaa418dff'),
('da60e3f1-9cd4-4a70-bc0f-622c500a612b', 'https://product.hstatic.net/200000182297/product/ad128521582224720458p1499dt_q128621782224040418p699dt_3__5df055654a464fff8c5d44e7f7f8bee2_master.jpg', 0, 'f1d6cc6d-becb-4f18-8ccf-398a70ee9d2d'),
('e382e3c8-5311-4fed-8afd-ff43747ab09f', 'https://product.hstatic.net/200000182297/product/sm194121232332030457p799dt_z206021522382110447p699dt_9a73aa1f7a5841648d82bfb2bc430e23_master.jpg', 0, '6796cad8-04b8-4258-8048-6d44b08d9b5e'),
('e432dd92-d96c-438f-8d38-94a81daa9041', 'https://product.hstatic.net/200000182297/product/1_e022c37119634825bad5e32998dc311e_master.jpg', 1, '6796cad8-04b8-4258-8048-6d44b08d9b5e'),
('e8939cbd-cdcc-40d1-a427-66651abe5d5b', 'https://product.hstatic.net/200000182297/product/sm002921212332010457p799dt_q003021702332010457p699dt_fe7c39ad24dc48ac881dc1e3e290487e_master.jpg', 0, 'e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d'),
('e95d8f13-3f5b-4261-9794-09d37af896de', 'https://product.hstatic.net/200000182297/product/sm182121222332420401p799dt_z083021522213130674p699dt_a458c5e8d334472fb44d749698e26e25_master.jpg', 0, '420f1322-8d35-4290-b909-6b1f7abc739f'),
('eacc5789-1feb-47d7-ac25-1b7c983a8ea5', 'https://product.hstatic.net/200000182297/product/sm425521232231000257p429dt_q432421722322110474p429dt_3__8809ebc4bcc74fbfb52c48692fe9b44b_master.jpg', 0, '4459e863-fd78-4ded-b5a0-28fa9580ce37'),
('f59fdfa4-25d0-43e0-8aee-52a0346bb2d4', 'https://product.hstatic.net/200000182297/product/4_f46eeefd07444e638aa9092027c4859b_master.jpg', 1, '420f1322-8d35-4290-b909-6b1f7abc739f'),
('f5e8b648-9e12-4d56-aebc-796df1e7a1ab', 'https://product.hstatic.net/200000182297/product/ts600421902232039023p359dt_q670121712230900491p599_1__46dceae6529c4006bacfee7c3939a182_master.jpg', 0, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('f625f758-cc7b-4922-9a64-175c924cf16d', 'https://product.hstatic.net/200000182297/product/ts600421902232039023p359dt_q670121712230900491p599_20dbab1f1aa34ed08bcd76584ecb4737_master.jpg', 0, 'f9f311c5-62f8-41e1-a5d6-defa0abd634b'),
('f8529ac2-dc20-4e3b-8d8a-4ee75d22b73b', 'https://product.hstatic.net/200000182297/product/hw036521742312000401p599dt_2__16c0e2c2aab14041aac3b5fe2e7321f4_master.jpg', 0, '80333cd7-ae8b-4fed-957d-62939c4d3d5f'),
('f8723b87-8678-4fc0-b24f-773579f1388e', 'https://product.hstatic.net/200000182297/product/ad091821582213030401p1899dt_q091921782223030401p599dt_2__e7127393a0b94227ada4b5a901edf148_master.jpg', 0, '4626c92a-5c3c-46b4-b25b-1eb558970c8a'),
('faf23958-9cd2-4bb0-a530-e40bf042b79b', 'https://product.hstatic.net/200000182297/product/ad099421582223030658p1759dt_q108821782223050401p599dt_2__08e0509597064b5795362841857d9c4f_master.jpg', 0, '96934f7d-90c5-4c5e-a52e-633cf6123650'),
('fe4da7e4-65bc-4186-a077-b01de3f3fbdc', 'https://product.hstatic.net/200000182297/product/72_ae5ace4a691f458d88f83e5b5074889e_master.jpg', 1, '4626c92a-5c3c-46b4-b25b-1eb558970c8a'),
('fed62414-1c8c-4e60-88e4-5466446ff899', 'https://product.hstatic.net/200000182297/product/sm002921212332010457p799dt_q003021702332010457p699dt_1__3a9c1dd9c5c5433ead4d435893c277a8_master.jpg', 0, 'e1a38dd1-90ec-45ad-bedb-0eb5ab030b9d'),
('fff04852-7e63-4d1c-af15-f047f267b2cb', 'https://product.hstatic.net/200000182297/product/sm195621222352169018p999dt_q670521732230900432p699dt_4__d0ec3e6755ee47e998e0f733a0f261da_master.jpg', 0, '4a125cf4-c3a8-4dc8-bde3-2a3473f98681');

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
  `Description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Material` varchar(1000) DEFAULT NULL,
  `Style` varchar(1000) DEFAULT NULL,
  `Album` varchar(1000) DEFAULT NULL,
  `Model` varchar(1000) DEFAULT NULL,
  `Connect` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD PRIMARY KEY (`Id`),
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
