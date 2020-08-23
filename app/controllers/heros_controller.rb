class HerosController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_admin, only: [:destroy]
    before_action :set_hero, only: [:show, :edit, :update, :destroy]

    def index
        @heros = Hero.all
        @heros = Hero.ordered_by_name
    end

    def show
    end
    
    def new
        @hero = Hero.new
    end

    def create
        @hero = Hero.new(hero_params)
        if @hero.save
            flash[:notice] = "Hero was successfully created"
            redirect_to new_hero_bio_path
        else
            render 'new'
        end
    end

    def update
        @hero = Hero.find(params[:id])
        if @hero.update(hero_params)
            flash[:notice] = "Hero name updated successfully"
            redirect_to @hero
        else
            render 'edit'
        end
    end

    def edit
        @hero = Hero.find(params[:id])
    end

    def destroy
        @hero = Hero.find(params[:id])
        @hero.destroy
        redirect_to heros_path
    end

    private

    def set_hero
        @hero = Hero.find(params[:id])
    end

    def hero_params
        params.require(:hero).permit(:hero_name)
    end

    def require_login
        unless user_signed_in?
            flash[:error] = "You must be logged in to access this section"
            redirect_to root_path
        end
    end

    def require_admin
        if !(user_signed_in? && current_user.admin?)
          flash[:alert] = "Only admins can perform that action"
          redirect_to root_path
        end
    end
end
