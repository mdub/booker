class ShivaLoader

  def book
    @book ||= Book.create!
  end

  def load(xml)
    doc = Nokogiri::XML.parse(xml)
    book.title ||= doc.xpath("/book-content/book/title").first.text
    doc.xpath("/book-content/content").each do |content_element|
      section_path = content_element.xpath("sections//title").map(&:text)
      section = find_or_create_section(section_path)
      section.body = content_element.xpath("body").text
      section.save!
    end
    book.save!
  end

  def find_or_create_section(names)
    names.inject(book.root) do |section, name|
      section.subsection!(name)
    end
  end

end
