const express = require("express");
const router = express.Router();

const conexion = require("./database/db");

//MOSTRAR FACTURA
router.get("/", (req, res) => {
  conexion.query("SELECT * FROM factura F JOIN clientes C ON F.nume_doc = C.nume_doc JOIN estados_factura E ON F.codi_estado = E.codi_estado;", (error, results) => {
    if (error) {
      throw error;
    } else {
      var string=JSON.stringify(results);
      var result =  JSON.parse(string);
      res.render('index', {result:result})
    }
  });
});

//CREAR FACTURA
router.get("/create", (req, res) => {
  conexion.query("SELECT * FROM clientes;", (error, results) => {
    if (error) {
      throw error;
    } else {
      var string=JSON.stringify(results);
      var result =  JSON.parse(string);
      res.render('create', {result:result})
    }
  });
});

//CREAR CLIENTE
router.get("/createClient", (req, res) => {
  res.render('createClient');
})

//ELIMINAR FACTURA
router.get("/delete/:id_factura", (req, res) => {
  const id_factura = req.params.id_factura;
  conexion.query('DELETE FROM factura WHERE id_factura = ?', [id_factura],(error, results)=>{
    if (error) {
      throw error;
    } else {
      res.redirect('/')
    }
  })
})


const crud = require('./controllers/crud');

router.post('/save', crud.save)
router.post('/saveFactura', crud.saveFactura)

module.exports = router;
