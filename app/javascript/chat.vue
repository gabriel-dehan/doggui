<template>
  <div id="app">
    <div class="bouton-show-orange" @click='discuss = !discuss' v-if='!dog_to_user'>
      <i class="fa fa-paper-plane" aria-hidden="true"></i> Discuter
    </div>
    <div v-if='dog_to_user'>
      <conversations :conversations_url='conversations_url' :dog='dog' :user_id='user_id'></conversations>
    </div>
    <div v-else>
      <messages :discuss='discuss' :post_url='post_url' :get_url='get_url' :user_id='user_id'></messages>
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
      discuss: false,
      content: ''
    }
  },
  props: ['post_url', 'get_url', 'conversations_url', 'dog_to_user', 'dog', 'user_id'],
}
</script>

<style>
</style>
