<template>
  <div class="back-button">
    <button v-on:click="back">back</button>
  </div>
</template>

<script>
// This is a back button to the character sheet

export default {
  name: 'Back',
  methods: {
    back() {
      this.$router.push({ name: 'Sheet' })
    },
  },
}
</script>

<style>
.back-button {
  float: right;
  margin-right: 5px;
}
</style>
