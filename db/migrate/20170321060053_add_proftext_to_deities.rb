class AddProftextToDeities < ActiveRecord::Migration
  def change
    add_column :deities, :proftext, :text
  end
end
