class CategoriesController < ApplicationController
    def some_action
        @category = Category.find(params[:id]) # Or assign it in some other way
      end
    def index
        @categories=Category.all
    end

     def show
        @category = Category.find(params[:id])
        @dresses = @category.dresses
      end

      def destroy
        @category = Category.find(params[:id])
        @category.destroy
        flash[:success] = "Successfully deleted"
        redirect_to categories_path
      end
      def new
        @category = Category.new
      end
    
      def create
        @category = Category.new(category_params)
        if @category.save
          flash[:success] = "Category created successfully!"
          redirect_to categories_path
        else
          render 'new'
        end
      end

      private
      def category_params
        params.require(:category).permit(:name, :other_attributes) # Adjust as per your category model attributes
      end
end
