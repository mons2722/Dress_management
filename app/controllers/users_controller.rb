class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: "Account created successfully. Please log in."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end 

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to authenticated_root_url, notice: "Profile updated successfully."
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
