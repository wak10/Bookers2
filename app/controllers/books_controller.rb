class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice]= "You have created book successfully."
      redirect_to @new_book
    else
    @book = Book.all
    @user = current_user
      render :index
    end
  end

  def index
    @book = Book.all
    @user = current_user
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice]= "You have update book successfully."
    redirect_to  book_path(@book.id)
    else
    @books = Book.all
    render "edit"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
