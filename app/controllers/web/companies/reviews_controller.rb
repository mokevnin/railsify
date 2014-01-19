class Web::Companies::ReviewsController < Web::Companies::ApplicationController
  def index
    @reviews = resource_company.course_reviews.published.order(created_at: :desc)
  end
end
