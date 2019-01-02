class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation if (conversation.messages.pluck(:user_id).uniq.include?(current_user.id) || conversation.dog.user == current_user)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
