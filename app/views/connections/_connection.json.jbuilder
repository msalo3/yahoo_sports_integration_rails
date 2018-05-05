json.extract! connection, :id, :access_token, :refresh_token, :created_at, :updated_at
json.url connection_url(connection, format: :json)
