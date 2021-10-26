class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # @book = Book.
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image_id)
  end
end
