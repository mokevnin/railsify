class Web::CoursesController < Web::ApplicationController
  authorize_actions_for Course

  def index
    #FIXME nearest courses by ransack
    query = params[:q] || {}
    @search = Course.web.nearest.ransack(query)
    @courses = @search.result.page(params[:page]).decorate

    title :courses
  end
end
