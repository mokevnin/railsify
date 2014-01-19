class Web::Companies::WelcomeController < Web::Companies::ApplicationController
  def index
    @nearest_courses = resource_company.courses.web.nearest.limit(5).decorate
    @finished_courses = resource_company.courses.web.course_finished.decorate
    @news = resource_company.news.web.limit(3).decorate
  end
end
