class UsersController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.build(user_params)
        @user.save
        redirect_to @user
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to @user
    end

    def edit
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Account and all associated reports successfully deleted"
        redirect_to root_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :encrypted_password)
    end

    def require_login
        unless user_signed_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path
        end
    end
end
