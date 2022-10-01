<!-- component displays weapons of character -->

<template>
  <div id="weapon-container">
    <div id="weapon-no-hover">
      <h1>Weapons</h1>
    </div>
    <div id="weapon-hover">
      <VueSlickCarousel v-bind="settings" ref="carouselWeapon">
        <div>
          <div>
            <h4>Weapons</h4>
            <hr />
            <div
              v-for="weapon in this.$root.$data.sheet.weapons"
              :key="weapon.name"
            >
              <p>{{ weapon.name }}</p>
              <div class="floater">
                <p class="smallText">Range: {{ weapon.range }}m</p>
                <p class="smallText">
                  Damage: {{ weapon.numDice }}{{ weapon.dice }}+{{
                    weapon.bonusDamage
                  }}
                </p>
                <button class="button-hover" v-on:click="selectWeapon(weapon)">
                  Select
                </button>
              </div>
              <hr />
            </div>
            <button class="button-hover" v-on:click="goToAdd">
              Add Weapon
            </button>
          </div>
        </div>
        <div>
          <h4 v-if="this.selected == null">Select a weapon</h4>
          <div v-else>
            <h4>Weapon Options</h4>
            <div>
              <p>{{ selected.name }}</p>
              <div class="floater">
                Rounds left: {{ selected.roundsLeft }}
                <button class="button-hover" v-on:click="reload">reload</button>
              </div>
              <hr />
            </div>
            <div>
              <p>Distance:</p>
              <input
                class="smallInput"
                v-model="distance"
                type="number"
                min="1"
                max="5000"
              />
              meters
              <div class="spacer"></div>
              <p>Rounds Fired:</p>
              <input
                class="smallInput"
                v-model="roundsToFire"
                type="number"
                min="1"
                v-bind:max="rofText"
              />
              <div class="spacer"></div>
              <p>Modifiers:</p>
              <input
                class="smallInput"
                v-model="modifers"
                type="number"
                min="-50"
                max="50"
              />
              <div class="spacer"></div>
              <button class="button-hover" v-on:click="fire">Fire</button>
              <p v-if="fireMessage">{{ fireMessage }}</p>
              <hr />
            </div>
            <div>
              <p>Type: {{ typeText }}</p>
              <p>Range: {{ selected.range }}m</p>
              <div class="spacer"></div>
            </div>
            <div>
              <p>
                Damage: {{ this.selected.numDice }}{{ this.selected.dice }} +
                {{ this.selected.bonusDamage }}
              </p>
              <button class="button-hover" v-on:click="calcDamage">Roll</button>
              <p v-if="damageTotal">{{ damageTotal }}</p>
              <p>
                <button
                  class="button-hover"
                  v-if="damageTotal"
                  v-on:click="clearDamage"
                >
                  X
                </button>
              </p>

              <div class="spacer"></div>
              <p>Accuracy: {{ accuracyText }}</p>
              <p>ROF: {{ selected.rateOfFire }} rounds</p>
              <div class="spacer"></div>
            </div>
            <div>
              <p>Concealability: {{ concealText }}</p>
              <p>Reliability: {{ this.selected.reliability }}</p>
              <div class="spacer"></div>
            </div>
            <button class="button-hover" v-on:click="unequip">Unselect</button>
          </div>
        </div>

        <div>
          <h4>Weapon Settings</h4>
          <div>
            <input type="checkbox" />
            <p>Calc 3 round burst</p>
            <input type="checkbox" />
            <p>Calc auto bonuses</p>
          </div>
          <div>
            <input type="checkbox" />
            <p>Add Accuracy</p>
            <input type="checkbox" />
            <p>Show Roll</p>
          </div>
          <div>
            <input type="checkbox" />
            <p>Roll Jams</p>
            <input type="checkbox" />
            <p>Show Roll</p>
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
  name: 'weapons',
  data() {
    return {
      selected: null,
      damageTotal: null,
      distance: 1,
      roundsToFire: 1,
      modifers: 0,
      fireMessage: '',
      settings: {
        edgeFriction: 0.35,
        infinite: false,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
      },
    }
  },
  components: {
    VueSlickCarousel,
  },
  methods: {
    addWeapon() {
      if (
        this.name == '' ||
        this.type == null ||
        this.accuracy == null ||
        this.concealability == '' ||
        this.dice == '' ||
        this.numDice == 0 ||
        this.bonusDamage == null ||
        this.ammunition == null ||
        this.numRounds == null ||
        this.rateOfFire == null ||
        this.range == null ||
        this.reliability == ''
      ) {
        return
      }
      this.$root.$data.sheet.weapons.push({
        name: this.name,
        type: this.type,
        accuracy: this.accuracy,
        concealability: this.concealability,
        dice: this.dice,
        numDice: this.numDice,
        bonusDamage: this.bonusDamage,
        ammunition: this.ammunition,
        numRounds: this.numRounds,
        roundsLeft: this.numRounds,
        rateOfFire: this.rateOfFire,
        range: this.range,
        reliability: this.reliability,
      })
      //reset form
      this.name = ''
      this.type = null
      this.accuracy = null
      this.concealability = null
      this.dice = null
      this.numDice = null
      this.bonusDamage = null
      this.ammunition = null
      this.numRounds = null
      this.rateOfFire = null
      this.range = null
      this.reliability = null

      //go to the weapon page
      this.goToWeapon()
    },
    selectWeapon(weapon) {
      this.selected = weapon
      this.goToSelect()
    },
    fire() {
      //prevent using too many on bullets
      if (this.selected.rateOfFire < this.roundsToFire) {
        this.roundsToFire = this.selected.rateOfFire
      }
      if (this.selected.roundsLeft - this.roundsToFire < 0) {
        this.fireMessage = 'Not enough rounds'
        return
      }
      let totalBonuses = this.calcBonus()
      let range = this.calcRange()
      if (
        this.selected.type == 'rifle' &&
        this.roundsToFire == 3 &&
        (range == 'close' || range == 'medium')
      ) {
        //3 round burst rule
        totalBonuses += 3
      }
      if (this.roundsToFire >= 10) {
        if (range == 'close' || range == 'point') {
          totalBonuses += this.roundsToFire / 10
        } else {
          totalBonuses += this.roundsToFire / 10
        }
      }

      this.selected.roundsLeft -= this.roundsToFire

      console.log(totalBonuses)
    },
    calcBonus() {
      if (this.selected.type == 'p') {
        return (
          this.$root.$data.sheet.handGunBonus +
          this.selected.accuracy +
          this.modifers
        )
      } else if (this.selected.type == 'smg') {
        return (
          this.$root.$data.sheet.subMachineGunBonus +
          this.selected.accuracy +
          this.modifers
        )
      } else if (this.selected.type == 'sht') {
        return (
          this.$root.$data.sheet.shotGunBonus +
          this.selected.accuracy +
          this.modifers
        )
      } else if (this.selected.type == 'hvy') {
        return (
          this.$root.$data.sheet.heaveyGunBonus +
          this.selected.accuracy +
          this.modifers
        )
      } else if (this.selected.type == 'ex') {
        return (
          this.$root.$data.sheet.handGunBonus +
          this.selected.accuracy +
          this.modifers
        )
      } else {
        return 0
      }
    },
    calcRange() {
      if (this.distance <= 1) {
        return 'point'
      } else if (this.distance <= this.selected.range * 0.25) {
        return 'close'
      } else if (this.distance <= this.selected.range * 0.5) {
        return 'medium'
      } else if (this.distance <= this.selected.range * 1) {
        return 'long'
      } else if (this.distance <= this.selected.range * 2) {
        return 'extreme'
      } else {
        return 'out of range'
      }
    },
    reload() {
      this.selected.roundsLeft = this.selected.numRounds
    },
    calcDamage() {
      this.damageTotal = parseInt(this.selected.bonusDamage)

      if (this.selected.dice == 'd6') {
        for (let i = 0; i < this.selected.numDice; i++) {
          this.damageTotal += this.rollDice(6)
        }
      } else if (this.selected.dice == 'd10') {
        for (let i = 0; i < this.selected.numDice; i++) {
          this.damageTotal += this.rollDice(10)
        }
      } else if (this.selected.dice == 'd6/2') {
        for (let i = 0; i < this.selected.numDice; i++) {
          this.damageTotal += this.rollDice(3)
        }
      } else {
        for (let i = 0; i < this.selected.numDice; i++) {
          this.damageTotal += this.rollDice(2)
        }
      }
    },
    clearDamage() {
      this.damageTotal = null
    },
    rollDice(num) {
      return Math.trunc(Math.random() * num + 1)
    },
    unequip() {
      this.selected = null
      this.goToWeapon()
    },
    goToAdd() {
      //this.$refs.carouselWeapon.goTo(2)
      this.$router.push({ name: 'Weapons' })
    },
    goToSelect() {
      this.$refs.carouselWeapon.goTo(1)
    },
    goToWeapon() {
      this.$refs.carouselWeapon.goTo(0)
    },
  },
  computed: {
    concealText() {
      if (this.selected.concealability == 'j') {
        return 'Jacket'
      } else if (this.selected.concealability == 'p') {
        return 'Pocket'
      } else if (this.selected.concealability == 'l') {
        return 'Long Coat'
      } else {
        return "Can't be Hidden"
      }
    },
    typeText() {
      if (this.selected.type == 'p') {
        return 'Pistol'
      } else if (this.selected.type == 'smg') {
        return 'Sub Machine Gun'
      } else if (this.selected.type == 'rif') {
        return 'Rifle'
      } else if (this.selected.type == 'hvy') {
        return 'Heavy Weapon'
      } else if (this.selected.type == 'melee') {
        return 'Melee Weapon'
      } else {
        return 'Exotic Weapon'
      }
    },
    accuracyText() {
      if (this.selected.accuracy > 0) {
        return '+' + this.selected.accuracy
      }
      return this.selected.accuracy
    },
    rofText() {
      return this.selected.rateOfFire.toString()
    },
  },
}
</script>

<style>
.mid-size-block {
  display: inline-block;
  margin: 0;
  margin-bottom: 5px;
  width: 150px;
}

.medium-input {
  width: 142px;
}

.smallText {
  font-size: 0.4em;
}

#add-weapon-title {
  margin-bottom: 3px;
}

#weapon-container {
  width: auto;
  max-width: 350px;
  height: auto;
  padding: 0 29px 0 25px;
}

#weapon-no-hover {
  transition: opacity 0.25s;
}

#weapon-container:hover #weapon-no-hover {
  opacity: 0;
}

#weapon-container #weapon-no-hover {
  opacity: 1;

  position: relative;
  display: -webkit-box;
  left: 100px;
  top: 100px;
  height: 0;
}

#weapon-hover {
  transition: opacity 0.25s;
}

#weapon-container #weapon-hover {
  opacity: 0;
}

#weapon-container:hover #weapon-hover {
  opacity: 1;
}
</style>
