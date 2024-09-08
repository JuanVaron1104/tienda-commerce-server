const Controller = {};
const CommonModels = require("../models/api.model");

Controller.UserLogin = async (req, res) => {
    const { usuCorreo, usuPassword: password } = req.body;

    const usuariosEncontrados = await CommonModels.UserLogin(usuCorreo);

    if (usuariosEncontrados.length > 0) {
        const { usuPassword, usuId_role, id_usuarios, usuPrimerNombre, usuPrimerApellido } = usuariosEncontrados[0];
        if (password === usuPassword) {
            const username = `${usuPrimerNombre} ${usuPrimerApellido}`
            res
                .status(200)
                .send({ usuId_role, id_usuarios, username })
        } else {
            res
                .status(403)
                .send({ message: "La contraseña es incorrecta", code: 2 });
        }
    } else {
        res
            .status(403)
            .send({ message: "El usuario no se encuentra registrado", code: 2 });
    }
};


Controller.UserSignUp = async (req, res) => {
    const { usuCorreo } = req.body;

    const usuariosEncontrados = await CommonModels.UserLogin(usuCorreo);

    if (usuariosEncontrados.length > 0) {
        res.status(409).send({ message: "El usuario ya se encuentra registrado" });
    } else {
        const usuarioRegistrado = await CommonModels.UserSignUp(req.body);

        if (usuarioRegistrado.affectedRows > 0) {
            res
                .status(201)
                .send({ message: "Cliente registrado correctamente" });
        } else {
            res
                .status(500)
                .send({ message: "Ha ocurrido algún error" });
        }
    }
}

Controller.getCiudades = async (req, res) => {
    const ciudades = await CommonModels.getCiudades();
    res.send(ciudades)
}

Controller.getProveedores = async (req, res) => {
    const proveedores = await CommonModels.getProveedores();
    res.send(proveedores)
}

Controller.getLineas = async (req, res) => {
    const lineas = await CommonModels.getLineas();
    res.send(lineas)
}

Controller.getClientes = async (req, res) => {
    const clientes = await CommonModels.getClientes();
    res.send(clientes)
}

Controller.getSolicitudesClientes = async (req, res) => {
    const clientes = await CommonModels.getSolicitudesClientes();
    res.send(clientes)
}

Controller.getClientesByIdOrCorreo = async (req, res) => {
    const clientes = await CommonModels.getClientesByIdOrCorreo(req.query);
    res.send(clientes)
}

Controller.getDatosCliente = async (req, res) => {
    const clientes = await CommonModels.getDatosCliente(req.query);
    res.send(clientes)
}

Controller.updateDatosCliente = async (req, res) => {
    const clientes = await CommonModels.updateDatosCliente(req.body);

    if (clientes.affectedRows > 0) {
        res
            .status(201)
            .send({ message: "Se ha actualizado correctamente" });
    } else {
        res
            .status(500)
            .send({ message: "Ha ocurrido algún error" });
    }
}

Controller.getEmpleados = async (req, res) => {
    const empleados = await CommonModels.getEmpleados();
    res.send(empleados)
}

Controller.getEmpleadosByIdOrCorreo = async (req, res) => {
    const empleados = await CommonModels.getEmpleadosByIdOrCorreo(req.query);
    res.send(empleados)
}

Controller.EmpleadoSignUp = async (req, res) => {
    const { usuCorreo } = req.body;
    const usuariosEncontrados = await CommonModels.UserLogin(usuCorreo);
    if (usuariosEncontrados.length > 0) {
        res.status(409).send({ message: "El usuario ya se encuentra registrado" });
    } else {
        const registerData = req.body
        const usuarioRegistrado = await CommonModels.EmpleadoSignUp({ ...registerData, usuId_role: 1 });

        if (usuarioRegistrado.affectedRows > 0) {
            res
                .status(201)
                .send({ message: "Empleado registrado correctamente" });
        } else {
            res
                .status(500)
                .send({ message: "Ha ocurrido algún error" });
        }
    }
}

/**
 * Rutas de los PRODUCTOS
 */

Controller.getProductos = async (req, res) => {
    const productos = await CommonModels.getProductos(req.query);
    res.send(productos)
}

Controller.getProducto = async (req, res) => {
    const { codigo } = req.params
    const producto = await CommonModels.getProducto(codigo);
    res.send(producto)
}

Controller.AgregarProducto = async (req, res) => {
    const datos = req.body
    const file = req.file.filename
    const data = { ...datos, proFoto: file }

    const productoRegistrado = await CommonModels.AgregarProducto(data);

    if (productoRegistrado.affectedRows > 0) {
        res
            .status(201)
            .send({ message: "Producto registrado correctamente" });
    } else {
        res
            .status(500)
            .send({ message: "Ha ocurrido algún error" });
    }
}

Controller.getProductosByParam = async (req, res) => {
    const { searchData } = req.query
    const productos = await CommonModels.getProductosByParam(searchData);
    res.send(productos)
}


/**
 * Rutas de los PROVEEDORES
 */

Controller.AgregarProveedor = async (req, res) => {
    const proveedorRegistrado = await CommonModels.AgregarProveedor(req.body);

    if (proveedorRegistrado.affectedRows > 0) {
        res
            .status(201)
            .send({ message: "Proveedor registrado correctamente" });
    } else {
        res
            .status(500)
            .send({ message: "Ha ocurrido algún error" });
    }

}

/**
 * 
 * CARRITO DE COMPRAS
 */
Controller.getCarritoCompras = async (req, res) => {
    const carrito = await CommonModels.getCarritoCompras(req.query);
    res.send(carrito)
}

Controller.postCarritoCompras = async (req, res) => {
    try {
        const carrito = await CommonModels.postCarritoCompras(req.body);
        res.send(carrito)
    } catch (error) {
        console.log(error)
        if (error.code === "ER_DUP_ENTRY") {
            res
                .status(403)
                .send({ message: "El producto ya ha sido añadido" })
        }
    }
}

Controller.updateCarritoCompras = async (req, res) => {
    const carrito = await CommonModels.updateCarritoCompras(req.body);
    res.send(carrito)
}

Controller.deleteCarritoCompras = async (req, res) => {
    const carrito = await CommonModels.deleteCarritoCompras(req.query);
    res.send(carrito)
}

/**
 * COMPRAS / VENTAS
 */
Controller.getCompra = async (req, res) => {
    const compra = await CommonModels.getCompra(req.query);
    res.send(compra)
}

Controller.getCompras = async (req, res) => {
    const compras = await CommonModels.getCompras(req.query);
    res.send(compras)
}

Controller.getComprasRecientes = async (req, res) => {
    const compras = await CommonModels.getComprasRecientes(req.query);
    res.send(compras)
}

Controller.postAnhadirCompra = async (req, res) => {
    const carrito = await CommonModels.getCarritoCompras(req.body);
    const resultadoCompra = await CommonModels.postAnhadirCompra(carrito, req.body);

    res.send(resultadoCompra)
}

Controller.getComprasPorDia = async (req, res) => {
    const compras = await CommonModels.getComprasPorDia();
    res.send(compras)
}

Controller.getTotalVentaPorDia = async (req, res) => {
    const compras = await CommonModels.getTotalVentaPorDia();
    res.send(compras)
}

module.exports = Controller;