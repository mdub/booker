class BooksController < ApplicationController

  def index
    @books = Book.all(:order => "title")
  end

  def show
    @book = Book.find_by_title!(params[:title])
  end
  
end
