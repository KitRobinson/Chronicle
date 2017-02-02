class ChangePsswrdTitle < ActiveRecord::Migration
  def change
  	rename_column :users, :psswrd, :password_digest
  end
end
