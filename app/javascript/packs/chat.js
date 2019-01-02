import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'
import Chat from '../chat.vue'
import axios from 'axios'

Vue.use(TurbolinksAdapter)

Vue.component('chat', Chat)
document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common['X-CSRF-Token'] = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute('content');

  const conversation = document.getElementById('conversation')
  const app = new Vue({
    el: '[data-behavior="vue"]',
  })
})
