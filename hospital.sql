-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2024 a las 03:39:01
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
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id_diag` int(5) NOT NULL,
  `descripcion_diag` varchar(50) DEFAULT NULL,
  `fecha_diagnostico_diag` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichero_historico`
--

CREATE TABLE `fichero_historico` (
  `id_fich` int(5) NOT NULL,
  `datos_paciente` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_med` int(5) NOT NULL,
  `nombre_med` varchar(10) DEFAULT NULL,
  `apellido_med` varchar(10) DEFAULT NULL,
  `fecha_atencion_med` datetime DEFAULT NULL,
  `hora_atencion_med` varchar(10) DEFAULT NULL,
  `tipo_diagnostico` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_pac` int(5) NOT NULL,
  `nombre_pac` varchar(10) DEFAULT NULL,
  `apellido_pac` varchar(10) DEFAULT NULL,
  `fecha_de_nacimiento_pac` datetime DEFAULT NULL,
  `numero_identificacion_pac` int(10) DEFAULT NULL,
  `numero_de_seguridad_social` int(10) DEFAULT NULL,
  `id_diag1` int(5) DEFAULT NULL,
  `id_med1` int(5) DEFAULT NULL,
  `id_plan1` int(5) DEFAULT NULL,
  `id_fich1` int(5) DEFAULT NULL,
  `id_vispac1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantas`
--

CREATE TABLE `plantas` (
  `id_plan` int(5) NOT NULL,
  `camas_plan` varchar(20) DEFAULT NULL,
  `fecha_asignacion_plan` datetime DEFAULT NULL,
  `numero_camas_plan` int(5) DEFAULT NULL,
  `numero_planta_plan` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id_visi` int(5) NOT NULL,
  `nombre_visi` varchar(10) DEFAULT NULL,
  `apellido_visi` varchar(10) DEFAULT NULL,
  `numero_tarjeta_visi` int(5) DEFAULT NULL,
  `hora_comienzo_plan` int(5) DEFAULT NULL,
  `hora_finalizacion_plan` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas_pacientes`
--

CREATE TABLE `visitas_pacientes` (
  `id_pac1` int(5) NOT NULL,
  `id_visi1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diag`);

--
-- Indices de la tabla `fichero_historico`
--
ALTER TABLE `fichero_historico`
  ADD PRIMARY KEY (`id_fich`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_med`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_pac`),
  ADD KEY `fk_iduno` (`id_diag1`),
  ADD KEY `fk_iddos` (`id_med1`),
  ADD KEY `fk_idtres` (`id_plan1`),
  ADD KEY `fk_idcua` (`id_fich1`),
  ADD KEY `fk_idcin` (`id_vispac1`);

--
-- Indices de la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD PRIMARY KEY (`id_plan`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id_visi`);

--
-- Indices de la tabla `visitas_pacientes`
--
ALTER TABLE `visitas_pacientes`
  ADD PRIMARY KEY (`id_pac1`),
  ADD KEY `fk_idsei` (`id_visi1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id_diag` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fichero_historico`
--
ALTER TABLE `fichero_historico`
  MODIFY `id_fich` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_med` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_pac` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantas`
--
ALTER TABLE `plantas`
  MODIFY `id_plan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id_visi` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitas_pacientes`
--
ALTER TABLE `visitas_pacientes`
  MODIFY `id_pac1` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_idcin` FOREIGN KEY (`id_vispac1`) REFERENCES `visitas_pacientes` (`id_pac1`),
  ADD CONSTRAINT `fk_idcua` FOREIGN KEY (`id_fich1`) REFERENCES `fichero_historico` (`id_fich`),
  ADD CONSTRAINT `fk_iddos` FOREIGN KEY (`id_med1`) REFERENCES `medicos` (`id_med`),
  ADD CONSTRAINT `fk_idtres` FOREIGN KEY (`id_plan1`) REFERENCES `plantas` (`id_plan`),
  ADD CONSTRAINT `fk_iduno` FOREIGN KEY (`id_diag1`) REFERENCES `diagnostico` (`id_diag`);

--
-- Filtros para la tabla `visitas_pacientes`
--
ALTER TABLE `visitas_pacientes`
  ADD CONSTRAINT `fk_idsei` FOREIGN KEY (`id_visi1`) REFERENCES `visitas` (`id_visi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
