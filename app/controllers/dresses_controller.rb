class DressesController < ApplicationController
  before_action :set_dress, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  def index
    if params[:search].present?
      @dresses = Dress.where("name LIKE ?", "%#{params[:search]}%")
    else
      @dresses = Dress.all.order(:name) # Fetch dresses sorted by name
      
      # Apply filters if present
      @dresses = @dresses.where(color: params[:color]) if params[:color].present?
      @dresses = @dresses.where(category_id: params[:category_id]) if params[:category_id].present?
      @dresses = @dresses.joins(:sizes).where(sizes: { id: params[:size_id] }) if params[:size_id].present?
  
      # Paginate dresses
      @dresses = @dresses.paginate(page: params[:page], per_page: 10)
    end
  
    # Respond to HTML and JSON formats
    respond_to do |format|
      format.html
      format.json { render json: @dresses }
    end
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
        # Extract valid size IDs from size_ids array
        size_ids = dress_params[:size_ids].reject { |id| id.blank? || id == "0" || !Size.exists?(id.to_i) }

        # Create a new dress with extracted size_ids
        @dress = Dress.new(dress_params.except(:size_ids))

        if @dress.save
                if params[:dress][:image].present?
                @dress.image.attach(params[:dress][:image])
              end
              @dress.size_ids = size_ids
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
      
      def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this page."
          redirect_to login_path
        end
      end
       
      def dress_params
        params.require(:dress).permit(:name, :color, :price, :material, :stock, :category_id, :image, :size_ids => [])
      end
end
