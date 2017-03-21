class AddProftextToUsers < ActiveRecord::Migration
  def change
    add_column :users, :proftext, :text
  end
end
