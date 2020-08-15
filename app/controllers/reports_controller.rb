class ReportsController < ApplicationController
    before_action :authenticate_requester!, except: [:index, :show]
    
    def index
        @reports = Report.all
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def new
        @report = current_requester.reports.new
    end
    
    def create
        @report = current_requester.reports.new(report_params)
        if @report.save
            flash[:notice] = "Report was created successfully."
            redirect_to @report
        else
            render 'new'
        end
    end
    
    def update
        @report = Report.find(params[:id])
        @report.update(report_params)
        redirect_to @report
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
            params.require(:report).permit(:subject, :description, hero_ids: [], hero_ids: [], villain_ids: [])
        end
end
