<template lang="html">
  <div class="discussion" v-if='discuss'>
    <form @keyup.enter='submit'>
      <!-- <div class="form-group"> -->
        <div class="messages" v-for='message in messages'>
          <div :class="{ isSender: message.is_current_user }" class='message'>
            {{ message.content }}
            <div class="message-time">
              Le {{ message.date_of_creation }}
            </div>
          </div>
        </div>
        <textarea class='form-control' v-model='content' placeholder='Votre message ici'></textarea>
      <!-- </div> -->
      <button class='bouton-show-orange' @click.prevent="submit">
        Envoyer
      </button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: ['discuss', 'post_url', 'get_url', 'user_id'],
  data: function() {
    return {
      messages: [],
      content: ''
    }
  },
  watch: {
    discuss () {
      if(this.discuss) {
        this.loadDiscussion()
        this.playActionCable()
      }
    },
    get_url () {
      if(this.discuss) {
        this.loadDiscussion()
      }
    }
  },
  methods: {
    submit () {
      axios.post(this.post_url, {
        content: this.content
      })
      .then(response => {
        this.messages.push(response.data)
        this.post_url = response.data.conversation_url
        this.content = null
      })
    },
    loadDiscussion () {
      axios.get(this.get_url)
      .then(response => {
        this.messages = response.data
      })
    },
    playActionCable () {
      if(this.get_url != null) {
        const propState = this
        var conversation_id = this.get_url.split('/')[4]
        App.cable.subscriptions.create({
          channel: 'ConversationChannel',
          conversation_id: `${conversation_id}`
        }, { received (data) {
          var is_current_user = data.user_id == propState.user_id
          if(!is_current_user) {
            data.message.is_current_user = is_current_user
            propState.messages.push(data.message)
          }
        }})
      }
    }
  }
}
</script>

<style lang="css">
.discussion {
  max-height: 295px;
  overflow: scroll;
}
p {
  font-size: 2em;
  text-align: center;
}
.form-control {
  width: 100% !important;
  margin-left: 0px;
}

.message {
  border: 1px solid #d8d6d6;
  border-radius: 2px;
  padding: 3px;
  margin: 2px;
  width: 90%;
  float: right;
}
.message-time {
  font-size: 9px;
  display: flex;
  justify-content: flex-end;
}
.isSender {
  background-color: #f9e8c5;
  float: left;
}
</style>
