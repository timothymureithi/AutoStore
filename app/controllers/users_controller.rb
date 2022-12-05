class UsersController < ApplicationController


    def index
      users = User.all
      render json: users
    end

    def show
        render json: current_user, status: :ok 
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
 
  
    private
  
    def user_params
      params.permit(:first_name, :last_name, :username, :avatar, :email, :password, :password_confirmation)
    end
    
end
