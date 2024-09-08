const config = {}
const multer = require('multer');
const path = require('path');
const genUUID = require('./utils/generarUUID')

//Define el puerto del servidor
config.PORT = 5000;

//Define datos DE CONEXION A la base de dato
config.DB_DATA = {
    DB_HOST: 'localhost',
    DB_USER: 'root',
    DB_PASS: '',
    DB_DATABASE: 'tps_103'
}

//Configuracion de multer
config.multerConfig = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, '/files'))
    },
    filename: function (req, file, cb) {
        cb(null, (req.body.proCodigo + '_' + genUUID() + '.' + file.mimetype.split('/')[1]))
    }
})

module.exports = config