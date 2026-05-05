-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
<<<<<<< HEAD
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2026 at 06:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12
=======
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 13. 08:32
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carazongarage`
--

-- --------------------------------------------------------

--
<<<<<<< HEAD
-- Table structure for table `appointments`
=======
-- Tábla szerkezet ehhez a táblához `applicants`
--

CREATE TABLE `applicants` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `appointments`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--

CREATE TABLE `appointments` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `vehicle_id` int(5) NOT NULL,
  `service_id` int(5) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `vehicle_id`, `service_id`, `date`, `status`, `note`, `created_at`, `price`) VALUES
(1, 1, 1, 1, '2025-11-20', 'booked', 'Olajcsere esedékes', '2025-11-11 11:08:25', 15000.00),
(2, 1, 2, 2, '2025-11-25', 'pending', 'Fékbetét csere szükséges', '2025-11-11 11:08:25', 45000.00),
(3, 2, 3, 3, '2025-12-01', 'confirmed', 'Műszaki vizsga', '2025-11-11 11:08:25', 30000.00),
(4, 4, 4, 4, '2025-12-05', 'booked', 'Kerékcsere téli gumikra', '2025-11-11 11:14:40', 20000.00),
(5, 5, 5, 5, '2025-12-10', 'confirmed', 'Klíma tisztítás', '2025-11-11 11:14:40', 15000.00),
(6, 6, 6, 6, '2025-12-15', 'pending', 'Diagnosztika szükséges', '2025-11-11 11:14:40', 25000.00),
(7, 7, 7, 7, '2025-12-20', 'booked', 'Akkumulátor csere', '2025-11-11 11:14:40', 30000.00),
(8, 8, 8, 8, '2025-12-22', 'confirmed', 'Futómű beállítás', '2025-11-11 11:14:40', 35000.00);

-- --------------------------------------------------------

--
<<<<<<< HEAD
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `date`) VALUES
(1, 1, '2025-11-10'),
(2, 2, '2025-11-11'),
(3, 3, '2025-11-12'),
(4, 4, '2025-11-13'),
(5, 5, '2025-11-14'),
(6, 6, '2025-11-15'),
(7, 7, '2025-11-16'),
(8, 8, '2025-11-17');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(5) NOT NULL,
  `cart_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `quantity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 3, 5),
(3, 2, 2, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 2),
(7, 7, 7, 1),
(8, 8, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
=======
-- Tábla szerkezet ehhez a táblához `country`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--

CREATE TABLE `country` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Magyarország'),
(2, 'Németország'),
(3, 'Olaszország'),
(4, 'Franciaország'),
(5, 'Spanyolország'),
(6, 'Ausztria'),
(7, 'Szlovákia'),
(8, 'Csehország');

-- --------------------------------------------------------

--
-- Table structure for table `hero_content`
--

CREATE TABLE `hero_content` (
  `id` int(11) NOT NULL,
  `heroTitle` varchar(255) NOT NULL,
  `heroSubtitle` varchar(255) NOT NULL,
  `heroDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero_content`
--

INSERT INTO `hero_content` (`id`, `heroTitle`, `heroSubtitle`, `heroDescription`) VALUES
(1, 'Lo siento', 'Nemszoktunk adózni', 'Experience the fusion of traditional craftsmanship and contemporary artistry. Each piece tells a story carved with precision, passion, and decades of mastery.');

-- --------------------------------------------------------

--
<<<<<<< HEAD
-- Table structure for table `language`
=======
-- Tábla szerkezet ehhez a táblához `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `description`, `salary`, `location`, `created_at`) VALUES
(3, 'Főszerelő', 'Autók szerelése', '850.000-900.000', 'Makó', '2026-02-03 11:04:29'),
(4, 'Marketing', 'Cég hirdetése ', '700.000-820.000', 'Makó', '2026-02-03 11:05:10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `language`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--

CREATE TABLE `language` (
  `id` char(2) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `storage_quantity` int(4) DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  `item_number` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `storage_quantity`, `type`, `item_number`, `description`) VALUES
(1, 'Motorolaj 5W-30', 11000.00, 50, 'oil', 'MOT 5W-30 8100 X-CLEAN 5L', 'Motul 5w30 X clean ami segíti a motor élettartamát'),
(2, 'Fékbetét szett', 24000.00, 25, 'brake', '60m-br-c5', '60mm féktárcsára való fékbetét szett'),
(3, 'Szélvédőmosó folyadék', 2000.00, 100, 'fluid', 'TESCO-5l-W', 'Tescos szélvédő mosó téli 5literes'),
(4, 'Téli gumi szett', 180000.00, 12, 'tyre', 'Han-558-W', 'Hankook 205/55/r16 téli gumi szett'),
(5, 'Autó akkumulátor 60Ah', 45000.00, 15, 'battery', 'Var-60-AGM', 'Varta 60ah akkumlátor zselés'),
(6, 'Klímatisztító spray', 5000.00, 40, 'cleaning', 'AC-555-c', 'Klíma bomba citromos'),
(7, 'Alsó lengőkar szilent', 80000.00, 2, 'suspension', 'Szl-511-HU', 'Poliuretán sárga lengőkar szilent 500x500'),
(8, 'OBD diagnosztikai eszköz', 30000.00, 8, 'tool', 'OBD-11-556', 'Obd eleven hibakód olvasó eszköz'),
(9, 'Olajszűrő', 5499.00, 20, 'oilfilter', 'HU 6014/1 Z', 'Bmw g20 olajszűrő');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(200) NOT NULL,
  `year` date NOT NULL,
  `img` varchar(200) NOT NULL,
  `description` varchar(100) NOT NULL,
  `materials` varchar(200) NOT NULL,
  `dimensions` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `category`, `year`, `img`, `description`, `materials`, `dimensions`) VALUES
(1, 'Lowrider Légzsák', 'Autotuning', '2024-01-01', 'https://images.pexels.com/photos/242125/pexels-photo-242125.jpeg', 'Pattog az autó mint a labda.', 'Légzsák, rúgó', '4-6 óra'),
(2, 'Mercedes bőrözés', 'Kozmetika', '2024-01-01', 'https://images.pexels.com/photos/1104768/pexels-photo-1104768.jpeg', 'Teljes kabintéri bőrözés.', 'Bőr, cérna, alkantara', '6-8 óra'),
(3, 'Renault Clio Fényezés', 'Fényezés', '2023-01-01', 'https://miraclebodyandpaint.com/wp-content/uploads/2022/02/Auto-Paint-job-4-1200x480.jpg', 'Renault clio fényezés korrekció, és újrafújás.', 'Festék, edző, hígító', '20-22 óra'),
(4, 'Autó Sárvédőív lakatolás', 'Hegesztés', '2023-01-01', 'https://mot-centre.com/wp-content/uploads/2016/01/0907phr_07_z1971_mopar_muscle_carwelding_rivet_holes.jpg', 'Rozsda eltávolítása, lakatolás.', 'Co2 gáz, 0.8mm-es huzal', 'Kabintér'),
(5, 'Amerikai V8 építés', 'Autotuning', '2023-01-01', 'https://images.pexels.com/photos/3076820/pexels-photo-3076820.jpeg', 'Teljes körű motor építés', 'Hengerfej, nyomórudak, szíjak', '48-52 óra'),
(6, 'Porsche 911 GT3 Ponthegesztés', 'Hegesztés', '2022-01-01', 'https://global.toyota/pages/global_toyota/company/plant-tours/welding_ogp_001.jpg', 'Porsche kasztni hegesztés.', 'Co2 gáz, 0.8mm huzal', '120-250 óra'),
(7, 'Mazda Miata', 'Karosszéria munkák', '2022-01-01', 'https://www.toptreadtyres.co.uk/wp-content/uploads/2019/09/BodyWork.png', 'Egyedi szélesítés a jobb úttartás érdekében.', 'Üvegszál, epoxy', '52-55 óra'),
(8, 'Mercedes beltér', 'Kozmetika', '2022-01-01', 'https://images.pexels.com/photos/193999/pexels-photo-193999.jpeg', 'Egyedi bőrfestés húzatolással', 'Festék, alkantara, bőr', '50-55 óra');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `time`, `price`) VALUES
(1, 'Olajcsere', '0000-00-00 00:00:00', 30000),
(2, 'Fékbetét csere', '0000-00-00 00:00:00', 70000),
(3, 'Műszaki vizsga', '2000-01-20 00:00:00', 60000),
(4, 'Kerékcsere', '0000-00-00 00:00:00', 150000),
(5, 'Klíma tisztítás', '0000-00-00 00:00:00', 25000),
(6, 'Diagnosztika', '0000-00-00 00:00:00', 15000),
(7, 'Akkumulátor csere', '0000-00-00 00:00:00', 60000),
(8, 'Futómű beállítás', '0000-00-00 00:00:00', 15000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `service_status`
--

CREATE TABLE `service_status` (
  `id` int(11) NOT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `oil_change` tinyint(1) DEFAULT NULL,
  `brake_repair` tinyint(1) DEFAULT NULL,
  `general_inspection` tinyint(1) DEFAULT NULL,
  `diagnostic` tinyint(1) DEFAULT NULL,
  `ac_fill` tinyint(1) DEFAULT NULL,
  `clutch_change` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `service_status`
--

INSERT INTO `service_status` (`id`, `license_plate`, `service_date`, `oil_change`, `brake_repair`, `general_inspection`, `diagnostic`, `ac_fill`, `clutch_change`) VALUES
(1, 'ABC-123', '2026-01-04', 1, 1, 1, 1, 1, 1),
(2, 'XYZ-999', '2026-01-04', 0, 1, 1, 1, 0, 0),
(3, 'MER-555', '2026-01-04', 1, 1, 1, 0, 0, 0),
(4, 'DE-4567', '2026-01-04', 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_status`
--

CREATE TABLE `service_status` (
  `id` int(11) NOT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `oil_change` tinyint(1) DEFAULT NULL,
  `brake_repair` tinyint(1) DEFAULT NULL,
  `general_inspection` tinyint(1) DEFAULT NULL,
  `diagnostic` tinyint(1) DEFAULT NULL,
  `ac_fill` tinyint(1) DEFAULT NULL,
  `clutch_change` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_status`
--

INSERT INTO `service_status` (`id`, `license_plate`, `service_date`, `oil_change`, `brake_repair`, `general_inspection`, `diagnostic`, `ac_fill`, `clutch_change`) VALUES
(1, 'ABC-123', '2026-01-04', 1, 1, 1, 1, 1, 1),
(2, 'XYZ-999', '2026-01-04', 0, 1, 1, 1, 0, 0),
(3, 'MER-555', '2026-01-04', 1, 1, 1, 0, 0, 0),
(4, 'DE-4567', '2026-01-04', 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `phone_number`, `role`) VALUES
(1, 'Kiss Péter', 'pw123', 'peter.kiss@example.com', '+36201234567', 'customer'),
(2, 'Nagy Anna', 'pw456', 'anna.nagy@example.com', '+36205554444', 'admin'),
(3, 'Tóth Béla', 'pw789', 'bela.toth@example.com', '+36207778888', 'mechanic'),
(4, 'Szabó László', 'pw111', 'laszlo.szabo@example.com', '+36209991111', 'customer'),
(5, 'Horváth Júlia', 'pw222', 'julia.horvath@example.com', '+36203334444', 'customer'),
(6, 'Farkas Gergely', 'pw333', 'gergely.farkas@example.com', '+36206667777', 'mechanic'),
(7, 'Molnár Eszter', 'pw444', 'eszter.molnar@example.com', '+36201239876', 'customer'),
(8, 'Balogh Tamás', 'pw555', 'tamas.balogh@example.com', '+36204561234', 'admin'),
(9, 'admin', 'admin', 'admin@admin.com', '5555', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(5) NOT NULL,
  `vehicle_make` varchar(100) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `country_id` int(5) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `traffic_permit_date` datetime DEFAULT NULL,
  `technical_exam_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `vehicle_make`, `vehicle_model`, `user_id`, `license_plate`, `country_id`, `color`, `traffic_permit_date`, `technical_exam_date`) VALUES
(1, 'Toyota', 'Corolla', 1, 'ABC-123', 1, 'piros', '2020-05-10 00:00:00', '2022-05-10 00:00:00'),
(2, 'BMW', '320d', 1, 'XYZ-999', 1, 'fekete', '2021-03-15 00:00:00', '2023-03-15 00:00:00'),
(3, 'Audi', 'A4', 2, 'DE-4567', 2, 'kék', '2019-07-01 00:00:00', '2021-07-01 00:00:00'),
(4, 'Ford', 'Focus', 4, 'FOC-444', 3, 'szürke', '2022-01-10 00:00:00', '2024-01-10 00:00:00'),
(5, 'Mercedes', 'C200', 5, 'MER-555', 4, 'fehér', '2021-06-20 00:00:00', '2023-06-20 00:00:00'),
(6, 'Volkswagen', 'Golf', 6, 'GOL-666', 5, 'zöld', '2020-09-15 00:00:00', '2022-09-15 00:00:00'),
(7, 'Opel', 'Astra', 7, 'AST-777', 2, 'sárga', '2019-11-01 00:00:00', '2021-11-01 00:00:00'),
(8, 'Skoda', 'Octavia', 8, 'OCT-888', 1, 'kék', '2023-02-05 00:00:00', '2025-02-05 00:00:00');

--
-- Indexes for dumped tables
--

--
<<<<<<< HEAD
-- Indexes for table `appointments`
=======
-- A tábla indexei `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- A tábla indexei `appointments`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `service_id` (`service_id`);

--
<<<<<<< HEAD
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `country`
=======
-- A tábla indexei `country`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_content`
--
ALTER TABLE `hero_content`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- Indexes for table `language`
=======
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `language`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- Indexes for table `service_status`
=======
-- A tábla indexei `service_status`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `service_status`
  ADD PRIMARY KEY (`id`);

--
<<<<<<< HEAD
-- Indexes for table `user`
=======
-- A tábla indexei `user`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_id` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
<<<<<<< HEAD
-- AUTO_INCREMENT for table `appointments`
=======
-- AUTO_INCREMENT a táblához `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `appointments`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `appointments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
<<<<<<< HEAD
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `country`
=======
-- AUTO_INCREMENT a táblához `country`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `country`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hero_content`
--
ALTER TABLE `hero_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
<<<<<<< HEAD
-- AUTO_INCREMENT for table `products`
=======
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `products`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `products`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
<<<<<<< HEAD
-- AUTO_INCREMENT for table `service_status`
=======
-- AUTO_INCREMENT a táblához `service_status`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `service_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
<<<<<<< HEAD
-- AUTO_INCREMENT for table `user`
=======
-- AUTO_INCREMENT a táblához `user`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
<<<<<<< HEAD
-- Constraints for table `appointments`
=======
-- Megkötések a táblához `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `appointments`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

--
<<<<<<< HEAD
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `vehicle`
=======
-- Megkötések a táblához `vehicle`
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
