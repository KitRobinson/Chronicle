class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :organization_one_id
      t.integer :organization_two_id
      t.integer :current_relationship
      t.integer :expected_relationship

      t.timestamps null: false
    end
  end
end
