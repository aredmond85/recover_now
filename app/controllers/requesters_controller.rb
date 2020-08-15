class RequestersController < ApplicationController
    def index
        @requesters = Requester.all
    end

    def show
        @requester = Requester.find(params[:id])
    end
    
    def new
        @requester = Requester.new
    end

    def create
        @requester = Requester.new(requester_params)
        @requester.save
        redirect_to @requester
    end

    def update
        @requester = Requester.find(params[:id])
        @requester.update(requester_params)
        redirect_to @requester
    end

    def edit
        @requester = Requester.find(params[:id])
    end

    def destroy
        @requester = Requester.find(params[:id])
        @requester.destroy
        redirect_to requesters_path
    end

    private

    def set_Requester
        @requester = Requester.find(params[:id])
    end

        def requester_params
            params.require(:requester).permit(:username, :email, :password_digest)
        end

end
