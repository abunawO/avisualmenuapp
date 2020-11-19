class AddAdminToUsers < ActiveRecord::Migration[4.2]
 #The migration to add a boolean admin attribute to users. 
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
