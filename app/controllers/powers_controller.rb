class PowersController < ApplicationController
    def index
        @powers = Power.all
    end

    def show
        @power = Power.find(params[:id])
    end
    
    def new
        @power = Power.new
    end

    def create
        @power = Power.new(power_params)
        @power.save
        redirect_to power_path
    end

    def update
        @power = Power.find(params[:id])
        @power.update(power_params)
        redirect_to @power
    end

    def edit
        @power = Power.find(params[:id])
    end

    def destroy
        @power = Power.find(params[:id])
        @power.destroy
        redirect_to power_path
    end

    private

    def set_power
        @power = Power.find(params[:id])
    end

        def power_params
            params.require(:power).permit(:power_type)
        end
end

