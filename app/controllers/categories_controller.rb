class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.save
        redirect_to report_path
    end

    def update
        @category = Category.find(params[:id])
        @category.update(category_params)
        redirect_to @category
    end

    def edit
        @category = Category.find(params[:id])
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to report_path
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

        def category_params
            params.require(:category).permit(:name)
        end

end
