class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :gender
      t.string :size
      t.string :colour
      t.text :description
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
