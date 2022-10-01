const express = require('express');
const {check, validationResult} = require('express-validator');
const router = express.Router();
const User = require('../models/User');
const Sheet = require('../models/Sheet');
const auth = require('../middleware/auth');


// @route   POST api/sheet
// @desc    add a character Sheet
// @access  Private
router.post('/', [auth,[
     check('name', 'Name is required').not().isEmpty(),
     check('int', 'Intelligence stat is required').not().isEmpty(),
     check('ref', 'Reflex stat is required').not().isEmpty(),
     check('tech', 'Tech stat is required').not().isEmpty(),
     check('cool', 'Cool stat is required').not().isEmpty(),
     check('attr', 'Attr stat is required').not().isEmpty(),
     check('luck', 'Luck stat is required').not().isEmpty(),
     check('ma', 'Movement Allowence stat is required').not().isEmpty(),
     check('body', 'Body stat is reqruied').not().isEmpty(),
     check('emp', 'Empathy stat is reqruied').not().isEmpty(),
]],
    async (req, res) =>{
        const errors = validationResult(req);
        if(!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() })
        }

        const {name, int, ref, tech, cool, attr, luck, ma, body, emp, description, img, public,
        damage, ebs, clothes, cybernetics, skills, weapons, inventory, notes } = req.body;

        const sheetItems = {
            name,
            user: req.user.id,
            stats: {int, ref, tech, cool, attr, luck, ma, body, emp
            },
            current_stats: {int, ref, tech, cool, attr, luck, ma, body, emp
            }
        }

        if(img) sheetItems.img = img;
        if(public) sheetItems.public = public;
        if(description) sheetItems.description = description;
        if(ebs) sheetItems.ebs = eb;
        if(clothes) sheetItems.clothes = clothes;
        if(cybernetics) sheetItems.cybernetics = cybernetics;
        if(skills) sheetItems.skills = skills;
        if(weapons) sheetItems.weapons = weapons;
        if(inventory) sheetItems.inventory = inventory;
        if(notes) sheetItems.notes = notes;



        const sheet = new Sheet(sheetItems);

        try {

        await sheet.save();

        await res.status(200).json(sheet.populate('user','username'));

        } catch (err) {
            console.error(err.message);
            res.status(500).send('Server Error');
        }
    });


// @route   Put api/sheet/:id
// @desc    add a character Sheet
// @access  Private
router.put('/:id', auth,
   async (req, res) =>{
       const errors = validationResult(req);
       if(!errors.isEmpty()) {
           return res.status(400).json({ errors: errors.array() })
       }

       const sheet = await Sheet.findOne({_id: req.params.id});

       if(!sheet) {
           return res.status(404).json({msg: "Sheet not found"});
       }
       if (sheet.user.toString() !== req.user.id) {
           console.log(sheet.user);
           console.log(req.user.id);
            return res.status(401).json({msg: "Sheet not authorized found"});
       }

       const {name, int, ref, tech, cool, attr, luck, ma, body, emp, img,
        cur_int, cur_ref, cur_tech, cur_cool, cur_attr, cur_luck, cur_ma, cur_body, cur_emp,
        description, damage, ebs, clothes, cybernetics, skills, weapons, inventory, notes, public } = req.body;

       if(name) sheet.name = name;
       if(img) sheet.img = img;
       if(public) sheet.public = public;
       if( cur_int) sheet.current_stats.int =  cur_int;
       if( cur_ref) sheet.current_stats.ref =  cur_ref;
       if( cur_tech) sheet.current_stats.tech =  cur_tech;
       if( cur_cool) sheet.current_stats.cool =  cur_cool;
       if( cur_attr) sheet.current_stats.attr =  cur_attr;
       if( cur_luck) sheet.current_stats.luck =  cur_luck;
       if( cur_ma) sheet.current_stats.ma =  cur_ma;
       if( cur_body) sheet.current_stats.body =  cur_body;
       if( cur_emp) sheet.current_stats.emp =  cur_emp;
       if(int) sheet.stats.int = int;
       if(ref) sheet.stats.ref = ref;
       if(tech) sheet.stats.tech = tech;
       if(cool) sheet.stats.cool = cool;
       if(attr) sheet.stats.attr = attr;
       if(luck) sheet.stats.luck = luck;
       if(ma) sheet.stats.ma = ma;
       if(body) sheet.stats.body = body;
       if(emp) sheet.stats.emp = emp;
       if(description) sheet.description = description;
       if(ebs) sheet.ebs = eb;
       if(clothes) sheet.clothes = clothes;
       if(cybernetics) sheet.cybernetics = cybernetics;
       if(skills) sheet.skills = skills;
       if(weapons) sheet.weapons = weapons;
       if(inventory) sheet.inventory = inventory;
       if(notes) sheet.notes = notes;


       try {

       await sheet.save();

       await res.status(200).json(sheet.populate('user','username'));

       } catch (err) {
           console.error(err.message);
           res.status(500).send('Server Error');
       }
   });


// @route   POST api/sheet/:id
// @desc    get a character Sheet and check for user if not public
// @access  Private
router.get('/:id', auth, async (req, res) => {
    try {
        const sheet = await Sheet.findOne({_id: req.params.id});

        if(!sheet) {
            return res.status(404).json({msg: "Sheet not found"});
        }
        //check for authorized user if not public
        if(!sheet.public && sheet.user != req.user.id) {
            console.log(sheet.user);
            console.log(req.user.id);
            return res.status(401).json({msg: "Sheet not authorized"});
        }

        return res.status(200).json(sheet)
    } catch (err) {
        console.error(err.message);
            res.status(500).send('Server Error');
    }
});


// @route   POST api/sheet
// @desc    get all character Sheets for a user
// @access  Private
router.get('/', auth, async (req, res) => {
    try {
        const sheets = await Sheet.find({user: req.user.id});
        if(!sheets) {
            return res.status(404).json({msg: "No Sheets found"});
        }

        return res.status(200).json(sheets)
    } catch (err) {
        console.error(err.message);
            res.status(500).send('Server Error');
    }
});


// @route   DELETE api/sheet/:id
// @desc    remove a character Sheet from the database
// @access  Private
router.delete('/:id', auth, async (req, res) => {
    console.log("starting to delete");
    try {
        const sheet = await Sheet.findOne({_id: req.params.id});
        console.log("starting to delete 2");
        if(!sheet) {
            return res.status(404).json({msg: "Sheet not found"});
        }
        //check for authorized user if not public
        if(sheet.user != req.user.id) {
            console.log(sheet.user);
            console.log(req.user.id);
            return res.status(401).json({msg: "Sheet not authorized"});
        }

        console.log("starting to delete 3");
        await Sheet.findOneAndRemove({_id:req.params.id})

        return res.status(200).json({msg: "Character Sheet removed successfully"});
    } catch (err) {
        console.error(err.message);
            res.status(500).send('Server Error');
    }
});


// @route   DELETE api/sheet
// @desc    remove user and sheets from database
// @access  Private
router.delete('/', auth, async (req, res) => {
    try {
        await Sheet.deleteMany({user: req.user.id});

        return res.status(200).json({msg: "All Sheets owned by user removed"});
    } catch (err) {
        console.error(err.message);
            res.status(500).send('Server Error');
    }
});

module.exports = router
