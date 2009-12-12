class Section

  include MongoMapper::Document

  key :body, String

  many :links, :class_name => 'SectionLink' do
    
    def [](index_or_label)
      case index_or_label
      when Integer
        super(index_or_label)
      when String
        detect do |link|
          index_or_label === link.label || index_or_label === link.to_param
        end
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
  
  def body_html
    html = body.nil? ? "" : body.dup
    html.gsub!("<poi>", "<span class='poi'>")
    html.gsub!("</poi>", "</span>")
    html.gsub!("www.", "http://www.")
    html.gsub!("http://http://", "http://")
    html.gsub!(%r{\bhttp://[\w_\-./;?]+\w}) { |url|
      %{<a class="external" href="#{url}">#{url}</a>}
    }
    html.gsub!(/\b\w+@\w+(\.\w+)+\b/) { |email_address|
      %{<a href="mailto:#{email_address}">#{email_address}</a>}
    }
    html
  end

end

class SectionLink

  include MongoMapper::EmbeddedDocument

  key :label, String, :required => true
  key :to_id, ObjectId, :required => true

  belongs_to :to, :class_name => "Section"
  
  def to_param
    label.gsub("&", "and").scan(/\w+/).join("_")
  end

end
