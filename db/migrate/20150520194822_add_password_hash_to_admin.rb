class AddPasswordHashToAdmin < ActiveRecord::Migration
  def change
    remove_column :admins, :password 
    add_column :admins, :password_hash, :string
    add_column :admins, :password_salt, :string
  end
end
