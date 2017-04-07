json.extract! myths_user, :id, :user_id, :myth_id, :access_level, :created_at, :updated_at
json.url myths_user_url(myths_user, format: :json)