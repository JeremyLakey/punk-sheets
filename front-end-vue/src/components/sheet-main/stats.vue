<!-- displays stats of character -->

<template>
<div id="stat-container">
<!--<VueSlickCarousel v-bind="settings">-->
<div>
  <div id="roll">
    <div v-if="fumble">
      <h3>Fumble</h3>
      <button class="button-hover" v-on:click="clear">clear</button>
    </div>
    <div v-else-if="roll != null">
      <h3>Total: {{roll}}</h3>
      <button class="button-hover" v-on:click="clear">clear</button>
    </div>
    <div v-else>
      <h3>Stats</h3>
    </div>
  </div>
  <div id="stat_table">
    <div class="stat_row">
      <div class="stat_block">
        <p>INT {{this.$root.$data.sheet.current_stats.int}}/{{this.$root.$data.sheet.stats.int}}</p>
      </div>
      <div class="spacer"/>

      <div class="stat_block">
        <button class="button-hover" v-on:click="intRoll">roll</button>
        <button class="button-hover" v-on:click="intUp">+</button>
        <button class="button-hover" v-on:click="intDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>ATTR {{this.$root.$data.sheet.current_stats.attr}}/{{this.$root.$data.sheet.stats.attr}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="attrRoll">roll</button>
        <button class="button-hover" v-on:click="attrUp">+</button>
        <button class="button-hover" v-on:click="attrDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>EMP {{this.$root.$data.sheet.current_stats.emp}}/{{this.$root.$data.sheet.stats.emp}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="empRoll">roll</button>
        <button class="button-hover" v-on:click="empUp">+</button>
        <button class="button-hover" v-on:click="empDown">-</button>
      </div>
      <div class="spacer-big"/>
    </div>

    <div class="stat_row">
      <div class="stat_block">
        <p>REF {{this.$root.$data.sheet.current_stats.ref}}/{{this.$root.$data.sheet.stats.ref}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="refRoll">roll</button>
        <button class="button-hover" v-on:click="refUp">+</button>
        <button class="button-hover" v-on:click="refDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>LUCK {{this.$root.$data.sheet.current_stats.luck}}/{{this.$root.$data.sheet.stats.luck}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="luckUp">+</button>
        <button class="button-hover" v-on:click="luckDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>RUN {{this.$root.$data.sheet.current_stats.ma * 3}}</p>
      </div>
    </div>

    <div class="stat_row">
      <div class="stat_block">
        <p>TECH {{this.$root.$data.sheet.current_stats.tech}}/{{this.$root.$data.sheet.stats.tech}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="techRoll">roll</button>
        <button class="button-hover" v-on:click="techUp">+</button>
        <button class="button-hover" v-on:click="techDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>MA {{this.$root.$data.sheet.current_stats.ma}}/{{this.$root.$data.sheet.stats.ma}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="maUp">+</button>
        <button class="button-hover" v-on:click="maDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>LEAP {{this.$root.$data.sheet.current_stats.ma * 3 / 4}}</p>
      </div>
    </div>

    <div class="stat_row">
      <div class="stat_block">
        <p>COOL {{this.$root.$data.sheet.current_stats.cool}} / {{this.$root.$data.sheet.stats.cool}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="coolRoll">roll</button>
        <button class="button-hover" v-on:click="coolUp">+</button>
        <button class="button-hover" v-on:click="coolDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>BODY {{this.$root.$data.sheet.current_stats.body}} / {{this.$root.$data.sheet.stats.body}}</p>
      </div>
      <div class="spacer"/>
      <div class="stat_block">
        <button class="button-hover" v-on:click="bodyRoll">roll</button>
        <button class="button-hover" v-on:click="bodyUp">+</button>
        <button class="button-hover" v-on:click="bodyDown">-</button>
      </div>
      <div class="spacer-big"/>

      <div class="stat_block">
        <p>LIFT {{this.$root.$data.sheet.current_stats.body * 40}}</p>
      </div>
    </div>
  </div>
</div>
<div>
  <div class="center-childern">
    <button v-on:click="doRoll('4')" class="margin-right-small button-hover">D4</button>
    <button v-on:click="doRoll('6')" class="margin-right-small button-hover">D6</button>
    <button v-on:click="doRoll('8')" class="margin-right-small button-hover">D8</button>
    <button v-on:click="doRoll('10')" class="margin-right-small button-hover">D10</button>
    <button v-on:click="doRoll('12')" class="margin-right-small button-hover">D12</button>
    <button v-on:click="doRoll('20')" class="margin-right-small button-hover">D20</button>
    <button class="button-hover" v-on:click="doRoll('100')">D100</button>
  </div>
</div>
<!--</VueSlickCarousel>-->
</div>
</template>

<script>
//import carousel
//import VueSlickCarousel from 'vue-slick-carousel'
//import 'vue-slick-carousel/dist/vue-slick-carousel.css'
//import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'


export default {
name: "stats",
data() {
  return {
    roll: null,
    fumble: null,
    settings: {
    "dots": true,
    "arrows": true,
    "edgeFriction": 0.35,
    "infinite": false,
    "speed": 500,
    "slidesToShow": 1,
    "slidesToScroll": 1
    }
  };
},
components: {
  //VueSlickCarousel
},
methods: {
  doRoll(num) {
    let temp = Math.trunc(Math.random() * num + 1);
    console.log("rolled a " + temp + " on a " + num + " sided Dice");
    this.roll = temp;
  },
  getRoll(isFirst) {
    let temp = Math.trunc(Math.random() * 10 + 1);
    if (isFirst && temp == 1) {
      this.fumble = true;
      return 1;
    }
    else {
      this.fumble = false;
    }
    console.log("rolled a " + temp);
    if (temp == 10) {
      console.log("critial roll! adding another dice")
      temp = temp + this.getRoll();
    }
    return temp;
  },
  intRoll() {
    console.log("Makeing a INT check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.int;
    console.log("Total: " + this.roll);
  },
  intUp() {
    this.$root.$data.sheet.current_stats.int++;
  },
  intDown() {
    this.$root.$data.sheet.current_stats.int--;
  },
  refRoll() {
    console.log("Makeing a REF check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.ref
    console.log("Total: " + this.roll);
  },
  refUp() {
    this.$root.$data.sheet.current_stats.ref++;
  },
  refDown() {
    this.$root.$data.sheet.current_stats.ref--;
  },
  techRoll() {
    console.log("Makeing a TECH check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.tech
    console.log("Total: " + this.roll);
  },
  techUp() {
    this.$root.$data.sheet.current_stats.tech++;
  },
  techDown() {
    this.$root.$data.sheet.current_stats.tech--;
  },
  coolRoll() {
    console.log("Makeing a COOL check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.cool
    console.log("Total: " + this.roll);
  },
  coolUp() {
    this.$root.$data.sheet.current_stats.cool++;
  },
  coolDown() {
    this.$root.$data.sheet.current_stats.cool--;
  },
  attrRoll() {
    console.log("Makeing a ATTR check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.attr;
    console.log("Total: " + this.roll);
  },
  attrUp() {
    this.$root.$data.sheet.current_stats.attr++;
  },
  attrDown() {
    this.$root.$data.sheet.current_stats.attr--;
  },
  luckRoll() {
    console.log("Makeing a LUCK check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.luck
    console.log("Total: " + this.roll);
  },
  luckUp() {
    this.$root.$data.sheet.current_stats.luck++;
  },
  luckDown() {
    this.$root.$data.sheet.current_stats.luck--;
  },
  maRoll() {
    console.log("Makeing a MA check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.ma
    console.log("Total: " + this.roll);
  },
  maUp() {
    this.$root.$data.sheet.current_stats.ma++;
  },
  maDown() {
    this.$root.$data.sheet.current_stats.ma--;
  },
  bodyRoll() {
    console.log("Makeing a BODY check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.body
    console.log("Total: " + this.roll);
  },
  bodyUp() {
    this.$root.$data.sheet.current_stats.body++;
  },
  bodyDown() {
    this.$root.$data.sheet.current_stats.body--;
  },
  empRoll() {
    console.log("Makeing a EMP check");
    this.roll = this.getRoll(true) + this.$root.$data.sheet.current_stats.emp
    console.log("Total: " + this.roll);
  },
  empUp() {
    this.$root.$data.sheet.current_stats.emp++;
  },
  empDown() {
    this.$root.$data.sheet.current_stats.emp--;
  },
  clear() {
    this.roll = null;
    this.fumble = null;
  }
}
}
</script>


<style>



.stat_row {
  display: table-cell;
}

.stat_row .col-hover {
  opacity: 0;

}

.stat_row:hover .col-hover{

  transition: opacity .5s;
  opacity: 1;
}


#roll div {
  width: 40%;
  margin-right: auto;
  margin-left:  auto;
}

#roll div h3 {
  margin:0;
  margin-top: .5em;
  margin-right: 1em;
  padding:0;
  display: inline;
}

#stat_table {
  display:table;
  text-align:left;
  border-collapse:separate;
  border-spacing:0 5px;
}

#stat-container *{
  flex: 0;
}
</style>
