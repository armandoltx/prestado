class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :image
      t.string :password_digest
      t.string :top_size
      t.string :bottom_size
      t.string :foot_size
      t.boolean :admin
      t.boolean :renter
      t.boolean :owner

      t.timestamps null: false
    end
  end
end
