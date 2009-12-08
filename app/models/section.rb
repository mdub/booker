class Section

  include MongoMapper::Document

  key :body, String

  many :outbound_links, :class_name => 'SectionLink', :foreign_key => :from_id
  many :inbound_links, :class_name => 'SectionLink', :foreign_key => :to_id

  alias :links :outbound_links
  
end
