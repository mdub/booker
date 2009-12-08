class SectionLink

  include MongoMapper::Document

  key :from_id, ObjectId, :required => true
  key :label, String, :required => true
  key :to_id, ObjectId, :required => true

  belongs_to :from, :class_name => "Section"
  belongs_to :to, :class_name => "Section"

end
