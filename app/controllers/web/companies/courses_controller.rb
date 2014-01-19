class Web::Companies::CoursesController < Web::Companies::ApplicationController
  before_action do
    title :courses
  end

  def nearest
    @courses = resource_company.courses.web.nearest.decorate
  end

  def finished
    @courses = resource_company.courses.web.course_finished.decorate
  end

  def show
    course = resource_company.courses.published.find(params[:id])
    if signed_in?
      @course_member = course.members.find_by user: current_user
    end
    @reviews = course.reviews.published
    @course = course.decorate

    add_breadcrumb @course, company_course_path(@course)
    title @course
  end
end
