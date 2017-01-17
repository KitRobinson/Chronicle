class CreateOrganizationsProvinces < ActiveRecord::Migration
  def change
    create_table :organizations_provinces do |t|
      t.integer :organization_id
      t.integer :province_id

      t.timestamps null: false
    end
  end
end
