ActionController::Routing::Routes.draw do |map|

  map.redirect "", :controller => "books"

  map.books 'books', :controller => "books"
  map.book 'books/:title', :controller => "books", :action => "show"

  map.with_options(:controller => "book_sections", :path_prefix => "books/:title/*section_keys") do |section|
    section.edit_book_section   '~edit', :conditions => { :method => :get },  :action => "edit"
    section.update_book_section '~edit', :conditions => { :method => :put },  :action => "update"
    section.book_section_toc    '~toc',  :conditions => { :method => :get },  :action => "toc"
    section.book_section        '',      :conditions => { :method => :get },  :action => "show"
  end

end
