<template>
  <div id="app">
    <div class="bouton-show-orange" @click='discuss = !discuss' v-if='!dog_to_user'>
      Discuter
    </div>
    <div v-if='dog_to_user'>
      <conversations :conversations_url='conversations_url' :dog='dog'></conversations>
    </div>
    <div v-else>
      <messages :discuss='discuss' :post_url='post_url' :get_url='get_url'></messages>
    </div>
  </div>
</template>

<script>
import messages from 'messages.vue';
import conversations from 'conversations.vue';
export default {
  components: {
    messages,
    conversations
  },
  data: function () {
    return {
      messages: [],
      discuss: false,
      content: ''
    }
  },
  props: ['post_url', 'get_url', 'conversations_url', 'dog_to_user', 'dog'],
}
</script>

<style>
</style>
