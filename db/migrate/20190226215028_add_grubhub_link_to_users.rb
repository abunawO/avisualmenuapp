class AddGrubhubLinkToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :grubhub_link, :string
  end
end
