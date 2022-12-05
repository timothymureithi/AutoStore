class AddOrderIdToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :order_id, :bigint
  end
end
