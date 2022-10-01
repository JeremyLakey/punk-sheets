<template>
  <div>
    <div v-if="this.$root.$data.user !== null">
      <h1 class="yellow">Character sheet</h1>
      <div id="sheet_container">
        <div class="sheet-col">
          <div class="sheet_item">
            <div id="name">
              <p class="margin-right-small">Name:</p>
              <input type="text" v-model="name" class="margin-right-small" />
              <button class="button-hover" v-on:click="updateName">save</button>
            </div>
            <div id="description">
              <p class="margin-right-small">Description:</p>
              <input
                type="text"
                v-model="description"
                class="margin-right-small"
              />
              <button class="button-hover" v-on:click="updateDescritpion">
                save
              </button>
            </div>
          </div>

          <div id="char_image" v-if="this.$root.$data.sheet.image != null">
            <img src="this.$root.$data.sheet.image" />
          </div>
          <div id="stats" class="sheet_item">
            <stats />
          </div>
          <div id="cybernetics" class="sheet_item">
            <cybernetics />
          </div>
        </div>
        <div class="sheet-col">
          <div id="armor" class="sheet_item">
            <armor />
          </div>
          <div id="damage" class="sheet_item">
            <damage />
          </div>
          <div id="clothes" class="sheet_item">
            <clothes />
          </div>
        </div>
        <div class="sheet-col">
          <div id="weapons" class="sheet_item">
            <weapons />
          </div>
          <div id="skills" class="sheet_item">
            <skills />
          </div>
        </div>

        <div class="sheet-col">
          <div id="gear" class="sheet_item">
            <gear />
          </div>
          <div id="events" class="sheet_item">
            <events />
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <h1>Please log in first</h1>
    </div>
  </div>
</template>

<script>
import stats from '../components/sheet-main/stats.vue'
import armor from '../components/sheet-main/armor.vue'
import events from '../components/sheet-main/events.vue'
import gear from '../components/sheet-main/gear.vue'
import skills from '../components/sheet-main/skills.vue'
import clothes from '../components/sheet-main/clothes.vue'
import weapons from '../components/sheet-main/weapons.vue'
import cybernetics from '../components/sheet-main/cybernetics.vue'
import damage from '../components/sheet-main/damage.vue'

export default {
  name: 'Sheet',
  created() {
    if (this.$root.$data.sheet == null) {
      this.$router.push({ name: 'Profile' })
      window.alert('Select a character sheet first')
    }
    this.name = this.$root.$data.sheet.name
    this.description = this.$root.$data.sheet.description
  },
  components: {
    stats,
    armor,
    events,
    gear,
    skills,
    clothes,
    weapons,
    cybernetics,
    damage,
  },
  data() {
    return {
      name: '',
      description: '',
    }
  },
  methods: {
    updateName() {
      this.$root.$data.sheet.name = this.name
    },
    updateDescritpion() {
      this.$root.$data.sheet.description = this.description
    },
  },
}
</script>

<style>
p {
  display: inline;
  margin-right: 1em;
}

.margin-right-small {
  margin-right: 0.2em;
}

.sheet-col {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  gap: 0.7rem;
}

.sheet_item {
  padding: 0.25em;

  background: #2b2b2b;

  border-style: groove;
  border-color: #33fff6; /* red #db3000 */
  border-radius: 10px 30px 10px 0px;
  border-width: 4px;

  box-shadow: 3px 5px #444;

  color: #33fff6; /* text color */

  text-align: left;
}

.sheet_item {
  transition: border-color 0.25s, background 0.25s, color 0.3s;
}

.sheet_item:hover {
  border-color: #cccc44;
  background: #2f2f2f;
  color: #cccc44;
}

/* class over matching button transition with sheet_item */
.button-hover {
  transition: 0.25s;
}

/* Gradient Buttons and transition */
.sheet_item .button-hover {
  position: relative;
  z-index: 1; /* matters! */
  background: #1ad4cc;
  color: #333;
  text-shadow: none;
  transition: background 0.4s, color 0.4s;
}
.sheet_item::before .button-hover {
  /* Useless unless you move the ::before from the .sheet_item to .button-hover,
   but it doesn't look good */
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  background: linear-gradient(to right, #1ad4cc, transparent, #2aeeff);
  z-index: -1;
}
.sheet_item:hover .button-hover {
  background: #888844;
  color: #444;
}

.button-hover:active {
  background: #4ae4ff;
}

.sheet_item .fade-in-hover {
  transition: opacity 0.25s;
}

.sheet_item .fade-in-hover {
  opacity: 0;
}

.sheet_item:hover .fade-in-hover {
  opacity: 1;
}

#sheet_container {
  margin: 2em;
  display: flex;
  flex-wrap: wrap;

  justify-content: space-evenly;
  align-items: strech; /*strech*/
  align-content: center;
  gap: 0.5rem;
}

#description {
  margin-top: 10px;
}
</style>
