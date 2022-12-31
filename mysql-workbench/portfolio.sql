-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-12-2022 a las 23:33:05
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

DROP TABLE IF EXISTS `educacion`;
CREATE TABLE IF NOT EXISTS `educacion` (
  `id` int NOT NULL,
  `nombre_instituto` varchar(45) NOT NULL,
  `titulo_estudiado` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `foto_logo` varchar(100) NOT NULL,
  `persona_id1` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id1`),
  KEY `fk_educacion_persona2_idx` (`persona_id1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id`, `nombre_instituto`, `titulo_estudiado`, `fechaInicio`, `fechaFin`, `foto_logo`, `persona_id1`) VALUES
(1, 'Yo Programo', 'Full Stack Developer', '2022-03-01', '2022-12-31', 'www.unafoto.com/foto', 1),
(456, 'Yo Programo', 'Full Stack Developer', '2022-03-01', '2022-12-31', 'www.unafoto.com/foto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
CREATE TABLE IF NOT EXISTS `experiencia_laboral` (
  `id` int NOT NULL,
  `nombre_empresa` varchar(45) NOT NULL,
  `nombre_puesto` varchar(45) NOT NULL,
  `esTrabajoActual` tinyint NOT NULL,
  `fechaIncio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `foto_logo` varchar(100) NOT NULL,
  `persona_id` int NOT NULL,
  `tipo_empleo_id` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`,`tipo_empleo_id`),
  KEY `fk_experiencia_laboral_persona_idx` (`persona_id`),
  KEY `fk_experiencia_laboral_tipo_empleo1_idx` (`tipo_empleo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `experiencia_laboral`
--

INSERT INTO `experiencia_laboral` (`id`, `nombre_empresa`, `nombre_puesto`, `esTrabajoActual`, `fechaIncio`, `fechaFin`, `foto_logo`, `persona_id`, `tipo_empleo_id`) VALUES
(1, 'BA MKT', 'Data Entry', 0, '2022-03-01', '2022-03-31', 'www.foto/foto', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `correo` varchar(45) NOT NULL,
  `sobre_mi` varchar(200) NOT NULL,
  `una_foto` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id dni_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `correo`, `sobre_mi`, `una_foto`) VALUES
(1, 'Daniela', 'Morandin', 'dmorandin@gmail.com', 'Estudiante de programación', 'www.foto.com/foto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int NOT NULL,
  `nombre_proyecto` varchar(45) NOT NULL,
  `foto_proyecto` varchar(100) NOT NULL,
  `descripcion_proyecto` varchar(100) NOT NULL,
  `fecha_proyecto` date NOT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_proyectos_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int NOT NULL,
  `grafico_skills` varchar(100) NOT NULL,
  `nombre_skills` varchar(45) NOT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`id`,`persona_id`),
  KEY `fk_skills_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleo`
--

DROP TABLE IF EXISTS `tipo_empleo`;
CREATE TABLE IF NOT EXISTS `tipo_empleo` (
  `id` int NOT NULL,
  `nombre_tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipo_empleo`
--

INSERT INTO `tipo_empleo` (`id`, `nombre_tipo`) VALUES
(1, 'part-time'),
(2, 'ful-time');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `fk_educacion_persona2` FOREIGN KEY (`persona_id1`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `fk_experiencia_laboral_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `fk_experiencia_laboral_tipo_empleo1` FOREIGN KEY (`tipo_empleo_id`) REFERENCES `tipo_empleo` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_proyectos_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `fk_skills_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
