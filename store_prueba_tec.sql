-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-12-2023 a las 10:48:41
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
-- Base de datos: `store_prueba_tec`
--
CREATE DATABASE IF NOT EXISTS `store_prueba_tec` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `store_prueba_tec`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `market`
--

DROP TABLE IF EXISTS `market`;
CREATE TABLE `market` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `market`
--

INSERT INTO `market` (`id`, `name`) VALUES
(5, 'Computadores'),
(6, 'Ropa'),
(7, 'Celulares'),
(8, 'Hardware'),
(9, 'Materiales Escolares'),
(10, 'Cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `price`
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `normal_price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `product_SKU` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `price`
--

INSERT INTO `price` (`id`, `normal_price`, `discount_price`, `active`, `create_date`, `product_SKU`) VALUES
(2, 1079990, 729990, 0, '2023-12-19', 'ABC12345'),
(3, 9990, 4990, 1, '2023-12-24', 'XYZ12345'),
(4, 179990, 72990, 1, '2023-12-20', 'FSD54321'),
(5, 1190990, 499000, 1, '2023-12-22', 'XYZ54321'),
(6, 12990, 6990, 0, '2023-12-22', 'MLS35231'),
(7, 24990, 15990, 1, '2023-12-23', 'GLZ64331');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `SKU` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `ean` bigint(32) DEFAULT NULL,
  `market_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`SKU`, `name`, `ean`, `market_id`) VALUES
('ABC12345', 'Lenovo Omen X15', 799439112766, 5),
('FSD54321', 'Iphone 13', 799635312766, 7),
('GLZ64331', '8GB Ram', 1249439112846, 8),
('MLS35231', 'Sueter Talla M', 123459112766, 6),
('XYZ12345', 'Sueter Talla M', 123459112766, 6),
('XYZ54321', 'Lenovo Omen X15', 799439112766, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_price_product1_idx` (`product_SKU`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`SKU`),
  ADD UNIQUE KEY `SKU_UNIQUE` (`SKU`),
  ADD KEY `fk_product_market_idx` (`market_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `market`
--
ALTER TABLE `market`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `fk_price_product1` FOREIGN KEY (`product_SKU`) REFERENCES `product` (`SKU`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_market` FOREIGN KEY (`market_id`) REFERENCES `market` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
