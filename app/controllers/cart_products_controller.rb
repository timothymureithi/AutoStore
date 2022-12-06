class CartProductsController < ApplicationController

    def create
        if (current_user)
          session[:cart_id] = current_user.cart[:id]
          if (!product_exists?)
            add_product_to_cart = CartProduct.new(cart_id: session[:cart_id], product_id: params[:product_id],
                                                  item_quantity: params[:item_quantity])
            if (add_product_to_cart.save)
              update_cart_on_add(find_cart_by_session, find_product_by_params)
            end
          else
            update_item_quantity(existing_product)
            update_cart_on_add(find_cart_by_session, find_product_by_params)
          end
        elsif (!session[:cart_id])
          guestCart = Cart.create(total_items: 0, total_amount: 0)
          session[:cart_id] = guestCart[:id]
          add_product(guestCart)
        else
          guestCart = find_cart_by_session
          if (!product_exists?)
            add_product(guestCart)
          else
            update_item_quantity(existing_product)
            update_cart_on_add(guestCart, find_product_by_params)
          end
        end
        render json: find_cart_by_session, status: :created
      end

      def destroy
        product = existing_products.find_by(product_id: params[:id])
        update_cart_on_delete(find_cart_by_session, product)
        product.destroy
        head :no_content
      end
      
      def destroy_all
        order = if (current_user)
            Order.create(user_id: current_user.id)
        else
            Order.create
      end
      

      private
    
end
