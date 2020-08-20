class HerosController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]

    def index
        byebug
        if params[:report_id]
            @report = Report.find_by(id: params[:report_id])
            if @report.nil?
                redirect_to reports_path, alert: "Report not found"
            else
                @heros = @reports.heros
            end
        else
            @heros = Hero.all
        end
    end

    def show
        if params[:report_id]
            @report = Report.find_by(id: params[:report_id])
            @hero = @report.heros.find_by(id: params[:id])
                if @hero.nil?
                    flash[:notice] = "Hero not found"
                    redirect_to report_hero_path(@report)
                end
        else
            @hero = Hero.find(params[:id])
        end
    end
    
    def new
        @hero = Hero.new
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
end
