const jwt = require('jsonwebtoken');
const config = require('config');
const User = require('../models/User');

module.exports = async function(req, res, next) {
    try {
        // Get token from header
        const token = req.header('2020-auth-token');

        // Check if there is no token
        if(!token) {
            return res.status(401).json({msg: 'authorization denied'});
        }

        const decoded = jwt.verify(token, config.get('jwtToken'));
        const user = await User.findOne({_id: decoded.user.id});
        if(!user) {
            return res.status(401).json({msg: 'authorization denied'});
        }

        req.user = decoded.user;

        next();
    } catch (err) {
        console.log("its broken");
        res.status(401).json({ msg: "Invalid Token"});
    }
}