class Web::Companies::TeachersController < Web::Companies::ApplicationController
  before_action do
    title :teachers
  end

  def index
    @teachers = resource_company.teachers.web.page(params[:page])
  end

  def show
    @teacher = resource_company.teachers.confirmed.find(params[:id]).decorate

    add_breadcrumb @teacher, company_teacher_path(@teacher)
    title @teacher
  end
end
