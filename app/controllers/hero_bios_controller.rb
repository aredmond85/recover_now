class HeroBiosController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_admin, only: [:destroy]
    before_action :set_hero_bio, only: [:show, :edit, :update, :destroy]

    def index
        @herobios = HeroBio.all
    end

    def show
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
        if @herobio.update(hero_bios_params)
            flash[:notice] = "Hero Bios name updated successfully"
            redirect_to @herobio
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @herobio.destroy
        redirect_to hero_bios_path
    end

    private

    def set_hero_bio
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

    def require_admin
        if !(user_signed_in? && current_user.admin?)
          flash[:alert] = "Only admins can perform that action"
          redirect_to root_path
        end
    end
end
