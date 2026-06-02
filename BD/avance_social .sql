-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-06-2026 a las 15:18:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `avance_social`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Coordinador_SSEO`
--

CREATE TABLE `Coordinador_SSEO` (
  `id_coordinador` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `documento` varchar(30) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estudiante`
--

CREATE TABLE `Estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `grado` enum('10','11') DEFAULT NULL,
  `grupo` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `eps` varchar(100) DEFAULT NULL,
  `seguro_estudiantil` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `id_padre_familia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Estudiante`
--

INSERT INTO `Estudiante` (`id_estudiante`, `nombre`, `apellido_paterno`, `apellido_materno`, `grado`, `grupo`, `celular`, `direccion`, `correo`, `eps`, `seguro_estudiantil`, `contraseña`, `id_padre_familia`) VALUES
(1, 'Samyr', 'Archila', 'Güiza', '11', '11-1', '123124', 'cenvuevierv', 'sarchila@gmail.com', 'fbrtrnrtnrtn', 'rtnrtnrtnrtn', '123456', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Padre_familia`
--

CREATE TABLE `Padre_familia` (
  `id_padre_familia` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Padre_familia`
--

INSERT INTO `Padre_familia` (`id_padre_familia`, `nombre`, `apellido_paterno`, `apellido_materno`, `celular`, `direccion`, `correo`, `contraseña`) VALUES
(1, 'Sandra', 'Archila', 'Güiza', '12314142124', '12412412412', 'sandra@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Postulacion`
--

CREATE TABLE `Postulacion` (
  `id_postulacion` int(11) NOT NULL,
  `estado_postulacion` varchar(50) DEFAULT NULL,
  `fecha_postulacion` date DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_proyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proyecto`
--

CREATE TABLE `Proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `nombre_proyecto` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cupos` int(11) DEFAULT NULL,
  `sede_area_dependencia` varchar(150) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Registro_horas`
--

CREATE TABLE `Registro_horas` (
  `id_registro` int(11) NOT NULL,
  `cantidad_horas` int(11) DEFAULT NULL,
  `actividad` text DEFAULT NULL,
  `estado_validacion` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Supervisor`
--

CREATE TABLE `Supervisor` (
  `id_supervisor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `dependencia` varchar(100) DEFAULT NULL,
  `sede` enum('Sede A','Sede B','Sede C','Sede D','Sede E') DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Coordinador_SSEO`
--
ALTER TABLE `Coordinador_SSEO`
  ADD PRIMARY KEY (`id_coordinador`);

--
-- Indices de la tabla `Estudiante`
--
ALTER TABLE `Estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_padre_familia` (`id_padre_familia`);

--
-- Indices de la tabla `Padre_familia`
--
ALTER TABLE `Padre_familia`
  ADD PRIMARY KEY (`id_padre_familia`);

--
-- Indices de la tabla `Postulacion`
--
ALTER TABLE `Postulacion`
  ADD PRIMARY KEY (`id_postulacion`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indices de la tabla `Proyecto`
--
ALTER TABLE `Proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- Indices de la tabla `Registro_horas`
--
ALTER TABLE `Registro_horas`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_supervisor` (`id_supervisor`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `Supervisor`
--
ALTER TABLE `Supervisor`
  ADD PRIMARY KEY (`id_supervisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Coordinador_SSEO`
--
ALTER TABLE `Coordinador_SSEO`
  MODIFY `id_coordinador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Estudiante`
--
ALTER TABLE `Estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Padre_familia`
--
ALTER TABLE `Padre_familia`
  MODIFY `id_padre_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Postulacion`
--
ALTER TABLE `Postulacion`
  MODIFY `id_postulacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proyecto`
--
ALTER TABLE `Proyecto`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Registro_horas`
--
ALTER TABLE `Registro_horas`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Supervisor`
--
ALTER TABLE `Supervisor`
  MODIFY `id_supervisor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Estudiante`
--
ALTER TABLE `Estudiante`
  ADD CONSTRAINT `Estudiante_ibfk_1` FOREIGN KEY (`id_padre_familia`) REFERENCES `Padre_familia` (`id_padre_familia`);

--
-- Filtros para la tabla `Postulacion`
--
ALTER TABLE `Postulacion`
  ADD CONSTRAINT `Postulacion_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `Estudiante` (`id_estudiante`),
  ADD CONSTRAINT `Postulacion_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`);

--
-- Filtros para la tabla `Proyecto`
--
ALTER TABLE `Proyecto`
  ADD CONSTRAINT `Proyecto_ibfk_1` FOREIGN KEY (`id_supervisor`) REFERENCES `Supervisor` (`id_supervisor`);

--
-- Filtros para la tabla `Registro_horas`
--
ALTER TABLE `Registro_horas`
  ADD CONSTRAINT `Registro_horas_ibfk_1` FOREIGN KEY (`id_supervisor`) REFERENCES `Supervisor` (`id_supervisor`),
  ADD CONSTRAINT `Registro_horas_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `Estudiante` (`id_estudiante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
