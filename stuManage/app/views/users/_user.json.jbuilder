json.extract! user, :id, :id, :user_name, :password_hash, :full_name, :type, :class_id, :created_at, :updated_at
json.url user_url(user, format: :json)
