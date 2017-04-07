class ChangeVocanismToVolcanismInProvinces < ActiveRecord::Migration
  def change
  	rename_column :provinces, :vocanism, :volcanism 
  end
end
