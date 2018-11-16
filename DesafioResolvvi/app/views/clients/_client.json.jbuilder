json.extract! client, :id, :name, :state, :created_at, :updated_at
json.url client_url(client, format: :json)
