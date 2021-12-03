json.extract! event_message, :id, :created_at, :updated_at
json.url event_message_url(event_message, format: :json)
