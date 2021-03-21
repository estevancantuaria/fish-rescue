const express = require('express');
const UserController = require('../controllers/UserController');
const SessionController = require('../controllers/SessionController');
const RescueController = require('../controllers/RescueController')
const auth = require('../middleware/auth');

const routes = express.Router();

//Rotas do User
routes.post('/users',UserController.store)

//Rotas de autenticação
routes.post('/auth/', SessionController.store);
routes.get('/auth/', auth, SessionController.index);

routes.post('/rescue/',RescueController.store)

module.exports = routes;