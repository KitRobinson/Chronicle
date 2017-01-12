json.extract! organization, :id, :name, :description, :is_church, :is_kingdom, :leader_id, :kingdom_id, :governance, :created_at, :updated_at
json.url organization_url(organization, format: :json)