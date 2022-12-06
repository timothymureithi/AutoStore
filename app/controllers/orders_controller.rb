class OrdersController < ApplicationController

    def index
        orders = Order.all
        render json: orders
    end

    def user_orders
        orders = Order.where(user_id: session[:id])
        render json: orders
    end
end
