class VillainsController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_admin, only: [:destroy]
    before_action :set_villain, only: [:show, :edit, :update, :destroy]

    def index
        @villains = Villain.all
        @villains = Villain.ordered_by_name
    end

    def show
    end
    
    def new
        @villain = Villain.new
    end

    def create
        @villain = Villain.new(villain_params)
        if @villain.save
            flash[:notice] = "Villain was successfully created"
            redirect_to new_villain_bio_path
        else
            render 'new'
        end
    end

    def update
        if @villain.update(villain_params)
            flash[:notice] = "Villain name updated successfully"
            redirect_to @villain
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @villain.destroy
        redirect_to villains_path
    end

    private

    def set_villain
        @villain = Villain.find(params[:id])
    end

    def villain_params
        params.require(:villain).permit(:villain_name)
    end

    def require_login
        unless user_signed_in?
            flash[:error] = "You must be logged in to access this section"
            redirect_to root_path # halts request cycle
        end
    end

    def require_admin
        if !(user_signed_in? && current_user.admin?)
          flash[:alert] = "Only admins can perform that action"
          redirect_to root_path
        end
    end
end
