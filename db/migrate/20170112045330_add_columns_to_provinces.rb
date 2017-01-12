class AddColumnsToProvinces < ActiveRecord::Migration
  def change
    add_column :provinces, :primary_terrain_id, :integer
    add_column :provinces, :secondary_terrain_id, :integer
    add_column :provinces, :region_id, :integer
  end
end
