<!-- Component used to output the clothes the charcter has -->

<template>
<div id="clothes-container">
  <VueSlickCarousel v-bind="settings">
  <div>
    <h3 id="clothes-title">Clothes</h3>
    <div class="floater">
      <button class="button-hover">add</button>
    </div>
    <hr>
    <div v-for="cloth in this.$root.$data.sheet.clothes" :key="cloth.name">
        <p>{{cloth.name}}</p>
        <div class="floater">
          <p>Desc: {{cloth.description}}</p>
          <p>Area: {{cloth.area}}</p>
          <button class="button-hover" v-on:click="removeClothes(cloth)">x</button>
        </div>
        <hr/>
    </div>
  </div>
  <div>
    <p>Name:</p>
    <input type="text" v-model="name" placeholder="name">
    <div>
      <p>Desc:  </p>
      <input type="text" v-model="description" placeholder="description">
    </div>
    <p>Area:</p>
    <select v-model="area" placeholder="location">
      <option value=null disabled selected>Area</option>
      <option value="head">Head</option>
      <option value="torso">Torso</option>
      <option value="arm">Arm</option>
      <option value="leg">Leg</option>
      <option value="wrist">Wrist</option>
      <option value="feet">Feet</option>
    </select>
    <div></div>
    <button class="button-hover" v-on:click="addClothes">add</button>
  </div>


</VueSlickCarousel>
</div>
</template>

<script>
import VueSlickCarousel from 'vue-slick-carousel'
import 'vue-slick-carousel/dist/vue-slick-carousel.css'
import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'

export default {
name: "clothes",
data() {
  return {
    name: "",
    description: "",
    area: "",
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
components: {
  VueSlickCarousel
},
methods: {
  addClothes() {
    if (this.name == "") {
      return;
    }
    this.$root.$data.sheet.clothes.push({
      name: this.name,
      description: this.description,
      area: this.area
    });
    this.name = "";
    this.description = "";
    this.area = "";
  },
  removeClothes(cloth) {
    this.$root.$data.sheet.clothes.splice(this.$root.$data.sheet.clothes.findIndex(element => {
      if (element.name == cloth.name && element.description == cloth.description)
      return true;
      return false;
    }
    ), 1);
  }
}
}
</script>

<style>

#clothes-container {
  max-width: 250px;
  padding: 10px 10px 20px 3px;
}

#clothes-title {
  display: inline;
}

</style>
