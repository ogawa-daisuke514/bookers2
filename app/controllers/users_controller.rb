class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user), alert: "You cannot edit other profile!"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user), alert: "You cannot edit other profile!"
    elsif @user.update(user_params)
      redirect_to user_path(@user), notice: "your profile is successfully updated."
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(user), alert: "You cannot delete other account!"
    end
    user.destroy
    redirect_to root_path, notice: "Your account is successfully deleted. Goodbye!"
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
