class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    before_action :authorize 

    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_cart
        Cart.find_by(id: session[:cart_id])
    end

    private

    def record_not_found
        render json: { errors: "not found" }, status: :not_found
    end

    def user_not_authorized
        render json: { errors: "user not authorized" }, status: :unauthorized
      end

end
