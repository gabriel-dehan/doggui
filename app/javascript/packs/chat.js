import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm';
import Chat from '../chat.vue';
import axios from 'axios';
import { initMapbox } from '../plugins/init_mapbox';
import { FormImagesPreviewer } from '../components/form_images_previewer';
import { FormLofHandler } from '../components/form_lof_handler';
import { initAutocomplete } from '../plugins/init_autocomplete';

Vue.use(TurbolinksAdapter);

Vue.component('chat', Chat);
document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common['X-CSRF-Token'] = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute('content');

  const conversation = document.getElementById('conversation');
  if(conversation !== null) {
    const app = new Vue({
      el: '[data-behavior="vue"]',
    });
  }

  // Needs to be after the loading of Vue otherwise Vue overwrites it.
  initMapbox();
  initAutocomplete();
  FormImagesPreviewer();
  FormLofHandler();

});
