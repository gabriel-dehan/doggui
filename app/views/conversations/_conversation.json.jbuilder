json.extract! conversation, :id, :dog, :created_at, :updated_at
json.sender_name conversation.messages.not_of_user(current_user).first&.sender&.first_name
json.messages_url dog_conversation_messages_path(@dog, conversation, format: :json)
json.url dog_conversation_path(@dog, conversation, format: :json)
json.number_of_unread_message conversation.messages.not_of_user(current_user).not_read.count
