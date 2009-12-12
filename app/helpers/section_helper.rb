module SectionHelper

  def section_link_stack
    @section_link_stack || []
  end
  
  def subsection_link(link)
    book_section_link(@book, section_link_stack + [link])
  end
  
  def book_section_link(book, section_keys)
    link_to(section_keys.last.label, book_section_path(book, section_keys))
  end
  
  def book_section_breadcrumb_links
    breadcrumb_links = []
    1.upto(section_link_stack.length) do |n|
      section_links = section_link_stack[0, n]
      breadcrumb_links << link_to_unless_current(section_links.last.label, book_section_path(@book, section_links))
    end
    breadcrumb_links
  end
  
  def book_section_breadcrumb_trail
    book_section_breadcrumb_links
  end

  def book_section_headings
    out = ""
    book_section_breadcrumb_links.each_with_index do |link, i|
      out << content_tag("h#{i+2}", link) << "\n"
    end
    out
  end
  
end
