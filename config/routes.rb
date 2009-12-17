ActionController::Routing::Routes.draw do |map|

  map.redirect "", :controller => "books"

  map.books 'books', :controller => "books"
  map.book 'books/:title', :controller => "books", :action => "show"

  map.with_options(:controller => "book_sections") do |section|
    section.edit_book_section   'books/:title/*section_keys/edit', :conditions => { :method => :get }, :action => "edit"
    section.update_book_section 'books/:title/*section_keys/edit', :conditions => { :method => :put }, :action => "update"
    section.book_section        'books/:title/*section_keys/show', :action => "show"
  end

end
