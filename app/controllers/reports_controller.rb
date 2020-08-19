class ReportsController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @reports = Report.all
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def new
        @report = current_user.reports.new
    end
    
    def create
        @report = current_user.reports.new(report_params)
        if @report.save
            flash[:notice] = "Report was created successfully."
            redirect_to @report
        else
            render 'new'
        end
    end
    
    def update
        @report = Report.find(params[:id])
        if @report.update(report_params)
            flash[:notice] = "Report updated successfully"
            redirect_to @report
        else
            render 'edit'
        end
    end
    
    def edit
        @report = Report.find(params[:id])
    end
    
    def destroy
        @report = Report.find(params[:id])
        @report.destroy
        redirect_to reports_path
    end
    
    private
    
    def set_report
        @report = Report.find(params[:id])
    end
    
    def report_params
        #byebug
        params.require(:report).permit(:subject, :description, :hero_ids)
    end

    def require_login
        unless user_signed_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path
        end
    end
end
