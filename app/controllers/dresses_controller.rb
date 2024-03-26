class DressesController < ApplicationController
  before_action :set_dress, only: [:show, :edit, :update, :destroy]
    def index
      @dresses = Dress.paginate(page: params[:page], per_page: 10)
      end
      def new
        @dress = Dress.new
      end
    
      def show
        @dress = Dress.find(params[:id])
      end

      def edit 
      end
      
      def create
        existing_dress = Dress.where('lower(name) = ?', dress_params[:name].downcase).first
      
        if existing_dress
          flash[:error] = "Failed to create the dress. The dress already exists."
          redirect_to dresses_path
        else
          @dress = Dress.new(dress_params)
         
          if @dress.save
              if params[:dress][:image].present?
                @dress.image.attach(params[:dress][:image])
              end
            flash[:success] = "Successfully Created"
            redirect_to dresses_path
          else
            flash[:error] = "Failed to create the dress."
            render :new
          end
        end
      end
       
      def update
        if @dress.update(dress_params)
          flash[:success] = "Successfully updated"
          redirect_to dresses_path
        else
          flash[:error] = "Failed to Update"
          render :edit
        end
      end
    
      def destroy
        if @dress.destroy
        flash[:success] = "Successfully deleted"
        redirect_to dresses_path
       else   
          flash[:error] = "Failed to delete"
       end
      end

      private
      def set_dress
        @dress = Dress.find(params[:id])
      end

      def dress_params
        params.require(:dress).permit(:name, :size, :color, :price, :material, :stock, :category_id, :image)
      end
end
