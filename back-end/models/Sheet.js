const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const SheetSchema = new Schema({
    user: {
        type: Schema.Types.ObjectId,
        ref: 'user',
        index: true,
        required: true
    },
    name: {
        type: String,
        required: true
    },
    public: {
        type: Boolean,
        default: false
    },
    img: {
        type: String
    },
    descirption: {
        type: String,
        required: false
    },
    damage: {
        type: Number,
        required: true,
        default: 0
    },
    ebs: {
        type: Number,
        default: 0,
        required: true
    },
    stats: {
        int: {
            type: Number,
            required: true
        },
        ref: {
            type: Number,
            required: true
        },
        tech: {
            type: Number,
            required: true
        },
        cool: {
            type: Number,
            required: true
        },
        attr: {
            type: Number,
            required: true
        },
        luck: {
            type: Number,
            required: true
        },
        ma: {
            type: Number,
            required: true
        },
        body: {
            type: Number,
            required: true
        },
        emp: {
            type: Number,
            required: true
        }
    },
    current_stats: {
        int: {
            type: Number,
            required: true
        },
        ref: {
            type: Number,
            required: true
        },
        tech: {
            type: Number,
            required: true
        },
        cool: {
            type: Number,
            required: true
        },
        attr: {
            type: Number,
            required: true
        },
        luck: {
            type: Number,
            required: true
        },
        ma: {
            type: Number,
            required: true
        },
        body: {
            type: Number,
            required: true
        },
        emp: {
            type: Number,
            required: true
        }
    },
    clothes: [{
        name: {
            type: String,
            required: true
        },
        armor: {
            type: Number,
            required: true,
            default: 0
        },
        location: {
            type: String,
        }
    }],
    cybernetics: [{
        name: {
            type: String,
            required: true
        },
        description: {
            type: String,
            required: true
        },
        cost: {
            type: Number,
            required: true,
            default: 0
        },
        armorBonus: {
            armor: {
                type: Number
            },
            location: {
                type: String
            }
        }
    }],
    skills: [{
        name: {
            type: String,
            required: true
        },
        bonus: {
            type: Number,
            required: true,
            default: 0
        },
        experience: {
            type:Number,
            required: true,
            default: 0
        },
        stat: {
            type: String,
        }
    }],
    weapons: [{
        name: {
            type: String,
            required: true
        },
        type: {
            type: String,
        },
        accuracyBonus: {
            type: Number
        },
        concealability: {
            type: String
        },
        range: {
            type: Number
        },
        ammunition: {
            type: String
        },
        numRounds: {
            type: Number
        },
        rateOfFire: {
            type: Number
        },
        dice: {
            type: String,
            required: true
        },
        numDice: {
            type: Number
        },
        bonusDamage: {
            type: Number
        },
        reliablility: {
            type: String
        }
    }],
    inventory: [{
        name: {
            type: String,
            required: true
        },
        description: {
            type: String,
        },
        cost: {
            type: Number,
            Default: 0
        }
    }],
    notes: [{
        name: {
            type: String,
            required: true
        },
        description: {
            type: String
        }
    }],
    date: {
        type: Date,
        default: Date.now
    }


    
})


module.exports = Sheet = mongoose.model('sheet', SheetSchema);