<template>
  <div>
    <h1>Weapons</h1>
    <div class="container-box">
      <weaponList :weapons="$root.$data.sheet.weapons"/>
      <addWeapon/>
      <hr/>
      <weaponSettings/>
    </div>
  </div>
</template>

<script>
import addWeapon from '../components/weapons/addWeapon.vue';
import weaponList from '../components/weapons/weaponList.vue';
import weaponSettings from '../components/weapons/weaponSettings.vue';

export default {
  name: "Weapons",
  components: {
    addWeapon,
    weaponList,
    weaponSettings
  }
}
</script>

<style>

</style>
