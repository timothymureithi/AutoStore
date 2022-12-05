class AddItemQuantityToCartProduct < ActiveRecord::Migration[7.0]
  def change
    add_column(:cart_products, :item_quantity,:integer)
  end
end
