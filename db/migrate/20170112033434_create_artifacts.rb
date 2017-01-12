class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :description
      t.integer :owner_id
      t.integer :province_id

      t.timestamps null: false
    end
  end
end
