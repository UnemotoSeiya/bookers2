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
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.errors
    redirect_to user_path(user.id)  
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
