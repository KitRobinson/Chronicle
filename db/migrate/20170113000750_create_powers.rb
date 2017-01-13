class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.integer :diety_id
      t.string :name
      t.string :effect

      t.timestamps null: false
    end
  end
end
