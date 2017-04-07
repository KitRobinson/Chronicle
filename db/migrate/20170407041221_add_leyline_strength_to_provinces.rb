class AddLeylineStrengthToProvinces < ActiveRecord::Migration
  def change
    add_column :provinces, :leyline_strength, :integer
  end
end
