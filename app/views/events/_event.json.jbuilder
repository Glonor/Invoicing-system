json.extract! event, :id, :title, :description, :billed, :start, :end, :client_id, :created_at, :updated_at
json.url event_url(event, format: :json)
