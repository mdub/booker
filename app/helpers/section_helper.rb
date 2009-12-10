module SectionHelper

  def current_section_labels
    (params[:labels] || [])#.map(&CGI.method(:unescape))
  end
  
  def subsection_link(link)
    book_section_link(@book, current_section_labels + [link.label])
  end

  def book_section_link(book, section_labels)
    link_to(section_labels.last, book_section_path(book, section_labels))
  end
  
  def book_section_breadcrumb_links
    links = []
    1.upto(current_section_labels.length) do |n|
      labels = current_section_labels[0, n]
      links << link_to_unless_current(labels.last, book_section_path(@book, labels))
    end
    links
  end
  
  def book_section_breadcrumb_trail
    book_section_breadcrumb_links.join(" / ")
  end
  
end
