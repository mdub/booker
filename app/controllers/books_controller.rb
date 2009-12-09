class BooksController < ApplicationController

  def index
    @books = Book.all(:order => "title")
  end

end
