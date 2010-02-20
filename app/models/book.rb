require "active_support/core_ext/module"

class Book

  include MongoMapper::Document

  key :root_id, ObjectId
  key :title, String
  
  belongs_to :root, :class_name => "Section"

  def initialize(*args)
    self.root = Section.new
    super
  end

  delegate :links, :subsection, :subsection!, :to => :root
  
  def to_param
    title
  end
  
end

