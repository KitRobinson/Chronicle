class CreateMyths < ActiveRecord::Migration
  def change
    create_table :myths do |t|
      t.string :myth_pic
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
