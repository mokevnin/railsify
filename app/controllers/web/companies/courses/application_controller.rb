class Web::Companies::Courses::ApplicationController < Web::Companies::ApplicationController
  helper_method :resource_course

  private

  def resource_course
    resource_company.courses.web.find(params[:course_id])
  end
end
