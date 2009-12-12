class BookSectionsController < ApplicationController

  def show
    @book = Book.find_by_title!(params[:title])
    @section_keys = params[:section_keys]
    @section = @section_keys.inject(@book.root) do |section, label|
      section.subsection(label)
    end
  end

end