<template>
  <div id="sheetList" class="text-white">
    <div>
      <hr />
      <div v-for="sheet in this.$root.$data.sheets" :key="sheet._id">
        <p class="padding-extra-left">{{ sheet.name }}</p>
        <div class="floater padding-extra-right">
          <p>Created on {{ sheet.date | formatDate }}</p>
          <button v-on:click="selectSheet(sheet)" class="margin-small-right">
            Select
          </button>
          <button v-on:click="dipslayOptions">
            Options
          </button>
        </div>
        <hr />
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
//import { editSheet } from '../../util/api'
//import token from '../../util/token'
export default {
  name: 'SheetList',
  data() {
    return {
      isOptionsOpen: false,
      optionSheet: null,
    }
  },
  filters: {
    formatDate: function(date) {
      return moment(date).format('MMMM Do YYYY')
    },
  },
  methods: {
    selectSheet(sheet) {
      this.$root.$data.sheet = sheet
    },
    displayOptions(sheet) {
      console.log(sheet)
      // OPEN A DISPLAY components with this sheet as the options
      this.optionSheet = sheet
    },
  },
}
</script>

<style>
.margin-small-right {
  margin-right: 3px;
}

.padding-extra-right {
  padding-right: 10px;
}
</style>
