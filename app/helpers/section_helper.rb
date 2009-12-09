module SectionHelper
  
  def subsection_link(link)
    base_path = request.request_uri.split("?").first
    subsection_path = [base_path, CGI.escape(link.label)].join("/")
    link_to(link.label, subsection_path)
  end
  
end
