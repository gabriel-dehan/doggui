json.extract! conversation_message, :id, :conversation_id, :sender_id, :content, :created_at, :updated_at
json.url conversation_message_url(conversation_message, format: :json)
