class BooksController < ApplicationController

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end
  def show
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def update
  end

  def destroy
    book = Book.find(params[:id])
    if book.user != current_user
      redirect_to books_path, error: "You can destroy only your books!"
    end
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
