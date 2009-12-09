class ShivaLoader

  def book
    @book ||= Book.create!
  end

  def title=(title)
    if @book
      unless @book.title == title
        raise "Can't load content for #{title.inspect} into #{@book.title.inspect}"
      end
    else
      @book = Book.find_or_create_by_title(title)
    end
  end
  
  def load(xml)
    doc = Nokogiri::XML.parse(xml)
    self.title = doc.xpath("/book-content/book/title").first.text
    doc.xpath("/book-content/content").each do |content_element|
      section_path = content_element.xpath("sections//title").map(&:text)
      section = find_or_create_section(section_path)
      section.body = content_element.xpath("body").inner_html
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
