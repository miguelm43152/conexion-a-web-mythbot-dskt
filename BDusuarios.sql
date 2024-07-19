-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2024 a las 18:12:53
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
-- Base de datos: `usuarios`
--
CREATE DATABASE IF NOT EXISTS `usuarios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `usuarios`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosregistrados`
--
-- Creación: 27-05-2024 a las 03:28:34
--

CREATE TABLE `usuariosregistrados` (
  `ID` int(15) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Password` varchar(65) NOT NULL,
  `Edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuariosregistrados`
--

INSERT INTO `usuariosregistrados` (`ID`, `Usuario`, `Password`, `Edad`) VALUES
(1, 'miguel', '12345', 25),
(2, 'manuel', '12345', 28),
(19, 'usuario1300', '$2b$10$/B1mC5OwNaSIhd7moEoE5OcsPOkysZlBstRqi26ReSSLw38gVO8Oa', 10),
(20, 'miguel43152', '$2b$10$wjQjQRzRV86IHFlskdYUOOUM/NhOr6a8Z4YsqXMxkU5ErVzkmcyI6', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuariosregistrados`
--
ALTER TABLE `usuariosregistrados`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuariosregistrados`
--
ALTER TABLE `usuariosregistrados`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
