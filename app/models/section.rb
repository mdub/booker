class Section

  include MongoMapper::Document

  key :body, String

  many :outbound_links, :class_name => 'SectionLink', :foreign_key => :src_id
  many :inbound_links, :class_name => 'SectionLink', :foreign_key => :dest_id

end
