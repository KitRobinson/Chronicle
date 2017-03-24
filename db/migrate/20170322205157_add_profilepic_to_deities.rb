class AddProfilepicToDeities < ActiveRecord::Migration
  def change
    add_column :deities, :profilepic, :string
  end
end
