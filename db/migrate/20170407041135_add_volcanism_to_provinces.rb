class AddVolcanismToProvinces < ActiveRecord::Migration
  def change
    add_column :provinces, :vocanism, :integer
  end
end
