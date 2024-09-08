const Model = {};
const pool = require("../database");

Model.UserLogin = (usuCorreo) => {
    const query =
        "SELECT usuPassword, usuId_role, id_usuarios, usuPrimerNombre, usuPrimerApellido from USUARIOS WHERE usuCorreo = ?";
    return pool.query(query, usuCorreo);
};

Model.UserSignUp = (datosUsuario) => {
    const query = "INSERT INTO usuarios SET ?";
    return pool.query(query, datosUsuario);
};

Model.getCiudades = () => {
    const query = "SELECT id_ciudad, ciuNombre FROM CIUDADES";
    return pool.query(query);
}

Model.getLineas = () => {
    const query = "SELECT id_linea, linDescripcion FROM LINEAS";
    return pool.query(query);
}

Model.getClientes = () => {
    const query = `SELECT usuTipoDocumento 'Tipo', usuNumeroDocumento 'Identificación', usuCorreo 'Correo', 
                    usuPrimerNombre 'Primer nombre', usuSegundoNombre 'Segundo nombre', usuPrimerApellido 'Primer apellido', 
                    usuSegundoApellido 'Segundo apellido', usuTelefono 'Teléfono' FROM USUARIOS
                    WHERE usuId_role = (SELECT id_rol FROM ROLES WHERE rolDescripcion = 'Cliente')`;
    return pool.query(query);
}

Model.getSolicitudesClientes = () => {
    const query = `SELECT DATE_FORMAT(seFechaSolicitud,'%m/%d/%Y %H:%i %p') 'Fecha solicitud', 
                    (SELECT usuNumeroDocumento FROM usuarios WHERE id_usuarios = seId_cliente) 'Identificación', 
                    (SELECT usuPrimerNombre FROM usuarios WHERE id_usuarios = seId_cliente) 'Nombre', 
                    (SELECT usuPrimerApellido FROM usuarios WHERE id_usuarios = seId_empleado) 'Apellido', 
                    (SELECT usuPrimerNombre FROM usuarios WHERE id_usuarios = seId_empleado) 'Empleado', 
                    seDescripcion 'Descripcion' FROM solicitudes_edicion`;
    return pool.query(query);
}

Model.getClientesByIdOrCorreo = ({ usuNumeroDocumento, usuCorreo }) => {
    const query = `SELECT usuTipoDocumento 'Tipo', usuNumeroDocumento 'Identificación', usuCorreo 'Correo', 
                    usuPrimerNombre 'Primer nombre', usuSegundoNombre 'Segundo nombre', usuPrimerApellido 'Primer apellido', 
                    usuSegundoApellido 'Segundo apellido', usuTelefono 'Teléfono' FROM USUARIOS
                    WHERE usuId_role = (SELECT id_rol FROM ROLES WHERE rolDescripcion = 'Cliente') 
                    AND (usuNumeroDocumento = '${usuNumeroDocumento}' ${usuCorreo ? `OR usuCorreo LIKE '%${usuCorreo}%')` : ")"}`;
    return pool.query(query);
}

Model.getDatosCliente = ({ id_usuarios }) => {
    const query = `SELECT usuPrimerNombre , usuSegundoNombre , usuPrimerApellido, usuCorreo , usuTelefono, 
                    usuSegundoApellido, usuTipoDocumento , usuNumeroDocumento , 
                    DATE_FORMAT(usuFechaNacimiento,'%m/%d/%Y') 'usuFechaNacimiento', usuDireccion, 
                    (SELECT ciuNombre FROM ciudades WHERE id_ciudad = usuId_ciudadNacimiento ) 'usuId_ciudadNacimiento',
                    (SELECT ciuNombre FROM ciudades WHERE id_ciudad = usuId_ciudadResidencia ) 'usuId_ciudadResidencia'
                    FROM USUARIOS
                    WHERE id_usuarios  = '${id_usuarios}'`;
    return pool.query(query);
}

Model.updateDatosCliente = ({ userDatos, idUsuario }) => {
    const query = `UPDATE usuarios SET ? WHERE id_usuarios = '${idUsuario}'`
    return pool.query(query, userDatos);
}

Model.getEmpleados = () => {
    const query = `SELECT usuTipoDocumento 'Tipo', usuNumeroDocumento 'Identificación', usuCorreo 'Correo', 
                    usuPrimerNombre 'Primer nombre', usuSegundoNombre 'Segundo nombre', usuPrimerApellido 'Primer apellido', 
                    usuSegundoApellido 'Segundo apellido', usuTelefono 'Teléfono' FROM USUARIOS
                    WHERE usuId_role = (SELECT id_rol FROM ROLES WHERE rolDescripcion = 'Empleado')`;
    return pool.query(query);
}

Model.getEmpleadosByIdOrCorreo = ({ usuNumeroDocumento, usuCorreo }) => {
    const query = `SELECT usuTipoDocumento 'Tipo', usuNumeroDocumento 'Identificación', usuCorreo 'Correo', 
                    usuPrimerNombre 'Primer nombre', usuSegundoNombre 'Segundo nombre', usuPrimerApellido 'Primer apellido', 
                    usuSegundoApellido 'Segundo apellido', usuTelefono 'Teléfono' FROM USUARIOS
                    WHERE usuId_role = (SELECT id_rol FROM ROLES WHERE rolDescripcion = 'Empleado') 
                    AND (usuNumeroDocumento = '${usuNumeroDocumento}' ${usuCorreo ? `OR usuCorreo LIKE '%${usuCorreo}%')` : ")"}`;
    return pool.query(query);
}

Model.EmpleadoSignUp = (datosEmpleado) => {
    const query = "INSERT INTO usuarios SET ?";
    return pool.query(query, datosEmpleado);
};

/**
 * Rutas de los PRODUCTOS
 */

Model.getProductos = ({ searchField, proveedor = 0, linea = 0, precio = 0 }) => {
    let precioQuery = "";
    switch (precio) {
        case "1":
            precioQuery = "< 100000";
            break;

        case "2":
            precioQuery = "> 100000 AND proPrecio <300000";
            break;

        case "3":
            precioQuery = "> 300000 AND proPrecio <700000";
            break;

        case "4":
            precioQuery = "> 700000";
            break;
        default:
    }

    const query = `SELECT proCodigo 'Codigo', proNombre 'Producto', (SELECT provNombre FROM proveedores 
                    WHERE id_proveedor = proId_proveedor) 'Proveedor', proFoto,
                    (SELECT linDescripcion FROM lineas WHERE id_linea = proId_linea) 'Linea', proPrecio 'Precio', proCantidad 'Cantidad', 
                    (SELECT (CASE WHEN proDisponibilidad = 2 then 'Agotado' ELSE 'Disponible' END)) 'Disponibilidad' 
                    FROM PRODUCTOS WHERE proNombre LIKE '%${searchField ? searchField : ``}%' 
                    AND proId_proveedor ${proveedor != 0 ? `= ${proveedor}` : `LIKE '%%'`} 
                    AND proId_linea ${linea != 0 ? `= ${linea}` : `LIKE '%%'`} 
                    AND proPrecio ${precio != 0 ? `${precioQuery}` : `LIKE '%%'`} `;
    return pool.query(query);
}

Model.getProducto = (codigoProducto) => {
    const query = `SELECT proCodigo, proNombre, proDescripcion, proFoto, proIva,
        (SELECT provNombre FROM proveedores WHERE id_proveedor = proId_proveedor) 'proId_proveedor', 
        (SELECT linDescripcion FROM lineas WHERE id_linea = proId_linea) 'proId_linea', proPrecio, proCantidad, 
        (SELECT (CASE WHEN proDisponibilidad = 2 then 'Agotado' ELSE 'Disponible' END)) 'proDisponibilidad' 
        FROM PRODUCTOS WHERE proCodigo = ${codigoProducto}`;
    return pool.query(query);
}

Model.AgregarProducto = (datosProducto) => {
    const query = "INSERT INTO productos SET ?";
    return pool.query(query, datosProducto);
};

Model.getProductosByParam = (searchData) => {
    const query = `SELECT proCodigo 'Codigo',proNombre 'Producto', (SELECT provNombre FROM proveedores 
                    WHERE id_proveedor = proId_proveedor) 'Proveedor', proFoto,
                    (SELECT linDescripcion FROM lineas WHERE id_linea = proId_linea) 'Linea', proPrecio 'Precio', proCantidad 'Cantidad', 
                    (SELECT (CASE WHEN proDisponibilidad = 0 then 'Agotado' ELSE 'Disponible' END)) 'Disponibilidad' 
                    FROM PRODUCTOS WHERE 
                    proNombre LIKE '%${searchData}%' OR
                    proDescripcion LIKE '%${searchData}%'`;

    return pool.query(query);
}

/**
 * Rutas de los PROVEEDORES
 */

Model.AgregarProveedor = (datosProducto) => {
    const query = "INSERT INTO proveedores SET ?";
    return pool.query(query, datosProducto);
};

Model.getProveedores = () => {
    const query = `SELECT id_proveedor, provNit 'NIT', provNombre 'Nombre',  
                    provCorreo 'Correo', provDireccion 'Dirección', provTelefono 'Teléfono', 
                    (CASE WHEN provActivo = 1 then 'Activo' ELSE 'Inactivo' END) 'Estado' FROM PROVEEDORES 
                    ORDER BY provNombre ASC`;
    return pool.query(query);
}


/**
 * CARRITO DE COMPRAS
 */

Model.getCarritoCompras = ({ id_usuarios }) => {
    const query = `SELECT proNombre, proCodigo, proFoto, proPrecio, proDisponibilidad, detcarCantidad, proIva, proCantidad
    FROM productos JOIN detalles_carritos ON id_producto = detcarId_producto WHERE detcarId_carrito = ${id_usuarios} LIMIT 4`;

    console.log(query)

    return pool.query(query);
}


Model.postCarritoCompras = ({ detcarId_producto, detcarCantidad, detcarId_carrito }) => {
    const query = `INSERT INTO detalles_carritos (detcarCantidad, detcarId_producto, detcarId_carrito) VALUES (
        '${detcarCantidad}', (SELECT id_producto FROM PRODUCTOS WHERE proCodigo = '${detcarId_producto}'), '${detcarId_carrito}')`;
    return pool.query(query);
}

Model.updateCarritoCompras = ({ detcarId_producto, detcarCantidad, detcarId_carrito }) => {
    const query = `UPDATE detalles_carritos SET detcarCantidad = '${detcarCantidad}' 
                    WHERE detcarId_carrito = '${detcarId_carrito}' 
                    AND detcarId_producto = (SELECT id_producto FROM productos WHERE proCodigo = '${detcarId_producto}') `;
    return pool.query(query);
}


Model.deleteCarritoCompras = ({ detcarId_producto, detcarId_carrito }) => {
    const query = `DELETE FROM detalles_carritos WHERE detcarId_carrito=${detcarId_carrito} 
                AND detcarId_producto = (SELECT id_producto 
                FROM productos WHERE proCodigo = '${detcarId_producto}') `;
    return pool.query(query);
}

Model.getCompra = async ({ id_venta }) => {
    const query = `SELECT id_venta, DATE_FORMAT(venFechaventa,'%d/%m/%Y %H:%i %p') 'venFechaventa', 
                    usuPrimerNombre,
                    usuPrimerApellido,
                    usuSegundoApellido,
                    venSubTotal, venValorIva, venTotalVenta       
                    FROM ventas JOIN usuarios ON venId_cliente = id_usuarios  WHERE id_venta = ${id_venta}`;

    const query1 = `SELECT proCodigo, proNombre, detveCantidad 
                    FROM productos JOIN detalles_ventas ON id_producto = detveId_producto 
                    WHERE detveId_venta = ${id_venta}`

    const resultadoQ1 = await pool.query(query)

    const resultadoQ2 = await pool.query(query1)

    const resultado = { ...resultadoQ1[0], productos: resultadoQ2 }

    return resultado
}

Model.getCompras = ({ id_usuarios }) => {
    const query = `SELECT proNombre 'titulo', id_venta,
                    DATE_FORMAT(venFechaventa,'%d/%m/%Y %H:%i %p') 'fecha', proCodigo, proDisponibilidad, proFoto, proCantidad                
                    FROM detalles_ventas JOIN ventas ON id_venta = detveId_venta 
                    JOIN productos ON id_producto = detveId_producto
                    WHERE venId_cliente = ${id_usuarios} ORDER BY detveId_producto`;
    return pool.query(query);
}

Model.getComprasRecientes = ({ id_usuarios }) => {
    const query = `SELECT proNombre 'titulo', id_venta,
                    DATE_FORMAT(venFechaventa,'%d/%m/%Y %H:%i %p') 'fecha', proCodigo, proDisponibilidad, proFoto, proCantidad
                    FROM detalles_ventas JOIN ventas ON id_venta = detveId_venta 
                    JOIN productos ON id_producto = detveId_producto
                    WHERE venId_cliente = ${id_usuarios} ORDER BY venFechaventa DESC LIMIT 4`;

    console.log(query)

    return pool.query(query);
}

Model.postAnhadirCompra = async (productos, { userID: venId_cliente, venSubTotal, venValorIva, venTotalVenta }) => {
    try {
        /**
     * Parte 1. 
     * REGISTRO DE LA VENTA
     */
        const query = `INSERT INTO ventas (venId_cliente, venSubTotal, venValorIva, venTotalVenta) 
                        VALUES ('${venId_cliente}' , '${venSubTotal}', '${venValorIva}', '${venTotalVenta}' )`
        const resultado1 = await pool.query(query);

        if (resultado1.affectedRows > 0) {
            /**
             * Registro de detalle de la venta
             */
            productos.forEach(async producto => {
                const query = `INSERT INTO detalles_ventas (detveCantidad, detveId_producto , detveId_venta ) 
                    VALUES ('${producto.detcarCantidad}', (SELECT id_producto FROM PRODUCTOS WHERE proCodigo = '${producto.proCodigo}'), 
                    '${resultado1.insertId}'),`;

                const query1 = `UPDATE PRODUCTOS SET proCantidad = (${producto.proCantidad - producto.detcarCantidad}), 
                    proDisponibilidad = ${(producto.proCantidad - producto.detcarCantidad) >= 1 ? 1 : 2} 
                    WHERE proCodigo = '${producto.proCodigo}'`

                pool.query(query, () => {
                    pool.query(query1)
                })
            });

            const query = `DELETE FROM detalles_carritos WHERE detcarId_carrito =${venId_cliente}`

            return pool.query(query)

        } else {
            return Error("Ha ocurrido algún problema al realizar la compra")
        }
    } catch (error) {
        console.error(error)
    }
}


Model.getComprasPorDia = () => {
    const query = `SELECT DATE_FORMAT(CAST(venFechaventa AS date),'%d/%m/%Y') 'Dia',  
                    count(*) 'Numero' FROM ventas group by CAST(venFechaventa AS date)`;

    return pool.query(query);
}

Model.getTotalVentaPorDia = () => {
    const query = `SELECT DATE_FORMAT(CAST(venFechaventa AS date),'%d/%m/%Y') 'Dia',  SUM(venTotalVenta) 'Numero' 
                    FROM ventas group by CAST(venFechaventa AS date);`;
    console.log(query)

    return pool.query(query);
}

module.exports = Model;