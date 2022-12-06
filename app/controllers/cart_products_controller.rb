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
      order.update(total_amount: find_cart_by_session[:total_amount])
      find_cart_by_session.update(total_amount: 0, total_items: 0)
      existing_products.each do |cart_product|
        product = Product.find_by(id: cart_product[:product_id])
        OrderItem.create(order_id: order.id, product_id: product.id, item_quantity: cart_product[:item_quantity])
        if (product[:quantity] > 0)
            product.update(quantity: (product[:quantity] - cart_product[:item_quantity]))
        else
            render json: { error: ["This product is out of stock"]}
        end
    end
    existing_products.destroy_all
end


      private

      def cart_product_params
        params.require(:cart_product).permit(:cart_id, :product_id, :item_quantity)
      end

      def update_cart_on_add(cart, product)
        cart.update(total_items: cart[:total_items] + params[:item_quantity].to_i,
                    total_amount: cart[:total_amount].to_i + product[:price].to_i)
      end

      def update_cart_on_delete(cart, product)
        cart.update(total_items: cart[:total_items] - product[:item_quantity],
                    total_amount: cart[:total_amount] - (product.product[:price].to_i * product[:item_quantity]).to_i)
      end

      def existing_products
        CartProduct.where(cart_id: session[:cart_id])
      end
    
      def existing_product
        existing_products.find_by(product_id: params[:product_id])
      end
      
    
end
