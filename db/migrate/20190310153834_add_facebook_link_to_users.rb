class AddFacebookLinkToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :facebook_link, :string
  end
end
