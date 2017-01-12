class CreateCongregations < ActiveRecord::Migration
  def change
    create_table :congregations do |t|
      t.integer :population_id
      t.integer :deity_id
      t.integer :clergy
      t.integer :laity
      t.integer :piety_multiplier
      t.integer :manpower_multiplier
      t.integer :loyalty

      t.timestamps null: false
    end
  end
end
