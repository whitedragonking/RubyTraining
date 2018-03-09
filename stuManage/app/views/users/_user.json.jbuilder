json.extract! user, :id, :id, :user_name, :password, :full_name, :role, :class_id, :created_at, :updated_at
json.url user_url(user, format: :json)
