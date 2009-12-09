module SectionHelper
  
  def subsection_link(link)
    base_path = request.request_uri.split("?").first
    subsection_path = [base_path, CGI.escape(link.label)].join("/")
    link_to(link.label, subsection_path)
  end
  
  def book_section_breadcrumb_links
    section_labels = params[:labels].map(&CGI.method(:unescape))
    links = []
    1.upto(section_labels.length) do |n|
      labels = section_labels[0, n]
      escaped_labels = labels.map(&CGI.method(:escape))
      links << link_to_unless_current(labels.last, book_section_path(@book, escaped_labels))
    end
    links
  end
  
  def book_section_breadcrumb_trail
    book_section_breadcrumb_links.join(" / ")
  end
  
end
