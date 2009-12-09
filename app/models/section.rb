class Section

  include MongoMapper::Document

  key :body, String

  many :links, :class_name => 'SectionLink' do
    
    def [](index_or_label)
      case index_or_label
      when Integer
        super(index_or_label)
      when String
        detect { |link| index_or_label === link.label }
      end
    end

  end

  def subsection(name)
    link = links[name]
    link.to if link
  end

  def subsection!(name)
    link = links[name]
    if link.nil?
      link = links.build(:label => name, :to => Section.create)
      self.save!
    end
    link.to 
  end
  
end

class SectionLink

  include MongoMapper::EmbeddedDocument

  key :label, String, :required => true
  key :to_id, ObjectId, :required => true

  belongs_to :to, :class_name => "Section"

end
