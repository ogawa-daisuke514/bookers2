class BooksController < ApplicationController

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Your book is successfully created."
    else
      @books = Book.all
      render :index
    end
  end
  def show
    @book = Book.new
    @showing_book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to book_path(@book), alert: "You cannot edit other's book!"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert: "You cannot edit other's book!"
    elsif @book.update(book_params)
      redirect_to book_path(@book), notice: "Your book is successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.user != current_user
      redirect_to books_path, error: "You cannot edit other's book!"
    end
    book.destroy
    redirect_to books_path, notice: "Your book is successfully destroyed."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
