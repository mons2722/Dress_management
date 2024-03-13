class DressesController < ApplicationController
  before_action :set_dress, only: [:show, :edit, :update, :destroy]
    def index
        @dresses = Dress.all
      end
      def new
        @dress = Dress.new
      end
    
      def edit 
        @dress = Dress.find(params[:id])
      end
      def create
        @dress = Dress.new(dress_params)
        if @dress.save
          flash[:success] = "Successfully Created"
          redirect_to dresses_path
        else
          render :new
        end
      end
       
      def update
        if @dress.update(dress_params)
          flash[:success] = "Successfully updated"
          redirect_to @dress 
        else
          render :edit
        end
      end
    
      def destroy
        @dress = Dress.find(params[:id])
        @dress.destroy
        flash[:success] = "Successfully deleted"
        redirect_to dresses_path
      end
      private
      def set_dress
        @dress = Dress.find(params[:id])
      end

      def dress_params
        params.require(:dress).permit(:name, :size, :color, :price, :material, :stock, :category_id)
      end
end
