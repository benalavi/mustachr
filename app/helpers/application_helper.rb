# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Uses the given url as the title of the link and links to it (so you don't
  # have to repeat the URL in your view)
  def link_to_url(url)
    link_to url, url
  end
end
