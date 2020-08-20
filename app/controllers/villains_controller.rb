class VillainsController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @villains = Villain.all
    end

    def show
        @villain = Villain.find(params[:id])
    end
    
    def new
        @villain = Villain.new
    end

    def create
        @villain = Villain.build(villain_params)
        if @villain.save
            flash[:notice] = "Villain was successfully created"
            redirect_to @villain
        else
            render 'new'
        end
    end

    def update
        @villain = Villain.find(params[:id])
        if @villain.update(villain_params)
            flash[:notice] = "Villain name updated successfully"
            redirect_to @villain
        else
            render 'edit'
        end
    end

    def edit
        @villain = Villain.find(params[:id])
    end

    def destroy
        @villain = Villain.find(params[:id])
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
end
