class AddDevotionToPopulations < ActiveRecord::Migration
  def change
  	add_column :populations, :devotion, :integer
  end
end
