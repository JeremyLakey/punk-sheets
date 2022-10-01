const express = require('express');
const router = express.Router();
const config = require('config');
const User = require('../models/User');
const Sheet = require('../models/Sheet');
const auth = require('../middleware/auth');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');


const { check, validationResult} = require("express-validator");


// @route   Post api/user
// @desc    Register a user
// @access  Public
router.post('/', 
            [check('username','Username is require').not().isEmpty(), 
            check('email', 'Please included a vaild email').isEmail(),
            check('password','Please enter a password with 6 or more characters').isLength({ min: 6 })], 
    async (req, res) => {

    const errors = validationResult(req);
    if(!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() })
    }

    const {username, email, password} = req.body;

    let userTest = await User.findOne({ email });
    let userTest2 = await User.findOne({ username });
        if(userTest || userTest2) {
            //email already in database
            return res.status(400).json({ errors: [ {msg: 'User already exists'}]});
        }
    
    const user = new User({
        username,
        email,
        password
    })


    try {
        // Encrypt password
        const salt = await bcrypt.genSalt(10);
        user.password = await bcrypt.hash(password, salt);
        
        // save User
        await user.save();
        

        // Return jsonwebtoken
        const payload = {
            user: {
                id:user.id
            }
        }

        
        // Send the webtoken
        jwt.sign(
            payload,
            config.get('jwtToken'),
            { expiresIn:36000 },
            (err, token) => {
                if(err) throw err;
                res.json({ token });
            }
        );

    } catch (err) {
        return res.status(500);
    }
});


// @route   get api/user/login
// @desc    logs the user in and returns webtoken
// @access  Private
router.post('/login', [
    check('email', 'Please included a vaild email').isEmail(),
    check('password','Password is required').exists()
], async (req, res) => {
    const errors = validationResult(req);
    if(!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() })
    }

    const {email, password} = req.body;

    try {
        // does user already exists?
        let user = await User.findOne({ email });

        if(!user) {
            //email already in database
            return res.status(400).json({ errors: [ {msg: 'Invalid Credentials'}]});
        }

        const isMatch = await bcrypt.compare(password, user.password); //compare passwords

        if (!isMatch) {
            //invalid password
            return res.status(400).json({ errors: [ {msg: 'Invalid Credentials'}]});
        }

        // Return jsonwebtoken
        const payload = {
            user: {
                id:user.id
            }
        }

        jwt.sign(
            payload,
            config.get('jwtToken'),
            { expiresIn:3600 },
            (err, token) => {
                if(err) throw err;
                res.json({ token });
            }
        );
    }
    catch (e) {
        console.log(e);
        res.status(500).send('Server error');
    }

});

// @route   get api/user
// @desc    returns the user based off of webtoken (without password)
// @access  Private
router.get('/', auth, async (req, res) => {
    try {
        const user = await User.findById(req.user.id).select('-password');
        
        if(!user) {
            res.status(401).json({msg: "Invalide Token"})
        }
        res.json(user) 
    }
    catch (err) {
        console.error(err.message);
        res.status(500).send('Server Error');
    }
});


// @route   delete api/user
// @desc    delete the user based off of webtoken (without password)
// @access  Private
router.delete('/', auth, async (req, res) => {
    try {
        await Sheet.deleteMany({user: req.user.id});
        await User.findOneAndRemove({ _id: req.user.id });
        
        res.status(200).json({msg: "profile removed"});
    }
    catch (err) {
        if(err.kind === 'ObjectId') {
            return res.status(404).json({msg: 'Post not found'});
        }
        console.error(err.message);
        res.status(500).send('Server Error');
    }
});



module.exports = router;