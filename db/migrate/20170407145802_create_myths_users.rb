class CreateMythsUsers < ActiveRecord::Migration
  def change
    create_table :myths_users do |t|
      t.integer :user_id
      t.integer :myth_id
      t.integer :access_level

      t.timestamps null: false
    end
  end
end
