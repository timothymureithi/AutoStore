class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :quantity
      t.string :color
      t.string :size
      t.boolean :active_listing
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
