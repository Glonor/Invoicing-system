json.extract! invoice, :id, :user_id, :client_id, :issue_date, :total_amount, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
