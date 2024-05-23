-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-05-2024 a las 18:48:48
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `torneo_tenis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8mb3_spanish_ci NOT NULL,
  `edad_min` int NOT NULL,
  `edad_max` int NOT NULL,
  `sexo` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `edad_min`, `edad_max`, `sexo`) VALUES
(1, 'Damas A', 18, 34, 'Femenino'),
(2, 'Damas B', 35, 45, 'Femenino'),
(3, 'Damas C', 46, 100, 'Femenino'),
(4, 'Caballeros A', 18, 34, 'Masculino'),
(5, 'Caballeros B', 35, 50, 'Masculino'),
(6, 'Caballeros C', 51, 100, 'Masculino'),
(7, 'Juveniles Varones', 13, 17, 'Masculino'),
(8, 'Juveniles Mujeres', 13, 17, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `num_inscripcion` int NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` date NOT NULL,
  `abono_insc` tinyint(1) NOT NULL,
  `fk_categoria` int NOT NULL,
  `fk_participante` int NOT NULL,
  PRIMARY KEY (`num_inscripcion`),
  KEY `fk_participante` (`fk_participante`),
  KEY `fk_categoria` (`fk_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`num_inscripcion`, `fecha_inscripcion`, `abono_insc`, `fk_categoria`, `fk_participante`) VALUES
(1, '2024-05-22', 1, 1, 1),
(2, '2024-05-23', 1, 4, 2),
(3, '2024-05-23', 1, 2, 3),
(4, '2024-05-21', 1, 4, 4),
(5, '2024-05-24', 1, 2, 5),
(6, '2024-05-23', 1, 4, 6),
(7, '2024-05-13', 1, 3, 7),
(8, '2024-05-21', 1, 4, 8),
(9, '2024-05-23', 1, 1, 9),
(10, '2024-05-22', 1, 5, 10),
(11, '2024-05-23', 1, 2, 11),
(12, '2024-05-23', 1, 4, 12),
(13, '2024-05-23', 1, 1, 13),
(14, '2024-05-23', 1, 5, 14),
(15, '2024-05-21', 1, 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

DROP TABLE IF EXISTS `participantes`;
CREATE TABLE IF NOT EXISTS `participantes` (
  `id_participante` int NOT NULL AUTO_INCREMENT,
  `dni_participante` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `edad` int NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_participante`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id_participante`, `dni_participante`, `apellido`, `nombre`, `direccion`, `edad`, `telefono`, `sexo`) VALUES
(1, '12345678', 'González', 'María', 'Calle 123', 25, '555', 'Femenino'),
(2, '87654321', 'López', 'Juan', 'Avenida 456', 30, '555', 'Masculino'),
(3, '23456789', 'Martínez', 'Sofía', 'Plaza 789', 40, '555', 'Femenino'),
(4, '98765432', 'Rodríguez', 'Carlos', 'Carrera 1011', 22, '555', 'Masculino'),
(5, '34567890', 'Fernández', 'Laura', 'Paseo 1213', 35, '555', 'Femenino'),
(6, '87654321', 'Gómez', 'Luis', 'Calle 1415', 28, '555', 'Masculino'),
(7, '56789012', 'Díaz', 'Ana', 'Avenida 1617', 50, '555', 'Femenino'),
(8, '43210987', 'Pérez', 'Diego', 'Plaza 1819', 33, '555', 'Masculino'),
(9, '12341234', 'Martínez', 'Lucía', 'Calle 2021', 27, '555', 'Femenino'),
(10, '87654321', 'Fernández', 'Daniel', 'Avenida 2223', 45, '555', 'Masculino'),
(11, '23452345', 'García', 'Patricia', 'Plaza 2425', 38, '555', 'Femenino'),
(12, '98769876', 'González', 'Javier', 'Carrera 2627', 29, '555', 'Masculino'),
(13, '34563456', 'López', 'Valentina', 'Paseo 2829', 31, '555', 'Femenino'),
(14, '87658765', 'Díaz', 'Manuel', 'Avenida 3031', 41, '555', 'Masculino'),
(15, '56785678', 'Pérez', 'Camila', 'Plaza 3233', 26, '555', 'Femenino');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`fk_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_participante` FOREIGN KEY (`fk_participante`) REFERENCES `participantes` (`id_participante`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
