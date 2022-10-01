<template>
  <div>
    <table v-if="weapons.length > 0">
      <tr>
        <td>Name</td>
        <td>Type</td>
        <td>Accuracy</td>
        <td>Range</td>
        <td>Concealability</td>
        <td>Ammunition</td>
        <td>Rounds</td>
        <td>Fire Rate</td>
        <td>Damage</td>
        <td>Reliability</td>
      </tr>
      <tr v-for="weapon in weapons" :key="weapon.id">
        <td>{{weapon.name}}</td>
        <td>{{weapon.type}}</td>
        <td>{{weapon.accuracyBonus}}</td>
        <td>{{weapon.range}}</td>
        <td>{{weapon.concealability}}</td>
        <td>{{weapon.ammunition}}</td>
        <td>{{weapon.numRounds}}</td>
        <td>{{weapon.rateOfFire}}</td>
        <td>{{weapon.numDice}}{{weapon.dice}} + {{weapon.bonusDamage}}</td>
        <td>{{weapon.reliablility}}</td>
        <button>select</button>
      </tr>
    </table>
  </div>
</template>

<script>

export default {
 name: "weaponList",
 props: {
  weapons: Array
 }
}
</script>

<styles>

</styles>
