import Vue from 'vue'
import VueRouter from 'vue-router'
import Profile from '../views/Profile.vue'
import Sheet from '../views/Sheet.vue'
import Weapons from '../views/Weapons.vue'
import Cybernetics from '../views/Cybernetics.vue'
import Clothes from '../views/Clothes.vue'
import Notes from '../views/Notes.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: "Profile",
    component: Profile
  },
  {
    path: '/sheet/',
    name: 'Sheet',
    component: Sheet
  },
  {
    path: '/sheet/weapons',
    name: 'Weapons',
    component: Weapons
  },
  {
    path: '/sheet/cybernetics',
    name: 'Cybernetics',
    component: Cybernetics
  },
  {
    path: '/sheet/clothes',
    name: 'Clothes',
    component: Clothes
  },
  {
    path: '/sheet/notes',
    name: 'Notes',
    component: Notes
  }

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
