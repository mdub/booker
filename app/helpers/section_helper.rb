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
    out.html_safe!
  end

  def book_section_subsection_links(book, section_link_stack, recursive = false)
    section = section_link_stack.empty? ? book.root : section_link_stack.last.to
    return "" if section.links.empty?
    html = "<ul>\n"
    section.links.each do |link|
      html += "<li>" + book_section_link(book, section_link_stack + [link]) + "</li>"
      if recursive
        html += book_section_subsection_links(book, section_link_stack + [link])
      end
    end
    html += "</ul>\n"
    html.html_safe!
  end

end
