class SectionsController < ApplicationController

  before_filter :find_book_and_sections
  layout "section"
  
  def show
  end
  
  def edit
  end

  def toc
  end
  
  def update
    @section.body = params[:section][:body]
    @section.save!
    redirect_to :action => "show"
  end
  
  private
  
  def find_book_and_sections
    @book = Book.find_by_title!(params[:title])
    @section_keys = params[:section_keys]
    @section = @book.root
    @section_link_stack = []
    @section_keys.each do |section_key|
      link = @section.links[section_key]
      raise "can't resolve #{section_key.inspect}" unless link
      @section_link_stack << link
      @section = link.to
    end
  end
  
end