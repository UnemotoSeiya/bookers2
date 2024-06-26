class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @booknew = Book.new(book_params)
      @books = Book.all
      render :index
    end
  end

  def index
    @booknew = Book.new
    @book = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = User.find(@book.user_id)
  end
  
  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    user = book.user
    unless user == current_user
      redirect_to books_path
    end
  end
end
