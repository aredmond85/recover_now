class ReportsController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_report, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        @reports = Report.all
        @reports = Report.search(params[:search])
    end
    
    def show
    end
    
    def new
        @report = current_user.reports.new
    end
    
    def create
        @report = current_user.reports.build(report_params)
        if @report.save
            flash[:notice] = "Report was created successfully."
            redirect_to @report
        else
            render 'new'
        end
    end
    
    def update
        if @report.update(report_params)
            flash[:notice] = "Report updated successfully"
            redirect_to @report
        else
            render 'edit'
        end
    end
    
    def edit
    end
    
    def destroy
        @report.destroy
        redirect_to reports_path
    end
    
    private
    
    def set_report
        @report = Report.find(params[:id])
    end
    
    def report_params
        params.require(:report).permit(:subject, :description, :hero_ids, :villain_ids, :search)
    end

    def require_login
        unless user_signed_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path
        end
    end

    def require_same_user
        if current_user != @report.user && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own article"
          redirect_to @report
        end
    end
end
