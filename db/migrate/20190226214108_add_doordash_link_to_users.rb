class AddDoordashLinkToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :doordash_link, :string
  end
end
