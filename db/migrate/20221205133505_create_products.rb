class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :quantity
      t.string :color
      t.string :size
      t.timestamps
    end
  end
end
