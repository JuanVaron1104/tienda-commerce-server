const express = require('express')
const cors = require('cors');
const morgan = require('morgan');
const multer = require('multer');
const config = require('./config');
const path = require('path');


//Inicializacion
const app = express();
const storage = config.multerConfig;

//Archivos estaticos
app.use(express.static(path.join(__dirname, '/files')));

//settings
app.set('port', process.env.PORT || config.PORT);

//middlewares
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(morgan('dev'));

app.use(multer({
    storage
}).single('files'))


app.use('/', require('./routes/api.routes'));

module.exports = app;