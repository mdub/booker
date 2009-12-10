class BookSectionsController < ApplicationController

  def show
    @book = Book.find_by_title!(params[:title])
    @section_path = params[:labels]
    @section = @section_path.inject(@book.root) do |section, label|
      section.subsection(label)
    end
  end

end