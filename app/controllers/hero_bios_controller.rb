class HeroBiosController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @herobios = HeroBio.all
    end

    def show
        if @herobio.nil?
            redirect_to new_hero_bio_path, alert: "Hero Bio not found"
        else
            @herobio = HeroBio.find(params[:id])
        end
    end

    def new
        @herobio = HeroBio.new
    end

    def create
        @herobio = HeroBio.new(hero_bios_params)
        if @herobio.save
            flash[:notice] = "Hero Bios was successfully created"
            redirect_to @herobio
        else
            render 'new'
        end
    end

    def update
        @herobio = HeroBio.find(params[:id])
        if @herobio.update(hero_bios_params)
            flash[:notice] = "Hero Bios updated successfully"
            redirect_to @herobio
        else
            render 'edit'
        end
    end

    def edit
        @herobio = HeroBio.find(params[:id])
    end

    def destroy
        @herobio = HeroBio.find(params[:id])
        @herobio.destroy
        redirect_to hero_bios_path
    end

    private

    def set_villain
        @herobio = HeroBio.find(params[:id])
    end

    def hero_bios_params
        params.require(:hero_bio).permit(:hero_summary, :hero_powers, :hero_id)
    end

    def require_login
        unless user_signed_in?
            flash[:error] = "You must be logged in to access this section"
            redirect_to root_path # halts request cycle
        end
    end
end
