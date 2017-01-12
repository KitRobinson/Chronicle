class CreatePopulations < ActiveRecord::Migration
  def change
    create_table :populations do |t|
      t.integer :province_id
      t.integer :race_id
      t.float :piety
      t.integer :count
      t.integer :loyalty

      t.timestamps null: false
    end
  end
end
