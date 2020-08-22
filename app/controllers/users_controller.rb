class UsersController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, only: [:new, :create, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
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
        @user.update(user_params)
        redirect_to @user
    end

    def edit
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user || current_user.admin?
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

    def require_same_user
        if current_user != @user && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own account"
          redirect_to @user
        end
    end

    def require_admin
        if !(user_signed_in? && current_user.admin?)
          flash[:alert] = "Only admins can perform that action"
          redirect_to root_path
        end
    end
end
