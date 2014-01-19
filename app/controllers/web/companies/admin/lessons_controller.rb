class Web::Companies::Admin::LessonsController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_lessons

  def index
    #TODO запилить фильтр с start_gt и показывать только будущие
    query = {s: 'start'}.merge(params[:q] || {})
    @q = resource_company.course_lessons.ransack(query)
    @lessons = @q.result(distinct: true).page(params[:page]).decorate
  end
end
