-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Máj 07. 01:47
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

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

--
-- A tábla adatainak kiíratása `applicants`
--

INSERT INTO `applicants` (`id`, `job_id`, `name`, `email`, `message`, `created_at`) VALUES
(9, 3, 'Horváth Kázmér', 'kazmer@email.hu', 'Szeretnék a csapat tagja lenni, 15 év szakmai múltam van.', '2026-03-10 09:00:00'),
(10, 3, 'Szűcs Tamás', 'tomi.szucs@email.hu', 'Autóvillamossági szakértő vagyok, váltani szeretnék.', '2026-04-15 07:30:00'),
(11, 4, 'Bakos Elvira', 'elvira.b@marketing.hu', 'Kreatív hirdetési stratégiákkal növelném a forgalmat.', '2026-05-01 12:20:00'),
(12, 3, 'Nagy Elemér', 'elemer.nagy@auto.hu', 'Húsz éve szerelek autókat, a váltójavítás a specialitásom.', '2026-05-01 08:00:00'),
(13, 3, 'Kis Antal', 'anti.k@muhely.hu', 'Fiatal vagyok és motivált, jelenleg segédszerelőként dolgozom.', '2026-05-02 07:30:00'),
(14, 4, 'Kovács Réka', 'reka.marketing@media.hu', 'A közösségi média kampányokban tudnék segíteni a garázs imázsát építeni.', '2026-05-03 12:15:00'),
(15, 3, 'Bodrogi Iván', 'ivan.b@diesel.hu', 'Dízel diagnosztikában verhetetlen vagyok.', '2026-05-05 09:00:00');

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
(1, 1, 1, 1, '2025-11-20', 'booked', 'Olajcsere esedékes', '2025-11-11 11:08:25', 30000.00),
(2, 1, 2, 2, '2025-11-25', 'pending', 'Fékbetét csere szükséges', '2025-11-11 11:08:25', 70000.00),
(3, 2, 3, 3, '2025-12-01', 'confirmed', 'Műszaki vizsga', '2025-11-11 11:08:25', 60000.00),
(4, 4, 4, 4, '2025-12-05', 'booked', 'Kerékcsere téli gumikra', '2025-11-11 11:14:40', 150000.00),
(5, 5, 5, 5, '2025-12-10', 'confirmed', 'Klíma tisztítás', '2025-11-11 11:14:40', 25000.00),
(6, 6, 6, 6, '2025-12-15', 'pending', 'Diagnosztika szükséges', '2025-11-11 11:14:40', 15000.00),
(7, 7, 7, 7, '2025-12-20', 'booked', 'Akkumulátor csere', '2025-11-11 11:14:40', 60000.00),
(8, 8, 8, 8, '2025-12-22', 'confirmed', 'Futómű beállítás', '2025-11-11 11:14:40', 15000.00),
(34, 15, 12, 7, '2026-04-09', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(35, 15, 12, 5, '2025-10-31', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 25000.00),
(36, 15, 12, 3, '2025-11-24', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(37, 16, 13, 8, '2025-12-14', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(38, 16, 13, 1, '2025-12-04', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 30000.00),
(39, 16, 13, 1, '2026-02-14', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 30000.00),
(40, 17, 14, 5, '2026-04-10', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 25000.00),
(41, 17, 14, 5, '2026-04-17', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 25000.00),
(42, 17, 14, 4, '2025-11-04', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 150000.00),
(43, 18, 15, 7, '2026-04-05', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(44, 18, 15, 8, '2026-03-31', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(45, 18, 15, 4, '2025-09-19', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 150000.00),
(46, 19, 16, 1, '2025-11-05', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 30000.00),
(47, 19, 16, 8, '2026-03-11', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(48, 19, 16, 8, '2026-01-18', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(49, 32, 28, 4, '2026-04-09', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 150000.00),
(50, 32, 28, 2, '2026-04-17', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 70000.00),
(51, 32, 28, 5, '2025-12-14', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 25000.00),
(52, 33, 27, 5, '2025-10-03', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 25000.00),
(53, 33, 27, 4, '2025-09-13', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 150000.00),
(54, 33, 27, 4, '2026-02-06', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 150000.00),
(55, 34, 26, 5, '2025-11-22', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 25000.00),
(56, 34, 26, 6, '2026-03-15', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(57, 34, 26, 3, '2026-03-31', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(58, 35, 25, 4, '2026-01-16', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 150000.00),
(59, 35, 25, 3, '2025-10-07', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(60, 35, 25, 3, '2026-01-28', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(61, 36, 24, 3, '2026-02-08', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 60000.00),
(62, 36, 24, 6, '2026-03-22', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(63, 36, 24, 2, '2025-11-30', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 70000.00),
(64, 37, 23, 8, '2025-11-26', 'pending', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 15000.00),
(65, 37, 23, 2, '2026-02-07', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 70000.00),
(66, 37, 23, 2, '2025-11-05', 'confirmed', 'Automata generált szerviz bejegyzés.', '2025-08-26 22:00:00', 70000.00),
(97, 49, 29, 9, '2026-05-09', 'booked', 'Online foglalás', '2026-05-06 15:25:32', NULL);

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
--

CREATE TABLE `language` (
  `id` char(2) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
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
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `storage_quantity`, `type`, `item_number`, `description`) VALUES
(1, 'Motorolaj 5W-30', 11000.00, 118, 'oil', 'MOT 5W-30 8100 X-CLEAN 5L', 'Motul 5w30 X clean ami segíti a motor élettartamát'),
(2, 'Fékbetét szett', 24000.00, 141, 'brake', '60m-br-c5', '60mm féktárcsára való fékbetét szett'),
(3, 'Szélvédőmosó folyadék', 2000.00, 45, 'fluid', 'TESCO-5l-W', 'Tescos szélvédő mosó téli 5literes'),
(4, 'Téli gumi szett', 180000.00, 90, 'tyre', 'Han-558-W', 'Hankook 205/55/r16 téli gumi szett'),
(5, 'Autó akkumulátor 60Ah', 45000.00, 156, 'battery', 'Var-60-AGM', 'Varta 60ah akkumlátor zselés'),
(6, 'Klímatisztító spray', 5000.00, 50, 'cleaning', 'AC-555-c', 'Klíma bomba citromos'),
(7, 'Alsó lengőkar szilent', 80000.00, 75, 'suspension', 'Szl-511-HU', 'Poliuretán sárga lengőkar szilent 500x500'),
(8, 'OBD diagnosztikai eszköz', 30000.00, 62, 'tool', 'OBD-11-556', 'Obd eleven hibakód olvasó eszköz'),
(9, 'Olajszűrő', 5499.00, 79, 'oilfilter', 'HU 6014/1 Z', 'Bmw g20 olajszűrő'),
(13, 'Vezérműszíj készlet', 65000.00, 10, 'engine', 'CONT-TIM-99', 'Continental vezérlés szett vízpumpával'),
(14, 'Hűtőfolyadék G12+', 3500.00, 45, 'fluid', 'COOL-G12-1L', '1 literes tömény fagyálló hűtőfolyadék'),
(15, 'Féktárcsa (pár)', 38000.00, 12, 'brake', 'BREM-D-450', 'Brembo hűtött féktárcsa készlet'),
(16, 'Xenon izzó D2S', 12000.00, 20, 'lighting', 'OSRAM-D2S-X', 'Osram Night Breaker Laser xenon'),
(17, 'Pollenszűrő (aktív szén)', 8500.00, 30, 'filter', 'MANN-CUK-123', 'Mann Filter aktív szenes pollenszűrő'),
(18, 'Gyújtógyertya Iridium', 6500.00, 80, 'engine', 'NGK-IR-77', 'NGK Laser Iridium hosszú élettartamú gyertya'),
(19, 'Üzemanyagszűrő Diesel', 14500.00, 25, 'filter', 'BOSCH-F-55', 'Bosch prémium gázolajszűrő vízérzékelővel'),
(20, 'Hosszbordás szíj', 9800.00, 40, 'engine', 'GATES-6PK', 'Gates Micro-V gumi szíj'),
(21, 'Féknyereg felújító készlet', 5200.00, 15, 'brake', 'TRW-RK-10', 'TRW tömítés és dugattyú szett'),
(22, 'Légtömegmérő', 42000.00, 8, 'sensor', 'PIER-MAF-80', 'Pierburg légtömegmérő szenzor'),
(23, 'Stabilizátor pálca', 8500.00, 50, 'suspension', 'LEMF-ST-12', 'Lemförder erősített stabilizátor összekötő'),
(24, 'Kormányösszekötő gömbfej', 11000.00, 30, 'suspension', 'MEYLE-HD-01', 'Meyle HD erősített kivitel'),
(25, 'Szelepfedél tömítés', 13500.00, 20, 'engine', 'ELR-GSK-22', 'Elring gyári minőségű gumitömítés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(200) NOT NULL,
  `year` date NOT NULL,
  `img` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `materials` varchar(200) NOT NULL,
  `dimensions` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `projects`
--

INSERT INTO `projects` (`id`, `title`, `category`, `year`, `img`, `description`, `materials`, `dimensions`) VALUES
(1, 'Lowrider Légzsák', 'Autotuning', '2024-01-01', 'https://images.pexels.com/photos/242125/pexels-photo-242125.jpeg', 'Egyedi tervezésű Lowrider légrugós rendszer beépítése. A projekt során nemcsak a légzsákok és a kompresszor beszerelését végeztük el, hanem megerősítettük a futómű bekötési pontjait is, hogy az autó bírja az extrém magasságváltoztatásokat és a látványos \"pattogást\". Precíz vezérlést kapott a kabintérből.', 'Légzsák, rúgó', '4-6 óra'),
(2, 'Mercedes bőrözés', 'Kozmetika', '2024-01-01', 'https://images.pexels.com/photos/1104768/pexels-photo-1104768.jpeg', 'A klasszikus Mercedes eleganciát emeltük új szintre. A teljes beltér - az ülések, az ajtókárpitok és a műszerfal is - prémium nappa bőr és perforált alcantara borítást kapott. A kontrasztos díszvarrások és a bőrfeszítési technológia garantálja a gyári minőséget meghaladó kényelmet és esztétikát.', 'Bőr, cérna, alkantara', '6-8 óra'),
(3, 'Renault Clio Fényezés', 'Fényezés', '2023-01-01', 'https://miraclebodyandpaint.com/wp-content/uploads/2022/02/Auto-Paint-job-4-1200x480.jpg', 'Teljes karosszéria-rehabilitáció és esztétikai megújulás. A munka során eltávolítottuk a lakkhibákat és a mélyebb karcokat, majd egy különleges, gyári színkóddal megegyező, de mélyebb fényű bázist és három rétegű lakkot hordtunk fel. A végeredmény egy tükörsima, bemutatótermi állapotú fényezés.', 'Festék, edző, hígító', '20-22 óra'),
(4, 'Autó Sárvédőív lakatolás', 'Hegesztés', '2023-01-01', 'https://mot-centre.com/wp-content/uploads/2016/01/0907phr_07_z1971_mopar_muscle_carwelding_rivet_holes.jpg', 'A típusra jellemző kritikus korróziós pontok szakszerű javítása. A hátsó sárvédőíveket a rozsda teljes kivágása után új, méretpontos javítóívekkel pótoltuk. A hegesztéseket CO2 technológiával végeztük, majd cink alapú korrózióvédelemmel láttuk el a felületeket a tartósság érdekében.', 'Co2 gáz, 0.8mm-es huzal', 'Kabintér'),
(5, 'Amerikai V8 építés', 'Autotuning', '2023-01-01', 'https://images.pexels.com/photos/3076820/pexels-photo-3076820.jpeg', 'Egy klasszikus amerikai V8-as motor teljes újjáépítése (full rebuild). A blokkot alapméretre fúrtuk, kovácsolt dugattyúkat, nagyobb emelésű vezérműtengelyt és felújított hengerfejeket szereltünk be. A cél a megbízhatóság mellett a nyomaték és a jellegzetes V8-as hangkarakter maximalizálása volt.', 'Hengerfej, nyomórudak, szíjak', '48-52 óra'),
(6, 'Porsche 911 GT3 Ponthegesztés', 'Hegesztés', '2022-01-01', 'https://global.toyota/pages/global_toyota/company/plant-tours/welding_ogp_001.jpg', 'Verseny célú karosszéria-merevítés és szerkezeti javítás. A Porsche 911 GT3 vázszerkezetén elvégeztük a kritikus pontok utánhegesztését (stitch welding), hogy növeljük a torziós merevséget a pályanapokon való használathoz. Minden hegesztési varratot ultrahangos vizsgálattal ellenőriztünk.', 'Co2 gáz, 0.8mm huzal', '120-250 óra'),
(7, 'Mazda Miata', 'Karosszéria munkák', '2022-01-01', 'https://www.toptreadtyres.co.uk/wp-content/uploads/2019/09/BodyWork.png', 'Egyedi szélesítési projekt (widebody kit). Üvegszálas és epoxi technológiával szélesítettük ki a kerékjáratokat, hogy az autó alá beférjenek a nagyobb nyomtávú felnik. A folyamat magában foglalta a sárvédők precíz formára csiszolását és a karosszériához való hézagmentes illesztését.', 'Üvegszál, epoxy', '52-55 óra'),
(8, 'Mercedes beltér', 'Kozmetika', '2022-01-01', 'https://images.pexels.com/photos/193999/pexels-photo-193999.jpeg', 'Kreatív belsőtér-átalakítás, ahol a funkció találkozik a luxussal. Az ülések egyedi varrásmintát kaptak, a bőrfelületeket speciális festési eljárással tettük tartósabbá. Az alcantara tetőkárpit beépítése mellett a műanyag elemeket is bőrborítással láttuk el, így teljesen prémium érzetet nyújt a kabin.', 'Festék, alkantara, bőr', '50-55 óra'),
(9, 'Subaru WRX Motorfelújítás', 'Autotuning', '2025-11-15', 'https://images.pexels.com/photos/190574/pexels-photo-190574.jpeg', 'Subaru WRX teljes motorépítés és szoftveres optimalizálás a maximális teljesítmény érdekében.', 'Kovácsolt dugattyúk, csapágyak', '120-150 óra'),
(10, 'Oldtimer Restaurálás', 'Karosszéria munkák', '2025-09-20', 'https://images.pexels.com/photos/3354648/pexels-photo-3354648.jpeg', 'Ford Mustang vázkeretig való visszabontása és teljes szerkezeti újjáépítése.', 'Eredeti alkatrészek, nitrolakk', '800-1000 óra'),
(11, 'Carbon kiegészítők', 'Kozmetika', '2026-02-10', 'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg', 'Egyedi szénszálas kiegészítők és beltéri elemek finomhangolása és esztétikai javítása.', 'Szénszövet, epoxi gyanta', '40-50 óra'),
(12, 'Audi RS6 Chiptuning', 'Autotuning', '2026-02-15', 'https://images.pexels.com/photos/1035108/pexels-photo-1035108.jpeg', 'Audi RS6 teljesítménynövelés, szoftveres módosítás és egyedi kipufogórendszer illesztése.', 'Szoftver, Inox kipufogó', '12-16 óra'),
(13, 'Tesla Model 3 Fóliázás', 'Kozmetika', '2026-03-01', 'https://images.pexels.com/photos/5214413/pexels-photo-5214413.jpeg', 'Tesla Model 3 teljes karosszériavédő és esztétikai fóliázás, karcmentesítő réteggel.', '3M Wrap fólia', '32-40 óra'),
(14, 'BMW E46 Drift Build', 'Hegesztés', '2025-12-10', 'https://images.pexels.com/photos/544542/pexels-photo-544542.jpeg', 'BMW E46 bukócső hegesztés és futómű bekötési pontok megerősítése versenycélra.', 'Acélcső, Hidraulika', '150-200 óra'),
(15, 'Golf 8 GTE Hangrendszer', 'Kozmetika', '2026-04-12', 'https://images.pexels.com/photos/38271/ipad-map-tablet-internet-38271.jpeg', 'Golf 8 teljes utastér zajszigetelés és prémium hifi rendszer akusztikai integrációja.', 'Hertz hangszórók, STP szigetelés', '24-30 óra'),
(16, 'Land Cruiser Off-road kit', 'Karosszéria munkák', '2026-01-25', 'https://images.pexels.com/photos/919073/pexels-photo-919073.jpeg', 'Land Cruiser terepjáró kiegészítők: emelt futómű és védőlemezek felszerelése.', 'Old Man Emu szett, Warn csörlő', '48-60 óra');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `service`
--

CREATE TABLE `service` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `service`
--

INSERT INTO `service` (`id`, `name`, `time`, `price`) VALUES
(1, 'Olajcsere', '0000-00-00 00:00:00', 30000),
(2, 'Fékbetét csere', '0000-00-00 00:00:00', 70000),
(3, 'Műszaki vizsga', '2000-01-20 00:00:00', 60000),
(4, 'Kerékcsere', '0000-00-00 00:00:00', 150000),
(5, 'Klíma tisztítás', '0000-00-00 00:00:00', 25000),
(6, 'Diagnosztika', '0000-00-00 00:00:00', 15000),
(7, 'Akkumulátor csere', '0000-00-00 00:00:00', 60000),
(8, 'Futómű beállítás', '0000-00-00 00:00:00', 15000),
(9, 'Váltóolaj csere', '2026-01-01 02:00:00', 45000),
(10, 'Vezérlés csere', '2026-01-01 05:00:00', 120000),
(11, 'Futómű szilentezés', '2026-01-01 03:00:00', 55000),
(12, 'Fényszóró polírozás', '2026-01-01 01:00:00', 15000),
(13, 'Hűtőrendszer átmosás', '2026-01-01 02:00:00', 22000),
(14, 'Dióhéjas szívósor tisztítás', '2026-01-01 04:00:00', 85000),
(15, 'Automata váltó átmosás', '2026-01-01 03:00:00', 110000),
(16, 'Kipufogó dob javítás/hegesztés', '2026-01-01 02:00:00', 25000),
(17, 'EGR szelep tisztítás/csere', '2026-01-01 02:30:00', 40000),
(18, 'Részecskeszűrő (DPF) regenerálás', '2026-01-01 02:00:00', 35000);

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
(4, 'DE-4567', '2026-01-04', 1, 1, 1, 0, 0, 0),
(5, 'AST-777', '2026-05-06', 1, 0, 1, 1, 0, 0),
(6, 'BMW-125', '2026-05-06', 1, 0, 1, 1, 0, 0),
(7, 'GOL-666', '2026-05-06', 1, 0, 1, 1, 0, 0),
(8, 'KIA-777', '2026-05-06', 1, 0, 1, 1, 0, 0),
(9, 'LIT-500', '2026-05-06', 1, 0, 1, 1, 0, 0),
(10, 'MEG-799', '2026-05-06', 1, 0, 1, 1, 0, 0),
(11, 'MERC-001', '2026-05-06', 1, 0, 1, 1, 0, 0),
(12, 'MON-165', '2026-05-06', 1, 0, 1, 1, 0, 0),
(13, 'OCT-888', '2026-05-06', 1, 0, 1, 1, 0, 0),
(14, 'SEA-105', '2026-05-06', 1, 0, 1, 1, 0, 0);

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
  `role` varchar(50) DEFAULT NULL,
  `img` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `phone_number`, `role`, `img`) VALUES
(1, 'Kiss Péter', 'pw123', 'peter.kiss@example.com', '+36201234567', 'customer', ''),
(2, 'Nagy Anna', 'pw456', 'anna.nagy@example.com', '+36205554444', 'admin', ''),
(3, 'Tóth Béla', 'pw789', 'bela.toth@example.com', '+36207778888', 'mechanic', ''),
(4, 'Szabó László', 'pw111', 'laszlo.szabo@example.com', '+36209991111', 'customer', ''),
(5, 'Horváth Júliass', 'pw222', 'julia.horvath@example.com', '+36203334444', 'customer', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFRUXGRgYGBgYGBgYGBkXGBgYHx0YGhoYHSggGBolHRUaITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy0lICUtLS01LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKUBMQMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAABAIDAQUGBwj/xABMEAABAwIEAwIICAsGBgMAAAABAAIRAyEEEjFBBVFhInEGBxMygZGh8BRCU5OxwdHhFRcjJENSdJSz0/ElM2JyktI0NURUZKMWgoT/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAAsEQACAgEDAwMDBQADAAAAAAAAAQIRAxIhMQRBURMUMiJh8CMzcZGhgcHh/9oADAMBAAIRAxEAPwDceNLw3xuDxzaGHqMYw0GPINNriXOfVBudoYFyJ8aHFfl6fzLE547/APmbf2Wl/Frrgrz6l34cUJQTaMZyaZ2X40OK/L0/mWIPjR4oP09P5li46FFzRDjG2v2+pavDDwRrZ2f40eKfL0/mWIHjQ4r8vT9FFh9HeuMa7MLaK+u7swBdHo46uh6pHWnxncV+Xp/MsR+M/iny9P5li41jTefUpoWHH4Frfk7AeM7iny9P5liyPGbxT5en8yxceAptHoAT9DH4DW/J17fGVxU/p6fzLEfjK4r8vT+ZYuUZOsqeEoRJcZJJPrT9vj8Brfk6z8ZHE/8AuGfMsWGeMnih/Ts+ZZ61zzRe10rjDD7aRc9yHgxreg1yOvHjF4n/ANwz5lnJV/jI4oDBrs+ZYucwwgWH1D71LyJzAkW173T7BCPb4/Aa35OjreMTioEivT+ZYqfxl8W+WZFv0LNOaRNMR2rAelU1MoaXAGx3EeroiXT4/AKcje4fxj8RdY4hjTsPJU5ju2U6/jC4k1wHwhpm4/I079O9c9VpNcLEGbbehLkRcSYkTMhp6z8U79wXP1OFLG9C3LhN3udYzxhcSIkVXRaD5Glfr0Ca4r4acTosn4Q3NAN6VMiC3MIIHKAeRlclhcOwgAwSIMlo86+xF4Oo+1NcYxc0xh7EskFw1cO1ltECAQJvoOS8zX5NbNyPD/iIAzYpgJnSiy5HIKLvGJxEGDXAvAigx02mYaLWBPSFzlFweA+Oo6SrKmFLxnGYlhnssLzl5QAYFl7Dwwq0kYa3ZuvxicUzOHwhkAwPyDNFj8YnFfl2fMsK52q8Pc0t03MGHEZTrvAcO6UVaT3GBLWiJgXdmuL7Ag2jVHo4q4DVI6an4xeJTeuI3ijTn0SFYfGDxGJGJaZ0/Is0nS/xguf8mAAI9HJUVaVQA5Ce1ENAnMZEW/WsNDOijJ0yW6GsjOuPjAxtm/CoeR8ahSDZ5AjWN9Fe3wzx4gvxYa1wJafg7XHLaDAFxroZuFxDMQC2XMMGBHMkxa+g19atrMJaAHltMNykSRLQIDBvMW7lzZenreL/AOO5Sn5N5V8YvFm1IFVjmAtJd5FoBaSARoIN4jmCve181YirLAfKOMkEtJk6jtcyL9RqvpVYLeKZp3BCEIGCEIQAIQhAAhCEAeCeO/8A5m39mpfxa64Mhd547z/abf2Wl/FrrgR9K9Lp/wBtfnc55/IyBooupyIJ9ClF1DEOJAY0CdSeS2dUSi0mIGimW7rLaAEGQZhTrPDAC7UmA3c/cq45ApDIUwFezDknS+pO3cFGtTM9AJhFUIrU2hYaFNoCaAk0qxl1EK1rFQi+jTjT7FjEtZEG9jpPrjdDQQmsPTnX1A6d/NDXYBHANMXgO35+lbKlTcNTP1BVU8PBKZDYt6ULZAwffYx768lB7JBadCIWa+IDWwTBzscNLhragcBmaZJzAARcn148vSAuXfq5hBY50G87HQlok2MAyAOWfUqM3GRahatCVVjWtktDnAgCdLmJVlMGLwA7NcAxcWtrqm8SCXdrVsN/0WE84A9gS1SO1zBtc+30nRa8oRZh6QDiLOA7N2RMjUNLp2169DEOJnKeUwLAg2AuNS2Jid+XKilReHkgjqTEiBFpBturzTJdJkusC6LdrNa1gOyV5/s/q34s11qiFGn2YiBsBZbXh3HW4enXs4vDqDmw+owE0/KuMupODoGZtiYObote611rMY0uc8C9gXaRbcjWYgT9y6upT0aV5REObOgo8Yp/By2o1jqjjjapPk5y1qzKRpmmfiNNRpmDoBNkYbilItqXIGXhxIyO/wCnpxX6+c6Bz1EhabDDst7gpGkJBjTmbT16DWEp9PtcWCn5Otqvw/knOhhc9+KyjJNS4p+RObWmGl2a5EjML6KvE4jCsqYQZWOIqYR5yU4LWCg11bM4f3jnOLTAkgtdpvp2CPT7yqg1zqoyuyhrS57tgw87c299ovKWfFpg3Y4y3HKlGmcKaXkZd5N8v8n2xWOJY5n5QCQBRzg7bGbLZYjFYPytM06TBSHlcwczQFgFNrx5PtOa6ZcW1dROfQafE4p0iCRSBE07jM3m6Lzv0khL4gtaYaYAJgZXkgfqmAfeOV+RasbXqF88C3FqjPhFR2Ha40s+WC0MytJBBa0AANnNaBaLDRfTa+Zq72xm3dDQe0NHcnRz1i8r6ZVZklSXgcHyCEIWBYIQhAAhCEACEIQB4J48ATxMDnhaX8WuuErsy5Z5e1ei+OEf2ppP5rR/i4hcLi6cgg7a9F6fTr9Jfnc55/ITaJV2HeyQNSeSwWdqBofqTOGoXmF0R+xDGaVEOdOzdu5U8Lwucl5AJLiR0CcxpNOkctnvt69U5hMPkptaLQNU+ZfwHYyacWaBm58lF1CbOMjewuVLLrdD3xYaof3EaGvhXNfFo19CMN2tCmuM05bOpm56HZV4WmQJFtLKI80U+CVNmqvFiLapWgCM0xM6AzHKTummA2k+56clcZWhNAGyb+jp96YoUo2J9J9/6rDG/UmKbOfvyCdCJMESUSsuMrBMc+dgTbuF9j6kmwLKWIe2AwMPaBhzWmbOaRMSBlcXG/xO9WOxT+0WvMNAMZi3I+o0ubDcxzEyJdeznCBEKqpReAHdmJABkOPxr6Eat57dyWpUGt0EbfSftXI8SnNyT2NNVKixot9KrbTkyVa4LLmEiACQNbaDryXUQLhwk+jqq6tUzOWYOoubg7SBM/SmAwDZUvFoj0k27+iUlaoEJ0yRAMgDabbzJm+/3LFOuCS4wcxMjS14097+piq8AgN7Ua2M7fUs1qgcwidHAXG4vY7/AHLlzwahalVblxe/Bmi0Wh9NoDWi7ovvtsNe/vTFGiZ2PUGR64SNDOWZLtzZgNiWmL6XFt+avPlQMuZnKTZ8bwLg9+nNYdP1u/6hc8e2w5UeBqe5VspmXSbEgxsYECecRIGxJKqGYHtDOC7sXYXDUAGIHxT2hYyOaT+HvNR1J0McRDd4J0uDfT336vXxzoz0tGzqtkaxy3VFOhlFhJMZoc4Bx3MEwO4WOiYYLAEzYX59UFazxxmvqEm1wLYkNAOXQwTrZxdfUme/ovpVfNmKFjaNPpFl9Jrg6mOml9jbG7sEIQuY0BCEIAEIQgAQhCAPCvHOwnigMw0YWkXfO1/YuHxHmgkec70kdfsXY+PJ/wDaTWCZdh6G8WFXEfaFx2J81o0AIEf11Xo9O/0zCfyJUWyQTbX2p3DvDYkRewSgmLaxfoOZ5KQaM4zOGlr6LqTozHXu8rWDQOyy5J5nQDuC2FY8krgqQbndM8ztoPtRSxAc4NbfmdpRwt+4DLOapaZ71nEYgNHdt1VOHcbk2Jui96AniG9h0kDYk6Ba/DvBzRMDQkET1EqziIkNZNnEk9YhXUKZMkWABA5d6S3YdiltIDQX1Ksp3+tVYV0sBmdpO/X60wGSImJ9aaqtgGaQgbT6feFY7l7yhgPd9Sw1UxA4iDLg3vncgbDaR7gwUj2czrEPe0MJa15GYywGZdtoDGd3crG0+y9xDTYtGaIBLXHMczgCAARF9Z0CVwNN1IQ1jQSZJyAkQ7N2MpgMALNQRdp0grz8s3LKorsaxVRsvkxEki8T16SQDbZYP0fWZ+srJ5wBeYFhfkJMetYhdqWxmwUC25MX99FYq3MdIOaBuIF+87JsCbrGItAN43uNCYkEGLoJWatPK2YIEAgHziDNxYSJBuol3QqYSTXINEKsxcwEq6pmyxoHRP16SRdX1mkiYqG8ANaCC60DnMd6q8lDWgsqB20MMZspsegJG0rl6nInCUTSEXaZJze15xJvcmZgzMTpBba6KrZuBfYy76N5UX0QHAw8Q0+eALk7cxb+qewlG8OzTp5pAB5E7aexeRvexvQtTOVu0EwTEkdffklOGOJqVIALJsRz0i/TdN4nEFwbJOUkgMbABtqSdob0lTdTyDM4NlwJDYJEH4xGYSZAvFhsV2Y0sElKb38GT+rZFpMXOnXRI0ccCLsAIMnzj2QdwHAAmRtEDks53/GptYx1pbIE3MRsTf1QmqFFroZBiRAAzZoMwRuDF+a7JTWSHqJ7KyEmnRXjHXe3KDlyie150Akg5zIv3GNF9JL5q4qztHK6JcHFoaWxcCJJNiRMDmvpVcmTiL+xtHuCEIWRQIQhAAhCEACEIQB4Z44g38KtnX4LSg8pq19PYuJx7A2JuQYA2nmu58b9VjOKBzwf+FoxAn9LiFwwwutZ5ysBkD336L0sD/SSX5uYT+RfgQc1iR1DQb6gQeoCt8ofKZDVfbtEZGxJDdTF7jTQgeuNN7j/AHYyDmdfUl6DMpcc0km7lWTCpSsSlSJ4uplY2mJ1knn9pTWBwsixjuS5w2jnHsi6ZfxFjWwGkkrVJLeRPPBmvhmNAvN7k7LAxjGNkAkx6/Sk8Q91VwBbDRqrxSHmwhW+AKnVzUqi0Brb8pKljc7mhodla60DUhWBgiOqxAF9YmO7ePUnp23Cwp0uyGiWhpEjn6eV09Sw4JDo0+lV0AbDfUpt0RAVpJEmHOB97LAUS6NbfR3fch9csktbmdENBt2zOU6jsjKZINoHcs55Ixi2ykgrCGlxIHZgGzoLgYFtHmDAmR3SlKL2OeHXBeC2RFNtg3KABYtJYB0zHkItqAFud7QyCHZQBlp5ySYAPbmeyLWaeRKjRw7ZDgS4gk3AAkx2g28OjqYvvBHmP1M+RSgtjTaKpl7KgLgy+YiYDSYbMScslt7QQItKyHSJH27d46ffoqsTVa2S74wDSIHaDZIBgSfTyHIJKvj3A5WNmN9tNBzXoRclet/0Z14Nk0j7UPNtYWrNasRHZbO+p9CmcGGtlzyStLb7CNg46Ek2ECTYDu2VdSqBqQFrnUS6JeSOSYp4ZovF+v1JK+yGQrvJeGg6uExI2+5Sxp2DsobedImZvz0PpUGua185hMWB19SU4ic1TJJIME9T9ghc/UY9cKXNlQdMdw2LDwQymX7ZnHKO4EyT6k1QL3033IyZgfyjnZyYEGbGDbSTmvsl8NhrA8tI29AVrsKXANzFtMGcrezJzEi+sA92gWU+icUtHI/UvkcoTIzNcAGk+aSC6BDQR0JJidlGo10Go5rSRADXMdYktEWgEdnY/F9ZQMZiSYBAALiYBgkwTbUraCnS8hnYwgtL6svqOc7shosDbKJtax7yuLNNyyO+VsaxSSRpcRUa7JTFolzhuIMAX0Eg/wCkql1A1M5k5WRMAmBIkk25g9wEXMKQyjtgPzvI1eCSYOktsIjuJ9e74dixg2eUe9ga5pAY/MS4CB2g0yYk9LTprpkbhjWLvyxJW7NLWohmftAnsj494gSJbovpVfM76QLXFpb5wdlAJOXNAJIkRYXk7EkXX0wnN/TFXwhx7ghCFmUCEIQAIQhAAhCEAeJeN0/2kemFon/24hcO+m15Bc6b2Gy7Lx0OI4i6DE4SiOt6uI0XI4HDBrQX7DmvT6feCX5yc8/kxo5WCHPA6b+90lh6zXQ1gkNJzHae/da+tRNatMW79k9irCnSZ2ZnMR+qtdbe/YmjJc6s7kxu3NMVLQoGn5IW306qnE4/SWkEBVennkXJe2oZNo6qPlwJO50VOGPZBvopMbubuKAJ0jbzrk6cgr6fvKrYE1h6UmFSQmyzDATmg2nURJ+m1/Wrisu5bBNYHDtfMl1iJyxYGZeZ1aI0F1nlyxxR1S4NcOKWWWiPJq8TiMhae3dwAgtjMe/SzTcchMapqhjDSL4dFRrXHzmPIc+QAIcRaLWNjfZarDV2GqZAJGeXgXaBmMAg2GQE3OsaC6zTrsDJLQ0RYAWJN+Z7u5cEUs0m+xTbjsPCoCRYaSX6SMrQGgbAEEz/AItBuPrdPs9i0rsUarrQ0AQT9SYp0uRMQF24o6Y6Y8Gb53IvJe/MdB5o+tTeXOcLANbqeZVhpCdVMtACtRFZFYrEmyk0TfQBDPpV1YiQho5k6epWsZMGYPRRa2CJv9C1vhHi3UmljRDnTmOhaDtGoN9VM5qKtglYhgTNao4Ew2wJMc7lV4dxdVc4GRseY5qrCw2lEEk36X+5McOoQC46m5WEFdf2W+50uHZ2ZLrC59CBiW7h820I1i5vzO23tSdLEtyZb6tMdA4E+xXPAJtN5iL7H2WXP1vUTg1GJWOKfJflBOUBxL7iHDkAJloiAHT9y2XEnuZQbh3DJnOYNBEikwunNlt2nHrpK07QdMkE3JAeLaG2a3WNIPotxAIqPMknK0AmbRPZk7DMI5LkwLXkuf8AP/ZpLZbClWm4vovktDs8ZTBywD6zGnRMjBs1NWpMAAF0mBYbadOqa45QbSdhKcNBNNzhEGwBA7pnToFJlMEEZQT6uRFhyWbyS1ar3JkuyNeOG0hMuqB2YT+ULRPWNT0XQO4/ji6BjMRFrZmT7WzELUVKIyE2naAT2ojQ8p1vqFHyL2tmNb2BI3sfak5PuC8I29Xwmxoa4jF4gkW85uoNz5iWPhJxBxaG46v6Ms21N6cadUkKuZkNdlAdLj5tt7R7wEEFwy6U+QEF8bnp0WmLFPI6QnOja0/CPHH/AK2vqd2bf/VV1PCvGD/rcR62/wC1JVK4YwOgiQ42dHZaNDbmIjQ2XPfhcbgT6RHfAuu7FPHOUopKltf37ktSSW51A8KeIONsbXA6lnt7Kt4V4Y4z4VhaZxlZ2fE0GEOLMrmOqsDmxlmMpN+pXIVONyCACeUDKPSo+CxLuIYNzrn4VhvR+XZYcgryxhpdIIt3ufWSEIXnm54f43xPFAP/ABaP8XELjW0y98fFA9Hq3XX+OQTxOOeFpfxa9lxz3hpDAZLtdYA9BsvT6f8AaX53OefyJYarmLnMFgIuN1nyDvPebAAercqzCsa0R1Og9ZVT2B/nNzd/1LfsQRfSa9wdcmDGuUdyzWFgOavBDep9ijXeXuAhrQN5v6osjZICryrWNMiTFlDDuLhJQ14LiJB00v76J/DYcE30TW4cGMNQJ6AJ5ogQPSUQBYafSl8Xi20/OibWLoMOm8CSdJ2tFxISyZI4422CVltSoGgk7An/AEgk+wKDqRcKgNQMDmuDCXBpyFwDsw1LoHKBHfKHwoVBlBzG5khoByAx2WgEmTAJOrtEwyg2m81Tc2MuOhkyRlDem5i+s282c59TtFfSaxeh33FW8PpsY4tF7S6/mdkhp6zdwjUAbFUYqsXAC19ArsdxNsZWjNO+iWwwvcbLrxwUVpiQ2+WX0mQAOSuFzYqtMYfXkF0pEhHIT1UHxMHZTxWNaOzTBcegSr5AEi5UtrsBmpWBBGWRoBzKcpMhsuEe+iop1WN/xO17u/ktPjcU6u8MzAMbcxI7/Tsk5afuxpWWY/ib2Wpwx06i59B9S1fFHOe8Bz3PIjM4kuM8pO6sbSzEPLSA64g7bADuTGLpgAWAubejX2LncXJNsu6Cm+waExREC6VY/p0VoxM2IW6aIoepgahbDC1Bo4A+iYHduffv1GGqtbd2im/GGxHoBWWfFDJGmOLaZ0T6VNre0ASSI0yxAOs6mRZLV8I6mG1X08jKpGhBnJc6GGkDbSx3BS5e6pQFKxIeHg/GBmInbzh7hOVH130203Go9oaRMwWZxfPJkh2e4OxPevLeN48mk3W+4rxbFmtiRWcMoOcMbFmsAMWB3iSZ1Kvbi5hry9pMAHLY3tF+zbmqcRSPlaOZkAh4BO+UEGx01iRyRxFx0zBsQepIvuCAF0zw49Ln42/P5M23dDdWuJLIc6NQ3Serj0U3CoWiRlbfs3PZsQZEZfvVNHc8zfv+z7FXXxLWiZC1xdJj0qT/ANI1MuNCnMy8/wCbtRpe7+9J4zGEEhunOL+qSln4/W8+/JJurHddcUlwIaq1y9mUk3MR3i/ryj1BaaqIMHafqW1wdIk6deg+8yEjjqcOM++qjQo8DsTK23goPz3B/tWG/jsWrAWz8Fx+fYP9qw38ampn8X/A1yj6vQhC8w6Dw3xxwOJ5idMLR9P5XELjaThMwM3Tr1XaeN+jm4oBE/m1Geg8riFy9TDmzQO9ep0y/TX53ObJ8hOm4A5QJOpjaSpPqw+IMxfpGwS7scynPkxLtCTHudVDDOMOe4mXaAa3WmrshUPOxUNIDRPfp380riqkkDaLndVmsAOdpPQBTw+Hc7tEaXA+3qh29g4GMBhhYARv791lusuUQqsJTAExcqeus9Y1gaxPILTaMSeWG4jU+aInMAb29fptzjU1qQLnhjZNzcgmIkybAeju5BPU3SZJEEtJYL6HzSNGjQQbxJI2MzEDpMd51PfO68x459S9T2RqmoiNHB5eyHakXiCYGkSYEyd9uSU4g51QwCQy1hFzH3LcXGvLnpOpJ3C1nkC6BOnp1XZHGoRUYk3bsqp4dourgpFgvdRJ5D0lapJcEmSVbR3lURA5nclZLyAY23Og6qrAljcezDjK1sucJvYd5K1GHqVKhEzFzOluiqe8VKoIJfeS4i0jYdFMh4Lhng/UVz25O+xWyNi4BrczQJ2WsdTa1sRmc4m3MwVdTeQA23IKAYwjN5SHOFpDp00taIROSQ0iTsRBaBeAS71JSXPqZnaCw5DoPtThosDbPBNuzlcDtvpz9Srj2J/LcXBUJ9tvvVjGkmLQq3G9gFfRYLk7K4iZCuCNjG0a/cq2NAIJcZOgN/osmTRtJEDqrqGGE3RothZcyg5wnMIHT2QNfWn6FPS7WudvMG2pbpcc+ato025CJ7+fcmaJeD5jmt3Fpgw63ZN/XuozTjjHFNmve1oqUyI+OLEExl1PM6Jys0RJ9hI+hYxxl9GHOAl4Id2bZXT5wAmCDE7A81GmwgHNl12cwme5p9q58XUKctLWzKlGlaFzTza22AGg9ASWMow4CPpn0yE3XrDZa/4Y5swRJ3vI9q63yQihxROneh1Umx+v3CjOneOu6E33DY6ThzgxrQ4QCSSdJEff9C57GgGo4XN5J/r6F0FFxdSygxABNhtAkSbwtd+CdXB1zcb3+tcmFN5ZN/0U6o1uIoAC39Ff4LiMdg/2rDfx2JCtVdJa7UGFsfBifh2D/asN/HYt8juL/gI8o+rUIQvLOg8Q8cAP4Ss4t/NqMkGP0uIXB1cQ9p7FT/CAbza5XaeOon8Jgf8AjUf4uIXDeWytcWMkxAJ7tRuvQw/town8iGCpZRcyT05q6rJgaNGwFz6VXg2PAl+vJW5XO6XienIAFdEV9NEdy2hRBFxa3uVs8OwbJagzl9y2FBkD3utkqJLCrqGZkvg2E5SRTlroAc156mwA6zsaCQfOmN41jeOsLOLJJIMgBzizzC3JYNyAaNEECRzjdYZZXJQ8jrYqfTYCcmWL3aHgHtOgnPcuy5ZOkyhwPvdSCCqjGlQkVObz/qqXstAgb2G/OyZPLms+Tkx9OiqhiLWAGBoqHntZQO9W4msGWJExJSGHrvPaAkusOQEqXJcDouxdbIwv5bLUuZUqgl78rTo2+iziA97sr3QB8UfSVe6oBAAmBuof1PfgfBN7Q1ljERvsqXVATd0QLSVGpTLozacgVI0xuAm7YBWfHmuBsb6gWVTWho5nrewJWH0RsCJtYm/3KbZvaUt73DaiQtylU1qpMtbtFzuZ+hXdIVVUWI0tsnK6BBhmybXTTQcwGw9SXwgAAEf0WzwOHl09VUFshMfpYPM2DoUVcM0RJ5e331TeRpaSXkDKXNAnSDGbSJOgmSIsk6ODIgxBPMw6P8vtXLl65RbUVZUcdltRtgAZEiR07+/ZPcMw/nOJde57R279ClM0GfiAxPM3i3o0T2HqZZvaYg8+RFiDNiOo1XBlzPLLU9i4bbGnqVmuq0rzD3G8iBlkmJudJA1vrKlUdYi9gb7Hs6qziTQatJstkZ5gQSIdqJmO+O4oLcjTPv7Vr0+GUpqfZDk6VGorVMumqVcUzVaXG2iBRAm+gXpS4bM8auSX3F6VIk2E+hNUcIXW+r707h3hotrabb9+b6k3QexjS905i6zRuD6O+/drKhyjFW7LTlJ7V/SKKeBcwQ+o0ANzAlrjPSzrd/RO08MCz+8pxePPkHnGX0epK4vEjK+1oNzbbkp4VzSwOmDy6fbYD0rnyxUXb7lXqiaTj2B8mWvD2vabEtkAHaZEk29qz4Lf8dg/2rDfxmJritEPpVBu245SL/aEj4HvnG4I/wDlYb+OxUpNwd+GRW6PrNCELhNjwjx0tnijbE/m1H0flcQuJqjs7DQTMQPfZfRPhF4D4LG1RWxDHmoGBktq1GdkFxAhjgDd59a1h8VPDPk6v7xX/wB66sfUKENNGcoW7PC8NRc4zo2TJiC7lroE7SpD7LfX1XtA8VfDf1K37xX/AN6Q4r4CcKoZc9PEHMHEZcRW0ZE61B+t9K2XWRXYn0mzy9jJ95KZZS6+/wBK9D/+JcFv26ts0/nGJtk86+aLSJjmFdT8DeDuBIdWID2Uz+cYmz6jwxrT2rEuIb0OsJ+8h4YvSZ5sQstEaelehYrwT4RTe1rhiQHMbUzeXxJaGODyC6Hy0fkyJIiS0akKP/xbgt87qzNfOxNe7RU8nnkPIylxEH/ENEveR8B6TPPgZWYXog8EuCzlD6sgtEDEYn44c5vxtC1jjOkNJUangnwdpcHms0AvEuxNYSac54HlM0NyukxENcdBKPdx8B6TPPm81U+odtbjXp7+teiVPBfgwjK6s92ZjYbia5IzloDiS8ANh4dM3FxNlY7wQ4LlY41KmV7XOafhOI7TWRmcO3cCRfqEPrI+B+kzxjGU5JEy4m/NSxlfybezrpOw+9etVPBPgbQXNbXe7M1sNr1w7t1RSB7TwMuebzcNMTCzh/Azgb3NaWVmuJblD61e5eXgQQ8iT5J51kASYWfuV2Q/TPIcDhBeSXE3JWadKZ2hexU/A3gslpFZhzObBr1/i1XUplryIL2kC884NlEeBXATAl5zEADy+IuSCYHa1gExrAJ2V+7itkhek/J4x5QHQrBC9poeAnAnNc5oqZQ3OT5bEDsHR13XB2O8GNCq63gZwMaNqvJdTblbWrk/lH5Q67xLAZl2ljvAK92u6D0zxoG5WJ0Xtb/AXgTXFpzgtJBHlsR8UkH417gjvBCrpeBXAiJy1W3Ig1q8n8oWCzXHznCw1g6BHu14D0meLSVjDYN7zIiO9e0V/AvggzZadaplp1apyV6ptSDCR2qg7RFQRtY3CvHgVwNswagiZiviLRFzDrC4g6HaVL6pPsNY2eU4Hwfru0DfS5bhvgzWDT5kZf1xdehUPBnhBcWh2IaNATiMSA45qjTAL5IBpO7UZdLrDvBPhGQVGfCKgMu7OIr6MaHZjmqCAA5pn/EDpdD6rakg9I4qpweoDGZrTEw57YzfrekAjoqhwOpVu8sdJs3PLRlFoGhOXfkfX3lbwc4No6tWBnLBxOJBkFsCC+Teq2OecRqmcF4I8NryxhxJHa1xGJAOR7qbol+zmEekETK5cTUHbVluJ5pgPB2oHNzuYO04tOe4a0ki+psB7eSzwPhGJHlPKmmXE2OcGQAJbl2FvTK9TPiv4cdW1/3mv/v6Kxni1wAMj4QDESMViAY5ef0UOK3HR47xHBvbiKdQsa1rwQYdMvDSC6NgQAjFNBF7Bdf4w/BPDYM4Z9AVA576jXZ6tSpbyZOj3GDIF1ylRkiF6fS/AwnszWkC8abKFQQ0/WnjhJSrsM4m4sPV/Vbz4FF00yOD7REhwb/lJn1BW8SrAXGaJsCCPpHRP06VUM7LLiBb4szqDzhTPDqlRsOpvB/ynXbfruuX3EXPT/tdy9Kq6f8Af/hyuIrZtQT0B+qNluMNRaxuV7zcAxNp7lZ+D30tKTnuPL7dlrX4DEl2c0nkgzpp3KpLU+fz/QclVJG3qsGWIgXDtJuNCZvbb7Fz/gkIx+FbyxmHH/vYty8Ymo0Z6T5GsWkRHr+1IeDnCq1PH4UupOa34VhTJFpNan9vtXNCMkpOT5K2vY+qUIQuc0BCEIAFTWwrHmXsa4gOaMzQey6zhfYgCRvCyhACNHwewrZjD0zmLnHM0Ou/zozTE7gdE2cDSMzTZctcey27mkFrja5BAIO0BCEARPDaMZfI04ytZGRsZGGWtiPNabgaBRp8Jw7TmbQpAxEim0GJmJjSRPesIQBj8D4eZ8hSm36NnxW5Rts3sjkLK2pw6i4kupUyXXJLGkk9bX0WEIAofwHDGoKhoszDQxaeeXQneY2byEXO4XQIa00aRa3zQWNhvcIssIQBj8E4fTyFKLfo2fFMjbY3CkzhdAEEUaQIgghjQQRMRa3nH1lYQgDD+D4czNCkZJJmmy5LsxJtc5iXd5lVUeA4Zry9tBgcelttG6DTYbnmZEIAuZwuiA4Ck3K4NaWkS3KzzWhps1okkACJJOqiODYa35vRtBH5Nli2SDpsSY5SUIQBnFcIoVGlr6TCDM9kAnM7M64v2iJPPeVGlwXDtaGihTgAASxpNjmEkiSc3ak731QhAEmcIw4mKFISHNMU2CWu85ptcHcbofwjDnWhSNyb02G5LSTpqS1v+kckIQBkcKoAyKFKRBH5NuomDptmPrKBwqhlDRRpho+KGNDbty6AQRlAEcgOQWEIAPwRh/kKWx/u2ajQ6dB6lOnw6k12ZtJgdMghosTmkjkT5R8ka5jzQhADSEIQBqfCHwcw+NaxuIa5wYS5uV76ZBIg3puB0K0n4suHfJ1v3nE/zEITUmuAoPxZcO+TrfvOJ/mI/Flw75Ot+84n+YhCNT8ipGWeLTh4JIZWBOpGKxImOf5RTd4ucAdW1z/+rE/zEISGR/Frw/8AUr/vWJ/mLA8WnDv1K371if5iEJ2wAeLTh/6lb96xP8xW4fxeYBj2VAyqXU3te3NiMQ4BzHAtOV1QgwWjXkhCLYHVoQhID//Z'),
(6, 'Farkas Gergely', 'pw333', 'gergely.farkas@example.com', '+36206667777', 'mechanic', ''),
(7, 'Molnár Eszter', 'pw444', 'eszter.molnar@example.com', '+36201239876', 'customer', ''),
(8, 'Balogh Tamás', 'pw555', 'tamas.balogh@example.com', '+36204561234', 'admin', ''),
(9, 'admin', 'admin', 'admin@admin.com', '5555', 'admin', ''),
(15, 'Szabó Beatrix', 'pass111', 'bea.szabo@email.hu', '+36203332211', 'customer', ''),
(16, 'Molnár Gábor', 'pass222', 'gabor.molnar@email.hu', '+36308887766', 'customer', ''),
(17, 'Kovács István', 'pass333', 'istvan.kovacs@email.hu', '+36701119988', 'customer', ''),
(18, 'Takács Petra', 'pass444', 'petra.takacs@email.hu', '+36204445522', 'customer', ''),
(19, 'Németh Zoltán', 'pass555', 'zoltan.nemeth@email.hu', '+36306669911', 'customer', ''),
(25, 'Varga Barnabás', '$2y$10$e0MYzW...', 'varga.b.0.8303682150602044@freemail.hu', '+36209988771', 'customer', ''),
(26, 'Kerekes Nóra', 'Nora_2026_Secure', 'nora.k.0.33212312248733183@gmail.com', '+36301122334', 'customer', ''),
(27, 'Fekete Antal', 'Antal_Pass_!99', 'antal.f.0.16951099798969085@citromail.hu', '+36705544332', 'customer', ''),
(28, 'Dudás Miklós', 'DudasMiki_88', 'miklos.d.0.8511856532201038@pro.hu', '+36208877665', 'customer', ''),
(29, 'Somogyi Klára', 'Klara_Secret_77', 'klara.s.0.747395302865091@t-online.hu', '+36304433221', 'customer', ''),
(30, 'Bíró László', 'Laci_Biro_2025', 'laszlo.b.0.1834195853987891@gmail.com', '+36702233445', 'customer', ''),
(31, 'Hajdú Péter', 'HajduPeti_99', 'hajdu.p.0.6749120491323174@v-mail.hu', '+36206677889', 'customer', ''),
(32, 'Kovács Zita', 'Zituka_2026', 'zita.k.0.8243015201988644@test.hu', '+36309911223', 'customer', ''),
(33, 'Major Tamás', 'Tamas_Major_X', 'tamas.m.0.09677148433101501@info.hu', '+36708844221', 'customer', ''),
(34, 'Szilágyi Áron', 'Aron_Sport_2026', 'aron.sz.0.01095289179212683@sport.hu', '+36203344556', 'customer', ''),
(35, 'Lakatos Kevin', 'Kevin_Master_Mechanic', 'kevin.l.0.7644500367012341@muhely.hu', '+36305566778', 'mechanic', ''),
(36, 'Bodnár Jenő', 'Jeno_Pro_Szerelo', 'jeno.b.0.7893915388634349@muhely.hu', '+36706677889', 'mechanic', ''),
(37, 'Varga Barnabás', '$2y$10$e0MYzW...', 'varga.b.0.38096648862675436@freemail.hu', '+36209988771', 'customer', ''),
(38, 'Kerekes Nóra', 'Nora_2026_Secure', 'nora.k.0.0064419051692280035@gmail.com', '+36301122334', 'customer', ''),
(39, 'Fekete Antal', 'Antal_Pass_!99', 'antal.f.0.8893100906995219@citromail.hu', '+36705544332', 'customer', ''),
(40, 'Dudás Miklós', 'DudasMiki_88', 'miklos.d.0.4272247687235705@pro.hu', '+36208877665', 'customer', ''),
(41, 'Somogyi Klára', 'Klara_Secret_77', 'klara.s.0.4681936022529319@t-online.hu', '+36304433221', 'customer', ''),
(42, 'Bíró László', 'Laci_Biro_2025', 'laszlo.b.0.05929373582759289@gmail.com', '+36702233445', 'customer', ''),
(43, 'Hajdú Péter', 'HajduPeti_99', 'hajdu.p.0.8918879031128137@v-mail.hu', '+36206677889', 'customer', ''),
(44, 'Kovács Zita', 'Zituka_2026', 'zita.k.0.281558338814935@test.hu', '+36309911223', 'customer', ''),
(45, 'Major Tamás', 'Tamas_Major_X', 'tamas.m.0.7321280154698789@info.hu', '+36708844221', 'customer', ''),
(46, 'Szilágyi Áron', 'Aron_Sport_2026', 'aron.sz.0.8159650916382345@sport.hu', '+36203344556', 'customer', ''),
(47, 'Lakatos Kevin', 'Kevin_Master_Mechanic', 'kevin.l.0.8834414425151809@muhely.hu', '+36305566778', 'mechanic', ''),
(48, 'Bodnár Jenő', 'Jeno_Pro_Szerelo', 'jeno.b.0.9693119683948457@muhely.hu', '+36706677889', 'mechanic', ''),
(49, 'Martin Miklós', 'Matyeszko123', 'kovacsatala2006@gmail.com', '06307468567', NULL, '');

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
(8, 'Skoda', 'Octavia', 8, 'OCT-888', 1, 'kék', '2023-02-05 00:00:00', '2025-02-05 00:00:00'),
(12, 'Kia', 'Sportage', 15, 'KIA-777', 1, 'ezüst', '2023-05-10 00:00:00', '2025-05-10 00:00:00'),
(13, 'Mercedes', 'E-Class', 16, 'MERC-001', 2, 'fekete', '2022-12-01 00:00:00', '2024-12-01 00:00:00'),
(14, 'Fiat', '500', 17, 'LIT-500', 3, 'fehér', '2024-01-20 00:00:00', '2026-01-20 00:00:00'),
(15, 'Volkswagen', 'Passat', 18, 'VW-987', 1, 'sötétkék', '2021-08-15 00:00:00', '2025-08-15 00:00:00'),
(16, 'Toyota', 'Yaris', 19, 'YAR-123', 1, 'piros', '2023-11-05 00:00:00', '2025-11-05 00:00:00'),
(23, 'Suzuki', 'Swift', 37, 'SVT-276', 1, 'fehér', '2023-01-01 00:00:00', '2025-01-01 00:00:00'),
(24, 'Ford', 'Mondeo', 36, 'MON-165', 1, 'sötétkék', '2022-05-10 00:00:00', '2026-05-10 00:00:00'),
(25, 'Renault', 'Megane', 35, 'MEG-799', 4, 'ezüst', '2024-02-15 00:00:00', '2026-02-15 00:00:00'),
(26, 'Volvo', 'S60', 34, 'VOL-701', 6, 'fekete', '2021-11-20 00:00:00', '2025-11-20 00:00:00'),
(27, 'Seat', 'Leon', 33, 'SEA-105', 5, 'piros', '2023-06-30 00:00:00', '2025-06-30 00:00:00'),
(28, 'BMW', 'X5', 32, 'BMW-125', 2, 'szürke', '2025-01-10 00:00:00', '2027-01-10 00:00:00'),
(29, 'Opel', 'Astra G', 49, 'HUX-063', 1, NULL, NULL, NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- A tábla indexei `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `service_id` (`service_id`);

--
-- A tábla indexei `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `service_status`
--
ALTER TABLE `service_status`
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
-- AUTO_INCREMENT a táblához `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT a táblához `country`
--
ALTER TABLE `country`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT a táblához `service`
--
ALTER TABLE `service`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `service_status`
--
ALTER TABLE `service_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT a táblához `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

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
