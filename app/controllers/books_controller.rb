class BooksController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end
end
