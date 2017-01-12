json.extract! artifact, :id, :name, :description, :owner_id, :province_id, :created_at, :updated_at
json.url artifact_url(artifact, format: :json)