class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :reference_id

      t.timestamps null: false
    end
  end
end
