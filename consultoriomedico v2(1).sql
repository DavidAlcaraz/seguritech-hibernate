-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-02-2018 a las 15:38:47
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consultoriomedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE IF NOT EXISTS `especialidades` (
  `especialidad_id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`especialidad_id`),
  UNIQUE KEY `especialidad_descripcion_unique` (`descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`especialidad_id`, `descripcion`) VALUES
(1, 'Médico clínico'),
(2, 'Cardiólogo'),
(3, 'Traumatólogo'),
(4, 'Kinesiólogo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras_sociales`
--

DROP TABLE IF EXISTS `obras_sociales`;
CREATE TABLE IF NOT EXISTS `obras_sociales` (
  `obra_social_id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`obra_social_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `obras_sociales`
--

INSERT INTO `obras_sociales` (`obra_social_id`, `nombre`) VALUES
(1, 'OSDE'),
(2, 'OSDEPYM'),
(4, 'SWISS MEDICAL GROUP'),
(6, 'MEDICUS SA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `persona_id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `e_mail` varchar(200) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `obra_social_id` int(10) DEFAULT NULL,
  `especialidad_id` int(10) DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `tipo_persona` varchar(20) NOT NULL DEFAULT 'PACIENTE' COMMENT 'PACIENTE / MEDICO / ADMINISTRADOR',
  PRIMARY KEY (`persona_id`),
  UNIQUE KEY `dni` (`usuario`),
  UNIQUE KEY `e_mail` (`e_mail`),
  KEY `fk_especialidad_id` (`especialidad_id`),
  KEY `fk_obrasocial_id` (`obra_social_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`persona_id`, `usuario`, `clave`, `nombre`, `e_mail`, `telefono`, `obra_social_id`, `especialidad_id`, `estado`, `fecha_creacion`, `tipo_persona`) VALUES
(1, 'jennifer', '1234', 'Jennifer Lopez', 'jenifer@gmail.com', NULL, 1, NULL, 'HABILITADO', '2018-02-06', 'PACIENTE'),
(2, 'sandra', '1234', 'Sandra Bullock', 'sandra@gmail.com', NULL, 2, NULL, 'HABILITADO', '2018-02-06', 'PACIENTE'),
(3, 'luisana', '1234', 'Dra Luisana Alfaro', 'luisana@gmail.com', NULL, NULL, 1, 'HABILITADO', '2018-02-06', 'MEDICO'),
(4, 'mauro', '1234', 'Dr Mauro Gimenez', 'mauro@gmail.com', NULL, NULL, 1, 'INHABILITADO', '2018-02-06', 'MEDICO'),
(5, 'laura', '1234', 'Dra Laura Fernandez', 'laura@gmail.com', NULL, NULL, 2, 'HABILITADO', '2018-02-06', 'MEDICO'),
(6, 'anibal', '1234', 'Dr. Anibal Rodriguez', 'anibal@gmail.com', NULL, NULL, 2, 'HABILITADO', '2018-02-06', 'MEDICO'),
(7, 'susana', '1234', 'Dra Susana Lopez', 'susana@gmail.com', NULL, NULL, 4, 'HABILITADO', '2018-02-06', 'MEDICO'),
(8, 'mariana', '1234', 'Dra Mariana Montes', 'mariana@gmail.com', NULL, NULL, 1, 'HABILITADO', '2018-02-06', 'MEDICO'),
(9, 'jose', '1234', 'Dr Jose Juarez Bellmonte', 'jose@gmail.com', NULL, NULL, 4, 'HABILITADO', '2018-02-06', 'MEDICO'),
(10, 'admin', '1234', 'Administrador', 'administrador@gmail.com', NULL, NULL, NULL, 'HABILITADO', '2018-02-06', 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

DROP TABLE IF EXISTS `turnos`;
CREATE TABLE IF NOT EXISTS `turnos` (
  `turno_id` int(10) NOT NULL AUTO_INCREMENT,
  `medico_id` int(10) NOT NULL,
  `paciente_id` int(10) NOT NULL,
  `obra_social_id` int(10) NOT NULL,
  `fecha_turno` datetime NOT NULL,
  `fecha_solicitud_turno` datetime NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`turno_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
