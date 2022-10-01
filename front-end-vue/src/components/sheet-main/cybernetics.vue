<!-- component used to display cybernetics character has -->

<template>
<div id="cyber-container">
  <div id="cyber-no-hover">
    <h2>Cybernetics</h2>
  </div>
  <div id="cyber-hover">
  <div>
    <h4 id="cyber_title">Cybernetics</h4>
  </div>
  <div>
    <input type="text" v-model="name" placeholder="add cybernetics"/>
    <p> humanity cost:</p>
    <input type="number" class="smallInput" v-model="num" min="0" max="99"/>
    <button class="button-hover" v-on:click="addCyber">add</button>
  </div>
  <div v-if="this.$root.$data.sheet.cybernetics != null">
    <hr/>
    <div v-for="cyber in this.$root.$data.sheet.cybernetics" :key="cyber.index">
      <p>{{cyber.name}}</p>
      <div class="floater">
        <p>{{cyber.cost}} cost</p>
        <button class="button-hover" v-on:click="removeCyber(cyber)">remove</button>
      </div>
      <hr/>
    </div>
    <div>
      <p>sort</p>
      <button class="button-hover" v-on:click="sortByAlpha">Alpha</button>
      <button class="button-hover" v-on:click="sortByCost">Cost</button>
      <button class="button-hover" v-on:click="sortByIndex">Reset</button>
      <p class="floater">Total: {{total}}</p>
    </div>
  </div>
  </div>
</div>
</template>

<script>

export default {
name: "cybernetics",
data() {
  return {
    name: "",
    num: 0,
    index: 0,
  }
},
methods: {
  addCyber() {
    if (this.name == "")
      return;

    this.$root.$data.sheet.cybernetics.push({
      name: this.name,
      cost: parseInt(this.num),
      index: this.index
    });
    this.index++;
    this.name = "";
    this.num = 0;
    this.updateHumanityStat();
  },
  sortByCost() {
    this.$root.$data.sheet.cybernetics.sort((a,b) => {
      if (a.cost > b.cost) return -1;
      if (b.cost > a.cost) return 1;
      return 0;
    })
  },
  sortByAlpha() {
    this.$root.$data.sheet.cybernetics.sort((a,b) => {
      if (a.name.toLowerCase() > b.name.toLowerCase()) return 1;
      if (b.name.toLowerCase() > a.name.toLowerCase()) return -1;
      return 0;
    })
  },
  sortByIndex() {
    this.$root.$data.sheet.cybernetics.sort((a,b) => {
      if (a.index > b.index) return 1;
      if (b.index > a.index) return -1;
      return 0;
    })
  },
  removeCyber(cyber){
    let index = -1;
    for (let i = 0; i < this.$root.$data.sheet.cybernetics.length; i++) {
      if(this.$root.$data.sheet.cybernetics[i].name == cyber.name && this.$root.$data.sheet.cybernetics[i].cost == cyber.cost && this.$root.$data.sheet.cybernetics[i].index == cyber.index) {
        index = i;
        break;
      }
    }
    this.$root.$data.sheet.cybernetics.splice(index,1);
    this.updateHumanityStat();
  },
  updateHumanityStat() {
    let points = this.$root.$data.sheet.stats.emp * 10;
    this.$root.$data.sheet.current_stats.emp = Math.trunc((points - this.total) / 10);
  },
},
computed: {
  total() {
    let num = 0;
    for(let i = 0; i < this.$root.$data.sheet.cybernetics.length; i++) {
      num += this.$root.$data.sheet.cybernetics[i].cost;
    }
    return num;
  }
}
}
</script>

<style>

#cyber_title {
  margin: 0 3px;
  margin-bottom: .5em;
}

#cyber-hover {
  transition: opacity .5s;
}

#cyber-no-hover {
  transition: opacity .25s;
}

#cyber-container #cyber-hover {
  opacity: 0;
  z-index: -1;
}


#cyber-container:hover #cyber-hover{
  opacity: 1;
  z-index: 1;
}

#cyber-container #cyber-no-hover{
  position: relative;
  display: -webkit-box;
  left: 80%;
  transform: translateX(-50%);
  height: 0;
  top: -3px;
  opacity: 1;

  z-index: 1;
}

#cyber-container:hover #cyber-no-hover{
  opacity: 0;

  z-index: -1;
}
</style>
