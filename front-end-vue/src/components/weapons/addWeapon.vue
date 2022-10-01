<template>
  <div>
    <Back />
    <h4 id="add-weapon-title">Add a Weapon</h4>
    <hr />
    <div>
      <p class="mid-size-block">Name:</p>
      <input
        type="text"
        v-model="name"
        class="medium-input"
        placeholder="name"
      />
    </div>
    <div>
      <p class="mid-size-block">Type:</p>
      <select v-model="type">
        <option value="null" disabled selected>type</option>
        <option value="p">P</option>
        <option value="smg">SMG</option>
        <option value="rif">RIF</option>
        <option value="sht">SHT</option>
        <option value="hvy">HVY</option>
        <option value="melee">MELEE</option>
        <option value="ex">Ex</option>
      </select>
    </div>
    <div class="spacer"></div>
    <div>
      <p class="mid-size-block">Accuracy bonus:</p>
      <input
        type="number"
        class="smallInput"
        v-model="accuracyBonus"
        min="-10"
        max="10"
      />
      <div class="spacer"></div>
    </div>
    <div>
      <p class="mid-size-block">Concealability:</p>
      <select v-model="concealability">
        <option value="null" disabled selected>Con.</option>
        <option value="p">P</option>
        <option value="j">J</option>
        <option value="l">L</option>
        <option value="i">I</option>
      </select>
      <div class="spacer"></div>
    </div>
    <div>
      <p class="mid-size-block">Damage:</p>
      <input
        type="number"
        class="smallInput"
        v-model="numDice"
        min="1"
        max="10"
      />
      x
      <select v-model="dice">
        <option value="null" disabled selected>dice</option>
        <option value="d6/3">d6/3</option>
        <option value="d6/2">d6/2</option>
        <option value="d6">d6</option>
        <option value="d10">d10</option>
      </select>
      +
      <input
        type="number"
        class="smallInput"
        v-model="bonusDamage"
        min="-10"
        max="10"
      />
      <div class="spacer"></div>
      <div>
        <p class="mid-size-block">Ammo type:</p>
        <input type="text" class="smallInput" v-model="ammunition" />
        <div class="spacer"></div>
      </div>
      <div>
        <p class="mid-size-block">Clip Size:</p>
        <input
          type="number"
          class="smallInput"
          v-model="numRounds"
          min="1"
          max="100"
        />
        <div class="spacer"></div>
      </div>
      <div>
        <p class="mid-size-block">Rate of Fire:</p>
        <input
          type="number"
          class="smallInput"
          v-model="rateOfFire"
          min="1"
          max="100"
        />
        <div class="spacer"></div>
      </div>
      <div>
        <p class="mid-size-block">Range:</p>
        <input
          type="number"
          class="smallInput"
          v-model="range"
          min="1"
          max="5000"
        />
        <div class="spacer"></div>
      </div>
      <div>
        <p class="mid-size-block">Reliability:</p>
        <select style="margin-left: 100px" v-model="reliability">
          <option value="null" disabled selected>Rel.</option>
          <option value="vr">VR</option>
          <option value="st">ST</option>
          <option value="ur">UR</option>
        </select>
        <div class="spacer"></div>
      </div>
      <div class="center-childern">
        <button class="button-hover" v-on:click="addWeapon">add</button>
      </div>
    </div>
  </div>
</template>

<script>
import Back from '../general/Back.vue'

export default {
  name: 'addWeapon',
  data() {
    return {
      name: '',
      type: '',
      accuracyBonus: 0,
      concealability: '',
      range: 0,
      ammunition: '',
      numRounds: 0,
      rateOfFire: 0,
      dice: '',
      numDice: 0,
      bonusDamage: 0,
      reliability: '',
    }
  },
  components: {
    Back,
  },
  methods: {
    addWeapon() {
      const newWeapon = {
        name: this.name,
        type: this.type,
        accuracyBonus: this.accuracyBonus,
        concealability: this.concealability,
        range: this.range,
        ammunition: this.ammunition,
        numRounds: this.numRounds,
        rateOfFire: this.rateOfFire,
        dice: this.dice,
        numDice: this.numDice,
        bonusDamage: this.bonusDamage,
        reliability: this.reliability,
      }
      console.log(newWeapon)
    },
  },
}
</script>
