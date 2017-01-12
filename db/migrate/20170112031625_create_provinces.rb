class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :base_dev
      t.integer :is_empyreal
      t.integer :kingdom_id

      t.timestamps null: false
    end
  end
end
