-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:33065
-- Tiempo de generación: 22-05-2024 a las 10:19:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `norkysdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cli` int(11) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(130) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle_ped` int(11) NOT NULL,
  `id_ped` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_ped` int(11) NOT NULL,
  `id_cli` int(11) NOT NULL,
  `fecha_ped` datetime NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `estado` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int(11) NOT NULL,
  `nombre` varchar(600) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `copy` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_prod`, `nombre`, `precio`, `imagen`, `copy`) VALUES
(1, 'Pollo Oferta', 39.90, 'PROD000001.png', '- 1 Pollo entero\r\n- papas fritas\r\n- ensalada tradicional\r\n- cremas\r\n- gaseosa 1.5L'),
(2, 'Combinado familiar', 45.90, 'PROD000002.png', '- 1 Pollo entero \r\n- papas fritas \r\n- chaufa\r\n- ensalada tradicional\r\n- cremas\r\n- gaseosa 1.5L'),
(3, 'Combinado Familiar 2', 55.90, 'PROD000002.png', '- 1 Pollo entero\r\n- papas fritas\r\n- chaufa\r\n- ensalada tradicional\r\n- cremas\r\n- gaseosa 2L'),
(4, '1/4 de pollo a la brasa', 7.90, 'PROD000003.png', '- 1/4 de pollo a la brasa\r\n- papas fritas\r\n- cremas\r\n- ensalada tradicional fresca'),
(5, '1/4 de pollo a la brasa con gaseosa', 13.90, 'PROD000004.png', '- 1/4 de pollo a la brasa\r\n- papas fritas\r\n- ensalada tradicional fresca\r\n- cremas\r\n- gaseosa 600ml'),
(6, '1/2 pollo a la brasa', 34.00, 'PROD000005.png', '- 1/2 pollo a la brasa\r\n- papas fritas\r\n- ensalada tradicional fresca\r\n- cremas\r\n'),
(7, '1/2 pollo para 2 personas', 38.00, 'PROD000006.png', '- 1/4 de pollo a la brasa\r\n- papas fritas\r\n- ensalada tradicional fresca\r\n- cremas\r\n- 2 gaseosa 600ml'),
(8, 'Pechuga Norkys', 19.90, 'PROD000007.png', '- Filete de pechuga de pollo con tocino, queso, champiñones y jamón\r\n- papas fritas\r\n- ensalada fresca');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cli`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle_ped`),
  ADD KEY `id_ped` (`id_ped`),
  ADD KEY `id_prod` (`id_prod`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_ped`),
  ADD KEY `id_cli` (`id_cli`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle_ped` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_ped` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_ped`) REFERENCES `pedido` (`id_ped`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
