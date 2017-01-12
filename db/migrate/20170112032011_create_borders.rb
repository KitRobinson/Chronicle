class CreateBorders < ActiveRecord::Migration
  def change
    create_table :borders do |t|
      t.integer :province_id
      t.integer :neighbor_id
      t.integer :defense

      t.timestamps null: false
    end
  end
end
