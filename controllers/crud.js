const conexion = require("../database/db");

exports.save = (req, res) => {
  const nombre = req.body.nombre;
  const nume_doc = req.body.nume_doc;
  const direccion = req.body.direccion;
  conexion.query(
    "INSERT INTO clientes SET ?",
    { nombre: nombre, nume_doc: nume_doc, direccion: direccion },
    (error, results) => {
      if (error) {
        console.log(error);
      } else {
        res.redirect("/");
      }
    }
  );
};
exports.saveFactura = (req, res) => {
  const nume_doc = req.body.nume_doc;
  const codi_estado = req.body.codi_estado;
  const valor_fac = req.body.valor_fac;
  var date;
  date = new Date();
  date =
    date.getUTCFullYear() +
    "-" +
    ("00" + (date.getUTCMonth() + 1)).slice(-2) +
    "-" +
    ("00" + date.getUTCDate()).slice(-2) +
    " " +
    ("00" + date.getUTCHours()).slice(-2) +
    ":" +
    ("00" + date.getUTCMinutes()).slice(-2) +
    ":" +
    ("00" + date.getUTCSeconds()).slice(-2);
  console.log(date);
  const fecha_fac = date;
  conexion.query(
    "INSERT INTO factura SET ?",
    {
      nume_doc: nume_doc,
      codi_estado: codi_estado,
      valor_fac: valor_fac,
      fecha_fac: fecha_fac,
    },
    (error, results) => {
      if (error) {
        console.log(error);
      } else {
        res.redirect("/");
      }
    }
  );
};
