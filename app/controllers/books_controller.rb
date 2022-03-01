class BooksController < ApplicationController

  def create
    @book = current_user.books.new(book_params)
    @book.save
    @books = Book.all
    render "index"
  end
  def show
  end

  def index
    @books = Book.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
