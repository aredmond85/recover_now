class HerosController < ApplicationController
    def index
        @heros = Hero.all
    end

    def show
        @hero = Hero.find(params[:id])
    end
    
    def new
        @hero = Hero.new
    end

    def create
        @hero = Hero.new(hero_params)
        @hero.save
        redirect_to heros_path
    end

    def update
        @hero = Hero.find(params[:id])
        @hero.update(hero_params)
        redirect_to @hero
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
end
