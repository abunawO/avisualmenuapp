class AddAltEmailGravatarToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :alt_email_gravatar, :string
  end
end
