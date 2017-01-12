class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :description
      t.integer :longevity
      t.integer :fecundity
      t.integer :might
      t.integer :will
      t.integer :cunning
      t.integer :sutlety
      t.integer :perception
      t.integer :sagacity
      t.integer :scale

      t.timestamps null: false
    end
  end
end
