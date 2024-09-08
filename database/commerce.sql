-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2021 a las 18:43:57
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `commerce`
--
CREATE DATABASE IF NOT EXISTS `commerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `commerce`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos_compras`
--

CREATE TABLE `carritos_compras` (
  `id_carrito` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carritos_compras`
--

INSERT INTO `carritos_compras` (`id_carrito`) VALUES
(4),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(10) NOT NULL,
  `ciuNombre` varchar(50) NOT NULL,
  `ciuDepartamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `ciuNombre`, `ciuDepartamento`) VALUES
(1, 'Bogotá', 'Cundinamarca'),
(2, 'Medellin', 'Antioquia'),
(3, 'Cali', 'Valle del Cauca'),
(4, 'Barranquilla', 'Atlántico'),
(5, 'Cartagena', 'Bolívar'),
(6, 'Cucuta', 'Norte de Santander'),
(7, 'Bucaramanga', 'Santander'),
(8, 'Villavicencio', 'Meta'),
(9, 'Ibagué', 'Tolima'),
(10, 'Santa Marta', 'Magdalena'),
(11, 'Valledupar', 'Cesar'),
(12, 'Manizales', 'Caldas'),
(13, 'Pereira', 'Risaralda'),
(14, 'Neiva', 'Huila'),
(15, 'Pasto', 'Nariño'),
(16, 'Armenia', 'Quindio'),
(17, 'Palmira', 'Valle del Cauca'),
(18, 'Jamundi', 'Valle del Cauca'),
(19, 'Buga', 'Valle del Cauca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id_cotizacion` int(10) NOT NULL,
  `cotFechacotizacion` datetime NOT NULL DEFAULT current_timestamp(),
  `cotFechavencimiento` date NOT NULL,
  `cotId_cliente` int(10) NOT NULL,
  `cotTotalventa` double NOT NULL,
  `cotId_empleado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_carritos`
--

CREATE TABLE `detalles_carritos` (
  `id_detalle_carrito` int(10) NOT NULL,
  `detcarCantidad` int(5) NOT NULL,
  `detcarId_producto` int(10) NOT NULL,
  `detcarId_carrito` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalles_carritos`
--

INSERT INTO `detalles_carritos` (`id_detalle_carrito`, `detcarCantidad`, `detcarId_producto`, `detcarId_carrito`) VALUES
(0, 1, 2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_cotizaciones`
--

CREATE TABLE `detalles_cotizaciones` (
  `id_detalle_cotizacion` int(10) NOT NULL,
  `detcotId_producto` int(10) NOT NULL,
  `detcotCantidad` int(5) NOT NULL,
  `detcotSubtotal` double NOT NULL,
  `detcotId_cotizacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--

CREATE TABLE `detalles_ventas` (
  `id_detalle_venta` int(10) NOT NULL,
  `detveId_producto` int(10) NOT NULL,
  `detveCantidad` int(5) NOT NULL,
  `detveId_venta` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalles_ventas`
--

INSERT INTO `detalles_ventas` (`id_detalle_venta`, `detveId_producto`, `detveCantidad`, `detveId_venta`) VALUES
(1, 1, 1, 7),
(2, 1, 1, 8),
(3, 2, 1, 9),
(4, 1, 1, 10),
(5, 2, 1, 11),
(6, 2, 1, 12),
(7, 2, 1, 13),
(8, 2, 1, 14),
(9, 1, 1, 15),
(10, 1, 1, 16),
(11, 2, 1, 17),
(12, 1, 1, 18),
(13, 2, 1, 19),
(14, 1, 1, 20),
(15, 2, 1, 21),
(16, 1, 1, 22),
(17, 2, 1, 23),
(18, 2, 1, 24),
(19, 1, 1, 25),
(20, 1, 1, 26),
(21, 2, 1, 27),
(22, 1, 12, 28),
(35, 1, 1, 41),
(36, 3, 1, 42),
(37, 1, 1, 43),
(38, 2, 1, 44),
(39, 1, 1, 45),
(40, 3, 1, 46),
(41, 2, 1, 47),
(42, 3, 1, 48),
(43, 2, 1, 49),
(44, 2, 1, 50),
(45, 1, 1, 51),
(46, 1, 1, 52),
(47, 1, 1, 53),
(48, 1, 1, 54),
(49, 1, 1, 55),
(50, 3, 1, 56),
(51, 3, 10, 57),
(52, 3, 110, 58),
(53, 2, 1, 59),
(54, 2, 1, 60),
(55, 2, 1, 61),
(56, 2, 1, 62),
(57, 1, 1, 63),
(58, 2, 1, 64),
(59, 1, 1, 65),
(60, 2, 1, 66),
(61, 1, 10, 79),
(62, 2, 5, 79);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `id_linea` int(10) NOT NULL,
  `linDescripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lineas`
--

INSERT INTO `lineas` (`id_linea`, `linDescripcion`) VALUES
(1, 'Granos'),
(2, 'Lácteos'),
(3, 'Licores'),
(4, 'Ropa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `proCodigo` int(10) NOT NULL,
  `proNombre` varchar(30) NOT NULL,
  `proDescripcion` varchar(200) NOT NULL,
  `proFoto` longblob NOT NULL,
  `proPrecio` double NOT NULL,
  `proCantidad` int(5) NOT NULL,
  `proIva` int(3) NOT NULL,
  `proDisponibilidad` tinyint(1) NOT NULL,
  `proId_proveedor` int(10) NOT NULL,
  `proId_linea` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `proCodigo`, `proNombre`, `proDescripcion`, `proFoto`, `proPrecio`, `proCantidad`, `proIva`, `proDisponibilidad`, `proId_proveedor`, `proId_linea`) VALUES
(1, 1458, 'Crema Dental', 'La Crema Dental Colgate Sensitive Pro Alivio con Tecnología Pro-Argin es la primera Crema dental que esta clinicamente comprobada para brindar alivio inmediato y duradero de la hipersensibilidad denti', 0x5b6f626a656374204f626a6563745d, 15000, 2070, 19, 1, 1, 4),
(2, 98885, 'Bebida gaseosa sabor uva.', 'Bebida gaseosa sabor uva. No es una fuente significativa de Calorías de la Grasa, Grasa Saturada, Grasa Trans, Colesterol, Fibra Dietaria, Vitamina A, Vitamina C, Calcio y Hierro', 0x5b6f626a656374204f626a6563745d, 4500, 1151, 16, 1, 2, 2),
(3, 45489, 'Cama', 'Cama de prueba', 0x5b6f626a656374204f626a6563745d, 1800000, 0, 19, 2, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(10) NOT NULL,
  `provNombre` varchar(50) NOT NULL,
  `provNit` bigint(11) NOT NULL,
  `provDireccion` varchar(50) NOT NULL,
  `provCorreo` varchar(50) NOT NULL,
  `provTelefono` bigint(20) NOT NULL,
  `provActivo` tinyint(1) NOT NULL DEFAULT 1,
  `provFechaRegistro` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `provNombre`, `provNit`, `provDireccion`, `provCorreo`, `provTelefono`, `provActivo`, `provFechaRegistro`) VALUES
(1, 'Colgate S.A', 1009458, 'Calle 98 C558', 'colgate@colgate.com', 1800988, 1, '2021-07-09'),
(2, 'Postobon S.A', 1213458, 'Calle 100 A558', 'postobon@gmail.com', 1800988, 1, '2021-07-09'),
(3, 'FlorHuila CORP', 9885438, 'Calle 198 C258', 'FlorHuila@outlook.com', 1800988, 1, '2021-07-09'),
(4, 'Colanta', 58778965, 'Calle 80C #988-54', 'Colanta@gmail.com', 4558965, 1, '2021-07-09'),
(5, 'Alqueria', 54448658, 'Carrera 98 25-4', 'Alqueria@adminAlqueria.com', 4889565, 2, '2021-07-09'),
(6, 'Nestle', 98544778, 'Avenida 98 68-45', 'Nestle@Hotmail.com', 8788985, 1, '2021-07-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(10) NOT NULL,
  `rolDescripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rolDescripcion`) VALUES
(1, 'Empleado'),
(2, 'Administrador'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_edicion`
--

CREATE TABLE `solicitudes_edicion` (
  `id_solicitud` int(10) NOT NULL,
  `seId_empleado` int(10) NOT NULL,
  `seId_cliente` int(10) NOT NULL,
  `seFechaSolicitud` datetime NOT NULL DEFAULT current_timestamp(),
  `seDescripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitudes_edicion`
--

INSERT INTO `solicitudes_edicion` (`id_solicitud`, `seId_empleado`, `seId_cliente`, `seFechaSolicitud`, `seDescripcion`) VALUES
(1, 4, 8, '2021-07-08 00:00:00', 'Requiere cambio de cedula'),
(2, 4, 9, '2021-07-08 09:25:15', 'Cambio de Apellido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(10) NOT NULL,
  `usuPrimerNombre` varchar(50) NOT NULL,
  `usuSegundoNombre` varchar(50) NOT NULL,
  `usuPrimerApellido` varchar(50) NOT NULL,
  `usuSegundoApellido` varchar(50) NOT NULL,
  `usuTipoDocumento` varchar(3) NOT NULL,
  `usuNumeroDocumento` varchar(20) NOT NULL,
  `usuFechaNacimiento` date NOT NULL,
  `usuCorreo` varchar(50) NOT NULL,
  `usuDireccion` varchar(50) NOT NULL,
  `usuTelefono` bigint(20) NOT NULL,
  `usuPassword` varchar(50) NOT NULL,
  `usuActivo` tinyint(1) NOT NULL DEFAULT 1,
  `usuId_ciudadNacimiento` int(10) NOT NULL,
  `usuId_ciudadResidencia` int(10) NOT NULL,
  `usuId_role` int(10) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `usuPrimerNombre`, `usuSegundoNombre`, `usuPrimerApellido`, `usuSegundoApellido`, `usuTipoDocumento`, `usuNumeroDocumento`, `usuFechaNacimiento`, `usuCorreo`, `usuDireccion`, `usuTelefono`, `usuPassword`, `usuActivo`, `usuId_ciudadNacimiento`, `usuId_ciudadResidencia`, `usuId_role`) VALUES
(4, 'Brayan', 'Andres', 'Hinestroza', 'Boya', 'C.C', '1005943951', '2021-06-08', 'brayan@gmail.com', 'CASASDASD', 42315, 'Ba123456', 1, 6, 6, 1),
(8, 'Laura', 'Maria', 'Wallis', 'pereza', '2', '123123', '2021-07-19', 'prueba@gmail.com', 'Calle 85A', 45456433, 'Bah123456', 1, 11, 6, 3),
(9, 'Laura', 'Maria', 'Wallis', 'pereza', '2', '123123', '2021-07-19', 'prueba1@gmail.com', 'casdasd', 45456433, 'Ba123456', 1, 11, 7, 2),
(10, 'Brayan', 'Andres', 'Hinestroza', 'Boya', 'C.C', '5487895', '2021-11-30', 'brayan1@gmail.com', 'Casdajkaslkdj', 4230554, 'Ba123456', 1, 3, 8, 1);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `afterI_create_user_carritocompra` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO `commerce`.`carritos_compras`
	(`id_carrito`)
	VALUES
	(New.id_usuarios);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(10) NOT NULL,
  `venFechaventa` datetime NOT NULL DEFAULT current_timestamp(),
  `venId_cliente` int(10) NOT NULL,
  `venId_empleado` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `venFechaventa`, `venId_cliente`, `venId_empleado`) VALUES
(1, '2021-07-12 18:49:59', 8, NULL),
(3, '2021-07-12 18:52:26', 8, NULL),
(4, '2021-07-12 18:52:49', 8, NULL),
(5, '2021-07-12 18:55:47', 8, NULL),
(6, '2021-07-12 19:05:41', 8, NULL),
(7, '2021-07-12 19:06:36', 8, NULL),
(8, '2021-07-12 19:07:45', 8, NULL),
(9, '2021-07-12 19:13:02', 8, NULL),
(10, '2021-07-12 19:13:31', 8, NULL),
(11, '2021-07-12 19:13:42', 8, NULL),
(12, '2021-07-12 19:14:42', 8, NULL),
(13, '2021-07-12 19:15:35', 8, NULL),
(14, '2021-07-12 19:16:30', 8, NULL),
(15, '2021-07-12 19:16:48', 8, NULL),
(16, '2021-07-12 19:17:11', 8, NULL),
(17, '2021-07-12 19:19:52', 8, NULL),
(18, '2021-07-12 19:20:23', 8, NULL),
(19, '2021-07-12 19:21:58', 8, NULL),
(20, '2021-07-12 19:21:58', 8, NULL),
(21, '2021-07-12 19:22:37', 8, NULL),
(22, '2021-07-12 19:22:53', 8, NULL),
(23, '2021-07-12 19:23:22', 8, NULL),
(24, '2021-07-12 19:23:38', 8, NULL),
(25, '2021-07-12 19:29:57', 8, NULL),
(26, '2021-07-12 19:30:15', 8, NULL),
(27, '2021-07-12 19:31:13', 8, NULL),
(28, '2021-07-12 19:33:34', 8, NULL),
(29, '2021-07-12 20:54:27', 8, NULL),
(30, '2021-07-12 20:57:03', 8, NULL),
(31, '2021-07-12 20:57:07', 8, NULL),
(32, '2021-07-12 20:57:07', 8, NULL),
(33, '2021-07-12 20:57:20', 8, NULL),
(34, '2021-07-12 21:36:45', 8, NULL),
(35, '2021-07-12 21:36:51', 8, NULL),
(36, '2021-07-12 21:36:51', 8, NULL),
(37, '2021-07-12 21:38:57', 8, NULL),
(38, '2021-07-12 21:41:12', 8, NULL),
(39, '2021-07-12 21:58:03', 8, NULL),
(40, '2021-07-12 22:03:54', 8, NULL),
(41, '2021-07-12 22:53:36', 8, NULL),
(42, '2021-07-12 22:55:28', 8, NULL),
(43, '2021-07-12 22:56:55', 8, NULL),
(44, '2021-07-12 22:58:48', 8, NULL),
(45, '2021-07-12 23:16:27', 8, NULL),
(46, '2021-07-12 23:16:38', 8, NULL),
(47, '2021-07-12 23:40:03', 8, NULL),
(48, '2021-07-12 23:42:47', 8, NULL),
(49, '2021-07-13 00:13:37', 8, NULL),
(50, '2021-07-13 00:18:25', 8, NULL),
(51, '2021-07-13 00:18:34', 8, NULL),
(52, '2021-07-13 00:39:58', 8, NULL),
(53, '2021-07-13 00:40:29', 8, NULL),
(54, '2021-07-13 00:42:57', 8, NULL),
(55, '2021-07-13 00:43:29', 8, NULL),
(56, '2021-07-13 00:44:19', 8, NULL),
(57, '2021-07-13 00:44:50', 8, NULL),
(58, '2021-07-13 00:45:08', 8, NULL),
(59, '2021-07-14 11:29:53', 8, NULL),
(60, '2021-07-14 11:30:30', 8, NULL),
(61, '2021-07-16 07:05:36', 8, NULL),
(62, '2021-07-16 07:07:32', 8, NULL),
(63, '2021-07-16 07:08:38', 8, NULL),
(64, '2021-07-16 07:16:42', 8, NULL),
(65, '2021-07-16 07:16:47', 8, NULL),
(66, '2021-07-16 14:49:31', 8, NULL),
(67, '2021-07-17 03:19:36', 8, NULL),
(68, '2021-07-17 03:22:06', 8, NULL),
(69, '2021-07-17 03:23:24', 8, NULL),
(70, '2021-07-17 03:24:01', 8, NULL),
(71, '2021-07-17 03:24:45', 8, NULL),
(72, '2021-07-17 03:25:48', 8, NULL),
(73, '2021-07-17 03:26:09', 8, NULL),
(74, '2021-07-17 03:27:10', 8, NULL),
(75, '2021-07-18 12:41:12', 8, NULL),
(76, '2021-07-18 12:41:56', 8, NULL),
(77, '2021-07-18 22:25:19', 8, NULL),
(78, '2021-07-18 22:26:49', 8, NULL),
(79, '2021-07-18 22:36:36', 8, NULL),
(80, '2021-07-18 22:41:07', 8, NULL),
(81, '2021-07-18 22:45:25', 8, NULL),
(82, '2021-07-18 22:52:17', 8, NULL),
(83, '2021-07-18 22:54:35', 8, NULL),
(84, '2021-07-18 22:54:55', 8, NULL),
(85, '2021-07-18 23:17:30', 8, NULL),
(86, '2021-07-18 23:18:08', 8, NULL),
(87, '2021-07-18 23:18:47', 8, NULL),
(88, '2021-07-18 23:19:27', 8, NULL),
(89, '2021-07-18 23:53:02', 8, NULL),
(90, '2021-07-18 23:53:58', 8, NULL),
(91, '2021-07-19 01:10:52', 8, NULL),
(92, '2021-07-19 03:03:56', 8, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos_compras`
--
ALTER TABLE `carritos_compras`
  ADD PRIMARY KEY (`id_carrito`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `fk_cotizaciones_usuarioC` (`cotId_cliente`),
  ADD KEY `fk_cotizaciones_usuarioE` (`cotId_empleado`);

--
-- Indices de la tabla `detalles_carritos`
--
ALTER TABLE `detalles_carritos`
  ADD UNIQUE KEY `detcarId_producto` (`detcarId_producto`),
  ADD KEY `fk_detcar_carritos` (`detcarId_carrito`);

--
-- Indices de la tabla `detalles_cotizaciones`
--
ALTER TABLE `detalles_cotizaciones`
  ADD PRIMARY KEY (`id_detalle_cotizacion`),
  ADD KEY `fk_detcot_producto` (`detcotId_producto`),
  ADD KEY `fk_detcot_cotizacion` (`detcotId_cotizacion`);

--
-- Indices de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD PRIMARY KEY (`id_detalle_venta`),
  ADD KEY `fk_detve_ventas` (`detveId_venta`),
  ADD KEY `fk_detve_productos` (`detveId_producto`);

--
-- Indices de la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`id_linea`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_productos_lineas` (`proId_linea`),
  ADD KEY `fk_productos_proveedores` (`proId_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `provNit` (`provNit`,`provCorreo`) USING BTREE;

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `solicitudes_edicion`
--
ALTER TABLE `solicitudes_edicion`
  ADD PRIMARY KEY (`id_solicitud`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD UNIQUE KEY `usuNumeroDocumento` (`usuNumeroDocumento`,`usuCorreo`),
  ADD KEY `fk_usuario_roles` (`usuId_role`),
  ADD KEY `fk_usuario_ciudadNacimiento` (`usuId_ciudadNacimiento`),
  ADD KEY `fk_usuario_ciudadResidencia` (`usuId_ciudadResidencia`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_ventas_usuarios` (`venId_cliente`),
  ADD KEY `fk_ventas_usuariosE` (`venId_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id_cotizacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_cotizaciones`
--
ALTER TABLE `detalles_cotizaciones`
  MODIFY `id_detalle_cotizacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  MODIFY `id_detalle_venta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id_linea` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes_edicion`
--
ALTER TABLE `solicitudes_edicion`
  MODIFY `id_solicitud` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritos_compras`
--
ALTER TABLE `carritos_compras`
  ADD CONSTRAINT `fk_carritosCompras_usuarios` FOREIGN KEY (`id_carrito`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `fk_cotizaciones_usuarioC` FOREIGN KEY (`cotId_cliente`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `fk_cotizaciones_usuarioE` FOREIGN KEY (`cotId_empleado`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `detalles_carritos`
--
ALTER TABLE `detalles_carritos`
  ADD CONSTRAINT `fk_detcar_carritos` FOREIGN KEY (`detcarId_carrito`) REFERENCES `carritos_compras` (`id_carrito`),
  ADD CONSTRAINT `fk_detcar_productos` FOREIGN KEY (`detcarId_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalles_cotizaciones`
--
ALTER TABLE `detalles_cotizaciones`
  ADD CONSTRAINT `fk_detcot_cotizacion` FOREIGN KEY (`detcotId_cotizacion`) REFERENCES `cotizaciones` (`id_cotizacion`),
  ADD CONSTRAINT `fk_detcot_producto` FOREIGN KEY (`detcotId_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD CONSTRAINT `fk_detve_productos` FOREIGN KEY (`detveId_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_detve_ventas` FOREIGN KEY (`detveId_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_lineas` FOREIGN KEY (`proId_linea`) REFERENCES `lineas` (`id_linea`),
  ADD CONSTRAINT `fk_productos_proveedores` FOREIGN KEY (`proId_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_ciudadNacimiento` FOREIGN KEY (`usuId_ciudadNacimiento`) REFERENCES `ciudades` (`id_ciudad`),
  ADD CONSTRAINT `fk_usuario_ciudadResidencia` FOREIGN KEY (`usuId_ciudadResidencia`) REFERENCES `ciudades` (`id_ciudad`),
  ADD CONSTRAINT `fk_usuario_roles` FOREIGN KEY (`usuId_role`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_usuarios` FOREIGN KEY (`venId_cliente`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `fk_ventas_usuariosE` FOREIGN KEY (`venId_empleado`) REFERENCES `usuarios` (`id_usuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
