class CreateAttitudes < ActiveRecord::Migration
  def change
    create_table :attitudes do |t|
      t.integer :organization_id
      t.integer :target_id
      t.integer :desired_status

      t.timestamps null: false
    end
  end
end
