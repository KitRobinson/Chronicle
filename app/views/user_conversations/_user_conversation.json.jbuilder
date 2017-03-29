json.extract! user_conversation, :id, :user_id, :conversation_id, :created_at, :updated_at
json.url user_conversation_url(user_conversation, format: :json)