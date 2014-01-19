class Web::Companies::Admin::Lessons::ApplicationController < Web::Companies::Admin::ApplicationController
  helper_method :resource_lesson

  def resource_lesson
    @lesson ||= resource_company.lessons.find(params[:lesson_id]).decorate
  end
end
