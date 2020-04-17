-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Base de datos: `futbolclub`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clubes`
--

CREATE TABLE `clubes` (
  `id_club` int(11) NOT NULL,
  `nombre_club` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `UBICACIONES_id_ubicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clubes`
--

INSERT INTO `clubes` (`id_club`, `nombre_club`, `UBICACIONES_id_ubicacion`) VALUES
(1, 'Real Madrid', 1),
(2, 'FC Barcelona', 2),
(3, 'Chelsea', 3),
(4, 'París Saint-Germain Football Club', 4),
(5, 'Atletico de madrid', 1),
(6, 'Juventus', 5),
(7, 'Tottenham', 3),
(8, 'Manchester United', 6),
(9, 'Manchester City', 6),
(10, 'Bayern de Munich', 7),
(11, 'Boca Juniors', 8),
(12, 'River Plate', 9),
(13, 'Atletico Nacional', 10),
(14, 'America de Cali', 11),
(15, 'Santafe', 12),
(16, 'Sao Paulo', 13),
(17, 'Santos', 14),
(18, 'Flamengo', 15),
(19, 'Colo Colo', 16),
(20, 'Millonarios', 12),
(21, 'Deportivo Independiente Medellin', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continentes`
--

CREATE TABLE `continentes` (
  `id_continente` int(11) NOT NULL,
  `nombre_continente` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `continentes`
--

INSERT INTO `continentes` (`id_continente`, `nombre_continente`) VALUES
(1, 'AMERICA'),
(2, 'EUROPA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre_empleado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_empleado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `email_empleado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_contrato` date NOT NULL,
  `salario_empleado` decimal(12,2) NOT NULL,
  `CLUBES_id_club` int(11) NOT NULL,
  `TRABAJOS_id_trabajo` int(11) NOT NULL,
  `JEFE_id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `telefono_empleado`, `email_empleado`, `fecha_contrato`, `salario_empleado`, `CLUBES_id_club`, `TRABAJOS_id_trabajo`, `JEFE_id_empleado`) VALUES
(1, 'Josep Maria Bartomeu', '7005640', 'bartomeu@fcbarca.com', '2015-07-18', '150000.00', 2, 10, NULL),
(2, 'Florentino Pérez', '7005661', 'florentino@rmadrid.com', '2010-04-15', '150000.00', 1, 10, NULL),
(3, 'Enrique Setién Solar', '7005644', 'setien@fcbarca.com', '2020-01-13', '70000.00', 2, 2, 1),
(4, 'Zidane', '7005646', 'zidane@rmadrid.com', '2019-01-15', '70000.00', 1, 2, 2),
(5, 'Lionel Andrés Messi Cuccittini', '7005645', 'messi@fcbarca.com', '2004-10-16', '100000.00', 2, 1, 3),
(6, 'Antoine GRIEZMANN', '7005665', 'antoine@barca.com', '2019-07-20', '80000.00', 2, 1, 3),
(7, 'Jordi Alba', '7005630', 'alba@barca.com', '2012-06-20', '50000.00', 2, 1, 3),
(8, 'Frenkie de Jong', '7005632', 'frankie@barca.com', '2019-08-20', '70000.00', 2, 1, 3),
(9, 'Eden Hazard', '7005662', 'hazard@rmadrid.com', '2019-06-17', '80000.00', 1, 1, 4),
(10, 'Sergio Ramos', '7005663', 'ramos@rmadrid.com', '2005-06-20', '70000.00', 1, 1, 4),
(11, 'Thibaut Courtois', '7005635', 'courtois@rmadrid.com', '2018-07-15', '50000.00', 1, 1, 4),
(12, 'Federico Valverde', '7005670', 'valverde@rmadrid.com', '2018-07-15', '70000.00', 1, 1, 4),
(13, 'Enrique Cerezo', '7005647', 'cerezo@amadrid.com', '2003-04-14', '70000.00', 5, 10, NULL),
(14, 'Andrea Agnelli', '7005648', 'andrea@juventus.com', '2010-06-15', '80000.00', 6, 10, NULL),
(15, 'Nasser Al-Khelaifi', '7005649', 'nasser@paris.com', '2011-06-10', '150000.00', 4, 10, NULL),
(16, 'Daniel Levy', '7005655', 'levy@tot.com', '2001-06-10', '120000.00', 7, 10, NULL),
(17, 'Thomas Tuchel', '7005650', 'tuchel@paris.com', '2018-06-10', '70000.00', 4, 2, 15),
(18, 'Neymar', '7005651', 'neymar@paris.com', '2017-07-10', '90000.00', 4, 1, 17),
(19, 'Kylian Mbappe', '7005652', 'bappe@paris.com', '2018-06-17', '70000.00', 4, 1, 17),
(20, 'Jose Mourinho', '7005656', 'mou@tot.com', '2019-06-24', '80000.00', 7, 2, 16),
(21, 'Delle ALLI', '7005657', 'alli@tot.com', '2015-06-18', '70000.00', 7, 1, 20),
(22, 'Harry Kane', '7005658', 'kane@tot.com', '2011-06-15', '70000.00', 7, 1, 20),
(23, 'Maurizio Sarri', '7005659', 'sarri@juventus.com', '2019-06-17', '80000.00', 6, 2, 14),
(24, 'Cristiano Ronaldo', '7005660', 'ronaldo@juventus.com', '2018-07-30', '88000.00', 6, 1, 23),
(25, 'Paulo Dybala', '7005661', 'dybala@juventus.com', '2015-06-23', '85000.00', 6, 1, 23),
(26, 'Diego Simeone', '7005680', 'simeone@juventus.com', '2011-06-23', '80000.00', 5, 2, 13),
(27, 'Joel Glazer', '7005690', 'glazer@manunited.com', '2005-06-30', '150000.00', 8, 10, NULL),
(28, 'Khaldoon Al Mubarak', '7005691', 'mubarak@city.com', '2010-07-30', '200000.00', 9, 10, NULL),
(29, 'Herbert Hainer', '7005692', 'herbet@munich.com', '2020-01-30', '100000.00', 10, 10, NULL),
(30, 'Ole Gunnar Solskjaer', '7005693', 'ole@manunited.com', '2019-07-30', '110000.00', 8, 2, 27),
(31, 'Pep Guardiola', '7005613', 'pep@city.com', '2016-08-20', '130000.00', 9, 2, 28),
(32, 'Hans-Dieter Flick', '7005694', 'hans@munich.com', '2020-01-01', '100000.00', 10, 2, 29),
(33, 'Paul Pogba', '800001', 'pogba@manunited.com', '2016-07-30', '90000.00', 8, 1, 30),
(34, 'Marcus Rashford', '800002', 'marcus@manunited.com', '2015-07-30', '70000.00', 8, 1, 30),
(35, 'Sergio Aguero', '800003', 'aguero@city.com', '2011-08-01', '86000.00', 9, 1, 31),
(36, 'Kevin De Bruyne', '800004', 'kevin@city.com', '2015-07-10', '78000.00', 9, 1, 31),
(37, 'Thomas Muller', '800005', 'muller@munich.com', '2008-07-15', '75000.00', 10, 1, 32),
(38, 'Robert Lewandowski', '800006', 'robert@munich.com', '2014-07-30', '79000.00', 10, 1, 32),
(39, 'Bruce Buck', '8005650', 'buck@chelsea.com', '1990-01-01', '120000.00', 3, 10, NULL),
(40, 'Frank Lampard', '8005645', 'lampard@chelsea.com', '2019-07-10', '100000.00', 3, 2, 39),
(41, 'Willian Borges da Silva', '8005646', 'willian@chelsea.com', '2013-07-15', '70000.00', 3, 1, 40),
(42, 'César Azpilicueta', '8005647', 'azpi@chelsea.com', '2012-07-15', '70000.00', 3, 1, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_trabajos`
--

CREATE TABLE `historial_trabajos` (
  `id_historial_trabajos` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `TRABAJOS_id_trabajo` int(11) NOT NULL,
  `EMPLEADOS_id_empleado` int(11) NOT NULL,
  `CLUBES_id_club` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `historial_trabajos`
--

INSERT INTO `historial_trabajos` (`id_historial_trabajos`, `fecha_inicio`, `fecha_fin`, `TRABAJOS_id_trabajo`, `EMPLEADOS_id_empleado`, `CLUBES_id_club`) VALUES
(1, '2009-07-20', '2018-07-25', 1, 24, 1),
(2, '2013-07-15', '2017-07-09', 1, 18, 2),
(3, '2012-07-10', '2019-06-15', 1, 9, 3),
(4, '2014-06-19', '2019-07-19', 1, 6, 5),
(5, '2012-07-10', '2016-07-29', 1, 33, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL,
  `nombre_pais` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CONTINENTES_id_continente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`, `CONTINENTES_id_continente`) VALUES
(1, 'Colombia', 1),
(2, 'Argentina', 1),
(3, 'Brasil', 1),
(4, 'Uruguay', 1),
(5, 'Chile', 1),
(6, 'Peru', 1),
(7, 'Portugal', 2),
(8, 'España', 2),
(9, 'Francia', 2),
(10, 'Italia', 2),
(11, 'Alemania', 2),
(12, 'Reino Unido', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `id_trabajo` int(11) NOT NULL,
  `nombre_trabajo` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`id_trabajo`, `nombre_trabajo`) VALUES
(1, 'Jugadores'),
(2, 'Entrenadores'),
(3, 'Directores Deportivos'),
(4, 'Entdor porteros'),
(5, 'fisioterapeutas'),
(6, 'Nutricionistas'),
(7, 'Preparador fisico'),
(8, 'Representantes'),
(9, 'Marketing'),
(10, 'Presidente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id_ubicacion` int(11) NOT NULL,
  `ciudad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_postal` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado_provincia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `PAISES_id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id_ubicacion`, `ciudad`, `codigo_postal`, `direccion`, `estado_provincia`, `PAISES_id_pais`) VALUES
(1, 'Madrid', '28001', 'calle 10', 'Madrid', 8),
(2, 'Barcelona', '08001', 'Carrera 5', 'Catalunia', 8),
(3, 'Londres', '10097', 'Transv 5', 'Londres', 12),
(4, 'Paris', '98776', 'calle 5 - 1-2', 'Paris', 9),
(5, 'Turin', '987005', 'carrera 5', 'Turin', 10),
(6, 'Manchester', '98706', 'calle manchester united', 'Manchester', 12),
(7, 'Munich', '98543', 'Calle Arena', 'Munich', 11),
(8, 'Buenos Aires', '98544', 'Calle de Boca', 'Buenos Aires', 2),
(9, 'Buenos Aires', '98545', 'Calle de River', 'Buenos Aires', 2),
(10, 'Medellin', '98546', 'Calle Atanasio', 'Medellin', 1),
(11, 'Cali', '98547', 'Calle pascual', 'Cali', 1),
(12, 'Bogota', '98548', 'Calle Campin', 'Bogota', 1),
(13, 'Sao Paulo', '98549', 'Calle Sao Paulo', 'Sao Paulo', 3),
(14, 'Santos', '98550', 'Calle Santos', 'Santos', 3),
(15, 'Rio de Janeiro', '98551', 'Calle Flamengo', 'Rio de Janeiro', 3),
(16, 'Santiago', '98552', 'Calle Colo colo', 'Santiago', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`id_club`),
  ADD KEY `fk_CLUBES_UBICACIONES1_idx` (`UBICACIONES_id_ubicacion`);

--
-- Indices de la tabla `continentes`
--
ALTER TABLE `continentes`
  ADD PRIMARY KEY (`id_continente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_EMPLEADOS_CLUBES1_idx` (`CLUBES_id_club`),
  ADD KEY `fk_EMPLEADOS_TRABAJOS1_idx` (`TRABAJOS_id_trabajo`),
  ADD KEY `fk_EMPLEADOS_EMPLEADOS1_idx` (`JEFE_id_empleado`);

--
-- Indices de la tabla `historial_trabajos`
--
ALTER TABLE `historial_trabajos`
  ADD PRIMARY KEY (`id_historial_trabajos`),
  ADD KEY `fk_HISTORIAL_TRABAJOS_TRABAJOS1_idx` (`TRABAJOS_id_trabajo`),
  ADD KEY `fk_HISTORIAL_TRABAJOS_EMPLEADOS1_idx` (`EMPLEADOS_id_empleado`),
  ADD KEY `fk_HISTORIAL_TRABAJOS_CLUBES1_idx` (`CLUBES_id_club`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`),
  ADD KEY `fk_PAISES_CONTINENTES1_idx` (`CONTINENTES_id_continente`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`id_trabajo`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `fk_UBICACIONES_PAISES1_idx` (`PAISES_id_pais`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clubes`
--
ALTER TABLE `clubes`
  ADD CONSTRAINT `fk_CLUBES_UBICACIONES1` FOREIGN KEY (`UBICACIONES_id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_EMPLEADOS_CLUBES1` FOREIGN KEY (`CLUBES_id_club`) REFERENCES `clubes` (`id_club`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EMPLEADOS_EMPLEADOS1` FOREIGN KEY (`JEFE_id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EMPLEADOS_TRABAJOS1` FOREIGN KEY (`TRABAJOS_id_trabajo`) REFERENCES `trabajos` (`id_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historial_trabajos`
--
ALTER TABLE `historial_trabajos`
  ADD CONSTRAINT `fk_HISTORIAL_TRABAJOS_CLUBES1` FOREIGN KEY (`CLUBES_id_club`) REFERENCES `clubes` (`id_club`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_HISTORIAL_TRABAJOS_EMPLEADOS1` FOREIGN KEY (`EMPLEADOS_id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_HISTORIAL_TRABAJOS_TRABAJOS1` FOREIGN KEY (`TRABAJOS_id_trabajo`) REFERENCES `trabajos` (`id_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paises`
--
ALTER TABLE `paises`
  ADD CONSTRAINT `fk_PAISES_CONTINENTES1` FOREIGN KEY (`CONTINENTES_id_continente`) REFERENCES `continentes` (`id_continente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `fk_UBICACIONES_PAISES1` FOREIGN KEY (`PAISES_id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

