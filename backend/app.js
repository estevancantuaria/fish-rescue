const express = require('express');
const routes = require('./src/routes/routes')
const cors = require('cors');
const app = express();

//require para carregar as funcionalidades dos arquivos de configuração do sequelize com o postgres e
//permitir o funcionamento dos comandos ORM
require('./src/database')

app.use(cors());
app.use(express.json());
app.use(routes);

app.listen(3333);

