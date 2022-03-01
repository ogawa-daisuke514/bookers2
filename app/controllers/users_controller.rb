class UsersController < ApplicationController
  def index
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

end
