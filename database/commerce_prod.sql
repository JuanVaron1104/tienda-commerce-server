-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2021 a las 05:55:44
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `id_linea` int(10) NOT NULL,
  `linDescripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `afterI_create_user_carritocompra` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO `tps_103`.`carritos_compras`
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
  `venSubTotal` double NOT NULL,
  `venValorIva` double NOT NULL,
  `venTotalVenta` double NOT NULL,
  `venFechaventa` datetime NOT NULL DEFAULT current_timestamp(),
  `venId_cliente` int(10) NOT NULL,
  `venId_empleado` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `id_detalle_venta` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id_linea` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes_edicion`
--
ALTER TABLE `solicitudes_edicion`
  MODIFY `id_solicitud` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(10) NOT NULL AUTO_INCREMENT;

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
