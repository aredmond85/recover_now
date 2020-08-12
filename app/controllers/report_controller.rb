class ReportController < ApplicationController
    def index
        @report = Report.all
    end

    def show
        @report = Report.find(params[:id])
    end
    
    def new
        @report = Report.new
    end

    def create
        @report = Report.new(report_params)
        @report.save
        redirect_to report_path
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
        redirect_to report_path
    end

    private

    def set_report
        @report = Report.find(params[:id])
    end

        def report_params
            params.require(:user).permit(:subject, :description, :damage_type, :hero, :villain, :casualties)
        end

end
