class ApplicationPage < SitePrism::Page
  class << self
    def url_helpers
      Rails.application.routes.url_helpers
    end

    def visit(attrs = {})
      p = new
      p.load(attrs)
      p
    end
  end
end
