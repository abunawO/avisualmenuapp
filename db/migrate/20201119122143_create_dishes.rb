class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.text :name
      t.text :picture
      t.text :description
      t.float :price
      t.belongs_to :category
      t.timestamps
    end
  end
end
