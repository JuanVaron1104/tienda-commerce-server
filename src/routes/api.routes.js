const { Router } = require("express");
const router = Router();
const multer = require('multer')
const upload = multer({ dest: 'public/images/' })

const APIController = require("../controllers/api.controller");

router.route("/Login")
    .post(APIController.UserLogin);

router.route("/SignUp")
    .post(APIController.UserSignUp)

router.route("/Ciudades")
    .get(APIController.getCiudades)

router.route("/Proveedores")
    .get(APIController.getProveedores)

router.route("/Lineas")
    .get(APIController.getLineas)

router.route("/CarritoCompras")
    .get(APIController.getCarritoCompras)
    .post(APIController.postCarritoCompras)
    .put(APIController.updateCarritoCompras)
    .delete(APIController.deleteCarritoCompras)


router.route("/Compras")
    .get(APIController.getCompras)
    .post(APIController.postAnhadirCompra)

router.route("/Compra")
    .get(APIController.getCompra)

router.route("/Compras/Recientes")
    .get(APIController.getComprasRecientes)

/**
 * Rutas del CLIENTE
 */

router.route("/Clientes")
    .get(APIController.getClientes)

router.route("/Clientes/Solicitudes")
    .get(APIController.getSolicitudesClientes)

router.route("/Clientes/Search")
    .get(APIController.getClientesByIdOrCorreo)

router.route("/Cliente")
    .get(APIController.getDatosCliente)
    .put(APIController.updateDatosCliente)


/**
 * Rutas del EMPLEADO
 */
router.route("/Empleados")
    .get(APIController.getEmpleados)

router.route("/Empleados/Search")
    .get(APIController.getEmpleadosByIdOrCorreo)

router.route("/Empleado/SignUp")
    .post(APIController.EmpleadoSignUp)

/**
 * Rutas de los PRODUCTOS
 */
router.route("/Productos")
    .get(APIController.getProductos)

router.route("/Producto/:codigo")
    .get(APIController.getProducto)

router.route("/Productos/Nuevo")
    .post(APIController.AgregarProducto)

router.route("/Productos/Search")
    .get(APIController.getProductosByParam)

/**
 * Rutas de los PROVEEDORES
 */

router.route("/Proveedores/Nuevo")
    .post(APIController.AgregarProveedor)

/**
 * RUTAS DE REPORTES
 */

router.route("/Reportes/ComprasPorDia")
    .get(APIController.getComprasPorDia)

router.route("/Reportes/VentasPorDia")
    .get(APIController.getTotalVentaPorDia)

module.exports = router;