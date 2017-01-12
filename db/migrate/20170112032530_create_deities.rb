class CreateDeities < ActiveRecord::Migration
  def change
    create_table :deities do |t|
      t.string :name
      t.integer :actor_id
      t.integer :user_id
      t.string :description

      t.timestamps null: false
    end
  end
end
