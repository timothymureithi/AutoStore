class CartsController < ApplicationController

    def current_cart
        cart = Cart.find(session[:cart_id])
        render json: cart
      end
    end
end
