class AddUbereatsLinkToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :ubereats_link, :string
  end
end
