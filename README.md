# Getting Started with Create React App

Este proyecto esta hecho con node js

## Importante

Usar version de node 16.20.2 (Esto por problemas con dependencias)
se puede encontrar en el siguiente [enlace](https://nodejs.org/en/blog/release/v16.20.2)

### `npm start`

Importante
para poder correr el servidor primero se debe correr el script para crear la base de datos en mysql

los archivos de scripts estan en la carpeta database
usar en lo posible el que dice prod. tiene la estructura de las tablas sin informacion.

el otro inserta unos datos de pruebas. puede generar algunos errores en las pantallas

instalar primero dependencias 

```
npm i
```

y luego ejecutar comando para correr el front de manera local

```
npm start
```


en caso de que aparezca un mensaje que diga que no se pudo conectar a la base de datos por favor verificar lo siguiente

primero que el xampp este corriendo como administrador

haber creado la base de datos previamente

verificar datos de conexion en archivo config.js

el proyecto se va a correr automaticamente en el puerto 5000