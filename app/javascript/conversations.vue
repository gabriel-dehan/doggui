<template lang="html">
  <div class="conversations">
    <div class="show-titre text-center" @click='discuss = false'>
      Discussions
    </div>
    <div class="senders">
      <div class='conversation' v-for='conversation in conversations' v-if='!discuss'>
        <div class='conversation-name' @click='openMessages(conversation)'>
          {{ conversation.sender_name }}
          <div class="unread-messages" v-if='conversation.number_of_unread_message > 0'>
            {{ conversation.number_of_unread_message }}
          </div>
        </div>
      </div>
    </div>
    <messages :discuss='discuss' :post_url='messages_url' :get_url='messages_url' :user_id='user_id'></messages>
  </div>
</template>

<script>
import axios from 'axios';
import messages from 'messages.vue';
export default {
  components: {
    messages
  },
  props: ['conversations_url', 'dog', 'user_id'],
  data () {
    return {
      conversations: [],
      discuss: false,
      messages_url: null
    }
  },
  mounted () {
    this.loadConversations();
    const propState = this
    App.cable.subscriptions.create({
      channel: 'ChatChannel',
      dog_id: `${this.dog}`
    }, {
      received (data) {
        console.log(data)
        if(propState.conversations.length == 0) {
          propState.loadConversations()
        } else {
          var conversation = propState.conversations.find(obj => obj.id == data.conversation)
          conversation.number_of_unread_message = data.unread_messages
        }
      }
    })
  },
  methods: {
    loadConversations () {
      axios.get(this.conversations_url)
      .then(response => {
        this.conversations = response.data
      })
    },
    openMessages (conversation) {
      if(this.discuss && conversation.messages_url == this.messages_url) {
        this.discuss = false
      } else {
        conversation.number_of_unread_message = 0
        this.messages_url = conversation.messages_url;
        this.discuss = true
      }
    }
  }
}
</script>

<style lang="scss">
.show-titre {
  font-size: 15px;
  cursor: pointer;
}
.senders {
  display: inline-flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-height: 100px;
  overflow: scroll;
}
.conversation {
  margin: 1px;
  border: 1px solid #d8d8d8;
  border-radius: 4px;
  padding: 2px;
  cursor: pointer;
}
.conversation-name {
  display: flex;
  .unread-messages {
    color: white;
    background: red;
    padding: 0px 3px 7px 4px;
    font-size: 11px;
    border-radius: 50%;
    margin-left: 2px;
    height: 13px
  }
}
</style>
