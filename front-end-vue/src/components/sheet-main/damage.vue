<template>
<div id="damage-container">
  <div id="damage-no-hover">
    <h2>Health</h2>
  </div>
  <div id="damage-hover">
  <VueSlickCarousel v-bind="settings" @beforeChange="clearRoll">
  <div>
    <h4 id="health-title">Health</h4>
    <div>
      <p>Condition: <span class="tool-tip">{{condition}}<span class="tool-tip-text">{{toolTip}}</span></span></p>
      <button class="button-hover" v-if="mortal != null" v-on:click="deathSave">Death Roll</button>
    </div>
    <div>
      <p>Status: {{status}}</p>
      <button class="button-hover" v-if="stunned" v-on:click="stunSave">Get up?</button>
      <div class="spacer"></div>
    </div>
    <div>
      <div class="spacer"></div>
      <p class="box">
        Save: {{this.$root.$data.sheet.current_stats.body + stun}}
      </p>
      <p class="box tool-tip">
        BTM: {{this.$root.$data.sheet.btm}}<span class="tool-tip-text">Subtract this from damage</span>
      </p>
      <div class="spacer"></div>
    </div>
    <div v-if="rollMessage">
      <div class="spacer-big"></div>
      <p>{{rollMessage}}</p>
    </div>
  </div>
  <div id="button-box">
    <h4 id="damage-title">Damage Calculator</h4>
    <div>
      <p>Damage Total: {{this.$root.$data.sheet.damage}}</p>
    </div>
    <div>
        <div>
          <input type="number" v-model="num" min="1" max="40" class="margin-right-small">
          <select v-model="location" placeholder="location">
            <option value=null disabled selected>Area</option>
            <option value="head">Head</option>
            <option value="torso">Torso</option>
            <option value="rarm">R. Arm</option>
            <option value="larm">L. Arm</option>
            <option value="rleg">R. Leg</option>
            <option value="lleg">L. Leg</option>
          </select>
          <select v-model="armorPierce" placeholder="location">
            <option value=null disabled selected>Armor Piercing</option>
            <option value="none">none</option>
            <option value="pierce">Piercing</option>
            <option value="soft">Edge on Soft</option>
            <option value="hard">Edge on Hard</option>
          </select>
        </div>
        <div>
          <button v-on:click="addDamage" class="margin-right-small button-hover">take</button>
          <button v-on:click="removeDamage" class="margin-right-small button-hover">heal</button>
        </div>
    </div>
    <div v-if="stunMessage">
      <p id="rollMessage" class="tool-tip">{{stunMessage}}</p>
    </div>
  </div>
  <div>
    <h4 id="damage-setting-title">Damage calculation settings</h4>
    <input type="checkbox" v-model="doStunSaves"/><p>Stun Saves</p>
    <input type="checkbox" v-model="doDeathSaves"/><p>Death Saves</p>
    <input type="checkbox" v-model="doArmor"/><p>Armor</p>
    <input type="checkbox" v-model="doBtm"/><p>BTM</p>
    <div>
      <input type="checkbox" v-model="upDateSave"><p>Update Save Value</p>
    </div>
    <div>
      <input type="checkbox" v-model="armorPierce"><p>Armor Piercing</p>
    </div>
  </div>
  </VueSlickCarousel>
  </div>
</div>
</template>


<script>
//import carousel
import VueSlickCarousel from 'vue-slick-carousel'
import 'vue-slick-carousel/dist/vue-slick-carousel.css'
import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'

export default {
name: "damage",
data() {
  return {
    condition: "",
    stunned: false,
    stun: 0,
    mortal: null,
    num: 0,
    toolTip: "You are Healthy",
    rollMessage: null,
    stunMessage: null,
    location: null,
    armorPierce: null,
    doArmor: true,
    doBtm: true,
    doStunSaves: true,
    doDeathSaves: true,
    upDateSave: true,
    settings: {
      "dots": true,
      "arrows": false,
      "edgeFriction": 0.35,
      "infinite": false,
      "speed": 500,
      "slidesToShow": 1,
      "slidesToScroll": 1
    }
  }
},
created() {
  this.updateCondition();
},
computed: {
  status() {
    if(this.stunned)
      return "Unconscious";
    return "Awake"
  }
},
methods: {
  updateCondition() {
    let damage = this.$root.$data.sheet.damage;
    if (damage == null || damage <= 0) {
      this.$root.$data.sheet.damage = 0;
      this.condition = "Healthy";
      this.stun = 0;
      this.toolTip = "Full health";
      this.mortal = null;
    }
    else if (damage < 5) {
      this.condition = "Light";
      this.stun = 0;
      this.toolTip = "Small wounds, no effects";
      this.mortal = null;
    }
    else if (damage < 9) {
      this.condition = "Serious";
      this.stun = -1;
      this.toolTip = "- 2 REF stat"
      this.mortal = null;
    }
    else if (damage < 13) {
      this.condition = "Critical";
      this.stun = -2;
      this.toolTip = "- 4 REF stat";
      this.mortal = null;
    }
    else if (damage < 17) {
      this.condition = "Mortal 0";
      this.stun = -3;
      this.toolTip = "- 4 REF stat";
      this.mortal = 0;
    }
    else if (damage < 21) {
      this.condition = "Mortal 1";
      this.stun = -4;
      this.toolTip = "- 4 REF stat";
      this.mortal = 1;
    }
    else if (damage < 25) {
      this.condition = "Mortal 2";
      this.stun = -5;
      this.toolTip = "- 4 REF stat";
      this.mortal = 2;
    }
    else if (damage < 29) {
      this.condition = "Mortal 3";
      this.stun = -6;
      this.toolTip = "% 50 chance of coma, - 4 REF stat";
      this.mortal = 3
    }
    else if (damage < 33) {
      this.condition = "Mortal 4";
      this.stun = -7;
      this.toolTip = "% 50 chance of coma, - 4 REF stat";
      this.mortal = 4;
    }
    else if (damage < 37) {
      this.condition = "Mortal 5";
      this.stun = -8;
      this.toolTip = "% 50 chance of coma, - 4 REF stat";
      this.mortal = 5;
    }
    else if (damage < 41) {
      this.condition = "Mortal 6";
      this.stun = -9;
      this.toolTip = "% 50 chance of coma, - 4 REF stat";

      this.mortal = 6;
    }
    else {
      this.condition = "How are you still alive?";
      this.stun = -10;
      this.toolTip = "% 50 chance of coma, - 4 REF stat";
      this.mortal = 7;
    }
  },
  addDamage(){
    this.$root.$data.sheet.damage += parseInt(this.num);
    this.updateCondition();
    this.num = 0;
    this.stunSave();
  },
  removeDamage() {
    this.$root.$data.sheet.damage -= this.num;
    this.updateCondition();
    this.num = 0;
  },
  stunSave() {
    this.rollMessage = "";
    //stun save
    let temp = Math.trunc(Math.random() * 10 + 1) - this.stun;

    if (temp > this.$root.$data.sheet.current_stats.body) {
      //failed Save
      this.rollMessage = "You are now Unconscious";
      if (this.stunned) {
        //already stunned
        this.rollMessage = "You remain Unconscious";
        this.stunMessage = "You remain Unconscious";
        return;
      }
      this.failRoll();


      if (this.mortal) {
        this.stunMessage += " (Make Death Save)";
      }
      this.stunned = true;
      return;
    }
    if (this.stunned) {
      this.rollMessage = "You wake up";
      this.stunned = false;
      this.stunMessage = null;
      return;
    }
    if (this.mortal) {
      this.stunMessage = "Make a death save";
    }
  },
  deathSave() {
    let temp = Math.trunc(Math.random() * 10 + 1) + this.mortal;
    console.log(temp);
    if (temp > this.$root.$data.sheet.current_stats.body) {
      this.rollMessage="You will die after this turn";
      return;
    }
    this.rollMessage="You survive the turn";
  },
  clearRoll() {
    this.rollMessage = null;
    this.stunMessage = null;
  },
  failRoll() {
      let temp = Math.trunc(Math.random() * 6 + 1);
      if (temp == 1) {
        this.stunMessage = "You scream, fall over, and pass out"
      }
      else if (temp == 2) {
        this.stunMessage = "You crumple like a rag doll"
      }
      else if (temp == 3) {
        this.stunMessage = "You spin in place,  and pass out"
      }
      else if (temp == 4) {
        this.stunMessage = "You grab the wound and pass out slowly"
      }
      else if (temp == 5) {
        this.stunMessage = "Down stare at your wound and pass out"
      }
      else {
        this.stunMessage = "You slump down, moaning"
      }
  },
},
components: {
  VueSlickCarousel
}
}

</script>


<style>


.spacer-big {
  padding-top: .5em;
}


.box {
  border-style: double;
  border-width: 2px;
  padding: 0px 5px;
}


.tool-tip {
  position: relative;
}

.tool-tip .tool-tip-text{
font-size: .4em;
visibility: hidden;
width: auto;
min-width: 90px;
background-color: black;
color: #fff;
text-align: center;
border-radius: 6px;
padding: 5px 3px;

/* Position the tooltip */
position: absolute;
z-index: 10;
}

.tool-tip:hover .tool-tip-text {
  visibility: visible;
}

/* changes the arrow color */
button.slick-prev:before, button.slick-next:before {
      color: black !important;
      font-size: 25px;
}

#button-box {
  margin-bottom: 4px;
}

#health-title {
 margin: 0;
}

#damage-title {
  margin: 0;
  margin-bottom: 3px;
}

#damage-setting-title {
  margin: 0;
}

#damage-container {
  width: 250px;
  padding-bottom: 20px;
}

/* transition ids */
#damage-hover {
  transition: opacity .5s, pointer-events .7s;
}

#damage-no-hover {
  transition: opacity .25s;
}

#damage-container #damage-hover {
  opacity: 0;
  z-index: -1;
  pointer-events: none;
}


#damage-container:hover #damage-hover{
  opacity: 1;
  z-index: 1;
  pointer-events: auto;
}

#damage-container #damage-no-hover{
  position: relative;
  display: -webkit-box;
  left: 80%;
  transform: translateX(-50%);
  height: 0;
  top: 15px;
  opacity: 1;

  z-index: 1;
}

#damage-container:hover #damage-no-hover{
  opacity: 0;

  z-index: -1;
}

</style>
