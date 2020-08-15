class AssigneesController < ApplicationController
    def index
        @assignees = Assignee.all
    end

    def show
        @assignee = Assignee.find(params[:id])
    end
    
    def new
        @assignee = Assignee.new
    end

    def create
        @assignee = Assignee.new(assignee_params)
        @assignee.save
        redirect_to @assignee
    end

    def update
        @assignee = Assignee.find(params[:id])
        @assignee.update(assignee_params)
        redirect_to @assignee
    end

    def edit
        @assignee = Assignee.find(params[:id])
    end

    def destroy
        @assignee = Assignee.find(params[:id])
        @assignee.destroy
        redirect_to assignees_path
    end

    private

    def set_assignee
        @assignee = Assignee.find(params[:id])
    end

        def assignee_params
            params.require(:assignee).permit(:username, :email, :password_digest)
        end
end
