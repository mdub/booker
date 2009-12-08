class ShivaLoader

  def book
    @book ||= Section.create!
  end

  def load(xml)
    doc = Nokogiri::XML.parse(xml)
    doc.xpath("/book-content/content").each do |content_element|
      section_path = content_element.xpath("sections//title").map(&:text)
      section = find_or_create_section(section_path)
      section.body = content_element.xpath("body").text
      section.save!
    end
  end

  private

  def find_or_create_section(names)
    names.inject(book) do |section, name|
      section.subsection!(name)
    end
  end

end
