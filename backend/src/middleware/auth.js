const jwt = require('jsonwebtoken');


module.exports =  async function (req, res, next) {
  const token = req.header('x-auth-token');

  if (!token) {
    return res.status(401).json({ error: 'Token não existe.' });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWTSECRET);

    req.userId = decoded.id;

    return next();
  } catch (err) {
    return res.status(401).json({ error: 'Token invalido.' });
  }
};