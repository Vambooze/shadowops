-- --------------------------------------------------------
-- Host:                         
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping structure for table qbcoreframework_78b394.trucker_available_contracts
CREATE TABLE IF NOT EXISTS `trucker_available_contracts` (
  `contract_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_type` int(11) NOT NULL DEFAULT 0,
  `contract_name` varchar(50) NOT NULL DEFAULT '',
  `coords_index` smallint(6) unsigned NOT NULL DEFAULT 0,
  `price_per_km` int(10) unsigned NOT NULL DEFAULT 0,
  `cargo_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fragile` int(11) NOT NULL DEFAULT 0,
  `valuable` int(11) NOT NULL DEFAULT 0,
  `fast` int(11) NOT NULL DEFAULT 0,
  `truck` varchar(50) DEFAULT NULL,
  `trailer` varchar(50) NOT NULL,
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6841 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoreframework_78b394.trucker_available_contracts: ~60 rows (approximately)
INSERT INTO `trucker_available_contracts` (`contract_id`, `contract_type`, `contract_name`, `coords_index`, `price_per_km`, `cargo_type`, `fragile`, `valuable`, `fast`, `truck`, `trailer`) VALUES
	(6781, 1, 'Helicopter Transport', 129, 1889, 0, 1, 1, 0, NULL, 'heli1'),
	(6782, 0, 'Transport of materials for shows', 160, 1410, 0, 0, 1, 0, 'actros', 'tvtrailer'),
	(6783, 1, 'Potato transport', 10, 2114, 0, 0, 0, 0, NULL, 'trailers2'),
	(6784, 0, 'Transport of canned goods', 89, 1988, 0, 0, 0, 0, 'actros', 'trailers2'),
	(6785, 1, 'Appliance transport', 148, 1684, 0, 0, 0, 0, NULL, 'docktrailer'),
	(6786, 0, 'Stork', 22, 1423, 0, 1, 1, 0, 'vnl780', 'tr4'),
	(6787, 1, 'Army water supply', 61, 1783, 0, 0, 0, 0, NULL, 'armytanker'),
	(6788, 0, 'Transport of vaccines', 5, 1670, 0, 1, 0, 0, 'vnl780', 'trailers'),
	(6789, 1, 'Transport of armaments', 136, 2150, 0, 0, 1, 0, NULL, 'docktrailer'),
	(6790, 0, 'Transport of vaccines', 59, 1867, 0, 1, 0, 0, 'actros', 'trailers'),
	(6791, 1, 'Transport of rare materials', 173, 2148, 0, 1, 1, 1, NULL, 'docktrailer'),
	(6792, 0, 'Bottled water transport', 124, 1464, 0, 0, 0, 0, 'man', 'trailers2'),
	(6793, 1, 'Transport of rare materials', 141, 2054, 0, 1, 1, 0, NULL, 'docktrailer'),
	(6794, 0, 'Army vehicle transport', 184, 1520, 0, 1, 1, 0, 'actros', 'militaire1'),
	(6795, 1, 'Transport of materials for shows', 135, 1778, 0, 0, 1, 0, NULL, 'tvtrailer'),
	(6796, 0, 'Clothing transport', 113, 1439, 0, 0, 0, 0, 'vnl780', 'docktrailer'),
	(6797, 1, 'Transport of used packaging', 121, 2111, 0, 0, 0, 0, NULL, 'trailers3'),
	(6798, 0, 'Kerosene tank', 63, 1640, 3, 0, 0, 0, 'actros', 'tanker2'),
	(6799, 1, 'Transport of construction materials', 165, 1818, 0, 0, 0, 0, NULL, 'trailers'),
	(6800, 0, 'Brick transport', 193, 1851, 0, 0, 0, 1, 'vnl780', 'docktrailer'),
	(6801, 1, 'Floor plate transport', 120, 2162, 0, 0, 0, 0, NULL, 'trailers3'),
	(6802, 0, 'Transport of used packaging', 162, 1922, 0, 0, 0, 0, 'daf', 'trailers3'),
	(6803, 1, 'Transport of used packaging', 14, 2384, 0, 0, 0, 0, NULL, 'trailers3'),
	(6804, 0, 'Army toxic gas tank', 147, 1442, 5, 0, 0, 1, 'actros', 'armytanker'),
	(6805, 1, 'White phosphorus transport', 146, 2215, 4, 1, 0, 0, NULL, 'trailers4'),
	(6806, 0, 'Bean transport', 125, 1498, 0, 0, 0, 1, 'vnl780', 'trailers2'),
	(6807, 0, 'Ammo transport', 98, 1467, 1, 0, 0, 0, 'daf', 'docktrailer'),
	(6808, 0, 'Bottled water transport', 75, 1825, 0, 0, 0, 0, 'actros', 'trailers2'),
	(6809, 1, 'Pork transport', 54, 2309, 0, 0, 0, 0, NULL, 'trailers2'),
	(6810, 0, 'Army toxic gas tank', 104, 1908, 5, 0, 0, 0, 'vnl780', 'armytanker'),
	(6811, 1, 'Transport of armaments', 61, 2370, 0, 0, 1, 0, NULL, 'docktrailer'),
	(6812, 0, 'Heavy machinery transport', 103, 1918, 0, 1, 1, 0, 'man', 'armytrailer2'),
	(6813, 1, 'Floor plate transport', 112, 2365, 0, 0, 0, 0, NULL, 'trailers3'),
	(6814, 0, 'Transport of plastics', 45, 1775, 0, 0, 0, 0, 'man', 'docktrailer'),
	(6815, 1, 'Oil tank', 14, 1852, 3, 0, 0, 0, NULL, 'tanker2'),
	(6816, 0, 'Oil tank', 107, 1767, 3, 0, 0, 0, 'actros', 'tanker2'),
	(6817, 1, 'Floor plate transport', 134, 2122, 0, 0, 0, 0, NULL, 'trailers3'),
	(6818, 0, 'Vinegar transport', 115, 1440, 0, 0, 0, 0, 'man', 'trailers2'),
	(6819, 1, 'Cheese transport', 164, 2268, 0, 0, 0, 1, NULL, 'trailers2'),
	(6820, 0, 'Army fuel tank', 47, 1425, 3, 0, 0, 1, 'man', 'armytanker'),
	(6821, 1, 'Pesticide', 197, 2009, 5, 0, 0, 0, NULL, 'liquide1'),
	(6822, 0, 'Transport of materials for shows', 77, 1968, 0, 0, 1, 0, 'daf', 'tvtrailer'),
	(6823, 1, 'Furniture transport', 60, 2246, 0, 0, 0, 0, NULL, 'docktrailer'),
	(6824, 0, 'Transport of construction materials', 193, 1756, 0, 0, 0, 0, 'daf', 'trailers'),
	(6825, 1, 'Log transportation', 68, 2244, 0, 0, 0, 0, NULL, 'trailerlogs'),
	(6826, 0, 'Dynamite transport', 183, 1832, 1, 1, 0, 0, 'daf', 'trailers4'),
	(6827, 1, 'Ammo transport', 97, 2196, 1, 0, 0, 0, NULL, 'docktrailer'),
	(6828, 0, 'Pesticide', 20, 1952, 5, 0, 0, 0, 'man', 'liquide1'),
	(6829, 1, 'Frozen meat transport', 142, 2024, 0, 0, 0, 1, NULL, 'trailers2'),
	(6830, 0, 'Refined timber transport', 197, 1991, 0, 0, 0, 0, 'man', 'docktrailer'),
	(6831, 1, 'Potato transport', 174, 1772, 0, 0, 0, 0, NULL, 'trailers2'),
	(6832, 0, 'Nitrogen', 160, 1961, 2, 0, 1, 0, 'actros', 'liquide1'),
	(6833, 1, 'Log transportation', 147, 2279, 0, 0, 0, 0, NULL, 'trailerlogs'),
	(6834, 0, 'Milk transport', 90, 1720, 0, 0, 0, 0, 'daf', 'trailers2'),
	(6835, 1, 'Ceramic transport', 39, 1999, 0, 1, 0, 0, NULL, 'trailers3'),
	(6836, 0, 'Rail transport', 42, 1500, 0, 0, 0, 0, 'vnl780', 'trailers3'),
	(6837, 1, 'White phosphorus transport', 113, 2353, 4, 1, 0, 0, NULL, 'trailers4'),
	(6838, 0, 'Sawdust transport', 68, 1744, 0, 0, 0, 0, 'vnl780', 'trailers'),
	(6839, 1, 'Pork transport', 133, 1859, 0, 0, 0, 0, NULL, 'trailers2'),
	(6840, 0, 'Helicopter Transport', 21, 1517, 0, 1, 1, 0, 'man', 'heli1');

-- Dumping structure for table qbcoreframework_78b394.trucker_drivers
CREATE TABLE IF NOT EXISTS `trucker_drivers` (
  `driver_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `product_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `distance` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `valuable` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fragile` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fast` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `price_per_km` int(10) unsigned NOT NULL DEFAULT 0,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`driver_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoreframework_78b394.trucker_drivers: ~20 rows (approximately)
INSERT INTO `trucker_drivers` (`driver_id`, `user_id`, `name`, `product_type`, `distance`, `valuable`, `fragile`, `fast`, `price`, `price_per_km`, `img`) VALUES
	(309, NULL, 'Alexandria Pope', 3, 2, 0, 4, 5, 18508, 981, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(310, NULL, 'Melissa Fernandes', 6, 2, 2, 6, 1, 19582, 956, 'https://bootdey.com/img/Content/avatar/avatar3.png'),
	(311, NULL, 'Dollie Lane', 4, 3, 4, 5, 0, 18931, 988, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(312, NULL, 'Hope Aguirre', 2, 2, 5, 5, 1, 17820, 975, 'https://bootdey.com/img/Content/avatar/avatar4.png'),
	(313, NULL, 'Jolene Calderon', 5, 4, 3, 0, 3, 17698, 964, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(314, NULL, 'Padilla Lynn', 3, 3, 3, 0, 2, 16599, 786, 'https://bootdey.com/img/Content/avatar/avatar2.png'),
	(315, NULL, 'Mendoza Wilkinson', 0, 3, 0, 3, 3, 15048, 828, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(316, NULL, 'Melissa Fernandes', 6, 2, 2, 6, 1, 19582, 956, 'https://bootdey.com/img/Content/avatar/avatar3.png'),
	(317, NULL, 'Dollie Lane', 4, 3, 4, 5, 0, 18931, 988, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(318, NULL, 'Debora Chaney', 0, 3, 2, 2, 2, 14600, 766, 'https://bootdey.com/img/Content/avatar/avatar1.png'),
	(319, NULL, 'Mendoza Wilkinson', 0, 3, 0, 3, 3, 15048, 828, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(320, NULL, 'Graham Love', 2, 2, 2, 0, 6, 17238, 858, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(321, NULL, 'Ruiz Simmons', 2, 1, 1, 4, 4, 16906, 843, 'https://bootdey.com/img/Content/avatar/avatar2.png'),
	(322, NULL, 'Sanford Dean', 3, 4, 0, 2, 5, 17865, 938, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(323, NULL, 'Huff Thompson', 1, 0, 4, 2, 1, 14297, 728, 'https://bootdey.com/img/Content/avatar/avatar1.png'),
	(324, NULL, 'Ruiz Simmons', 2, 1, 1, 4, 4, 16906, 843, 'https://bootdey.com/img/Content/avatar/avatar2.png'),
	(325, NULL, 'Kitty Crane', 6, 2, 4, 1, 1, 18180, 947, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(326, NULL, 'Phyllis Mayer', 2, 3, 2, 4, 0, 16676, 854, 'https://bootdey.com/img/Content/avatar/avatar4.png'),
	(327, NULL, 'Kitty Crane', 6, 2, 4, 1, 1, 18180, 947, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(328, NULL, 'Melissa Fernandes', 6, 2, 2, 6, 1, 19582, 956, 'https://bootdey.com/img/Content/avatar/avatar3.png');

-- Dumping structure for table qbcoreframework_78b394.trucker_loans
CREATE TABLE IF NOT EXISTS `trucker_loans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `loan` int(10) unsigned NOT NULL DEFAULT 0,
  `remaining_amount` int(10) unsigned NOT NULL DEFAULT 0,
  `day_cost` int(10) unsigned NOT NULL DEFAULT 0,
  `taxes_on_day` int(10) unsigned NOT NULL DEFAULT 0,
  `timer` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoreframework_78b394.trucker_loans: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_78b394.trucker_trucks
CREATE TABLE IF NOT EXISTS `trucker_trucks` (
  `truck_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `truck_name` varchar(50) NOT NULL,
  `driver` int(10) unsigned DEFAULT NULL,
  `body` smallint(5) unsigned NOT NULL DEFAULT 1000,
  `engine` smallint(5) unsigned NOT NULL DEFAULT 1000,
  `transmission` smallint(5) unsigned NOT NULL DEFAULT 1000,
  `wheels` smallint(5) unsigned NOT NULL DEFAULT 1000,
  PRIMARY KEY (`truck_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoreframework_78b394.trucker_trucks: ~0 rows (approximately)
INSERT INTO `trucker_trucks` (`truck_id`, `user_id`, `truck_name`, `driver`, `body`, `engine`, `transmission`, `wheels`) VALUES
	(2, 'BWC14392', 'actros', 0, 1000, 1000, 1000, 983);

-- Dumping structure for table qbcoreframework_78b394.trucker_users
CREATE TABLE IF NOT EXISTS `trucker_users` (
  `user_id` varchar(50) NOT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `total_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `finished_deliveries` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `traveled_distance` double unsigned NOT NULL DEFAULT 0,
  `skill_points` int(10) unsigned NOT NULL DEFAULT 0,
  `product_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `distance` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `valuable` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fragile` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fast` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `loan_notify` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoreframework_78b394.trucker_users: ~0 rows (approximately)
INSERT INTO `trucker_users` (`user_id`, `money`, `total_earned`, `finished_deliveries`, `exp`, `traveled_distance`, `skill_points`, `product_type`, `distance`, `valuable`, `fragile`, `fast`, `loan_notify`) VALUES
	('BWC14392', 89695962, 5962, 2, 58, 3.11, 0, 0, 0, 0, 0, 0, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
