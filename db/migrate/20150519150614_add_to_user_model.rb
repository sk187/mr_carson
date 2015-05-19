class AddToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :confirm_code, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_num, :string
    add_column :users, :arrive, :date
    add_column :users, :depart, :date        
  end
end
