class Book

  include MongoMapper::Document

  key :root_id, ObjectId
  key :title, String
  
  belongs_to :root, :class_name => "Section"

  def initialize(*args)
    self.root = Section.new
    super
  end
  
  def links
    root.links
  end
  
end

