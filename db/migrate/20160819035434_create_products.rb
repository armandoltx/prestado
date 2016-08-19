class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :gender
      t.string :size
      t.integer :category_id
      t.text :description

      t.timestamps null: false
    end
  end
end
