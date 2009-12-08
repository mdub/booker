class ShivaLoader

  def book
    @book ||= Section.create!
  end

  def load(xml)
    doc = Nokogiri::XML.parse(xml)
    doc.xpath("/book-content/content").each do |content_element|
      # p content_element.xpath("sections//title").map(&:text)
      # p content_element.xpath("body").text
    end

  end
  
end
