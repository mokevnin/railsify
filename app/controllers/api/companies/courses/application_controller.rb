class Api::Companies::Courses::ApplicationController < Api::Companies::ApplicationController
  def resource_course
    @course = resource_company.courses.find(params[:course_id])
  end
end
