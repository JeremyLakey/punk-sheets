import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false
Vue.use(require('vue-moment'));

let data = {
  user: null,
  sheet: null,
  sheets: [],
};

new Vue({
  router,
  data,
  render: h => h(App)
}).$mount('#app')
