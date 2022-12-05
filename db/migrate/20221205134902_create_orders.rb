class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :total_amount
      t.timestamps
    end
  end
end
