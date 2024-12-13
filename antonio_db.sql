-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3006
-- Tiempo de generación: 06-12-2024 a las 13:44:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `antonio_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `psychologist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `hour` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `customer_id`, `psychologist_id`, `date`, `hour`) VALUES
(5, 26, 17, '2024-12-05', '10:00:00'),
(6, 1, 21, '2024-12-10', '17:45:59'),
(7, 1, 17, '2024-12-17', '12:30:00'),
(8, 1, 17, '2024-12-17', '12:00:00'),
(10, 30, 21, '2024-12-20', '12:30:00'),
(11, 1, 34, '2024-12-25', '15:30:00'),
(12, 1, 34, '2024-12-26', '15:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dates_consultation`
--

CREATE TABLE `dates_consultation` (
  `id` int(11) NOT NULL,
  `psychologist_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dates_consultation`
--

INSERT INTO `dates_consultation` (`id`, `psychologist_id`, `date`) VALUES
(42, 17, '2024-12-05'),
(43, 17, '2024-12-06'),
(44, 17, '2024-12-16'),
(45, 17, '2024-12-17'),
(46, 17, '2024-12-18'),
(47, 21, '2024-12-19'),
(48, 21, '2024-12-20'),
(51, 34, '2024-12-21'),
(52, 34, '2024-12-25'),
(53, 34, '2024-12-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `appointment_id`, `sender_id`, `text`, `created_at`) VALUES
(19, 6, 1, 'hola!', '2024-12-05 01:53:33'),
(20, 6, 21, 'sdsdsds', '2024-12-05 01:55:24'),
(23, 8, 17, 'Hola mario, confirmo cita a las 12', '2024-12-06 00:29:42'),
(25, 8, 1, 'Genial Francisco!!!', '2024-12-06 00:36:26'),
(26, 8, 18, 'Hola! soy el admin', '2024-12-06 00:51:04'),
(27, 5, 17, 'Hola maria, confirmo cita', '2024-12-06 00:52:03'),
(28, 5, 26, 'Ok francisco!', '2024-12-06 00:53:53'),
(29, 10, 30, 'Esta es una prueba del mensahe de la cita', '2024-12-06 12:49:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'Cliente'),
(2, 'Piscólogo'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `hourStart` time DEFAULT '09:00:00',
  `hourEnd` time DEFAULT '19:00:00',
  `price` decimal(10,2) DEFAULT 50.00,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `rol_id`, `name`, `lastname`, `email`, `phone`, `hourStart`, `hourEnd`, `price`, `password`) VALUES
(1, 1, 'Ernesto', 'Azcvei', 'cliente@user.es', '666545488', NULL, NULL, NULL, 'L+BDdZqOnB9K2UehZJVu0A=='),
(17, 2, 'Francisco', 'Psicologo', 'psicologo@user.es', '666771111', '12:00:00', '17:30:00', 55.00, 'L+BDdZqOnB9K2UehZJVu0A=='),
(18, 3, 'Carlos', 'Admin', 'admin@user.es', '654123487', NULL, NULL, NULL, 'L+BDdZqOnB9K2UehZJVu0A=='),
(21, 2, 'Pedro', 'Psicologo', 'psicologo2@user.es', '666771155', '10:00:00', '17:00:00', 55.00, 'L+BDdZqOnB9K2UehZJVu0A=='),
(26, 1, 'Maria', 'Jimenez', 'cliente2@user.es', '665421421', NULL, NULL, NULL, 'L+BDdZqOnB9K2UehZJVu0A=='),
(27, 1, 'Javier', 'Cliente', 'cliente3@user.es', '666412356', NULL, NULL, NULL, 'L+BDdZqOnB9K2UehZJVu0A=='),
(30, 1, 'Antonio', 'López', 'thoroht@gmail.com', '956597015', NULL, NULL, NULL, 'I8u/Or+sldnAzVqgFpsMrg=='),
(32, 3, 'ALH', 'López Huesa', 'lhuesa1@cop.es', '649550579', NULL, NULL, NULL, 'L+BDdZqOnB9K2UehZJVu0A=='),
(33, 2, 'Antonio', 'Psico', 'lhuesaPsi@cop.es', '649550579', NULL, NULL, NULL, 'L+BDdZqOnB9K2UehZJVu0A=='),
(34, 2, 'PsicoPrueba', 'Prueba', 'PsicoPrueba@gmail.com', '649550579', '15:00:00', '16:00:00', 75.00, 'L+BDdZqOnB9K2UehZJVu0A==');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment_psychologist` (`psychologist_id`),
  ADD KEY `fk_appointment_customer` (`customer_id`);

--
-- Indices de la tabla `dates_consultation`
--
ALTER TABLE `dates_consultation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`),
  ADD KEY `fk_date_id_psychologist_id` (`psychologist_id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_message_customer` (`sender_id`),
  ADD KEY `fk_appointment` (`appointment_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_rol` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `dates_consultation`
--
ALTER TABLE `dates_consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointment_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_psychologist` FOREIGN KEY (`psychologist_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dates_consultation`
--
ALTER TABLE `dates_consultation`
  ADD CONSTRAINT `fk_date_id_psychologist_id` FOREIGN KEY (`psychologist_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
