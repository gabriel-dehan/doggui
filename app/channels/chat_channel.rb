
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    dog = Dog.find(params[:dog_id])
    stream_for dog if dog.user == current_user
  end
end
