class CategoriesController < ApplicationController
    
    def index
        @categories=Category.all
    end

    def show
      @category = Category.find(params[:id])
      @dresses = @category.dresses.paginate(page: params[:page], per_page: 10)
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
        existing_category = Category.where('lower(name) = ?', category_params[:name].downcase).first
      
        if existing_category
          flash[:error] = "Failed to create the category. The category already exists."
          redirect_to categories_path
        else
          @category = Category.new(category_params)
      
          if @category.save
            flash[:success] = "Category created successfully!"
            redirect_to categories_path
          else
            render 'new'
          end
        end
      end

      private
      def category_params
        params.require(:category).permit(:name, :other_attributes) # Adjust as per your category model attributes
      end
end
