class DressesController < ApplicationController
  before_action :set_dress, only: [:show, :edit, :update, :destroy]
    def index
        @dresses = Dress.all
      end
      def new
        @dress = Dress.new
      end
    
      def edit 
      end
      def create
        @dress = Dress.new(dress_params)
        if @dress.save
          redirect_to dresses_path, notice: 'Dress was successfully created.'
        else
          render :new
        end
      end
       
      def update
        if @dress.update(dress_params)
          redirect_to @dress, notice: 'Dress was successfully updated.'
        else
          render :edit
        end
      end
    
      def destroy
        @dress = Dress.find(params[:id])
        @dress.destroy
        redirect_to dresses_path, notice: 'Dress was successfully deleted.'
      end

      private
      def set_dress
        @dress = Dress.find(params[:id])
      end

      def dress_params
        params.require(:dress).permit(:name, :size, :color, :price, :material, :stock, :category_id)
      end
end
