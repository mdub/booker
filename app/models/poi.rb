class Poi

  include MongoMapper::Document

  belongs_to :section

  key :name, String
  
end

