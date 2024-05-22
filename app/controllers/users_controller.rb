class UsersController < ApplicationController
  def index
    @booknew = Book.new
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
