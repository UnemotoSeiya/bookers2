class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_id_path
  end

  def index
    @booknew = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = User.find(@book.user_id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
