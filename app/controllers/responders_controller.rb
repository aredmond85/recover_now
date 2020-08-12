class RespondersController < ApplicationController
    def index
        @responders = Responder.all
    end

    def show
        @responder = Responder.find(params[:id])
    end
    
    def new
        @responder = Responder.new
    end

    def create
        @responder = Responder.new(responder_params)
        @responder.save
        redirect_to report_path
    end

    def update
        @responder = Responder.find(params[:id])
        @responder.update(responder_params)
        redirect_to @responder
    end

    def edit
        @responder = Responder.find(params[:id])
    end

    def destroy
        @responder = Responder.find(params[:id])
        @responder.destroy
        redirect_to report_path
    end

    private

    def set_responder
        @responder = Responder.find(params[:id])
    end

        def responder_params
            params.require(:responder).permit(:name, :email, :password)
        end

end
