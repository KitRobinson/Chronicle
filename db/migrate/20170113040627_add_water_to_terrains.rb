class AddWaterToTerrains < ActiveRecord::Migration
  def change
    add_column :terrains, :water, :integer
  end
end
