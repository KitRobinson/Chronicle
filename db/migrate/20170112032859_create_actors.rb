class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :description
      t.integer :race_id
      t.integer :might
      t.integer :will
      t.integer :cunning
      t.integer :subtlety
      t.integer :perception
      t.integer :sagacity
      t.integer :province_id
      t.integer :organization_id
      t.integer :scale
      t.integer :count
      t.string :personality
      t.string :mood

      t.timestamps null: false
    end
  end
end
