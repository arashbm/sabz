json.array!(@messages) do |message|
  json.extract! message, :from_id, :to_id, :content
  json.url message_url(message, format: :json)
end
