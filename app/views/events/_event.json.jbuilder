json.extract! event, :id, :title, :description, :billed, :client_id, :created_at, :updated_at
json.start event.start_time
json.end event.end_time
json.url client_event_url(@client, event, format: :html)
