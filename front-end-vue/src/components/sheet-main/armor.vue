<!-- component displays the armor values of the current character sheet -->

<template>
<div id="armor-section">
<span id="armor-no-hover">
<h2>Armor</h2>
</span>
<div id="armor-hover">
<div id="armor-table">
  <div class="armor-row">
    <div><p>Location</p></div>
    <div class="spacer-big"></div>
    <div><p>Armor SP</p></div>
  </div>
  <div class="armor-row">
    <div><p>Head</p></div>
    <div class="spacer-big"></div>
    <div><input class="smallInput" type="number" v-model="head"/></div>
    <button class="button-hover" v-if="updateHead" v-on:click="saveHead">save</button>
  </div>
  <div class="armor-row">
    <p>Torso</p>
    <div class="spacer-big"></div>
    <div><input class="smallInput" type="number" v-model="torso"/></div>
    <button class="button-hover" v-if="updateTorso" v-on:click="saveTorso">save</button>
  </div>
  <div class="armor-row">
    <p>R. Arm</p>
    <div class="spacer-big"></div>
    <div><input class="smallInput" type="number" v-model="rarm" min="0" max="99"/></div>
    <button class="button-hover" v-if="updateRArm" v-on:click="saveRArm">save</button>
  </div>
  <div class="armor-row">
    <div><p>L. Arm</p></div>
    <div class="spacer-big"></div>
    <div><input class="smallInput" type="number" v-model="larm"/></div>
    <button class="button-hover" v-if="updateLArm" v-on:click="saveLArm">save</button>
  </div>
  <div class="armor-row">
    <div><p>R. Leg</p></div>
    <div class="spacer-big"></div>
    <div><input class="smallInput" type="number" v-model="rleg"/></div>
    <button class="button-hover" v-if="updateRLeg" v-on:click="saveRLeg">save</button>
  </div>
  <div class="armor-row">
    <div><p>L. Leg</p></div>
    <div class="spacer-big"></div>
    <div><input class="smallInput" type="number" v-model="lleg"/></div>
    <button class="button-hover" v-if="updateLLeg" v-on:click="saveLLeg">save</button>
  </div>
</div>
<div class="center-childern" id="armor-bottom">
  <button class="button-hover" v-if="hitLocation == null" v-on:click="roll">Hit Location</button>
  <span v-else><button class="button-hover" v-on:click="clear">X</button>{{this.hitLocation}}</span>
</div>
</div>
</div>
</template>

<script>

export default {
name: "armor",
components: {
},
created() {
  this.head = this.$root.$data.sheet.armor.head;
  this.torso = this.$root.$data.sheet.armor.torso;
  this.rarm = this.$root.$data.sheet.armor.r_arm;
  this.larm = this.$root.$data.sheet.armor.l_arm;
  this.rleg = this.$root.$data.sheet.armor.r_leg;
  this.lleg = this.$root.$data.sheet.armor.l_leg;
},
data() {
  return {
    hitLocation: null,
    interval: false,
    head: 0,
    torso: 0,
    rarm: 0,
    larm: 0,
    rleg: 0,
    lleg: 0,
  }
},
methods: {
  roll() {
    let temp = Math.trunc(Math.random() * 10 + 1);
    if (temp == 1) {
      this.hitLocation = "head";
    }
    else if (temp == 2 || temp == 3 || temp == 4) {
      this.hitLocation = "torso";
    }
    else if (temp == 5) {
      this.hitLocation = "R. Arm";
    }
    else if (temp == 6) {
      this.hitLocation = "L. Arm";
    }
    else if (temp == 7 || temp == 8) {
      this.hitLocation = "R. Leg";
    }
    else {
      this.hitLocation = "L. Leg";
    }
  },
  clear() {
    this.hitLocation = null;
  },
  saveHead() {
    this.$root.$data.sheet.armor.head = this.head;
  },
  saveTorso() {
    this.$root.$data.sheet.armor.torso = this.torso;
  },
  saveRArm() {
    this.$root.$data.sheet.armor.r_arm = this.rarm;
  },
  saveLArm() {
    this.$root.$data.sheet.armor.l_arm = this.larm;
  },
  saveRLeg() {
    this.$root.$data.sheet.armor.r_leg = this.rleg;
  },
  saveLLeg() {
    this.$root.$data.sheet.armor.l_leg = this.lleg;
  },
},
computed: {
  updateHead() {
    if (this.$root.$data.sheet.armor.head != this.head)
      return true;
    return false;
  },
  updateTorso() {
    if (this.$root.$data.sheet.armor.torso != this.torso)
      return true;
    return false;
  },
  updateRArm() {
    if (this.$root.$data.sheet.armor.r_arm != this.rarm)
      return true;
    return false;
  },
  updateLArm() {
    if (this.$root.$data.sheet.armor.l_arm != this.larm)
      return true;
    return false;
  },
  updateRLeg() {
    if (this.$root.$data.sheet.armor.r_leg != this.rleg)
      return true;
    return false;
  },
  updateLLeg() {
    if (this.$root.$data.sheet.armor.l_leg != this.lleg)
      return true;
    return false;
  },
}
}
</script>

<style>

#armor-hover {
  transition: opacity .5s;
}

#armor-no-hover {
  transition: opacity .25s;
}

#armor-section #armor-hover {
  opacity: 0;
  z-index: -1;
}


#armor-section:hover #armor-hover{
  opacity: 1;
  z-index: 1;
}

#armor-section #armor-no-hover{
  position: relative;
  display: -webkit-box;
  left: 130px;
  height: 0;
  top: -3px;
  opacity: 1;

  z-index: 1;
}

#armor-section:hover #armor-no-hover{
  opacity: 0;

  z-index: -1;
}

#armor-table{
 display: table;
}


.armor-row {
  display: table-cell;
}


#armor-bottom {
  margin-top:.5em;
}


</style>
