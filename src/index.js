const express = require("express");
const app = express();

app.set('view engine', 'ejs')

app.use(express.urlencoded({extended:false}));

app.use('/', require('../router'));

app.listen(4000, ()=>{
    console.log('Server 4000')
})
