class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :description
      t.integer :is_church
      t.integer :is_kingdom
      t.integer :leader_id
      t.integer :suzerain_id
      t.string :governance

      t.timestamps null: false
    end
  end
end
