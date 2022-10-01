<template>
<transition v-if="show" name="modal">
  <div class="modal-mask text-black">
    <div class="modal-container">
      <div style="margin: 5px">
        <p><strong>Create a Sheet:</strong></p>
        <button type="button" @click="close" class="floater">Close</button>
      </div>
      <form class="pure-form" @submit.prevent="">
        <fieldset>
          <p>Character Name: </p>
          <input v-model="name" placeholder="Name">
        </fieldset>
        <fieldset>
          <p>Description of Character:</p>

          <input v-model="description" placeholder="Description"/>

        </fieldset>
        <fieldset>
            <p class="center-childern" style="margin: 5px">Stats:</p>
          <table id="createSheetTable">
          <tr>
            <td>
              <p class='no-margin'>Int:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="int"  min="1" max="20"/>
            </td>
            <td>
              <p class='no-margin'>Ref:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="ref" min="1" max="20"/>
            </td>
            <td>
              <p class='no-margin'>Tech:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="tech" min="1" max="20"/>
            </td>
          </tr>
          <tr>
            <td>
              <p class='no-margin'>Cool:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="cool" min="1" max="20"/>
            </td>
            <td>
              <p class='no-margin'>Attr:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="attr" min="1" max="20"/>
            </td>
            <td>
              <p class='no-margin'>Luck:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="luck" min="1" max="20"/>
            </td>
          </tr>
          <tr>
            <td>
              <p class='no-margin'>Ma:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="ma" min="1" max="20"/>
            </td>
            <td>
              <p class='no-margin'>Body:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="body" min="1" max="20"/>
            </td>
            <td>
              <p class='no-margin'>Emp:</p>
            </td>
            <td>
              <input class="smallInput" type="number" v-model="emp" min="1" max="20"/>
            </td>
          </tr>
          <tr>
            <td><p/></td>
            <td><p/></td>
            <td><p/></td>
            <td><p class="no-margin">Total:</p></td>
            <td><p>{{total}}</p></td>
            <td><button v-on:click="randomize">Random</button></td>
          </tr>
          </table>
        </fieldset>
        <button v-on:click="createForm" class="floater">Create</button>
      </form>
    </div>
  </div>
</transition>
</template>

<script>
import {addSheet} from "../../util/api";
import token from "../../util/token";

export default {
  name: "CreateSheet",
  props: {
    show: Boolean,
  },
  data() {
    return {
      name: "",
      description: "",
      ref: 2,
      int: 2,
      tech: 2,
      cool: 2,
      luck: 2,
      emp: 2,
      body: 2,
      ma: 2,
      attr: 2,
    }
  },
  computed: {
    total() {
      return parseInt(this.ref) + parseInt(this.int)
        + parseInt(this.tech) + parseInt(this.cool)
         + parseInt(this.luck) + parseInt(this.emp)
         + parseInt(this.body) + parseInt(this.ma) + parseInt(this.attr)
    }
  },
  methods: {
    close() {
      this.$emit('close')
    },
    randomishDice() {
        return Math.floor(Math.random() * 8) + 2;
    },
    randomize() {
      console.log("yesss")
      this.ref = this.randomishDice();
      this.int = this.randomishDice();
      this.tech = this.randomishDice();
      this.cool = this.randomishDice();
      this.luck = this.randomishDice();
      this.emp = this.randomishDice();
      this.body = this.randomishDice();
      this.ma = this.randomishDice();
      this.attr = this.randomishDice();
    },
    async createForm() {
      const sheet = {
        name: this.name,
        description: this.description,
        ref: this.ref,
        int:this.int,
        tech: this.tech,
        cool: this.cool,
        luck: this.luck,
        emp: this.emp,
        body: this.body,
        ma: this.ma,
        attr: this.attr
      }
      let newSheet = await addSheet(token.get(), sheet)
      if(newSheet) {
        this.$root.$data.sheets.push(newSheet);
      }
      this.close();
    }
  }
}
</script>

<style>
/* Modals */
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .3);
  transition: opacity 0.5s ease;
  display: flex;
  transition: background 0.2s ease-in-out, height 1s ease-in-out;
  transition: height 0.2s ease-in-out, width 0.2s ease-in-out;
  justify-content: center;
  transition-timing-function: cubic-bezier(0.64, 0.57, 0.67, 1.53);
}

.modal-container {
  width: 70%;
  height: max-content;
  margin-top: 80px;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all 0.5s ease;
}

/*
* The following styles are auto-applied to elements with
* transition="modal" when their visibility is toggled
* by Vue.js.
*
* You can easily play with the modal transition by editing
* these styles.
*/
.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

/* Form */

form {
  font-size: 11pt;
}


.placeholder {
  background: #F0F0F0;
  width: 200px;
  height: 125px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #333;
  font-size: 14px;
  cursor: pointer;
}

.no-margin {
  margin-right: 0em;
}

.placeholder:hover {
  background: #E0E0E0;
}

.fileInput {
  display: none;
}

#createSheetTable {
  margin-right: auto;
  margin-left: auto;
}

.space-between-children {
  display: flex;
  justify-content: flex-end;
}
</style>
