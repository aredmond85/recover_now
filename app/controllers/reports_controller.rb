class ReportsController < ApplicationController
    def index
        @reports = Report.all
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def new
        @report = Report.new
    end
    
    def create
        @report = Report.new(report_params)
        @report.requester = Requester.first
        @report.assignee = Assignee.first
        if @report.save
            flash[:notice] = "Report was created successfully."
            redirect_to reports_path
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
            params.require(:report).permit(
                :subject, 
                :description, 
                hero_ids: [],
                villain_ids: [],
                power_ids: []
            )
        end
end
