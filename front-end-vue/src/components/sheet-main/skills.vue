<!-- component displays skills of character -->

<template>
<div id="skill_container">
<div id="skills-no-hover">
  <h2>Skills</h2>
</div>
<div id="skills-hover">
<h4 id="skills_title" style="display: block">Skills</h4>
<div v-if="roll != null" class="center-childern small-roll" style="margin-bottom: .4em">
  <h4 id="skills_title">Roll: {{roll}}</h4>
  <button class="button-hover" v-on:click="clearRoll">clear</button>
</div>
<div class="spacer"></div>
  <div>
    <p>Name:</p>
    <input type="text" v-model="name" placeholder="skill name"/>
    <select v-model="stat" placeholder="Stat">
      <option value=null disabled selected>Stat</option>
      <option value="INT">INT</option>
      <option value="REF">REF</option>
      <option value="TECH">TECH</option>
      <option value="ATTR">ATTR</option>
      <option value="EMP">EMP</option>
      <option value="BODY">BODY</option>
      <option value="COOL">COOL</option>
      <option value="Class">Class</option>
    </select>
    <button class="button-hover" v-on:click="addSkill">add</button>
  </div>
  <div v-if="this.$root.$data.sheet.skills != null">
    <hr/>
    <div v-for="skill in this.$root.$data.sheet.skills" :key="skill.name">
      <p>{{skill.name}}</p>
      <div class="floater">
      <p>{{skill.stat}}</p>
      <p>+{{skill.level}}</p>
      <button class="button-hover" v-on:click="rollSkill(skill)">roll</button>
      <button class="button-hover" v-on:click="skillUp(skill)">+</button>
      <button class="button-hover" v-on:click="skillDown(skill)">-</button>
      </div>
      <hr/>
    </div>
    <div>
      <p>sort</p>

      <button class="button-hover" v-on:click="sortByUses">Most Used</button>
      <button class="button-hover" v-on:click="sortByAlpha">Alpha</button>
      <button class="button-hover" v-on:click="sortByLevel">Level</button>
      <button class="button-hover" v-on:click="sortByStat">Type</button>
      <button class="button-hover" v-on:click="sortByIndex">Reset</button>
    </div>
  </div>
  </div>
</div>
</template>

<script>

export default {
name: "skills",
data() {
  return {
    name: null,
    stat: null,
    roll: null,
    sort: null
  }
},
methods: {
  addSkill() {
    if (this.name == null || this.name == "" || this.stat == null || this.stat == "null") {
      return;
    }
    if (this.$root.$data.sheet.skills == null) {
      this.$root.$data.sheet.skills == []
    }
      this.$root.$data.sheet.skills.push({
        name: this.name,
        stat: this.stat,
        level: 0,
        exp: 0,
        uses: 0,
        index: this.$root.$data.sheet.skills.length,
      });
      this.name = null;
      this.stat = null;

      this.updateSort();
  },
  skillUp(skill) {
    skill.level++;

    this.updateSort();
  },
  skillDown(skill) {
    skill.level--;
    if (skill.level < 0) {
      skill.level = 0;
    }
    this.updateSort();
  },
  rollSkill(skill) {
    skill.uses++;
    this.updateSort();
    this.roll = null;
    let temp = this.getRoll();
    if (temp == 1) {
      this.roll = "Fumble";
      return;
    }
    this.roll = skill.level + this.getStat(skill) + temp;
    console.log("Total talley: " + this.roll);

  },
  getRoll() {
    let temp = Math.trunc(Math.random() * 10 + 1);
    if (temp == 10) {
      //crit add another roll
      console.log("10, rolling another dice");
      return 10 + this.getRoll();
    }
    console.log(temp);
    return temp;
  },
  getStat(skill) {
    if (skill.stat == "INT") {
      return this.$root.$data.sheet.current_stats.int;
    }
    else if (skill.stat == "REF") {
      return this.$root.$data.sheet.current_stats.ref
    }
    else if (skill.stat == "TECH") {
      return this.$root.$data.sheet.current_stats.tech
    }
    else if (skill.stat == "BODY") {
      return this.$root.$data.sheet.current_stats.body
    }
    else if (skill.stat == "COOL") {
      return this.$root.$data.sheet.current_stats.cool
    }
    else if (skill.stat == "ATTR") {
      return this.$root.$data.sheet.current_stats.attr
    }
    else if (skill.stat == "EMP") {
      return this.$root.$data.sheet.current_stats.emp
    }
    else {
      return 0;
    }
  },
  clearRoll() {
    this.roll = null;
  },
  sortByAlpha() {
    this.sort = "alpha"
    this.$root.$data.sheet.skills.sort((a, b) => {
      if (a.name.toLowerCase() > b.name.toLowerCase()) return 1;
      if (b.name.toLowerCase() > a.name.toLowerCase()) return -1;
      return 0;
    })
  },
  sortByLevel() {
    this.sort = "level";
    this.$root.$data.sheet.skills.sort((a, b) => {
      if (a.level < b.level) return 1;
      if (b.level < a.level) return -1;
      return 0;
    })
  },
  sortByStat() {
    this.sort = "stat";
    this.$root.$data.sheet.skills.sort((a, b) => {
      if (a.stat.toLowerCase() > b.stat.toLowerCase()) return 1;
      if (b.stat.toLowerCase() > a.stat.toLowerCase()) return -1;
      return 0;
    })
  },
  sortByIndex() {
    this.sort = "index";
    this.$root.$data.sheet.skills.sort((a, b) => {
      if (a.index > b.index) return 1;
      if (b.index > a.index) return -1;
      return 0;
    })
  },
  sortByUses() {
    this.sort = "uses";
    this.$root.$data.sheet.skills.sort((a, b) => {
      if (a.uses > b.uses) return -1;
      if (b.uses > a.uses) return 1;
      return 0;
    })
  },
  updateSort() {
    if (this.sort == null) {
      return;
    }
    else if (this.sort == "uses") {
      this.sortByUses();
    }
    else if (this.sort == "index") {
      this.sortByIndex();
    }
    else if (this.sort == "stat") {
      this.sortByStat();
    }
    else if (this.sort == "alpha") {
      this.sortByAlpha();
    }
    else if (this.sort == "level") {
      this.sortByLevel();
    }
  }

},
}
</script>

<style>

.small-roll {
  font-size: .7em;
}

.small-roll button {
  font-size: .7em;
}

.floater {
  float:right
}

#skills_title {
  display: inline;
  margin-top: 3px;
  margin-bottom: 0;
  margin-right: .2em;
  text-align:left;
}



/* Hover Transition */
#skills-hover {
  transition: opacity .5s;
}

#skills-no-hover {
  transition: opacity .25s;
}

#skill_container #skills-hover {
  opacity: 0;
  z-index: -1;
}


#skill_container:hover #skills-hover{
  opacity: 1;
  z-index: 1;
}

#skill_container #skills-no-hover{
  position: relative;
  display: -webkit-box;
  left: 130px;
  height: 0;
  top: -3px;
  opacity: 1;

  z-index: 1;
}

#skill_container:hover #skills-no-hover{
  opacity: 0;

  z-index: -1;
}

</style>
