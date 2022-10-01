<template>
  <div id="profile-home">
    <div v-if="this.$root.$data.user === null">
      <Login />
    </div>
    <div v-else class="container-box">
      <h1 class="text-white padding-extra-left">
        User: {{ this.$root.$data.user.username }}
        <span>
          <button v-on:click="logOut" class="margin-small-right">
            Log Out
          </button>
          <button v-on:click="deleteProfile">Delete Profile</button>
        </span>
      </h1>
      <button v-on:click="openForm" class="margin-extra-left">Add</button>
      <CreateSheet :show="showCreateSheet" @close="close" />
      <SheetList />
    </div>
  </div>
</template> 

<script>
import Login from '../components/profile/login'
import SheetList from '../components/profile/sheetList'
import CreateSheet from '../components/profile/createSheet'
import token from '../util/token'
import { deleteUser } from '../util/api'

export default {
  name: 'Profile',
  components: {
    Login,
    SheetList,
    CreateSheet,
  },
  data() {
    return {
      showCreateSheet: false,
    }
  },
  methods: {
    openForm() {
      this.showCreateSheet = true
    },
    close() {
      this.showCreateSheet = false
    },
    logOut() {
      this.$root.$data.user = null
      this.$root.$data.sheet = null
      this.$root.$data.sheets = []
      token.clear()
    },
    async deleteProfile() {
      if (confirm('Delete Profile cannot be recovered')) {
        const done = await deleteUser(token.get())
        if (done) {
          this.logOut()
        }
      }
    },
  },
}
</script>

<style>
#profile-home {
  padding-top: 10px;
}

.padding-extra-left {
  padding-left: 10px;
}

.margin-extra-left {
  margin-left: 10px;
}
</style>
