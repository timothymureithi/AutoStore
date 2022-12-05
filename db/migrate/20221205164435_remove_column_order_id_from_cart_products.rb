class RemoveColumnOrderIdFromCartProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_products, :order_id, :bigint
  end
end
