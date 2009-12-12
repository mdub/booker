class BookSectionsController < ApplicationController

  def show
    @book = Book.find_by_title!(params[:title])
    @section_keys = params[:section_keys]
    @section = @book.root
    @section_link_stack = []
    @section_keys.each do |section_key|
      link = @section.links[section_key]
      @section_link_stack << link
      @section = link.to
    end
  end

end