class VillainsController < ApplicationController
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
       @villain = Villain.new(villain_params)
       @villain.save
        redirect_to villains_path
    end

    def update
       @villain = Villain.find(params[:id])
       @villain.update(villain_params)
        redirect_to @villain
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
end
