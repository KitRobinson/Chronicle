class Changepassword_digestTitle < ActiveRecord::Migration
  def change
  	rename_column :users, :psswrd, :password_digest
  end
end
