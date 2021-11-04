json.extract! user, :id, :userName, :password, :portfolio, :created_at, :updated_at
json.url user_url(user, format: :json)
