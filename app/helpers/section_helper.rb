module SectionHelper

  def current_section_keys
    (params[:section_keys] || [])
  end
  
  def subsection_link(link)
    book_section_link(@book, current_section_keys + [link.label])
  end

  def book_section_path(book, section_keys)
    segments = [book_path(book)] + section_keys.map do |label|
      URI.escape(label, /\W/)
    end
    segments.join("/")
  end
  
  def book_section_link(book, section_keys)
    link_to(section_keys.last, book_section_path(book, section_keys))
  end
  
  def book_section_breadcrumb_links
    links = []
    1.upto(current_section_keys.length) do |n|
      labels = current_section_keys[0, n]
      links << link_to_unless_current(labels.last, book_section_path(@book, labels))
    end
    links
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
