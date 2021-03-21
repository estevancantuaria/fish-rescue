const Sequelize = require('sequelize');
const dbconfig = require('../config/database');
const dotenv = require("dotenv")

dotenv.config()
const connection = new Sequelize(dbconfig);

const User = require('../models/User');
const Rescue = require('../models/Rescue');
const Image = require('../models/Image')

User.init(connection);
Rescue.init(connection);
Image.init(connection);

User.associate(connection.models);
Rescue.associate(connection.models);
Image.associate(connection.models);

module.exports = connection;