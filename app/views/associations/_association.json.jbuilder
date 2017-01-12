json.extract! association, :id, :domain_id, :associable_id, :associable_type, :strength, :created_at, :updated_at
json.url association_url(association, format: :json)