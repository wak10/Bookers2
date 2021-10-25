class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @user = current_user
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
  def list_params
    params.require(:user).permit(:name,:introduction, :profile_image_id)
  end
end
