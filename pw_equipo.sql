-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-08-2014 a las 05:07:45
-- Versión del servidor: 5.5.34
-- Versión de PHP: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pw_equipo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_cursos`
--

CREATE TABLE `cat_cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `cat_cursos`
--

INSERT INTO `cat_cursos` (`id_curso`, `nombre`) VALUES
(1, 'DANZA MODERNA'),
(2, 'RITMOS LATINOS'),
(3, 'HIP HOP'),
(4, 'BALLET'),
(5, 'FLAMENCO'),
(6, 'DANZA POLINESIA'),
(7, 'TANGO'),
(8, 'DANZA ARABE'),
(9, 'BAILE FOLCLORICO'),
(10, 'CAPOEIRA'),
(11, 'DANZA AEREA'),
(12, 'FOTOGRAFIA'),
(13, 'PINTURA'),
(14, 'CERAMICA Y ESCULTURA'),
(15, 'SERIGRAFIA'),
(16, 'TEATRO'),
(17, 'ESTUDIANTINA'),
(18, 'CLUB DE AJEDREZ'),
(19, 'MARIACHI'),
(20, 'TALLER DE MUSICA'),
(21, 'ORQUESTA DE CAMARA'),
(22, 'GRUPO VERSATIL'),
(23, 'CORO UNIVERSITARIO'),
(24, 'FREE STYLE SOCCER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_nivel`
--

CREATE TABLE `cat_nivel` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `cat_nivel`
--

INSERT INTO `cat_nivel` (`id_nivel`, `nivel`) VALUES
(1, 'PRINCIPIANTE'),
(2, 'INTERMEDIO'),
(3, 'AVANZADO'),
(4, 'SELECTIVO'),
(5, 'EXGAB'),
(6, 'PRINCIPIANTE INTERMEDIO'),
(7, 'ZUMBA'),
(8, 'INTERMEDIO AVANZADO'),
(9, 'AVANZADO Y SELECTIVO'),
(10, 'SOLFEO'),
(11, 'CORO'),
(12, 'INSTRUMENTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_salon`
--

CREATE TABLE `cat_salon` (
  `id_salon` int(11) NOT NULL AUTO_INCREMENT,
  `salon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_salon`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `cat_salon`
--

INSERT INTO `cat_salon` (`id_salon`, `salon`) VALUES
(1, 'SALON 6'),
(2, 'SALON 4'),
(3, 'SALON 3'),
(4, 'SALON 2'),
(5, 'SALON 1'),
(6, 'MEZANINE GYM UAG'),
(7, 'TERRAZA 2'),
(8, 'SALON DE FOTOGRAFIA'),
(9, 'SALON DE PINTURA'),
(10, 'EDIFICIO DE DISEÃ‘O-AUDITORIO VASCONCELOS'),
(11, 'SALON ESTUDIANTINA'),
(12, 'RECEPCION ACSA'),
(13, 'SALON MARIACHI'),
(14, 'SALON SOLFEO'),
(15, 'CUBICULO NUM 2'),
(16, 'AULA ORQUESTA'),
(17, 'SALON VERSUAG'),
(18, 'EXPLANADA TURISMO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_curso`
--

CREATE TABLE `detalle_curso` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) DEFAULT NULL,
  `id_nivel` int(11) DEFAULT NULL,
  `id_salon` int(11) DEFAULT NULL,
  `dia` char(255) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `curso` (`id_curso`),
  KEY `nivel` (`id_nivel`),
  KEY `salon` (`id_salon`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_curso`
--
ALTER TABLE `detalle_curso`
  ADD CONSTRAINT `curso` FOREIGN KEY (`id_curso`) REFERENCES `cat_cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nivel` FOREIGN KEY (`id_nivel`) REFERENCES `cat_nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `salon` FOREIGN KEY (`id_salon`) REFERENCES `cat_salon` (`id_salon`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
