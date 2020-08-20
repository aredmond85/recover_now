class VillainBiosController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @villainbios = VillainBio.all
    end

    def show
        @villainbio = VillainBio.find(params[:id])
    end

    def new
        @villainbio = VillainBio.new
    end

    def create
        @villainbio = VillainBio.new(villain_bios_params)
        if @villainbio.save
            flash[:notice] = "Villain Bios was successfully created"
            redirect_to @villainbio
        else
            render 'new'
        end
    end

    def update
        @villainbio = VillainBio.find(params[:id])
        if @villainbio.update(villain_bios_params)
            flash[:notice] = "Villain Bios name updated successfully"
            redirect_to @villainbio
        else
            render 'edit'
        end
    end

    def edit
        @villainbio = VillainBio.find(params[:id])
    end

    def destroy
        @villainbio = VillainBio.find(params[:id])
        @villainbio.destroy
        redirect_to villain_bios_path
    end

    private

    def set_villain
        @villainbio = VillainBio.find(params[:id])
    end

    def villain_bios_params
        params.require(:villain_bio).permit(:villain_summary, :villain_powers, :villain_id)
    end

    def require_login
        unless user_signed_in?
            flash[:error] = "You must be logged in to access this section"
            redirect_to root_path # halts request cycle
        end
    end
end
