<template>
  <div id="profile">
    <h1>Neon Citizens</h1>
    <h2 class="orange">Online Character Sheets for Cyberpunk 2020</h2>
    <div id="login">
      <h1>Login</h1>
      <input
        type="text"
        v-model="email_log"
        placeholder="email"
        v-on:keyup.enter="login"
      />
      <input
        type="password"
        v-model="password_log"
        placeholder="password"
        v-on:keyup.enter="login"
      />
      <div>
        <button v-on:click="login">Login</button>
        <button v-on:click="toggleRegister">new User</button>
      </div>
    </div>
    <transition v-if="showRegister" name="modal">
      <div class="modal-mask text-black">
        <div class="modal-container">
          <div style="margin: 5px">
            <p><strong>Register a User</strong></p>
            <button class="floater" v-on:click="toggleRegister">Close</button>
          </div>
          <form class="pure-form" @submit.prevent="">
            <fieldset class="flex-down">
              <div class="left-childern">
                <p>User Name:</p>
                <input
                  type="text"
                  class="wide-input"
                  v-model="username_reg"
                  placeholder="username"
                />
              </div>
              <div class="left-childern">
                <p>Email:</p>
                <input
                  type="text"
                  class="wide-input"
                  v-model="email_reg"
                  placeholder="email"
                />
              </div>
              <div class="left-childern">
                <p>Password:</p>
                <input
                  type="text"
                  class="wide-input"
                  v-model="password_reg"
                  placeholder="password"
                />
              </div>
              <div class="left-childern">
                <p>Password Confirm:</p>
                <input
                  type="text"
                  class="wide-input"
                  v-model="password_reg2"
                  placeholder="password"
                />
              </div>
              <p class="text-red">{{ registerError }}</p>
            </fieldset>
            <button v-on:click="register" class="floater" style="margin=10px">
              submit
            </button>
          </form>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import token from '../../util/token'
import axios from 'axios'
import { getUser, getSheets, registerUser } from '../../util/api'

export default {
  name: 'Login',
  data() {
    return {
      email_log: '',
      password_log: '',
      email_reg: '',
      username_reg: '',
      password_reg: '',
      password_reg2: '',
      interval: null,
      showRegister: false,
      registerError: '',
    }
  },
  methods: {
    async login() {
      if (this.email_log == '' || this.password_log == '') {
        return
      }
      let response = await axios.post(
        '/api/user/login',
        { email: this.email_log, password: this.password_log },
        {
          headers: {
            'Content-Type': 'application/json',
          },
        }
      )
      let data = response.data
      if (data.token) {
        let jwt = data.token
        token.set(jwt)
        this.$root.$data.user = await getUser(jwt)
        this.$root.$data.sheets = await getSheets(jwt)
      }
    },
    async register() {
      if (
        this.username_reg == '' ||
        this.password_reg2 == '' ||
        this.password_reg == '' ||
        this.email_reg == ''
      ) {
        this.registerError = 'Missing fields'
        this.displayError()
        return
      }
      if (this.password_reg != this.password_reg2) {
        this.registerError = 'Passwords do not match'
        this.displayError()
        return
      }
      let tokenData = await registerUser(
        this.username_reg,
        this.email_reg,
        this.password_reg
      )
      this.$root.$data.user = {
        username: this.username_reg,
        email: this.email_reg,
      }
      token.set(tokenData.token)
      console.log('register')
    },
    toggleRegister() {
      this.showRegister = !this.showRegister
    },
    displayError() {
      clearInterval(this.interval)
      this.interval = setInterval(() => {
        this.registerError = ''
        clearInterval(this.interval)
      }, 3000)
    },
  },
}
</script>

<style>
.wide-input {
  width: 80%;
  max-width: 800px;
}

.left-childern {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  text-align: right;
}

.flex-down {
  display: flex;
  flex-direction: column;
}

#login {
  display: flex;
  flex-direction: column;
  align-items: center;
}

#login > input {
  margin: 10px;
  width: 80%;
  max-width: 500px;
  min-width: 200px;
}

#register {
  display: flex;
  flex-direction: column;
  align-items: center;
}

#register > input {
  margin: 10px;
  width: 80%;
  max-width: 500px;
  min-width: 200px;
}
</style>
