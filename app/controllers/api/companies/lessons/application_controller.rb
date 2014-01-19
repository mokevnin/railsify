class Api::Companies::Lessons::ApplicationController < Api::Companies::ApplicationController
  def resource_lesson
    @lesson = resource_company.lessons.find(params[:lesson_id])
  end
end
