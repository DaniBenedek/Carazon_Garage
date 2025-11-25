-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 25. 07:52
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `carazongarage`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `appointments`
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
-- A tábla adatainak kiíratása `appointments`
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
-- Tábla szerkezet ehhez a táblához `cart`
--

CREATE TABLE `cart` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `cart`
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
-- Tábla szerkezet ehhez a táblához `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(5) NOT NULL,
  `cart_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `quantity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `cart_items`
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
-- Tábla szerkezet ehhez a táblához `country`
--

CREATE TABLE `country` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `country`
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
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `storage_quantity` int(4) DEFAULT 0,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `storage_quantity`, `type`) VALUES
(1, 'Motorolaj 5W-30', 12000.00, 50, 'oil'),
(2, 'Fékbetét szett', 25000.00, 20, 'brake'),
(3, 'Szélvédőmosó folyadék', 2000.00, 100, 'fluid'),
(4, 'Téli gumi szett', 120000.00, 10, 'tyre'),
(5, 'Autó akkumulátor 60Ah', 45000.00, 15, 'battery'),
(6, 'Klímatisztító spray', 5000.00, 40, 'cleaning'),
(7, 'Futómű alkatrész szett', 80000.00, 5, 'suspension'),
(8, 'OBD diagnosztikai eszköz', 30000.00, 8, 'tool');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `service`
--

CREATE TABLE `service` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `service`
--

INSERT INTO `service` (`id`, `name`, `time`) VALUES
(1, 'Olajcsere', '0000-00-00 00:00:00'),
(2, 'Fékbetét csere', '0000-00-00 00:00:00'),
(3, 'Műszaki vizsga', '2000-01-20 00:00:00'),
(4, 'Kerékcsere', '0000-00-00 00:00:00'),
(5, 'Klíma tisztítás', '0000-00-00 00:00:00'),
(6, 'Diagnosztika', '0000-00-00 00:00:00'),
(7, 'Akkumulátor csere', '0000-00-00 00:00:00'),
(8, 'Futómű beállítás', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
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
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `phone_number`, `role`) VALUES
(1, 'Kiss Péter', 'pw123', 'peter.kiss@example.com', '+36201234567', 'customer'),
(2, 'Nagy Anna', 'pw456', 'anna.nagy@example.com', '+36205554444', 'admin'),
(3, 'Tóth Béla', 'pw789', 'bela.toth@example.com', '+36207778888', 'mechanic'),
(4, 'Szabó László', 'pw111', 'laszlo.szabo@example.com', '+36209991111', 'customer'),
(5, 'Horváth Júlia', 'pw222', 'julia.horvath@example.com', '+36203334444', 'customer'),
(6, 'Farkas Gergely', 'pw333', 'gergely.farkas@example.com', '+36206667777', 'mechanic'),
(7, 'Molnár Eszter', 'pw444', 'eszter.molnar@example.com', '+36201239876', 'customer'),
(8, 'Balogh Tamás', 'pw555', 'tamas.balogh@example.com', '+36204561234', 'admin');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vehicle`
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
-- A tábla adatainak kiíratása `vehicle`
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
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `service_id` (`service_id`);

--
-- A tábla indexei `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- A tábla indexei `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_id` (`country_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `country`
--
ALTER TABLE `country`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `service`
--
ALTER TABLE `service`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

--
-- Megkötések a táblához `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Megkötések a táblához `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Megkötések a táblához `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
