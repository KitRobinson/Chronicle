class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :domain_id
      t.integer :associable_id
      t.string :associable_type
      t.integer :strength

      t.timestamps null: false
    end
  end
end
