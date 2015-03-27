class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.search params[:search], params[:filter], current_user
    @books = @books.paginate page: params[:page], per_page: 10
  end

  def show
    @book = Book.find params[:id]
  end
end