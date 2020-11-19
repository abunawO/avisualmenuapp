class AddInstagramLinkToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :instagram_link, :string
  end
end
