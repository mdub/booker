class SectionLink

  include MongoMapper::EmbeddedDocument

  key :src_id, ObjectId, :required => true
  key :label, String, :required => true
  key :dest_id, ObjectId, :required => true

  belongs_to :src, :class_name => "Section"
  belongs_to :dest, :class_name => "Section"

end
