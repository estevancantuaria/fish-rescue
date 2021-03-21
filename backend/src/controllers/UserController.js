const User = require('../models/User');
const jwt = require('jsonwebtoken');


module.exports = {

    async store(req,res){
        const{name, email, password} = req.body;
        const secret = process.env.JWTSECRET;

        try {            
            const user = await User.create({name,email,password});

            const payload = {
                user:{
                    id:user.id
                }
            }

            jwt.sign(payload, secret,{
                expiresIn:36000
            }, (err,token)=>{
                if(err) throw err;
                res.json({token})
            })

          
        } catch (err) {
            console.log(err.message);
            res.status(500).send('Server Error');
        }
     
    }
};