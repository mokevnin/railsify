class Web::Companies::Courses::ReviewsController < Web::Companies::Courses::ApplicationController
  def new
    @review = resource_course.reviews.build
    @course = resource_course
  end

  def create
    review = ::Company::CourseReviewType.new(params[:course_review])
    review.course = resource_course
    review.creator = current_user
    if review.save
      f(:success)
    else
      f(:error)
    end
    redirect_to company_course_path(resource_course)
  end

  def index
    @reviews = resource_course.reviews.published
  end
end
