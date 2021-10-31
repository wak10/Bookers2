class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new


  end

  def show
		@book = Book.new
    @user = User.find(params[:id])
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
    # 他人のユーザ情報編集画面に遷移できないように
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end

  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]= "You have updated use successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
  end
end
