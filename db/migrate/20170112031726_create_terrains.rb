class CreateTerrains < ActiveRecord::Migration
  def change
    create_table :terrains do |t|
      t.string :name
      t.float :development_multiplier
      t.integer :difficulty

      t.timestamps null: false
    end
  end
end
