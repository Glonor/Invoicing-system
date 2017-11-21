json.extract! event, :id, :title, :description, :billed, :start, :end, :client_id, :created_at, :updated_at
json.url client_event_url(@client, event, format: :html)
