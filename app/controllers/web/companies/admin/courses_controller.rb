class Web::Companies::Admin::CoursesController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_courses

  def show
    @course = resource_company.courses.find(params[:id]).decorate
    add_breadcrumb @course, company_admin_course_path(@course)
  end

  def index
    query = {'s' => 'created_at desc', "course_state_eq" => 'not_finished' }.merge(params[:q] || {})
    @q = resource_company.courses.ransack(query)
    @courses = @q.result(distinct: true).page(params[:page]).decorate
  end
end
