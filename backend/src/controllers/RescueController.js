const Rescue = require('../models/Rescue')

module.exports = {
    async store(req,res){
        const {user_id,nome_usina} = req.body;

        try {
            const rescue = Rescue.create({user_id,nome_usina});
            return res.json(rescue)
        } catch (error) {
            console.log(err.message);
            res.status(500).send('Server Error');
        }
    }
}