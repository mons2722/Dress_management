class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user && @user.authenticate(params[:user][:password])
      reset_session
      session[:user_id] = @user.id
      redirect_to authenticated_root_path, notice: "Logged in"
    else
      flash.now[:alert] = "Incorrect username or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to login_url
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
