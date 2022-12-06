class UsersController < ApplicationController


    def index
      users = User.all
      render json: users
    end

    def show
        render json: current_user, status: :ok 
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        Cart.create!(total_items: 0, total_amount: 0, user_id: user.id)
        move_cart_products_guest_to_user(user)
        if (!session[:cart_id])
          session[:cart_id] = user.cart.id
        end
        render json: user, status: :created
      end

    def update
        user = User.find_by(id: session[:user_id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:user_id])
        user.delete
        head :no_content
    end
 
    def get_orders
        orderItems = current_user.order_items
        orders = orderItems.map do |order_item|
          order_item.order
        end.uniq
        render json: orders
      end
  
    private
  
    def user_params
      params.permit(:first_name, :last_name, :username, :avatar, :email, :password, :password_confirmation)
    end
    
end
