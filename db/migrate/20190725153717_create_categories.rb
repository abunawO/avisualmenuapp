class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority
      t.boolean :is_published
      t.belongs_to :menu

      t.timestamps null: false
    end
  end
end
