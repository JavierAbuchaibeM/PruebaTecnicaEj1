-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2022 a las 16:41:00
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdpruebatec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `nume_doc` int(18) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`nume_doc`, `nombre`, `direccion`) VALUES
(123456789, 'Mauricio Arenas', 'Cabecera'),
(456789123, 'Ricardo Morales', 'Girón'),
(987654321, 'Francisco Monsalve', 'Piedecuesta'),
(1095842062, 'Javier Manzano', 'Cra 55 #73-01'),
(1095856932, 'Xahep Gomez', 'Daddy I want Pineapple'),
(1098638791, 'Julián Álvarez', 'Piedecuesta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_factura`
--

CREATE TABLE `estados_factura` (
  `codi_estado` int(2) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados_factura`
--

INSERT INTO `estados_factura` (`codi_estado`, `descripcion`) VALUES
(1, 'Pagada'),
(2, 'Vigente'),
(3, 'Vencida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(18) NOT NULL,
  `nume_doc` int(18) NOT NULL,
  `codi_estado` int(2) NOT NULL,
  `valor_fac` int(18) NOT NULL,
  `fecha_fac` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `nume_doc`, `codi_estado`, `valor_fac`, `fecha_fac`) VALUES
(1, 1095842062, 1, 100000, '2022-11-09 23:37:54'),
(2, 1098638791, 2, 50000, '2022-11-09 23:37:54'),
(3, 1095842062, 3, 60000, '2022-11-10 00:33:17'),
(5, 123456789, 2, 25000, '2022-11-10 07:46:43'),
(10, 1095856932, 1, 20000, '2022-11-10 15:21:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`nume_doc`);

--
-- Indices de la tabla `estados_factura`
--
ALTER TABLE `estados_factura`
  ADD PRIMARY KEY (`codi_estado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `id_factura` (`id_factura`),
  ADD KEY `nume_doc` (`nume_doc`),
  ADD KEY `codi_estado` (`codi_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`nume_doc`) REFERENCES `clientes` (`nume_doc`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`codi_estado`) REFERENCES `estados_factura` (`codi_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
