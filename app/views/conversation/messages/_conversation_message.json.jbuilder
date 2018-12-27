json.extract! message, :id, :conversation_id, :content, :created_at
json.sender_name message.sender.first_name
json.is_current_user message.sender == current_user
