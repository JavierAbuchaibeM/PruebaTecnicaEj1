const mysql = require("mysql");
const router = require("../router");

const conexion = mysql.createConnection({
    host: "localhost",
    database: "bdpruebatec",
    user: "root",
    password: "",
});


conexion.connect((error)=>{
    if (error){
        console.error(error)
        return
    }
    console.log('Conectado a la BD')
})

module.exports = conexion;