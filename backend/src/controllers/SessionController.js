const jwt = require('jsonwebtoken');
const config = require('config');
const User = require('../models/User');
const bcrypt = require('bcryptjs');

module.exports = {

    async index(req,res){
        console.log(req.userId);
        const user = await User.findByPk(req.userId);
        res.json(user);
    },

    async store(req,res){
        const {email,password} = req.body;

        const user = await User.findOne({where:{email}});

        if(!user){
            return res.status(401).json({error:'Usuario não existe!'});
        }

        /*Verificando através do bcryptjs se a senha recebida através do req.body
        corresponde a senha do usuario cadastrado no banco*/
        const isMatch = await bcrypt.compare(password,user.password_hash);

        if(!isMatch){
            return res.status(400).json({error:'Senha incorreta!'});
        }

        const{id,nome} = user;

        return res.json({
            token: jwt.sign({id}, process.env.JWTSECRET),
            email:user.email,
            name:user.name
        })
    }
}