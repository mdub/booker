ActionController::Routing::Routes.draw do |map|

  map.redirect "", :controller => "books"

  map.books 'books', :controller => "books"

  map.with_options(:controller => "sections", :path_prefix => "books/:title/*section_keys") do |section|
    section.edit_section   '~edit', :conditions => { :method => :get },  :action => "edit"
    section.update_section '~edit', :conditions => { :method => :put },  :action => "update"
    section.section_toc    '~toc',  :conditions => { :method => :get },  :action => "toc"
    section.section        '',      :conditions => { :method => :get },  :action => "show"
  end

end
