class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.search(params[:search], params[:filter]).order sort_column
    @books = @books.paginate page: params[:page], per_page: 10
  end

  def show
    @book = Book.find params[:id]
  end

  private
  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end  
end